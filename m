Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12333C5833
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900157; cv=none; b=STopFfy9lDoiwL45aR1v2YfeYe0Tc0i+iTccfsj0skykSlKfAq2/6yy8RsoJ3LjVSJBoK9C/Ambco7moUeX8doprlyCxq7v5rZjAf58R/XHLYGLF1uAqXpzGTQI8ATHpi8oATKRs7smKIENHME+WohDtwT1Ebk7lbmoomSKeRS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900157; c=relaxed/simple;
	bh=1fPGSy2gCY4+NnIDtWYS1xEOb8mLeLGa/eJfNd+L12I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KIGg7xhot2EvFJxHp2yEoUaz7C7PoJuGwIiUx21Z4075PwO9fgvqQRkzz9EiMXbip56eQr1uFgs8f/B4BVI7zNXHLaVdZCwGPkE65c7cWc6a4Wof4PysoDMuLsYDVpX0eDHhjxyluhPCtjE7J1dJre5NK/AS1/HQmlAUbYDTxlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=WlOIjDwk; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="WlOIjDwk"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db710396ffso28725735ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791900155; x=1792504955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qeI9NvOsFwArQ2zk9ob7BZcHn+VlKHqwrYxnGf5soGE=;
        b=WlOIjDwkSDPyWAzxAOtUM5+bzdr/NTK9VjXbetbqsy9LfOZR9aixPWKj5d+bgnDKX3
         en9h1L8JFLqk5bKr5TK7fwsGT2yw5ZZ3EeDeCYGPdP1+k/LqhGvKveXfr9LiLIU57NTF
         WFkR9K0onA0fkzS42vYb4/du9knjwLDnkndpGe7hLPNZ3zUq1DaGuUNHA0LJAUUZdaIv
         WBBpuKEigvq9Juj+CZDJE0+fKNoWZpaxZ1HEIZoePBzKn8sxfG4tgs/+0E0rwIX1wc4P
         XlTCkNkV6GxLgQFonn1Q9ylsf56BVE2nvkQe/aZNiBvuKHtgqeH192H/u35grkfnTxlp
         eacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900155; x=1792504955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qeI9NvOsFwArQ2zk9ob7BZcHn+VlKHqwrYxnGf5soGE=;
        b=sUbWcB5Zg2DEwGWwbti3LjtKZht3+gt4HtaZOAAmRg0uFbT/wQApPJq7wUUZNunY6s
         8EYCykWYmn5HnhrhYLMW8FDqqfr30RctZGDixpmPneXcKoJdDquH5yr2/ITdl04Bb12U
         mWp1T0LCkfBXqwD+OCM+u0eFZm/6BptvmHM92QvOe+TNU67e1wdt6/kvQEdoj+00hdkR
         gsM+Yf6QCgFjhx6hd6FeKwjTKQBqipUzWtXtlujsY+FwKaMBXi4Y1q/soWwnhxwv2DMH
         Eq4XGBwMQ+mm/mXY3PhTky9a+1Wr32NKNE2SZRZrsMRGxRGOEY8nHlyRQq4+VlEmBS84
         1wlQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5elFFqLFYdh+7KO+r93ROFA9XhtmboNI5UKifyJlYIlNTf+bZfvmrflCgnYuYZiz27PfAnyuzpyBSFaw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfKJ1wITaFKtDV+rjVF9kAgi7yv95ppsVL8hftzGd3ki9laNT0
	rZGbAAI3miiL6gq3pL53+7BTTM+j8cqemsxNRCSztGYygxa6C1NjOdmnxSRSq0WmpgU=
