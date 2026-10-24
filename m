Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792831724;
	b=KFxYvd1fSSk4roZp/3KGYSovl3h2CX9eMAQ5pE/YzU5+2bxyaFduaRj2ipDHXF76fLg7
	 0v2FGLwvfqgqzQD5tyFX/EOYbQNRzKDolxUyKwzmQCuQ5EY91Y4C51Xsj3esOUNUayK9j
	 6a517xMwxIhokKgXk3U1b4RBH78PMYguqx69Hg3xEtMsVr3EMU20+R0mxcQWYHDfqeH6D
	 YbnOzU28eIEbrT8fa/OjLEY7uv5mO1u4FWVOwPCpFzqv31WlSg9XfYs1AQHQvpISQ92hy
	 Ziqa0BMTU0TflbKbwlq0DSPUb4Qk6YN/fENIyhiqEseJ40fA7SPiBMG/TNlx+rSnY3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792831724;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=KRvOYbtCpgaO3D93y69MU3GP8bMvWerWHILiks6wybc=;
	b=1kD5CRd03H70gmHf9c8dFrB3qTYCKUFJmx1i9TaXzBPEnrxyHFE+PZDuEtN8bZd+96wy
	 iegVVUjSZrvOT9Q9AH7WWTde4LD+hMyUWc96Lg+EJUWJ5e5JR6Jgn01P4Tywxt0ku0KBe
	 OY6tDuSByWXYcnjNtQc0cSu5J3B6cg9+zPEDGtzaP3Nooy9v0M3zhyL+BIAyna13FpjiX
	 wE8uPZD9gEdU8qw3Wuy6Q7XzCJ3smira36yeWNFo0/g1Ng0dqMBekFsnrWIcLHO51d9KW
	 NVMJReVWSyzxKrDTxLdVm+0WJgaBcYPVHKMtPoVF8aOB2qq1OXZ168N0SArdObb/dYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eJ8E1YYH;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900E7606A31E;
	Sat, 24 Oct 2026 08:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 900E7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eJ8E1YYH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=KRvOYbtCpgaO3D93y69MU3GP8bMvWerWHILiks6wybc=;
	b=eJ8E1YYHn3PWvHp1bvDGI2/+W8aCzRofucxCcdrrPamKGI7IRiCkzn3XOhCaDY
	K0uAnR3zUevGUJifOiZP4lTJdhGpenFXvd0HyI589418obbrNXGH3i76c4k9zmP8
	8LQHl7b2nbP7tK36DjSNBbwW1yB7W/yrXRqnwTjcyFSsA=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD31_XDcNxqoEbyCA--.11666S4;
	Sat, 24 Oct 2026 16:48:05 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Sat, 24 Oct 2026 16:47:24 +0800
Subject: [PATCH 2/2] ASoC: es8328: set SLRCK for the ES8388
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
Message-Id: <20261024-es8328-vol-init-v1-2-efbd24de9639@163.com>
References: <20261024-es8328-vol-init-v1-0-efbd24de9639@163.com>
In-Reply-To: <20261024-es8328-vol-init-v1-0-efbd24de9639@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wD31_XDcNxqoEbyCA--.11666S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW8Cw4ruw18ur48ZFykuFg_yoW8Zr1kpF
	sYyFZ5ta1rXF4furnxCa1SvrnIyrWxAFWjya47KryDAr17tw1kXwsIya4YvF1vkrWS9a9r
	uFy2gw48GF45WrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ptQ6p_UUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3gUfjGrccMUTaQAA3x

The ES8388 has a single LRCK pin, so the DAC and the ADC have to take
their frame clock from that one pin.  With SLRCK clear, which is the
power-on default, the capture path never gets a frame clock and records
digital silence while playback keeps working, so boards appear to have a
dead microphone.

Bit 7 of DAC Control 21 (register 0x2b) is SLRCK on the ES8388, but it
is LD2MO, left DAC to the mono mixer, on the ES8328, so only set it for
the ES8388.

Tested on a QuarkPi-CA2 (RK3588S, ES8388): capture goes from digital
silence to working audio.

Assisted-by: Hermes:deepseek-v4-flash
Signed-off-by: Bob Hui <bg9oxa@163.com>
---
 sound/soc/codecs/es8328.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index d7f93de82f69..415f8c849271 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -13,6 +13,7 @@
 #include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 #include <linux/regulator/consumer.h>
 #include <sound/core.h>
 #include <sound/initval.h>
@@ -836,8 +837,26 @@ static int es8328_component_probe(struct snd_soc_component *component)
 		goto clk_fail;
 	}
 
+	/*
+	 * The ES8388 has a single LRCK pin, so the DAC and the ADC must
+	 * share it: without SLRCK the capture path never gets a frame
+	 * clock and records digital silence while playback still works.
+	 * Bit 7 of DAC Control 21 is SLRCK on the ES8388 and LD2MO (left
+	 * DAC to the mono mixer) on the ES8328, so write it only here.
+	 */
+	if (of_device_is_compatible(component->dev->of_node,
+				    "everest,es8388")) {
+		ret = snd_soc_component_write(component, ES8328_DACCONTROL21,
+					      0x80);
+		if (ret)
+			goto err_slrck;
+	}
+
 	return 0;
 
+err_slrck:
+	clk_disable_unprepare(es8328->clk);
+
 clk_fail:
 	regulator_bulk_disable(ARRAY_SIZE(es8328->supplies),
 			       es8328->supplies);

-- 
2.34.1

