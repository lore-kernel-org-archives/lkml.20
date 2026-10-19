Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C8C4E80BD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409174; cv=none; b=lzOZlZ2BByFvAgDDoK7ncNS4e/2JgwVb0Y/+k6IHmweQdKUBmTP80yR6Uoap09j7uPP80p6euljlN8vFYQtU9HYH3W2RoM3VVSnv2etVhBF2TePN/thfpxqV3f+quX+q3+tmlLiXS8LKjrafwBtIUGymgmjrnDzDCphSGRMWSZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409174; c=relaxed/simple;
	bh=/1u112Fp/QaTfq2TFsBWcfozg9TsLnTJMmUIeYDwURA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ikZYhtSxky/cZFtFqS3OjDIXjPsmMi3cz+St3jZMVh2bpKi/5SVXlTPuJQGzctSW08FHVNP9jdHO+cqdiPYXdopxZ1Fb4c3x99X2qAZ0j6WFIo5EEy7bE586ik0ykwZzYWrEb7z0o3VxU6fIyrs3yE/jyjSTea7f11J8iWSCU88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvS3tH42; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtQJ84rs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvS3tH42";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PtQJ84rs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8YgsO2688704
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tii5RYXORarOGXzAnt+Gm5B0QCr3yXhEhRVEbLAopUU=; b=CvS3tH42DqGAO8BI
	Rgd088K/7wWEtXO00Pdw3OQhz+id7l5UcTms0iJUwBKSz2CueFMhT6f5Qp2YqDX+
	wVFk8iKh56t/a+kkjScibD1zNqWAJyVMLRxtVFstOxZpT30a4BAcXsSmQEXNdAI/
	ucPj+TPbkS3Z/mylFblUeowjss/ExtZGLk6VftqOpdiQIE4rUFQ9bDy3ROKDceny
	mMpzzIes4BrkSkZ6CMfPucSjR2TRGokHMjyXzb0nHG0GxNlfj8hN0cDItZyzJR+N
	t9YZS2YnLNU4/W27y7DTyoWRtQ4HteJw3KdINk042JNLocKV6JbZPSrTir7F/ulz
	qQng2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn0mw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:25:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f322ef7d3so322903985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409159; x=1793013959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tii5RYXORarOGXzAnt+Gm5B0QCr3yXhEhRVEbLAopUU=;
        b=PtQJ84rsnRduarOn2l6F70FmOqJz7UnIFjRMH1quk1Grhl2r3zurPg+uiM2oWPnCRd
         QzjgcpOWYkdY2LSxuCX7OwFu1j94XMhP8vYGi5PTjf7yG9jjT5lNGQXU/qYbt/GmVmN4
         n08w9XohAZ3xb0F/Qckr9MAD3nZr+HJhgFDRFKphXqVsqy+f757sFu9wa3JnHIh3QYtU
         6BOD/LrHVcarApuHDpEZ+GujEgtS6GggiR3e9c+2SlPPOwT2akI9feLsjT/+kZLhndRu
         RYBomvawa23xcfYjmi1V/qnrdacjt+BMquJqVMZR3o6oaS9QtnDZQmIeOeKm9FsnITO2
         aTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409159; x=1793013959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tii5RYXORarOGXzAnt+Gm5B0QCr3yXhEhRVEbLAopUU=;
        b=xY8oa5fLEIU30hHNM+4Y7r89purrqcNt1rrCAyDVTYs/EUT2MDlpIhhJvZIOd/SYXr
         RmNOpkbHjmgy56s7fGTfoqGe8+vZww0PBza/Y3U1GoFd5Q9T232anEOpVGdmHvHS/wUW
         t2X1lZ2hYv1cvarJ19Ju+SMgBpS3CKo5+2zRKNUs7KiSIxi8hCHyS5haeUZ+i4nGxmqU
         hR06vW3HGjr6TIGH0Bbf3ZMPxi+otWRBDvSZc5i9Eyjxqgt+1e5COAx0WXwVt7MiO4Lz
         6vj6/QoLwQUVy9FqsFZIqo+xRDO4plkk4EXdkOoVfE3ntY+rcKH/ou4RCIb2SY6yqbZN
         RebA==
X-Forwarded-Encrypted: i=1; AKwUvBxMomeHHUVGb71arxpecp0JgJZQhppgyIcu3B3pKGm9lwbyrSb8TyIS0W3D0Tz8M3t3ASsVtx7dl/CKChY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJw93XujrdwRJfqbzT5Aa1sOL8gtnO6WFT3v9KYvXm8HZW1/Ufg
	gebxlV+D7IAbYCOziIdkLpQLJ2zIWT8I5U1e+XxLNd2cWH0vBhy3evXyTDL1EPk+4Ihz2dYg9Eu
	5t6kMv/ErdpjeMMYUFvrgXIKUXWcUUIMwjlGkCN2tOYIw+wsP0wGxD8NuRzoGuWM7Az0=
