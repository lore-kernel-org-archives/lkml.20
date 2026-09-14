Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D7B47F3D3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390134; cv=none; b=P+88ctr7v/5MS++ODH0T/MQhZHv0Txc7WcNz6xWuC1fuDPKxiuBox09KWY18l5T5C6ZC3FcZwjZ9IGcTBwDjgmyMZRMAk8aRgS+V95wofhqskE9mGLTqfQAzOhDnYArJ64yvHIuNOI7Fi2qg9rOy4WtGWycjY8kViRimV226vnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390134; c=relaxed/simple;
	bh=7uWaiOYG6E0w9tRAZQPw4yJvrzhGulLN3j7SoMA1qvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PO77f16kffAgPkF3+Wc/v2LirFRRUP2mDdHXtLb1ts2BuBjkpqEW4FD12fp6+jHpJ4UN4AKtmjTgDtIIEiwzB93PfITsBCloWvpi/0xoZ3fVacbEgymBqYa8jxPPSvYDuvF0MqpDzE5Kkbl7bVBDSHuJdUsu1yZbhe33/9f+xRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1MuJGJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CSPvCRXH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1MuJGJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CSPvCRXH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlxT61460629
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TABm0P3UMKNtQarNWziPpf5uHr62vIw/jx+cW+tqSy0=; b=D1MuJGJ/cAR4k6sH
	FXrmtMp+uFWPfZJ+BlkztBJML1ouqiRv3/RKklF6YGVanx1u+Y8udtrYf6wjEJ1k
	GzLiyOfabZUDt0gVjnRcoAtQt+O95tK0BsjgW8cNBkdL74AzNfAYyehiBidA1PrJ
	OF89Yg7EVYyxX1TZCdBDW/Xeygj/6lngoWTCOHOM0BmTpthcCLERlWvTbuMyLlLZ
	ltEphN7bcqu/EJ7Bx7ttWUV9ynxZb+0bFe86iXcaVb0oEHNM8a10+rlwB/OHhrld
	wmzul3AFAMX3AqQaT6XWoVmr2bmg8BFQps8cgHQCwOwSpRnLh09RMbsjQ33hh0+D
	STpX2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8qkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1b824e84so228783485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390131; x=1789994931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TABm0P3UMKNtQarNWziPpf5uHr62vIw/jx+cW+tqSy0=;
        b=CSPvCRXH7nQmwolklj/F11a2O8NP6o1Nv5uohcceU7tKMaiMg8c+qZ3C8O8htiAj/6
         5PUXCfcyWBukS9k45d/Pky4tl/syNuzPNnluNaXyq3siCHk7E21LCboG8j+9EZ3b3/OZ
         XXh5ZkAIXiT7smPOG/9WgXeIuU98ZkOiySdPImUNgiNySk0mijokNiCwZZ0XbUlFnW6K
         EEzRnJB9d8P4doqfFomqplPMFrG/k/XSojT/+ltgi8eS5hjW8VoSXV1bnybV9p+0SGHi
         c2D+CiQQSxNQCHxxwpbKdZuKDgJj2mONGHRzoDvhSG76QSKo+XYqkNg7S5tRT1f6RGbu
         YZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390131; x=1789994931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TABm0P3UMKNtQarNWziPpf5uHr62vIw/jx+cW+tqSy0=;
        b=AQlHpVd3nVtHSZLbj/qEWcyTto5q0mHOsyQdZLzHfyr8n2GW5I8TvVE1JOJP7D3yHE
         0GVIyGHYB+V5gO99KE+MsYJUGPYiTQkLCE0VnijpM3E1SuQ1F9kGlopOzgwFjogBEeZC
         vBeBXvQtvNj5c2i9jmYwXLE7IkdT/SeBUqzMBAVJsySZdoRcCRH8XQeAKFbzgrwvp9sl
         bPO5ZYwVkbRuOxPJwq7dL3N1la636yqamOZG12BrUmotT7VhB8Rw0TgFm6P2NhnDmvpE
         dDSwxQdrAE3lkkJZ/GKEnnzJ+ShEy5oFD/7thVH1e/jDUb5Afl6elDFeMyaUvw1hQDPw
         orGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVw2xaWAF56DWH6RUgDabO55Y8ycH56N2UqGU8GNfSM8vgg3Zbhw8D9K7bRfjw+z5gvb+gIXT8OHw+zc4=@vger.kernel.org
X-Gm-Message-State: AFuF++n+zSyVEjxMnRp6mTHF3L7w2LsR58RYapuUCTUyh2mbq+1krHxV
	avRFzhheIkdtXlVWQM1JYS+inozeAd75au6Pc/fTOww/707NWc6WqG/LcXp96mvBGGY+gjJ8e3b
	AFXG5t0k4g93iPx20AkkRXTfSALeyD4MitBavxsn3yASyD7TzeIvu9Y2MRiRdu6o2f+w=
