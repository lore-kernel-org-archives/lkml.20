Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376820;
	b=a0S2IC6AaXAx36DmHyfK2KFmos1aOelUv6xq4yHzHKEdNKNxZ6nLkeGjQ5rybWfs5lLR
	 gEzNbelgt+GUV4rduWZ0LNh16k3N7QGNGqjQ22e4Z66UF+jt0mGnmU7ygrbQI/K5gKVW2
	 1r/cnJtAuCqbiKnDZGiAZ+l9FRcfzoshqcqWMmn0CxcU7k4wIfWiBS6XLmhzHBq5At3Mu
	 iK9mpU9x3UfIEyOEsnT0BjrzMEHKLCxXSVDj/pbEfjoL+uTAxUKUQ188WK64tHb8WOdcQ
	 GixyToe6aJAx6I/8iZb0rNtMuS0Q8YG7L0cl3CLXgsDsJ8yGj4FtlHWozlfYuuiSPIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=cMEdyLvG0WO8h2gcVneXCt4kujyphjxRvduCSlQeHKk=;
	b=Hu2P/XMlOBr+o/TF5KRqBfxbbZxf6flXPZyHg4r0UdqAVdbsjUHAqwag4ugbIgPnPKy/
	 /M/6hAhfaZoWa6Hwft94GXpMbU971FtlLfaRZ/fhHjvYE+QTYh3cdMnl7eVu/xZ6DXXJx
	 73WjP4+fiWZgtds91FZWrgt2i2dMWqkIN5GqQNKpwgtUHQAAl5OuVdUVhjI6t0g4Tu77K
	 cwoBBpEr4SND2QCPqEE3YvgsW+ow34DQqhrPQE3401Eyi9VVOPRSXadvc2Cl3XajtWWnR
	 Kb+R2X9hiDSq1NJVc9/r8R9bXccbpi0zdBVAMDCk1uPoJwUtZGNuVGCqaX++KY0fy1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RqzHKapO;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BCF60A2619
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53BCF60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RqzHKapO
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1768361a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794376820; x=1794981620; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cMEdyLvG0WO8h2gcVneXCt4kujyphjxRvduCSlQeHKk=;
        b=RqzHKapO+QtDvs7uHnjoQORw3iYRXoaenL17JZMtLVDsAjHcXvEFGpusWy+QEtwPMW
         HmBoNUJ3pjLygwPvZntvIHPVDyHUfhAET1nltf6Arc5PkSiP3YP+gGLx3WVgXZVlP1Cd
         e//j+uvSWKASN2gI9QWLbq7I4wQsSira6axZlYoI+cVoO3Yja5VQjXeNZdbER/icro17
         PNIAUf8FI/j40le9cczdKAOXmppDUg25pLarFdDvWmkCxzji18DhWbrVEZslgMZ1vu2T
         uztnlixlHwFWb83h1XjmIcAYrP07tUGKERYrsq3tLzCjHtKC1wCRnPN8QrAQa0B/sFUQ
         Maxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376820; x=1794981620;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cMEdyLvG0WO8h2gcVneXCt4kujyphjxRvduCSlQeHKk=;
        b=pYqZxX6ZHR/M9Dnn5zVvq6OaIRIMCvxUKsYol3SzPInw8gZqdqGJQzJOn23JYOucen
         dpE38UxXLptKWt8RbtwaSaN+s5s+YWqCLC+jHJvO9/S24Bt3W78Ywq7/PmrazC1FZVOx
         ymQ60vH112CEjOFx93aw7NTNHc8aWlfvv/4R0IleTA4G2ceHmOyL5Q3OFXt1OrgolodE
         z9ruWVDp8B/vnQbUUt8pEUpzgmD2rhiOPybB8J+dOJMPbRf5y2y1pPsvOU5wiCCqRkx8
         lLuhukB0/3DVErT3FntI7gF6AGWg4j9O9za2kaSr6RlaoXNUZxiZ31+qA7/TmiCfe9Mc
         0r+w==
