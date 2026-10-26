Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013083;
	b=DuLr2yWjhymygh9Jpb08PGyivnCbtZQzdvUsz/nA7hAS9/BDtQAqRM8Q5novEMm5HaHO
	 97hq1N9AfXNWbJid2AYbUwrBUlyDEkc4IiwlxgP0zqgCOgczooDWqKdf4DNCFwtfkK87U
	 8kfHcT1pP81uvxKDtfjaiWm5W1hZOUHtCrqRxkiIfNc//85tDndQ0JDRbMKiHXMT/UFL/
	 YNMFWBSc8M6XCU1fZIop5MSqmUxO1WkvpfbJiEdUR/JWsRqDou4CQIYphfAAwrpM4WXT7
	 4a28T4DNgjwSw/XcHUD0TEQOU21wtM2h7f9ofaYP1DzHXxpxiEvNrKRdchGpjkRA7Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E2vd1zU0crihOsV46gq8VNj28qagdedntjkY+3zV8OY=;
	b=s34MVE4eTq87razpgsJiPP/pJS4XAVuWUvtVa2jXcPgWU4oLU2FZbwzWvd8Pp3snYh/g
	 /qhAo2USXz5CkAlP+POIA5UCaIN+8oXtbcv+Omc70aXuzgnraZkeCmidMryQeVXCrdcB+
	 qrWz/6fx/T0DcDLeNz8vKP8XghV9S2CbgBusN+8VsBZFjPOMk1SQUH8MbD4KI3/Qetvhg
	 7ENKryUSflscbASH9J76M+Yhs75M45KRKfYL16wAX4J/zfpGFr6X2A4b9rVtCGmdtlNVr
	 h5/Ggd73SZokPMM5fdl9qxQjxTIgWypYoR4dcxlD8xByxcOjPfXFxGUtHSSoRvHp1RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pX9pQuBc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jdoZo6Km;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9783660A2626
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9783660A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pX9pQuBc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jdoZo6Km
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9dl3049850
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2vd1zU0crihOsV46gq8VNj28qagdedntjkY+3zV8OY=; b=pX9pQuBcYrrTZYGa
	IR+22GFFnxSXkCl4+r/Zm+k9MfSjpf1aScGy1/DAC4ZCAjvC528Rpe+c5+Y+xvrf
	rttqsAwh8D1k9BcXnB8ZtM9pMHkS9M66mTm/R355I1jtVcrbHrqCt4f7gTm9xTO4
	IO+wGHOOQrl+NTJ8ntssQC7uBwZGhN34/T+NMGacHbNqWbGg41VgJj67E2ff8T6o
	W4haZ4Ts3wym37/js8L+6lcr/mALsb/hHS6NcJ+wDB62BsWe2I0mzLNIWocDbQGD
	rkdz/I7wsuwGVuzIkCPqUfW3NsocbL+89jEfi6MmtMdDnuL3GBNlqWgoDXnWK8Wh
	AkVzkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9uav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:11:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so274734785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013081; x=1793617881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2vd1zU0crihOsV46gq8VNj28qagdedntjkY+3zV8OY=;
        b=jdoZo6KmTlsbEuefjMpOwcvx6g70lL65lnkwo+NrySnv/jTiHik2CsxiCKVhHXIl/U
         Sk6U9K6YqUeUhepmeevdFqBy2ovKfI2hLsiX7TowPFv1EpNkeioEalvriVZJQWInZcpi
         t1yWVh0C4ygYnGiCRHqTP1aCAbYAkqOmeC7TXVPB+qe0I0LXF/y8DK/xlLQlbC3rKXdb
         c+NMW4KScTB4NCRMtINicP73ylLU/JaaUpqHDGygWGv3wLLYnNKpcat8pK8XIUiRNxXn
         gGUsHq1lr4NzYbHzQFfk0uhjvxNFPDGcgGnf9BMUUYrEM7P0lkqqy/QnS26v7z8RpNCf
         VRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013081; x=1793617881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2vd1zU0crihOsV46gq8VNj28qagdedntjkY+3zV8OY=;
        b=GGPOiipX9dR50qhXZP8qzHGfiKkwghaZ1ic1rVU3DADQmE979F55pZHNw1JAJtPWag
         WlCjoxKHSKVq67aSW7W76Pet1ra5K6pCyLRC2PDT+sT1p6IfEfXDJiz+mfnzUmKMIXFv
         ShFfrvMcsihgROOchtAk+gEsIZfKoJbvEcR1+b9yqJxRiuHZ5XRnLuFBVtqOWnnfk3eY
         xBjTCARjGG8y6vSuhX3/o8JKpMP8vFqirsOihtZDc+P18+rBB0bw9XKYxZFipK6oLt0g
         E9yC6OlEdZVOGIrjhAGYKLvaAhw9oyQvcaKmWakDT+r+ST2+hxfMfaRKnUQ4I5cn9nO9
         vtPg==
