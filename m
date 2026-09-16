Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFB24BD79E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552920; cv=none; b=dHQvZF8EVhxT1oq7g1ccEPuQQzCL+YlstbwGJLdqyMBmg0QahgpyT/lH5/ur4gQrMH8ER0gBdKI2weqwlLBcgDK+xt/Q9ZArrPsyussoKd4BmX3bf5vg5zVh0uyFLSN4myaAjMPBIya/vz4b0AdXokpeZJM0mx0dSGbU2ReWZiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552920; c=relaxed/simple;
	bh=je47a7jlI+rI7fvwiJQVwy1hQYEmz88kJyW5vpEN1rk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rbGZZR+a12LDh9nMnNaHHIB/B+2V/pX0lfy+wkuONWIufwBO8tXtQlaFGjvO24ZKRf7wcANbTX8WKZ+Dg8OMj4JinC3UDXTZEV7o7gtJ/50YVDLvbQCZnI798qtr8TWlLRZd1Um785bu5N5KZwOVtmC8PcuP0+HwuGDGiKoQsJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXS6SVX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cr82jEo4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXS6SVX8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cr82jEo4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92sNd1552955
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7//tLcxJPqzMOHfjhQ7X/f
	v4TViekpIWdxqhuUu2YIM=; b=eXS6SVX8j1hoDSzpD4T3eejGBQFcuXUHbA5hae
	IAU0WUGZboVJsO8kpw/Ia9UKhHrgWziEYkaxsIyqpt8JQNheBdjxzeGgwO0tqz66
	K7i9zmGq+GDCf5KUQUODEjBpU9m91inzLfT/f7VlKtMn0bv620s/Oeu5vBlh+rYb
	nVhJc43DRDKP/bGWbbkuR9IiP2I0BpK70Q3LkmIr4Cp+abqgM3/cSfZG/dg9k6PG
	QJXHMSdpkJz4tpJaC+C5iSmMbMfSw86lulQKfyuH11+shRadSkQba1OCmnyc5xoW
	nL6S9eIESLYqvdTJOCyOQG6L3qCxqiKK8nOZQmxSJ89dAodw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n6411q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:01:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-791463ed29dso4654053137.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789552901; x=1790157701; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7//tLcxJPqzMOHfjhQ7X/fv4TViekpIWdxqhuUu2YIM=;
        b=cr82jEo4UlInRBEqvVnXLgohWyb6vlGVQ27kim41exQi8QsWhbPnQF4yOtE12urdNd
         zuleNc/xsP8wjMSjhNGK9ioKr3EeBYRmEr6cS38QVHNup3Yhs7QzG32zk9bpX7Uc+OP7
         Z3IDWUt3kXm3BPZfScFglNDxnKv+F8XFFYv8ZANmdWXwkOXZXHkJchqLi3xnKw7aVBHE
         LYbxXfESgZLyLDVdItDQO/dGuGYRi5Bg3K3wD5yiAW+EVSM2ipdm7pWE7iKZQwNUASbU
         Q5kLc+Sw8TBcdUxe84IF0HnwlkW1Bri4JRTYv8fduYcWis5tQfNV/0T90NRMGYRC4br8
         k5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789552901; x=1790157701;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7//tLcxJPqzMOHfjhQ7X/fv4TViekpIWdxqhuUu2YIM=;
        b=VjGN4AUqcVWD26YU5o6kQC85Lt8iGPLYnDRdcFsnGxP2IOUBmdfUAK05Nirx0JXPaW
         mg7gQ484FVB/6RNJli4Td9/J35QYFyTbPEcX8nU+vW/5y7hGjzJa7u4BQJSSNib89SCZ
         iU5Y1fZ9E2dryhKkLReraZqn2Qg9w4mgUKxglbyBdMDUZ9Odwc0589BNb7oNKBdnVTbO
         olahqaN8ZMRnys/oMvXvaniqqjFvxp3chsIm0x6e3VrllIgueIhw7d8fkBqdo3/NtJKH
         a400At3nsje7eGBprifLjbNZs94Pmqm3fFP4gyJs/ZKklB1in6CXAySMdY7Z29r5Td7i
         me6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzizuqKlxTJBcNtlonoOo0EORmbyjCyP2e09SFHA+sKWGcGZZ+aFmzzaVVJQyp1uACOmM7QAKKAagoToso=@vger.kernel.org
X-Gm-Message-State: AFuF++kN7Ykx+9dd2r0tWVVSfP/Lb/gJ9ZNaPvAPqIfcUty/fJI2nsxQ
	UcVz8yjAmrEabNemugRrKmMF9is87CQtrs0U1WrKxIrzNF+vMO6isVg1s/K4SlHWkyLgUcpnMkn
	Zc/7uPuE+4r2exw6gCdjxgi0iSrerI3J3HS6EHtpR8IHh+dE39ttLK3nSJ2ltckf43+w=
X-Gm-Gg: AYBFou2i7QXlHyEJra1h+7vxGSbf0f3rf5zUv/lGOhMPosRHlZT/Ve1YS70PEL+Sf5u
	VfeQtTvmKlq153UKPPe6N9/fIDxjKb3q8x1s0hGXI0MLN+lnHgYqHABPtPHcd1ehvgqpsj2tU/H
	BgknEOtaDphstyhwsbBpzmRnSTploqY6nnFnUe9VfA3L1o6Ywb2f1X59cn36ehbaPuIixisjRhL
	9HmG9PCSfUtC7vzdo61SyVbGZbSVJkuLXuE5+ohUu0L8LNHl2CmtYhXaUNpvSRZcpSpfpk2GYnV
	BdW3f70JeUf2yXnsRxnzPs3UOkHHDgAlXF1iQk299sdALJ9roMo6ZQnFEuw/jJIh3J1ptwZCR0w
	8wSs9hlEk
