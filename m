Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D468249362D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455964; cv=none; b=rhit8lxg3s2yehoJvJSTgrc13vxBXDu+CHBsbRyWSB+eEr4LhY5dPEAHeljFoAdV0V0kEZ30522jKp+xveGUOF6ZrOIy8ek8Ov28XUn+Iz9AlEFhPvEnHbi/B6ayiN6dDNS4JM9kX0QGmiDvIa8FwXPO8EauDxw3PKqRc2Q0Fjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455964; c=relaxed/simple;
	bh=P0PnLczAmd/aMiJpLkV3Uc8hCTghUUniVfLHJq8xHow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o71pKHzl7T40jXYy/qkgFblBOGAQ16ltf0gx8cJ+yq34J0r9UEuR8WpXs+ee1Dcu5s55+BuJfZguxpTx2EIwFzAxFyTAAuiZH4EgvdThlyYjwU50hQ6PgzTKgf03e4rRzJ8msgRonf68ufqAuMPkmZFkwlWBQXS7tAD63sTqzTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfajH7ny; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfajH7ny"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3516c82e96cso2572629eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791455962; x=1792060762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eUBcm/HidbDHRMMNHvpjEcX/Cn/b4904BqGN3eWGjuM=;
        b=HfajH7nySLUxysMtlztgvqFDcQyqqn+Sb6XnGG8FJunbnUjPiebSXZuDXRLYo+DvLv
         d5eu9KozxnVjBoYt7y0/w571Klj8Mmh6gFzLPHhCwh60poUdL6HL+FKBTxc6l9viX5mW
         x1cubDJb6WtAyc7mQe2ldVuncUfJXMRktFNbPZ79ahtcdT0Iu1KHxrMBqIku4U+McVb4
         zyJBEp/L0Zn1rIHtsJvSUNlJElNLtACNw9fJfGBDbW4fO8Cv1Xm/UIOSA9zbb2OeSYjR
         SMITjhr/Bi9omvLOB+LOrWJx1hd6ZjzOomqHt1AGBsQPOZfy2XPMN7zblD/TUg3jGeve
         hoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455962; x=1792060762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eUBcm/HidbDHRMMNHvpjEcX/Cn/b4904BqGN3eWGjuM=;
        b=JQUTgIWyV+yBqpcfTz/EQmwBZMI5QkP44KhZ8No3Lkvv9otC+LbygLPrkJFO3vt5Ko
         HcJOZGAh39CSAtk5tkrIywrlOuRo+ylTzuf+RTyXrDCugVlZcrukQDMs1lOjD2LQcs96
         gc9or6LW5NRx+EotPyIUbm/32W9Ream+mC7Xx78bFwJA+pUyU6Li5L3XPwlrAGWPcwxo
         PBT4cs/K1JOvV0cVMh/EAZ/NG6d6LX31ygTnm8OtSC8r+Uo8IZBAina8Jk5M4bUcjGVo
         Uqn/+IMxuV0X+o6sG+IDq8t4u2WFDUcUsLhFnWVhtX/S2VfSdgOyJqoi79OpgWXAksxe
         zouw==
X-Forwarded-Encrypted: i=1; AKwUvBxd7rvZdRG5mIZ5e+dYRXwil7ubCTSJu1crnA98SmlDvLs0vucFTmvSoMOChlNDqxfEHPLGu43A3xOjCWg=@vger.kernel.org
X-Gm-Message-State: AFuF++m9Vq19OZB0YlASHkZtEIzg01d7Clf4qTgpinuOehcd0iXDLjyC
	Yi9t80veCGzkdKWWTQd5Fynxn6Oj48sJhiGAkTEr7E0EYhp6wsEm3w5L
X-Gm-Gg: AYBFou3E9BHaMdlXC+0CAc5/pfEowUSL50mCHuu3NF0h+3n5RitCVxMPxMS8ZzgoZgS
	zeGlsCs8R/qYDxlYfnI4s9OjoxKB2ocusgLQq08Kaiul7BshFW4qEOWO/zMVMiNeQK9OOGpPdOM
	QlUA2+RHrSwN7CC0+0l/cRP99ZuuI038b7DYUELg2RW9btTTy5JEnsG7PzFoUnd56MVDeuHw72+
	xD5azMIrfXKeEaZE0bIPxsuN1rImwqUeiteETrdTHKI+7mkH6rt4wJuorjBsW9QksLC0HNgRfuf
	grzfrlSltAqH4AMb0vpZ9a3tMDFziwYJL/xPHbZ1p5XZDdWzlszkZndhoCfipMNKMi2tAfCTcT4
	fb+ui+k3fbJqczvHdo6sKlQqva+JHrjYi1ECc02Erq8lQjFYyHe9maOfVEzk2cf6/N3BAAk06ce
	aRwZHsaxsduv8GY5fwI+KmIQZHtsW1jkTyaSB/koST9J0CjfrtBCWXyW8bLrsNz7NT7f4Y0hktX
	Zgxt0JtgyTW6c9qdjBZ9QFgCvaJv330ZbhdwjZPsEskCbU6Cs1H9ilvonPVVsx81Uxv2JUKNmQC
	AzZO7/h7E3SvhA==
X-Received: by 2002:a05:693c:41d1:20b0:351:b65:63e5 with SMTP id 5a478bee46e88-3515de8cbe2mr5796544eec.41.1791455961706;
        Thu, 08 Oct 2026 03:39:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:39:21 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/24] ASoC: amd: acp: Fix .close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:08 +0700
Message-ID: <20261008103831.542533-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp_dma_open(). ASoC only marks the component as opened when
.open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 623621a9f9e1 ("ASoC: amd: Add common framework to support I2S on ACP SOC")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/acp/acp-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 6b1e18b31c1c..ba6dfe8fb6b7 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -248,7 +248,7 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	list_add_tail(&stream->list, &chip->stream_list);
 	spin_unlock_irq(&chip->acp_lock);
 
-	return ret;
+	return 0;
 }
 
 static int acp_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