X-Forwarded-Encrypted: i=1; AKwUvBx4uzZMXhIh5HSvNTbN4EYQJtklbaHnS0uelEC/AFpdEHiAOMoivPnsNIOAf8wqZPOacbcZbGUAqoudvjE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL53i87WQx4G8nqPhKP6hX0lp925J7QEG7eJiMmV+uzxmt3mevQ
	7SolAaoCpW5tpuiadVnOzkM/GWBmkBCqJ1qxOwIDdJGWMICEJdtglJ6YI/MVCNGjk1C2fqLzRMt
	Etky2F0gi/4qzOUpTKxxparL0jT9IdRk2vXKlJ+7OK8vBuXTkdqODglmQ07BUezemX6U=
X-Gm-Gg: AYBFou3yBKmXcLoWdQ5lkqBr3nknSSDWGeufpM+avjv06uC2VR2zxz6D4GYZ6l62btv
	t40vAB0tNfGhEt7Dd1HZycEpbfxx+uF4Q9g1xPaYdALwvHTY/SApw5PG/ggnhRKRaZipfJRbukt
	nn7CDnOGPUph4Jw8NXpdL5QfLekGTudvkmVMRFxV2mCyWr4JP+cDuzO2k/t5cqCwQvVcnytzvyA
	WVHBWrNDpE9cpHg4M4BRn5F0jm+SVAwY+FsTQRe5rA2Md7G6c3dfoqhlr6e1y0TFF8HWiC/4RFD
	TjLLIFObVXyuUQ/0tEwXZQjpdnVKi6lIVviDoMk+nfo328iBIcwQ35h75syUSRpTeI8dhY2sbMi
	569ikg/qXC3QJu0KiehjA02KAoe97ELE/o6qNBjvZ3Fl1duYTTRJrJ35rXa4NH8veqRXAemYOTT
	Xj2TGHUEVuMc1B
X-Received: by 2002:a05:620a:7019:b0:93f:61a6:b89 with SMTP id af79cd13be357-940ef795b32mr912455685a.7.1793013080596;
        Mon, 26 Oct 2026 04:11:20 -0700 (PDT)
X-Received: by 2002:a05:620a:7019:b0:93f:61a6:b89 with SMTP id af79cd13be357-940ef795b32mr912444185a.7.1793013079978;
        Mon, 26 Oct 2026 04:11:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:12 +0200
Subject: [PATCH 23/35] drm/panel: read the panel orientation in the core
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
Message-Id: <20261026-drm-panel-funcs-v1-23-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3280;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZA0xjScANGe4uXdzYZMdIbyDNkhj47OSIZft8eKozp4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Z9U8Hj97lb+q5o/M1s3STd4Ol0RvJGQ6JrDPe866Wc8
 5KYzkh0MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiBoHs/+O3ed60/KIuzfDS
 47Di5nv1s2Tiz0n+f7L37X/Ve0vO3Y+VsM7wO9knuIuJp3eGlVHekwX9WksTVzyJ3R7E/mR6TXA
 SV4PwHb1W4+DP5ufMZnI3bY1eOzPb61B3hjjTf/esiUKzeSoj7NWuiXcfk9wisYI5huXOVOPjj+
 c3LT7N+PgHV0KXmMs/uQe3c2RbTbVWtfeK3HJIvFRQ8Lde+abFtO2hJvkt4rXv2699LD7G8pffJ
 pM55c97/Z0HnzoUJu9g1rm1fqZc+hwXh8lMc9dLeC/8wsUYkz3LVU5XvHjfjcBmvsKnd65Nd/r9
 3GUKo3r40nsWzH1nl8iHNKa5Gea7Vyy84pLu9k/SuEABAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 4EW4nlm6q_aCGBMTz-g1VIAlvzFrd33c