X-Forwarded-Encrypted: i=1; AL+hErHizQ5lbfCk9/Mc3l6Cn9aInYKYgTat0B+bwt9kh71eXwQuZUU4cfgtKkSTLYL3PZy4W+OGIlcPcOef8nA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ynbaKtb6NJKfzOEdWOww97WfYVOvEukCkILvsnN2HOs34i+zw
	7mwX1Re3r74hf3TUUeNkf0924WZxXJyfddK522EWU+lvHpzPGS4x1F+3
X-Gm-Gg: AYBFou0iXzMQ4I2Jmg4iL05XcTWUDjSS6lbCu89lAHRDn4wU02AU3sXUMy0qog18zwA
	cOhxaF+pR1PZO9lS6F+Aj9hcHTydxGBhzJ1pXUdNvLL9Gle9XLMSkv2yApun8suHLJDjM2/WoM5
	lqbeCawbbIXEvnxDBXCDuyrl8bxcVqNK04orKSQY0WmWjcUC0ClnW6h/uF/+xTnDNDpKEKueNf+
	Z9xCcNvx8bbDm4de7rru9+sdMHtbppRbtpbKy4pyiHHAD5c7EIWse85784ZvQsI9kW8j57D1Bqr
	bO2QDVunR0yILZ33xUp4YIrWAf8/OfJYg+TuogmQ2/pwrFgbt+K8Coi95VbY8A5dSF+cZcf+smk
	f0MLrjANaF9SClEMhUAS0LzQQjYNH45Z1Evzyfn0foWPSrLQGmRonYbyhDPF3NNXmo1t596KHso
	FeyI6A1bh4q+dRcKjIIOG/ZDRwnn2bEQiaaraRfGq8r/7AXzAwNFcMvSPnfPU/Q48sZMfV7EiOv
	BPHUz6tbafS5aQRt6wcn7U4RYQCNHYhZ32WofzsazummZ16jctKI/SbguzI9FTLmawUG26cPGBk
	zdfLXRVltjS4NvgR4mFQxda8rOrB9BGM75XHTonKbyHQS47og5ptXM8L+xSU933TsKfkS8SwlSX
	RklT7VnZDaQS4fkGBhtBhqWfBlfE806BRrHz/abVENiA+/dK37zdfwLkyWC3k/0eMue2M7Oaob8
	N87ihA1MHW6Y8WtG0Hut/z
X-Received: by 2002:a17:90b:1a91:b0:3b1:2810:dfd6 with SMTP id 98e67ed59e1d1-3b182f36f48mr1556357a91.64.1794376819334;
        Tue, 10 Nov 2026 22:00:19 -0800 (PST)
