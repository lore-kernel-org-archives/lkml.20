Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CC13DC871
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213129; cv=none; b=Wb1OURDurbyAoRlPVyH4UOvEfersQPMzaDytt31NQQ5nwG96nNEZG4r15ANtmXC+8cvBdeExFzmd3TOPNRThY4M7csWl4iDYvLTeJMqbhHrVi/Q4PHnDrRqzFvMAmcNpaYCjS+HXZaUfndZbJilQGVZUwLkK7pfC50tvJb3jZlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213129; c=relaxed/simple;
	bh=3qS4oD30KOIpnI14tS1ndzMw3Vxps/onCRIRJ9iaB5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFgcm2H6Tka3R0OAyRP0mgQ/jIvzXF9oT3Hwi5glTi6hKJHIu0RMz/wqUQ2XUmVs5nuXMosOqhaFKW5RAxxTKp89uuJF0g74TIXC/JTsdXCdZ4CZJcDVaXxo4LRAUq/Kx4ohyf8I3kR1y9C7qmOmtF3E+fJVW4KM2icOjinKP34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/h0ufaw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJ9AwRqa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/h0ufaw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJ9AwRqa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30hWi351030
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HWHYeNhquwj
	AsfGbT3Xl2nQfvQrvIUg9UcIKMj3xIQA=; b=Z/h0ufawb9ZTPX/NIkHL/gOcQtJ
	nzGdDJG2R+iFJl8X17T3ad6BtegsqokA9O/m3u8WlOHcSYaUYWh6NgGMmkY+gQJc
	NRpLtjYA0ZSXuGXU42GOQByolp2YxvIlK+1OCndDRLTZwsQXFFwFtHxI3KPlV92t
	TTRndSwYWU+zQ94NrluBOIBNCnc/rByl3OinjH9XowrNNXNQu6RTZBcDNw7P6SDx
	iI//xG/7MEz0g+KblBN2bgG1h/7R+rCOeVfUIH6Tj0gfWSjgu/3Y9OZF2B1GXD24
	8+gtWfpBm4yy6wsUwdS0U7ZRh5Da31kWExzqWuquKfQ6PO8eEVVwrmKtV6A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc016g958-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:58:46 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so1947781c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792213126; x=1792817926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWHYeNhquwjAsfGbT3Xl2nQfvQrvIUg9UcIKMj3xIQA=;
        b=jJ9AwRqaGahM2HCUQh65+XxH32TS3yENLP+89w9ysHbzolE0PRJJ8ZjgsaLK0s1M/6
         l26bgmstWuYwdcG2llYqfPzAYGJVcuiKjp6M08bYsgtdfV0SoS7qUyoOlvoG0l+Hig+Q
         AK/6IjCnWCeHUHfoFS2P2eR5DDdYzKwwFIPVDiQ8yLf3020vhQx3/zsaX5itFwqDfY1g
         qD69JvuhQBMMsTaT2DvNweS33dJFFjknG2mpubV7jeKFk9pW35c1/AMaGHgaz9okvSRH
         Vhc4SOEObvicCHhRyhiJ4nUDkGi15m20QKvtM00arwrQNWnYPxQaGt/+S+0+3pOmb7ba
         wDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213126; x=1792817926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWHYeNhquwjAsfGbT3Xl2nQfvQrvIUg9UcIKMj3xIQA=;
        b=HHjUbVtjqsuD9oOX+qFPqtavqMsVTVl/jvq+r5Z67RrbF3Jbtdo9rgXoZuRnkY9N+e
         bv2a58TVKafcW960HGNpQk//tvtRpW/m58mqt83D1uOgIOW75TdTMnajCqfdcRhmDaIi
         OBmfcay9Xn0aVab2eRLpmL1ttG/oBJk07ywSNUIEtfNO9xTe6U4pi+iHdeYOamI6B+E/
         NeK6HS6RiCWpRaBjDLUqD4poLGaLgM2Et7K5Dm6Yr97fMpr9U0YzcFZZhg+dCrneNjKC
         aFvRltVnyOh5W3i7jx5NfOSYpeQPE8q6w/kTUqJ+6m6CBEdg44yYheS8glI/OOC/PtGx
         xuHg==
