Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F4854B1AD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958604; cv=none; b=aNu2Xs1W4TAHWWsCBZteVqYKIE9hrXwi0jgGlwyeOErGca56uIBOw0E5fJ1Aac8R6lAYinlIWIcFI7r+MZr2cY/HxTG3CbxVuZGRzaU4Zuwi0biAMsc3xOKAVYHgpwj7CCq10jWcPWGlLkY99q79xScTY8QqC4V+yEoCkc5aGWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958604; c=relaxed/simple;
	bh=lsN0XiwlujHd4wYAIXgxFrs6nm46SgZPunzPpVR8ooU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TP3pSORWobItAmm+Lip4NVB+prhe1SGBwLhCf60QOR3AyuLG9HdYerTUbuGyICReu/EjzgmJsshCOLyYylLAgMv2hce+duFylwLfXZB59ATmkPe6fnETX0ke5J+40Ka8vyngkdRogBV2wydcGL0p+JEnHU4sCj+qdwBVI1mwFRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5x55FNQ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5x55FNQ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so810785f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788958600; x=1789563400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fB0D1FkKGt2ZFCz5IZDi2tLOgo9z2TzTEtx144XQJCU=;
        b=r5x55FNQWn/LvCbadEOkIlcxCA6/j/Fq0EbhwmPddzS6WCmi/z/Jh5q5I7y2EAwxDj
         26SilLR/0/UWr9cRby4IZJsuxi61VmlJrIowEj2VIq0bz/Ozet8a2F8jVzhEMOnW9ciF
         i0bMtDpTkTzHEgDr2GYPRc44MSiiC0qCdf2xhyFTnhnlrlO6/Xd/755NjlLr5WUak3FR
         9TQAzZuZsGKeT3LkWLMzhwt2Jc3sc0LPMCZQFepvG5d9eRpaSfwr1B7w4Pgbw27XKk8J
         xU38HwhpW27aY3RfJGbOaMU0TnmG33qDbdSd7ZmXojonlIBQr8qUwLHkIj4yyZKlqYQh
         jL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958600; x=1789563400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fB0D1FkKGt2ZFCz5IZDi2tLOgo9z2TzTEtx144XQJCU=;
        b=G8+rA1+/07SaYNYfNRA2yzKtb6ieolXrYvxjamV0PkadaBC1yYsa1LjIsrNewbe/GY
         PwNa/hGbOryD2ITb3rfvtfCEnO7GyaF7fLEmlsi8jay6sLhZzZM/pc+o8hbEqPtrIDNp
         Zdi1VG/3vuZ+I7lIuxJR72V+XmCXCOTB8bp+aYB+E9XkQVsyp9ZSSNwREYqdXgVw3fU4
         VDoC83xLQmdLdivzfi0bOOU1gwehfs9TSrcXiEWadpLF/ivn3iRKRziiWasBgBibpMJr
         J29cK25fRjq/tuuQxZgvyiYfaLOSSY0QKnf0siUXU6wpcEsM6EdOVJG2KsdQljs7wVAN
         QKuw==
X-Forwarded-Encrypted: i=1; AKwUvByKxq1DH0vNFS/1mrqXpe7q/rHsAVscTAZ5amGLOW5IkrYdl7iAsmxsQOqmO5ZjgwX1/bkJD7GMoQ4rQ3o=@vger.kernel.org
X-Gm-Message-State: AFuF++my6mh+/xYFBIX1pswZsj81OUE+yCpJuixWKHmbffOus3VLEuor
	fCtZnK1rAU5VxESn6DvDY3mnk6Jo3p8YK4OQT9SWfzBBun6YPjZizDpW
X-Gm-Gg: AYBFou1cWbiRHnU4F58KxZbPuyFxKvfIEzYCwhs2fJBHDeH15cZdLzSXqpb7m5X7QaL
	g+AcXdUvOlZC0+qHn5/ART2QKfVLXul28+OuT8xdDi+wAkqV0Xymqk2eNuKlknnMb2/AnDXicm4
	1oTTpObor65XO0eoXSUEyCdxawkztDxQEBwGSS5GEizX2W5YSvuEukx+QIXgBQVWIqIs93+Id1A
	AXZuH4PKnNejgTVu+i71DRoccr2B9Ldvt3CM07Pb/NCH0DNLJpHan1W6U/8BbMIqcFM9FsQcgSE
	89nNXuQNXcP+PTpbAaB+KN9RNg9ADx3/KeWMkV3vChH+lhjjL0UKrKTHa+gDNOlLOFcUMMGqdDb
	ph5JwuPGx4p7TekV24u0G8gOrx2r6GfHgCrgKAwLOrgeacBqgXRK8YhGu0aK0HCJwVpP4POh/Wf
	Z/+Y5TVsLBGuHBc0ScanuUdu8zrTZJdaxyl5IhDf4K5486cazyGoWBFPbrvHQsfwypZ9cScfLeu
	jHBOy/D+gjloNsPOJzSc3Yvm3TufCllHjasIsP9/HHPNMwGc5aDfdgYvZ1JrPm3gJRM9TfJ3Q==
X-Received: by 2002:a5d:5e09:0:b0:485:a09c:6529 with SMTP id ffacd0b85a97d-485a23c62edmr16611766f8f.5.1788958600108;
        Wed, 09 Sep 2026 05:56:40 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b7bfasm44241663f8f.29.2026.09.09.05.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:56:39 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: julianbraha <julianbraha@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: ckeepax@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	julianbraha <julianbraha@gmail.com>
Subject: [RESEND PATCH] ALSA: ASoC: fix unmet dependency for SND_SOC_DB1200
Date: Wed,  9 Sep 2026 13:56:36 +0100
Message-ID: <20260909125636.3560050-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SND_SOC_DB1200 selects SND_SOC_WM8731_I2C without ensuring its
dependency, I2C is enabled. This causes an unmet dependency when
SND_SOC_DB1200 is enabled without I2C.

Let's add a dependency on I2C, as similar options in this subsystem do.

This unmet dependency was found by kconfirm, a static analysis tool for
Kconfig.

Fixes: 9dc15f81baf2 ("ASoC: wm8731: Factor out the I2C and SPI bus code into separate modules")

Signed-off-by: julianbraha <julianbraha@gmail.com>
---
 sound/soc/au1x/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/au1x/Kconfig b/sound/soc/au1x/Kconfig
index a7630897bc0b..e8986da24d64 100644
--- a/sound/soc/au1x/Kconfig
+++ b/sound/soc/au1x/Kconfig
@@ -55,6 +55,7 @@ config SND_SOC_DB1000
 
 config SND_SOC_DB1200
 	tristate "DB1200/DB1300/DB1550 Audio support"
+	depends on I2C
 	depends on SND_SOC_AU1XPSC
 	select SND_SOC_AU1XPSC_AC97
 	select SND_SOC_AC97_CODEC
-- 
2.55.0

