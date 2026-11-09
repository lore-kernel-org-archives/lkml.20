Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794263600;
	b=PgQO/JnWPMCxf+SgK0C8m0+xlUzirmqcXLHKKnOSzjTVFsWciajSe550Ye65tVXvUfZi
	 QY5dLrzznWxepLHZG1ZoXVvD1W/rwtODHrCsTMWPSrTfbA1YbCeXvDVY0P3rUvL1AgGe8
	 hNqKvaGpAtYrftOO4lUvwabit6EPLe16rwWl9BHW0BLoZPy4sTt81OMdoCU2nRZnLD9aY
	 SCz6XCjwBKIjPSWXXYhIwwAMyJ8K2kdbqXb/x10yS+VaQ0sPodmX36IynuiuokRpfoyBQ
	 GZgjRH1MyhSL1SDyyt0sYQG/oQt9gcVZKq0NQUD6EUQtAby2Uxlm2xkzKU8t1q5O30w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263600;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LG/48ljPpajWoijdQ3CRMO0HZ8jX933vYaKrBUflpmg=;
	b=oSF1MhjRDGUFFY6NJl8SkWmJS66dGaFkj2tFHaJxKqc+0auIq5h6DsXC2eQc6tVBHUUh
	 lXb39vXaIMltlv4Qy4z7RDo2M+d33inCDAjHuvcl8H2bHAHGxQ7HD647Y3QN04b3cXXqX
	 ow4GOh56cA/M8PE3YQw407OVz/9nBOEJKsdNVyFXv14kQuXE2jfYY9cZPn7V1/tBoL3Qy
	 ohGEcj7Ii/dGtU5/vO2is+d8bFXxP6FDUXJ4tlQ65MYYqJc0tJ30gIvOI+eCEu3zKCHjy
	 yQAkLWioP5kvVoCVZUOgS4XpTyNdCHk7gTCV1/4KXjJ02tg67B8xY8y0hqEEMpmXdEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Wz/up45K";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DD2606A31C;
	Mon,  9 Nov 2026 22:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wz/up45K
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794263599;
	b=WpWokYFJVrLbm7tAjNPfgC/pFPJgwEy/mSuqaAv9DWnzpXSqMT1WAUOVTRwbn5fFbqjZ
	 O6bCBGgCWMl6ETDc19ohico2XErztOOxRbiAuw6q/QhLSkXTW3Avo2m2b4c31Xb5D5WWL
	 ELiN5xE2Um7+SOX6AtJe/VyuoDiDMFVB3h172wROjCZeNg3FgAXzJ6O1PSGhb8EFfdRiY
	 kpIVBiJZwgnDn1i/ILGKMp34VJ8mOjaSwyg+Vj8E3JxElg/HbCin7x5EdR7rS8PskXMUy
	 p0NCaVcmjREtq3g+rX1CgMO3QzAs1YPG9Jf6RN3UYtDNuKtthgfmEwzH+aH6cfmEK1Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794263599;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LG/48ljPpajWoijdQ3CRMO0HZ8jX933vYaKrBUflpmg=;
	b=qGwvbuiQIruZL48OVgPschYvRmcNjjzjayjW+FFmykSOX89CaitAMyCBX8n6T7ux/Enp
	 v1+zJcRevm0UMXe/yuuWtWRMkVmV8k92wPuXQKkGexPEFWfYD2TOtc5lRG2UkN0EQqXoh
	 nD5US0Y6xUL8nrPjZ5b0cvUL4+PwvCH+oXYP4psw4INuywpTuhJ324GtslSI8/dvW6ZYt
	 TeXKuwunXPao+IuNiIWyCERPnm1TDkQaBXs1rKYx4vWiITiHd5AlMxrZaLufAV79yV2NG
	 Uf/dyvu5L1mJk17U2eJCmnFt6MP2p2m/HZeFkvaTz5W1eHK3JQn1lh1cHDfaF1KtZ/w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E1671F0089F;
	Mon,  9 Nov 2026 22:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794263599;
	bh=LG/48ljPpajWoijdQ3CRMO0HZ8jX933vYaKrBUflpmg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Wz/up45KSlA7r4ODP0zmqiSKMfyiQwX/wGO04zBqNN30zAfZHy0hYCUaxBvqarPdR
	 rrDrTzp2mBvcMhNu1ZPvCaIgMYPAMWm66i85wH5JG2aS1yznRZTjxRYrmLw3pDpUmo
	 JohhqH3vrYgB38pGLWmHVSeoX5RRyBkcFVnHCoZuujOspYhrXEwMvmbP2Fg/vJXpyE
	 xiZ+CT1ieuwNxo38vg0uZtj843pPAByrjxS3yCPXBumwuXYvfuT1i1o7tIyWUI8Ly2
	 VBwnss8gz2l/ATG6xiDSosWoBUeCWEMDQO8Mf1erF/QChTyMLlzY1TCrNX83zWGZI0
	 WME5dYQ3WDKRQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6340E4869D;
	Mon,  9 Nov 2026 22:33:18 +0000 (UTC)