X-Forwarded-Encrypted: i=1; AKwUvBxOXUmbuuUtCBmDsy3qv6QYTYh2UtwfDGA5hQXpb7YlUA1bqIGRIi03IN2Care07JR19zdQIE8YNe/KYtI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLkXCEh2u80C5zOpujZKvlhYW38CJdXomSzqaSwdRzyzAa8LPX
	RmhyL+rNUM3fTntbSpqYf6q/14ggxD/NZmJBH6XLx9X/KMddUPGxSS30hnWm1lrkliQ04LSxulW
	FwJWgqXjttKWI7BjWVlV4UcyRFM9i4gk3iBkEh6spzVwnTDDfusiI312JmH7QO3WTV8Y=
X-Gm-Gg: AYBFou3O6R3mD9pkz8l1OPp11th+dYCyYpOcwJTD9wnZKCwvgLxdSNejIK91cWhehi0
	yV9cQphz4qiiiqOCnya/w4briKAFxJ6kPl6T+eaAZa5ukz56+l78yEBp9+enxojLFMh6VUi7jwh
	el0JcRkN7dFnQxQjQVJSN495HU7EkdNwI/m6f8fJe1ZPNkt5vzVuBpsyMlXdoVM7up/a/KMFJJl
	UpmwTbEZCADvQ9ek8EhXtncclNjWZm+47u2+6/hYXVOoJiKarCUp4pXVakYhe7rNUltPDBkGDWv
	3oEQkspeVLOOSj23UgCFnZf8fDl0Yu0ELRrwAczggwoFARhedCLQUZSAsqcHWpwirQBXLh4aUvU
	ZsGqzPqwC+3Yg6JSW3z+9IEfrYNsXYtXfh7EespFLrsDxCRvWEc61VXlVnZ8=
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr2956084c88.26.1792213125584;
        Fri, 16 Oct 2026 21:58:45 -0700 (PDT)
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr2956041c88.26.1792213125033;
        Fri, 16 Oct 2026 21:58:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm15203817c88.11.2026.10.16.21.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:58:44 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Date: Sat, 17 Oct 2026 12:58:16 +0800
Message-ID: <20261017045817.1506961-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
References: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX7Qf9Gls3Di3z
 tdGxH1vHQZi1qsLRRXYbHJ0rbfM5McJWBWksi8W9yc4eDlgPAPKcwrjc0dGRnBpMKn8ybJfVSjn
 8waILe1KKm+WAlB4cuk45QsOjm7QZ2s=
X-Proofpoint-GUID: dn4GrzO06vnnq6RLxsFL9JXz9vzOM1-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfXwoOdDZUNy5aD
 rq660vdtFGEFfcZXO18Q8JClRzCnnnzVdveysVOWvaHXo4IoXOT627C3IYlIc3k7eKWq0UlJvdL
 fOAmvSVcOmDeSiRTvuvf2Lkb1z8J/ezPChoxAGnFH/t6mRu9z3jPZluJzrelo6rzaJBEq/tZRXe
 Prs6hkf0ozyuNnZLJV39xx9sKDgApMV0G5o7VQsqbnecxqSXAZSGEWxOKHUXSU/w8gurgu3pYar
 NWrvppIUnM5uIv6bYtFZEONve0qBwD2ofmflKdrSz0WA8L1ObMqQxFKdXsLk5d8oj9lXVNaHI/y
 jb+PLr/VSiyGyRyYaLwxXXs8+EDhKnjaPu+b1/nxKCHxP6+wyLOCGkW+RE9X98tWS48y2TrDJSY
 mh52gcxM1lMBmMouITLCHSVCuoPz4LhyYOBriY+pgNMdweOdIZ47MaJYhZ8mWmAHWRBIwyz/Bxr
 RA0g+kUL1/tgroCxgrA==
X-Authority-Analysis: v=2.4 cv=COm/zhrD c=1 sm=1 tr=0 ts=6ad30086 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=PKgm7S4WkqlbYhXdoGMA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: dn4GrzO06vnnq6RLxsFL9JXz9vzOM1-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170019

The video clock controller binding describes three clock inputs for
SM8750: the board XO, the active-only board XO and the 32 kHz sleep
clock. The videocc node instead passes the board XO and
GCC_VIDEO_AHB_CLK, which is not an input of the controller.

Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
clock. No functional change, GCC_VIDEO_AHB_CLK is enabled independently
of this node.

Assisted-by: LLM
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc5760..678e6e167bde 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3338,7 +3338,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sm8750-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&bi_tcxo_div2>,
-				 <&gcc GCC_VIDEO_AHB_CLK>;
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
 			required-opps = <&rpmhpd_opp_low_svs>,
-- 
2.43.0

