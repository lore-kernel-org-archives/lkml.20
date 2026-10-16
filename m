Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338673C3449
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146591; cv=none; b=LfUyuuCwpRkm7P1ylJ6LWC8CzHJJuNjDynTWNzosZlyvnRbOnH6ftdRxEWBZ5XQJJ+6+BYgMlvNhGs3ho132e6+a2zVmKJUbingIJa6sMPneN+WnjxQSlekLmbHKKPDOPEK4+M1owQq5Rk1nPMBAjvIPBcBw91iyibd32DQRqCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146591; c=relaxed/simple;
	bh=BJa52UcGpHydezQrvMRTYS4LZALlcRs58n+/XGz/+Ps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u6+yLNSd599hv4U1aTtdiUmQUzU6E5DZhX0o7RRoCxW/r8zpYHj14U0URmPqzl6EYa3j1xzX/R2fhUbORrA/eenoiWYAlX1IcDf/2vHfDdMUof/poCrToKZybrthE62rsKmGUST/JqbBmrb6a6ctlrZPjV6AfA2WkSepNDQZCLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R14ZVvHR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R14ZVvHR"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e011d370dso289312f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146587; x=1792751387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQnN3qNvWgUvgCtj7xlWr+dFJba801MekrCsHnx2s00=;
        b=R14ZVvHRDiIoZ0hzog+d/DD/4z/qPZOxnTirzFOB1NUSjVXbA97h1jOpGnoYEpZFtO
         QAVqTuavpMdV5qI8oUmx0Hp5NWKn+fOsdJfE3znAGZlaI4nllrv3hL+ENKmb7v3nFX1e
         aa/E2lkrAQa35vOSrWI0iaNATE77vSItx4Qj6AHNWQR4SRAW8wbwFeISg3AEhDIVpye1
         wwz83cSyBZp4L6emQUQatKAvy3Dl30VtPWQLTU76xL7TMceyX6UiRifAMTlld9d/c9UU
         if7lPBTlS6h4rYbRGQ3qXgTjzzFDyjsGeiZhGZAfzEIBK8lHRWBfXpVA8/CBq0rSFAk3
         L9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146587; x=1792751387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQnN3qNvWgUvgCtj7xlWr+dFJba801MekrCsHnx2s00=;
        b=hQk3JA6Q64G52hU9DTyAahIcyDjVzkiZUPE0+xX4k6ulkLxijxoGCdj4OwAE9QLb6f
         5U/FeGxF9gGeqp5J7LrMclA0muJ9IHHNXZjQXDTfs6wG2odivTJif+npHnLP8LPOmSP0
         jubIf4xSDdvFghYqIC81aXpR7d7pgIThskLVygL1eqaXKsjIDRpUHYducBz8nbfRfOZ9
         TR+hxT+qm2VL4NRhnI05Zdr7tMzSwvI0cTkg1jrpCpHriskbv2dEOaPwgQk45Dhga3/Q
         r05Q/f1iHCjvfBx6+laJUK2DsLznaF4UW3Rg3AG91ccnCMB+zqtFb73fVk39R7DGOZMD
         GHrw==
X-Forwarded-Encrypted: i=1; AKwUvByDQRKtpgIwAgIWUIj8ymOtk2u55nhzXaUsIUIcpv/7zZDv8e8/GlZ5v4lPAUvcDfqhoUyPjLImof48jas=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIbXbJ+0lcRXgzwYP+IwzJEW8KablByEZUaArKe1AndzJgnJ3k
	yIRkkKVL0xQjAMXkvJpjpVg8navkbTUlwYSqZ7pgmtq8M5wGet+iQPKa
