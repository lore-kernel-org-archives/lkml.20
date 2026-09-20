Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865ED3A6EF0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916499; cv=none; b=S8qaCAuj21AGxO2trbSZjGknZg7BqC+CMJ1nGoUirBELM3BA5HqrewQxNaGgE29Fnt20jjpksku+ySjZHL2Sm/AA5v1oS1BEg/5FC/YTmzBN105fQbSee0vbOecu8nJgijufgDUIXwrV3B50Z4/qFIJPtBIWIl8qWvUBfTGarVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916499; c=relaxed/simple;
	bh=T1aSMkDvUg9F4iAHgfR3ruSI6UlGC1w9a/0Vrd6WDtY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CgSAu4ncDKChjp1C6sUSE8HlzUjSAnnq0cN3lQNKY0FuIVE/4jsdqLfPOl9+ico8P1AFR8CM2ftDkBfHxXuB/qaCWc7DHaThjgBbui5L2ZEeOyAWrJdBLj9pqfOPHay00ocU1Z6Rmm69+4SRIV73ps9n4wypfP6R9JLAnSOmPzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bEPQODQd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DVT0tlws; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bEPQODQd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVT0tlws"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBoExg1639406
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cFBw/9MveNooP76MRdC5+S
	4XLI9vlDs3jbwQiSM5tkM=; b=bEPQODQdVajwiKS7seZzZCY40NdK/hsGB8CCKY
	tfxlNyICqlYzvW+IeKuuNl2mqUw3jYhqMKW2Y9pZaE2SL6DYJT4KXDPpkDjLXdSp
	fH9j4kaj0/VBkpeQMa3CPinKZludEQs463RZuqlLCtLhBp2VXssCTk31aOamy08p
	g1Qdy7WcUkuVQ87mRpeJwrXCA1lpVf9IKgHBiInqtdgaBdeUODG+A1MJafHybP+q
	lAfvq/c8pzf3BelrfId9PquV4ApQCXfsbhrtODTE5fH+3+m4n4jwZTVV0Pv/Jv+R
	KOHbORGCx9al2dTYZOcqkL4Md9XW+4CMRjI/5662ZtldxXwA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs835r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:01:36 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7866c4ed349so2107050137.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916496; x=1790521296; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cFBw/9MveNooP76MRdC5+S4XLI9vlDs3jbwQiSM5tkM=;
        b=DVT0tlws+2im/QiUneMcSuV2U14jJdCrubmGB4o8eZAmvfDalH+3RsaK26MfbuTHXO
         wAPJy30JOBvJT2gNTBHLV/B/lyBdiXFbp3Q/hpx2hH9FKdTd2fn0hZdivHq5rdGwoxDh
         cS+qQVdBKWXEzqTUUe84dXoR8hILZYVZGwOfRaCBn2YKL3gRyUjufvVHWR+wP9b6+2uU
         KROLk8C49YYgxh+oGH6w8iaXPLBQuYE7sgF5RytOhnI/KKvB1Da/zykzWLA1RSP7EJ4x
         mFv+LUXK7PQ5CDr70A0lmb/pIllCfGyhcup1Oo4cI/jQw0ZbU5OeQRHnbNewdl6DvwnO
         HqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916496; x=1790521296;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cFBw/9MveNooP76MRdC5+S4XLI9vlDs3jbwQiSM5tkM=;
        b=PQ41CKmjR2iDljv0R512ACT/peLUaZpiu5K9kwpGi7Jvg2JCGxrcGFBM/W17rnINEw
         nOMnv8yUxRKct3/9nC2txIqzFVNSXKo3ThiQHHk3XsqPtByFPaEOYBi4zp9pcwWuPWKb
         +AnCr7EMuCCJjER9BTo890AVRiyYsbrwZj1TdBRA6CTknLSBoRIEfdQQnFNLop3xqmdh
         SxNZcCOf36QVCgEtAn/NCZAaPx6ED/7nKWmA3WsgQ6+bKEfAn2410ZmeXfQOsFr51E0J
         5ip0E6OzzPgtGdKTT46eV2fJQH2/qejwWkxQX+JvGojgA4Q5VedtzB2AaCRVjOG9dpyK
         yWhg==
