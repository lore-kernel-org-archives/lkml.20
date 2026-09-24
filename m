Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17654825AE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246472; cv=none; b=LlQu6CT+he7lrkUnLHtysit6wkoHD4EPMDxodV3O/xkEMBWarEHcP0J/d8Afr40mvT3KgxYan5mVzjZSImPaHj4KZkef5h5Woi32kyTVqVx2rhFKf502cOSpeBZc+Emh+SAmTOnGS8RzqFW1bw0Xq8uww7n13HI8kJAUK3xZ0AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246472; c=relaxed/simple;
	bh=NLwQJl2Mety8v+w0gED1ABzvOlq4xUPMVk2Hw6gbPMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SPGL05vox7WFALMR0CXANnxvy/a+ljtfBGzNluZCKMgmt3uaIB1B/3ojHXXpLUvOEmsgL7YSdD3U/6PpuP5UAHbP+uc0mOH59tE4NUbynWnvphyCcNPxUCP9Jwefx4tXpP6UlMlkLzMqFNzFKR+5+1vvjgo6wqZpFFd8tIEXzT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0AE/mxD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZzrCYw2u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c0AE/mxD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZzrCYw2u"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9P90m1923773
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OhFr4HUfLOzEqRzgX9px4O8g1cygwzxilZf7Vwl6sOY=; b=c0AE/mxD++HOcUiU
	Gx5SMmeiMTwEsINHeAuGBXrQcpzw6rg+PRN0aauQorFbw8yeLD92+SIds1vpCARz
	KUI4iyPius9m4rfnF3x6onhWFHObbF5PV8tiXNL5fG7Czx3Z/s0ha6epkAtFMWBi
	GUO3p2vgjBwMeen1s5Iob///NRK+HjR09cDUNw4QP3YvBRLHo/oB4QkNbve9NE/a
	T/YV8G/TUTtD88l93gQ8M2OSqawNaBLdMoj29JQJ2vsSxfW9anPGskgedTsrHd1s
	XBqppUuNHd38rIDNXWyB3gsRJGP7aev6lOXkx/Jvxb2BhaKrTWtz/i3PD8y51CG2
	QDfR+w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ah5pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939c30aa9a0so176755485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246469; x=1790851269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OhFr4HUfLOzEqRzgX9px4O8g1cygwzxilZf7Vwl6sOY=;
        b=ZzrCYw2ug5KOS5ss1Rpf1AbeCva4BTxe2NMOdCTzZ+x+02iVwiUXJgUHDexpAgOYem
         MCF3zEBfqevmRMugRmMh+nMHibnZpUg2MPMM+rEAcurbPIl4T9AvgrVyV4yGCeCRaM0u
         UYCgCPnWj3hOytWVYaAWEgK/ZCPu27FupPnCScr9YO2/FqdHIJQiE/1Ii0EEVdDGHkh2
         Tju/g5W+AWxbgOQLkcz03lkn03oTWsgOZEQ28YbYoAJqUSSySacIIG47TwSciiqG6R7M
         OqvK7Us5tTSTBEwjyLC/29mIWORbK45Hvp8Wj46hstT3AHM6oXP3LK9ZlB/VQYPPnckZ
         N0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246469; x=1790851269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OhFr4HUfLOzEqRzgX9px4O8g1cygwzxilZf7Vwl6sOY=;
        b=2eiLdRIN7KbAdCt49qHXKDtv3Y1qe0tklzNYj/1u/8xhZ23NcF8s0W807OkJdHXSBN
         ieJYLNugmMwSgHuJFCSH1O2wvLa0XzGTg4tqsOndU8rDKF8ZUl94suqXSLXwelb+nfHt
         KXcFOJqecydrLVQQf+jc+S1V0e7Ugynsr21SS1sX0VJulWybv7D9L7+PtfQKa3HfaKD/
         iWvQ6wKJGzDauIpnfSjY9oRtF3sEy73vPUlihP1zBH4Qk811AObF/pMpi5qjZbz18jBX
         10BZSxObRHkuItN6UcuLPMkgkLMB4K/dGFDhJgW4+wGlof/YHjGUnrgDd4zLaTOuW/Qt
         +pCw==
X-Forwarded-Encrypted: i=1; AKwUvBy81IBrfIicyJ6v3cOO88ASVY46+M8QkWNvv7wPWCz9sApSFbuf/xRTomfsnYddaRodNHWoJPanxgbSENQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lJUkRCnCCSuoHcu2pf+MDAOwXmmRLYTNuzQ1IigVSVhCwNTxTu
	juldPEX0iw3jxraWWG9/CQ1v2LkaowZnr1jZEpzjILuAJdWzLE0/vAgXzpR6ybaFni6fPMZE5mk
	EL2ulUXlmCUCMZlU+xVlr3UU6aNAyXRrKcBLgVGdCarGA5ih6Giu9tTHmQ02cK2PgkZQ=
