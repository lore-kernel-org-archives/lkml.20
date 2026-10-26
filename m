Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013064;
	b=ifi9L7Ema4YkfHGxkhq2xdBAjADLo73OW/nm89bw/WQrgncB0nImhW2v7Z/QaD3fh0RK
	 FQ4yuL16iJjK0QpX+NtMAidFAqWT0bGjFv9PMMxbyVA8/L0bZbAFd0S1v2j0t+tgM8j0s
	 pAHTKthfthsksUcblGiB+VXnbnevO6nMWQ2lsBJLXX5AUiGcpiOTRr/Cldks4Crsl+Ziy
	 YbiNC54N0zOARXKZcza6J5FbWCEddI5FWGgNk1jkoF9xkZkzKHLUdXSFK4y9hcN0TggB9
	 S5kVni/dl2m6YNOi1qBSViPSb8e3X7X19ILIWrpSXskpgA1yUXWe8rpYnYqD/f2wkrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=;
	b=tYbIEoPXT8SMc+6DmV6T/PoX3uzZopae4unBiPeA3g4yzjk7lzqo/oUF3b+6c84wTJim
	 Pua5h53ZpGtKQu7vI3Goqie8vBjnjL+a8gYaYmwHJ6PFXLZpSkyLHCOqbvfk0VNccQEWb
	 YqMLqOI+hfjgwsTVMhP2c+2YoGltncMjkVHpUnLZ1aQD4fk5iDAtQNvKg0L+c98tlAKgC
	 TJJezgbscJd64/CwgkEUvYVsH8ucDhygWfe2qOpeowb+Co1+JR5Ucj5ZMWs6xZLT44zYY
	 xJ8czplKm8P07283uBEQ84bC+KKs9q0X/CC1UsE27VIsyAQoTCFnckcc63c89xsBmIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CoNVTt/w";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G3VVpGSk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10060606E73D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10060606E73D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CoNVTt/w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G3VVpGSk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtKSf2541824
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=; b=CoNVTt/wg0dZFClx
	IKMDZ7tlMz+/NZn73DytzEzpH8rMCz2JqFK+bpL6iVSbKYS64sMCiau/NPeFLMQc
	qaN2SPZosMEXZQQ1v9n13dzA/0NLEdG124wtfe+rFuOoePloJRl0awLDq2OQOs+W
	SO7D9J49wPSnd3jrDGRH1LCsmpURaI4vpnbP1t74IR4R+dsCcHJAw4wd3rfhhZQs
	kR5Tm9g0mkTjSEDP82haOZuYqFwIWpAGnTjYpWJYlLGsc4GudFJFYaJv2hop32FN
	Mm26/TxHtuMTR6+s8OgmAPhPN92oZAkirFyg/Yy4tebL2tM0kdZ/Cq1BGjqSqUsj
	wZZ7cg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjda5np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:11:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943e8ff02d0so71810385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013062; x=1793617862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=;
        b=G3VVpGSk6UKh6s0SeG5WW6AzVP8rIm7HDhuuyLkxLALU/FOW0U6+EGSSnoWMd4zpth
         ViyCQh2vbDZMDcruecO/gVE/+iEw7IlwkBNa+nwWqbz5v7CpPsAe1IGC2mIXmlap/EBE
         5ma/HrHYO5HZW8w+KEwccjpzlE1uO7YVQPC+pW6bHrCtSw7lSP1lzVPEH/ipNXWPxg48
         JIMsZUvJuz+bUVEum1WCG+onexOieGyoLpAYkx2lMjrc5vosOhRiyqdOa/0QUaxn4LL0
         DhuySKxOm0jMrGIOyHIgbhUzAXsl5oB8Ss77Vv3qwquuTq4Om0YrKvY9FTfWcDr1UFB0
         sUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013062; x=1793617862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=;
        b=WDo3nuPpfvtiX0O8tBEwbj/FuxtJtfVilcShRrD8bAtnjWKl5TEFRmACYfv3Cfx1Gm
         bAyI7yxrmo/WE3U0PlyY6Fil9yaBRl1Y3j9nrgBmg2JdkNOnKOFscDXGG0R12aY+fIwA
         1IGJ2+6hW9qRNku7ZFDQCqvZU0QIt/p3SzyVwg9T8gTG4qjvkr/jPcPY0N6AD3FpIb+g
         GSSBJEwzVi9vjFVA8caKu0m/9Xrq3NDPOOJspUgWGNHUo3YNV/deL+qhwXs2acaK4lgG
         VZCmOTAhSRMrQDA+q6O2eCvxVwQC6O6QmOCRP0c+qpfSR8RczU5QGamjfna9VJqWF8lT
         yjow==
X-Forwarded-Encrypted: i=1; AKwUvBwn4mW1AN5UwILFBfuxen06rJ+bODEyfqyLgbqbvpHPE0ODhSyk9jqa3rHwx3jTmW8WS+xld3uCB5CrOaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8bt5s6DoVPHkcbxeFq0c4EAzOq8q1iSjoVUokDYDj5CP7hXAD
	6HwLZCFjT8S0HlpqzEymuNHscR+mbq4fq1DGROjEqN8sVPdBjBEWSAmQXRn263GiE68yLfcsOub
	Sus1GOuQyD05l9MZlzhVrUKoY/5cBRIjOXW1iEOXOWhspouQee2xpvRJhddZvVc9gqgI=
