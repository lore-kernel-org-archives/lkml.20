Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435F34A13B0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853107; cv=none; b=G4EucLTq7IxAJDW9T//c4nMfu8bpFDDIDqhNrBHkkDvO6Det2pV1TTOaQMC7J5l31S5xJ2epR4456azOd3cfDqineq2HEGmTz8tgLEXO1lOl0XVCOUsZrvOJ5GWT88KHVvGJm83o9cRR0WhvglKb+NBtGyCXHxtXVBF0h1NRTHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853107; c=relaxed/simple;
	bh=k/DT6AgKWqS6ku+QAjOs6ZqZtSg8uMTVP2+zB+uhR9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C6+RcCYH1wPhq1xqSDXKSxOEa7uNEumjAx4BxQeuE3FkwALnwePZ5cMCxmo4JK7MVmbN09NqDqqxHF1nYUDPV6vS0uC0C7WwjFrW0CyRaBDtwhRWBfqmoIKIW6H6aT5d1PQexLBHcmDhnH40UpgPNKNPTqp6bXGemlPtT1ZSCFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1Z6dd2e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6Gdp79q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1Z6dd2e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6Gdp79q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXibg3613337
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=; b=k1Z6dd2ejZaZb14h
	BBiA2j/2MndoDiNZ3U04U6JUwtiVfZKYNpi3GsBPpNAcKgtFfOJ1M5gEyKHYFWGP
	+dAAXWRbjjpcRAbAWI4+PHVnuevAUUls25FW4l2pSJircAVOx4yUCNXxLkDO/hnB
	gDoBNNv03WhxxeOh9B9SQnAaYBlY2Yku5Lz8nBHHUlzXUdvLPqq+fP796h630+nS
	51n+L6GAXGEMA5qVZr5JxhVgjLHLjvecNKC3q6qOLU35I1WeDc27wOtmG5b9mbyC
	H1LFfhzsQSd5qAgy8FDp0A7rcZALqTIbUzKMDXsWZGmJI3lWjje5Ubj8RNZDbAEw
	vgE5ag==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gab7t3wsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:51:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc132709c76so260022a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853105; x=1788457905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=;
        b=Z6Gdp79qI1O1Re0hmUHhindvoVZy4j+Z+KkuudB91p084yxQcs6j+4GT6y7KbLFpsN
         QUN85vaRx+cqLNHER0zlFbk6qAg/iOGz2Uv2VN24ie7LuN1Prfl9tZrkiKVswi0Z/3hL
         qfAdsI3axt9NTS1ndNT4ISIa9W7/EFPVITcm8O+jRysx0XON6nItam6xmXVHu846Zp4Z
         zKo9ONaPFGc0W2cM5pgNeYp82Rf7378HCF1ReP/8LbDW4oQwoJ6ZiL5XE3sUTboa6RvJ
         42Yb2RKfCvMc7VoYMiVQl+i3eqwAsekzn8jtxxMpgaEMBI+XOyYU4z+Z3oFZxiJLiaAn
         lWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853105; x=1788457905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=;
        b=YfhupOuL366R0xzGEzw2ZnOIdkoY/MI7Uh0mq56sRad0GRo+d8s3F30f0nawmEHTlR
         4Tp3cA7UxpsxJAEMJXcCTaRpZOWjeJbw0c/qVZ2rdtsK6RI1noAjgJxlagsxq9MQgSe0
         JBLMpMOdXApOem3iSUOL5NFXAAGDH8vRZ/bhrNB8T+htOUEPot7BcYzl2oGDvHBp67Xm
         hnV3IZ0Os2Qqfo9Xt1u7TDOiec4laZkdUkVB7/SsRlC9LGE/BNc6nSoWU8JvBEbwT2pm
         g2S6TpmqR8OYABOShWFANvn6T/vOrx3E06wkifIMGjzTIOEl5ZBazyDHc2FFQBoPOoYU
         tntw==
X-Forwarded-Encrypted: i=1; AHgh+RoAIF6Qhu2DN/FOIM0RtpefJcbgGgVsBYoQA0psNwl37/vGZo6SsYFcjpBRAH7WTIwu3BFg5LRewLbPvFk=@vger.kernel.org
X-Gm-Message-State: AFuF++m6DnqnzZCPXIFzhMRFZ5ge3XUZZD+rBEMblHbhcCdu6UE0U8aA
	A7pbVXMIMdgGwTZJ2t85DT8MFY0HioPXv8tLIfLHIYZS8ujCtLS+AS7AyToXIsBIGdgqi9DsKZ8
	dJMHx14OAb4qIoMJ1YkMkRm74OhN4nTitbnDgpltP0WKPU6vN6VXgCwAvE0LfdURjRC8=
