Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510BA49EC47
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047028; cv=none; b=RDjPTyJxzLpBU4EBT4/JJq5mrYTWK+3AB31efaX4BRUL7/80hc90L3JodyCnRqXXzW29fyBejRP7I3zeUsCdJiZagJZA2+Wml00XU6OXCGLql7+8D8vSGorjPeksA3NbcB36Z9OS0/pAwFcwYtX/vJFas7S+IYC0an2TcYvvN5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047028; c=relaxed/simple;
	bh=CXfwjCEmlTi2gFNzojVj9OvmB0X6o16y8nsd8vTgXLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QPzaGKugna1Ob0qg7ci6zAHaddJi7U3UyhrvVZ8HtXeEGFBcmnHDK5Jg2SlKuFTHSiMz/nIk1nHbI4SVTnoM05oGItLopISh2d7D9expWl+dWaMSD0hk4Xazarc2nHZinnAwAPud5/V1lm9P+b+uQTL5HCebh44F4PGawmWHbck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzKyyJ/w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkLhGCIH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzKyyJ/w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BkLhGCIH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7dYa383434
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzbjLgLOtqrKkzbwT3kWbG2jnIc6kGhA4/pYWT1q6fY=; b=dzKyyJ/wtb+kIgW1
	qJf9g5pSgkAug2gCJdVOEbJiqCQ3odLzYH8XeLqNv9wZ16I9kDnxXTUAcSIlsMs4
	SPdti4IrI91MU5tc21KGwWG8INUZL5A4W0WwH6CCFV4Ktkgs+QcOLPwfhjxF/C2d
	/ZnwLdu+GV7EjpFWwuuvuXLA0hcgw1U443liAnurCsQff1/JK5PB+y0SgsjYQFN6
	I/zThTyUrocZ4Zi0SvuALnQjMHiFggcCdkQshpKIIc6A/XVzhU8ftPrANiz6QwGU
	Ht1yLxNV0V5i+iQzUE8we6K02r4n6HSTvyZ/5/z64CAeFEVjWNVm+tbdh7i1y/rT
	7TG8tQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydv05b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-395543dc382so3469214a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047026; x=1789651826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MzbjLgLOtqrKkzbwT3kWbG2jnIc6kGhA4/pYWT1q6fY=;
        b=BkLhGCIHm0WV0XYkDMxDNhMHOPyC1iIVnKOuLOmSGJIx3hU59To6/bNDalKPes6Yly
         7njiQLoHsT9Xe7GZt0uXvbsknucIHVja2r5AsmWWV/mh8VfGZpSJT/Y0pXAxQ+JfvneO
         S4juT/wzQ3qHwOvmEZKqzy50otTZkdQlY3i0iOS+fUMfq5MIKXBXIlhOQLbPB5pIgF8Y
         w9637AdUfUa1DgpW8DvnjIy6uXJG7cu0A6cQjDWlmh2PCeXM1uJdFMndo7+vvU0NHTZB
         qmF/2mattPE94ncQu/Y95jOlWs9uUMrko/MXE2csRWADH5B/bMSTfSHCW8TEGlzNfJrG
         FQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047026; x=1789651826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzbjLgLOtqrKkzbwT3kWbG2jnIc6kGhA4/pYWT1q6fY=;
        b=Hq2dR7+rVlUS8yJAVe1vxjnBUOYCyI48Idfzp0/v59bRckysAhLr3sFGo0r0o4nKP4
         gnUbwMjPF12fRV7YFZetFhAXKM+nRrP4q1NnjAnY7am5SNyrtW8qjZ1DteqT1qK2kc6z
         SaNUw76ASI/zqODSMH0GYMLN5BZxIjuN0QCkVDHFRxIucrPlW85ci8cJib+eVBXtJEBk
         u3ZwDZ2oDlmCeT+2F7ghv14o0pjVHsQT+bl6gxrXthULdWK50rKv6CkLa5bPTeC+hIj6
         4FfMAnYSyNqxLjM0wIUwMsrceDEh7m0aPxQ8EUYJnCKsVE1J1jNrIomDWmW4ehgU9BDw
         XQQA==
