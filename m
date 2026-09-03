Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4CD4E3781
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449802; cv=none; b=KRYFz+AFtEZuW6ZtIUuUJvnCr+g9htpKPqIVZdnSoQP1mIINsCuvkXq68b6uSp12AcPODYA06y0BK2h8fpJgp8n0ulUHCzFttZI4PQmp2nVa/75NdfGEU5AhRHzIMlN7T/wvJHEr3ibs0yb8RtthFtes92c5qYVryqreRfzJ3Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449802; c=relaxed/simple;
	bh=dxgTuRXIg9MafPzhR81UeFG4+538SkbvTi0siu7dZuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N8YoWL2Z1E4hZGxllGjYDtv/ZEeQbmnxPX4Mt7lS7vKr3ZO0fPkkvwOvF5grG7UsNuC5c+wv4FouUgzB5p4N7pIk1ySYaCB9/H/X7ik/wbyLOo+gK0ejKGBdz87ufHUs8hE0cO8Tn48gn4U9cgA4R220ss5YcxlKT2VAyAF3Q60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zd9lmOhl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zd9lmOhl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso21006215e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449799; x=1789054599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UMmi9ENN2WjM1s9qjAy3S5/7V0uR4HETS3+LJLK/gWM=;
        b=Zd9lmOhlC2s8Je3Q6i/+Gw62t0rA+xtQcux9KrIyYS53s+D1ikBI22WxMzoQbQn+9X
         WvjmYFrJ8D028QN85RJ3yX9+d1+LfV5LE19uQ4No0PENGehdANpl+azMnG3LqjYoHKSO
         rge5i1HFvrMRmUmf1c9Y2Mr4UkzC5DGd1juyNUzpr/+jEpOE2vgPChTSq6X2yc09ovy+
         kS2YS7USNaUFeYd7ItH44EsV+J7b40AzWLnzd2Q/f5VmNl10sPcpa1IsK4VXWZoNhOYb
         xdFqSAqAC+OeYz3jz1KXikKepsk7MSS6A1oc1BXyT8ZfG9vqYKdJAB+3SOVLTZzYs87O
         ndfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449799; x=1789054599;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UMmi9ENN2WjM1s9qjAy3S5/7V0uR4HETS3+LJLK/gWM=;
        b=KD2J9xa7xslq3YQCn/o2aX19qaeHNL9OL/TgOPbn2byA5JH7anFVsknYWPA6Rcn6VH
         AYMb0/AnC7gve1evprbfQS0HD0lD1ibq8t8eKweAVxdzzHwqyVkzIecEywy8kcUlVD1a
         kQvHtKiSXwg2acFhiQEK4r4yi8KqfpaD6JPyT9EE2Epo7Zwd93EdpzI73TbNGtexoic5
         HtiExAOPUF5/3SR8nMAXWMdiQnjmtyIe8i2dt5vuC88K87XfWDUTLVeGO8eb1CTCtTn3
         VpvjW5WNZZuFi1yM3CJp/awvKof9ArkDTdOtDo5S2t43NZQIiiwKWjmucfaaEtOI883p
         RYwA==
X-Gm-Message-State: AFuF++k6WjD28sG/xSe0PnY2xvzwo1PN36MUYzVqUexo743TX2dObq+0
	vYPPeEI2sqNcMijRfk8F5vEs/2AktlNYU2KxlZy86cHeiAtwkAQuqgIBpqTW
X-Gm-Gg: AYBFou3EzmP2rZFs2eb+za9F9K4MRVny/BBEeHiehB3Y4VUv7u3g6FnGX5f0Xj7J1d+
	HoQlFGvVHX1BdKjNFfVN94M8+KMeI+4hWrocelVw2FGuS0FYq+HSaK7rt7is4Ou2AlZuOe4WqHT
	F/HQ4NwGMmZ3TPm6Ou9sigAzI0h2XGlIVAeEGNNQo54O9IAXYilm5XjmK6bfRcMerY+S9eIUEU3
	GgrpXe2wuMBqFt/dPL8dBo3ZrqNA3he0Hz6CTllgcZO/ieucRqe/e04Dqt4/8qsnq25DULACSyV
	OtC/KCNxps+tVHW/8zqATGRPx6E+yM9g8EXQNLwVE5udztSgWElEbo+8A4HRpxqXyBUjmTKVdbg
	PECbZzWZFr2x/5IH/iyjGvZORGfnIpEn/WLNkBePjRUUSKjrHEyE75vDUclWb9DzceZJvh53/EM
	fpOCa3IB/rakpYeDk7SbtaoL/q2C0Zizxq7hv5+kh8fyvbIENVYDXkKSsSpTON8WjbEQjPpRERA
	psewGeVLMfcTWhD/x8uou1vqsljkN1xCrl/bAuRkddGZllV4RIQ5c4egXYtIgXwnA/NLThc/QFV
	zF5y
