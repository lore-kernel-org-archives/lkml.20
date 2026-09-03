Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA464E80C4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449941; cv=none; b=dZltb2+k4vhUk+sUmzpSnApdkSa8qUmPINB1kxAtkgmIk75mleHrzDbJgoTdMfPbW4LCry5D3mvzlYb2Im+7boy9ATNXzHZWy7Y3BSKQPOXYR+D6DBRFqXodpczIt1vy3+TPAakrIxyjza0yppKBL/TBfIFbBK+dFYgxDFlhEdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449941; c=relaxed/simple;
	bh=AjrT+2a1V/dFdE8w4G6xJN78eEUrW3q4ENCnkqhARGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C4kDiRqzwfonl9nezw/k4/GY6+pF2lSym9zqIhNnM/+FDfldMkW2JRCeHGo055PhB8bQxEHqQF0MmaP2DOg5EDcn43MOjODYYSWHf44tm06tKFHuYQZA8GZBY1sWmUMqfENvP57RzB/E6n7DNI7uoElxOu4wb5EIJ5WujT1bRns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CHQoWt93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JzKEfGf0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CHQoWt93";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JzKEfGf0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DANJj539104
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 15:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h4izH85dY8s
	43dZbZGemk1SbK5CBZ3ueMd7xLjwebE4=; b=CHQoWt93bSf5i1CuMopCg+AtkSZ
	np0nNaMAjZq9Lhyf01UtWo+mkipkhjbvnO+Yi3vcbncBI65hCWZFIBQR0cuPtCN1
	L+zSChXLIx92RG45YnSRq5Qaj11YMMj0bkvQeJzN4ERaeIiIczrEbOb6OrbyAJIX
	hFDWYHQwtyCK7DZVY5haz/Mw3Go9ePnkYG71zSfb+pLPQKxmqYXgfn6zo5QbORsg
	YykpkywNktjDXsX3LUPXbU1uXsMe/b1pBFOniruSsGpAvIjLJe8kTkESQe+sjlz5
	mi/gPbU4eqMp0Wd0FmRcSRuCno79XaIS5umo+P9Oh7yxtofDTfAnAwRz3wg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx1cyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:38:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e048a801dso3285390b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449937; x=1789054737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4izH85dY8s43dZbZGemk1SbK5CBZ3ueMd7xLjwebE4=;
        b=JzKEfGf0nZp2b7peAWg39guA3qCaASuQictTJ4OgeD0yT73Sv4BnKY2a/MhO07pYPI
         5PwWaql7gx1LBQm3bDdUhgUuEvdaxSao1SSmN95qFjCnlwXSgBFUUSccj6iyRLsCH4qy
         8UV3sT9Rm3lOnBDYyf5vycmeNlls8O1NHqS3xjNap2oxWvG2uc6S2S9llSbe3o/IoKPe
         nlUi/RwD1F5Q35TiGcGOtqPkCuoYE8re6iwIckpC9ZgmmyPW/iTbi8fIb9LFPnFrM0Xd
         BoysGxm/uaF9LeH23D0/+Y68eqARGR5KU4FqZq0ZppMHts/e+jmYu6F1cY2tq29cBD05
         hpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449937; x=1789054737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4izH85dY8s43dZbZGemk1SbK5CBZ3ueMd7xLjwebE4=;
        b=HjsSgtYcB5NFoyspAeWKmWBsvC7NC3ulvQphQCp0V5NJyp6I87rfBmU0ZK+o0pFFRk
         iBRnkHw09jKfZmuL/tsBCnHXfAf/U8qRCSOjyF5ZRiSak2P4gjXVksSIZc85yxVcZMzH
         37IgVoC+y9p7IBL6ZZdSu037JEP5ez5fXC8Q9TlrOW7IHr9p7zuiuWBMV4+NU/lNrY9k
         u/O26SNTgQonphfkMD3QsklAgXAPg02m8IZSs0MCnEej7eXYV9hijiALa9SztsW8emAX
         ZaSsVJrHi+WvjgFhTzTHeVwtsFVKal0JBhj2Z/WHE03n4VUD0zBh41UV56qLirucc3QU
         aQ/A==
X-Forwarded-Encrypted: i=1; AKwUvBznpZ3AhKvM9t6H5YAMudQ64IDsPwiBHt/lVRbzhs6w6o+imDbu/yu8O+NVU4r244PgEnUUDDYskyECTy8=@vger.kernel.org
X-Gm-Message-State: AFuF++kvG2f/hgvrdwIjUKTDtQBBW+bGk8LKQzrfG+WxJf+shKay8NI2
	pOIQWV3imO0Jh8+sRh+UB6KnRxpq9yg/6xeKw5uhAd5F8jsEKM1IQSjLfdGIBE0CMsjTWJpQ5S/
	KYdugmoaYO7s5MhCV3WA7O+yKmgqdLFaWHAjCpc5uZfHap7Taz5uNVhdzEsg8g4v/JxY=
