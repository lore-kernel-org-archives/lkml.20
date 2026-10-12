Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7BF443C10
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790724; cv=none; b=hVIp64XV9Jeup9f1QKhJEITQDouxkLV9ZeDP9nyrWzcMgJv8woaIWOH+PRZpyYbrAnXbpWGiultJOhWtVab5kGPhOW8kVZsH/sLqexMuUdrRUTI4vKO22U8BBNIvyvaZfuPj1HiJQc8CJEV15m2rhzZzPqSSsVyc8NNINRbZbRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790724; c=relaxed/simple;
	bh=gRy0tVmY36RuFINYba/yIa9FoyM7l7UXacFnKeSKODQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHDmcnhrfx5tZJU+oBUjebCVTFSpisVwZ6OW4A1P+9LPfl6QObdi9g/NQSBXv7o9Am4NRWZ+T0hsmdM49UurtLvHxtYBnMWIRWQ2KqntLx6CsfvYYNlzffYMlB0l8AP3pvIBbSPsPmSvbHYhMchb7hj8d+RMTexPlS2ptFGUlS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=MzhHpmTD; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="MzhHpmTD"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-89a756e5d20so1006285b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791790722; x=1792395522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnNE/hWpk3lnvRShne5vDHHiWuXq0SGuBMsNI2/H+N0=;
        b=MzhHpmTDBcMvyhoxU2IhtJuVJVdRntaMKWRwQ4NEki0QnD39U/4vo10m4luD0HWHXf
         lD+81Wcei5fX4ros9N1KF7C9pSewaL8DdAA+yXRkGxx97I1R2eoH0tlTwy80BW+0jXoU
         yl1nT+q1YTaiXVIdRY34XmM0H+fU06LEf94XtqduAQVW7pgh3rKM/kMwo2L3egczMvZy
         faYTpO1Ok4OROAoFU1XPTAg9ATThI2vcPV4m8eoesoWqMxHgOxzaA/HA9FpunHe8z4pD
         hGUF3XUkCem0+a0b+UcI4z1TL3LxMqtJwW/xSQZkir+Sqo6IKaSk+eLVF8wESOIR+XhB
         mHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790722; x=1792395522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EnNE/hWpk3lnvRShne5vDHHiWuXq0SGuBMsNI2/H+N0=;
        b=nZqg+v7FQDSIKu9rFouLoeq72lnVYfbArZpIONjxv+iM1pr1QjArbLPUKE/8PDSY8Q
         tnXNHzHMhhIWVLwJ9FrE+vvD008+8+oASa8J3nMbQVG456fYisYAoW9PP6j9xyCmHTKF
         OJtDf6S0dQYPFFZQwvOGVkNE2CreVrYFJHU2imz8qqU7VDjIolnWmBtkGroBSqIWgR3X
         FRowcHigPzFwi1W72UoSOE4nSLlaAGt1NAD1wN1NZ9QrKr4dO8Xqb5tiTRMUx+r6NRpW
         sCEkUAArYnKnVniRJBNPTwAwtidJKrjPcO0eDiQm/2qa0UatpZh7tiOVdJmGtH2QJK7f
         zwYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBOTmLOu9mZ97FqJC3AFWOg3vh3C5H0FpUWAMWJ6e+VnvMg1aQ4gXLJFr886vXW0e8NivNmGD4rB/ZO5Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7px45SC2YYbQt0hwcicnLyFVQGD1oH+LJjv3IztqIYGhng29/
	5lz4g02tW2pXIoAOp02H0uTFZFs53kV1YsGhxuXgLZayb4KoPTOmsQjVxhpfMvOuHZA=
X-Gm-Gg: AYBFou2e/qW65xpRvfkSZVu8mWRpUDuAvfHHId3LQVd+NipbJmwsBZF1XmS5bsypV5v
	LcBj9bUjtmSL7WvNF/acIdZu1yXCyAxMl4zAQoBrYIeKSXk9cVkVJ0khV0PtbCc03ow4oL4fD1d
	HaMG4EGZyz8fnKDC40bi4F577i1VOuubmpJ+cTeqMwc+wmRkbaJdyLBH1DtpdpocF5pPKY15uWU
	oegZqC6gCNANFqsESdboQb3ziBs9O4MKhB77oj8n3zefuYpW/zrpqhH5Spa9KOU/skpN7wHnmAM
	zU0FrTh7dUaBet1vTPb4fRyDa/krSxP3VIuJVeuu6INhcAljI0AnXelfdagmZmqSDspSL9EpiBi
	4+gcODkH3IRECmuGOTkN1Dkkq2eFI+pzmv5PrN/Zm9xwtV6LuGGovMrzPoD4xNoEpM/3glJFT5v
	ws8qAKNI1OESsAt3KtbYmt5BVNbzzYV6C0eGABqoY6gYa1wbN2nmr5T+WWjC7rGYv4bVF8HmS0g
	V5xRw==
X-Received: by 2002:a05:6a00:893:b0:89a:19ae:10e9 with SMTP id d2e1a72fcca58-89a19ae138fmr3097533b3a.38.1791790722420;
        Mon, 12 Oct 2026 00:38:42 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-898c9ee8bc5sm2148780b3a.60.2026.10.12.00.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:38:42 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ching2048@areca.com.tw,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	thenzl@redhat.com,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH 1/3] scsi: arcmsr: bound the firmware-supplied message length