X-Gm-Gg: AYBFou2Jc3CZjH8YdksXJrXzTJApPL4hBP5fdnvxRkkjvKq4F2dNRfsTmiHR/9BtE+9
	sNRU8YPD53nPI3wDEDDB4sha/CcLYIYNrE+3usbcSRBAJm2/cl/iex7683jZ5RA8klJwqhVCmp5
	K83X00+lI63hgPvb2xdr5oE6jHmxz04d191i2Y08CFW59uOmfYdIKAhscftWiRxt8YwBr+bTOwE
	0RKsTV5oaslzCF1ceYqnoH/q4FUDAEFVOvmX6le03J5fP0JJ1xYT0rsULNXP6+WDM/org6GjtRK
	6q6mWqAc/T//2GhQf1dncV1Zk0GnmhYCuXqCK5824sVEGmqODneiz5Uxj0cYcRlIQXY6D0OEhUV
	sJ9KuWbEWF/K7iAcBLwKGAXxQvJcatIykr+cuWJxvf5mzm7WnctBrjOEDM/FBoDbXomgdFC4NTW
	eelQf1qje0NYV7
X-Received: by 2002:a05:620a:1a12:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-940ef9add84mr1002516785a.66.1793013062057;
        Mon, 26 Oct 2026 04:11:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a12:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-940ef9add84mr1002510785a.66.1793013061497;
        Mon, 26 Oct 2026 04:11:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:06 +0200
Subject: [PATCH 17/35] drm/fsl-dcu: set the panel orientation on the
 connector
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
Message-Id: <20261026-drm-panel-funcs-v1-17-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NybjcCZxaVBV8YlLKaTAyHmm87V6T4TYtZ0TLbzplQY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUOmRe8CEbGjT64KtPnEJZg/5EMluF4tX1Lg
 9OIb9ldBJ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DgAKCRCLPIo+Aiko
 1QpUB/9uR3l3GfVIvTKbA10ZF19l1tvhKCRzqc+3iCVH6xmO7vqg1/9o/l9+GRVdBZJb7Qt+ZoV
 ryAW6z5syuqvIF6XU/Z1zs3gzoaUULDp0z1E5cxM8sHDD2KSmahajUh8mhN5hQpY/NdAmWWRybN
 HhPwxvxRuXM6fIyMbV0HOFGjniWA2/TJ/A48YxNlva6uqAIq1y1+Oj2SbU1jrQCnlvCiX1xkb1B
 xP7jH7YQUa+wkP9/hVqiOMclVILAluZqPYKKB2nJJuKsiQaDPiYAjazAxr+x+vVIC0RJVQaLdl/
 BiAVwbiKmq7eT5KFJTtY7a4PdKMB5tGgv5ni4kck/fYLVSrD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: jV8RdLhTOBaCxtmMu7rC3C0VESBqbiIl
X-Proofpoint-GUID: jV8RdLhTOBaCxtmMu7rC3C0VESBqbiIl
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf3547 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=vjBfRQYTh69vIXlwGnYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX9bhhifo57t0K
 6A3TlWVx7aR9qlTUeIgy/Dt3uE75+sn25wlwy1yalVt2VYZaAFgQoJa+Hua5kc8mRT0J/Ud2zhG
 KLF6z7mUguvKZQVX83XtJhaCqFkJS3U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX9yH5+jxA//CV
 xyeR/mSj2By8rHkE6X8iHqjTCmqM+FE3p0MeKVDJrK3tnwaukBCwWLiUF0OsGijsdY1AOSoYGwb
 AfQj/GxabeAZL/2ecXEtTpY1TEToALaZoMky2CT3Okm+1TGSaDXg0A30cZ8HvUR0/u9oAQMiGYv
 jiENHfNz0rJ8D8effz+j0V0m+R7gP9nWX52zKOZPx8ngKv0/toKU4fAOr+RnBNgsfNLnY1VqKJX
 A705tMxQNQ+ABnNb7KvFIfNRKkLg+1xIP2HTiGLAnCQv5B3vEkMGSCG42wGXHxywALeF6Hvbi3b
 2/gTj3PT19ou0XlpgdowIgdx1nR7TyaL5Jm6GMfgorv2TZDYJn+LAo41COkSP+KtrZF0SptUuTG
 74iF5FnIYa039OMixE5mLDfnl0i7YtNE1C2j9rZI13EMThyQzYtK89mK7GO0ImpqZknhRewseFT
 JRRDl59Jiuql3bgMecg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index c64264541fe2..6d42376a57a2 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -96,6 +96,11 @@ static int fsl_dcu_attach_panel(struct fsl_dcu_drm_device *fsl_dev,
 		return ret;
 
 	drm_connector_helper_add(connector, &connector_helper_funcs);
+
+	ret = drm_connector_set_orientation_from_panel(connector, panel);
+	if (ret < 0)
+		goto err_cleanup;
+
 	ret = drm_connector_register(connector);
 	if (ret < 0)
 		goto err_cleanup;

-- 
2.47.3

