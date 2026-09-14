Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C5848BD46
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390192; cv=none; b=joucPlrvRsD4LT4xHW9OJbYj+Qzksuyz5kEq1HcaBbPoM4Bpa6TSP6ZSvO69LmmVaJrtDnCJpBgdGPRE9dxgP8w5waRhNNZsitJMrgeh/HxV5H1CObwwpyYeHiu/bEsoOPmerCUokWYq2tL4u8SX5jM5Zt4uLwc0fnPYU70RnFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390192; c=relaxed/simple;
	bh=J3cJXeqkpzPuChDPXrn+lkJzJi5dz+bjrFNmd1ysHGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sti6r7cJdUUKYL/LPwjCQRWb/dbWIkWXrbzsKww4nlraD5BzZy228K7OZbkN0WUo3qQsWlbWVT1D3A6A0bISEJ0vhpFpGIA1pMLnh/aonuPXJ0arGdQ6bx65OAk+MR09sV9/SL4LjmVRhxhYd736uZvtDmF+HvLtKUCW16wXrdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hm+ihp5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJB1ZgzD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hm+ihp5Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJB1ZgzD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8qR530996
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yt2YiIUjcxmeRABevTH/O6DTGv9FfCisumDHE585x4U=; b=hm+ihp5YLoj/5hca
	rqwVYi0uLQmYL67nD4AucTYfaONHn7ZG/5PaykQGEblkRAseIdFii8PbvywUFTxH
	stSPqr73QAqsJRXjrR38Kfm6fu3TEp82NVwFtpGVc4GIm7ICNQ4AKqP3TT3N8+kR
	zfcOo0OM8RkUCd3VVwMkTBo9dNQ+oloayZ+R3nKH4mqw+1cJKZIay3zqqToE6sGJ
	Ee3rYHLLOycjq2XtTwyJY6GIlKPbmhCIl+4qX/mSx030SusDsELfejgxa8A/1cpT
	1DG15hpWno745YfIR//pCVB2d0b+5YUgKu1niRwEGyZbRXecniH2VVO0FDP88HGk
	5QWskg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstfse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:49 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-790de8f0cecso637555137.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390189; x=1789994989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yt2YiIUjcxmeRABevTH/O6DTGv9FfCisumDHE585x4U=;
        b=hJB1ZgzDSOrkI2BWlk9kuh6YCVKBvsxRf8Bi9/Rt1daVcngaS97+OvdUlzCGQTTalw
         LtpVOvnAAOV6CNLLPUEOzQP5ID64Mu76JkMzOqC1EdNrH12t4dGeSnep2t9CjY51aYED
         wjpJpXhrOD2287LKMyN2R9u/03rOK7sz1W58HgFTWWFcYlb9c7fQEwR6ZIEzFxhfUWY4
         L7Cm2Z5ylM9bCOLQcpsAic9cKsxyRo1ei3SdscgRDYVnogiVsW7R3OdN6KVKj3ndU3Sd
         cS6WP5IhPqLupsGXuXB6a1ABSrwcuHZy6Re/nIw+/FigGK3VqgLfCEXju1euHDNlo+sK
         WEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390189; x=1789994989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yt2YiIUjcxmeRABevTH/O6DTGv9FfCisumDHE585x4U=;
        b=HykGwv3Ai2kNJHJIYME9Bo7OM667f80W6aFSbgn/nqJM78pAx/as84vdRNO92MmyxT
         E/A+BE6mp3ffQaVSEqc8h5ydXs4IJbt6VnpEpl8fi526PU3iMPehDgrt4m5oiWPbBLIJ
         cAasvjupq4OGL0cKRdas4WCAZ9QnxEZiuDFWKref+bPiUBKHxAaP5HvEhGfhcIAje+Hh
         UONmZMm6uYzS87rj1ATfTirtzvIxVL9TwBZK16t1EQZaj73Rts6azG73hzuitL1h9D+N
         HVmxwk5MCi5sUJkUqFaDJGpgmReIE/AZ4ZWDLlFF4XU3z33gqLdePOFQYJkWC0CgN1zv
         qABA==
X-Forwarded-Encrypted: i=1; AKwUvBzMmOuzvzOYE5WORYmOFRnhHb5Q4STHMKD3KoZST7rJa/Moa0jPOs27wj7Ad8QHIrMf0SVuZzANprYWWh8=@vger.kernel.org
X-Gm-Message-State: AFuF++kirjWY5kzih0xgOhPuejNBAFR2jn+hDit+vJVGmrQxYypDZHVD
	fzroQ4MCgGUlYAGAa4b3wMrtL1pNwDeMpmOD1lGFRNVQWsGj8zOdc/i0/bhjjhug1jzz/5LQAq+
	sumX97yqTx7OYXYyiiHEO0ErH0AOdBhB9PWDqEHeWFYUCIrlKDUYgS/c4Q1hDw9h9f2A=