X-Forwarded-Encrypted: i=1; AKwUvByLUTJwg/28bh2yMO9ntZCwuHL0wcAKqgZL4vt+8SBn4l3U8f3AsFwRuWU5WlS1M7loUFJkOgBt8G7pQso=@vger.kernel.org
X-Gm-Message-State: AFuF++lZwYN951Cqkm7QI3fxlCSVMBfn6ZxN531uKWe9VJ/uFTScvIRO
	vfePE72conBBzmCrI4wdKrMzmhZDlKci4432Ei/JoJxUT9+hOvqS4I2ghCxldY/DFLkzkT5bdLp
	9NVTBDN79bFRpFDHtgsq3UlLI+Yaf7i7bLlFgmEbLdt0VJOnZAQRvX2fAxwDAvKQBduo=
X-Gm-Gg: AYBFou0uuoEOKmZdj3KuNBfXIbr5l76XwenHUchkbaGLW6Iu7IBNEJqCGQVZyo+xvRF
	iO02F9SYyPL09+JfOz72nDF5UVwx6dB/SE+ad+z5zzRx/BQBM5ehrWCyZ3Bjv3kj8Xw8FhjHkhY
	XfCYMPQwRJtrUimhkws9855k6lkDhYzwA9xYMTtRvIgfdTcq/ruvYYUxydKpdL4DMA9jm+QKKNX
	VzaKx1ZqxBvyRAXQVVVvC6KImNXSo78iOK5mxQbfBjApUOmuyqMUcWHNSVUOKF8yYNhhRVUcc+B
	tPSArYMpINjMLJhbuOYs9g8WTQw5Doz0i6WQsY+WS8pqtLtycpuAYZB4GSd/Df/OcdCOUHuKRdX
	TAjonI4AeygmzH2Qyu578Y6zHcQMltSmiigSTl4wbhk1/iP4kfu4KyX+mA396zdzbDjVDcRImOd
	LrJOWi5xBGg92b
X-Received: by 2002:a05:6102:41aa:b0:7a7:19aa:8a83 with SMTP id ada2fe7eead31-7a719aa90ccmr1489214137.30.1789916494000;
        Sun, 20 Sep 2026 08:01:34 -0700 (PDT)
X-Received: by 2002:a05:6102:41aa:b0:7a7:19aa:8a83 with SMTP id ada2fe7eead31-7a719aa90ccmr1488929137.30.1789916492529;
        Sun, 20 Sep 2026 08:01:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/8] drm: handle IRQ_HPD events correctly
Date: Sun, 20 Sep 2026 18:01:25 +0300
Message-Id: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEX1r2oC/3XOwW7CMAwG4FdBORPkOGkKO+09EIcmddYgaCEpE
 Qj13ZcwTUMrXCz90u/PvrNIwVNkH4s7C5R89EOfQ7VcMNs1/Rdx3+bMEFCDEop3p5b7cOaUqB8
 jpxqNhVo3lRMsL50COX99gNvdT44Xsyc7FqU0Oh/HIdweF5MovV9c/8eT4MBFY4QT1hk0+DnEu
 DpfmoMdjsdVHqzcSPikIMwUzIoCdI6wpg1t3ijyWREzRRZFtWicgtbZd7+oP0XDeqaorEgwGo2
 UlVrXL5Rpmr4BRq0de5cBAAA=
