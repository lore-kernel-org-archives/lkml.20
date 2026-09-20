Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B210D3AAF6E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916592; cv=none; b=qLDk1x8AIEv+r7e4entARoiWdBCEyURA5BvMWZUC7J1mj8/tiGLByZtIh+qBSOx0/VU9cVgCJqNDoAHw0k5Cf2OnjqykiOuesKoyYYjvoD06+y85Vy3roHifxVrONyQLlL2XqiO6AEYGQSmg6iVWUv2j11fstW6YjdXqSirK1fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916592; c=relaxed/simple;
	bh=Y5prep+uK+TtAox//5HU+Am3tOMfG+jy1KYlpaBl7WM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BNRbXCPwfNT31yb2x77se0lqje2itF4YoZFJKVgh7Ij7DZyc361Dy0OSi+ufPyYOs/kOnXx9wpZPRBg41oGVg7CCAQNq8WOEOlOp4OwE/hc8pbnNNdDIEaYNUeMXGdGcSxPsRARYhUi345jWvNm3O5JSFI0FaFsRjZ3G99bav5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tc3H3Mhj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/mLj8ql; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tc3H3Mhj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/mLj8ql"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBnqJk1572111
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	riY9eG3dz9cv+aMf8SNtiXHDGuMJEVW0ccQBcCjvHek=; b=Tc3H3MhjFhnblgJD
	SPNW+KTDOflRPaWcL2vLPAG7WqseeqmVAEBRj58+94rfWA1icLbM5/eDLWwI3vcX
	9swNh5fsoZC+3zlx5WDw7cIxzYqz8qoqpwAT6n0+1g1Ko3n0m+oYsJqEFnQTlUjY
	/Pd837l494hM/8LQecJxSwFZcVZWwz6Yg8YPdH6EWctRA+GQmpOM6TKm1iXSjokv
	lCvKpwfqTZfD3PtBhFWsNS6ANlRWxvrZZWwNB24DNR2SlEiVkKc9+HcbZs2XLznb
	ltoNsbnsIFVRysLBL9+qxrMR9s2vqkH6HbxOzxQYUA0x5QJof8KLgJ3x9crfOigq
	sXGFEQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9u2hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:03:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7930cb5cd3aso1710229137.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916589; x=1790521389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riY9eG3dz9cv+aMf8SNtiXHDGuMJEVW0ccQBcCjvHek=;
        b=M/mLj8qlbbvTa9hi/vkjqYMmxgv3bKQvE757Yryod60TpTOrwDffu2aUzq8hVQvD9V
         SzXFIVnDxoqd3aaUFpYRDB7aC/6UHAxJjZfD48KXWouXCzn3pOlgpcvZIxuanu6x7A4k
         8xU4eUGODsf/cozd2oE/jSWvo3mxYvYXY2G8idUgdsP0bxO6l96Mms8BtQWovS0ZaX0O
         DcMCgLr+T0XOJpDDGqscSakh3C/K84ngjrvu8EJYkCFxCEy8SWM2nLaxYjWMv/1Fst9E
         wE+32q80Kp6ZhiypasrwVgz35XX+Rwl88093u51RzFpVPfcVbxvW4BB6fsKdzC7P/wMn
         C4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916589; x=1790521389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riY9eG3dz9cv+aMf8SNtiXHDGuMJEVW0ccQBcCjvHek=;
        b=NJBaLB1+2a/EsSXUqly8MHZRxgvkauhNvn32O5MYNlo8U3fKS9u+PNQBfK+2U/oQAz
         D7Mj5gIM7tufoN+mjV6rXn7m8b1Cf1mYazeyWbm1plo8+xGwIQvfYzNotQP4GzaO8jsc
         iPxvK0CP0X0CJYRZG4oC8q1LNAM/wbuG80tOGQH2v0cU1sYq0WeeTaaDNVFwHvNwQBPy
         1WyD9+wHzazAMC6iFZcGxyqm7AQxZ362rlCcpk7I8vYNssLsc0R4Lh0DLbqS2cWHH9A4
         qihcbLukUyTVBzDwwQW54PfNKTDxG2Ti8KnxD+4rbetlyQu8ukoFQUO2lRm+3SbRelxz
         bcIA==
X-Forwarded-Encrypted: i=1; AKwUvBwVStM4Vvd4tCCfXnW9NCvRuY2KuMgYvncE6T0DggIemLSnZe+K6cLOy2+gCo4yOYhRSp7gVcIChQ4tibc=@vger.kernel.org
X-Gm-Message-State: AFuF++maxEXS2y63wdbAgfLDsaTtgeddDMG5pTNKoOB4uI2po10ONldu
	LKN5R534yBhl5mIIqgAZbi8uAxwryUPCWv648cDYWTaJAiCTlxUCEy9Q2NuQ0/fFIaFgRA8wdSW
	JJJrm+T2pEYz/iPxedTLQme0aneUS6UC/G2V+U3JxZBfPLou9BvIas3L64UiXIoBBtIg=