X-Gm-Gg: AYBFou2oLX1EWsubys4GCyt77tdnE851oNs9oRGysh6DeZLUxRE5LgFi3CmsxeILWm4
	11vWCkwnRASfPkfkqnfQ3ru4IXdf5pdgGazENn4i4Z9gdxIwfmoIe0sWBvw2TZRqNDN+Ov2gxnv
	BtBu2k2Ytp6v9FioIeZlKl5hwp0wOSReTiwZn42voi0+lpkvn9NWeEV7HPtoIv3ajBm3qS3/yYZ
	FtAM0MdeYlDRU6YSYq97FPy44aT7oKJMBat0I41m0R0/Vklrf1R56MbDQFmwRg8QDS62mQuevEE
	F0eWRgSslhHYlg0Zr2DseSAI0SQMhL6H4B/MOXQMHSdg2UADi48+mzrlGcuU6LeGlb1eWxG0IYF
	DTSnbMGeEB/kjAsifUEG6fIrHrChVtzbhM7Qh5GR9iBW5NjON+UcWbFfFBJFjgeYrgfAkMfGI7T
	2x+a/EzHD/kv2GokYqCaCpWsXXByInZzhKsYmfdTUWqqFUDlNwM1EeEqcgEXfr4Sk6c69PXAgKy
	0lBsig/h7frJ26L0jKlJRLbIsnUO4RPONQAQoYxgGpPbcFbf/ZQIzNtoPhEs8Gk6MckI0wuTNTX
	6n0MTKv+xRpZx8Y8ro3G6h9MhuWkZ30UXStvgnVsqoQN5dKYbyRMU/YDI7hkLeYB
X-Received: by 2002:a05:6000:11d2:b0:487:169f:d341 with SMTP id ffacd0b85a97d-48dbaaddbbemr29617033f8f.12.1792146587298;
        Fri, 16 Oct 2026 03:29:47 -0700 (PDT)
