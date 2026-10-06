Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149263B9DAC
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285946; cv=none; b=CFIoVlKlvxuiEZ+hPRnfU6l2gf4mu7vISQLj8b7m6BBEmvcHWx7Uz1ShPVUAYnju7Q9cyyLuqECOcy6+FA/6RzjNDfQgqKrZhrDw9iwud0wprjbwZT1FF+4hK3+bOsABBtszWK05bSz7XOSnfxEv4H5RJaF2q2wHWdfcviZstGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285946; c=relaxed/simple;
	bh=yMUYGKxKuzdqt2vSqxN3X7fxNGC1DXLVo466TPmKpd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZplMSboVqLk9L1qY58SO2VH5SQ2FvuHfaAyeKV/4IIhtUgrwhIrzbMq33yUEFd/Hc5jTHMkYS5lwKAY4x7IxKKXdE/pQjfQEoHcyBS3qGjpRLIFSWsX2IqapGRNyiiTwHdb0INahZ4uHBHILUDVCkyFNAk8FQ+jRVouyv37UYJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTKXgimo; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTKXgimo"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-886e61fa30fso230827b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285944; x=1791890744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CjcMla2/FYvjpfqQRk49JvWHnA7u7cWllcGDFw7MAUo=;
        b=MTKXgimocW/5S74YGxJtJ+71LtI8TeMgR12ftqgzD3mT9Cq5W2wvGZDfLGdInlBjEo
         XcIc2YnoOhxhZPiDtgT68ncGJtp2aZv1nXmY6WVGYeGZjEXKMywCW3n0LzrPn3nVtEnN
         u3eD2JfD9D6JFmGLVWg9soVNcOndiuQ6EiSWvhpTfqA7/DxIhzJvvH1mde7sJla/9n16
         fAD6asVE5o3flN+CtWkQNWTY13L4Oi3jIIBG93y4RFlqjtq5sg2hrBD9RQXV0G48IrGv
         NCQLl3su8qG4hXxbWeRt9/iEFvOmJhDNOulHuTWRw4werUqMs7NU4PoFQgBpRN0kiIVK
         +ZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285944; x=1791890744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjcMla2/FYvjpfqQRk49JvWHnA7u7cWllcGDFw7MAUo=;
        b=pJhT4BQtNxQXc/WouArjh/txteY6w8xDWdt6KqXD1jtbgcfrmLg57sMUozgIxjf4Xg
         kFsJ4LMc/Qtc9Ebwe7ECRYkXROM7kwpmZlUyV5meR8gHoR29n3W2mEtVMBzDmXg8iwhq
         TPmqKk55KaDtb9wGzOWGXA6YTy4PIJgIZA1Kj7N8wQ+k1wzqjmNXom8L3e2+YCWq4Xmn
         xxPy93qzPG5ML0cidrYlMmqXKWut85xvWLifBr+Gvv5Rm51c4VfuUiYkFXqh6pQSYaCD
         p9KfPw7I3r6h65izvCmIqi2TlLdq2gW68vI6nk/9rW6lY7gzPMX8jUWmGPQvlsYSD42D
         nMIQ==
X-Forwarded-Encrypted: i=1; AKwUvBw26BzqhtXorcbbjb1T3udhkqmnGq2eRDgruqoh06c9KISSnv2GDl2sayvuTTVzZaaAFerLhl9OvkFoUCM=@vger.kernel.org
X-Gm-Message-State: AFuF++ll70p5prHnY/h+EQMda1HTeKBF9B4xwp1ymH5Puspbt0ZJ0n83
	6TBIoYfRTIAkOpv2DGXdAfsQiqnuRTosAXZSSpH/YMmxRpwKRxJAa3kc
