Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5583E54A7CC;
	Wed, 14 Oct 2026 17:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997388; cv=none; b=jjrQrRRTyKqBy4+8mkQmPkOBant4GkFqcYJ0K6ms4whkDoZfIEtOKb8KNeUdRuq4iOGauwgAPInKz4/FszAXyOTyJrSbO2rCR4rEoGhRvM7asX+rTs4nrKxggJSMw6DC0ckHevMGSVQR7Rn4hVyl+2EgENGPBvWlZ6vXsXt19DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997388; c=relaxed/simple;
	bh=iFAnrRfWiXjrZSVBmYWzgUIDLhMC4ZgrfW0F16D+pKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M026s19clbSiD0QKjnuIQEv96Tzbfk0AkdAszMJYmltvVHpmYC9HfSIDuEQ4PTy4TjNKZclqAlola1OoLieNx9wVhyZYPbx2F9uIhWYGYEics9vEKUOHzo/XPc8M/1IeWGKXYQ+Nk/5R8cd9mz4gR6hgZFDrohmii9PuIs+du60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DeIKuK/9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DeIKuK/9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F6E1F000C4;
	Wed, 14 Oct 2026 17:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791997386;
	bh=Esd1xovFMot4e+VD6qfstBOMCypNZ2JuCPRuue5vIlA=;
	h=From:Date:Subject:To:Cc;
	b=DeIKuK/9Ukqqo3k2TYHCz95mDfB3zsX9ZGZr0PQ9suX9rd2w/2SdRnmP+rUZxNv+U
	 /BKGPMz3YjTLRNZaecg0rglf3s4o4TXmlocHlWM7Q31iT4bPDeJS0UQv7KyRU6G9vP
	 bnU446OhGmLDgzJj2mehNKfMb86/NO7Qpy3zzeqvjdm32dMVdDPK8wonDNbXLgKcHq
	 R3bS3Dmdkh0lVksZ4OEefFnDKpO+lns9VjxSt9uxUyicpi9M20/DjMNStQ1BnMu8VO
	 lArLRqiH6gU1uzK8xpcNAPH2a63iJUNgl1fsichCrmsUJl5NV83gXYlQmw4KnLrNN0
	 7M5ocCjyychrg==
Received: by venus (Postfix, from userid 1000)
	id B6B1A180A50; Wed, 14 Oct 2026 19:03:04 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Wed, 14 Oct 2026 19:02:54 +0200
Subject: [PATCH] ASoC: codecs: wsa884x: Add mute control knob
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-wsa884x-mute-support-v1-1-74d98d79e635@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQxBBsr1K6iDrqCNWQSVpBv
 LtpXb7F/zsIRSaBR7VDpA8Lr0uBvlXQTX4ZCbkvBqOM00pb/IpvGrvhOydCySGsMeHdWUN1Paj
 eOyhpiDTw9t8+X5cltzN16feC4zgBFns+EHgAAAA=
X-Change-ID: 20261014-wsa884x-mute-support-9642e33f0da6
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4776;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=iFAnrRfWiXjrZSVBmYWzgUIDLhMC4ZgrfW0F16D+pKA=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBqz7XIyXj5SCAwyRN7Byvm3eFVrpF9sFGfzhiua
 pAJ3lvqY+eJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCas+1yAAKCRDY7tfzyDv6
 mg9YEACL8rrEkqf42lgyUUGtT4Xe1Q4TptpSeA7+L66T2R++vCnYcwwH7ZvBbBk57hLwItCECnP
 LKWflCOBjX4wcT5+/OjhDg1YXD9oSeU7MShUiKw124QSMY4wScKmKpdVg1gqypggK+EkBh90FrQ
 bJF9FY17a6aY7+TsrqjvXSpMb4SVST6gcsRVpdZZBBpJUN19I1EkTS7WfSs2zW65DoIyKuCKwZW
 t8sQ7Cv/i2l1UBdJhvSRe3roWmbFeo02ywGQaXJS+FgFNIZ6cjGmUnxF7eaDMQdlPZ5Pz+FipDt
 gABWzq+Qry7IY4B11wVsLQv+H003aVB8KY4Z043IO1sgbyglNpDkoOdCW05DfNzHip39bOeF8ge
 6XrIpofxvf/HuGce3r0gyIcEzePHXmjNp+uina9zWuHQ08Qk0GpRTl+21QYBY4JdjBenyw0GUhu
 pHpXWJv6GoHXnuNAxB3VuYPOoyMMtFgJjlCTeRmlZJB8q8pzVY+FA4DpRzTreFsKqifIBvE3w+r
 dX5yWvuauzDxxAPJPiFCkAGNrbfNIwwep2LP7SNa2FqZpiKr7heaOFp940RCVj83RZa2xzwIS5I
 i/yjh3YUzBWUqahz2Kp/DzbzL5zTik1685BIgcDvFZ9Rb6RrDE8z56TGO11g0m4lr4GGZBtZ3Rw
 UoKwXeKhJMxxwWg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

This codec is typically used with ALSA UCM, which right now falls back
to handling mute in software. Expose proper hardware mute control
considering the driver already handles it internally anyways, which
allows UCM to bind speaker mute LED to the new control knob.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
UCM pull request for the speaker mute LED support:

