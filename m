Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE21848E0DD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101621; cv=none; b=TCOljn6gTBFL8r30npRAvutUaPIr0v9QEDrJvMePfpobUW/qiH5HB4ZmREP8OeJkyW5cp8dzhZzOnOeYCnWdG1TSV1a1ugyZilqip9KwgTH+S0csh9h9Yaq6R7tx5Fvako5+Az7WLyLaUtZPo1+yTr6dGZs7lFAnghnIJ+GO0mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101621; c=relaxed/simple;
	bh=byoBrJIoQXZTuPf9GsZIBDK4FdjAZpb1BrnfoGWJZRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HphLxi+eBzvJU4tiWyKf0jxCVOfa0ef75fYf3GY1kismgxHUVHW+UYgbvafWxIEErzI6JZHsmRme32h2qLcr1gF26jRWJcmb+jRKrB3Qoh0khERN7LO2zdgDo8cqLSZxzRGNFT/unoI/hJzudEnNgIt56s3t+Ec1c1yuULcGb4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jco0PSf8; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jco0PSf8"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc50d1b048eso193841a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101619; x=1790706419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/wiz0Foooqtebc+pPDKHlqOysQ9uT0UIO/Y22KOvVgU=;
        b=jco0PSf8w0T9+Vsw0MpOkLkAfBoaD9oLM9PIPqsTe5WzA7HIEJxFZ+b1igCmSM0rFb
         gJuc/vzETTYVyr6d02oeypgWxsMs789j6ZwrQdGPVik21eW+ATndNowtZ2IHuAfc2JNV
         xOc3/Za3s/53oq33d/GRCRDPvXK9LkPWQ7jtleiEuZcu7bizqFllebm/XvqNTAnvNpqO
         SB+J63XhCCx+ihcDwkkd9rai7d1TRGuvxPXHHZ/MGaiOb2LpAVTnz5D4NGtobvECCWdd
         b+/8RYBqS37xKlfIQF9PvmcgKIujbKPIhC2PLzGz9xOvTC9/vDJSB9DY7dGH9JMkyt1e
         GwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101619; x=1790706419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wiz0Foooqtebc+pPDKHlqOysQ9uT0UIO/Y22KOvVgU=;
        b=EZZM1XVz0LbF50jH9Qukq/GiQA3c5OCCmwPLIPlHAOK/SixXNddP31ot2vvhS77Apd
         JKermw/d9YJ6g5sGkY5nnjmEHqEMQrxGwFmnYIkcHF2giR9XMgALKmOLzlPuVbKkGhFE
         FvxLXKd+tQs4H61FJ86hnwTHyi6vOjMOFIPxDGoKCn/4xgZb8YVB0+JjfkksNBWpRJ8A
         phti/dkSNe7U7jG+58FLxiY+CSCf4dNL3ZHXY2cGrO1oN6LUvWhp2MepfbcQMnd25AtW
         e+QWxkZceXghr6OBuILOu2q6kPuPivhW+6ipqGD+Z+6tVs9vfTSBHdS71eHMDTJHHN9+
         GEgg==
X-Forwarded-Encrypted: i=1; AKwUvByCRu/ubh/GvYo9WoNYfTEJFJD5rK7/jJkyZGAHc74hoCBESSveGh7qyCBhFixRvOSDlvKaVXE9aBzz5is=@vger.kernel.org
X-Gm-Message-State: AFuF++mAS/JLH4L1cos1WRPQ0n2szguSwKxdoqVmrpEgpgLxQaCnUbqv
	w7MLv6AllaI8OcfW57nssi9KJ7QBvEg6m/g9sDeCzM9Whhj3HZgQPejN