X-Received: by 2002:a05:600c:4e8f:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49ce57f5647mr199297695e9.1.1788449798654;
        Thu, 03 Sep 2026 08:36:38 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce831af89sm75568425e9.1.2026.09.03.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:36:38 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] wifi: ath9k: batch the read-modify-writes of a channel change
Date: Thu,  3 Sep 2026 18:36:16 +0300
Message-ID: <20260903153617.990995-5-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903153617.990995-1-nerijus.bendziunas@gmail.com>
References: <20260903153617.990995-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ar5008_hw_set_delta_slope() and ath9k_hw_start_nfcal() both issue a run
of read-modify-writes with nothing between them that reads a register
back. Both run on every channel change, and on the USB devices each
REG_RMW is its own WMI command.

Wrap the two runs in the RMW buffer so the transport sends each as a
single command. PCI does not install the buffer callbacks, so
ENABLE_REG_RMW_BUFFER() and REG_RMW_BUFFER_FLUSH() are empty there and
the writes are issued exactly as before.

Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/ar5008_phy.c | 2 ++
 drivers/net/wireless/ath/ath9k/calib.c      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/ar5008_phy.c b/drivers/net/wireless/ath/ath9k/ar5008_phy.c
index 7a45f5f62826..af05dcf95a61 100644
--- a/drivers/net/wireless/ath/ath9k/ar5008_phy.c
+++ b/drivers/net/wireless/ath/ath9k/ar5008_phy.c
@@ -868,6 +868,7 @@ static void ar5008_hw_set_delta_slope(struct ath_hw *ah,
 	ath9k_hw_get_delta_slope_vals(ah, coef_scaled, &ds_coef_man,
 				      &ds_coef_exp);
 
+	ENABLE_REG_RMW_BUFFER(ah);
 	REG_RMW_FIELD(ah, AR_PHY_TIMING3,
 		      AR_PHY_TIMING3_DSC_MAN, ds_coef_man);
 	REG_RMW_FIELD(ah, AR_PHY_TIMING3,
@@ -882,6 +883,7 @@ static void ar5008_hw_set_delta_slope(struct ath_hw *ah,
 		      AR_PHY_HALFGI_DSC_MAN, ds_coef_man);
 	REG_RMW_FIELD(ah, AR_PHY_HALFGI,
 		      AR_PHY_HALFGI_DSC_EXP, ds_coef_exp);
+	REG_RMW_BUFFER_FLUSH(ah);
 }
 
 static bool ar5008_hw_rfbus_req(struct ath_hw *ah)
diff --git a/drivers/net/wireless/ath/ath9k/calib.c b/drivers/net/wireless/ath/ath9k/calib.c
index b4ab85bd7895..73c63ab32d53 100644
--- a/drivers/net/wireless/ath/ath9k/calib.c
+++ b/drivers/net/wireless/ath/ath9k/calib.c
@@ -224,6 +224,7 @@ void ath9k_hw_start_nfcal(struct ath_hw *ah, bool update)
 	if (ah->caldata)
 		set_bit(NFCAL_PENDING, &ah->caldata->cal_flags);
 
+	ENABLE_REG_RMW_BUFFER(ah);
 	REG_SET_BIT(ah, AR_PHY_AGC_CONTROL(ah),
 		    AR_PHY_AGC_CONTROL_ENABLE_NF);
 
@@ -235,6 +236,7 @@ void ath9k_hw_start_nfcal(struct ath_hw *ah, bool update)
 		    AR_PHY_AGC_CONTROL_NO_UPDATE_NF);
 
 	REG_SET_BIT(ah, AR_PHY_AGC_CONTROL(ah), AR_PHY_AGC_CONTROL_NF);
+	REG_RMW_BUFFER_FLUSH(ah);
 }
 
 int ath9k_hw_loadnf(struct ath_hw *ah, struct ath9k_channel *chan)
-- 
2.55.0

