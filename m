Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793786259;
	b=l2EiU6KaIpvjQHZ6GlnGyqda7N8rnS5ukKA6TQ+4k0lceEpeuhn/+qH5Aw30gWV69HCn
	 lGWY//AyDTKDXqXGrDYY7ny/PAlOT5gil1ffk5nOk9kiPYQRz24s6jRpK6wvhccm8byT1
	 HqE7A/vAaB+VQ1YbrdtSDbyH7Vtcx5pHCg8ufDXH3yOW7LKROInlZ867Kve84kYvhvYiM
	 27XK6dWKNd8YWlgdPGFCp2d5AeQ1toOlCdYxZITe9ZxrclN03B8uKT2EMIP+BiGOJLcw2
	 b8f/8VuAkwfNeM5Ck/X2pA2ri4JjJ47MZ2jlPDpSLjateGpMiEyRV9RPaPycuKJ9E3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=JnpMMMR17dXF17Y49yYY6JNWkoAioE74UmJRR17FwN0=;
	b=vYv4ZE9nuro/mwttGPIdf0OW8QAet8sgjS6WnPle8XxABQpMvmo5cjRnw1Xc9ICG2UNr
	 8JKSnb9ATGzA/zNbcTrmZk+1jd42nS5NUKXchjqxOMKwO7Acm1/kxFZipwVbqdQEg/rVv
	 TKnXILQymPAqcz1E2XgIVHW92/qsVhK6ViFgMjNj5uMokSNZmeJiwZxyLTH4PBWI0FiHg
	 FoXRK36FNdfPOH0q58P6aSMxYkS7ooKOKHFc0jBDmqdhcfU4XFDITF2saoCCMG1TgxI/c
	 rJ/IWZbDUE6IJOA4/524WTjEaXQIosF68p4knI8viridWgjk+D9xIPcIrQl4v2YHs/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzzI8Rux;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3EF606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD3EF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzzI8Rux
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed0e2015aaso1617055ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:57:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793786258; cv=none;
        d=google.com; s=arc-20260327;
        b=j31g/GCxgZZ9ks97wn/Oh0dtYHqSjtP4cLif5IYZfgcr7A9qisvzQ7mopQE8u/Zbic
         5gKOgTiZEkEB/0vY2FwzLIRy8oAVzQlHS0Ow6jKZgu7PJsTMhd1oy6Bpc8N2UsoLZycG
         rQrUi5NRb2Le7ZbOyUDDJUrVBrI+1v7m/Ecu38pKpHlmHsNW911gtgAFdx3MjhRYhTAH
         PWx0KwwpBAMmjJ6TlSpGhyVUwZlkTTSyg+5fGzD/GCl+FSLKfdE10uModqz9pA7bE+nv
         ZJFI9DyY9rFOQsq8TPeYw1cUZ6w4rfszoNYWs9+PzbN8z5wkfgzyk84y72600+Rfpkph
         YbPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JnpMMMR17dXF17Y49yYY6JNWkoAioE74UmJRR17FwN0=;
        fh=5wB9xAbJgjS2QvT4L0oRYj2P5mzlwosI/RMmVX0GPx8=;
        b=g4bKcTdaBkbvs+bL3YriOIriHQo4LAGAiNkP0p6pVwaHlVwrNiVcGpVYJkDc9364kC
         Qdhx1BxSKb6zrLQacydPKe8XBZwe6owdU/YoVg++X255/maMh6cR/CSwOmxwNyl5dDw8
         AERafelay/PMGSR5Qu3pfyjIYzIZTpyXqMdqpg20CfoW7pD7LdeLGaxfZlCUnVdTqhjw
         BaU4WrIJ4cV6mx59sm1tyak+MPkET+bi6cHD34UTTTtsY2HFekqCCQF61ZJLjxHgInei
         Hm4LeLxdgHxwODaglHH+5oAZYoqF1oYgbTpw8+zsecg6a93cTQz9sRPSeMHID66tlF07
         Baaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793786258; x=1794391058; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnpMMMR17dXF17Y49yYY6JNWkoAioE74UmJRR17FwN0=;
        b=RzzI8Rux+5eiyEVle3J0Vcpw1x9TVrFf7+ZnRQSLkHnLLMQHYoww8Ck+fyjwBstzkD
         KGkb0Hjs+3UsIn8C/Ub0cx4QtutiYk91q2O5yrRT2HToOuucTGdMldejdQRBF/KYyFot
         bDswNMrWC/WsOXxMLHWubERLELTicEKL+PItPtAlu7gJtAM4YPC0yyLSQ0ZHT61qON9d
         S+Mff/10JWGCtbp+RdHL674LHAokQPoswTCgwnACU2IM3qEHu7EAYw3TachOt5g+L+ym
         FjPVYMdliAIMxpl/8B6q6W98G/N4nvjtn46rNaPIhEVrhzXLg5ggob/1scT+Js141AyX
         kUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786258; x=1794391058;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JnpMMMR17dXF17Y49yYY6JNWkoAioE74UmJRR17FwN0=;
        b=CiHg5nkA6OeUxrMqpJ2dt8WRXU7Z19LFNLjbmuahmR0sLfyAr1xgMbXZ4VrmqhD0EK
         mvNEo8Plfoel3IZBzAFftFjI3GmX7ege463z1V3vhRFs0FcZrDT1zflPnBhp1cY5cE4w
         5vYqVY3uG6lulQCIftqNIz94khuX+7oG6VfPNpH3aJd86ohmdTgfKLuWLmi5b55EzFS4
         WGKIqAVTZ/ZHZJr2+mCaY88Bd3iUks9Mfk9kGOzfSN0tf/N9SpjgrHxKxZsnJjtymRS6
         nl5+/qAbasZvZOsoaF+rT0/15SkvxNaZvXfbZp/JJkn5PodNKy2cJTyXCk8Xj1L6BMG3
         zhVw==