Received: from px13.tail3a7e86.ts.net (91-201-160-110.ip4.as24916.net. [91.201.160.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a24sm4143035f8f.49.2026.10.16.03.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:29:46 -0700 (PDT)
From: Lee Mann <leepaulmann@gmail.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-sound@vger.kernel.org
Cc: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	perex@perex.cz,
	tiwai@suse.com,
	andrey.golovko@gmail.com,
	antoine@montane.tech,
	linux-kernel@vger.kernel.org,
	Lee Mann <leepaulmann@gmail.com>
Subject: [PATCH] ASoC: tas2783-sdw: restore the volume controls after re-initialisation
Date: Fri, 16 Oct 2026 11:28:46 +0100
Message-ID: <20261016102846.22908-1-leepaulmann@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the SoundWire controller is power-gated during system suspend, the
amplifier loses its register state and tas_update_status() re-runs
tas_io_init() on re-attach, which resets the device and reloads the
firmware. Since commit b627da430357 ("ASoC: tas2783-sdw: drop stale
regcache on uninitialized re-attach") the cache is dropped first, and
that commit notes that cached user settings then fall back to hardware
defaults. Before it, the cache was synced back before the reset, which
wiped the values again, so they were lost either way.

For the two volume controls this is audible: the digital volume comes
back at its default, full scale (0 dB), while userspace still holds the
level it set before suspend and does not write it again. The first
sound after resume plays at maximum volume until the user changes the
volume. On an ASUS ProArt PX13 with PipeWire at 48% the "Speaker Volume"
control reads 200 after resume instead of 162.

Remember the register values written through the "Amp Volume" and
"Speaker Volume" controls and write them back once the init sequence
has completed. Only values userspace has set are restored, so the
first initialisation is unchanged.

Fixes: 4cc9bd8d7b32 ("ASoc: tas2783A: Add soundwire based codec driver")
Assisted-by: LLM
Signed-off-by: Lee Mann <leepaulmann@gmail.com>
---
Notes (not for the changelog):

AI assistance: I worked on this with Claude Code, as I don't normally
get this low level.

It drafted the code and the changelog from my measurements of the problem;
I reviewed the change, built it and tested it on my machine as described
below.

Testing: ASUS ProArt PX13 HN7306EA (two TAS2783 on SoundWire link 1, AMD
ACP), v7.3-rc6 with this patch applied to the in-tree driver, PipeWire at
48%. After s2idle, "tas2783-N Speaker Volume" read 200 without the patch
and 162 with it (the value set before suspend), with nothing done in
userspace; stereo playback is unaffected. checkpatch --strict is clean
apart from the Fixes/commit references checkpatch cannot resolve in my
tree.

This posting is rebased onto broonie/sound for-next (686b3eff60). The only
conflict was the new "Re-active AMP after resume" write in tas_io_init(),
which the restore now follows. The rebased driver (for-next's
tas2783-sdw.c with this patch, W=1 clean) was also run on the same
machine: after ~60 s of s2idle both amps read 162 again, matching
PipeWire. for-next does not have 173cb3147ba2 ("ASoC: tas2783-sdw: split a
stereo stream across the two mono amps") yet, so only the left speaker
played on that build; the volume check covered both amps.

 sound/soc/codecs/tas2783-sdw.c | 60 +++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index a57230e01f..5235a7ddc4 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -84,6 +84,14 @@ struct tas2783_prv {
 	struct calibration_data cali_data;
 	struct sdw_slave *sdw_peripheral;
 	struct sdca_function_data *sa_func_data;
+	/*
+	 * Last values userspace wrote to the two volume controls. Re-applied
+	 * after tas_io_init(), which resets the device and drops the cache.
+	 */
+	unsigned int user_amp_lvl;
+	unsigned int user_dvc_lvl;
+	bool user_amp_set;
+	bool user_dvc_set;
 	enum sdw_slave_status status;
 	/* calibration */
 	struct mutex calib_lock;
@@ -536,10 +544,25 @@ static s32 tas2783_digital_getvol(struct snd_kcontrol *kcontrol,
 	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
+static void tas2783_save_vol(struct tas2783_prv *tas_dev, unsigned int reg,
+			     unsigned int *val, bool *set)
+{
+	if (!regmap_read(tas_dev->regmap, reg, val))
+		*set = true;
+}
+
 static s32 tas2783_digital_putvol(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	return snd_soc_put_volsw(kcontrol, ucontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
+	s32 ret = snd_soc_put_volsw(kcontrol, ucontrol);
+
+	if (ret >= 0)
+		tas2783_save_vol(tas_dev, TAS2783_DVC_LVL,
+				 &tas_dev->user_dvc_lvl, &tas_dev->user_dvc_set);
+
+	return ret;
 }
 
 static s32 tas2783_amp_getvol(struct snd_kcontrol *kcontrol,
@@ -551,7 +574,34 @@ static s32 tas2783_amp_getvol(struct snd_kcontrol *kcontrol,
 static s32 tas2783_amp_putvol(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	return snd_soc_put_volsw(kcontrol, ucontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
+	s32 ret = snd_soc_put_volsw(kcontrol, ucontrol);
+
+	if (ret >= 0)
+		tas2783_save_vol(tas_dev, TAS2783_AMP_LEVEL,
+				 &tas_dev->user_amp_lvl, &tas_dev->user_amp_set);
+
+	return ret;
+}
+
+static void tas2783_restore_vol(struct tas2783_prv *tas_dev)
+{
+	int ret;
+
+	if (tas_dev->user_amp_set) {
+		ret = regmap_write(tas_dev->regmap, TAS2783_AMP_LEVEL,
+				   tas_dev->user_amp_lvl);
+		if (ret)
+			dev_warn(tas_dev->dev, "amp level restore failed: %d\n", ret);
+	}
+
+	if (tas_dev->user_dvc_set) {
+		ret = regmap_write(tas_dev->regmap, TAS2783_DVC_LVL,
+				   tas_dev->user_dvc_lvl);
+		if (ret)
+			dev_warn(tas_dev->dev, "volume restore failed: %d\n", ret);
+	}
 }
 
 static const struct snd_kcontrol_new tas2783_snd_controls[] = {
@@ -1245,11 +1295,13 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 
 		/* Re-active AMP after resume. */
 		regmap_write(tas_dev->regmap, TASDEV_REG_SDW(0, 0, 2), 0);
-		if (ret)
+		if (ret) {
 			dev_err(tas_dev->dev,
 				"init writes failed, err=%d", ret);
-		else
+		} else {
 			tas_dev->hw_init = true;
+			tas2783_restore_vol(tas_dev);
+		}
 	}
 
 	return ret;

base-commit: 686b3eff603871bd500434e00ff15394a0c782bc
-- 
2.55.0