X-Proofpoint-GUID: 4EW4nlm6q_aCGBMTz-g1VIAlvzFrd33c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX+qn/lkD+LbmQ
 byvugFsXlrDkSS3xLbfJ2iTw9vhUzIK0ixSAON4OlV/ICpNMAOSR9DNEtwBC/9hAJvI/3weViAD
 CmcLts+NKT9MHwWx3XCi0s/+IMGyI+MdpFoGSDbpi7fXrunvYznPgcfHEgLjyBXMlWBqxOljIU+
 nrdMVTioPXBnJcJNcxMMRgIX0aXnZZo/V1ZVY6iwOu9P/qx1GoQWX1uRsc+67BbOdvZmj8VvFL2
 VgchgA8L7DQVZZ5pFgmni/P4sAO8zUkrDj9CXZaLEWcrCrIYJN73RXO5PZ2KpxAm61gCiy8+gpi
 62dS0gu149aiIbZnYZ3bvJByEqMsgtnvlqwYt4NJKCyJfBDOeg70kcyBsBwZbHgNhqwUkXsfI9M
 Bv/uY3Gkbn3wsleb5Lui8lHPnlfSPGvcQ9AnhtInffprFD2fMonlXw88TwU+uCrre8uW3Ori+iN
 sDmQdsXWIM3nWuobSNA==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf3559 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=fdq7EawpxR3WxEXJaCsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXwFDPG/m6ge82
 ChnHRjHmeiYBw/jCxYiVBb9J4gehm+NoGOA40VMte3H1PG0BG9JHPl1f/r6WagwHft+he4BcoYl
 ADWlpo9dksNjvVLTb4R7U0DM7O713XM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

Panel orientation describes how the panel is mounted and comes from the
common "rotation" DT property, yet each driver has to parse it and hand
it back through get_orientation(). 24 drivers carry an identical copy of
that code and the rest silently ignore the property.

Parse it once in devm_drm_panel_alloc(). The callback still takes
precedence until the drivers are converted. An invalid value fails the
allocation, just as it fails probe in those drivers today.

As a side effect all panels honour "rotation" now. Among the in-tree DTs
this only changes the Motorola Mapphone panel (panel-dsi-cm,
rotation = <90>).

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c |  5 ++++-
 drivers/gpu/drm/drm_panel.c     |  9 +++++++++
 include/drm/drm_panel.h         | 10 ++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 893716a9e489..efcf1ce979a9 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3397,7 +3397,8 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
  * @panel: panel that can provide orientation information.
  *
  * Drm drivers should call this function before drm_dev_register().
- * Orientation is obtained from panel's .get_orientation() callback.
+ * Orientation is obtained from panel's .get_orientation() callback, falling
+ * back to &drm_panel.orientation if the panel doesn't implement it.
  *
  * Returns:
  * Zero on success, negative errno on failure.
@@ -3410,6 +3411,8 @@ int drm_connector_set_orientation_from_panel(
 
 	if (panel && panel->funcs && panel->funcs->get_orientation)
 		orientation = panel->funcs->get_orientation(panel);
+	else if (panel)
+		orientation = panel->orientation;
 	else
 		orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
 
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 5bc97166bcb8..1b7ff0bea68e 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -925,6 +925,15 @@ void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
 
 	drm_panel_init(panel, dev, funcs, connector_type);
 
+	panel->orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+	if (dev->of_node) {
+		err = drm_of_get_panel_orientation(dev->of_node,
+						   &panel->orientation);
+		if (err)
+			return ERR_PTR(dev_err_probe(dev, err,
+						     "failed to get orientation\n"));
+	}
+
 	return container;
 }
 EXPORT_SYMBOL(__devm_drm_panel_alloc);
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 579b6be855c7..dc4fbeac796b 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -236,6 +236,16 @@ struct drm_panel {
 	 */
 	struct drm_connector connector;
 
+	/**
+	 * @orientation:
+	 *
+	 * Orientation of the panel, used to set the panel orientation property
+	 * of the connector. It is read from the "rotation" property of the
+	 * panel's device tree node by devm_drm_panel_alloc(). Drivers can
+	 * override it before calling drm_panel_add().
+	 */
+	enum drm_panel_orientation orientation;
+
 	/**
 	 * @list:
 	 *

-- 
2.47.3