X-Gm-Gg: AYBFou0RNJUDkUbo2jMwaqNGi7Ph84iii95695JcEst1U3UAuJ1ABoYA0MGBYS8b/PZ
	rI64qgBZEiMsDweBKAjIXpQgvk5tzdxDTTszEkgFJ8y1jgwzVzHJQesZA4DqXRacmo8kFx84+xm
	JMcDv7JhBbjk65JvnwuFhfpRpRxRMhXYV7Tmm8dCKSQs3JgMae59KHEEOzlgZeqX2mAwPOTifU4
	lzUyq+kMzizf2cFFfIgKgtT+L98DMpHdevU9awZQbjGtAEXolVqioM8XsuxaijejT48/TnTp3Qh
	Q+CAggy0FNgmIA+FBJE6FO1Zua6BJXIVsNlNBMX/+bqYn60RPY/8Dpju7r6/iWXxEuxpRa4Npau
	pefBtN9f9XbYmq8Tq0puKbnOyzJOn+/NkinH1W5t9/5Nlzna5Fxuzwk1MoTojijOQnBq9eLDf2M
	Pfog2TNmhkjdSaMO+/CPYrtlXZXwQcx7netfoYNswtyk8x0YAdbjh0BRFoUFSbNAq9peg1Sy9jO
	hW3zvlKuDmZdjlDzH2IUqWfI9mQS0gMs1wCFQHa2BdQZSA=
X-Received: by 2002:aa7:88ca:0:b0:874:705d:f63d with SMTP id d2e1a72fcca58-890de4e7847mr888030b3a.31.1791285944290;
        Tue, 06 Oct 2026 04:25:44 -0700 (PDT)
Received: from DESKTOP-M211L3D.tail-lite.iloventr.top ([2409:8a00:1832:c00:803:42a3:368d:de3e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968d43fsm4663369b3a.3.2026.10.06.04.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:25:43 -0700 (PDT)
From: pwhMass <a203865235@gmail.com>
To: x86@kernel.org
Cc: pwhMass <a203865235@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] x86/apic: Use the physical address for the LAPIC resource
Date: Tue,  6 Oct 2026 19:25:25 +0800
Message-ID: <20261006112527.26409-1-a203865235@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

apic_mmio_base holds the fixmap virtual address used to access the local
APIC. Using it as lapic_resource.start passes a virtual address to the
physical iomem resource tree. On x86-64, the resulting range exceeds the
physical address limit of iomem_resource, so insert_resource() fails and
the Local APIC entry is missing from /proc/iomem.

Commit 81287ad65da5 ("x86/apic: Sanitize APIC address setup") replaced the
assignment of mp_lapic_addr to apic_phys with the fixmap virtual address.
The later removal of apic_phys retained that virtual address for the
resource.

Use mp_lapic_addr, which is the physical address passed to
set_fixmap_nocache(), as the resource start. Keep the apic_mmio_base guard
so that the resource is only registered when the MMIO mapping exists.

On an unmodified v7.3-rc2 x86-64 kernel under QEMU/KVM with nox2apic,
/proc/iomem has no Local APIC entry. With this change and the same kernel
configuration and VM parameters, it contains:

  fee00000-fee00fff : Local APIC

Fixes: 81287ad65da5 ("x86/apic: Sanitize APIC address setup")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: pwhMass <a203865235@gmail.com>
---
AI assistance was used to trace the missing /proc/iomem entry, prepare
this one-line fix and description, and execute the comparison tests.

Tested with clang/LLD 18.1.3, a virtme-ng generated configuration,
Q35/KVM, 1 GiB RAM, two vCPUs and nox2apic nokaslr. Both kernels built
and booted successfully. No HyperEnclave patches or modules were used
for this upstream reproduction.

Reproducer (run as root in the guest):
  grep -F 'Local APIC' /proc/iomem

Before: no match (exit 1).
After:  fee00000-fee00fff : Local APIC (exit 0).

 arch/x86/kernel/apic/apic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2667,7 +2667,7 @@
 		return -1;
 
 	/* Put local APIC into the resource map. */
-	lapic_resource.start = apic_mmio_base;
+	lapic_resource.start = mp_lapic_addr;
 	lapic_resource.end = lapic_resource.start + PAGE_SIZE - 1;
 	insert_resource(&iomem_resource, &lapic_resource);
 
