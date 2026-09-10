Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A161737A85E;
	Thu, 10 Sep 2026 03:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011588; cv=none; b=kaL7mAO/86mFFmKAnniJcn4vIvGqOwHx9HqdWaEPYogFd2veGi3cRE2SHJ3uG2VQzA2Hz1cVLz6syFMWoeVe4p3YYlSmfQ+zu/SbFzmqcjgSa8RAZu3+UBW52QDXMZMKXaaCoUcJW5ItVRIHF/lTG3VmQ/uRYbAlL47/2xR8hXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011588; c=relaxed/simple;
	bh=8fCIF6adVs5KiYe94ZL/UwihnrUJkpLvd67Jl3Tio6A=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ujTjrXK558/OvlHyK0YY9qQ68LLm0gHfZh52Vu6SwcDmyzCzOZ8pSapLNOZSoRhtrA/oEgF5+sfVH6P8wYk2tlgHOHHPNFpXYSoxhrcXF+BsxCishUJOjczNQ3SPmV1bD99jBNg+NK2gKdn61Y/L+B4tzUHEb05ON9VaS68Yiyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Z0DRuNQ9; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Z0DRuNQ9"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789011582; h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
	bh=IXL95Xrau8/mHF925oI3iaXMYtvfHatKbhqG289Dw2c=;
	b=Z0DRuNQ9tco4sn77SzRDp6mNnBjYm0KDsLk/oy5GLY0CvLPkxnMW29ZT9RjZ+wnmUDh8KVeSHUB16+XICoOPC47nBG8liNZfpCyGjVskagpDYMi11K0Gg6jUI0GbWAqF5C6LJd0aOCIM6zGG4wxdQWJ5BOR4ONSAlMCp+XdESsg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=chuyf26@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XAgRbOQ_1789011260;
Received: from x31j07255.sqa.na131(mailfrom:Chuyf26@linux.alibaba.com fp:SMTPD_---0XAgRbOQ_1789011260 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 11:34:21 +0800
From: Yifei Chu <Chuyf26@linux.alibaba.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Tony Luck <tony.luck@intel.com>, Avadhut Naik <avadhut.naik@amd.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, linux-edac@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] x86/mce: Zero the injected error record before logging it
Date: Thu, 10 Sep 2026 11:32:17 +0800
Message-ID: <178901113715.2666699.12712427139715728985@linux.alibaba.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

do_inject() declares a struct mce_hw_err on the stack and, for a
software injection, fills in only err.m from i_mce before calling
mce_log(&err). The err.vendor union (synd1/synd2, 16 bytes) is never
initialized, so it holds whatever was left on the kernel stack.

Those bytes are not dropped: the mce_record tracepoint copies
err->vendor verbatim into its v_data dynamic array, so a sw-injected
record publishes 16 bytes of stale stack to anything reading the
tracepoint. rasdaemon decodes v_data as MCA_SYND1/SYND2 supplemental
error info (e.g. FRU text), so sw injection - whose whole purpose is to
exercise the decode path - feeds the decoder nondeterministic garbage
instead of a clean record.

Every other mce_log() caller builds its record through mce_prep_record(),
which memsets the whole struct mce_hw_err first. do_inject() is the only
one that skips it.

Zero-initialize the record so the vendor data of an injected MCE is
always well defined. err.m is still fully overwritten by i_mce
immediately afterwards, so the injected machine check fields are
unchanged.

Reproduced with CONFIG_X86_MCE_INJECT: writing "sw" to flags and
injecting a bank/status makes the mce_record tracepoint print random
vendor data, e.g.

    vendor data: {0xb3,0x8a,0xb5,0x41,0x0,0x0,0x0,0x0,
                  0x67,0x93,0xbc,0xa8,0xff,0xff,0xff,0xff}

Fixes: d4fca1358ea9 ("x86/MCE/AMD: Add support for new MCA_SYND{1,2} register=
s")
Cc: stable@vger.kernel.org
Reported-by: Abaci <abaci@linux.alibaba.com>
Assisted-by: abaci:qwen3.8-max
Signed-off-by: Yifei Chu <Chuyf26@linux.alibaba.com>
---
 arch/x86/kernel/cpu/mce/inject.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mce/inject.c b/arch/x86/kernel/cpu/mce/injec=
t.c
index 6f8a49d..a6d8f8e 100644
--- a/arch/x86/kernel/cpu/mce/inject.c
+++ b/arch/x86/kernel/cpu/mce/inject.c
@@ -504,7 +504,7 @@ static void prepare_msrs(void *info)
 static void do_inject(void)
 {
 	unsigned int cpu =3D i_mce.extcpu;
-	struct mce_hw_err err;
+	struct mce_hw_err err =3D {};
 	u64 mcg_status =3D 0;
 	u8 b =3D i_mce.bank;
=20
--=20
2.43.5