Date: Mon, 12 Oct 2026 16:38:26 +0900
Message-ID: <adc1e1512a87ff16e99d066c2e96e18a1d28e610.1791789900.git.yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791789900.git.yhlee@isslab.korea.ac.kr>
References: <cover.1791789900.git.yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The adapter hands the driver an inbound message through a fixed
128-byte window:

	struct QBUFFER {
		uint32_t	data_len;
		uint8_t		data[124];
	};

arcmsr_Read_iop_rqbuffer_in_DWORD() takes data_len from that window and
uses it as the copy length without comparing it against the window:

	iop_len = readl(&prbuffer->data_len);
	if (iop_len > 0) {
		buf1 = kmalloc(128, GFP_ATOMIC);
		...
		data_len = iop_len;
		while (data_len >= 4) {
			*buf2++ = readl(iop_data);
			iop_data++;
			data_len -= 4;
		}

A data_len above 128 therefore walks the 128-byte allocation, writing
firmware-supplied data past its end, and the loop that follows reads the
same overrun back out of buf1.  arcmsr_Read_iop_rqbuffer_data() has the
same unchecked loop for adapter types A and B; there the destination is
wrapped to ARCMSR_MAX_QBUFFER so nothing is written out of bounds, but
the loop still spins up to 2^32 times with rqbuffer_lock held.

Two of the three callers place no bound on the value at all:
arcmsr_iop_message_xfer() for ARCMSR_MESSAGE_READ_RQBUFFER and
arcmsr_sysfs_iop_message_read() both call straight into the reader on
ACB_F_IOPDATA_OVERFLOW.  The third, arcmsr_iop2drv_data_wrote_handle(),
compares data_len against the free space in acb->rqbuffer, which is up
to ARCMSR_MAX_QBUFFER - 1 and so still far larger than the 128-byte
staging buffer; it also reads data_len separately from the reader, so
the adapter can change it between the two reads.

Clamp the length to the size of the window in both readers.  A
conforming adapter never reports more than sizeof(prbuffer->data), so
this does not drop any data it sends.

With a KASAN build and a crafted window, data_len = 4096 produces 992
out-of-bounds 4-byte writes (1024 dwords less the 32 that fit) in
arcmsr_Read_iop_rqbuffer_in_DWORD():

  BUG: KASAN: slab-out-of-bounds in arcmsr_Read_iop_rqbuffer_in_DWORD+0x240/0x2a0 [arcmsr]
  Write of size 4 at addr ffff88800b5baf80 by task init/1
  Call Trace:
   <TASK>
   dump_stack_lvl+0x66/0xa0
   print_report+0xd0/0x630
   kasan_report+0xe4/0x120
   arcmsr_Read_iop_rqbuffer_in_DWORD+0x240/0x2a0 [arcmsr]
   </TASK>
  Allocated by task 1:
   __kasan_kmalloc+0x8f/0xa0
   __kmalloc_cache_noprof+0x22c/0x570
   arcmsr_Read_iop_rqbuffer_in_DWORD+0x7b/0x2a0 [arcmsr]
  The buggy address belongs to the object at ffff88800b5baf00
   which belongs to the cache kmalloc-128 of size 128
  The buggy address is located 0 bytes to the right of

The first value that overruns is data_len = 129; 128 and below are
reported clean, and 124 (the window) and 120 copy byte-for-byte
identically with and without the clamp.

Fixes: bb263c4ecbb1 ("arcmsr: fix ioctl data read/write error for adapter type C")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/arcmsr/arcmsr_hba.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hba.c
index 8aa948f06cacf..255f1d898079f 100644
--- a/drivers/scsi/arcmsr/arcmsr_hba.c
+++ b/drivers/scsi/arcmsr/arcmsr_hba.c
@@ -2277,6 +2277,8 @@ arcmsr_Read_iop_rqbuffer_in_DWORD(struct AdapterControlBlock *acb,
 
 	iop_data = (uint32_t __iomem *)prbuffer->data;
 	iop_len = readl(&prbuffer->data_len);
+	if (iop_len > sizeof(prbuffer->data))
+		iop_len = sizeof(prbuffer->data);
 	if (iop_len > 0) {
 		buf1 = kmalloc(128, GFP_ATOMIC);
 		buf2 = (uint32_t *)buf1;
@@ -2319,6 +2321,8 @@ arcmsr_Read_iop_rqbuffer_data(struct AdapterControlBlock *acb,
 		return arcmsr_Read_iop_rqbuffer_in_DWORD(acb, prbuffer);
 	iop_data = (uint8_t __iomem *)prbuffer->data;
 	iop_len = readl(&prbuffer->data_len);
+	if (iop_len > sizeof(prbuffer->data))
+		iop_len = sizeof(prbuffer->data);
 	while (iop_len > 0) {
 		pQbuffer = &acb->rqbuffer[acb->rqbuf_putIndex];
 		*pQbuffer = readb(iop_data);
-- 
2.43.0