X-Gm-Gg: AYBFou2k9/Gw1UXMKlFbCGZbu7jZ3tobmJQnZ9zPJgG9rvO2Q65MMkzMzTxR12F+/pO
	Gi/f8Af3q52Vsy0X56KqF8Ld1UqM6UKsUElJJ0fvlQSVzapiBFsU9jQz3Tw9z/V+aBa3DYg1fVC
	4NAiAL2nCNZglu0AcbfD7c6pOWvoffQJLRwdZgRU2OHVK7UIQToL/TiCPWR36Jtm1Bd02/Sg6Km
	9XX4MuVTrWJG/6Ye/VY1EGlYlUwxgkTCfrA/E49by+2jlp6N7nC8ZuRiJ5dn5mwloJv/IZs+L2u
	uUL42/StVw6uPQ1la7O102pHy4riFO+OzRRJtZGqK2UVA6WCZ70wtbz2XVkNbrZFz+th0ZyEjY5
	XUrPpavkOfPYRXQNSLEL5e2g7JKIGbk1cwCw7Nrg8tO1Skn2ahNOrrKyw7xfMmVVN3SHKH9wFae
	3NbbYPmZYoH4Ho
X-Received: by 2002:a05:620a:46ab:b0:93f:43a4:a48c with SMTP id af79cd13be357-93f43a4a64bmr140650885a.45.1792409158977;
        Mon, 19 Oct 2026 04:25:58 -0700 (PDT)
X-Received: by 2002:a05:620a:46ab:b0:93f:43a4:a48c with SMTP id af79cd13be357-93f43a4a64bmr140647085a.45.1792409158481;
        Mon, 19 Oct 2026 04:25:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab37ba8851sm12807621fa.22.2026.10.19.04.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:25:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:25:41 +0300
Subject: [PATCH v2 5/8] arm64: dts: qcom: pm8150l: add LCDB regulators
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=926;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/1u112Fp/QaTfq2TFsBWcfozg9TsLnTJMmUIeYDwURA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1f46xEAVvhENHT5/cr5eUC0J1Mz7Mv7VIO563
 Lrnc+EFNdyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatX+OgAKCRCLPIo+Aiko
 1UrkCACS72+7BOx9ZN6pTVSh4/cHz0fgq5dzxAulElxL6MTXCmbF238hFdvgoNdU5jtEncQj2Ss
 LIXQ9uOyDDtaw9N/usGH+no2wTcyPDCOo4uF63tPwaqL6it15DOogVtzq+L+8lYnJP2aSaXT0TK
 gYdvgG//oqkXLvJry2SYpNrQ80RmrtbGk5gLa8kA/wCbVnAwQw86P+D1C+QuK+Gt0s72HPfmdg9
 6m3AZY1EAb18yEAkXmK8vTALtOC5KvM7eIubzahCz26PTHU7dE5v5n/B09JcMbEurqn2f5ylspj
 qrHYCo2aLzqptIZDJl64ddZtb1TR5gQwm/ltogPmQ6msJh4D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX1PP59DjXXYmV
 iVgw19+gmA+Maf0jOoolX6C1yssLiXIcLRVP9cwLPSRyyrSvvGMnIJFvhXP7xC1UNTQDT0Q65Xb
 QSZbqdvmqvczOtXNASZQe98Unfsh7ko=
X-Proofpoint-GUID: A1p8gf2zII5gAFKO8W0eDrLLPlzIY5Yh
X-Proofpoint-ORIG-GUID: A1p8gf2zII5gAFKO8W0eDrLLPlzIY5Yh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXxaHu3hqaBT/W
 klDdtjHmVv4dBdOYjMnUruyy1avYgX6e76isTK3irgU3B3WyrI32JeazW/ZdPd0wMpD7tblxPhu
 cC8Nf+u/EPRagWtKstBO6UTq6GxQVfqXe5IPPN3yHtwJCqE+CcAHFqxdbQ+jLqGfHR3b3gOj4ko
 iP3Gyx31FJwxa5zPEcyCWctNMbXm2R1w0Um3uvLxD+yTYrQgLyO9ywDdtBpPMvvOcR1nTbq+E9w
 bEGSkX4Zw4v345Phj2sONVgQ6Vy0wFrc2QlbuT48/bT8fVNgDOHp5p6Cvqyyj/WEm1oPsZDcaE0
 ilSbtMy9rDWRnQD4tzU8tMc+AmxlfmU6P7heHfGvYhZ5xDKIaUVhyLmEAeWK1rJeqHqFOr5bwPP
 s9JRrbLBSyMKK4QgPF8oUklhFpyIWlPg+X/HHKl7moAlrKxdgqVmAXXFoAZf525R18Ol1KbC+Lv
 HcsAd1Vf1NGWKn4xTTg==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad5fe47 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=iSqtJsaWCaQ-tE2kz_kA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190045

Describe the LCDB block providing the LCD bias rails. Leave empty
regulator nodes, forcing board files to provide correct voltage.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8150l.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
index 3911d6d0d2e2..8d2136d165b1 100644
--- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
@@ -141,5 +141,19 @@ pm8150l_wled: leds@d800 {
 
 			status = "disabled";
 		};
+
+		pm8150l_lcdb: regulator@ec00 {
+			compatible = "qcom,pm8150l-lcdb";
+			reg = <0xec00>;
+			interrupts = <0x5 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
+
+			status = "disabled";
+
+			pm8150l_lcdb_ldo: ldo {
+			};
+
+			pm8150l_lcdb_ncp: ncp {
+			};
+		};
 	};
 };

-- 
2.47.3

