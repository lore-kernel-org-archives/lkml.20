Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10023DB96F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280240; cv=none; b=HtvkJocjTWDWNtJe2xf4MgB6sSjtHjJYXEepeTkDCxwuVhA8XVvcLT7uJj8D6OSBX30bQ4D7frmKkcyk1dBXFWxI4W+6TgY2nnD5aE3yhuiKtyIDSnLqzlICWdRX73jdR9PXkmMEqnZ0wNlV4R4hxUCBw9NjfpuQKosnLBvHXOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280240; c=relaxed/simple;
	bh=kDUg1fRRmqKzaG6Zc2sw6qY3SgF2FeNwHEhldgx/a24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CzghuNBTN9pQczGgOl1zlKON6eOm8UiKM6yv+3VIQr+LSUy2ZquS17wwH6VKU+KRf5QqV/mZOvhMAfqZZO3b1dzOqiccXk51Tf7aiZpZ1f+42ChpGGdpCI5CDptpmFDl943J2JcBDXVAMye6lk2wk8C4EN6LYQ4HkFujFJ/PzuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HUyim16t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eKrvTdvl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HUyim16t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eKrvTdvl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eEfF4103759
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 09:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUHikJVq9dmQEfe/H/jSfclflEc1+RHz3l/t/iTT+4Y=; b=HUyim16tfFBieg0R
	R49TMQCW0m1I7DQ4IV6nXOkrqZpMMMUTYmwrngpRr32/XG5tiUq8Gvx7KUg+86wR
	40l4wp87SBqCeFRq5nGs3/+B3U5k59RAxFzYcq2w04P/CZmZTNwqS6yLSMKGZn8J
	Tj1HKxmP1mYhCi23whIzmO45hfvr5eUy+ztOg8kuRPhrwhrGfg8RZ/vbBINEmwJy
	y0F6t+Ne8DmNVtCUd8blrqjZn8ph3H9Re3YD9qUpw/uOzFaRS11TFDCkUW9/rJ5h
	RUfBkYiGdEnpTTo/hAAMk0SBZHk0xggzssWTpB5u7ArP5W6ORW8x4buYzlnsWvgT
	EDS31g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0b0qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:50:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88a2c5d7ef1so3648403b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791280237; x=1791885037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUHikJVq9dmQEfe/H/jSfclflEc1+RHz3l/t/iTT+4Y=;
        b=eKrvTdvlUKPjvLbWLV2l33l1DFfOXTehIUQk1C6awtBoY+9vPAgeEvXz1eBQ4k7Dfo
         zS1/SyWWdLsz27whgtgXJdFiaYlZd29Jczlym9M5bISF/UnfUeTI6ATBvojTGR/4kzJr
         uyW1IYTAaTpnJuYOk+XaBoP7WTvx3av+ewDWTKrbdngJPmwGvZLMRsrxr8ISiZAqSJn+
         MRA+eFZwuPU1sqaFC75zHqOjuWsVag3VeszDksYmO4x+hAkriWKBnq9ea8w6/IMs7FPc
         OjL0yUa1CJIhtZCBfUnSmksxaiktRZGoadKkJ0vySUk9hQ7C/tVAIWPPZAttvue41tTq
         t1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280237; x=1791885037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUHikJVq9dmQEfe/H/jSfclflEc1+RHz3l/t/iTT+4Y=;
        b=uCS7QN6XTiFY3azVVSK9/5OsGOQFZoIKdGOqGsJw5yaaipBUW0kOab67UFb+EDj+pP
         PkmLvJqBpL1jFxsAF3ogyUXupTCu9d6pwME381fkb92DOL8WJetpG01cC9Tcs5ZtVvH4
         rnLd5NMt/nx9hqiWC6Cno8oa0P/mesL//mNIi48JG4B1WO3x8Elr06lpFXPj4Bg72ftI
         gnIvx7CJz5E6egfuSjRSC24oj7LyUHBvuYe7/bOoUUdWelM6P5d/Yq7/JfqulttS/vcw
         lVQ/o5qAalm+GbYLogHHGfZlLZYz2OgLLbQdKsV0pZJRb7RXedWHP3Grr6RpDfgGlvr5
         wOzg==
X-Forwarded-Encrypted: i=1; AKwUvBxjrciIaBTLvznfpbxv/ehqOdGXaniHlhAtWwrCG5lDBrVjJ0hfSRviSNbcap2PzDc6NVLi6sC6aB1k0LE=@vger.kernel.org
X-Gm-Message-State: AFuF++luwEe0gdjx9TLXWGRCFTTYlH4spVBdjhKfOp0YnBCY6fjn7F6X
	x+TZe9Z10W8MmrZd49gOc3Y7VHCX0lTJjCmiMJvRgFNxIyZrNNVoPWodXWouNQ+ZDO53Fjl8dqD
	6FezSAXW78iLsk1RLDKSjbAbcB9EM2uBKQg18ON3IshXi3RjSYHc7fAswIB/2I54xeXo=
