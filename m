Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DB937F01B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123838; cv=none; b=HVpdFJtQkHCr3oTw6TEswJvD1HIKhe6awnNTVr9r1kjTn4SnaOP/9bIZPIiHbdkIPFrhNw8+7RLGJl78klUxbtrH2/uGPuGf+eDTvf+vW5P363wMrWnlCQ/TvqWMYC4f51qrB+uEdDrsAOh/6ObjZy2GeT8+AkPAE286Qv4lRuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123838; c=relaxed/simple;
	bh=6DbU/lmMa56vZUldhssy3WWvEn6fSDga+TC7sPaI04Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BB2Lf8FddwC9mrZH9uNbJsmtpwlCgqiDIOqmMupUVWwtyP8g6DPE3el+/ioCWRmXXT5LR/0roDRCnUTGo0fwGfTJSosj1TWJs6D8jsoCSsIJEwKtkNSly/L5l4DkjwGP6fz0E+M5W30fJoaM7IUJQb4AaqgQqja7AVNPNriaqqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/mtWPSq; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/mtWPSq"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e812e2b31bso34989595ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123836; x=1792728636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFH69Gbmd4pLwYRTdAmCw0agJokE4nomqHT+KuDYM2c=;
        b=O/mtWPSqVqkqW2KAaz0BD7lHiozjm5O8Xhd3n2ZaXt2C4y1QqMgYoinNz0LNblv0zm
         H4ny7/WzbEmreH3/52WzTofJeVUNnSOVexPg6GnEnI+wyMzYuu0pErvkBPRBzlLH72/l
         D/I71YKL8HHxregDpZWntCtdWrE2PJ1qkwvbkAv9zukfELyDG6GNacFJXHgkuj4TR/6i
         Wo/0dDIhv1NykhMFNN6pglBbPSGnVO5dtdcEggyQXcKZdEPg0AtWrRLXCnLuvs+WpRRR
         sKzFN8wyp44xHzBdIEtty3F7J+MVlGUxa5WDZioMJBLvtpWiNgGEFjWgzY9mdKLdjSYT
         ZDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123836; x=1792728636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QFH69Gbmd4pLwYRTdAmCw0agJokE4nomqHT+KuDYM2c=;
        b=mfylaWCf9dJv3p3bOwvaf/Ze9QyDdTJjTXsB7fKsAncdgeLmnn69RoooXEPxEKlv1R
         X2xm7PJ8JZYBtyFq8PUIHQ7vyRBHQPJyR7ZIRi0qAYk0FPoSBmxzg4a5teh6bSJ/I3VD
         bkTGO6P6451PVLURgxV8gIBRsdE8UHIyEC+DS9dgaw4R2J1nmPDEQtBE/V5zLtM05Shl
         VJBi+LOQvDqj/5LiEAMZaEwNWA3DoFpTVoUvMl3XCXqaQj/V2G/ZwAGEEyFEfUBNzdvW
         3766h9Q8nDg/uaxkFejG3677f2CEH8Bo95cNBupldbTy50S/nKTh9FMPJBkJmtxKKMk8
         3BuQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/KdWjXe2F1CwOsiodq/MEy7PSzbbUcJVSNAAV576HOB8Zk9i3TeV7xWd3eBWH6OnQJHqK7D+mbOs/6OU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpo5E7qbU58yYdsFyE3gwzOJpv5bL/gG8DpeJ5iNJkNuzlJ82M
	9wybzQ2XHPXGMd/LNQE4yOVu/NmkM1ClSk8TBoUQ23qqKLmSr4NsdRZ0
X-Gm-Gg: AYBFou0nVcwuDor/653JTtdi0PSIcBQKnOFuvMYclUvO+o++Ry0wlkkSudgIkRdoVaW
	SPZJ71O1yC7ORfqSH0Wv6bwRiwwW9WRZWQmZxg7z2jlYJS6Pd9WKoX+B9NSK/nXjs9iMY1jFDb9
	OI3XsPPun6PS2+s1WN50dSvnHNnweBIDkQJUSkyRf70pJNa8h+kk/ido92f6dXb+7qBoYaI0zAw
	6hDt2uysFbHtC0+fwYjUnYdsM/v7w6sIB+3PoT1w8vwjCRocxmcN1lP6X5iLhUVk0kgh7z995LW
	rjeViFzPVRotpUaJ2LWgJhQwJfknbnsSU+imc9Ug1KNB3qa1VGtn4bPxppIo6pQUskJCTH+97vY
	m3UB+w2J6ERLhvIocDGkWrQD10njqj0dDUyq9QWN4SZkEML7FQLxDwkFlBAMP3hUHbcKClddeXy
	BR0e9XscljzAsF4ToGo6oiT+BsY8jmPWJ9MW42V5SdXu6+vGsBeRXk58p1UqJA6M/p4R5nLGaTW
	5mne2sOH3hx7r4dbGv0VXclfLr5RP+GP5GHEHC3EkcvhJKrbVhOWK7vvMR1CmX75whVC4do9F/s
	aYkj5wVMRslDyxMui5f/T+Bk
X-Received: by 2002:a17:902:db0b:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2e8427efd9dmr210035865ad.5.1792123836136;
        Thu, 15 Oct 2026 21:10:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:10:35 -0700 (PDT)
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
Subject: [PATCH 02/11] ASoC: apple: Explain DAI startup return value handling
Date: Fri, 16 Oct 2026 11:09:37 +0700
Message-ID: <20261016040946.521195-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add a comment explaining why .startup() must return 0 on success
to ensure the DAI is correctly marked as started and prevent
future changes from reintroducing the issue.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/apple/mca.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 3585432ad49b..26022a42a95e 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -535,6 +535,11 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
 	return 0;
 }
 
-- 
2.43.0

