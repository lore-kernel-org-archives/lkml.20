Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013071;
	b=ZHun2pP5c6l/vQePhgq45g0Q9s6fo/dhhNb3Y2J98PMnbRKrq8rJnRjvu69U6uF2hC2Z
	 clTErsQoUOVd35k4cF2AVShFGWovbEvhMWKbBeDEDigD60Xt1x9/6tFmgTmeBmq3KiXuP
	 vAAK83Ja49798t4YupFme5XyZs7KQeITGQbxXulkn6zMf8kp47R6wkEC8SepdQ5E156lb
	 zTo9qv+uaRQC1mYOzpI5vXrjfHm/gBUTmnxUQaNv7MyJIzwOvtlL9NJgeHrFYNYw8wjqN
	 S1xDINN1TMIW0R+6SJCuaFnUWdZQSzUM0r3r6B+Z3M6rI4QU90gfSE3OI+3VDo/ANcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Koy6XZWUO9sFV/HU2DhmXsiI2S7zyst4K9ZFcBiDlAM=;
	b=EvklfRtpYno/hjxUJxnfdA3UknYgRSYI70jNsKfDtP0SfRYVraHsuDwO0FEB/yzUemfa
	 eUur8E//otQ/FoNFZrtcjcsuSrnwjF6X3s2uI6TmuS2RAu3eLAG3tw4IsfpzFixWYQiRm
	 Doy+Z0AHyz4Pta2/4/fuK7ZzntE+shUb+rw5Zm+zDmcny5jH9oyNMFz/yvEack26LBDpO
	 CWGNAMJ0yQJjNPvz7mRNsjHK7wMEaCTayS9NIVqdpkDZ8x1AnKTknC/DgnbH5y6CRlRnR
	 rW2P5zroGDR/zpK8Fcddkv4SPXLvQAEjATo58x4wCK0w36fd3jNsdfXrQX5eCp3760A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8pPE3ho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oy+FvtHQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3149C60A383B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3149C60A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8pPE3ho;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oy+FvtHQ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt23i2733226
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Koy6XZWUO9sFV/HU2DhmXsiI2S7zyst4K9ZFcBiDlAM=; b=l8pPE3hoE/kyXz3L
	j16UZazP/mmVe0gLaLrrseOQLCb3LVDtl/dvZzQO5Yr8M0BpSXk5lMGUU2FcZ9sj
	8D1UScd8wpdLe18x0VNkC7Jb8kYQyBFHLG4y1m6MW4njJXpcy+QEAWrml40jJpau
	Za6RMBq6Tlr1jhLgsaUqWOTwSgiIbZCwLL9WwzG3dkt2uWEVgj00f0+p16GxiyfL
	KA5UaZcuxvN+V8IeRsWRfrT50gRIAts0V5pGUxTMEFptscgaGM9GmQ7Pangaqzr3
	+CpJK0u9D34PWuuSAvk37/k1F1MOS+K4gxI/5jqm1aQAM+XBwW+C5WEEH++MYlXO
	bp9lAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8bga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:11:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so640615685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013068; x=1793617868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Koy6XZWUO9sFV/HU2DhmXsiI2S7zyst4K9ZFcBiDlAM=;
        b=Oy+FvtHQirlw5SCQ7Gv6tjERTH4KObiU+GVqTpkpMR2gijJWbjfpsCVevHbcC+Nq4E
         ALVKt3DLbLtcDKt+LDX0ihThqA2dbwrWl/Gd2ezOIOYYXjid7cSDZyqqNwyWytJ0jw2r
         4X55DlR6m4/oWWsxa5nI0Izsd6EuSpHYZ+/aLLQkR8R5q4UxOpuvGAaglwCIs0+z/Ehg
         npqr2YowySudnSDfgB3pwqTWhK28wcNZUJBZGyRRc0VfKTA2CgeI7jTOfe5tVpvtvoY3
         664SDYDeOWlYsgyzy+QAV6VEDBGyQ2FpvgYIXihC+mMBSodrkA2Rh5nCAUP8nNf5D8Rz
         fgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013068; x=1793617868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Koy6XZWUO9sFV/HU2DhmXsiI2S7zyst4K9ZFcBiDlAM=;
        b=PcoLqXPAuUXkDnWtw8sFiHv0/X0g6zTQWkrQL79q9PGfqBHdxc4cabzVvpXkwHUPhj
         exOBH5NqUydgdoOLwfPh59LkB2eVsKRaBJ9ntiB+y4s1raZPiFXAa4MCbU6FtIG00O30
         KmDHR3y2S/Y2vaND6X5AsPy3i6MEYrMs2RBKHwfVIUizjDXfb4rAZ0FqWA9rSdFlXUGk
         9NHvaR5Xe9TeYj5ARLoYrgwPlsZseiKd39HaGAOtyORPiHge8znw6QLQ1tJ6yazt8Tbk
         AKYvSkCCgLUbDsk0AeTG2MxYQj0UPbELznh1sjhX9bsdjsHykUGQlUfwxzGk0ghbYFnI
         7Ptg==
X-Forwarded-Encrypted: i=1; AKwUvByXu6Df7UUDLIl1ky+d0TisX8LQekOEofmWbSBv/yUaQi8vHVpaRNz0wMCcKoa1zDoaXKBScaaqq4TQs88=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUcnwjit1BDEhX/HBaSuYLrs3K4y2klRpAAlsLvGjaocA5HH42
	mVbRJ4RjboBINwoJ0eCw3EXkOgTzijkFSTmU9btuvSJ0ExyQT8C8yDd8DFAOmDfaUH73QAs+j2m
	n3C94g+CB9/Zie6rQb4RI2dwse9fKbjxEMfV5bSxhODKEcEGAcnP5gceXd3e3U/m+Moo=