X-Gm-Gg: AYBFou3J2+/WJIZmV6uLI7eizn8XJUAven2nfn1cx8fZMPJYKzvGgPr0WTrUYSwrPTl
	nxVuISyDjjvUGA/0cLGm4ZswSuskFkIBec/VoTjjGnSRBhPAY/D4lAHoEp7avow3MwyKNDsmiww
	NYPDTcOIJLmofaqi+vFieSQA8Qy5FCzoK82f8XAuYNgTrNvhQYjWtkNlScyfB7I0yMknZEPVq0m
	FaIP1jVKQkypGwTo3Wdf4wGqz+HqbBooTRhi3f27TDXDY7xyVd6ZWqTDFOPgn0r8ir/qBF6fNuY
	eJjsUaWHZ9T/DiuzUW9MLOvyFa3+tsdadOP3ISXvPKGjDY2ltV0JIqgDG8oynaFcfgZB0omK2JI
	tzSY10cVwTT/NdUOTT18KwIp8nghwWFGa89Ea3WPy/ruc0ql2yeKp0hCljyqoCAqt
X-Received: by 2002:a05:6a00:1581:b0:891:1caa:3f72 with SMTP id d2e1a72fcca58-8911caa4c0fmr226506b3a.57.1791280236620;
        Tue, 06 Oct 2026 02:50:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:1581:b0:891:1caa:3f72 with SMTP id d2e1a72fcca58-8911caa4c0fmr226486b3a.57.1791280236192;
        Tue, 06 Oct 2026 02:50:36 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-890acde961asm535523b3a.61.2026.10.06.02.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:50:35 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 02:50:28 -0700
Subject: [PATCH 2/5] firmware: qcom: scm: Allow QSEECOM on Surface Laptop
 8th Edition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-mahua-surface-laptop-v1-2-406fc042162a@oss.qualcomm.com>
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
In-Reply-To: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791280230; l=952;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=kDUg1fRRmqKzaG6Zc2sw6qY3SgF2FeNwHEhldgx/a24=;
 b=m77AJBxiEiOXnMON0T+PwcT1ix1BgC8IkQTobT8Dov8QxJKID6TD1khw2uuZIQxKCKSH9xmMr
 1OX4Ljgs05bBI2N/4rdGHcvd2OBZjtwSRHvrJ+XXNQTjncvV6HJ84PM
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX72PBDeUer5V5
 /qL5XfQe3FgBR9UtSn8UF7oWNm1U0QDzbw0tUfsrINb5pTLw67FIVIFm2W4uqyuQB/tKUqMghP1
 +TBFZA17zwUnccm+cmleQEVPvz4/ziVfsEjKedn6vb1sriKsJDDJabNRgjqiNcTeUa/JBA5J7ue
 HokI0+fyfs9T041XTVSLBjw9P4H9utk8YQ7IKztZnFgeAvdYHPrd4VRBwg+sRX3K9lDRbBJC6Wo
 +0Mj5auNgN7+YufumtVVEcL8WgJf0dh/QBo1j/SBWhhiU8+nAjf+5iaRAFcuFwG5SM4Aph/eZ93
 wFw0jw9kJSS6XnC8K9LYEllM20z0HeBdDrGKQEalvjrUo6yb/QerRUsSRpQi2/zXsQYx7EYnSX1
 4VcLTZbqENLU3X2v7IBbUI5vM1OmIwyv3kFepMiD9l2Q6yxVxSzX584j9Ig9eQOW2LbCTlVLe3C
 zOArLmnNsXqrgpXYAEg==
X-Proofpoint-GUID: kDCOi1-a6FMsZhqBibcWn3wasYCu7PKs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX8qI5fzuTFPcK
 NmnCvi9LeqdvsdUr2tHPmT7O0YSL4w561Y5YRiXmjVFKPFWGpLZKX4V3V5eu1BN+iF2JSIfrbIL
 PoUUL4/CsJwwYGC//gcFvXb/vr7yauw=
X-Proofpoint-ORIG-GUID: kDCOi1-a6FMsZhqBibcWn3wasYCu7PKs
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac4c46d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iOO-S4HMiWNIuKyz5uAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060039

Allow the use of QSEECOM on the Mahua-based Microsoft Surface Laptop
13.8" 8th Edition, giving access to the UEFI variables and the RTC
offset stored there.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..1fa912a9f700 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2255,6 +2255,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,denali", },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
+	{ .compatible = "microsoft,surface-laptop-8-13in", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,glymur-qcb" },
 	{ .compatible = "qcom,hamoa-iot-evk" },

-- 
2.34.1