From: Ivan Verbovoy via B4 Relay <devnull+ivanverbovoy.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 00:33:18 +0200
Subject: [PATCH] ASoC: codecs: wcd934x: drop the MCLK on every disable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-wcd934x-mclk-v1-1-c62956792a3f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNL3fLkFEtjkwrd3OScbF0jQyPDtEQDE3Njw0QloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAfQOIoHAAAAA=
X-Change-ID: 20261109-wcd934x-mclk-2121fa04731a
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ivan Verbovoy <ivanverbovoy@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794263597; l=2005;
 i=ivanverbovoy@gmail.com; s=20261103; h=from:subject:message-id;
 bh=+8TND5x7ORkQtuZzYM2DXIkWaXwiQXUX8dcdq40ah4g=;
 b=V/UsTHBZK8oO3woRtBITahsylO2KUvicFIWJMfYn5kV/n4IV0n56VyK40mVg/z7b3hwiZ28Zx
 K4UZcPd8YKCCsPfvgfqYObjxUt6SPl1t2VHew7/ftVgIE6t+sYIi+iI
X-Developer-Key: i=ivanverbovoy@gmail.com; a=ed25519;
 pk=0AchqTH1hJFToIUeFfQRlVzzuaWQDs4e75SxT2y3s8c=
X-Endpoint-Received: by B4 Relay for ivanverbovoy@gmail.com/20261103 with
 auth_id=1396
X-Original-From: Ivan Verbovoy <ivanverbovoy@gmail.com>
Reply-To: ivanverbovoy@gmail.com
Content-Transfer-Encoding: 7bit

From: Ivan Verbovoy <ivanverbovoy@gmail.com>

__wcd934x_cdc_mclk_enable() takes a reference on every enable: it
prepares and enables the external clock and counts a user of the
analog bias and system clock (sysclk_users). On disable it returns
early while the SoundWire controller's clock is enabled, so neither is
dropped. Each DAPM MCLK power-down or MBHC micbias release during
SoundWire activity therefore leaks one reference, and the MCLK stays on
for good.

The early return is not needed: wcd934x_swrm_clock() takes its own
reference before it enables the SoundWire clock and clears that clock
before it drops the reference, and sysclk_users keeps the bias and the
system clock on while any user remains. Drop the check.

On a Surface Duo (SM8150, WCD9340) the codec's external clock,
ln_bb_clk2 (an RPMh XO buffer vote), was found prepared five times at
suspend, which kept the SoC's XO on. With the check dropped, its enable
and prepare counts are back to zero once playback stops.

Fixes: a61f3b4f476e ("ASoC: wcd934x: add support to wcd9340/wcd9341 codec")
Signed-off-by: Ivan Verbovoy <ivanverbovoy@gmail.com>
---
 sound/soc/codecs/wcd934x.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 5cd30a5ed69c..043061558225 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1355,15 +1355,6 @@ static int __wcd934x_cdc_mclk_enable(struct wcd934x_codec *wcd, bool enable)
 		}
 		ret = wcd934x_enable_ana_bias_and_sysclk(wcd);
 	} else {
-		int val;
-
-		regmap_read(wcd->regmap, WCD934X_CDC_CLK_RST_CTRL_SWR_CONTROL,
-			    &val);
-
-		/* Don't disable clock if soundwire using it.*/
-		if (val & WCD934X_CDC_SWR_CLK_EN_MASK)
-			return 0;
-
 		wcd934x_disable_ana_bias_and_syclk(wcd);
 		clk_disable_unprepare(wcd->extclk);
 	}

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261109-wcd934x-mclk-2121fa04731a

Best regards,
--  
Ivan Verbovoy <ivanverbovoy@gmail.com>


