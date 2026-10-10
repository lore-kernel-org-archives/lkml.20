Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943B33EC819
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791623695; cv=none; b=lhL3Vu3IH8Vd2fsZV+WAAfuUm3Js4ay8+sDoX7S+m+E4XOxciXtPKCgGSg0OFFvt0vIqeYsDGhEphJwiy2zdbJkGO/MToLLReq2e9VNMgqlpu8/RCc0o1GpLorPSGGZyWokQWI6hTHBrNvFC2+qP5ADyiq8OA7nxPg91quFWoeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791623695; c=relaxed/simple;
	bh=lAM5b6+OIjaOvHNXh0hpCmmkd4xeYGS8UjTaFjairtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ssSqVVwAkbEWFbX1uDkFTX70kpgeQtZl8eRq11cqsJjXohIBZyGvB3nn3uoAAigXCZ1EjJVd/D9a/KFLvmulcZ6uHeO0W4jV3SAEDygWIBYQGAA2NVTIWKainOcJ2E8Q5RxMgzXRUpTOWVZzvBrRzhRM6iB9uzVjiiWRw42HXLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=ucwiudbi; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="ucwiudbi"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso997462eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791623691; x=1792228491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2EcMVNGvoUCyg4a+/GXdBm3s3zoBcyX1bcILDBo8ZBg=;
        b=ucwiudbiuFPxoRgwOxXDuOEodDaDRSx0nyKbvf8B1qyGkgprdWK+hLbdTf3ZBKZTbm
         cYrMjHYIZnKEFk0gRt8cIpzI42i7hpxDEn8fky8NCfuQYaVIS6/CWyvn60uRXZ+kkbx/
         U5hteBAdhzeUt8bZrDfRZCi190f2PYWeAJhLI+IAEyxfCZVv8TUH0tGVGplVCA/KIrz8
         of/lGMGM0cziFRJ5Ah+ZgDOtr9V3xkOmXlWa8Y4isn3VoXg/RRpPivbHAta4hcUV0YYO
         jol9yIF7cepBduV2u6WtzxXeNOfjIGZVInXYB1xbU4jgWlXYkwIZwISOIrH8B8VbUJHE
         YU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791623691; x=1792228491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2EcMVNGvoUCyg4a+/GXdBm3s3zoBcyX1bcILDBo8ZBg=;
        b=lnivKgwqsMXk0y/IWQYATORkm+q/HBTbU5Nk4Zl53KpZ+B2UA5QjuwDe/9Jp6LpYua
         p8444kIXNSi6ilgGZdam9ITThzOjA231jIDYJ/9ehFfbEHNE1TbslVLcog+x3qmVbQ50
         Z4AaAt7MZL0Z6J74GwdkjDCaq4tO8C7Ox78w69CD93vX9SW2HtDmgLpkuOQn1BP4LjRb
         Ird3NLxkOHTIqIeYWOsM8RY3z6Z5dmB8C1mS9Wb8NMi5lZ65khpEMenWAekT9U9tY01P
         STgPYknlbXrNDcOqfUMraUDfACuXm69QWgXcx/xSbXRjP8b8xOZs8laTXbwgNPI/JGqM
         TE+A==
X-Gm-Message-State: AFq9FYJxJ/q3wxxMEm541h3F6H1GQRWPEslhDZTjHb79kNesP5dZDi4j
	25HHnXhxffGiSOkXC90nfYrGaRNlv8+8eDtNoNbc/SB9k/Ab41IxWUeUjG6ebCEyED0=
X-Gm-Gg: AYBFou24Gh6Qlxx0nptgiBL/hwupq9hAuvwe9xqhzL7k/6Gh9v0a3EisSN96mF2+f4c
	jEKfwmuhRfJxC/0OyeFbp2jN+hrhJUOLAHakhvs6ENMltn7hLjmMGYE5c7PMyhFIOhTCaUmNjVe
	d5KpTTaYMmce+vSLAcg/UTyUOpC4vBp7tQgcfGhvzzG8tddFzKkCOGFh+4xKZKlT2fQ+3m6icDT
	Xl0v3erhnNfClQGb4UJ5/3yp+GKa0P0Mnv4T0PjyCANxhW/Sz+rtBLwjZESNV68l9taiYuzFEPD
	jF5XWyTXFetrzro9dVmteXKz3pzN7oKDlTL66kkI1AxcKEiZEVet3QJKO+p8Mles2at1t1MAMGI
	CXMQFBrmo0/E0nMAutsHFV8jdSw0aCexf285v/xZLdsWT3W5BVy5xfFIxjdZM4tFEDJq3s10ruX
	NEwADfHgsd4fpLM0MW7COFoNTWoxTq/nRzJ+I3y33BIdTO+zNbrYoT0arP78fDMkHjUcjbDfhDC
	lAh7xzq4rfMHtxE3c2rKA==
