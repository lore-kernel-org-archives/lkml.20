Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E613B95F0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031273; cv=none; b=DEM2abeOyDejG7b5f/gjHUT6aiYiIoWJ9kNZ1tjQDDYrLKDNOnOHI869EBN7dMlO20ySz5BHjBPwtRNRrxgmtLlRPimwLLKrQLyb6WNXTlQ+CI8AbQrgV8tAMQTwbs+Tq2taaFUkITtfnHBbvQzb3hGd+gEuAvjJfvuSOH6WMt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031273; c=relaxed/simple;
	bh=A9dZqNlJD9WYs+GSLH29AUnwq+8L5IzDDOZ0LYgLQg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZTw5EgNIMd4PQ0AY5v/rNXgtho2oc1zs3mNRKqxpF1TFngzuttnWWQ604d71O+toyKZkScnxtxHZSvjRJKZNOF30F/4ejsQsLogwuNDTqvbbVqrUVIRla3eUYKRJT7pn9m9kKRd029OPF9kV5kbCIq6XmZrLu/NXSb2+Sbt/b0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=NzL24OO8; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="NzL24OO8"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab868eb9cfso468358a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792031271; x=1792636071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qB5u2eAth6kclTEDr0WUXrH+pdbrWwKcjOH4XM8d050=;
        b=NzL24OO8emW12kmHzjg6k0YfSYCndAilvAThXG8JgdEpTkVfeMOhRIyOXFxka/fEsc
         M2F1lpUwZmc8LQIX0ui4s39WpCMRgwBb06OBIxiTadniK7UkuuuYSbS9O1zzUTxkKhRn
         1Bjzo2ghDCj7vwUmDJcozEJVYCaqdlWFdevN0nC/k0671eL76TkI6/I58p+8HIOR0Y/j
         lziLGZtOq//DN5eMNWLLTSo8Wsod1I4gkSYcq1Wa8wmAkuZBNruCALAiaXMt2ZUcmcrv
         cavWrjaVR0YlEXqkh5TKrd592gLuakQmjmpuEDS750nyuW+wTcuC8HXMloWUrLI6TTHT
         0jLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031271; x=1792636071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qB5u2eAth6kclTEDr0WUXrH+pdbrWwKcjOH4XM8d050=;
        b=OK267h9HdCrZ2t20hSSJw7VQ7wG4yWiDIfTzcbIJVjLmfJOyoGUpmjiWSWza332qMh
         EFYgT8VN+WbhniVN9/7jMclRZlH+9L4hwbZavZ/Ol0UtSSXeO4s1hsHFERIaZnNv49wF
         UJFekSrFV4s7CNLbm+R7NUuQxh02zIdWrjBfoBjtXl+lWkaLBmP00P3VX6yrW/GdP/I+
         LhGJqKUlPxZqEXaFl7zLWBuB0RMWGBOfCqxGe8t0v94kuC3UB1jsRMICA4Nde4+Do/bK
         cQeRTZZCPCjgFvH1JVZz20sVODs3vd0t6OJWxhjZKzaEgNPEabnjLTx2yoFNooj5PbNN
         PKXw==
X-Forwarded-Encrypted: i=1; AKwUvBynRVi+SgGy7aSI1oBGifbRO0sdjt2tRZnqvPa7lDygIYhrxvxY7DTPzxuP867C1TCDG7XAzZCF4NdlVBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/2j5/W3AAp4phL/MOJZxF9b2PikT3YHJL+qGISAkRvMp65qGt
	tzkZveyKfZg59e8Au9VVFiQ4MceCpU/OEOCCW0VLQ/lhaOXm5LbIHqAuJw/GpSW2JQo=
X-Gm-Gg: AYBFou0m3AbxDkBS1hQ+upy6q2qFO4o3h7iTXl37QQ8xlqMuKIMdKudEPBADTICvKxC
	GybaZdClsD3AO8sjrlRrn8a9tQ8uZ1r8v89kStVPerYzSLmpRr994t04tCEpEPsQ1GKyj6yDnSG
	U2Q8bO+kQmzWWqaN8s1GEiVFWPOIl81Lez+TzVLLBa8e6HVkGJm2q0qPEF4WiXs133l0V8mMsmx
	HlsXc8dmDWB/dER3G0LxTWNcsZHTlpVqAj32VIUHek93lWzIBkxf/YM+pUVjlObqTzX0gojkOVX
	qfEZt9S7V3gDJf+Wy5MWQxMSR6cypzVdEMuAaDgh6LG0eR5AJrxw3DwyUWFcGnDFV4VbJsQFtiw
	5CaEXPma1VJgUStQ6USC4ZA1hP2iY68MwvGURHggFybWVxT7YXGJe7r2F1qLURpI4p3sqiRgODS
	ber0ezBe44Ya5im63wICy5yPXB5HEO84wFbDpVXLtZ4xoumq9jBdL0XXs7GqWOt8kbD7UWEY34B
	Dkdeg==