X-Gm-Gg: AYBFou0DMZ+bGnGlCaebb7bzzoKLp5V3tYmEwIKGo9QKM8vdgB3H8uYHlxHsyHy5z1Z
	GQsiyfw/z4ah6b3tWWmrP7Ye1+3+B+80ZjhMTdpBUVgaSZF1ziq2TBV+/zEbVt8zOoYBooBai/i
	E/0r7n7YhdgoM8++8LUjp2hl0uSjuO/X6l2AaUHCZa57ZYlYC4T1YyS4eM/SjjFTfUqgy4zJeqe
	HzoLU6+6vMP/zVAOesn6s13Pd7DHDHMuVfRi+SmB4uxk1UYg8K+ADHybQoY4PR/Pd1l3cbyXIDo
	GZW4gF8D33hRzcd+5dOGXEx71izr2tyyU7+ShoCW4E//VHFvvK2cnbpHhOgdBOjlpDlfWbVFk7F
	nHRzdi3Rf
X-Received: by 2002:a05:620a:6496:b0:93b:d7a2:dd2d with SMTP id af79cd13be357-93c3641e06bmr219201985a.61.1790246468822;
        Thu, 24 Sep 2026 03:41:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6496:b0:93b:d7a2:dd2d with SMTP id af79cd13be357-93c3641e06bmr219196385a.61.1790246468194;
        Thu, 24 Sep 2026 03:41:08 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:37 +0300
Subject: [PATCH v5 21/42] clk: qcom: gcc-sm4450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-21-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=NLwQJl2Mety8v+w0gED1ABzvOlq4xUPMVk2Hw6gbPMQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3uID/BIxQEOjphq2+/ltLPcgadZ7XQ+cpDz
 39dgxFGSQqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT97gAKCRAbX0TJAJUV
 Vv+JD/0cyLGDEKQ5VdgblJvsa3s54MokVU/AWxhKbHZ7efksJysImPNMzA6FhC5ZmvEayzNhlFq
 cdEK4jfnQGkQG07pg1Jx1hwDikazHGxrxQ/6dM09vNy6EaC7tZMHxcfzKziFx3EzeiDlX2qKXuj
 baE81iqfH37DC43cL14NEnZDORA99urkfSz0fLW8YKCrzFoXf6s7LiKJkvaBaaE4EraozUQO7Zs
 lQweNcTNOPBma1mLGTCpAH7AgbY2MCsyeDqRY3QboARzeLvJAxP1KBuEGW+h0QSBv3zliH3SmMg
 tyZxXh1BbcNG9p4p8RfuF8d0eFzk9+yPramZMeIYTrGHUyKb/BAIs1hLV8SMqPhXwEhOxYx2KYh
 h3EDdxyT47DSZkJcGNn4x2AhTztOGiquXOK62HCP+0bwyVp/SsX/PbAWG1o5AHrS/WeCzG8DVNg
 fHgSoO16ueUysufvCG6QY5xB07f0caJ5xNpTXAe945bK93e44hqkOpvI5A0LWs3MIhm20qVM4i6
 WVHTulDIwIMJS9vy7VMgfT+tcNAxQPYDM5CTQxAEXw8n8NLedr/8PSrFeEYTACA44bO9FXr//e2
 4UEqqLo7+nIXp4Gd6DcuRdF3tk9YNuDrK+yz1gQnNAhmhTRwC49JshpdNIUpuN2iM9RkokLR+82
 u0RiIaQzGm35clw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX0c6zL9JW+E6l
 ZmtxWLH34dpLBKQwXcfrB8FFdnambon/4OxhT8qOjYDK9Tih9Xi9XopRF/urSd97L+liKcYqRSU
 gqVUlMDT3swZGRUFRSea8hWrlVV5wH0=
X-Proofpoint-ORIG-GUID: ECH2-cjsI-q6i34BX8WTRH7bT1KqY2Lz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX1/UfLzB6HqHZ
 EhpnYKCNH2EMu3tpoqmCuF2QgptlzvK6k/w7R864ORLfSfJxC9lO8WkJpr9O+vEB1nhpiEM7HMA
 CPOM4yGK7bcYiXcIB385YjHGAMrXfEaTwZupLdIbmiX4lAK/Zspfg8PC2SJ1BKK/xPJfImvAwfE
 hRM4Dn6bX8zKljWUEK11Gk8wQx/53SAoNAutRAEHPZTnfnSeM5s9FUQTUQHCboYDUYjC8neXYJs
 I9C26Dq5n1VvWe6xWG/HxpW51XbdFmllGArzD6pJq3x/FXdfqgOT9LWLmLn6PCoHM0PrrWoKNfq
 8MKiq5ZStELNX3myEoXm6fjdcqPadx7Q57YtQ1fUv/Bv6NcJLInmr4xr9ygReUqNIeKJTb64REJ
 eL0q1zyO2fCDvsZG57YhSoPlM62VkX1vwJ5FBuy5knVzPpMG2K550TsxDkabLWVKpVvLnr7+Cw/
 XFaGtHyPR/oYB5oX3Tw==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4fe46 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ECH2-cjsI-q6i34BX8WTRH7bT1KqY2Lz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm4450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm4450.c b/drivers/clk/qcom/gcc-sm4450.c
index 4fb4d43e8582..022b87572b16 100644
--- a/drivers/clk/qcom/gcc-sm4450.c
+++ b/drivers/clk/qcom/gcc-sm4450.c
@@ -2823,6 +2823,7 @@ static const struct qcom_cc_desc gcc_sm4450_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm4450_resets),
 	.gdscs = gcc_sm4450_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm4450_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm4450_match_table[] = {

-- 
2.54.0