X-Received: by 2002:a05:7300:8803:b0:351:735e:2ef8 with SMTP id 5a478bee46e88-3537df50e9dmr6407629eec.7.1791623691332;
        Sat, 10 Oct 2026 02:14:51 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c95f:28ac:324a:cdc3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm12287561eec.6.2026.10.10.02.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 02:14:50 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>,
	MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH] scsi: mptfusion: reject events with a MsgLength outside the reply frame
Date: Sat, 10 Oct 2026 18:14:32 +0900
Message-ID: <20261010091432.1788497-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mptsas_event_process() sizes the event payload from the reply header:

      event_data_sz = ((reply->MsgLength * 4) -
          offsetof(EventNotificationReply_t, Data));

MsgLength is an 8-bit field chosen by the controller firmware and is not
validated on the way in; ProcessEventNotification() only looks at
EventDataLength. event_data_sz is a signed int but is then used as a
size_t in both the kzalloc() and the memcpy() that follow:

      fw_event = kzalloc(sizeof(*fw_event) + event_data_sz, GFP_ATOMIC);
      ...
      memcpy(fw_event->event_data, reply->Data, event_data_sz);

A MsgLength too small to cover the 28-byte reply header (MsgLength <= 6)
makes event_data_sz negative; it sign-extends to a huge size_t, so the
kzalloc() under-allocates and the memcpy() runs for ~2^64 bytes. A
MsgLength larger than the reply frame makes the memcpy() read past the
frame and leak up to ~940 bytes of the adjacent reply.

Reproduced under KASAN with a crafted EventNotificationReply (reply_sz
0x50); MsgLength 255 over-reads the frame, MsgLength 4 wraps the length:

  BUG: KASAN: slab-out-of-bounds in mptsas_event_process [mptsas]
  Read of size 992
   which belongs to the cache kmalloc-96 of size 96

  BUG: KASAN: out-of-bounds in mptsas_event_process [mptsas]
  Read of size 18446744073709551604

reply points at a fixed MPT_REPLY_FRAME_SIZE frame, so a valid event has
7 <= MsgLength <= ioc->reply_sz / 4. Compute event_data_sz before the
switch and drop the event when MsgLength is outside that range, as
mptsas_mgmt_done() and mptctl_reply() already bound it to ioc->reply_sz.
Doing it before the switch also keeps a dropped BROADCAST_PRIMITIVE from
leaving ioc->broadcast_aen_busy set.

Fixes: 3eb0822c6740 ("[SCSI] mpt fusion: Firmware event implementation using seperate WorkQueue")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/message/fusion/mptsas.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/message/fusion/mptsas.c b/drivers/message/fusion/mptsas.c
index c362f09a8c555..1812b871c47ef 100644
--- a/drivers/message/fusion/mptsas.c
+++ b/drivers/message/fusion/mptsas.c
@@ -5009,6 +5009,18 @@ mptsas_event_process(MPT_ADAPTER *ioc, EventNotificationReply_t *reply)
 		return 0;
 
 	delay = msecs_to_jiffies(1);
+
+	/* Bound the firmware-chosen MsgLength to the reply frame: too small
+	 * underflows event_data_sz, too large over-reads the copy.
+	 */
+	event_data_sz = ((reply->MsgLength * 4) -
+	    offsetof(EventNotificationReply_t, Data));
+	if (event_data_sz < 0 || reply->MsgLength * 4 > ioc->reply_sz) {
+		printk(MYIOC_s_WARN_FMT "%s: bad MsgLength %u\n",
+		       ioc->name, __func__, reply->MsgLength);
+		return 0;
+	}
+
 	switch (event) {
 	case MPI_EVENT_SAS_BROADCAST_PRIMITIVE:
 	{
@@ -5105,8 +5117,6 @@ mptsas_event_process(MPT_ADAPTER *ioc, EventNotificationReply_t *reply)
 		return 0;
 	}
 
-	event_data_sz = ((reply->MsgLength * 4) -
-	    offsetof(EventNotificationReply_t, Data));
 	fw_event = kzalloc(sizeof(*fw_event) + event_data_sz, GFP_ATOMIC);
 	if (!fw_event) {
 		printk(MYIOC_s_WARN_FMT "%s: failed at (line=%d)\n", ioc->name,
-- 
2.43.0

