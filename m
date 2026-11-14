Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627508;
	b=e3OUkEdA7qrSBGuWnu8yANUgLXJwMnNJDyymeO7qWB1ZOQf9V56sqzOn3qEw8hU/7QPe
	 MO7w7QpyvvV10S2UVEav50rRwROzizkiM+5MH9k5zH8sOS3uAU3G4rVGpyuzxbjartQ36
	 /8t2qu/ulSLroXWgqhCgQsVl3cuHfBlA495l+ySuGQxzt53MqHgW+jke9Kcyseu1FK7iU
	 BYlyGGNM8kOiO+Rbp8zu0f/vomkL5SAO1ClTeqw3ErjmtqeCNSygPo0oNfwT6tvi4vmEc
	 qW744K9JOCDgglRb2LJhEgdgd9H8TalqCg7XIcvNa2TcSf9CktJcpQdav1+RA7K+Okw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rpez/z8hzSAfBhId55JZCdpqXWEzg5Y5+HNCocJvZXI=;
	b=Dv9L3UPjzQE32evO7ygz7umtPuVHntB8vWnvCNRuj7iTG/5xsJ7Uc1TbgQBAUr07Fhkv
	 lNT6B0oHxJn3eWoQ6Ca2LaUTtiY9zeb9AGHHUqeM+zczKYe7WKWb2Xb5IN+axBqUD4xVp
	 I8VrRLFLDWaOPBrbH+dwNNv2IWQ+DPx8gsJJewQU/cLKipxBw9eIDcUf0kzTFfaqRPWTa
	 U2vU1+j1oK8PFuDGqFmwSxAkH/FFPMI220HGadhhxRTQCVAoCbeqphTwAa8YDTkhPPEof
	 YH34ItpSE7mQloiqjYGJz2D8uLMQvs1ddcb+x8yCxI+e/RDOaNLs65mt54dhnO/3AfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pJ1tK5bR;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04434606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04434606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pJ1tK5bR
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1684583a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794627506; x=1795232306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rpez/z8hzSAfBhId55JZCdpqXWEzg5Y5+HNCocJvZXI=;
        b=pJ1tK5bRCAyHnIeYgl5p3DFuZ0cxHK63205KBJJbjdHza5R87ofhOakCUg0psQQLwU
         sTY0BO3L3I67ZbZHPQr8+FjvmIqCmaUZBz90NsBCYiimhYbWLo47zECU9gSMnRkbjIr+
         Qozj7KhcbDS/2eX81gmQdTIgsvToeTRIiTdrM0eFpmPZH57g38qXxlFDeMeBXIrDgEy6
         /bwf6wTz9kWGnAFCc1knYO/M0HA3mysHpRTegK50sJdTRW8YyR7KbkUrc91ForuL3rNP
         Z3IgE8dlIDks+TvojdfZKQGKuQTAMUBtCYybdfowJSUKPcLB6DiQR6NHkt+yJ7ZEXdmV
         +TbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627506; x=1795232306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rpez/z8hzSAfBhId55JZCdpqXWEzg5Y5+HNCocJvZXI=;
        b=ToyeYMkuY2mfw3gR2qbNWsA916x7m3Bl0WZ7MpQC0VDj5LEMyPkg0ldFraAnPr2e5z
         pKvTrZO1KVYlb62vX10TUB+MJHA5xYVYXeKwMGdEOR85bKgFk7K+UrqxZ+JJdckoskJ4
         zHxrVJDU8h9bdScUuw4hXUe0rUgN5+mvjRFlsbI0I3HGsTd7leFtCMYUZRVPV6RNg8QJ
         LNhkf6OvyebNdRXWm8nKtIGfLB/E2cTTJSEV6fJQhA96PwAQB8fR+0inb445BW59/Ys6
         /l2b6gozQEDj7xUb4q4C7tCOtwrFka08peq6VMgZogJpxRUKU8rKGSOkvUl8CZsdSSW4
         xK7g==
X-Forwarded-Encrypted: i=1; AL+hErESFewAl1Sm1Vnx20btaxRTKgprdlYnRo7GTqAiLqTTnZVw70grm4ETNJnC5Ni2cZLEB7Lu2Hh43IXLIFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GkXr1kpaPkcDyY91OvQXA7yU1hWLVg0Mh2vRiCqh2NAqtNaAU
	NXRrvwWdjjsnV0dMB+h//EmKKha63njMu/h7eMFT6r8D+lNCB4SnwyG64wlpRimDIwg=
X-Gm-Gg: AYBFou23oAvlvTYpctiW7O1TplMrKFkKjcjY8SuQhEUNhtnijkdDysS9Ud4I26UGli4
	2DBrit7TG9gypGxfLnEn5Xa16+oCeNJVh4hyXBOO+u16bplf6EedlxowyzP2+qldULSsk+15BvN
	i3CVIlUzxxKxndGpgJij+ZuwQFVWpKc687Enl6ry18Z3dApp7SBdzvTrG76nQqlyMeS0zdjgHLr
	XiwIaVkpckE1TAPpxvVlTdNhA6T9d84excFjmsnyXAxlU+eC5sJiuGO9+NPk+coR19Yieg4uep0
	Sgr1+jA3LC2cGjHY0ajSjksLHH+OoNgzo7fybUZA4w/zCMH32XjS1UoZkRvpNlt8IJcFyGNMsoZ
	i25HuOz/u2pkqdmPy8L5D73TvmuAst2BoNvgdFOHVl2bHgsD887IyPvhxkPtvvd4F/teBxsJjgN
	Wmb7C0TY1TOYv4zB/9+94jcuTqwLbKQeDoy4NlJq4nvO2+d3NEO2+FV/Ru1wehvJNLUgKqK5h2A
	6vFHUnlnRm65ukXWyIWUrr+dM8s8IB9/XjMHgPp0EVn8dNJXBvvkDaBXSi1l8pBJO+Pltk/1SDq
	k6b0jrFqtfPJ0kBpjXXrDUvdSyrmC415Wlgb0c5tUaNW2Z4A/iii0rPgGwQIVE3NQV+UDv4hpK4
	nlZTGcM6vM4QrJhu3nDRF3j3Zhi/u6CirVleiNA==
X-Received: by 2002:a17:90a:e7c1:b0:3b0:9409:6969 with SMTP id 98e67ed59e1d1-3b1b0b94eaemr2970617a91.19.1794627506383;
        Fri, 13 Nov 2026 19:38:26 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:f861:b117:6318:c068])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3a21769sm3412380a91.4.2026.11.13.19.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:38:26 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ching2048@areca.com.tw,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	thenzl@redhat.com,
	erich@areca.com.tw,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v4 1/4] scsi: arcmsr: bound the firmware-supplied message length
Date: Sat, 14 Nov 2026 12:38:07 +0900
Message-ID: <20261114033810.549787-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114033810.549787-1-yhlee@isslab.korea.ac.kr>
References: <20261114033810.549787-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
index 8aa948f06cacf1..255f1d898079f6 100644
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