X-Gm-Gg: AR+sD10NBI0hmrA7X/JZv6I62/8ykgs4sRM1A/lBf7lXKEm2fxK5UPJHzR2J/D3hSFG
	qIgAwtoFZPGijuemmMb1UNN4rkWesE3n1r1i6SiwopALdmPj5Z300iR9edaqUhQeBnxOR27ARdr
	vKxjXgiZl5HzBG9fRn5UYuqhWwzF+Hog/tMpAfQ6qYLIXwYr3lD0K091/xWIrjlgIPbrZA9H+qJ
	IKApg5CMIGolerf+4d8jEMtk8FUAxlS0mNJklGVFm60GuMvarc2Mh7ljpSBLFHAwfXkgMbx+Yzd
	z0MVMMT8XR3s29GZQUYfS86qKtXRs3B3VypkRqYFIdSz6f2rx+fCIo3L7ti7N3Q30+pj0llhev9
	PQe840DvNDhLXF4InnAfY6WqkH1Ncscl80cfxFkgGg9pgZrcFOixJcNvJSnAY6RWIKsIxPF85bw
	1cVzvmX8l42j/HWbLLshNZPDA=
X-Received: by 2002:a17:902:f708:b0:2ca:481:de45 with SMTP id d9443c01a7336-2d74dcb5c40mr12274785ad.6.1787853104472;
        Thu, 27 Aug 2026 10:51:44 -0700 (PDT)
X-Received: by 2002:a17:902:f708:b0:2ca:481:de45 with SMTP id d9443c01a7336-2d74dcb5c40mr12273935ad.6.1787853103968;
        Thu, 27 Aug 2026 10:51:43 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:51:43 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:06 +0530
Subject: [PATCH v5 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-3-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=1801;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=k/DT6AgKWqS6ku+QAjOs6ZqZtSg8uMTVP2+zB+uhR9k=;
 b=i+O8rfJxoGXvxVb8s0xUN5ycmjvQA1VLSZzdlTqgB5ei4txrnc1hXqZx6yMSn+P7/kHrq/WRq
 +uDDOAajqMPCrT4rDfEz7FVT3k6XSqnAkUgQs9SKUE0OU/9v4bhnuj7
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=X6Bi7mTe c=1 sm=1 tr=0 ts=6a907931 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1FmER_HI0FvT1hCPThAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: FG3ECdiDh9H4_SZy-V8x5gnEeXzSumYM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX1CxhpK+qlIiv
 supERmq+9m5oifs9lv0CajAJL8neudWpD5KjvO0gl5o0/0O39bsX3Zba/w4+1/5sEnvRto9UusG
 zBLkZq5vRi3UsFeJxJzcFw2ZJSKZxbM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXxKLucO/XPrtx
 iqgsVcdMMF7hsEvEKYromEhMCQfca9SAajC3ofCf02CTojbgdW0OF34tLY4wEI8T7G2fl3x0T8P
 GqNTqjerqg4hSuigLjAdZcS7oseZFORI+3pXGiCCjvxZQlBr8uN6F41/kO3pn9Q86IzHdMVUChz
 cvPKCfP7cZLBa8Ohp9/TvuN3KwDYA12QoAAeZhIH6LosAqhnyV8Kas8WYmLu4CFYSit5KsXL6Ny
 eC9Lv1jZOIUQk752FHFnBrmEQR3a9J3aI3hUYkLyfQ5gGVkUyl+A6ESAO58/PZTuLjD3qKFfbUY
 74wj6v/iJQZAWEyG7hKd1EP0wdRKbNEecrDPQ2feOEJXTFDe5EiMlrHfcITB+oZflsLWWTESWjp
 W0AVVa3sUpXdh2TXPoSU7KmVjr/GLPBUSv1GFW+G7medLVaA8+3Hbkk0CE6SeSPQp7mGlDStaId
 IAGT0DvlJcgejbmz7cQ==
X-Proofpoint-GUID: FG3ECdiDh9H4_SZy-V8x5gnEeXzSumYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
exposes CX, MX and MXC domains (including always-on variants).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 90743275942d..725ce802f683 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -681,6 +681,21 @@ static const struct rpmhpd_desc kaanapali_desc = {
 	.num_pds = ARRAY_SIZE(kaanapali_rpmhpds),
 };
 
+/* Kuno RPMH power domains */
+static struct rpmhpd *kuno_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+};
+
+static const struct rpmhpd_desc kuno_desc = {
+	.rpmhpds = kuno_rpmhpds,
+	.num_pds = ARRAY_SIZE(kuno_rpmhpds),
+};
+
 /* Hawi RPMH powerdomains */
 static struct rpmhpd *hawi_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -885,6 +900,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
+	{ .compatible = "qcom,kuno-rpmhpd", .data = &kuno_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,nord-rpmhpd", .data = &nord_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },

-- 
2.43.0