X-Change-ID: 20260414-hpd-irq-events-e72bc076a5f1
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5586;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T1aSMkDvUg9F4iAHgfR3ruSI6UlGC1w9a/0Vrd6WDtY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VHrDBA6z2QkqCb4MlukXsy8f/Bwm2WbvbLS
 PGY3/CGZ3+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1bS6CACQo4YyOra9XHAUD9XHzteIJFP/nsaDjZ+koYADIdi0trNeItVnSKMahos3SM31s4f1c/q
 ceNCJ52X48MeITEomzforKgCxg0XK1ezaqRv6uG1aVV77k/9sF4E5Natyst5gWP5cOJTIFC/1Jp
 nHPhYixemqLOxMTjpoE5GtQe7ywIdmSpK/Xs/DV6vJHJEzuZ7mpIxx8qEsaAcsMgOJBF/5TWfC/
 kknru+qOu3skUf6igt4HV4diKuE7eR/iwW68hXcGO8SUV6XHphEWDwPdF+VX9tBvfOu+/pMxn1j
 TWEE2AtnruYKINyRc1QKY8wT/gDFZgCK8OkhhuEcReyWAO5m
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5za5X1ZIS51UCwckfe9EKPeBQuDS3oek
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX4710ma6KjPw3
 rFx6fLOXEvNJ6rRREfBc/OTH8xCqIw6MmtsAkS9v7BXLl3VmPF5MBjuiF6WDrsa1w621Kyyzi9k
 Hwl17Oo3qc5zmWEoPgRNsup+JnpShQg=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aaff550 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=ag1SF4gXAAAA:8 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=P-IC7800AAAA:8
 a=GFqr32JmAAAA:8 a=IpJZQVW2AAAA:8 a=mK_AVkanAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=eKQTCwoLd85be8zhlTQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=f02Ha7HRcztGgdyUxOxW:22 a=IawgGOuG5U0WyFbmm1f5:22 a=3gWm3jAn84ENXaBijsEo:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX3XQikyxzOKHo
 zDbZjogWqQgWSW4373pH5T31Tp83LNg7aGDh2UeNJL2kgyR+t2OzEunyxGRy1qQsSa8xbgn+AnB
 l0U+mchmZRPUa8Ii1aBLZAjgDSmfGsK/tjU7Uak8L6yBF4n5plHrEwBG9vsZ8D+qaOzE8Ga+8Mb
 BEIOMPXtg42bemBSyzbUmDDntMZPkiCytrkaCZrZqhyVzLE4jLI497kG9L0S6An7iOqfjoK5Tlo
 mlCoBFD7vXLiVf9Jw6l3DdX6+t0+eMhU2g64WNAlFeX/bgT4RHZeM1S9c5M57EZJTCwuNsZs/99
 E7j05LQtv/IUB1U10kx+1hbmjz1HbFXW3p3NYN2VXZW6qf90NkLOcSznjkO6rRzo+1JS/8kXpw+
 NLT01y2YQr+9Ib/vIK6bOx3qNmIpE8VXc64/Bl0n5sW60DQYksDAqaVV9tA7HPF1sDgOmqiOEM8
 aK3NfxtCOs50+A91hZg==
X-Proofpoint-GUID: 5za5X1ZIS51UCwckfe9EKPeBQuDS3oek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219

Both DisplayPort and HDMI standards define a way for the Sink / display
to notify the Source / host about some kinds of events. In case of HDMI
it's as simple as singnalling changes to the EDID. In case of
DisplayPort it's more complicated and requires actual checking of the
DPCD registers.

Currently USB-C drivers don't have a way to deliver the IRQ_HPD
notifications, leading to missing MST notifications. Provide necessary
plumbing to let IRQ_HPD events be passed to the DisplayPort drivers.

Note: the Yoga C630 UCSI driver and Acer Aspire1 EC driver are not yet
enabled to send the IRQ_HPD events. Both of them would need some more
reverse engineering to find out how the event is being reported by the
EC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Renamed drm_connector_status_extra to drm_connector_dp_event (Maxime)
- Link to v4: https://patch.msgid.link/20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com

Changes in v4:
- Renamed drm_connector_oob_hotplug_event() to
  drm_connector_dp_oob_status() (Maxime)
- Reworked commit messages, explaining what it is about (Bjorn)
- Rearranged commits, making them a bit more logical.
- Link to v3: https://patch.msgid.link/20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com

Changes in v3:
- Fixed build error if aux bridges are disabled (Intel GFX CI)
- Link to v2: https://patch.msgid.link/20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com

Changes in v2:
- Change irq_hpd arg to be an enum, possibly desribing other uses (Toni)
- Account for that, chaning the API accordingly (with_irq -> extra,
  etc.)
- Wire up AUX bridge notifications
- Link to v1: https://patch.msgid.link/20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
To: Francesco Dolcini <francesco@dolcini.it>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org

---
Dmitry Baryshkov (8):
      drm/connector: report out-of-band IRQ_HPD events
      drm/connector: pass down IRQ_HPD to the drivers
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/bridge: pass extra events to the HPD callback
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/msm: dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        | 11 +++++----
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 22 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                | 22 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 10 +++++----
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  6 ++++-
 drivers/usb/typec/altmodes/displayport.c       | 23 ++++++++++++-------
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    | 11 +++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 31 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    | 24 +++++++++++++++++---
 19 files changed, 152 insertions(+), 65 deletions(-)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--  
With best wishes
Dmitry

