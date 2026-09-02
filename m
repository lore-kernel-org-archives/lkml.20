Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5353594A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788318102; cv=none; b=YwLMtFNHQZkB2thOIRL7xqiQbp/NyZfZzYWM6gRKQdGw0cFITG/fcndMT+mELxO1WJb3nY1eqRlEPZbOsV+WaBk5SsuGMR0PE/S5hhZB8unPNj8r3PUgFD7nO/pijUkvfVzLnAexioVKwQXPc7XtBpTH475qpfNsUecI2ahpj4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788318102; c=relaxed/simple;
	bh=LJEUhAnoyjzJSNkVaCFeqCg2HVccMOzkT7YsmwE2/oI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=Lab/JEYVEfwxstNx0B4Vdqg4BfZLm1fe+T1V7Y+dNIiyjhkrmzyYaLgXFluVM9EKmwsOhEpM9Qr8wc6jgsHHHjA9FvWKGKXz83J4Qc2OLLPURlXVUMEC1Ybo1EA2pV01+8XEsdaoQuIZHUK7IeHr1/11ixmGSuwerjwdAVothnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXrDjdTC; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXrDjdTC"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so647132a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788318100; x=1788922900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JL5neCIsAd5SWi4nKKH1Vrpz0RR6k7HjLj/9VXZAhZI=;
        b=nXrDjdTCcMSkqcuPCgme3C6GFc/UUrYyN9p7etekeQM2gJbh+vAaASboawps2RAhdp
         wXwD094R8TWHEp5/kICAaCjFQMQ2AbxJE65lQhY6S4Sf12HYjxhcnuUbwpNNv8yJmqVB
         FnRDGxBALQwPonOyNDJK43Nb25GNnOmlNXHWRsOuuRmtQGxndAtyXjXPBHYNq3DC1zdl
         kK9/JG/1q3WPv8gpQ4vaexU1n9Z0CB4hm82XDwPKJ9INXkQxj/+o2Y0Ekq7KA2GDpm3/
         msDfq3IPK/ACtiImKBf70nF2l5ggiE6UpneoEB5xSv7rVanSwBQT5t8meZUlcRCbvUjC
         AmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788318100; x=1788922900;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JL5neCIsAd5SWi4nKKH1Vrpz0RR6k7HjLj/9VXZAhZI=;
        b=OPBgoRJyTzrJpLS15fdKGcJWhdpw5PZa+d/YaAnHDfWre7BdD1KHbLn4tcizec5Qyf
         O0zbj43DeA6IRDTjExqj4JvloOb1DZawTuxUt1OO092Wn4+9Rys0CVPu4QHKnknsd3L7
         lxsXNOMbrHhsuJFxM7d1aPbIYiq8UJ1U5/ZlcrylQFrmWgXaUBYJoFflBDJSF1OxC+ks
         STxTHNCHRSqhHxU3zDoi1mf1Q7hXkiizh3Vyq8sItljk9F+wpgrBfu99oQ7FTq8VBjwQ
         Wdp5uZUXWeqqslmQmLiezKcCWWT4mDFncJpO8ow8JgNCUbaQzCxU0AJlrtPiIxACH1Ok
         5h0w==
X-Forwarded-Encrypted: i=1; AHgh+RpHi5EC5yDx08KIpmycJPEFqZp5MbTn8u1ivYce9LTHBgg2P17z/lEsk/vLB8uJCZ/Ps0ThMwi6yKr/tTk=@vger.kernel.org
X-Gm-Message-State: AFuF++m8vOgDV99xoumIgKk70gt5oScPVF02NjnhEnv0y190VzYW6fCR
	mqXqgE/902+/kSJuEaX0VE6G3qnFmesckvS+HpwoXDeyaHDH9HP5NuVi
X-Gm-Gg: AR+sD12vM1cL7HF8x2nztQjJTsc2+nLCWXT8OW9tZfiNs/EvFqInyKzHpq38A9uz+Pu
	hrRJfiDLsvs6LlBahIQ0W05NqZuEcpZOFXOpknDxtKDg7l0vsTvV9R2oeUzEhZLpm2bPu24qASu
	stpQst4z+lXgLgUqojMWQDP2AOKmTAzcOQ0W10phSEZwakN4/Pn9/0hTagGjQKGKzfrD+cG5R9M
	BwOl1u4Eb/Wbt57yQvappoCAcODKrt1WaAS1/9Pt/1JGjRg/BoGkGzm1t2dXCTvyIL4syCfAeRr
	u+yxpbOYGyh993UD1f6G+7JRsE+/ZhQ38UDbtxU7E5Gv4Z6Hz1q8+TTzTRi/0Dg9jTnii5ZPlIL
	w+4ETcTZv8n+0lyxUuV1sBvik98qEu4f37J9XR6nPShS8zbDl+CwV4+nv3VsuUT51izK3NMJzsF
	+YcHQl4oWTBpW+9mF3p6X/6SxWzCQQonoXjbspQBvNkUxPbqcOKCe69JLnJN22doCs37QwMcrIZ
	jNIglANQMqFtdf3825wanB4bONJ1m2dRU70V6xItVg=
X-Received: by 2002:a05:6a20:9f8d:b0:3cc:8344:1213 with SMTP id adf61e73a8af0-3d9ae0c85b3mr3096813637.8.1788318100187;
        Tue, 01 Sep 2026 20:01:40 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc42e94e160sm102754a12.20.2026.09.01.20.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:01:39 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] x86/hyperv: Avoid using per-cpu output page in hv_apicid_to_vp_index()
Date: Tue,  1 Sep 2026 20:01:27 -0700
Message-Id: <20260902030127.581040-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hv_apicid_to_vp_index() currently uses the per-cpu hypercall input
and output pages. This function is called when running in VTL2 and
when running in an SEV-SNP CoCo VM with no paravisor. In the former
case, the output page is allocated, but in the latter case it is
not, so the hypervisor stores the output VP index in memory that has
not been allocated by the guest.

Fix this by using the input page for both input and output. The
hypercall has very small input and output, so sharing the same
page for both is straightforward. An alternative fix is to
allocate the per-cpu output page when running in an SEV-SNP CoCo
guest, but this uses significantly more memory, particularly
with larger vCPUs counts.

Fixes: 86c48271e0d6 ("x86/hyperv: Fix APIC ID and VP index confusion in hv_snp_boot_ap()")
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
I'm not aware that this bug is causing any real problems because
SEV-SNP CoCo VMs on Hyper-V are rarely, if ever, used without a
paravisor. But it was on my list of little clean-ups to do, and
a recent Sashiko analysis [1] flagged the issue. So the best thing
to do is just fix it.

[1] https://lore.kernel.org/linux-hyperv/20260901171238.834601F00A3A@smtp.kernel.org/

Changes in v2:
* Make the new code a bit cleaner by dropping the unnecessary cast
  to u32 *

 arch/x86/hyperv/hv_init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index d5edc8530964..2a71c70d7e27 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -731,7 +731,8 @@ int hv_apicid_to_vp_index(u32 apic_id)
 	input->partition_id = HV_PARTITION_ID_SELF;
 	input->apic_ids[0] = apic_id;
 
-	output = *this_cpu_ptr(hyperv_pcpu_output_arg);
+	/* Treat input as having 2 APIC IDs so output is 64-bit aligned */
+	output = (void *)input + struct_size(input, apic_ids, 2);
 
 	control = HV_HYPERCALL_REP_COMP_1 | HVCALL_GET_VP_INDEX_FROM_APIC_ID;
 	status = hv_do_hypercall(control, input, output);
-- 
2.25.1

