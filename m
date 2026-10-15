Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4181F2F7F12
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792025861; cv=none; b=GYIA0vTgPNGtIvr0EAr6uoNVAqO8D1pwP35weeFqyOHcm1JK1+Lz+4mZzNcuG+uqqC34b75kOKb+F3KAy2KLoEZUk3GqhE4XJT5ZOFHNPZYsdtqRZxThf7281ih8wEZJNuQvKyhgi9X1cYYjKP697YB7pn0pUp22AnJxvD0CjMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792025861; c=relaxed/simple;
	bh=/0Th4cc1vO+E41gV5mMuaLCXH78VA1Yl6fBR7oSaQAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5rf+GqXPSeea0+17I/kaOuBhCQ3oDxZI/d1LsbIlcPuI1VwjWPX6nXI04vgCsBFpmKTEj3KKyVj1LSzBeu3dYnxjy1BYh3M4PLb+VB1+3Id3o4x+qWERnVUueHhPmsPllzoSA70vGTXYbKf62dXvNF28i2PqifRdAsnaA6ijg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=b3y2O3NY; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="b3y2O3NY"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so3004266a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792025858; x=1792630658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPVBPUAW/BeX8HkZROCJHuR0r1MMomkKnirbqP6fatU=;
        b=b3y2O3NYh4fc6e454A6HE64TJwOyI2zRi8iFlPIN4exMBDQDfp0fU6ZXA+JwnAWpSv
         td6ssSiA4y0d2ETX5GHkhsJo198SDCebX3VU13pciaqTuROHT4je1ytRL3sinHgaFhxz
         OCFxix0ZdjBDmoMEpywvjs5fzwrce4AqDml1yJhgJMcMP2QxECxSRWa+E0xppL5GeS1L
         djw+5Xwbp1CPC08I8HURptXFSKrsFmdOZA+ZURiZWt3tEMaCqmJqKxWTI6NoWy9jKfMk
         LFU3zhuKH6nMBb1aVl8jyQcUccpfywJ2UIF4Pf5hbRDVzkBCmI9GTMCmkQvlmbAFVuRi
         KE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792025858; x=1792630658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPVBPUAW/BeX8HkZROCJHuR0r1MMomkKnirbqP6fatU=;
        b=zTMJW/U2Ymma4Q6rIzw3R3b6R8HVh8Vp0rxAdv+oz7LY6EUSsxMkWztHASTOhYcZdT
         v/m2sxCF+yOU1Rfqws6eF5JWtrjrQw3u6WqxO1U85ToiYY2oz44ZMEfEOGsNXaQ5ZKjo
         cWoWk7SrJbeeu5419ztE7KNjxEo2dS+pa6UysB16eDrN2LfgQyNJMVVjPVUOzDa/5WnU
         D3iPMUpGfZm7EK889bYW7k1a6ZU1k5GhzYcfPBwYVZSt39V9eTUxKUYdh7fj2k858yKC
         4RWA3aG84UW5Vgb8NwVDyRwpQkAHU/xgvHr3j9X60/68LVsGqVOpUe9kb64c/N8Po9nh
         Zpyw==
X-Forwarded-Encrypted: i=1; AKwUvBzjF1I51AYgs6Z6nuGF645Y1fJF2sedtQEHnmUA4pjB+BsJNWqqQW5r8/r9K70PhaL69o0+wTb/nZcXAbM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBz3ydLBYoLiRfe2NkHNrzuxEFJ2kz/maFXOtWhI8S71w6/fcN
	4eqCmvNjQY99wpffklQNImtCcHCCiaw7B3DSoS7Pqzq7yOgW1WBk8hDp9BHINd19XaQ=
X-Gm-Gg: AYBFou3bIA6IHlWd4nosQ2XVDUxylwJEDKs+B5ba9MsTQT1v37ORRZ2yehO/LFkq6c2
	XKVCtR+11GpOSvpmNCdixLOFWZpeP5WcWlscBLLf5I8sDGUfmRJc1BqN2zzlk1zcmEFNGiyItq7
	uPpVxImxLXrhzO+fyjf2G+BUfi7PG7XxNtdjVaE3LjpwUOLqv6swKsZ2Cw3QpjX5A9t/eVlcUwZ
	Ev8wmRtap1Rbc+FqOrBkMn78fZR0OpaSPP+fzqsgBsGuK5gm+sFFXGZ6w4r+vr5EV/q3U12z19P
	HvE3PNlJ1UldlkEYFw7cyAB48BXuY1ENcR22Wve2xsuYmTCWQLDV+/ak6Pd/RCK8Zj+6fmlAcwa
	YXq3ytZ9nghKDXO7yLjAkhrCVsNdMYn9Ik7XB43y+UeU4gs8094z3yhlUpQ7oBYA2Thv8WCF1zi
	71AMeyTJNLZAMv6yDuqxpqPX0qZGdpTilSY9d5g0CujuEPxDTzJ2myyYVO6EHwYnonfwipdj6mU
	LAWew==
X-Received: by 2002:a17:90b:4a8f:b0:3a0:becb:914a with SMTP id 98e67ed59e1d1-3ab3a359f4bmr15112664a91.3.1792025858605;
        Wed, 14 Oct 2026 17:57:38 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm999198a91.0.2026.10.14.17.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:57:38 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v7 2/7] scsi: mvumi: reject an out-of-range handshake frame length
Date: Thu, 15 Oct 2026 09:57:12 +0900
Message-ID: <20261015005717.3719956-3-yhlee@isslab.korea.ac.kr>
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

mvumi_hs_process_page() checksums and parses a handshake page using
frame_length from the page header, a u16 the firmware fills in, without
checking it against the HSP_MAX_SIZE buffer the page lives in.
mvumi_calculate_checksum() then walks frame_length bytes of frame_content
with an unsigned char loop counter, so a frame_length of 256 or more never
terminates and the probe path hangs; values between the buffer size and
255 read past the page.

Reject a frame_length that does not fit the handshake buffer before using
it.

Read frame_length once into a local and use it for both the bound check
and the checksum, so the device cannot change the value in the DMA page
between the two, and use READ_ONCE() so the single fetch is guaranteed
rather than left to the compiler.

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 38a92f8c25f5b..2378b676a7a78 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -1039,9 +1039,15 @@ static int mvumi_hs_process_page(struct mvumi_hba *mhba,
 {
 	struct mvumi_hs_page1 *hs_page1;
 	unsigned char page_checksum;
+	u16 frame_length = READ_ONCE(hs_header->frame_length);
 
-	page_checksum = mvumi_calculate_checksum(hs_header,
-						hs_header->frame_length);
+	if (frame_length > HSP_MAX_SIZE - sizeof(struct mvumi_hs_header)) {
+		dev_err(&mhba->pdev->dev, "invalid handshake frame length %d\n",
+			frame_length);
+		return -1;
+	}
+
+	page_checksum = mvumi_calculate_checksum(hs_header, frame_length);
 	if (page_checksum != hs_header->checksum) {
 		dev_err(&mhba->pdev->dev, "checksum error\n");
 		return -1;
-- 
2.43.0

