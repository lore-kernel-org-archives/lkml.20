Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0795306B0A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792025866; cv=none; b=fYpKDmsoTZBfDskImfOv4zvPHD7exXw1tCpWVPRSXc4OWHCU54WFIy+yg/gxWusfe5CbL4acMEIBX2bkJiH0ckqxsW+QX6sHerEFOu/TbAgW6sGq7Ro7uQljZRqq14O7Z4V/l5yxL+7mkaNcz9ljxQbMAzsey1cfEciiP2icpq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792025866; c=relaxed/simple;
	bh=A9dZqNlJD9WYs+GSLH29AUnwq+8L5IzDDOZ0LYgLQg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T+Tnh2c3KQ8m2vSScb5HlXwcAq3Tb+ETqHV0PRl/D+e89GK4OcyXc2+5EweeoaGpp3TQTERKdwavlABzP8+txXEGakFpmTofdTGcbw1fQjP/hstxdZDunwZ+HWBIUizp6HKkJXa4vtagUkv7UBny0AUjtoRmeloWqgZzPxvceOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=QWqHqavK; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="QWqHqavK"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso661608a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792025864; x=1792630664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qB5u2eAth6kclTEDr0WUXrH+pdbrWwKcjOH4XM8d050=;
        b=QWqHqavK7MzdnOyCxQLF9fpcfwrmLr+WrbjEGeOAius2aYMdGeZbt+F/oqcMrnhSNr
         vcLMKbRjYXfGk7fEbn2y/X6w/2/p2cydk0Nc7eHOVy0Ci1SprkO7EtCVLqAqrcqwxwwo
         upEHLxmTOYu7P18QeCLoWs4pugHCCMZP2hOe9euIu4fRkf9JQvo29AmsXCIG72+0ct0h
         BNoAuT7kVStbH31OAArlEKwROZwJrMCXgGZBfOw6ZK3fUPNwlhqlJurpv1LMXeNe6Jxo
         CtmGbYMgVUCBFpjCnihd62eDdT4PIL2Vbwm5cTTRD45n2spe0W+hOMTbh+TDU4lGMcRc
         iqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792025864; x=1792630664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qB5u2eAth6kclTEDr0WUXrH+pdbrWwKcjOH4XM8d050=;
        b=fw2Z/zxsh0SpZG9lPStC8e2xrEgzgHK1mGELqAGQALnlabuqs1S3ZUnT1wRB7eo5CR
         gSkKJIWCaLSraPFufHX79F/zkIOKqEW+Aq7Y4T7BPpe5RtR9Em0XvhejWadSTdB1Z1Yr
         NwDw4cnDPDvoS35NjsrAti8QtCGsev1wF4+pJ+h8UEySVtQUrBj/5LuK7pCgwjo4BsDd
         IWLei9jLFIClkzooTn1vkj6F/Qz9IM06PWmTGJarDiglMDMoEmPNREKGM3hQyn6ytp05
         wgvmXk81nMOpJoApD5WQzy8HW1MSJ6fxWHoE9bn526ID4LXYsUVI2Cc+OCqz1pUcx1lE
         drfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHsYYAjqBksPGuHK0VGfVxtOKWzI44+u6aqxm+JAWU8o1ZYSIIYVxdUCR+0IDmfEfTL2zom3phWI42df0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvSLTOxPyVjGaBBCfas7jiVNZN5LODAwO2HVuKeSaUqtoy6TxT
	WC4eiCSFE2bgpJ9722mAYOakFfZ6wN9MAlzIsXBPbP/jcbOmSHUTZeYKioY5YlniNao=
X-Gm-Gg: AYBFou1L4BK0tBiBDykpP3Si+8P4xDbWKKS45ta5vCEm8Zy2m80zogCVuBY78BZZCWf
	B9zOdVFbLtx6sPTfy5o0xVIIZPS5bLfCw/mTZtDFYJPiHMxfbHmki7iM5ZLii0TtUn59hGNE0xO
	4uwgrLl/NP7ynvN4Wj/r5rHppnDUjPuVX/mXbawebhqHuYgdkaOI7xIGPowrjwqYy2Ja6Ibsw2H
	NmKqu4GymeFtNEDaQ0wgYu2N0MKgTK0TPfUBDxY+Q10k/AAU5Dm/7jKaPJGVBJtJLDbs0O06SNV
	S9x+XExzX9SzdFWg0YHwU0gM+MFnEVAUkP3wYgG9k1e4uW0hTPjeJTqb3kVdfIcgwbfRE4WrEqy
	V9RU55VmZDZ/Bvev/3PaLOikKyaGJuxwAuGavil8GCn0wM3CUVcf6FMmUhyqYQBWt9r769+n7Ki
	ifo+CslHbIMbheEcRdxJnFHKIs66qA+MOxE/HkkY0GabYvvQZeFUHepxZTkV/tSLPLBk1gs1fFl
	7cI1Q==
X-Received: by 2002:a17:90b:524f:b0:3a8:de1:db07 with SMTP id 98e67ed59e1d1-3ab3a239c16mr14541814a91.5.1792025864155;
        Wed, 14 Oct 2026 17:57:44 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm999198a91.0.2026.10.14.17.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:57:43 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v7 4/7] scsi: mvumi: walk the hotplug event bitmap a byte at a time
Date: Thu, 15 Oct 2026 09:57:14 +0900
Message-ID: <20261015005717.3719956-5-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015005717.3719956-1-yhlee@isslab.korea.ac.kr>
References: <20261015005717.3719956-1-yhlee@isslab.korea.ac.kr>
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

