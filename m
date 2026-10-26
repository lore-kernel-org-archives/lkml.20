Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013042;
	b=ifZEWwCzV9uAf/tjCJapofjay4xgzV4el0aHPUzoLhq2r0PeXu1dAVJYzwdGnBbsLpzT
	 H4E2m0qoBH50P1DN0KhVkPVYqn6OeuH+h1K5G0fvaqUYC1X9hY5pjVSSvf2tlCT3mjfht
	 zLJNWOJdw92+rtEbP5EtSAxWP5PsNWjs9IU8GdBgXjlthUqmv7EkwJjGU3GfuY+TvjY4r
	 upbBAaZxXA1965odcl1QMVzH4juFEYjz/5mXBfBmKiF4N9QnzvDMgeMGcJUKYoSbsZijD
	 p4kyy4Q1GYK3VBz65E2f3YIf/1HjbIlbWdVnmebLykFeVsVVN/Es11Px8BmPnckGaOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013042;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6GdmF5pi7yEsCg9Rw0PC8ebq7FPRGO6BmW9vfgGGb8U=;
	b=WJEWe/dz66EClxHKB2zvnIg6wr0wtvfgghJBQ9tyrda3q8vYHs1sGhwwm6qcaZfAeBQa
	 /Vj7edH/kPH9EaHK46BX0H5nN07S5UhI2TCZU6O7pYx5QsZZO428KBfHIgH7R+atBXYa3
	 fo/bIsRyzS0rnj0H1OwOQTKK9ziZdo8ZdbhUUeVaYsO5X2wYfRYjyrXGx7zqmqWuG8BTN
	 z0SZR8ce5He/zBLEfLwKsE5zRQI6oxhEFlV/zBkPRfjVNKB0Y71QloXPNMqytIXh3pBQj
	 keroS/IEAFIdKLbMxoRpUNdg5SY/DXVc2Vc9e6khacBY9z/OESG89cNHB0F/DYSUvWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHC0sjpF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IET7cFxH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7AE60A6F5B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC7AE60A6F5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHC0sjpF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IET7cFxH
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt0uX2732751
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GdmF5pi7yEsCg9Rw0PC8ebq7FPRGO6BmW9vfgGGb8U=; b=eHC0sjpFWy6lZkCF
	g9ttsTSmQp/2J04MhM4gBm4sr3cOzzALY6+oTw3QLWZj/4XmP3uq3nnH1s8/pG/p
	sYwvGCDFKelPEYdRlvjslA4Z7p8xCRKJqy5eLLiizfn8HSQvILMH5W0z8ZuU7uF4
	GoJ0BaG4R3DkoUJvxqvLnQlp0BDI9AgaeWyi27on4wywqrhYX2w/Se9rYwSEKwPc
	CZDjCZZKyge9oU36U2QtOmw58F9V32Xn3QnlpHlVkTZhtxUsJNaZeV1iwVJIdNHE
	99X8QqGEY77z6IuYIg/r7/N8nKJJVbR3+V0Xmb5Zy+tpZ4x0ExYsest1Sku6pV+q
	J04aTg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8bb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:10:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so522471585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013040; x=1793617840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GdmF5pi7yEsCg9Rw0PC8ebq7FPRGO6BmW9vfgGGb8U=;
        b=IET7cFxHC7Z3zBRuIIBMsU3KYirJpiq370YfmJJKoREzAbdpY6e4uHnhdLUz/aec9m
         CRapcJjvNkf0GdFJfKJdQMwMo3THTb9TTtCtAlLr2vx35BTLLSPYDffY3EfR8Fydyvnu
         ORGBSxfOEgrnyZ64683s/wWB0SsOK+Pb/EkYf3IBQCUhjb/P+N0gsNV1TNhdB7j99tdL
         tFvvJlVvZ9JeGgmgYADZMzPeibiPsP9bM5B9eAWKviFTuvcedJ0j9yU7r61aDFHHw8fv
         ZqZn4c3EyDmzzoOf48hRe54hHk/5YaCPFqgvKh/kYv5Vd07Ev8Qcm/6MV7jquQy9ye6T
         YXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013040; x=1793617840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GdmF5pi7yEsCg9Rw0PC8ebq7FPRGO6BmW9vfgGGb8U=;
        b=uZqrqNL4edGQmCjngIfDJzG56bPhzoZ5MX+HM9hEMtGaNzGQ4DNrgRJ5Mi+6y+qCDK
         TRS4xzTjRHKmJZyAWlHCa7rdgehQxUyO07S1LEX2gDhEShV1E+hmQniKyxbNBzAPyTRv
         6kzs5s/5n2O0WweQ7o4J4RD8aFGJdEwSIwTlnK5RQW0Wq3x7cmzsGkQYNaz+kM9yyEfT
         nHAtOWRzv0lGIAq7x4W1kB4scCWaOz505jxcHKhCWaeqz9cAsVnIHewvVJiF3kc9tdWk
         UpbqGitrCLRE8d+8u6qWMy/3/g3MnGwrvdJkXxDbyE/iQIDNCSj9Pe+cP9yy1MPTiVf8
         ru2g==
X-Forwarded-Encrypted: i=1; AKwUvBw1ZcF20Kes46oWkPmU3sxnLiHNx8USVDhiq/0R2scp00K6S9l0E3gYYXkoeU9rRwlgWz/GY/O3kbexX5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKicnNQmeZ47Ib55RfivkMcwXDLoRbfoz+PZWlJs4IXZHPw5Qo4
	okN2vPj/oet6gaA++3GYa7NkYAHo7/bsdg1M88PMBvTGKiUzQb9UVfFtKdSgeNE8D2StFuGFa9N
	TbWGveCKCn1WEXVhn5lgv2bA/u+JP2yqokFBBfQdts3qCGDe4EOK4juJoGrBKxaw5qQI=
