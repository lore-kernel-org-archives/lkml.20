Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286615;
	b=Q0iIBVAiN9molgBCIaFCieCVgqCj+pwKD7Mw079OU9xd/xAMkQBxvwotO4d0uhdVLHDz
	 Q53ZWnM+TFxipjF9WD8Knvw6mnkDnok8FuMgbyavB2YXpgXbYO+dInxZ7dUagD9J2lMWh
	 JY5MN07jZl6jmQq5WYGUEqLkPv9+FZzVIgpCfNUqZjpXdob37TmcEQcQwQZamSaNRSPqp
	 sgm4cMxCNeIFOmB5SyydZ1TsG25JAV4c+NG84OyR+fvnftaYP1irOgg9rRcdnVRY8qBpx
	 lCfD1LAP7S6Up9d1v0T2g+wfFw6r6541n+Az0JPy2keF7X3XdztoQyCp+BROlVKTbwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286615;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kGmOSxaugPIJYRGrz5sk5TBB1f5tCohgbLSqz9Wr2Ns=;
	b=L7t/IUEwu8KvUAxD0Hy1Psca1VrKlfR9w4Ij+u4td1sosCNl9UAJCIfrXm03AE9bgyW1
	 R6/vfYqJPNusknw+vUoiBxSi98SX6T1qjEz+7LWxCWMiUJltf1Tj1SZufVXLwyGnDjLrJ
	 7RrHme/WYKwcYEEaHe2bKDhhKFC+Cs6z0NCUqqI0u3CsXqbltbkS/VRFordaAuAjVE0Pl
	 qLlsNvFay/cN7FYIUqUn4XmUTd8sAQ0kNVRn/XoRW0L3Lprb+IotJxKUVOdScALEksM9K
	 qT7ePAvULkJ3pq7m14eQKDWufEb8/ma7oNInGJ9FkzILN7ln39iObjrm7wYzK/KKERA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UhcPBz+J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OshgpFUk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787ED60A2634
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 787ED60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UhcPBz+J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OshgpFUk
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA49v0p2294748
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kGmOSxaugPIJYRGrz5sk5TBB1f5tCohgbLSqz9Wr2Ns=; b=UhcPBz+JTBasQSnT
	u5bsN9sKpht/QgsQk3IGSI49Z9aBYzIj2BSTrDCzhQMpreBYkqzBEwC2Vwd3VjyG
	vXCBSBGQ8m2adoWODA1ZhF7s0ysaliQC1siVGtJnUoY4J/9zLiMAWkZy6OS9q6kT
	U4gAM58xQoi+YWCpoGUoUVvDPJuS6H2jwkNTF2VZIsB4IF1uKW/Mdrp4Er8j6tUj
	vl9XM7ybuCNl3fFcvEMf+3LjO8QQPy6MHfp4WzzTJlQvklRDqwJxJrBFtCtpPxHP
	S8vE7EgoRhwRLwOkTiDG2MriYhCNYxr+XdUM9Dt/Ag+hETmcbIH8UK5V8xC9Xi9k
	l21MSg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5und1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ec6cd898eso32479996d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286614; x=1794891414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGmOSxaugPIJYRGrz5sk5TBB1f5tCohgbLSqz9Wr2Ns=;
        b=OshgpFUkPhzW//s1i6TjZRM52G0cIJ/v9e2PNWk3YgkxBmixSWmW8KwpRo2ZOrSpRB
         DY+qquKngEZ6TK7LBhhVd1LAwqLJaRVwS29DuIkBzVyKRruXoBCCfBNAxKQr495YPwY/
         LxJyMgjSWJigqfByQciCUelsQE/o47M0IbketdnOodEso9Oc8EfJbVARjBPWNYMI5sy5
         EphyezuiyZuUO8AoqFqzlp/OstMhFApLANwp8c+/rXYReyJEr2JgFwHgutzMuhBk16k6
         UZ8CdMOBD3TPxgD4TxYgAbYDSJi/pYY8ObpiyGPFb9vJmkgTfFE0G111R9zoUAUfmqiE
         VlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286614; x=1794891414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kGmOSxaugPIJYRGrz5sk5TBB1f5tCohgbLSqz9Wr2Ns=;
        b=sZtPGuS6akQqUZTPZG88dzM6Fpupduc1RXN6A3Jd+bQF1BwYnBv1pVA8HknJ6THpX4
         ii+a6w5M6W8v+YGPqLMbom9h5SasDBpwrBHHrlI4MhA7RceTvvRnGgBtJfFJcvZc2AQA
         rdS2/NdMbryGYnyj0XgXWJ60yujhVAQ548rmfTaOsK2qMnpvQbXnP/aQdzvuCtUP7Wmr
         DfOhkBCP2Ypgv30ujQzIa7n4yuFNgxfOxZKIDi9LUedSnFDh0wn3yZyTLi8zrU5oKibo
         N4SRWGclwGvmup8jkG4HYYqZSLqHMP0LTA34wHFlgllgX0zzwXxrFXYj/h7K/ScPhGHe
         xjTQ==