X-Received: by 2002:a05:6102:5792:b0:7a1:83fe:45e7 with SMTP id ada2fe7eead31-7a183fe6278mr153262137.8.1789552900869;
        Wed, 16 Sep 2026 03:01:40 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:7a1:83fe:45e7 with SMTP id ada2fe7eead31-7a183fe6278mr153117137.8.1789552900350;
        Wed, 16 Sep 2026 03:01:40 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83fc3da0sm47619595e9.1.2026.09.16.03.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:01:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:01:36 +0300
Subject: [PATCH] clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP9oqmoC/yWNywrCMBBFf6XM2oFmSCP1V8RFnU5ifCQ104pQ+
 u9G3d0Dl3NWUClRFA7NCkVeUWNOFcyuAb4MKQjGsTJQS67tjUO+3/DJ+YGBuQ51pkMf38jTooo
 hZcbsvcqMtCdnzWB7MhaqbypSj7/W8fRnXc5X4fkbgG37AEEaKCKNAAAA
X-Change-ID: 20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-272641a49214
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=je47a7jlI+rI7fvwiJQVwy1hQYEmz88kJyW5vpEN1rk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqmkBc29bWbeMaLLzvmUQvZvX+R+TQNXE/AofO
 ZWj43HEwwaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqppAQAKCRAbX0TJAJUV
 VsTcD/4gC9RoYkQnsB5Wslf8Gh+Pdnp6rRUlUthBWvvtn8gRpL2U1Du5NfQUryvP4XdgO6BHPnj
 vllwVAxM3c3XPmXwJVDQDwEHj/LWXqhACs/6Zwrc+rd9uWBY4RkP0das2qIJxvGMsUmEpOf/5d/
 z/9O7gcrYLFmVlEL1bvYZ/BBM1uoNKqhZ/8CQcS4A3tsGHXBAaR3WJtBCDTXfG2OjKGjdSJ/6qP
 aUlu1CHvucwRXf3Q6uYFIf6Omg8malhCW3S8qPzthWYSJcppfjfEvNF6C9/vz8Ert1YVGSAYIE7
 ljrlH8Tz0QYjdnKra+PNKPIgTANGUGkDIFEcdSRWxYX8c1LpY3tv4TnZ+EUusRz5VVEgfAPenuM
 hrcFkpbTH0IfdO9FT14vzp5EsIJmHjHzbPKvrjz5UoeD8n6qmtgcGNkTMO0LvkrVbcgP03Y3uV4
 r4hyH7eMcCKZQQ89RbXhroZ1b/94xrCbP4tEwwRRXplLc6XlxWIS4iQYf2U0QdPO9VcR2CO7RpY
 lY8bXDc18/6U+qlXRNtseoFhLeSAAVj3s6s6vAIbMjeU9SJnHIh8tfHCeC9QxOlZsEQKnnbjhnr
 uYj/c/nFMJBajJzV5xnf2r9n7v28IzaAdC1WJcfvbJWKNpl0ouFOqp0nxoyAuX8/MGREcnVb8Jr
 OJJh62UToivj/eg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa6905 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uLPiVhPF6TeGUxki5eMA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzMCBTYWx0ZWRfX96qmIKGXCj9e
 UewpRoWKpIHOUPOXhQt6f/fuPiYLcPdwJYXGjOQ/9s+/E2WeThzEVu4cyYt6H+LXVNfrdMbfo87
 M0wBHR/7Gz/ykqG6hlilBuFq9K34s3onE7DLTGeweySad2XBZItEMY6fegKlCvTWS6AXxxtEA5E
 Oy4qtsJxBNASAegUVGSnmYh+gknBqgXLMS+KdN/C8B7rpMmUdjDuaNrSaL9bdKcef6f7Wwgq3DI
 oF/aq6SD+jekN5z+KU/E9pnKcleRu16jmYCC/7dWEDkK9V2GyQVXs7KZ9SfnN70oz46FJx8RCju
 424jzAHptdHePXjBC9WoDM9CbrnB91VjOGwsJLy9wV0US+T8wND79mPgT6yFy6FmA10VZZTniF2
 Q71QWDKRcOT0MxQmADOYGvKF99ez/CoEaOIGzkxPzaSnGihlW9GNh6EGpjbp2ztYUFjA350lGuK
 KPRlVnGxuVu/sVCZ+4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzMCBTYWx0ZWRfX63759sBIEQFo
 M2SLSaVh6ym20y4RKKENo1PIZuzPD/6vlaZ8NyTL0dVsbIPPJACbG8Zz5LTphpo2DTjLbqEhEB8
 UEDRXX0SHgXa3hHo3n6P80fAR3cFDOI=
X-Proofpoint-GUID: oBrsthLjMvbrCzT0hSfb0I3x3XELKqvb
X-Proofpoint-ORIG-GUID: oBrsthLjMvbrCzT0hSfb0I3x3XELKqvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160130

According to the documentation, the offset GCC_CPUSS_GNOC_CBCR is 0x48004.
Drop the extra zero, otherwise we land outside of regmap range.

Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 57f8c80c6f32..1a6a1e74e805 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2999,7 +2999,7 @@ static int gcc_qcs615_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0xb004); /* GCC_VIDEO_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0xb040); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x480040); /* GCC_CPUSS_GNOC_CLK */
+	qcom_branch_set_clk_en(regmap, 0x48004); /* GCC_CPUSS_GNOC_CLK */
 
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
 				       ARRAY_SIZE(gcc_dfs_clocks));

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-272641a49214

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