X-Forwarded-Encrypted: i=1; AKwUvBxVspOfITjcnEjkY976hxVNbdIweYrPrj+lSrK5QXb8TuD3FvloOuSoje45ZPpkT5E602P2gTDwp+SIW+4=@vger.kernel.org
X-Gm-Message-State: AFuF++mOd6fK8faVixCPtZCFePC2FF2lZvJZx9tO6x7oqL2CNG51RSoK
	5nYSK7jENepGE2wqha1O6deO6rscf+yWBs+t6k8H3ycnRFWi/RGsZVWOXu0Lzut4c/BLb/dKKjD
	BbEzeqxzag6/lb1k3l52bVGmAQ8n0RpPjoy4CUuND0NwnIwUPuLWtxBUmirK2SdHfdSI=
X-Gm-Gg: AYBFou11WoeA9cftigtcot+OMubbd4HwU/mIYsDqgxoZ83wzSc84fIUjaCN1MA0nXF3
	3uU9gALp1GVViFw/RG+nG0pmyu3TzHCNExlXQaOV+jQOtGr1ukEQ4hnwH1E0J6fM27Pn6+05eEk
	iSNtYWSbES2nfyv21PxMupiIhMQib5Ti+BAB0iu5VGy/20rn0f9VegyO53SdY3Lsd1r5lyverrA
	b0EdaS15NpiaJpxzckmdtAH6B4NSA24h8kPWDEE+VVQuXJ/MdnwY2l6KwfknfvN+MJYDj/QL+Md
	tjsEHM7GCV84GIXcXKyHD70m4ssJjTwd7qJBWr2bQMSl3sz+eN2LYL9L4iJKNG4kqRW2Y22PqdR
	6Q+mnhKWj8iopAmSMlHCnP3jcBT+ORtGVnS8=
X-Received: by 2002:a17:90b:380a:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39d709e73a6mr10263179a91.5.1789047025993;
        Thu, 10 Sep 2026 06:30:25 -0700 (PDT)
X-Received: by 2002:a17:90b:380a:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39d709e73a6mr10263086a91.5.1789047025472;
        Thu, 10 Sep 2026 06:30:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:07 +0530
Subject: [PATCH 18/34] arm64: dts: qcom: sa8540p-ride: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-18-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1146;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=CXfwjCEmlTi2gFNzojVj9OvmB0X6o16y8nsd8vTgXLA=;
 b=AWbH2geqVWHeiHrDvQWT133KWTzDZwoIXWeF3Vp+xCdeKXhE4ahjNbn8oOmeTrpBNpTf57pL0
 x9JlmzaDR2AAlzGHbKuVMR5f9tr2WTSXAQWEwDzRAeOrlRgjhsnr8IN
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa2b0f2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: dGWogqhvpnCoABAl1Ivab4PNDHRaxQQ9
X-Proofpoint-ORIG-GUID: dGWogqhvpnCoABAl1Ivab4PNDHRaxQQ9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX2zpRX990yRqa
 Y1+yh26W56+5ixf7lFayum5v7igwpd0cdCbHtHkS5WJYamEpnHa87Lr0APsQLUaJbYYR+UVJM37
 cNzuKxu9FOvT5U/hlyl0EypNfcQJy8Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX/9StGQHrV/ol
 /EaEqoF5G4BEwV4u0vkJ1ufdnWp0WSu+MVDwgK19ImtsUMPI+CyPvbikmi3KOFLXTJgKhWjxeAT
 uzDWSxC3VfztWYVPasdcrDy/Lwf1AHmzOxFnsuTEl2mZ50Db3bz1VZ++Kv4KnPTr8YISf6NYiB5
 DsglTRs2zwk8fKnaSpNo0VgYuQVBCsxeWjy3gcv6QcZZVnw4eq54+KzP2hVHVS/znxjSbT7lxkT
 b8yaVgGE/jrygV7EcQyZBX7fZtYZ5Nynl6N7hP0GF0faOZ6SRgHPfUmOdFqNvzuQpkHUkzg7Mye
 DR8kL1fNApxtmApYwtL6sKnc+4VTzH+/OSncURFfl8SJuecX7X9NF+rPqVkUSTqtkuv6VI7XMUS
 zp+k37Yxrv1CYRXJvaOYHWt71VB2VOGg7AsGQDPPyynBHluemMIaCZEWXQiUwbMoR5UOLlpMl+m
 vbsPCEvFXr7Um7AWR+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index c72faaa0ae7a..e85d78ecac2e 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -374,7 +374,7 @@ &pcie2a {
 
 &pcie2a_port0 {
 	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
 };
 
 &pcie2a_phy {
@@ -397,7 +397,7 @@ &pcie3a {
 
 &pcie3a_port0 {
 	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
 };
 
 &pcie3a_phy {

-- 
2.34.1