X-Forwarded-Encrypted: i=1; AKwUvBzD1728HV2mLD/b6VevujQuCcbqIBoTdJ374p58UorZNIVdGENReaAFCHwviLApo+Gl96Cp0PoeZn8j4N0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/shDvoet9IJM1X6BBL1jCNlj7i9erisjd972LKk+vFwsuHjN4E
	eDOqjjkmA+ps1gdK+ELB4AGGvE1IAtPRPo3pXqrWQLYIIQipazIfNUuzIuQnkNjFs/AvN3XgyxG
	UwmKAn+bIYiMVa1Q4FzAbn6NUaNsES7oHzR6y
X-Gm-Gg: AYBFou1N1IqTbTxOEOrHvFDGz6qjJmdT9jcSycYSqP2W7z9kmRQifqj2fk6+4WctfTT
	UCDsMvlmFnvezrqexuJRzG96Sd++8uXx65tJB/UMg2bpjuMWpG8A5Hw5ZDrg5isKcwm8Szeq6Ve
	VinXmn4Gq7KJtFSqe+KGSwCuio502hrYOJnKWAlzrkG3xg96TbtWHFA65ed/ixABm8tpmSJoRdZ
	m/UnEupInXLo6FQJtjRYZG/HyxbagVmp7aPyGnsJnnm3SwGGJYp+dxw49roH+1jm4s9cbBZUEje
	0if/y5QkA7oNVltPL4vBC3SOJbiiIjUyTXZc1SRKy7LCiPZcIqgujdiJEH3gCmVbY1lRGWqNGpA
	7SBt+I9vLNi0E7MwEhvFxowm6JioMHetlRuiJqxk1oFzrJiWzXCx+QD/oHRoihBq6pg==
X-Received: by 2002:a17:902:d4c3:b0:2e9:5059:4468 with SMTP id
 d9443c01a7336-2eb3640253dmr137219665ad.7.1793786258064; Wed, 04 Nov 2026
 01:57:38 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 01:57:36 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 01:57:36 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Pavel Zun <pavel.zun@gmail.com>
