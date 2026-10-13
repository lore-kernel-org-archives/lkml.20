Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B924ED1A1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889430; cv=none; b=fyI8zF1WHGpL5KA8x8K+RK+2/9DNWB+4X50mPBVdbPLnlcbDXkqXD7HnYbWM/dhNKN39msvj/uZZ7ZEzjydOyoZn2gds+7pTq9bi16LBWHzF/nKNTCvMhPWAoQNCOGEqNyS8B4TBlzSiidzJYpqvhuhvohmAAD+S6UYPE3dxFu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889430; c=relaxed/simple;
	bh=ZVrZiKjn5eoj1xYotO2X6Aa3N+e6mbg9W7+53FVPuhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZFScz+RTuQ5kabNwhaHiQ8KwIvaVCr1fg5fz7r5E5FPB3+CU1AzfZVEs7NSpjZczBztOEc56Dp1Dca7YAarOfGlEQixOBHeeikW9T+VGs6jm9vm/6KqPEib3NTiVbE+WJdQScVTETBBBKrV2zAzNKs9McH0XF+dbN5ulWOJlzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KBRxdqZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GpQyW6we; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBRxdqZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpQyW6we"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D902FL791427
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQyf6jcICM4FKao0weCOIsWtu0ZxaxxkK22IBq2EtCc=; b=KBRxdqZpIOP+jZak
	PJ8j6u8IIEOOrsWJm+/e2XNFUaLMxBVuCs25XQHvqng6em0oNxnzvUS9HRZsqGzF
	r8GwJZzZzVtR687j8Xax/dGGISN2iQXnDcX6l81ISinSgHW/o2ACZlhN3c3BTbFz
	1Xg9nv+KdSq6b0lrcfG+2pfSlvdij1vuJvshhxPuD5AcMCphlwg8bybNquWnHPs4
	7jWOlVUfbxweQ+ObvbNO9B3H0keKqnVqQvV62OflG64Tv9igrmfmo51dkLdxS43f
	I+qjC8ZPN1DOflojiYMKi/7GhFWkt0VVBnaSKO0vh3Wo/+gYSxVbtpbNVpdCsOx9
	2mUm6g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjrhd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:03:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so4209257a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889424; x=1792494224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQyf6jcICM4FKao0weCOIsWtu0ZxaxxkK22IBq2EtCc=;
        b=GpQyW6wewASmc0nDZOnvL6vb6Us32TKA4LxA68qgNoC+FoAcsQM+ZJn/nBvaM/ItXS
         54mZ7bssCw6gN4XBpNb9AL+MnNndUh3cOPwn/AdGRcsJlryTZd+HJYY+jAEhdyu5CUFh
         lZGAb1+a9q2EApWhSq6+xq6uXBCFvb6bcZn7BSFwE9o+Fjxzj/1EcueXW5KU768K4JAY
         I6uoTbobk6M+1jaV+jdgiMknfVrNEHH46FoJKhYFgDA/8TS3WMz4lf/rlcWQjesElaNm
         wBjjBc04fEA+UneUEMTJFI4MpKGwbHDFvBphOArJDyfSAUir11162yFa8MZwxaq2rUnM
         ug2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889424; x=1792494224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQyf6jcICM4FKao0weCOIsWtu0ZxaxxkK22IBq2EtCc=;
        b=VSRT/JFDVmJjzNzG9BXYXRewzDDLEYsSws11NQy+wql1FRQ8Fg5M25+cOvmCzFODE0
         A7rUzE4see69dahh1c60MDHNTtKMa+edM7WqaZhxDlM729OM62Xs7Kf6kg9b01OhImxB
         +oe6Jg2yBgMVjliZNIy7uNOTLLkZwGvzv+b94ZmbDRwvooURC92iaem9T08xFEqjHHrX
         8nE9XaPbodIS9pyUyV5oLDSVWHs+4jqz66Rt8s6+isVbTK5mznl5W/k4R1f7+gjN7Y/4
         RVpipLSTqNAfybDijSyKscuzi2hr2o7+1l5/VRXTMdZC6oF+ZTeyUbg/dyeVKzNjPt+z
         cuHA==
X-Forwarded-Encrypted: i=1; AKwUvByL663ivlAWTTfoowleRwEk2u2hh7vRgIFdJmHSDW1edwPprttdVc2GIDBgADJRJk23g5WEFHZxvkUKbpg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV6NWNrLin+oT/EKe8Ut8G7hh4wZuAZJISYkUYnX35d0IGwLuV
	+fItclg4Aob1TRgABes8A1G/Zprn5QstTvQkJEMD8jKkpBesbShxzoP54JNuaADcGnvaliHpYuc
	j+u5zrrnlBvzawfvz7EZ4g0V+CrZRTp0LrvnGhaS8bOpY6QnFg4C2Zp/8FoV3Cw43xno=