X-Gm-Gg: AYBFou17gy27mTWN2dYvy+J/mitC0/xZXPzFK5ZDkgvw0fKqaCNn8y9cVCiX74RksOy
	7TZ74M7RakouLzCfQM0voGPEGLaIYsVZh0Dg/69z6V2h9kF9MKfBG6rrUspGgIrAuGF8QcjUqH2
	sx3MfxVPD45F+B/GwHm51VG2y5ck94lsE21oSrPW1uk5kUT+DYXQOBaGdt6w7T/jYKq2KUEgFit
	MZu+sBOvDMhRS7jrMJhD9BSX36/emxyJN/ApuW5q4vrJJFaN90Bs55JvpKXqp72pdT1/3X8q98g
	SaL25IjXsat77rbjXqeUwGqQqwgipt0UqCjtowamlP7JWK1kOESCDGL+DYflCRT3+tPJvC47Gs1
	BCEO6WeQ1
X-Received: by 2002:a05:620a:6018:b0:939:a3a0:9a70 with SMTP id af79cd13be357-93a2977b613mr340030785a.18.1789390130559;
        Mon, 14 Sep 2026 05:48:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:a3a0:9a70 with SMTP id af79cd13be357-93a2977b613mr340023585a.18.1789390129961;
        Mon, 14 Sep 2026 05:48:49 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:17 +0300
Subject: [PATCH v4 18/52] clk: qcom: gcc-qcs8300: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-18-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7uWaiOYG6E0w9tRAZQPw4yJvrzhGulLN3j7SoMA1qvo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zdZsNx/PDW2lCqmpHi0CSNev1YP3XOie01K
 JBWpPDJgz+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs3QAKCRAbX0TJAJUV
 VmeoEACEdRNATcX2Q0MZuUF+S/hD8hQR/a0U1YqC3iIZ9ZdIpkafNdPa7i0QsKobDrT7yGVhjvx
 nz8Ozlmiweta9FSvB2I4OdKAO52nZZSjYUSRPOt5D5+SVog8LXm9zpX3ZgB6tHr7GewppMuM/uF
 RPLOY3ueyiPQT7rrV04X+//NPhorsBJS+u+ajUltnhMVKjeXekbdCvtLfa2UhFmNh8oEKtLzgMF
 5IAQxCYcAZQGv25uZfZDGlw/Cx96mIRPrLGU9Fwd4PtK9ijvCUhE5TSIiHeIizrMo04ehJwOfYk
 poNdmX55Jaa4raKX/Gwa3hKeK5Fv/L8/epZa4wq92fBzN96uilfvnkDkszZy/2tvL8LY99C91m6
 auT9yTX+nV8kDGL+5Bn9A1f9Eg/h/FedY/mcpS9zrXlP18XZgM3pCZoFnf13LGY0R3Z1Sw2tqFI
 DUHR5Y5WwuU7EjD8d7t3a509U+obrQEk6pU2i1R8dvzoiEJeaiqpxqlA9EQriLO7QL4s7qEzF8Y
 ePmAZ1BDdP6reSrv4K9vsbaCXQy2Xc+ggk3MelCFYQbP5V3l8HQSkNtDW8urCN5F0c0EWVtgQu1
 DPM5dfv7besxpveAVkM1k4nNblOgT5TkhbRnOESJGM7P45awutEGGgviUFy3IsnIza+n6w9s+Zg
 vxbe+Sd2mecK4MQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX1Kb8yBiQ+4tn
 U8APQqlkOolBA1Dhy01qcJ5jSN85MLSJS8IkqJFUYWTKqtceYoFwPibzgpTaiKmdCagirCJYMAF
 nmYHas3GDfYHDmJ+fdF3TUSYl3b1Ey4qf2pJgtWp5D1XTouLnut0r7my3OAvLOJztm5AkMqv7QZ
 o5jXmp2pzb9gKWmm9L4ANYeOzY4xmpUm9SIB7c2efeEsNp8qJu6TMOyimd56T+KcyuA2FoW2kC8
 U8VIwh5USNWTA1sNzXuTbLnHJsuALfvRpOEQlEeAvde+Rnw08pfb0oCFol+nGFSSg9nadfnoK1J
 D705LjeXqo0blLr4G52jPsqcGa3SrQegAiYNHBDASvc8uuS5attZ2LT1wXHDNHqDv+6wYLMr+TG
 JWhA6TiEQYnCMsOHDuBZQVbAHXR5yont3+3MvP1uwlg26+UBVsh5lSh9VXUohQzHn8hck6OQO7g
 pB8GPBpj/nxOG6azGxg==
X-Proofpoint-GUID: UcQCNM1q7r1kBv-yqsRBzd8upO3Lvo1a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX7gZVtX1sDMyR
 k/xyhlEzqYzZ3FR+vAFkyhQeDB8sW75+j3CIB2xpshUoPRJ5l46OcgHGrr82OZme5VNvS7xXwZ9
 /g1qna8mV27qFGoFkFygIcvEk5l4rV0=
X-Proofpoint-ORIG-GUID: UcQCNM1q7r1kBv-yqsRBzd8upO3Lvo1a
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7ed33 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs8300.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 146b3b5dfead..d04980e4a0bb 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -3681,6 +3681,7 @@ static const struct qcom_cc_desc gcc_qcs8300_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qcs8300_resets),
 	.gdscs = gcc_qcs8300_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_qcs8300_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_qcs8300_match_table[] = {

-- 
2.54.0

