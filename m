Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F8348BD20
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912723; cv=none; b=gJ+lBAc5qa3aq5sJ3f7cZYz8smdX5zRXkh07X3sagjjhYU6gSQozzfPAn+SsXAVT6u2YgHM0dhAfUqJTklFFeXXKFWf1lKz8y6zaglz1wNbnyOPPc21AEmn5nd3UceADJmZTAC2hMOUY2/kE6plv0bhYBPY0tDHoMT50NIIfWhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912723; c=relaxed/simple;
	bh=mZ+27cf/ial1Kmh8g9YuKRqBc89avEfQ355XOYWXwMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZQt0ppMjNvDBoDBVvx/OK/wFvXU3soWlopMOGdlk5RF1XKA3w8MfA+2I4IzdHXVZHObcKFjovsaJptKYqXeV8jUu7EIteapTcKIeCBrX2dPwYOl3l80kEU3lMFrqx+K+7/Qzamd/SvuPzibqJ6FoHAxxHIIaf5owmufBcPrDHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=Thp24BMc; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="Thp24BMc"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-88b7d853b11so2087103b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791912721; x=1792517521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gF7titqAQOhWgf/cID4J3N6cuUz4241e7eJ9tfRVLQ=;
        b=Thp24BMc++oldWYY5fJ7dvx+TdCjnRPA4JnxFYP9mLFe2Yt5QA1V4bkIt29GoVaFAH
         yX2JegtgW4zGXUBgD9KTzqhGSczjsDkvmra5VVMYGV5trlrTQou7NbmiBOIlpiKJ9ARb
         3Q9RTwS1376Hzf7gyxY6VX4u4iwQm/r5yYYa/FpgRAOrw/cnMiGuSWzUwquh09vdYt3d
         K5o65iluAV+5+gRAMYSLF/sdSo8/pVCmfXcuB/SZ776bmArJ4ffEw7XYh4vjqEI0NJiW
         taYkdd+e7Nibxm00WEsg1XGqCQgHMMVSRiwQViulwzdLqSzJPP3FjZXB2SkPXowdFXdK
         b5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912721; x=1792517521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6gF7titqAQOhWgf/cID4J3N6cuUz4241e7eJ9tfRVLQ=;
        b=NCEMb/o9BuLPLekAGGNWpD+OJqw1d8WIPvPM8CERTL/96Uf7yKWXIsSF00/0r1akjS
         EbjsayA048KUlqczocwhanCJTKUfnl7X4Znd7zs8x0xeIFUhbb3tamKqyKUeKCkHPE8C
         PcoA4+VyVVttLRmB8dt8GhMrqlxKAmmaMZ5rmH5s4OxWur5lAYUk0vG1A1LwY0+2QmBl
         Vs4aoS0XxvPJ38dQHPWij+CBiCEL9+jKpjey7ckfi/AncoF556feDqDNQ0v0wDyPzq4k
         NaeYISP3fGB0vidu9DV23dI4HnBcSw7L4Lp8j1V+gS3DHm3jXMeD3AzYAqNKsgfd0sUR
         DYsw==
X-Forwarded-Encrypted: i=1; AKwUvBzREtYtLhMj9GgoK74Kt2rVNYqL1HXeBEBXY8CUq0Z+KPXb4D5FxpqXam118kOn9+3uVFH4I77mVbDhB6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRdJ0yqATvct0rdeY5hQAA/I1niRxVZWrOK+12O6ZjJL8DpvII
	/FfBnUgyuvUyIGlaNRM4h47gGVQ+Fce36R44beJP1BwQNE/I53YMs4gEFn9hlN2ww3U=
X-Gm-Gg: AYBFou1ovWqR/N3y5JMrDaNcaF5oPzjQwnqRZNEpHAupLKW6T8JgP9Iiq9llJJbq8Mf
	9zpXh5trM5vLOKL1q42OSeMgvWqhk1lL4ArGozwXrOXM3AJ9Ykw37asDO7irm1ENaZ/fVFH8ws9
	/e8A0PXVZIe/fD4o+mlU1qLAv7gWKph9ry3A7D6PjFjo57eEJyuiRZqxxzt/cEuKB1gbskEF4f8
	/9M4tLwK0HhY+36zub/PnS0mW/kFqX+6+dDxzmc9hEudkEM1uzZ2ijvISA0miPIwZR22Nvgbeev
	S2u0q6JFJOPsfG2EzSfak4m/bAsJ9Wwo4wDPmmx1nrVJYnkdWwvGuMY4F1f1J5uGrtSDI4fTyGa
	fDhE9nk0V/X+nrgZP2XCdMrbqL5QdTxZkIjjtHQopnY7PFrEnEeCtV94F8qBXp4lj26fp/xv1Aa
	CvbcUwiXLseJWc/dXpvaXgEOZXlgbfzeQBUIVVFk8xiu/FUCphI9rvxS9BzN6GoIbGRKSzaMYZk
	15SruvhWVcHafu6Ui2Ykwh4z02iNNo=
X-Received: by 2002:a17:90a:d006:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ab3a2901c2mr9313055a91.6.1791912721027;
        Tue, 13 Oct 2026 10:32:01 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6019ca59sm607396a91.9.2026.10.13.10.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:32:00 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 2/2] scsi: mvumi: reject an out-of-range handshake frame length
Date: Wed, 14 Oct 2026 02:31:45 +0900
Message-ID: <20261013173145.3412863-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013173145.3412863-1-yhlee@isslab.korea.ac.kr>
References: <20261013173145.3412863-1-yhlee@isslab.korea.ac.kr>
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
between the two.

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 38a92f8c25f5b..910505ef4f3ee 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -1039,9 +1039,15 @@ static int mvumi_hs_process_page(struct mvumi_hba *mhba,
 {
 	struct mvumi_hs_page1 *hs_page1;
 	unsigned char page_checksum;
+	u16 frame_length = hs_header->frame_length;
 
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

