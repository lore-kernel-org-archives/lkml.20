Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894EA46DFEB;
	Fri, 25 Sep 2026 07:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322451; cv=none; b=QcnzoaRC6J9ueK/ZMRdE880LTWBjWsb2MepGkSIeT+fnkGeRFfDtHOdtgyXVEZn1Stv+Mam1v6I56cNYrycUmr5H0uwHCxbksRA8o4K8agkZvCRyjzFumjvuSTe4/LkBbxxThPOUYqVWNonXFmZB//aw1zYkSWrNP0u4F6K1xGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322451; c=relaxed/simple;
	bh=YjthoN1qZLBzjOMIZDzUekMPwN/+p+lQX/2srhLGyyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FdPsUkHpQjReu2s1tslpMHg2cpcZvIGcYeGkBlglhDjijJIwGZ/6rP+a1Kg2p0pGtvJEKNSkKnyKgES061FbYG13UpShi1WvsXGVqARs8Kn7ZMfWDoUudl78VPbpWNyi6F8HfB1rCxaWwGXRMfulFuotwjyXyOEA/bvXVFeOTIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbAisI5j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbAisI5j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25150C2BCFB;
	Fri, 25 Sep 2026 07:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790322451;
	bh=YjthoN1qZLBzjOMIZDzUekMPwN/+p+lQX/2srhLGyyM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QbAisI5juNXMkXz/xeN+KuRP+igBU4nBGReMq+f4Efs2T3L55Eoj5OuLZV2rE73JV
	 s0TmD+2JvTtIzGjTAkA5Ld/B/A5/waspp/RF6jb0IXdq1mphDAH0Q5MLjJcOrhglFq
	 k8e834vXmUuNpOXAjtDOynKCmZviZEDhj/TWwYJtYN6mmzxxVZIUN/6Wn/uBywWBAC
	 HkaNs/ik2qOOZRU173BS8O0gUKOL3M+gKF+SyDJiP1RFnwxc/XYoj5edKc38pvlS24
	 3xyubbBvknNUo/2j9wiLqlDOspA59HqbIlLrEx8TXFF82HspBOVHyeyHPVjtQnv1IH
	 oZ4roiNr7ZWQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12678C9832B;
	Fri, 25 Sep 2026 07:47:31 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 25 Sep 2026 02:47:33 -0500
Subject: [PATCH 5/6] ASoC: codecs: aw88166: remove async start
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-aw88166-cleanup-v1-5-11f74cb5fe28@gmail.com>
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
In-Reply-To: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Val Packett <val@packett.cool>, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790322449; l=3699;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=sDCJAoLxamcNTNiYmxQouA2118oXIyIUYJcx7v+00z8=;
 b=X4Zw/RPuhxCpYJYgCkIIn08Vy+tOeeBoniuFNxXLPEhEIE5A9mYSl0LiDrzGPzNwQpIDXGuT7
 ho0OJLNk0ZjCo1/QrexWX3h45zlwpb3C0AZPIwFag8C2HaCTqO31sPL
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Codec drivers are not supposed to do anything like this. The result was
that the first second or so of playback was essentially inaudible, and
very short alert sounds could be missed entirely. Let's not do this.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 sound/soc/codecs/aw88166.c | 33 ++++-----------------------------
 sound/soc/codecs/aw88166.h |  5 -----
 2 files changed, 4 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index ab7af3eaceb28..6b98864de81a9 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -24,7 +24,6 @@ struct aw88166 {
 	struct aw_device *aw_pa;
 	struct mutex lock;
 	struct gpio_desc *reset_gpio;
-	struct delayed_work start_work;
 	struct regmap *regmap;
 	struct aw_container *aw_cfg;
 
@@ -1148,16 +1147,7 @@ static void aw88166_start_pa(struct aw88166 *aw88166)
 		dev_err(aw88166->aw_pa->dev, "start failure (%d)\n", ret);
 }
 
-static void aw88166_startup_work(struct work_struct *work)
-{
-	struct aw88166 *aw88166 =
-		container_of(work, struct aw88166, start_work.work);
-
-	guard(mutex)(&aw88166->lock);
-	aw88166_start_pa(aw88166);
-}
-
-static void aw88166_start(struct aw88166 *aw88166, bool sync_start)
+static void aw88166_start(struct aw88166 *aw88166)
 {
 	int ret;
 
@@ -1173,12 +1163,7 @@ static void aw88166_start(struct aw88166 *aw88166, bool sync_start)
 		return;
 	}
 
-	if (sync_start == AW88166_SYNC_START)
-		aw88166_start_pa(aw88166);
-	else
-		queue_delayed_work(system_dfl_wq,
-			&aw88166->start_work,
-			AW88166_START_WORK_DELAY_MS);
+	aw88166_start_pa(aw88166);
 }
 
 static int aw_dev_check_sysint(struct aw_device *aw_dev)
@@ -1550,7 +1535,7 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 
 	if (aw88166->aw_pa->status) {
 		aw88166_stop(aw88166->aw_pa);
-		aw88166_start(aw88166, AW88166_SYNC_START);
+		aw88166_start(aw88166);
 	}
 
 	return 1;
@@ -1725,7 +1710,7 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	guard(mutex)(&aw88166->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		aw88166_start(aw88166, AW88166_ASYNC_START);
+		aw88166_start(aw88166);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		aw88166_stop(aw88166->aw_pa);
@@ -1759,8 +1744,6 @@ static int aw88166_codec_probe(struct snd_soc_component *component)
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	INIT_DELAYED_WORK(&aw88166->start_work, aw88166_startup_work);
-
 	ret = aw88166_request_firmware_file(aw88166);
 	if (ret)
 		dev_err(aw88166->aw_pa->dev, "%s failed\n", __func__);
@@ -1768,16 +1751,8 @@ static int aw88166_codec_probe(struct snd_soc_component *component)
 	return ret;
 }
 
-static void aw88166_codec_remove(struct snd_soc_component *aw_codec)
-{
-	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(aw_codec);
-
-	cancel_delayed_work_sync(&aw88166->start_work);
-}
-
 static const struct snd_soc_component_driver soc_codec_dev_aw88166 = {
 	.probe = aw88166_codec_probe,
-	.remove = aw88166_codec_remove,
 	.dapm_widgets = aw88166_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(aw88166_dapm_widgets),
 	.dapm_routes = aw88166_audio_map,
diff --git a/sound/soc/codecs/aw88166.h b/sound/soc/codecs/aw88166.h
index 1a61e56f607c9..b8dbfe0f307c4 100644
--- a/sound/soc/codecs/aw88166.h
+++ b/sound/soc/codecs/aw88166.h
@@ -670,11 +670,6 @@ enum AW88166_DEV_DSP_CFG {
 	AW88166_DEV_DSP_BYPASS = 1,
 };
 
-enum {
-	AW88166_SYNC_START = 0,
-	AW88166_ASYNC_START,
-};
-
 enum {
 	AW88166_RECORD_SEC_DATA = 0,
 	AW88166_RECOVERY_SEC_DATA = 1,

-- 
2.54.0


