Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762831;
	b=VQlyxEWza+wsIh5qZpbwnrGscgU48I2s5kP+Tp5ZGOhNMnjOExtBMzOpQhc5TtXkW+pX
	 ptEUkY8UwyyodR49UTXQl1Tki/4kJZ6sdhgt1DPClZeiH6GfCSbjx7mHZ3AGi45AXyqRQ
	 16prBIzrNT6DjyqViFGtc353POPcfRH7HA/vZP+d1rAdkkH3P+r69yC1umKg/cTCM4b7t
	 5Nl3Q6Kqz8rinU4K16E6PwoeaU1eId8Br1RwC2UNaZ7s8qBPoet2pjsfjSNtdtwSHSWIE
	 oGogID6K/IDMOucmTIDzb4j6JJdyBVV7423YwnYEsQnb4Mrp7kA5Kg+QOmE/tjLEiPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
	b=HiTT90Mf/Jw+UxWLuFQnafU+eLHrq2nbTU8Ubuq6z9HZXH3UDlwdBs4zP5U0Wgi5YyNC
	 IsxSctPBKi28EJe/WhQcL9PBPh3WprZ3tcCl9Gcwec/AyfAiptURDauZ7Ciqfj93qSnP/
	 aeraVWBBdN1AppK4xvXJivTgUP9pAn9TtUy2NGCrkMG9iDxVY9IviI0qYrfspQN6i6tpq
	 6BKzw9rMiYAgG27U6zXMwur602TvyqWxiYJ8nkXKfJI2Qq4PT7VCzje5bHVOsBZZyX7FU
	 tglRnLBEt1l7mv2YnskTTAbIhEYPxrmR5zaKgXPLudzSomIUDqj20qd6gLjyiJvo5QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LsNOjnzh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2iOw+XY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6612B60A382C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6612B60A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LsNOjnzh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2iOw+XY
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAARQp3550444
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=; b=LsNOjnzhHmpI0HxE
	nmFuUTzkJLu/98q00u4qb23HjKq+tKafv2HeEDd1K0DYwl5bhWcLfJ5XLnDt+l69
	g36ow5iMAVN6JSCM3ois7y3ThM7GeLbEYuGtLrZzDokC3OeTTRmoeM9CnZVtFV5E
	x/NvEawygVOAv1Hn/4V5VS6TZsopR6z037hKPZ8mk0EWE+1KHScNTEe4JZNeX4Za
	1kE7cmnzFYzTWlYJ967gGvwK73SxrNCmIKAG2EJDmdXVlB/DyW60RPwhvglM+ehd
	/FKzjh01J+Hekscbspq3FMPyhJhEvQczy3xHyDfAiLfEc1bVCkKOpPTl6OBEGyQt
	Z9NXbg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrbvvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so195177685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762830; x=1793367630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
        b=U2iOw+XYFqeB3QoM+5ORIh3i9rJ9v4h37oiU6vDOfKoj27CRxd117YHvpc6YJDPSPS
         gkIGOpxX0q9M/LTfhEqOfvWDWkTgS3Np51PaDYCgkDTI7c3n9IRxpuEXEJQrEepN55zz
         QT8LfGw23CDCoxpfNAyeDurzz0GRElU1Cer53C1yH56J2L8jOfruakAgyIvvI6mfWeiM
         a6GQP/3ReHWTplS3JpQn7ON6oLPGoRZxIPbg5AYTZNDdkm/w/eO+gRBISmyhCT5kpP2C
         AI5psITeXiwM1RfY6qi8cqrIuUFCxc28U3r2+K6hGDLX8bFvIBHfRCGk/Sp560t9W5A6
         Z7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762830; x=1793367630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
        b=dHe15lygmvTG1g2KaCqFa2EOjJcc8N1P+w1evpUdNxxOzPHt22ZO2rBLmUicylmeKx
         9Hm6u1A5mK2HG+0YlI0XScfw024CX1sWPpiUthHTh50oxIH+Hm4ii26jVXoaODMBExEW
         dPMI+3McjiX32+JJeqwAZ6HQ9+B9ZXOYqDjEIWhZ4JbtQfXy5xTb0xPrSCvxcvY32H3C
         V+cfhlpV7XWIa3FSEK6pZH6qYJZM7eQRjP2iSawT9yJNua/X01yrJxSwYQXvcwNDunO6
         BFZc1dSov9AgTO5RyNE/oTyzeG46h+/QA2WekLhm0WCq+dZHaRAGFHiKKc+HHGLbj8Co
         xLNw==
X-Forwarded-Encrypted: i=1; AKwUvByH9oPoGgIqYksxth6gthPRAWI7pVhsiKE67TGtTUfsngJz8tOY75U4C9Op2/7lWNpHVtc9jlp4Wabvw4k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ390QbkB+mVJWxqByT1M+lg8I0SijQp31AUzUiL6k6AjTVYwF/
	OaIIR4Hfg3vfCBlqe55CbMHFaXG9Z3TbpevPN4MAMTiZYNa7r+0vdasWqPEkj0qN2YjVDQtYBUR
	Lh4Z3RKuADu8+ite75OMdCycAmnmFJrh4+K4PQCgntuNkGd0d3ts94DzvJbL5eeeGNRY=
