Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699238;
	b=okNt6NlC2aga4x5WkTtXYUlq+Y/z7rOP/i8o7lhWWItXcInAos3CsQhJQaXegQmVda7e
	 f7EYXYvH2yifOmppfhBAAabHHQd+M99gtxP3qL8cUQLa0UKj1aXg/6T3Ur/VMjs9dPjDn
	 hqI+iXIUZMrKGGMv9Ef6izyHzK1oFvyIcFnU103imZeQPVPpks69qWnypxkkLBIEo4Tfm
	 /cDOjutvSRGkkaJ0JxCQyI3oL/2AZ+YaIZePas/JFuyv5cZuNKJC3OuoQms1cmiCYcEeV
	 wt4RwwwntM2RLT+LanemkxFok+1AA2Fq1HyHWe3wbjab0du5QgL3bbtILmVDivw89cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699238;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0n0HkzJNtdQjaMLzn2VLaFHeZeyP5LsybYLDB5MJ+Gw=;
	b=pu4qvpuj4R8FPkuHJZRTwwczwOxHcMkSVCgTH/crIZja0tqaSl91kUGLbJ+FSs5f0O01
	 v5qPTeMrJeYj5bZEdtPt77vEy7wtS9waw3fljNazHs/pO74+rA68J+j4E5wg2fKiMQUSQ
	 orEVZ/pioixpi719WKTRT7E5RTfjvggq2Q8Fl03zPozsOEoglvXyhGlDTYIXuUUSBSXQo
	 EjD8eqSTVh4CZQyE1LOdLO+pPXtxTgB5Vzq6vOkPnMHbUTCvrc33bzXqqRFfZgn/FLGXz
	 ldcE8Ubblzp27MpJ+5ZY0/EzgKbNhXva3kfYcsi2+c3jYTcyRcaQd/BV7kmp0mkcxuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GnNNbhwT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jONS5vnE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C61A6082BE1
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C61A6082BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GnNNbhwT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jONS5vnE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37qJkw1397438
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0n0HkzJNtdQjaMLzn2VLaF
	HeZeyP5LsybYLDB5MJ+Gw=; b=GnNNbhwTN83iXiav3DX1K5/quVWHfT4D2wx1kf
	Uh1ZktXs2MF1/xeuTrRQVXzlht+LfOY7OZyYFctJCaD3j5AbGentLrNqYKWrfJF0
	Lu5ZUxIu5DOLd4KIN59UeUOVum+scx9YYyT+SuP0ad5ekY/mzqKO14wfdO6mbRwl
	Gz7n9wNDtOaxat16zS+UJhzlxQE4mY/BYi9UlgWSFDoOPS1cKUF3/5cDXVC2VRVA
	Cylv0lzMsNOVo/Q9KgUu8sJIuY8p2TsNGE4H/v4BDPFIcj+MrmHQ+Jz6OBetgrBR
	16TjekVmnGMX5CB+TRKZctpw0124hRzCB/CFzYdLRYMxiFTA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5j19u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:47:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d091514509so376647137.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699236; x=1794304036; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0n0HkzJNtdQjaMLzn2VLaFHeZeyP5LsybYLDB5MJ+Gw=;
        b=jONS5vnEp9hUF1cE56MVN33U/Q6k+9zuYs5++dT4IKO7X0w9n9hl+TGTrJi8Mn3nar
         YsnPMhCMqB1jhye4sqjLLH32Uc+G3pmOOtvAihiGo3XP/gifCFIhGpkotYuq3/CDA61A
         hPqogvLMvnhc//LkIhH9Os2zh8+IsjvTbQmo4chvypvd0GXcJ2Cv9flFPO2PPwUrR4Gt
         4wf9ZRiIlY2ccF20CF4oq23atQyipZkoY70Uaw3xYzMP/7wY7YWIB6vYXzw8s610KTa5
         J1qidPgV7bgaOAQZLOYuOa8/xaXBNZF1zX6UIupBTTRz8qRfS4Qosy5B7I+c3dKF+nc/
         aylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699236; x=1794304036;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0n0HkzJNtdQjaMLzn2VLaFHeZeyP5LsybYLDB5MJ+Gw=;
        b=lN1rvxFCCViHVc/ZFGlwPF9uYpRK6HgAewsTpoNOQDMdRk2r382544xA+V2DQX6u6H
         CasG/6lNGRTWGjpH+UUMVUVRxSPX7mReF3yd5EXDU8Vy+gpEOsK4mwX7G1KCiIVIgsyQ
         rXvwxk+i/5D4G1Id6KArAE/fD9vkMoPMQy2iVeESD9UnWFLYdQPLZKYTdm/T1R1Ix6Zj
         3OzElT+m4kajpWFgiuzvSwJzcAmOibV5Ju+5XQzshcY0EQVZELFf5XN1bGYQFnttsYv9
         SNgcbDQ25OI6K3ORrBC6xoheOWC6nusSr0KBq4upEOylNmgfHkiIusfoDbtdiki8bO+s
         tNjw==