Date: Wed, 4 Nov 2026 01:57:36 -0800
X-Gm-Features: AclHuK9uXSDqvVProHF1jhv2kQ6yi2-I1MN82vpnyRFmOf5EaIupmEonuz5KmtA
Message-ID: <CADEvP=3KfP6kUod2u0fbSCW9suoROHj=qxXih+EToRnpbBuNNg@mail.gmail.com>
Subject: [RFC PATCH RESEND] fs/ntfs3: avoid recursive MFT bitmap locking for
 external attributes
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ntfs_look_free_mft() holds the MFT bitmap write lock while extending
$MFT. Growing $MFT::$BITMAP can require an external attribute record,
which makes ni_ins_attr_ext() call ntfs_look_free_mft() again.

ni_ins_attr_ext() passes is_mft_data to the allocator, so the nested
call for ATTR_BITMAP takes the ordinary-file path and attempts to
acquire the same rwsem. This leaves the allocating task blocked on
its own lock and blocks other users of the filesystem behind it.

The following stack was observed on 7.1.13-2-MANJARO during file
creation, with the hung-task report identifying the same task as the
likely rwsem owner:

  down_write
  ntfs_look_free_mft+0x1e7
  ni_ins_attr_ext+0x1ac
  ni_insert_attr
  ni_insert_nonresident
  attr_set_size_ex
  ntfs_extend_mft+0xef
  ntfs_look_free_mft+0x262
  ntfs_create_inode

Disassembly of the matching ntfs3 module identifies the extension as
ATTR_BITMAP, not ATTR_DATA.

Pass is_mft instead. This selects the caller-locked, reserved-record
allocation path for all $MFT attributes, matching ni_create_attr_list()
and the ntfs_mark_rec_free() error path. Keep is_mft_data for the
unnamed $DATA bootstrapping constraints, which do not apply to BITMAP.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
---
RFC notes:

This is a request for review of the locking/record-allocation fix.
I have not yet booted a patched kernel or reproduced the original
failure on a disposable NTFS image. Please do not treat the following
host-side checks as native filesystem validation.

Validation completed on mainline at
734bef548a96e8774d6eef5dfa2026c6edc4e80b and stable v7.1.13:
- Complete fs/ntfs3/ object builds, x86-64 defconfig plus NTFS3,
  POSIX ACL and LZX/XPRESS, GCC 16.2.1, W=1: no warnings.
- A host harness compiled the actual ni_ins_attr_ext(),
  ntfs_look_free_mft() and ntfs_mark_rec_free() functions with
  instrumented lock/bitmap dependencies. Seven targeted cases detect
  recursive locking before the change; all 17 scenarios pass after it.
  Controls cover ordinary allocations, DATA bootstrapping and cleanup.
- checkpatch --strict --no-signoff: no errors or warnings.

The affected module's build ID matches the hung-task trace:
1f6011352f196196d266069023704fdf61030248. Its disassembly maps
ntfs_extend_mft+0xef to the ATTR_BITMAP resize call, and the inner
ntfs_look_free_mft+0x1e7 to the repeated write-lock acquisition.
The original kernel reported taints P W O E.

The investigation and patch were prepared with AI assistance.
The original production volume was not used for experimental testing.
A detailed report, sanitized trace/disassembly and host harness are
available for follow-up. This RFC has no DCO sign-off and is for
technical discussion, not a request to merge as-is.

Does using the existing is_mft allocation path for BITMAP match the
intended locking/reserved-record contract, or is there another MFT
attribute path that needs to be handled before this is submitted
for inclusion?

 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index bead01a95..a4c6fa019 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -1019,7 +1019,7 @@ static int ni_ins_attr_ext(struct ntfs_inode
*ni, struct ATTR_LIST_ENTRY *le,

 insert_ext:
 	/* We have to allocate a new child subrecord. */
-	err = ntfs_look_free_mft(sbi, &rno, is_mft_data, ni, &mi);
+	err = ntfs_look_free_mft(sbi, &rno, is_mft, ni, &mi);
 	if (err)
 		goto out;

-- 
2.55.0
