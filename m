Received: from mail-oi2-f14.google.com (mail-oi2-f14.google.com [74.125.231.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0EC48EC75
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015094; cv=none; b=Mico8NUrNgJTOWCC5SeEz530czljkdm1zV6xcaub8NBuOinpOOM5ejkr0rI+SXQkbPib66W/RkH/fNblphOBqLPhsuyBOy3zwWA5/P6qfsc5NuR9Z0auDFrh8XzREa1EdhzGsVN5cT+Y63BLaJmyEGDE3kH10syZetFnpxQPRXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015094; c=relaxed/simple;
	bh=/+RI1Da3sET4j7aA1zAV2C4MGFpQWaqBXLaCnc5GHEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F5D1+wqh6ivdAjoygxicbTnISPPwhHXYl4k8Hf3HJtsCUrB+m7nKjh1MOFI2avUP6wLMH90+oGFcuJM6DHs+JJ+9GakXFUktUaKjC4un9rXNXaSa6CcR4Ex+j3wkwlGLQOoZ/HU2Fs43UxjdKrp2c90Rqa9coRRDT9/NaeG6jJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+fqubIf; arc=none smtp.client-ip=74.125.231.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+fqubIf"
Received: by mail-oi2-f14.google.com with SMTP id 46e09a7af769-7f4f0c89e35so2334916a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015091; x=1790619891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjUHpPAdtuvAei0FHz1ELJs0Q5uHpEFQEpOpyheuCag=;
        b=B+fqubIfyD7Q9ZCrWnE1rYogNj98FHeI/rA0QGNT14hhQ3yJlB03SrSkbDQgOJanND
         VVchJyD5eStOOmXpx6lTnO97JgINe9A3w+lClqEznViuN9jNHEQ6Du5YsRs/BemSvqTh
         P+q5L9Hz7Knbhq+4ZZedHIjzsUhU2YRNnSBFIUqK3GRrJsDOjORFVFMU2VH8tY7Yn5D/
         l7mOIjVNwXxx492PyDjTd0VcKHgLFDVmxsQO2gRIN4Ofx6Ep/YXBFHJfeRHRl+Rsmb31
         ueYy1PefTKeNTDFsSSZn2lCgpJlyDYBSFcLJK90SMiyeJmLe8EoExTXUh2nRzsXEln7Q
         VbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015091; x=1790619891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjUHpPAdtuvAei0FHz1ELJs0Q5uHpEFQEpOpyheuCag=;
        b=IimFQ11IN+V2LE/PWk69T39c2ugM+F0VC3pkmEuYKrpmFMrxVi3/+4PW1kF3oYMVR3
         evnI3qQ0MXwZT0oGDk2f9nrmLOLjQIMYVTBxeudf2zxOQmrw9wjsumDHmn/4i7fqDK22
         ea8xsmJw2y8HxZW0J16r+8mwSE7Dzd2srUklZ36ttVcEIo/e5+HlswjENZmy5LUAgTQ7
         naLEmV0xda/QyRro+NS7nXc81pzl0TF/DiPpPcs00vW1VlPBM3/v9ICadoEEkhY0CH0n
         2FYDmtzO2fbwUT6wHd+df8S2osOTwnmH3tYiGNx85mx9vvvgvXfnm5nOrjXlgqKMRcoB
         6ogw==
X-Forwarded-Encrypted: i=1; AKwUvBxB/eHYkPvRpJoxLgHeXBOFO00yXOeuOZChJrbF4k/0gKe+TmG/YYNlXWUhbps+IJ/uQihjQywukI6gLsY=@vger.kernel.org
X-Gm-Message-State: AFuF++mrzsWy2RHaI/HXBe9xhvOkC5LphJODiKitbj2BYjCAz48ZDj05
	7+oE6ovw+6u7JZxL5+0ntMua+wn3Nv3qBn/ycRsr4Ju7mysZiIYnoDxl
X-Gm-Gg: AYBFou2WrX3+pEk3r4rX/0UEpKFr+KC/ruQf6odvGqNu8VU7uuZdU/q6uj0Dk3v6acZ
	wvBI5oJXR6jl+wXMVlr2xhgD9fWKbDIgNCtMAmP9dGknnQZP0tDHjJnbi1pTNlE1mzGgvio/eYV
	lMb6lauVS2KR+rkLdkmljjihVO5sefYsVaDBhFLxYxkGAVI9Q9oQ/H8qfxl0OzwGYD8AUKlb8vP
	xwUJFjcVgQgu+iOnVdDKNXlwbZt+BYU3gvHwbhcs2U5A4uF0wPTxu7A6yGm5Thn/OfjD7hhu6kP
	+G1VwZned2UVkYErk4GFF94rfqvIQOY3LQgKdTCilzEgns76aG6nBGfjw2iVr1/sb5M4lyt7/aw
	qEciZABDCuTk+NSbMcQRJ2f5goDrP8JLyAzmC+hoNGvbv3YuqK8Px3qi5DeARxmP55j3Kuuc88j
	deRjrg2mUZSbQAqffcuRdwxpNzYXQWuzDeDdJofjUcTQiyuqLnsUy70FcAbWXc5PYUsWCUxXlS4
	mPFcRXKD0AvODHzWUX0Bp8o0L7BaAkhZIAg6RjJ
X-Received: by 2002:a05:6830:3144:b0:805:5e7e:9bf6 with SMTP id 46e09a7af769-80de31e766dmr11051342a34.21.1790015091211;
        Mon, 21 Sep 2026 11:24:51 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-814739aec92sm777318a34.3.2026.09.21.11.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:24:49 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] ata: libata-sff: replace kmap_atomic() with kmap_local_page()
Date: Mon, 21 Sep 2026 13:24:48 -0500
Message-ID: <20260921182448.194307-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmap_atomic() is deprecated in favour of kmap_local_page(), as described
in Documentation/mm/highmem.rst.

ata_pio_xfer() and __atapi_pio_bytes() each map a single page, pass the
address to ->sff_data_xfer() for one transfer and unmap it again, so the
mapping never leaves the function that created it.

Neither needs the pagefault_disable() and preempt_disable() implied by
kmap_atomic(). ->sff_data_xfer() only moves data between the device and
the mapped buffer, and both functions are reached only through
ata_sff_hsm_move() with the host lock held, whether from the PIO task,
an interrupt handler or EH. kmap_local_page() is fine in all of these.

Tested on i386 with CONFIG_HIGHMEM4G and CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP
under QEMU, with the PIIX IDE controller limited to PIO by
libata.force=pio4: O_DIRECT and buffered reads from an ATA disk and an
ATAPI CD-ROM, and O_DIRECT writes to the disk, all checked against the
image files. The O_DIRECT buffers were in highmem. Both call sites ran
in hardirq context, and ata_pio_xfer() also from the PIO task. No
warnings with lockdep and CONFIG_DEBUG_ATOMIC_SLEEP enabled.

Assisted-by: LLM sparse
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 drivers/ata/libata-sff.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index d5ef0338735c..a263f886abc7 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -580,9 +580,9 @@ static void ata_pio_xfer(struct ata_queued_cmd *qc, struct page *page,
 	bool do_write = (qc->tf.flags & ATA_TFLAG_WRITE);
 	unsigned char *buf;
 
-	buf = kmap_atomic(page);
+	buf = kmap_local_page(page);
 	qc->ap->ops->sff_data_xfer(qc, buf + offset, xfer_size, do_write);
-	kunmap_atomic(buf);
+	kunmap_local(buf);
 
 	if (!do_write && !PageSlab(page))
 		flush_dcache_page(page);
@@ -763,9 +763,9 @@ static int __atapi_pio_bytes(struct ata_queued_cmd *qc, unsigned int bytes)
 	trace_atapi_pio_transfer_data(qc, offset, count);
 
 	/* do the actual data transfer */
-	buf = kmap_atomic(page);
+	buf = kmap_local_page(page);
 	consumed = ap->ops->sff_data_xfer(qc, buf + offset, count, rw);
-	kunmap_atomic(buf);
+	kunmap_local(buf);
 
 	bytes -= min(bytes, consumed);
 	qc->curbytes += count;

base-commit: 3bab8c7e0c6ba187a47163a1f71477213a278c48
-- 
2.55.0