X-Forwarded-Encrypted: i=1; AL+hErHf/eFCP+M11levEbZtbUgibnwcgnBLMdDdNr16bToz7d/pKZqFsFaJEnUkM7BKOsslvoX+ZCdgSwLYwdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n8ZiHZrdgS46Q4Dg+8PHBfkBPfPEswYDqPE2rZzpYxBLXwzVd
	wyg87Q3tGAgdLMeIiIt06W65SLd6ye/sfeaOepOgT7/tSi8p/zGJcGfHMRunREhbV1u12EOFvn5
	UG0xvKhfe3RzntlBu+9mDsR4gyGFeDOhlgr8CmsQfjDu/kJSnASrwEGclROVlYdS3jA0=
X-Gm-Gg: AYBFou36xQ4j0XeD/jKfsALMADaLUAfdpabqUxWKxsa+57fX7I0Ln7C8ctmUnD1B8J+
	iEa/s5bZG2B6GyhxAdvErhqZnSNkbj6cMiYXve8aa1RbjcavlqlcYoEJ+9+VPc+oenK/lmR9/r5
	hUQ/hGqqo0Sb2GDNERcf0NkZ0EM3R64uUPhvhQl9GkybXE9IhLu4vQrI76KbNC1bkJJBKNidkGM
	GJpJ1CIPmOgfVdrwokXMgfQr7O6hBuw1gS569P5CHeT0A2QTJ4Bv61Dq22e9Vs8wdrF14fW2Jqn
	LCAkwbY5g83lF9vCtBFWlp2SH4cbZGZqtWfsDBwc9vV/QrOxboc0F2soZGPm0LVFh3Tt5/DmF2V
	W6eDqxxtJXG+isyE7bpzBZ0Hfn1YylSKbPcaKtvtsOtYHeZ/AQ/gKRDvTGWMkvs7RH6neaHOpYH
	D4y68lD7J/Hm74CHWrIIRIOfuFhvO2XTf1TtPy
X-Received: by 2002:a05:620a:3194:b0:93f:1936:b229 with SMTP id af79cd13be357-9479f415639mr260384685a.77.1794286613908;
        Mon, 09 Nov 2026 20:56:53 -0800 (PST)
X-Received: by 2002:a05:620a:3194:b0:93f:1936:b229 with SMTP id af79cd13be357-9479f415639mr260381785a.77.1794286613468;
        Mon, 09 Nov 2026 20:56:53 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:53 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:50 +0800
Subject: [PATCH v8 29/29] soc: qcom: pmic-glink-altmode: skip retimer reset
 on DP IRQ
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
Message-Id: <20261110-msm-dp-mst-v8-29-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=4115;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=6r0ejZlAtNiiuitmrFYzWgKZtKiCeBVKShHo1hB4+8c=;
 b=iOicxdJg8ziVZ+cp1bR3ru9Ky94fiUlHfpjmXgRiOzxB9jxEeGwu2qB+KpGq98y/UqFs+tMj5
 3gmwhVWZ2+pDIMzRE7Ud8+HPiIovAUOWjuCRGFvt/VR5AbsV3A+iw1X
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX1/924cZknVXE
 XuAdBCu25QqQJ3FlrmGuoDJhLREA+GrqLeflVGEOoGG4RgGM6aZu84ulIKb0aKUHnDpZ+AtVk3j
 mfpbg5XSIDv2N170KzewHwilGoLxjag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX5spR6bL884Lp
 v+vUKb7QTPHKBpI4XQ4eSHqxkKiHncqvY8ttHvQPzNUuSoFvm2FQTRP+cHxZZ10NsAiMz8A7JQP
 e05rMHF8H/7yyxegG55tWA8Uyfi/sGv8WxlpOH5szophrjucrrtD1WXrxYePSc1+RZgjASLqycb
 RpJSxbN/2u+aW5AbrAQmjoyBI1J5x/yYUbdGnDVf4Y+oUHhYEzCKPhXJFcDw1uuag3+sYzh8bYC
 iRd90RIQmFEGcCncKBEK/h0hWEXbOmt4x1oUIP1WzOpfX8AFvqG/VNpVdhOas7j21DaLw9CkuvB
 UWwMaFUOlOzYRKLGP0waZ3wESH94pRVYEAZdBaiPKUZgLxr6Ye/7AjkTi/5VZzL5U9ECzH2pnbO
 Vpy4z5LU8UDOBid6VmznFkiO0MXY/KS8eo4pLSjv324jTarirdbVL6z3w54XM5LbsWbZM/GsWAa
 f2sym1f/Y8+QsVanULQ==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af2a416 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rzLW7fUJNTnmvIt_Je4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: yzSIBJxUe1MRG2iLlai4WP-rb6zMl13w
