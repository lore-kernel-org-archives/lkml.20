Received: from mta0.migadu.com (out-73.mta0.migadu.com [91.218.175.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B722C21ED
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135939; cv=none; b=pPKyaIubMjUJ4E7+7llLFnMUl/teC355sZBu4Ouod+Wg8/4HGluXzF85jchAFKoTY4MEmkME+S9FiNy0NcdVJZwxrdWA1il7gl2RZ8S34cWLfaCHdkGElISBLsLwGktfGGU3IE2vu3b0Nvkc/iJycygbSikpGN2uG0vqICZMB1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135939; c=relaxed/simple;
	bh=WNkfQ+EP1iSij9r9WOR31d6WGPgu40X/elCm3CkyIfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnzptI+LQHKnWZeuUFcVzdcw0H//dmvaQFuoU1kut4gmsPsyWSaj0DtHrcsGN08akML/BmnygbQ9GKEKe5dUVwflkenfDXf+iHYG9owTZ7G7jGEE0pVx7RBoe+PLumC1jsx1/qZf4poSFhxWaV9FBUh1bW23xJFlJhUqE+EWD+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=xQx4/7KJ; arc=none smtp.client-ip=91.218.175.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="xQx4/7KJ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WNkfQ+EP1iSij9r9WOR31d6WGPgu40X/elCm3CkyIfU=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792135935; v=1; x=1792740735;
 b=xQx4/7KJBvmCpByme1/qFFmZo4f9GUT3zTUmCKVNYq7HtaloBhEyLnkK5uJUNde2XEGz5yy3
 5Fn/5ChBcWzSXvLUe0OY2CApgNLU5k/QWNlHKRvSZr5KOMGJTZ3f3gnqN9AiQ4XZjDzJn9lNZtm
 BxzpzzgaFjo4VJI01mT1ccme7B3XnySa7GevgIfZL7xKt0Fn4zVpRYESVGl+9KA7pZNQ2XPB8GL
 oYKdpgnkYLaGReraJJkyrTQycHfDKlocB2D0ON8AnMFpSGj/q6vTHGZIrEUrHDrcr50d0VKZrzT
 v9461dbiOBHVOqHysAZVg6UoUFW4FQY6Dn4DqEaLI6Rwg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0af673897db864f8;
	Fri, 16 Oct 2026 07:32:15 +0000
X-Mizu-Trace-ID: 0af673897db864f8
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Val Packett <val@packett.cool>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/5] ASoC: qcom: qdsp6: q6routing: add Senary MI2S ports
Date: Fri, 16 Oct 2026 04:31:49 -0300
Message-ID: <20261016073157.611956-2-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016073157.611956-1-val@packett.cool>
References: <20261016073157.611956-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds support for senary MI2S mixers.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/qcom/qdsp6/q6routing.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index d076c99f197f..ea511200c8d7 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -68,6 +68,7 @@
 	{ mix_name, "SEC_MI2S_TX", "SEC_MI2S_TX" },	\
 	{ mix_name, "QUAT_MI2S_TX", "QUAT_MI2S_TX" },	\
 	{ mix_name, "QUIN_MI2S_TX", "QUIN_MI2S_TX" },	\
+	{ mix_name, "SEN_MI2S_TX", "SEN_MI2S_TX" },	\
 	{ mix_name, "TERT_MI2S_TX", "TERT_MI2S_TX" },		\
 	{ mix_name, "SLIMBUS_0_TX", "SLIMBUS_0_TX" },		\
 	{ mix_name, "SLIMBUS_1_TX", "SLIMBUS_1_TX" },		\
@@ -152,6 +153,9 @@
 	SOC_SINGLE_EXT("QUIN_MI2S_TX", QUINARY_MI2S_TX,			\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("SEN_MI2S_TX", SENARY_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
 	SOC_SINGLE_EXT("SLIMBUS_0_TX", SLIMBUS_0_TX,			\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
@@ -563,6 +567,9 @@ static const struct snd_kcontrol_new quaternary_mi2s_rx_mixer_controls[] = {
 static const struct snd_kcontrol_new quinary_mi2s_rx_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(QUINARY_MI2S_RX) };
 
+static const struct snd_kcontrol_new senary_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(SENARY_MI2S_RX) };
+
 static const struct snd_kcontrol_new tertiary_mi2s_rx_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(TERTIARY_MI2S_RX) };
 
@@ -825,6 +832,9 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
 	SND_SOC_DAPM_MIXER("QUIN_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
 			   quinary_mi2s_rx_mixer_controls,
 			   ARRAY_SIZE(quinary_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("SEN_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+			   senary_mi2s_rx_mixer_controls,
+			   ARRAY_SIZE(senary_mi2s_rx_mixer_controls)),
 	SND_SOC_DAPM_MIXER("TERT_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
 			   tertiary_mi2s_rx_mixer_controls,
 			   ARRAY_SIZE(tertiary_mi2s_rx_mixer_controls)),
@@ -1038,6 +1048,7 @@ static const struct snd_soc_dapm_route intercon[] = {
 	Q6ROUTING_RX_DAPM_ROUTE("SLIMBUS_6_RX Audio Mixer", "SLIMBUS_6_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("QUAT_MI2S_RX Audio Mixer", "QUAT_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("QUIN_MI2S_RX Audio Mixer", "QUIN_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("SEN_MI2S_RX Audio Mixer", "SEN_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("TERT_MI2S_RX Audio Mixer", "TERT_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("SEC_MI2S_RX Audio Mixer", "SEC_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("PRI_MI2S_RX Audio Mixer", "PRI_MI2S_RX"),
-- 
2.55.0