X-Gm-Gg: AYBFou3xwL+49IKOEEQMfBkn6Rv4yR+6uK4sLc9u/KmxLQLaIPyywyzVSYBXx1h0UUI
	FPBdh3fmLJXUGfHqjSEaMSas7IXsAC8RUUrf6ouRJ7AQByGXFZmiBYUxyNlVoS84Pf86zPDJp/W
	DofKgt6mObGk3WabgK3p82YNhBwviSFefGpO9s1hYcc0J4Et31Ya9a/dsx7wKwM3Kaoeo+FYcRE
	4v3zLASSvaJIlIkqOplpO5qs9gOJijfTabh//8nRwYtktvBPFfdYTOF/XfQamwVkBdugnXhB3XE
	ZArb2LfhV0ZWOd8m7hNRKTfb17dYwvYqqbEcSUCcxuA1jydzqw5Gioe2GKGB1Ietc5e4OhZczot
	DlcTx3VqL
X-Received: by 2002:a05:6102:864c:20b0:79b:a93c:145 with SMTP id ada2fe7eead31-79ba93c04a9mr940356137.10.1789390188866;
        Mon, 14 Sep 2026 05:49:48 -0700 (PDT)
X-Received: by 2002:a05:6102:864c:20b0:79b:a93c:145 with SMTP id ada2fe7eead31-79ba93c04a9mr940317137.10.1789390188248;
        Mon, 14 Sep 2026 05:49:48 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:39 +0300
Subject: [PATCH v4 40/52] arm64: dts: qcom: sar2130p: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-40-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=974;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=J3cJXeqkpzPuChDPXrn+lkJzJi5dz+bjrFNmd1ysHGw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zyj8btO0HBM8VIehJjngivXyJMoOj+61gH+
 X+244+6RvGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs8gAKCRAbX0TJAJUV
 Vpl/EAC/bIibMxnZHWWjqFtBD9usJHYqXl3gC/VAhlsvSAZPmyDyqCKYX3hPZii/4w+KyJmFsdX
 m51i07mqsP9L/XY2nt0SOxZ4xDaY9a1neLQN1Tk9nny+XZqfflg9As9Ik7Xd0IGs7boWT5MTbNp
 Lhd0v30JhuhePWfTzPpjh+OmVOSn56iMijhXNme3DnBtxPOx/ujpgt+RCVHIBiVhN2CgzxHGvj8
 wKUHeU7pW4XwP2r83rO/fve3mF72VDEfjMDJVFtHQiHmZNSj+TPDDXv5gccIT29AV15Wuc6Uy/d
 VuJffo/OK6VhLsVPpv/1NMYBHbTv5c/c80pmm1yJa7xznzlD7nklzQch5GpxqrQG/O0GDNyFjVV
 OS+aE7XtMeqE+8mJg97/G3aqV+ns9OQujXfqCxCzNOKMFCC2a2u0w1CQQZ0CgnEkcNmdAF/gyE6
 g1L3rXDnAcU33FlLPPcyZh+tqvj16A28JimgwqW8qCaKIbIK9T4WxgiqVmtg0uLVqUBdt6mC+E+
 tTqwly2Coik1N48wYW4plhaJtnR9Em0ao2CsHqByLteJ6UUT7JJhUmNgn+Jzr1e5F36hM3PFtOr
 WnVAFnx0po4ixdYYEqptMPSswAQgtQ59OAF4lRjb6iGoriX4ji7+kkgzY1ghnL1wSV3WzFQ/GXy
 /bulBhBera07mTA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXwmSC7vP4zQN9
 1Dp/SlEgcr8iOpzgsjZx0GikYIW7cgzrQvBbnjds67UF28wwqeTBI5FkKlp5o+S0v/aqKiEc/zG
 x3gVuAX3Ali0583YEWA685eR9YspGCA61zx+pBhD2yKVInODh0UEjHBhT4vEsy5U2U4RZVJtOVw
 P0ZijsfwqU1Dmpg7c9cOMk0OcW6tYm9q12zxl2R/qw9z1kTYzF/uTMRWu8v3o8rbI/fFh4s0QT6
 D055mUrkTxYkb/QIaEdRgeaywI1PtvVwtb7X1HeDqGVWTkfmB3Q/GWfC7hFJWWX6v8ejTuXGGOd
 srFR/SBANmuV56oz6318COwObvljRU93iGC7oucszHBPnl5k1GNhPyLLsnK/1/vunVGRGG+nZDB
 +X1j+nItjsSgBwbWgkdkFmHvCbPOUyWfDyhKITAz+ubv68KobG4kGD3B0DlyfF8v1rDpWWLwLiQ
 Hh9tUC5/FvxIEpvoT0w==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7ed6d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: RUiK2T5vuiTvs57BGuiAiI37skq--6j8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXzUfcwZ98r8bV
 lx0VPB3WyJVeq5C6hoC8VI2PQs5RdHi751/sDQ6QVvGFd2msI/NEcppU8k44zzR83zV0Kc58f7t
 IcHefMgnvgatuNabCP78brEEkG1irr0=
X-Proofpoint-ORIG-GUID: RUiK2T5vuiTvs57BGuiAiI37skq--6j8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SAR2130P are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index 2ecead79806c..ceeb9c47093e 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -474,6 +474,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <&pcie0_phy>,

-- 
2.54.0