X-Gm-Gg: AYBFou2vTgy4ZfUtQ0i0tGHgx+6hAz1a1ECWbQJkOlwR4kQhXF1bN2Fc4rdYxprAyF9
	IEykGAAWIaowih/ManNtdMXFN9gSSKz+IqAA2Jih/+4lgeFC8XOkmNfOIdmUgDQhUY5qqcrxxt8
	/vzr0P9pwe7J7lw+ualmpn42fjjpqoyja+FPKg8zOFpejoS+MxTAkvVOkvjdNJjoaKGthOglGrW
	uEznlEfDpAJK1hVp1qDB7FikQECRWwmAlGpNRXGqP8ZgZbPOvFLaNk0ReNk52jDLTotH5G3y0/4
	eTmFq3flUMee8Mki33YRvivCrdmnd3NW67Pb3eVeQgUOEikf2yw7Z52YC3M3+6mfVa/jHalHflw
	OxwJFZAqpPkQdk7IWbOM6l+4+qD9rMBlO+N0B5fpxmmYCIMKJ3DKJzel4hFChdVKNv86+zr8MPT
	2xTuTQGgcWkSsW
X-Received: by 2002:a05:620a:4586:b0:93f:5ac:14a0 with SMTP id af79cd13be357-940ef9b6fb7mr901749685a.67.1793013039646;
        Mon, 26 Oct 2026 04:10:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4586:b0:93f:5ac:14a0 with SMTP id af79cd13be357-940ef9b6fb7mr901737785a.67.1793013038981;
        Mon, 26 Oct 2026 04:10:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:58 +0200
Subject: [PATCH 09/35] drm/mcde: use drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-9-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
To: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Alison Wang <alison.wang@nxp.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Igor Reznichenko <igor@reznichenko.net>,
        Michael Walle <mwalle@kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>,
        =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Junjie Cao <junjie.cao@linux.dev>, Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Markuss Broks <markuss.broks@gmail.com>,
        Artur Weber <aweber.kernel@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Yedaya Katsman <yedaya.ka@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=921;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZbTGn0s45rat3TeuZ2gFUOSQlpst/5WgxsMTCJu8VCc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUJP3v6BZfeC4OFDrgkWPjUT1uCkaMqjHRVf
 A2tXDwlDjmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CQAKCRCLPIo+Aiko
 1XkgB/9JEwLFkiFvNLtfnxESm9XEbnCBOdIvIQKtoxuj4kTs8hnTLXQlTz5Hzr2kUFMOQlpSqRf
 xv9ERSCZw9qYrIrAuufxZ2T8vMs3Bjvii6zCKPdB2cVNjXz+nuCWQYKWWcpXcg9xca++XYSRsE5
 awcQqb6mq/YRDLPMpnbnCLP1Fh1zY38bjUeY56X606lSWioHGxZKxNjqC1ByedyyP4NsZFiOK72
 feZ8/uEcdZEbry73xa/aVOClo7qCAto6buhgLmjhnzbaAleT80MWB7YJGHOTzueYLr5/DSHzjJp
 ReU4PLvlOtFhS5w2Ytx9LA/4RXok5fGUyvuLce8MIiC9khXu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXwITk+3IuHAgg
 /tGJybfKOcbcIEfSlUe9hIDBsocgZ6sWc6+tXbNW5ydSu5Jvg7t8/nhA05AbONdHd/iJ99fN/2N
 fSxwDwY0qP2dPJJANfX1FqEzD3hBRpyJGxjzN4F+5GnQlwWelTKwV4RSz/R/UkQMjkSgZOXJCAC
 voRvXlpxtiUBOFRPwNO1vlYjPBs0m59fQ7GpnRsaKAEuqmPzDpsSQ9deKNDHnZ8BfyQN+tJ7aZY
 vEzoOIT/mspUl7Q3cRfSmZvYxvbmLMXw2DzrsPNmSdLsdlY5cmvxkMQfDGqRO1xqoPdP01/2CJF
 jZdDcOwx1J+HLt/OzjI9v7qjNvq3//4grBGjRFVlm/xc/2DtqbyRF/W3V8hdIsAa5DdlzqJw3CR
 jAfSylRpJ8n8cFTNnu9/q5NIvep1lDk9jPFtyDdSMnnS3I5tMN8+Ca+ei0Wm226JEg3WkZlxOB4
 cmJ3uoLFM4OCh40ZoQA==
X-Proofpoint-GUID: 3wjWMAz6LSNLgbVzrx59eqxo6gcuVAwO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX3AnPL4pdKw8M
 sZEir0FjpK5lvY1LvXkasHtSpcX/oOk19/h4r2txXukK9O3dKGGI9pUftKy36b7fT1FX2YZXuns
 ViI8unQhge5XPK6jr/EscE1OY0UFQ/c=
X-Proofpoint-ORIG-GUID: 3wjWMAz6LSNLgbVzrx59eqxo6gcuVAwO
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf3530 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=icLbHSj0goCFzy7tGMwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The connector type passed to drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 759e279b645a..b5bceac608de 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -151,8 +151,7 @@ static int mcde_modeset_init(struct drm_device *drm)
 			return ret;
 		}
 		if (panel) {
-			bridge = drm_panel_bridge_add_typed(panel,
-					DRM_MODE_CONNECTOR_DPI);
+			bridge = drm_panel_bridge_add(panel);
 			drm_panel_put(panel);
 			if (IS_ERR(bridge)) {
 				dev_err(drm->dev,

-- 
2.47.3