X-Gm-Gg: AYBFou3fD23cy6CbtXKGOZphUVut5MEBtsV85SybP0v8N8zRE+1LrNjRcPrJXwOYqFz
	BfXIgrfwBHQC9r/pSzxPDN/U5ierwEEncloSafYHU3SW/Jbvl3pFP8WNQ/CaWqk2VVeGuCRJLBF
	uLSMt/wkTytCTThctK8JwAWOVhlMxJ0vlSgI8SVE//bBp8u4qWvIdZKrLlfVBDQA5o6+cFJjhYs
	XqsB/HesBRYsXbWCr5e3ehk0QVE8cERp5HT+MS/Gu0VnNpoM5pMjnNwIaIHD6G07byysclVDJVH
	UNLd+5tLfBJp/nystgkBubpQc9wu7E5xXC5g6Jp36TqTzOGRf+Jl/XAXcuxERAJPXgiYDXSdYoQ
	8bhVF1mBMptpRTyxnwzoNlcVCYGVejH/F8tXnk5emfInzEQnpFTp5yUahIrQYIQGx/dilUHmaBR
	xhO6BBTTU7Zd1S
X-Received: by 2002:a05:620a:261b:b0:93f:3e39:efa1 with SMTP id af79cd13be357-93f6f79bcbfmr421694685a.23.1792762829582;
        Fri, 23 Oct 2026 06:40:29 -0700 (PDT)
X-Received: by 2002:a05:620a:261b:b0:93f:3e39:efa1 with SMTP id af79cd13be357-93f6f79bcbfmr421689885a.23.1792762829034;
        Fri, 23 Oct 2026 06:40:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:47 +0300
Subject: [PATCH v7 7/9] drm/msm/dp: handle the IRQ_HPD events reported by
 USB-C
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
Message-Id: <20261023-hpd-irq-events-v7-7-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
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
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
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
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VD1bcqfARXRbU99XE94wZup/nUa58ME0mMv2ZOe59d4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OrDd0EyJ1jWpTktyh/YviRqeZnCe3IPoq/M
 O+YMt54/c6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjqwAKCRCLPIo+Aiko
 1WJYB/40Z6evC5Ipq89yGzct7EekA+0duvkUZtm+g1ylN/ggbSzRNf3+1Vp1XjESsa7DpGJXjuQ
 1TE1gkvjp/LWB7CdZVfNXQ4VJwKQO7S3AMHr4xZ2n2jz26QfE1hWqucZwG/W/hmjd9ONC3cAxNf
 RGqMtZxdKdoG3Wgh5qr2rwYcetHNF3gAlKltgufERllw2nCIHO4M8ozozvoAR3wUHvqxyrk7r9D
 L+d/94J20rCRatmubWZkT85Lvjcn3o/DjkXGgBtxEaK+0RGRy0vSEaPZtJ9iJ6PLKtwHzDQy1mt
 2uo3JmQCl+lhoF7eF4BhjoxoqqIqJ8kLhgE/1jN4110PGmDH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: BqRIWh72al0o09FXPm1u10EEk_qUgkKI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX1Xb0dj5yvsQQ
 QTBBVBSEC+4jx0jU9tiG44NYWbKIMX7H3L7BFkiLJ3tZ4PsVmEihqEJFvCP6Q463Gt5sr5qQSJS
 ndOaq1F0h7oSj/6HCVllbvci9bTicDc=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb63ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ecQ_yDMs5xLrPBt5tDUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX+Zmeolz3rIQ5
 AC6vFepyO2T//iVqaHGdnwe4U4GmkS4LGoSpntxqJ14sv/zADLTScm7voEmheKO3fUKDi+NEpsc
 Y08ESjj5ceeTEgwnk34vkVtV4AzjiJCUZVZlfUtdL+NNnjFduDl/E/VHOISorKFQS0gVs7sOcOk
 ykhZuB+9v34vkQ1bSxIAB9Ycm55sqN+B0j96dTzY576QUGTeojk+wZaZ4PSNEVRqZV3nZqegs7d
 6e9EQ94TC3VD0J3C6kHfKBwhaoUYC4he2ZTxDzGfcwpYX9oXBJ/Phe8ZG2uWWU+/F5f9JndVDfx
 TD87dNFpOqsLPUZ+WuJxtUAGgfIa2KQt7LnseUYppWk24b4eE2PVU2etFBGqo2/rB1dMe3WQPp3
 DpoghrFWOIZFWCvJby8vXohgrmshukBw2iPAwZDTWfvUC5esLA5GYM1KGkyOe1culIMWCC0P0Aj
 CdS8xW0oewPRnPJyGSA==
X-Proofpoint-ORIG-GUID: BqRIWh72al0o09FXPm1u10EEk_qUgkKI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ce919a26fba2..771c8b0744ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1566,11 +1566,13 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}
+
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    event == DRM_CONNECTOR_DP_IRQ_HPD)
+			msm_dp_irq_hpd_handle(dp);
 	} else {
 		msm_dp_hpd_unplug_handle(dp);
 	}

-- 
2.47.3

