Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B85F3AE6FB;
	Fri, 25 Sep 2026 07:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322451; cv=none; b=hn0zPaZTQk9P5/AdpTvEXlLJg8uHRqAwn6o6yeO0OW1p/U2mwRd8JpTxGifpKIOid7imeW0xfoz6SkbhLy5sXqUHI5N7R25PHtGJfE92R1/rWYK2BUP/P8q5AmjguW9mtuzBrRyOoip9l0DvERRyVGMhOsp/KWq6y87XHI74I4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322451; c=relaxed/simple;
	bh=ywXSh6Lz8CXx6v7UNu/mihoNA23yGVHQud2HU1sdPaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7xvc2W/XA4mQxlkK5/bDCmVtNOh4Td7H0UEjZtIp0CcIi876d6XKdI0BY99i1Mapugw3ER9My8MCuNxvrwrKcvBky3f5JJFAC8jfNNJAIe3SJZj0phjmc1deKk3iR8vdzM3bBgbjQ7KlIQul6b2Lrtawbmqst9daJr3fy/5mxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjGT3i4u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjGT3i4u"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E719C2BCFA;
	Fri, 25 Sep 2026 07:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790322451;
	bh=ywXSh6Lz8CXx6v7UNu/mihoNA23yGVHQud2HU1sdPaQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BjGT3i4uhTHsflzTtVPS7EYS6fp1FLjFs8ubQspFtqCpHRUTS9J3BPkEOkmlUJk1C
	 pcqJzujoOz40ThZw6n4XD0N9c0/cIzKRRlsGlXHLERFlu5yv83cyZ8ooYS/cipnVxV
	 UC5j1pdlx7EBTbpz1zdbB4cds3ITnxhbH+1brLX++Fnkazi/5j4F8xoBdJduwrg9UG
	 H2zsKzo9JyHjiSXkLvMqhNTubqoNJHyDzdQZLf90lKrpl0CmMkfNWDmWfUl+/EDvOw
	 cu1SyinDXFFS5UiCny1EFUCMilmt+gkm+MS4vODskNSm6FToxKSVncc5OQo/sF4xQ3
	 2Kj3hyg9SJ5fw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8047C98328;
	Fri, 25 Sep 2026 07:47:30 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 25 Sep 2026 02:47:31 -0500
Subject: [PATCH 3/6] ASoC: codecs: aw88166: reduce log spam
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-aw88166-cleanup-v1-3-11f74cb5fe28@gmail.com>
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
In-Reply-To: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Val Packett <val@packett.cool>, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790322449; l=3193;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=06CCnQwpf2cLwzkmShv7cYeY0TUnVK2djZoAk9gCKNY=;
 b=tU1vmXqjtE1HIHlzJ77jF4MvN28kJshUvwgRIKmYP+Xx7Si2SOeQ4BS7ax+BOiM2bl2lbXbLg
 orFDQ6FN/9VDiGSk5sBJ9PRc2E3oVYRSnt6BJYFTb999+/uwLLZkEx9
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

This driver would create a wall of logspam during initialization due to
e.g. the PLL not being ready while waiting for it to stabilize. Change
intermediate dev_err() calls to dev_dbg() to reduce the noise.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 sound/soc/codecs/aw88166.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index cd8773e316b90..c8b8c70aaf356 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -108,7 +108,7 @@ static int aw_dev_get_iis_status(struct aw_device *aw_dev)
 	if (ret)
 		return ret;
 	if ((reg_val & AW88166_BIT_PLL_CHECK) != AW88166_BIT_PLL_CHECK) {
-		dev_err(aw_dev->dev, "check pll lock fail, reg_val:0x%04x", reg_val);
+		dev_dbg(aw_dev->dev, "check pll lock fail, reg_val:0x%04x", reg_val);
 		return -EINVAL;
 	}
 
@@ -122,7 +122,7 @@ static int aw88166_dev_check_pll(struct aw_device *aw_dev)
 	for (i = 0; i < AW88166_DEV_SYSST_CHECK_MAX; i++) {
 		ret = aw_dev_get_iis_status(aw_dev);
 		if (ret) {
-			dev_err(aw_dev->dev, "mode1 iis signal check error");
+			dev_dbg(aw_dev->dev, "mode1 iis signal check error");
 			usleep_range(AW88166_2000_US, AW88166_2000_US + 10);
 		} else {
 			return 0;
@@ -223,7 +223,7 @@ static int aw_dev_check_sysst(struct aw_device *aw_dev)
 			return ret;
 
 		if ((reg_val & (~AW88166_BIT_SYSST_CHECK_MASK) & check_val) != check_val) {
-			dev_err(aw_dev->dev, "check sysst fail, cnt=%d, reg_val=0x%04x, check:0x%x",
+			dev_dbg(aw_dev->dev, "check sysst fail, cnt=%d, reg_val=0x%04x, check:0x%x",
 				i, reg_val, AW88166_BIT_SYSST_NOSWS_CHECK);
 			usleep_range(AW88166_2000_US, AW88166_2000_US + 10);
 		} else {
@@ -754,7 +754,7 @@ static int aw88166_dev_start(struct aw88166 *aw88166)
 
 	ret = aw88166_dev_configure_syspll(aw88166);
 	if (ret) {
-		dev_err(aw_dev->dev, "pll check failed cannot start\n");
+		dev_dbg(aw_dev->dev, "pll check failed\n");
 		goto pll_check_fail;
 	}
 
@@ -765,7 +765,7 @@ static int aw88166_dev_start(struct aw88166 *aw88166)
 	/* check i2s status */
 	ret = aw_dev_check_sysst(aw_dev);
 	if (ret) {
-		dev_err(aw_dev->dev, "sysst check failed\n");
+		dev_dbg(aw_dev->dev, "sysst check failed\n");
 		goto sysst_check_fail;
 	}
 
@@ -1175,10 +1175,11 @@ static void aw88166_start_pa(struct aw88166 *aw88166)
 	for (i = 0; i < AW88166_START_RETRIES; i++) {
 		ret = aw88166_dev_start(aw88166);
 		if (ret) {
-			dev_err(aw88166->aw_pa->dev, "aw88166 device start failed. retry = %d", i);
+			dev_dbg(aw88166->aw_pa->dev,
+				"aw88166 device start failed. cnt:%d, ret:%d", i, ret);
 			ret = aw88166_dev_fw_update(aw88166, AW88166_DSP_FW_UPDATE_ON, true);
 			if (ret) {
-				dev_err(aw88166->aw_pa->dev, "fw update failed");
+				dev_dbg(aw88166->aw_pa->dev, "fw update failed");
 				continue;
 			}
 		} else {
@@ -1186,6 +1187,8 @@ static void aw88166_start_pa(struct aw88166 *aw88166)
 			break;
 		}
 	}
+	if (ret != 0)
+		dev_err(aw88166->aw_pa->dev, "start failure (%d)\n", ret);
 }
 
 static void aw88166_startup_work(struct work_struct *work)

-- 
2.54.0