Received: from [127.0.1.1] (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db56c7esm2879890a91.8.2026.11.10.22.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:18 -0800 (PST)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Wed, 11 Nov 2026 14:00:14 +0800
Subject: [PATCH] ASoC: max98090: keep the MIC boost across mic input
 power-up
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-max98090-mic-boost-v1-1-20b9bd8816db@gmail.com>
X-B4-Tracking: v=1; b=H4sIAG0E9GoC/x2MywqAIBAAf0X2nKD2IPuV6GC21R7KcCME6d+Tb
 jOHmQyMkZBhEBkiPsQUziK6EuB3d24oaSkORplOa63k4ZLtlS1AXs4h8C1907X1sjpU1kMJr4g
 rpX86Tu/7AQ/Se4NkAAAA
X-Change-ID: 20261110-max98090-mic-boost-c4653dfae09c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerry Wong <jerry.wong@maximintegrated.com>, 
 Ralph Birt <ralph.birt@maximintegrated.com>, 
 LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376816; l=3781;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=Lc66jw5s26WwD5JavhljQJeyZ6ZUCJVqeJsR1Vj5mjs=;
 b=PL7ALtf+UhJ2CZlWwRE+Etw7x2bjlHjnnnH6v3rWn+FTrA8WgKQwJ+3EOqcPjeD/eH5sW4SLk
 p6BBicb+7z3B1IEwa/O3zQg68j2jSWgzfefTUEa/CmiyZHCe6XC/RUO
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

PA1EN/PA2EN select both the MIC1/MIC2 preamp enable and its gain
(0 = off, 1 = 0 dB, 2 = +20 dB, 3 = +30 dB). "MICn Boost Volume" keeps
the selected gain in max98090->pa1en/pa2en while the input is off, and
max98090_micinput_event() writes it to the field when the "MICn Input"
widget powers up.

The event handler also reads the field back to keep the stored gain in
sync ("Update for volatile"), but it does so on POST_PMU and POST_PMD.
The widget drives PA1EN/PA2EN as a single enable bit, the low bit of
the field, so at both points DAPM has just rewritten it:

  - POST_PMU: DAPM has set the field to 1, so the read-back stores
    0 dB and the handler then restores 0 dB.
  - POST_PMD: DAPM has cleared the low bit, so a +30 dB (3) gain reads
    back as +20 dB (2).

As a result every capture starts at 0 dB: a boost set while the input is
powered down, e.g. restored by alsactl or an audio HAL at boot, never
takes effect, and one changed during capture is lost at the next
power-up.

Read the field back on PRE_PMD instead, while it still holds the active
gain, and only restore the stored gain on POST_PMU.

Tested on i.MX95 with a MAX98090 headset mic on MIC1, running NXP's
6.18.38 vendor kernel (max98090_micinput_event() is the same as in
mainline): with MIC1 Boost Volume set to 2 (+30 dB) before capture,
register 0x10 reads 0x20 (0 dB) during capture without this change and
0x60 (+30 dB) with it, and a boost changed during capture is kept for
the next capture.

Fixes: 685e42154dcf ("ASoC: Replace max98090 Device Driver")
Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 sound/soc/codecs/max98090.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index a985853e48eb6fc4b02c8f148f73fb70bf18168b..3ed513f6d81cd6bdc85caea12f38030f85cdda13 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -743,14 +743,6 @@ static int max98090_micinput_event(struct snd_soc_dapm_widget *w,
 	else
 		val = (val & M98090_MIC_PA2EN_MASK) >> M98090_MIC_PA2EN_SHIFT;
 
-	if (val >= 1) {
-		if (w->reg == M98090_REG_MIC1_INPUT_LEVEL) {
-			max98090->pa1en = val - 1; /* Update for volatile */
-		} else {
-			max98090->pa2en = val - 1; /* Update for volatile */
-		}
-	}
-
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
 		/* If turning on, set to most recently selected volume */
@@ -759,6 +751,14 @@ static int max98090_micinput_event(struct snd_soc_dapm_widget *w,
 		else
 			val = max98090->pa2en + 1;
 		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		if (val >= 1) {
+			if (w->reg == M98090_REG_MIC1_INPUT_LEVEL)
+				max98090->pa1en = val - 1;
+			else
+				max98090->pa2en = val - 1;
+		}
+		return 0;
 	case SND_SOC_DAPM_POST_PMD:
 		/* If turning off, turn off */
 		val = 0;
@@ -1121,11 +1121,13 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 
 	SND_SOC_DAPM_PGA_E("MIC1 Input", M98090_REG_MIC1_INPUT_LEVEL,
 		M98090_MIC_PA1EN_SHIFT, 0, NULL, 0, max98090_micinput_event,
-		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD |
+		SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_PGA_E("MIC2 Input", M98090_REG_MIC2_INPUT_LEVEL,
 		M98090_MIC_PA2EN_SHIFT, 0, NULL, 0, max98090_micinput_event,
-		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD |
+		SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_MIXER("LINEA Mixer", SND_SOC_NOPM, 0, 0,
 		&max98090_linea_mixer_controls[0],

---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20261110-max98090-mic-boost-c4653dfae09c

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