X-Forwarded-Encrypted: i=1; AKwUvBxSSB5kk8YS254lpoC9tfwC7AU4npMpM4VyKEtyVAomyfpSfNrWPMSKcM8DqD9ltcHXzjg+23LrTlryJRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Sbu6QzW1QOySJwKuoOnUuKvO6KKVJ+Q8cW+EA7Yf5fCaudNy1
	l0Zz4eqW8oIKIQoTtF+351l0Z/ESrr+fEzVPum3cEmVCCx111x3DKkb6YDzlfcJ94TDpRuEYwEi
	tH5FHrChMSqRtI3PLwI6qJRKDme5yIUazmXAYF815ku7l/bMgHhoZa/io7705ezApjFM=
X-Gm-Gg: AYBFou3WYtnEOmFOVyU6avT78dbhZs/ZDbE0X5/PZenFwdFqc2NORS7G0+3SGUhrqIl
	DU4n42ZHvGgEW3IFY+CD0aUJUAHHP5iv/l46SifYNPx9BTqmSFRnmvGL5UAsGW0ZUrtFgh+XTxG
	tOTMi3jWk80wOlG9BT7ZAvSdsuAziN5pXBW99l2ONp222eF5u1ZITo9CBS1AKWNLjVbEsb+pvTP
	Xpt12tkUbvS7SjaPWAd8eWUz7a87Cf8CZ9Zzzo9aWJk/QXP82joBYMo8vOVztfAE8A8w1c5LHv+
	3bSABC0nNNP5r9q0yz3DW71+T0NNipwFDkG1P2HC2efxO+oFwh105oJJ6ElMFuDvhp7i481ioel
	2AL0Zx4kWsQXmnRralK9ymfCI3Kh2Vh0ZV1jIMYikBgRmpYFj11qZfCnVRw==
X-Received: by 2002:a05:6102:e07:b0:7b3:9d2e:c1a2 with SMTP id ada2fe7eead31-7d0543af600mr4596922137.42.1793699235935;
        Tue, 03 Nov 2026 01:47:15 -0800 (PST)
X-Received: by 2002:a05:6102:e07:b0:7b3:9d2e:c1a2 with SMTP id ada2fe7eead31-7d0543af600mr4596907137.42.1793699235236;
        Tue, 03 Nov 2026 01:47:15 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9eaeesm24018477f8f.49.2026.11.03.01.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:47:14 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 11:47:12 +0200
Subject: [PATCH RFT] clk: qcom: clk-alpha-pll: Fix the rate of Zonda PLLs
 with a negative alpha
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
Message-Id: <20261103-clk-qcom-zonda-signed-alpha-v1-1-31559b3b872f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ+t6WoC/yXMMQ7CMAxA0atUnrHUpKiKOAAHQGwVg0lMayhJi
 QEhqt6dAOP/w5tBOQsrbKoZMj9FJcUSZlWBHyj2jBJKg61ta0xt0Y8XvPl0xXeKgVCljxyQxmk
 gbBq3bsm44CxBEabMJ3n99A522z0c/lMfxzP7+9eFZfkAEGXSDIQAAAA=
X-Change-ID: 20261102-clk-qcom-zonda-signed-alpha-33846a18d82a
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3378;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=NGjlwTJr3xwIbJKj95ykRuhiH5GJEDrsyfPMCsr8X3E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6a2gjBxk7B7wjkjrGxO/bK1L4lQ+jBG2DyEZu
 eXrsveEt+KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaumtoAAKCRAbX0TJAJUV
 VnnRD/9lIFtvtsyDSD/kQEokY+dGlPYj2iqAVCVKzzr617qc4qDQOm03wA/LZgfQBbl6+giZ43J
 fCHjSSBjsNN2o9VexxUrGBJzay6vKXgTlKpTCHI6eLhcnCU+Iv3F4PExEi8J1Xfrw6ky2MZHPz7
 K8ioprMG16ZAZU7+GHXlIPwDL7XLbwCrYhFjrQJxIHlTskOIs/E8scQYyO+cT5SF+IHbHV0m4wj
 niQ8ppNimue/p/J3pz5xqSbtOcbFi38p0EMm0YcVxChfrYApaasq8jBO0+yer1MGKBnTs3gms09
 fQw3Hdbw+JUyKrTD1OCA8IhWin5x3wV99xgYX3n/0GX+6n9LhqyYTibrdC9IfyVKhiuCG68AWzF
 53M+m3AB4QJzZT7yWPvKnhPAJ+wWKS06G1gVh4dZTh1bJa8790ZigcIYVRrlh6zfXRqezEDxx0x
 yNljpW4/slcUpB3i4evioPFyZW8vYe0uNyxScnmRf5vZP9ikCchGi6S9azdBoRgTrX1GO1tGxnY
 KAUn5g9D40mTF+SOevLulS0/y6SJQLG9Rw+b6lYsyu3IKganh4aAIeJG70+RWistYFRoPNfeSfC
 btGCmWebNhbPOb3qvM4XJr7/j+M+l581E10K/VbhbBm/rTeC37pbI6RnMnn8KNxDGPryCTAspHc
 UViKTt4mchLGogA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: rAdm5WXY0n1A6g4F8z8BFBW80Knwz7z_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX+Jnqu4sOVdIz
 6/l2U6obYSlguNCNQoSYfs+Sw9dfdDqzVYgcjoWmxgP9jfaeHDh9t16bd7CG5kzhI1qdTovyPyB
 MIZaplK5xMThDm+Go4uOCXeYrlI31f/H6jFaaaxbzWOf+XmoI4YsgwFnEm4MLYm1V2Al01s4M4n
 d9cf8/hejIJxvyqGhQUkbFKzVVOx7gM6f+i2EpBPAW3zu1yu3s1xPfurLBuiVThyVLzIUUuFTRZ
 Ymq9ev+LeqmBr45emRORYTwmXoBbJd4JZf3xk1d7z2ktxJwLrMvSLesxPWxNgM31OnccBrYibWN
 Ur5+Bk/zRqPGyc8yjC/cwvv1cReicZ/4eUMgdZ6e4T+TXG5pxY6OFj9nW5vxhu4sS4z8oWNlVFO
 obTsPtGKX8ckZqMekYfgTUaihFtDC+p7N9p4D4Giw1fJ42fltCjE5ax91VLl05fisG1sQ6smOfj
 6SCG7++Z7xpBHLo3Kkw==
