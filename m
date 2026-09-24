Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BA5481649
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246467; cv=none; b=CyUecXCqvD7rOVNH6fE023sP3j26vztqEHTBB00n83zGczTDZPX7FDO1PBg4Cx1HcbWfZ53ExoqwHlxxsCQDX6iMFFi0TAisJZwYccjNeIlZzhq/fhF9Cu4IC39peyJpxQrOFOVyhQ0S6phoi++XDDQBcIhuYjNVpsqopnUf7Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246467; c=relaxed/simple;
	bh=OdvW2kO+ne2V0AbTspE+dP+nW/7OB67iT9aRxVfr6dU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YU04JQVGrYq7zW8cJWB7hqHibO3DfZEE5t5T871Kxu7lx2QsA1g0a7SwtYHOVacp5lIDj/6RkVUwmrZZntp5Ms2mEZSzfXn1uBHV0VN/mEmJa8f/Ch4zPkQGxqkC2PMZ4+XCqjUZlT9mMFZZXDFDNo/tqopltCgnqVSX/v47QG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmyyiZwP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8syrnZK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmyyiZwP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8syrnZK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9OvFv1063444
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A95+MKNcb5gyk8D26qBLLalNkTa5JC36cRtvGtEX0H4=; b=CmyyiZwP2gxwl045
	B1ysrsWyCr30D02lIHs6YidS7jfY9PgWiBBXH6tI+Y9S82H9pvozfvKTM2hbkgI/
	IHkFwnEkuQOU478feIZgb4OFH3drwbaPrItIHz8AHzD39az3zvKkOAKXaVclcQJU
	mAA/a0rTF3vXA4JeAkAO/+vBfgiHgnMohHfCazWk/GfwePhVFbeYY/mB0HqOX4X0
	JAYR1Di186cgC83+2hH+UFX0aGS9tS9O4AuDEQekh+TxxiVDbJwWQ2s3buZ9ZjT9
	A9Fe0oHyyy+xCniRi9XMkbpFVrr4c70tgQ8feAIxK2nDnjtyxYUzDHhqkNMpSrTU
	wZISig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh9hsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0c7126e7so308584485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246464; x=1790851264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A95+MKNcb5gyk8D26qBLLalNkTa5JC36cRtvGtEX0H4=;
        b=d8syrnZKny9zzm8JERwin/HdLPUOhH5pFV9V3Ulm3+YlMKn8D50CBhto0DnP18vNe2
         mWWX79RAC7Tn77PD6HhAGueCHDAcTyhOOwkZVBwO39WOR4B8xDmFHRO0fuU4zbGQxhiR
         biEAxx4ge8tAMdGmMc0iMVuBJOYTgj4XRx3lqKbiG6GKgaVkuGu1bdArByqGnBkCuuAZ
         UFhMtidJelHxc0AR29Ip6lWJbJMUOeJ/+eq+oCIVcxTCLUJKOdpDwmE30L8nXGX7EXaE
         4iSCWprzQXmNVq/OVCGwZ3qIP7jJ9B2Knc2ZZMcn/6zbK6ojl6ojyde4mqw8SAGSR81Y
         1S3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246464; x=1790851264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A95+MKNcb5gyk8D26qBLLalNkTa5JC36cRtvGtEX0H4=;
        b=KjMV3AqwZgZrFddascZhKl1KK/VAAzUjrYnAygYbipVYYQvLzkiaKRHnDfc07S4fLD
         GuzTZcQKAQSCDl4ZZR0RGuqCiDQYfkOcVDN1gnD9tJxzG8v/X776E1CdOMfPRjePIIfD
         dLu2uH/UT7p2dUyGnNS2JkKZSC8qzrUB0bMX9cIZ4d/XrLXtmeK8/ONHhhXuXTH6gcyY
         6Z0BpyYtQbUOaz0i8VIw3LgHO8LjpSmksiwBfg6lV+Bb9BmLPMD8lRKbuJb4QuLgcOkO
         Ape89MunAIySx4WvnZCHMyrM9w7GbuQiu/ht218n2Ih8B28mqmkikMZlufV8gLOTSSHY
         zhTg==
X-Forwarded-Encrypted: i=1; AKwUvBzaLC43HqESh16uIXpmBwUAwD/FJ6WEXYozexw67WwbNVH/ool0nA5wKxMUig62UGKZGE0irPj6fbdHI44=@vger.kernel.org
X-Gm-Message-State: AFuF++m/zA3z/5JOovnrZnOlThItvh7elTrWwafQNsfJ2ngt9cwvshd7
	gtNWTDxtuaQo2fMS76Tb4RXrzO6KaF25ahkIVOY/ASoBbxNuh5MnLAuLf+gd69Vg4JfOfs91LD2
	JjSYjQ7kPqIsSMpIBMqaiYbJXMZB5L4YqWLP6Jw85sNdJIksSbvf3lsKNTmcppvP/vqA=