X-Gm-Gg: AYBFou2QJeIVL2txPxq4ZosN4kcoa2xdMJJkkEZaN7M33W41xu9BvNQ95yMeonRmqH1
	2Jo9oHE9SNgm/dYi/uCzt24RiAU9cCRsr3TQTWaiUX8lEPjZZlIxk2aX28dQaIM95/d4O57hgJ6
	niCT+2iY4xHQK5icK3uPhGuvwSJKmle146V+g4k226QCVmHWRcbjSBQVk2j80sdMuNgE5V7V1AX
	QyirP1ljaDF6wq0pKrTBaZ4xE0X5CJl5bcBpVIg8fKZmFRRAucf70JBpjVAa4K85QcwIZFYdroP
	ISUsSh0VlHvC9Z523P/IJ+qXVkl4MgdsmCgmlUdRIEiw+/6fuyWvz3zKZmz0m8D7fC/FZcdJbtW
	AUCxJA1MH6pKEdu3QmSX4XV5l0s2j2a+wG4WdUt1gIUYnx0ei0d7Lfr7Cv+I/ae+0wdK/zRObMg
	5vMJMV4eJBRZf8
X-Received: by 2002:a05:6102:5714:b0:7a1:f7d2:e823 with SMTP id ada2fe7eead31-7a55daa4aefmr3065708137.28.1789916534310;
        Sun, 20 Sep 2026 08:02:14 -0700 (PDT)
X-Received: by 2002:a05:6102:5714:b0:7a1:f7d2:e823 with SMTP id ada2fe7eead31-7a55daa4aefmr3061758137.28.1789916509473;
        Sun, 20 Sep 2026 08:01:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:32 +0300
Subject: [PATCH v5 7/8] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-7-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
In-Reply-To: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y5prep+uK+TtAox//5HU+Am3tOMfG+jy1KYlpaBl7WM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9b6rx73FSI8L3M2/xHQ/9vYsClqvtqFDunnUQJ/PTexr
 Vv7aI1qJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmElTKwbD89sa9B+8KP2p6
 9qOlQ9erc85v7vgP/5qXta3VXDshTN3/Up7LDJtlL8+XKNV/nFwR31K7W5/D58kd6e+bZ24U8Jb
 /G8gmHewiJqL8jL2WrcxMS/Ti58O9Fx9eOvZPplTDuPleqNjUa5/TZJQEZBavPv7u8rZFan835h
 /JcWlYGCxxZsPZZd7B0s+tc1h1k7K3GWgw2Jy0vdfuc1v1WU2GiVlsj8TeLyc+1zUcza34H/tRP
 WV1X0m30rY5/Km1j/JT8r9yXFfKeHJNsP/illuvGRza3lV79FUZpr5cIl+oXZAv5rmqW7SdcWPD
 RKdOZ8X4PTNsYi4yZ3DdC+JJfxHRKpHnwxL5cnLz+sm7AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: VtHlhIv4h9FFLaEsDf0sWtuQCMJKXBcu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX/NTCQ5FuKZEz
 QV0DiGBrnZNunLckm5vovst2ZDxyFkCfZ1VLTZeV+KWmwVZJ7STx52tED5qIAIFZbjkH0nmbjcC
 demdz/NVuSh73HcwSQPGsaNnTnYULUHODbsJZfdN4pGkfAappnPBTpR4hBpexCRGKnWTNM4GbVE
 lIjQow5zxjnUVMTOndRCGBHYxW4Wxfn8T4/qqLWsSq4A7im9cwxyWjaxmQHLUCd+r7u9XOC52k6
 +HzniB8tAJPhcAlVbsC784RRlw4lVfCetwBjM7Je32d/6zhpwNLBymTLue8rbZNnNQa6inEL58x
 29rxuBWSRLbB1q8Gu/n+/2e0aMRdrmQvAD3WXs5HEB4TrulXwq0e+N/Z6bvS+U3xJwO5aot6qF/
 +hFBolE8mpTFbXqIFD1Ji6SecUczxl4HAFjQXREbXvKikvMPoYytJvucx/95x8V+AwQiVDRJyLb
 1/NZM0ll6kFHTSb6SNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX+7f447nAq6xC
 ZNUEMMyxKflnyCIQrnxDAIY2uzuBkesJJOENrFtdaYkNO7pEHyg69pJ1XZyZhfM0JKGjIq66mfG
 Z9Jc+vfxDT7qZWT6Mk0V/PCIoJ+p7uY=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6aaff5ad cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: VtHlhIv4h9FFLaEsDf0sWtuQCMJKXBcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 465e5d2316a0..e903d4910e9c 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -374,7 +374,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3