https://github.com/alsa-project/alsa-ucm-conf/pull/880

It's fine to land this patch before the ALSA UCM series (control knob
will be unused), or after the UCM series (UCM will detect that the
control knob is missing and fall back to existing behaviour).
---
 sound/soc/codecs/wsa884x.c | 67 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 50 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index a367c94bfb4d..97cd93c6f4a8 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -742,11 +742,13 @@ struct wsa884x_priv {
 	bool hw_init;
 	/*
 	 * Protects temperature reading code (related to speaker protection) and
-	 * fields: temperature and pa_on.
+	 * fields: temperature, pa_on, user_mute and trigger_mute.
 	 */
 	struct mutex sp_lock;
 	unsigned int temperature;
 	bool pa_on;
+	bool user_mute;
+	bool trigger_mute;
 };
 
 enum {
@@ -1731,10 +1733,52 @@ static const struct snd_soc_dapm_widget wsa884x_dapm_widgets[] = {
 
 static const DECLARE_TLV_DB_SCALE(pa_gain, -900, 150, -900);
 
+static void wsa884x_set_mute(struct snd_soc_component *component, bool mute)
+{
+	snd_soc_component_write_field(component, WSA884X_DRE_CTL_1,
+				      WSA884X_DRE_CTL_1_CSR_GAIN_EN_MASK,
+				      mute ? 0x0 : 0x1);
+	snd_soc_component_write_field(component, WSA884X_PA_FSM_EN,
+				      WSA884X_PA_FSM_EN_GLOBAL_PA_EN_MASK,
+				      mute ? 0x0 : 0x1);
+}
+
+static int wsa884x_get_spk_mute(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct wsa884x_priv *wsa884x = snd_soc_component_get_drvdata(component);
+
+	guard(mutex)(&wsa884x->sp_lock);
+	ucontrol->value.integer.value[0] = !wsa884x->user_mute;
+
+	return 0;
+}
+
+static int wsa884x_put_spk_mute(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct wsa884x_priv *wsa884x = snd_soc_component_get_drvdata(component);
+	bool mute = !ucontrol->value.integer.value[0];
+
+	guard(mutex)(&wsa884x->sp_lock);
+	if (wsa884x->user_mute == mute)
+		return 0;
+
+	wsa884x->user_mute = mute;
+	if (wsa884x->pa_on)
+		wsa884x_set_mute(component, mute || wsa884x->trigger_mute);
+
+	return 1;
+}
+
 static const struct snd_kcontrol_new wsa884x_snd_controls[] = {
 	SOC_SINGLE_RANGE_TLV("PA Volume", WSA884X_DRE_CTL_1,
 			     WSA884X_DRE_CTL_1_CSR_GAIN_SHIFT,
 			     0x0, 0x1f, 1, pa_gain),
+	SOC_SINGLE_BOOL_EXT("Speaker Switch", 0,
+			    wsa884x_get_spk_mute, wsa884x_put_spk_mute),
 	SOC_ENUM_EXT("WSA MODE", wsa884x_dev_mode_enum,
 		     wsa884x_dev_mode_get, wsa884x_dev_mode_put),
 	SOC_SINGLE_EXT("DAC Switch", WSA884X_PORT_DAC, 0, 1, 0,
@@ -1802,23 +1846,11 @@ static int wsa884x_hw_free(struct snd_pcm_substream *substream,
 static int wsa884x_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 {
 	struct snd_soc_component *component = dai->component;
+	struct wsa884x_priv *wsa884x = snd_soc_component_get_drvdata(component);
 
-	if (mute) {
-		snd_soc_component_write_field(component, WSA884X_DRE_CTL_1,
-					      WSA884X_DRE_CTL_1_CSR_GAIN_EN_MASK,
-					      0x0);
-		snd_soc_component_write_field(component, WSA884X_PA_FSM_EN,
-					      WSA884X_PA_FSM_EN_GLOBAL_PA_EN_MASK,
-					      0x0);
-
-	} else {
-		snd_soc_component_write_field(component, WSA884X_DRE_CTL_1,
-					      WSA884X_DRE_CTL_1_CSR_GAIN_EN_MASK,
-					      0x1);
-		snd_soc_component_write_field(component, WSA884X_PA_FSM_EN,
-					      WSA884X_PA_FSM_EN_GLOBAL_PA_EN_MASK,
-					      0x1);
-	}
+	guard(mutex)(&wsa884x->sp_lock);
+	wsa884x->trigger_mute = mute;
+	wsa884x_set_mute(component, mute || wsa884x->user_mute);
 
 	return 0;
 }
@@ -2077,6 +2109,7 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	wsa884x->slave = pdev;
 	wsa884x->dev = dev;
 	wsa884x->dev_mode = WSA884X_SPEAKER;
+	wsa884x->trigger_mute = true;
 	wsa884x->sconfig.ch_count = 1;
 	wsa884x->sconfig.bps = 1;
 	wsa884x->sconfig.direction = SDW_DATA_DIR_RX;

---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261014-wsa884x-mute-support-9642e33f0da6

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