X-Received: by 2002:a17:90a:d006:b0:3aa:fc22:8aac with SMTP id 98e67ed59e1d1-3ab3a9325f8mr15833691a91.51.1792031271477;
        Wed, 14 Oct 2026 19:27:51 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94375f3fsm1997383a91.4.2026.10.14.19.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:27:51 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v8 4/8] scsi: mvumi: walk the hotplug event bitmap a byte at a time
Date: Thu, 15 Oct 2026 11:27:24 +0900
Message-ID: <20261015022728.3936714-5-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015022728.3936714-1-yhlee@isslab.korea.ac.kr>
References: <20261015022728.3936714-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvumi_proc_msg() casts param->bitmap to unsigned long * and hands it to
find_next_zero_bit().  bitmap sits four bytes into struct
mvumi_hotplug_event, so on a 64-bit host the pointer is four-byte aligned
where the bitmap API expects long alignment.  On an architecture that
traps unaligned loads that faults, and the second bitmap, which starts at
an arbitrary byte offset derived from size, can be misaligned on any host.

Walk the bitmap bytes instead.  The driver reads every other
firmware-supplied field natively, so bit n of the bitmap is already byte
n / 8 bit n % 8 in practice; writing that out keeps the device numbering
this driver has always used, needs no alignment from the buffer, and drops
the long-at-a-time reads the earlier bound had to allow for.  That bound
stays as it is, which is now more conservative than the walk needs.

Fixes: bd756ddea18e ("[SCSI] mvumi: Add support for Marvell SAS/SATA RAID-on-Chip(ROC) 88RC9580")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 41 +++++++++++++++++------------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 9a3dde53dea97..18964e860ac8e 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -1653,16 +1653,15 @@ static void mvumi_proc_msg(struct mvumi_hba *mhba,
 					struct mvumi_hotplug_event *param)
 {
 	u16 size = READ_ONCE(param->size);
-	const unsigned long *ar_bitmap;
-	const unsigned long *re_bitmap;
+	const u8 *ar_bitmap;
+	const u8 *re_bitmap;
 	int index;
 
 	/*
-	 * The second bitmap starts size bits into the event buffer and
-	 * find_next_zero_bit() reads it a long at a time, so that is the
-	 * furthest the two scans reach.  Bound it by the length the firmware
-	 * was told it may write, not by the buffer: the bytes past that are
-	 * still zero, and a zero bit here means a device is present.
+	 * The second bitmap starts size bits into the event buffer, so that
+	 * is the furthest the two walks reach.  Bound it by the length the
+	 * firmware was told it may write, not by the buffer: the bytes past
+	 * that are still zero, and a zero bit here means a device is present.
 	 */
 	if (sizeof(*param) + (size >> 3) + BITS_TO_LONGS(size) * sizeof(long) >
 			sizeof(struct mvumi_event_req)) {
@@ -1672,25 +1671,19 @@ static void mvumi_proc_msg(struct mvumi_hba *mhba,
 	}
 
 	if (mhba->fw_flag & MVUMI_FW_ATTACH) {
-		index = -1;
-		ar_bitmap = (const unsigned long *) param->bitmap;
-		re_bitmap = (const unsigned long *) &param->bitmap[size >> 3];
+		ar_bitmap = param->bitmap;
+		re_bitmap = &param->bitmap[size >> 3];
 
 		mutex_lock(&mhba->sas_discovery_mutex);
-		do {
-			index = find_next_zero_bit(ar_bitmap, size, index + 1);
-			if (index >= size)
-				break;
-			mvumi_handle_hotplug(mhba, index, DEVICE_ONLINE);
-		} while (1);
-
-		index = -1;
-		do {
-			index = find_next_zero_bit(re_bitmap, size, index + 1);
-			if (index >= size)
-				break;
-			mvumi_handle_hotplug(mhba, index, DEVICE_OFFLINE);
-		} while (1);
+		for (index = 0; index < size; index++)
+			if (!(ar_bitmap[index >> 3] & (1 << (index & 7))))
+				mvumi_handle_hotplug(mhba, index,
+						     DEVICE_ONLINE);
+
+		for (index = 0; index < size; index++)
+			if (!(re_bitmap[index >> 3] & (1 << (index & 7))))
+				mvumi_handle_hotplug(mhba, index,
+						     DEVICE_OFFLINE);
 		mutex_unlock(&mhba->sas_discovery_mutex);
 	}
 }
-- 
2.43.0