X-Gm-Gg: AYBFou1tYpDrKJFCZ21+p+jn/okHaUPyoeul83VFSidj0s1JoO4RKKjsbehAXMxB4QN
	vyLE91fJVN+Wo8pbOkYlM7OMLZHTaFDZima7qUWv3DLwLtv2dVvq/vSSr8KBYsfILdxYM7BvK+i
	+F2pH756onWanCXbF3UV0ucd3gDRWLh57suqO1ErQEi3qM3psZj7ZAfhQii+cF4P4cFFgvPbx2K
	oIUkhiKLoVXjDGh27eoqFPJgZ5jEyTKYoHQ4aSHsEM4yajMPDWBfZUHCB/RugoqKrgi3xIH2i7l
	UMOiskRk/Lk+hRxV48KvAV9nqSGeuUK08LeZnpKMzja2BmKvEFXcLwwLsDxekpT7X+9w6beNIAw
	g2Wg62L7X
X-Received: by 2002:a05:620a:4002:b0:93b:d7a3:45d5 with SMTP id af79cd13be357-93c36403fe8mr214272785a.62.1790246463824;
        Thu, 24 Sep 2026 03:41:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:93b:d7a3:45d5 with SMTP id af79cd13be357-93c36403fe8mr214266985a.62.1790246463268;
        Thu, 24 Sep 2026 03:41:03 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:35 +0300
Subject: [PATCH v5 19/42] clk: qcom: gcc-sc7280: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-19-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=820;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=OdvW2kO+ne2V0AbTspE+dP+nW/7OB67iT9aRxVfr6dU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3sTPGtNR0rCxG+BfDjSV2lH0vCQreilbQdC
 01lxOuk/12JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT97AAKCRAbX0TJAJUV
 VsBED/9kH60c5lYnlYeuyGI/7ep3n+JitG8nDqe2dBjyVRxfFApC/6+Fq041Mi54QIfM040cpVO
 lFYhHGmpdo/l473+oYmyfLNU/UU0+ljCD2PK08q+xbi7oz2VTXooEWLAykxkKGfdk0UOunlZxGd
 Jyqc7e+URxe7JPJfciJinLDEoU5WbJ1Er/wdKYJ0ZkCQXj0Oynh1j9htYZohldaP08jErA1v6cx
 wWKm2P/2vW5rrsbRJ3ZN8f28V1PxoOVY2jpG1M4xyrUUlGb4rm9MtwdBc8dHeJWBLkK4iQLaEU7
 Xk7EW09r3xY3+uEuqVwkf7dAWzGci7T0rC1LQL/KhdUwj3QjkMfJcUvW8m2Q1YDG9x5ANpIhr9m
 llFu7DsBOepwoc59oq/yPVmNf1XlC6MloHzd4TV7uzyCPSzKeDmPER8PF4sWaLp6VWbXkPwH78L
 sr9r4S9M9yFgeOrNRQJgzN7wA/RRuK1Qalw8cAZSlX2kv2jBHfx42PcydxXm1rHWPoeNLLbfC0r
 7dYRGLp8rDuE7Uww3GwbFLb0eEiVkKnNk4UWjBQ25rV9hC+3Me1EOkwgjjqevFBEwThOSOCmcyG
 mM9aQRGiNSBWtyUJsCzHKmxvUhPZOo3084IkeKGrFFcuGwyqJOQ0S5wBV6NG3PpdUoPUz/8zy2O
 dUVlkKoElILj+EA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4fe40 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8JcInTB0O7GSQ8pEFMkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: iZF_KC8FbR-zB5PawDCwUTI6pZcl4VPW
X-Proofpoint-ORIG-GUID: iZF_KC8FbR-zB5PawDCwUTI6pZcl4VPW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX/TYReNTdkbp8
 Fpq4ncEwLgZZtG5I6uofwkmo7NkQ+4T+nRweSy7w+eYtEQMPePnzPjO05driOPEKx26uz63UdOw
 UJiA+n8v/+W3N2HGamwH0Lxr6k4Iw/s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXzz1Y+5zVQ4/K
 MHMnX2kuKA5wB+SpuIl1dDAhWZbt2GlPYcVPBCABoVXsosgGHoOvkyygrfu1B1SagSI7c2xoxf9
 cANNuQpFd4+wiuZ6RhxkE/YuVv0Rc5tonOw8xE1p4wpueo13WFd8dE0KWhwKegHUeBlGiNChW4O
 nf7wJCXKNEpXSUkycjeb3COoMQk+dXGl+ZJrdE1Fxk3cHTcqfKHM/ICAT+WBpIQfr4IxvaRhO9i
 QLFss8uk5E0br6kL1WI9+lUtietiqzuUgplp0rU0pA3rxt0KD+9nPsOV8ZSq6n1+Z+A4Nr+c6E7
 fKMKtgJYKx2Yc7ZXenfEhefHmGj7BDgaIRsS5ZZEszQtAtwW4kc10RHn+aELhLQKwVNM1pPHMhi
 ju6qeKjRFRquSP//0DOQORFMYbQTeluj2SA7XcFEnVjOFvG0zj3+gGr4ra2rz3YR9wAfVFXrYxC
 AAAcTVjc2IdbzSJfc+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc7280.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index e1fe64463de6..45fcfa7600d0 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3446,6 +3446,7 @@ static const struct qcom_cc_desc gcc_sc7280_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sc7280_resets),
 	.gdscs = gcc_sc7280_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sc7280_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sc7280_match_table[] = {

-- 
2.54.0