X-Proofpoint-GUID: yzSIBJxUe1MRG2iLlai4WP-rb6zMl13w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100019

A DP HPD IRQ reports a sink-side event and does not imply a Type-C
routing change. Reprogramming the retimer for every IRQ can reset or
disturb its datapath while link training or video transmission is in
progress, causing intermittent DisplayPort link failures.

Cache the successfully programmed DP retimer mode, HPD level, and
orientation. When an IRQ arrives with the same state, leave the retimer
untouched while continuing to notify DRM so MST sink IRQ handling is
preserved. Invalidate the cache on non-DP modes and after a failed retimer
update so later DP transitions are always configured.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 38 ++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index e903d4910e9c..5ae554dc01d9 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -121,6 +121,12 @@ struct pmic_glink_altmode_port {
 	u8 hpd_state;
 	u8 hpd_irq;
 	u8 mux_ctrl;
+
+	/* Last DP state successfully programmed into the retimer. */
+	bool retimer_dp_valid;
+	u8 retimer_dp_mode;
+	bool retimer_dp_hpd_state;
+	enum typec_orientation retimer_dp_orientation;
 };
 
 #define work_to_altmode(w) container_of((w), struct pmic_glink_altmode, enable_work)
@@ -180,6 +186,7 @@ static void pmic_glink_altmode_enable_dp(struct pmic_glink_altmode *altmode,
 					 bool hpd_irq)
 {
 	struct typec_displayport_data dp_data = {};
+	bool retimer_state_unchanged;
 	int ret;
 
 	dp_data.status = DP_STATUS_ENABLED;
@@ -200,10 +207,31 @@ static void pmic_glink_altmode_enable_dp(struct pmic_glink_altmode *altmode,
 	port->retimer_state.alt = &port->dp_alt;
 	port->retimer_state.data = &dp_data;
 	port->retimer_state.mode = TYPEC_MODAL_STATE(mode);
+	retimer_state_unchanged = port->retimer_dp_valid &&
+		port->retimer_dp_mode == mode &&
+		port->retimer_dp_hpd_state == hpd_state &&
+		port->retimer_dp_orientation == port->orientation;
+
+	/*
+	 * An HPD IRQ is a sink-side DP interrupt, not a Type-C routing change.
+	 * Avoid rewriting an already configured retimer while DP link training or
+	 * video transmission is in progress. The DRM HPD IRQ notification below
+	 * is deliberately still delivered.
+	 */
+	if (hpd_irq && retimer_state_unchanged)
+		return;
 
 	ret = typec_retimer_set(port->typec_retimer, &port->retimer_state);
-	if (ret)
+	if (ret) {
+		/* A failed write may have left the retimer only partly configured. */
+		port->retimer_dp_valid = false;
 		dev_err(altmode->dev, "failed to setup retimer to DP: %d\n", ret);
+	} else {
+		port->retimer_dp_valid = true;
+		port->retimer_dp_mode = mode;
+		port->retimer_dp_hpd_state = hpd_state;
+		port->retimer_dp_orientation = port->orientation;
+	}
 }
 
 static void pmic_glink_altmode_enable_tbt(struct pmic_glink_altmode *altmode,
@@ -214,6 +242,8 @@ static void pmic_glink_altmode_enable_tbt(struct pmic_glink_altmode *altmode,
 	u32 cable_speed;
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	/* Device Discover Mode VDO */
 	tbt_data.device_mode = TBT_MODE;
 	tbt_data.device_mode |= TBT_SET_ADAPTER(TBT_ADAPTER_TBT3);
@@ -271,6 +301,8 @@ static void pmic_glink_altmode_enable_usb4(struct pmic_glink_altmode *altmode,
 	struct enter_usb_data data = {};
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	data.eudo = FIELD_PREP(EUDO_USB_MODE_MASK, EUDO_USB_MODE_USB4);
 
 	if (tbt->usb_speed == 0) {
@@ -307,6 +339,8 @@ static void pmic_glink_altmode_enable_usb(struct pmic_glink_altmode *altmode,
 {
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	port->state.alt = NULL;
 	port->state.data = NULL;
 	port->state.mode = TYPEC_STATE_USB;
@@ -329,6 +363,8 @@ static void pmic_glink_altmode_safe(struct pmic_glink_altmode *altmode,
 {
 	int ret;
 
+	port->retimer_dp_valid = false;
+
 	port->state.alt = NULL;
 	port->state.data = NULL;
 	port->state.mode = TYPEC_STATE_SAFE;

-- 
2.43.0