X-Gm-Gg: AYBFou1ckgMJG7PlQhVJbR9Q+wRkYeB4k74DN+26tzfZZ8lnqmYzmMA6YnkcwvVgKp+
	y4A6PRgzwiZxnWQxdAphCFgZR4mteOHcSfhnsYm3Sqltwh3ENrIv2aJroeP3JjeQ4gaOcJ5HXkm
	zrUPa8ewhGXYXnQf+I5MeX78Vn0w3W6+u8BRpc1eFEcesI4HA+B0ibrDijs3ioDFaN29FC3yEbS
	VVKcz5K7gX236ecz9nsfTdtLTg8zUxeN7zUkBdBTUaPTzcBEaJkfDHGPLpkEaJB6cWSbF2oxYnq
	g02P31KpT7Ov7VZIm7rYRY3V2hRyWcIEpjNEJ4U7VFy+ZQB20bg9cykaF/8R2xiMW/SPzrLMdni
	vAhEdPSfu+gWPiA10IkdMZJ8SmdCuyUv+EgRBj6Uey5Lick0z8KqQRJYZrPhO4PiqAmB3UWvt7A
	RwubbtHDvRACK3vCdOpnFRfnRo6gjLDJDrEPzc3WomitsiRBPcraPraQq9La75lWWw4sVKgUK+G
	BsTqIzbSXQPCqMUQZTv
X-Received: by 2002:a17:902:f786:b0:2e6:f3ed:a551 with SMTP id d9443c01a7336-2e842ac436cmr75551955ad.8.1791900154923;
        Tue, 13 Oct 2026 07:02:34 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a02f85sm56433065ad.10.2026.10.13.07.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:02:34 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
	"Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH 1/2] scsi: aacraid: bound the SRB sense data copy to the source buffer
Date: Tue, 13 Oct 2026 23:02:13 +0900
Message-ID: <20261013140214.3156938-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013140214.3156938-1-yhlee@isslab.korea.ac.kr>
References: <20261013140214.3156938-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

aac_srb_callback() copies the sense data from an adapter SRB reply into
the command's sense buffer, using a length that is only capped at
SCSI_SENSE_BUFFERSIZE (96 bytes).  The source, srbreply->sense_data, is
AAC_SENSE_BUFFERSIZE (30 bytes), so an adapter that reports a larger
sense_data_size makes the copy read up to 66 bytes past the sense array.

The reply is placed in the FIB data area that the outgoing SRB request
was built in, and that area is not cleared between uses, so the bytes
past the sense array are the previous request's scatter-gather list --
DMA addresses and lengths -- which are then handed to user space in the
sense buffer of a pass-through command.

Cap the copy at the size of the source array, matching the container
sense paths in this driver.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/aacraid/aachba.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/aacraid/aachba.c b/drivers/scsi/aacraid/aachba.c
index df9492247631f..89d8e33517584 100644
--- a/drivers/scsi/aacraid/aachba.c
+++ b/drivers/scsi/aacraid/aachba.c
@@ -3418,7 +3418,7 @@ static void aac_srb_callback(void *context, struct fib * fibptr)
 		pr_warn("aac_srb_callback: srb failed, status = %d\n",
 				le32_to_cpu(srbreply->status));
 		len = min_t(u32, le32_to_cpu(srbreply->sense_data_size),
-			    SCSI_SENSE_BUFFERSIZE);
+			    sizeof(srbreply->sense_data));
 		scsicmd->result = DID_ERROR << 16 | SAM_STAT_CHECK_CONDITION;
 		memcpy(scsicmd->sense_buffer,
 				srbreply->sense_data, len);
@@ -3544,7 +3544,7 @@ static void aac_srb_callback(void *context, struct fib * fibptr)
 
 		scsicmd->result |= SAM_STAT_CHECK_CONDITION;
 		len = min_t(u32, le32_to_cpu(srbreply->sense_data_size),
-			    SCSI_SENSE_BUFFERSIZE);
+			    sizeof(srbreply->sense_data));
 #ifdef AAC_DETAILED_STATUS_INFO
 		pr_warn("aac_srb_callback: check condition, status = %d len=%d\n",
 					le32_to_cpu(srbreply->status), len);
-- 
2.43.0

