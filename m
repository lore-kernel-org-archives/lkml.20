Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC85B383326
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123875; cv=none; b=OArnBkrZE73000nBUqaR7bwPNRnV+4Z/n4uG3ON01Sydls4YLQ7nTE672dcI0jWwROM8ch41Ax3Kmwh7g0XsYp7g597rTV0uruJTvFdizkwmT3xSRyJWxnOZqnAP3dNbiEfoyPkoVIeyh2naFxmRTbvcIpxLP+q+Ta7X7PBzuZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123875; c=relaxed/simple;
	bh=fvLkZCJ3WJpgMh2sp/BTiEgwAehjZvHvIEf8HbSdvgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JpDxXIc9hP5ijngmghgePtUd1EGsOaEGcrxsQA2Kg7PFLGXMfjyRlPKhQ6ji3p0ZQIq/SUf6HyCP2aMEQYK53sbN4LBDXh4tMM+FP0fuQskoX83Y8hHGcfYBqlcWuXNG1vi6qljvpBTK1UZQTN/UqXBzvH/meCBVyUh5pBsSab4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWTcK6ml; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWTcK6ml"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e812e2b31bso34992265ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123873; x=1792728673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXlahNE+Wx5snJLp/MKBjKZg6Q+5VrSpbj2QDx2YWrA=;
        b=SWTcK6mlTespOusNMrVqRmrNuyI3yJHZ41HIRI9M2RQM3wqzAMKyhzPXyKt62tEwM4
         Rettv98CuFU9KUU7SnKoHG0496CGyYSJHM141302+uZvvzVSr3xWsAjd2N7T/y3//mT/
         rFoP3KyZX9CL/nKcLdY8SqwdYvmmsf/mCju5eHdCvMQLLXwZQB9srqPMYjyQ45Eb0bpW
         vW2gEQFJLqa2uAbZNITBboMpZK66VEm5RJTLT7DSHM4Gp7iSijFjEkg0c5YaQ0i4R6ck
         ePh0xbR9U9O03T1GiJU08h6nHpyPg95VtwdvPN6xUNTgu2ydFTMV0lZbUfn3LGNZo5YM
         9qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123873; x=1792728673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QXlahNE+Wx5snJLp/MKBjKZg6Q+5VrSpbj2QDx2YWrA=;
        b=sSiArVL8FPWjJOIF9LlDQKAyjgbkB/eW1smricdtilLnQoZcHUJCwyPltlKPRd0Gzs
         UAOx6dzgAMdKLx+x+FWSL/Xl7o88MkrFNJYYOetURapsXTrHPj0m9MQhokQ/bg5ZlMeX
         taOAwcjoCe2SECcUJvly21uGXEf4a/B3BqSSOVk3nKXbrIhTtggBG6Jxym9bwFbP6G6i
         4tTTXf95KYgSzMG1FgfI72yq7WoufnO69+ED3YlZuZAIF+aaGjZopi1oB+vVogu5Bqm2
         9MuLDx5D6ZLHN3Q+bvD6V8Q4Pu0rsLMGaXPzIj5U8nb6bL1DGZiiKAY7gdjnPuLCAM59
         UB+Q==
X-Forwarded-Encrypted: i=1; AKwUvByiyciEyxt2yuPSnBEIisW/rZplK/rjKigxooBldxzaeXN5jqdUPKZ4HV5MHJfSoAXSZBLsq6Lg3JeMpIw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8wla/t8at1LPlxxGGQXzD5wLvVpkI3u78Jv26SjSIGV8NjLfU
	0HlbLnqJnf1/FZVfpKH7RUD/q47iBILXbiuDGUQPwg74PW3s5/CjutFs
X-Gm-Gg: AYBFou2NYTI7oTy9A1zkVHi/79K3sTWqMmSZlf9l27eG4+UmPfg7WgGubytW0J99Tba
	LLDS2XsR58QAz9WEIk7UeYrAnt+1D65mANOx2gggNFfIGdJ1ky62JlyXVuZKdoHEHyCKzlz+zp4
	vImT6cI0cLdeBYx+d+jtJ4xRY97XPbL1zE2QM26M3K2/MfyYM8CXVbKUggABhv6MTLulrEvsvx4
	y+4jauU8h9co+K0wElfxan/pvw303luhA/qDS7G3dQaDyITuscBnDgkBptYyUboG4amvBBLSBfO
	G+ZE97AMYzm0oPmHqdrnX2/D+2AC1YPDlaTsXXiUoqvBe+UjVpmODCnnIOB1AtvZzzOReEWKti3
	uCcfm2PIHeXvQQ8eiiTvGHZclLKHOpYJHXFbnKAniemHdnUBAfuLVEKNKc7YbCJUD+3t4bATkFW
	eoy70EOptgFdaoAU5WjIlADXZvdMlcwJoztMEMnoFdaO9kFU3ZUCp7zxQTnwIADZOBaEYApmbMk
	UaB4hzXcp30QvzmSOnoVuoCYYv7FsFC4TaWryrI9ue/+7qlBXdRe/byyFZ5/Pimrqld5q45hgNa
	QmlUpLACCLSY2A==
X-Received: by 2002:a17:903:19cf:b0:2dd:c100:4b76 with SMTP id d9443c01a7336-2e842ce7c78mr210820935ad.45.1792123873102;
        Thu, 15 Oct 2026 21:11:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:12 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>,
	Chancel Liu <chancel.liu@gmail.com>
Subject: [PATCH 05/11] ASoC: imx-pcm-rpmsg: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:40 +0700
Message-ID: <20261016040946.521195-6-phucduc.bui@gmail.com>
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

Add a comment explaining why .open() must return 0 on success
to ensure proper rollback handling and prevent future changes
from reintroducing the issue.

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 30e75fee5175..85b7c929a28a 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -269,6 +269,12 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 	info->stream_timer[substream->stream].substream = substream;
 	timer_setup(&info->stream_timer[substream->stream].timer,
 		    imx_rpmsg_timer_callback, 0);
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
-- 
2.43.0