X-Proofpoint-GUID: rAdm5WXY0n1A6g4F8z8BFBW80Knwz7z_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX/DFEfqmoZ95n
 PK7uALXU8XSNzpQDrCS0zuHknToc98q2m50fWWsqZUsnvcbq4vqjSsk9hAiiDCtdmk7DNDZDcHN
 LiIEPLWpImna2YDj2ypfJZuAJB+vAZ0=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9ada5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HIFZfxgX9pW5VpyTZ0YA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030038

The alpha value of the Zonda and Regera PLLs is a signed fraction.
clk_zonda_pll_set_rate() accounts for that by programming L one higher
whenever the alpha value has its MSB set, but both PLL types use
clk_trion_pll_recalc_rate(), which takes the alpha value as unsigned.
For such a configuration, the rate reported to the clock framework, and
so to all the children of the PLL, is higher than the actual one by the
parent rate.

Add a recalc_rate operation for these PLLs that takes the sign of the
alpha value into account.

Fixes: f21b6bfecc27 ("clk: qcom: clk-alpha-pll: add support for zonda pll")
Fixes: 0c31f6a3ab7f ("clk: qcom: clk-alpha-pll: Add support for Regera PLL ops")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-17339f1f-7afb-40a5-96cd-70361917e0f2
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Tested on the X1E80100 CRD, which boots without new warnings, but does
not exercise this change: the registers of gpu_cc_pll0 read as zero
while the GX domain is off, so its rate is reported as 0 either way.

Prepared with help from an LLM-based assistant.
---
 drivers/clk/qcom/clk-alpha-pll.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5..59fe8fde81c2 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2274,6 +2274,32 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
 	*l = rate + (u32)(remainder * 2 >= prate);
 }
 
+static unsigned long
+clk_zonda_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 l, frac, alpha_width = pll_alpha_width(pll);
+
+	if (regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l))
+		return 0;
+
+	if (regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac))
+		return 0;
+
+	/*
+	 * The alpha value is signed, so with its MSB set, it is a negative
+	 * fraction and L is one more than the integer part of the multiplier.
+	 * See zonda_pll_adjust_l_val().
+	 */
+	if (frac & PLL_ALPHA_MSB) {
+		if (!l)
+			return 0;
+		l--;
+	}
+
+	return alpha_pll_calc_rate(parent_rate, l, frac, alpha_width);
+}
+
 static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				  unsigned long prate)
 {
@@ -2322,7 +2348,7 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
 	.enable = clk_zonda_pll_enable,
 	.disable = clk_zonda_pll_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
-	.recalc_rate = clk_trion_pll_recalc_rate,
+	.recalc_rate = clk_zonda_pll_recalc_rate,
 	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = clk_zonda_pll_set_rate,
 };
@@ -2998,7 +3024,7 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
 	.enable = clk_zonda_pll_enable,
 	.disable = clk_zonda_pll_disable,
 	.is_enabled = clk_alpha_pll_is_enabled,
-	.recalc_rate = clk_trion_pll_recalc_rate,
+	.recalc_rate = clk_zonda_pll_recalc_rate,
 	.determine_rate = clk_alpha_pll_determine_rate,
 	.set_rate = clk_zonda_pll_set_rate,
 };

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261102-clk-qcom-zonda-signed-alpha-33846a18d82a

Best regards,
--  

Abel