X-Gm-Gg: AYBFou0wAc9msNOmX2AQncpZHmbSjaMZHIy1aGh6hJCbB03F0sLcJsHo7xK8+YEZW2x
	uRp5BVSkQXum3yF7KAVjQ1cApSJd6tXdSyRTnyLc1XuPSuMmPdpNQj/054EWJvemgaIfmQf3C5O
	EAfbpXMePLAnhFiEYlO6IOTQHioKP8Oz6oYl5agIURBfDuornYm22g/fqMn/N8JOr92WZsKURtc
	vKvAC8q2vaHA+hd+EcB1YeaeAoxNJ5eHwkNHs/LkZ4YOh1XJXixd67wLyo0dSaweAASN7DZXTag
	JUtObqj5jN2YxJwGs2NerLRPdWwggJ1HRcHNJ7v1rJWb2L6BTiziqdKIOw6V2bWZn5/HfuJrzT+
	4uFnsuxGVxBPsUdHtmqgfjUScrKiwtYsqcN/dZoEi/Xe7tnWzW0QdHkLq/RRsKxBQPV4w6lj/uY
	RMw7I0CKnZVr+z8YlqlvccjGHc1U+kDV+zGPOrYYOtmprXz2KJOIbt+4yquik9kii1jI9vjmbbN
	KWZvz6HOTyxL3muBP46Ms9k/4ZTYIhX1X9tuJTa7AhbSqd5AquxlRr/6rGW9cyJScW+Bm18cV3t
	0bYJH5CwyEZ9z14gAjR5wIyH14IAtdVoavKXBsAbNZ/phMRsJcr3hGzTLPSlK8Ll3WuT/ZJ0Lg=
	=
X-Received: by 2002:a17:90b:6cb:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-3a07e4a0c36mr280315a91.4.1790101619120;
        Tue, 22 Sep 2026 11:26:59 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07f820fd0sm24499a91.2.2026.09.22.11.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:26:58 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Goergens <matthias.goergens@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ata: libata-scsi: bound the ATA passthru sense descriptor writes
Date: Wed, 23 Sep 2026 02:26:55 +0800
Message-ID: <20260922182655.2423663-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an ATA PASS-THROUGH command to an ATAPI device fails, the sense
buffer holds the device's REQUEST SENSE reply, and
ata_scsi_set_passthru_sense_fields() trusts its additional length
byte, sb[7], when adding the ATA Status Return descriptor.  A faulty
or malicious device can use that to make the kernel read and write
past the 96-byte buffer in three ways:

- scsi_sense_desc_find() is passed sb[7] + 8 as the buffer length, so
  its clamp against sb[7] does nothing and the walk runs off the end.
- A type-9 descriptor found near the end is filled in unchecked.
- A new descriptor at sb[8 + len] needs len + 22 bytes, not len + 14,
  so len 75..82 writes up to 8 bytes past the end.

Reproduced with KASAN under qemu, with the emulated ATAPI REQUEST SENSE
reply patched:

  BUG: KASAN: slab-out-of-bounds in scsi_sense_desc_find+0x1a5/0x210
  BUG: KASAN: slab-out-of-bounds in ata_scsi_qc_complete+0x1a15/0x1a50

Both are gone with this patch, and a valid descriptor is still filled
in.

Fixes: 97981926224a ("ata: libata-scsi: Do not overwrite valid sense data when CK_COND=1")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 drivers/ata/libata-scsi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
index 7e22bbc38238..40e56ff52f09 100644
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@ -261,12 +261,18 @@ static void ata_scsi_set_passthru_sense_fields(struct ata_queued_cmd *qc)
 
 		/* descriptor format */
 		len = sb[7];
-		desc = (char *)scsi_sense_desc_find(sb, len + 8, 9);
+		desc = (char *)scsi_sense_desc_find(sb, SCSI_SENSE_BUFFERSIZE, 9);
 		if (!desc) {
-			if (SCSI_SENSE_BUFFERSIZE < len + 14)
+			/*
+			 * The descriptor is written at sb[8 + len] and is 14
+			 * bytes long, so it needs len + 22 bytes of buffer.
+			 */
+			if (len + 22 > SCSI_SENSE_BUFFERSIZE)
 				return;
 			sb[7] = len + 14;
 			desc = sb + 8 + len;
+		} else if (desc + 14 > sb + SCSI_SENSE_BUFFERSIZE) {
+			return;
 		}
 		desc[0] = 9;
 		desc[1] = 12;

base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
-- 
2.55.0