X-Gm-Gg: AYBFou2px6i59a8lfIqJzlquvut+NSD0LkN3lbkub11LcWvm4kPBpv1oildfP+CBYOb
	rFTjjzi+z0abdcD1y5qapTXC5WgPeblVVoKEUdeyZlBhbVFFdSM0oDeKHymAFzsxtea12Lvj5lR
	eugykLjIebdrx5Q1OVyy0HvOaBmWzGWGuDwIbhqpuuw1F5HQAnWsTQEZzHglvz0o+iKSg0JQ8BW
	jZ+HhYX056awFMhV+fOwJmhrkT72tcBTbN4iPaO82MXw3xVnhawbS5mSH5d/6XRbd7pxoNWUrv7
	w95uLZqTaqTAEIxlegIvDgBEPo4HYvRrxX8iHy0fqf+boTjDNEeMF8vDzl3ZS9j1kQ7u2+Axtb6
	f4ZblxaVczTvju5RfFIDYRNiz8/Yr+pE=
X-Received: by 2002:a17:90b:3d92:b0:3a8:5cab:ff5 with SMTP id 98e67ed59e1d1-3ab3ab1fa22mr11534524a91.43.1791889423666;
        Tue, 13 Oct 2026 04:03:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3d92:b0:3a8:5cab:ff5 with SMTP id 98e67ed59e1d1-3ab3ab1fa22mr11534479a91.43.1791889423107;
        Tue, 13 Oct 2026 04:03:43 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f46dfesm20808403a91.8.2026.10.13.04.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:03:42 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:32:46 +0530
Subject: [PATCH v2 4/8] dt-bindings: media: Add CAMSS device for Maili
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-hawi-maili-camss-v2-4-fc93222da89c@oss.qualcomm.com>
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
In-Reply-To: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791889386; l=1384;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ZVrZiKjn5eoj1xYotO2X6Aa3N+e6mbg9W7+53FVPuhY=;
 b=yjDWXo1cCMQNtBqrKN0bhNiXuURBQDjxrGWVNAyZ5bK8TfCfdbmbEf6tewJY2xyxX6oeHjCqj
 DSR6hpboLLRByu31a54l8wXXC0SQFO/VAiyVILZR76QxGGEfkG6TRpS
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX5/b1j9HGg+T7
 zurFieQzmDevYTWv6dnPwlLPeWy7Q2GiQmnH8izxxgLoVnUweEdfYel9u+70SpGTsx6ervU1w1C
 sxgo+e5tZLxLLYbptc3RU2DKr8iZ4Go=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfXz4Yiald0Xe9G
 2BoKp8QcaRSDH0hlKm3Rxpu4R+fftMAqJARkvyza7VMyNVu2ihEtIBHSn/itV8evdd5VqeMxurx
 881MZ3I62j4Sfpvho8CS7rnzbHoiYoCSbYgc/8nnH7AiwRhsBb8dX7iQ25epwvmewOUt9gy84aY
 6kamz7pSDA9PdJ52Gi0/wOB5qu9VJedaHXU/A6QTvrNlxhJae+CzOFbik8GoAHXSoOg0RzbSIsG
 aXmgUVZCpCNlYLSCtmmpcrsrPw8+EW0bAq3G7+5AFRX6UbLC3UTpuKIUYRFNiNLt7B9MkgeOafU
 ErPiyeAz+MEfEAHmumYGY2bzmliWOGnYED63sLEzTmfqAsytY+VCLzxL8fTu/4JZXqmKUO33/NA
 OPQIv2Mactj5Jj1jcLjPyQkioWj6kSAVGN/flQO6hKPHxLTPCq9CgWP04z7Ysce8gBy2BeQU5PM
 offlJhPibFnZsvhY39w==
X-Proofpoint-ORIG-GUID: 4_aTA_pCUOpU3pVPzfERiyIo1zkv0_0W
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace1010 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=lEnWAUz5esA3NO-HxloA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 4_aTA_pCUOpU3pVPzfERiyIo1zkv0_0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130043

Maili shares the same IP as Hawi. The only difference is
Hawi has six CSIPHY while Maili has five.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
index 5bf0dca3d24621bfc4a09feb8e5037a925869751..d1d53d6f024cbf7d2a0f2525aa4040260353b200 100644
--- a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
@@ -4,17 +4,22 @@
 $id: http://devicetree.org/schemas/media/qcom,hawi-camss.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Hawi Camera Subsystem (CAMSS)
+title: Qualcomm Hawi and Maili Camera Subsystem (CAMSS)
 
 maintainers:
   - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
 
 description:
   The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
 
 properties:
   compatible:
-    const: qcom,hawi-camss
+    oneOf:
+      - const: qcom,hawi-camss
+      - items:
+          - const: qcom,maili-camss
+          - const: qcom,hawi-camss
 
   reg:
     maxItems: 13

-- 
2.34.1