X-Gm-Gg: AYBFou2rZoaE+W6x7tAHRBmZoPhi0Lvjue3z/OZczo4Uo4yJE//z8Oww9CfubPqEZFW
	d4ObtTGEn/xd3UKvLVd4DxquraeNh3m9wbD6+OGsWhm+JhtEvQt7EJlbjTwvieZRNypLDvF4iIl
	5E6HXZ4LNYOWYAvzEohYsrDMPnY38lvd1EdMQ85AOFxuDnZmip2fVvMdjpPDbSgyS21N2ZEvLLA
	EFBReA0L9JL1tN9sUGjFaw0M4Kn+aPqiLZkMXTtZzdXk3M7jDP66fpxBfoEY5poaEIwQ3uXsH+s
	oA90Iu0RveEAHVjqg9Pb6YAuJqDX/LqZgJQmkrl3yxpcYjQOdNmHoleDBcm6Si2jM/yU6bQjDg3
	VFkaBzR48BxCEbM6RvtyrKVuuZ+UtKmNx
X-Received: by 2002:a05:6a00:27a4:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-85ed5ccc11fmr18834191b3a.4.1788449936531;
        Thu, 03 Sep 2026 08:38:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a4:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-85ed5ccc11fmr18834103b3a.4.1788449935994;
        Thu, 03 Sep 2026 08:38:55 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm81069b3a.40.2026.09.03.08.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:55 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] usb: host: xhci-plat: Support XHCI_RESET_ON_RESUME via device property
Date: Thu,  3 Sep 2026 21:08:24 +0530
Message-Id: <20260903153827.3463313-5-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: D9mijhvH7FoCId63zGHBTdavywlgVLUg
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a999491 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=A6Vjp3zFaTA1NjdqV2IA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: D9mijhvH7FoCId63zGHBTdavywlgVLUg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX0T7eXJS98+Xx
 xm6YGmrRww4xCwJkVl3IBu61Sk/I0V8InIONLHh/7A2KtCF/W8swmd+sn/slfuPzt6bOV2HNF4r
 8WV8mQQE3eGfJj0Wc7cNS21OX7DQqCFkPqp4b1lzebNbfuTgSmb89/2Ec7kTnGjVzzXDAtSSxsC
 USn3/a/wvHlSAslEy581NXQTKQX7Rc6wxUUA+xs4Wzbhe6u/GO8syPoDTeRdTT7IodCKa6E7hef
 LbXNf9OfndHKBzCpMhn7MkYZJrWJn9yag4UOHnixoksMJ0BBOIzTNBm8gHsHM8h1JJfltPJRb+M
 aFkQZh7C1SGpj3NZ1BXpUp6zf2YEOnUQ/+UB0Eck8w/nRS015IKCQKva442z459R/Wxc2gosozx
 qke4iE0rnqB7gAPrJtvflba2NTAnat3oLpWNrGdW46K77+QzpHP7TqOuYIRDZ6+CQOwuxI8OJQb
 lpfAa+BVZYVd1w99RoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX4IohCgDa7a3G
 OaGBdy0aumcem2V/PSTj5LT7jqqkR2GiJAje05xHv+rdXVY41krU3y9Eaczd5YXs2q71Ue5ngeA
 /0QgR/EJ/wKGQpNDm+b56bWKW7ehlbg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030136

When the USB controller loses power during PM suspend (as occurs
on targets like SA8255P that fully power off the controller),
it generates a Host Controller Error (HCE) on resume requiring
full reinitialization. This is handled by the XHCI_RESET_ON_RESUME
quirk (introduced upstream in 8b328f8002bc).

Read the "xhci-reset-on-resume-quirk" device property to set
XHCI_RESET_ON_RESUME. This allows parent drivers (e.g., dwc3)
to enable the quirk via software nodes.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 074d9c731639..7df2947d13dc 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -277,6 +277,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
 			xhci->quirks |= XHCI_SKIP_PHY_INIT;
 
+		if (device_property_read_bool(tmpdev, "xhci-reset-on-resume-quirk"))
+			xhci->quirks |= XHCI_RESET_ON_RESUME;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 		device_property_read_u16(tmpdev, "num-hc-interrupters",
-- 
2.34.1