X-Gm-Gg: AYBFou1LoZvFgEXD8I5N3HNzGypSHq/fNv7H8m/mHDM7HrWmCNQst6dKv3Agb6pSgEv
	1kLEL7T47ggKUIz3lzlMXVseX6YrCwbin6pt7/2B9iJRnhbGv0HiPG7h5tFa7T2ovJJu0RDuYmS
	kkX5X+/BVwX/I/RukNukdHiPOjbZ1OeYpQ6LQ11VzAAHTwNG9dMQBMleIG73SfXvqGpNFSuvlPf
	Wb27TJjMx+J1PgIO6C1SHNGQwA0QzDG2NXSbXTVYOaylYi/HwGMZ79kaPAQU5rTkHaivEZ9GJBG
	4TfYMaltjv7g1gQIx1+m+QDwuNfoF2cNHxk3g0N5pv89R9g4bh88SrE8aLw1IKsx06P6Y7da9hx
	ZgK6lbOccWFnIUsjdz0yj653XmcdH4L2VOfgTxxvhWmspaSqH8rr+rDvu095ko7H525lVFrTo1l
	QZ+U5nWWVN7IN7
X-Received: by 2002:a05:620a:7008:b0:93b:ef24:bc8c with SMTP id af79cd13be357-940ef90e385mr838030785a.47.1793013068307;
        Mon, 26 Oct 2026 04:11:08 -0700 (PDT)
X-Received: by 2002:a05:620a:7008:b0:93b:ef24:bc8c with SMTP id af79cd13be357-940ef90e385mr838024485a.47.1793013067738;
        Mon, 26 Oct 2026 04:11:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:08 +0200
Subject: [PATCH 19/35] drm/stm: lvds: set the panel orientation on the
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
Message-Id: <20261026-drm-panel-funcs-v1-19-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8r2fYcoIsJs1j9rHuz5/0flsbVyRvFq/7E3ho1dMY8g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUP6rKa9ZJALcKGd4Q94uEkWWivrXKdGILwM
 WTV3LksCzeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DwAKCRCLPIo+Aiko
 1a7MCACdQuwUBC4LQjD8kSXjk9q+SL6jBfO9Vw0RSOYzTPZYfzN/mWDaLnY8OQVsSW6sYtHwZZu
 MGpaXwzyywrGYtx8O99zSZT8bSdtjpx+Jy0BgqASzEUjuMZwjTFk7J+tnbe36F6VEamVYfuFsfz
 IETX5ctEX2PD7t+g/ZHw7odQvPfMQgNJlC63Fc3aar0Q0zVCm3YpAusg9HhRbgR/GKAJ9/xpMmb
 gj6q84GCt4nruRc/ZwLd/QKdjhMPMGgGzZu36wGtHoM5UlDYHz79ZUjJ4AOGqbcGHo2P9uoQPPD
 EjnamVi7cEBFGHqiWYL9ljkqM8WW1Hny6uT15fp/4S2A5cBe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX4DHC/JuBhSus
 WE9pAatGid9rxDvoaQ4qZuOe265gSUGlKd4BT7KrixINrjHfnY+rV71oYJHmI/syX34Rl8DAJ1g
 SxoP5fJKDxq4IFWU7xih9cJ9x+wsdj5X2VSp+lYMMISQSbP0sD0ivsVSODq/1Bx6bZ/We9jZ/P3
 odSNp17IM74ONIeazlH5SKFINrGo3IM5oQGmyKKNttOiRhBxhQlTA6QJn7xLBMUuRQHzIuwjFcd
 tihqTmiXlDsQ9Bjj/tciyM5cB4eVj/D9ByjLBf9irlY5EgHhLucvegyyDY1bBBJ9axOk8yss27+
 Y2WDsFdGB3gXadlyghQIFUBRAGt9kXZjXBkwBsrKovLOYYlp9wanxJoskwHcbbJ1JU8NPH+JOoY
 wK5vC2u/VT6dX7wMqhCjpGtGRJ1441wZkdJ7aQ+DZ4T77OYc+YI1D9PVX287svMpQrsZp6RC7nC
 oZ5glERJ9VQdpfgjNiA==
X-Proofpoint-GUID: LRzlU1UvvGpFqHhlx8WQt-UFrMQc4fD7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX3LMlRTUGI90T
 h1HLdTKLdxJCpBh5Vf5BsjxyMhQsDyAAzSBv/Qh/SHYPxg1fYSrn+Iqz1AjsRC7EUm2pWYL3eeg
 qElqJsREYW8LcyXDNZRO3bfwgISEy5E=
X-Proofpoint-ORIG-GUID: LRzlU1UvvGpFqHhlx8WQt-UFrMQc4fD7
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf354d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=xd2H4mkyy6EiTJgHJZMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/stm/lvds.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index e72a64f14f47..11d32a8ddc58 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -975,6 +975,10 @@ static int lvds_attach(struct drm_bridge *bridge, struct drm_encoder *encoder,
 
 	drm_connector_helper_add(connector, &lvds_conn_helper_funcs);
 
+	ret = drm_connector_set_orientation_from_panel(connector, lvds->panel);
+	if (ret < 0)
+		return ret;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 
 	return ret;

-- 
2.47.3

