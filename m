Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABF92DCF57
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135409; cv=none; b=OsGiDHDZxTRIQwdlpHLAx2/S/LDFBZRfEsRlmsSFh+4oW98e5yxkFrBBmdiMRP2lczbehR2mldKS/guZ0KOkcn+MIQzimiNGJDg6kZhNhySbeL1qfUSTFtrR1AB6wD7eUuVCX/APiSoMP3oAgy1fXxd+4cRR24dvC/CAcCkMRv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135409; c=relaxed/simple;
	bh=FZmIlkAWgTpgkUA1qcbrkRBviVIe1smoUU/dkQCsdnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SGZxtrLY6hwvI5Rjv4U+JruLoClbQ7EZuiaPUQeNAaqScMJ5zJCsZFAFwrLG5Un89yBpaGVmyAiFGp5Y0T/+b6ivq6jf2ChS5wKsnJFeI8BHkrMYCPd9TI4hwPmjAM7UcS2YXA+qNi8MPC1kHJ3MochDcip3+mBpbj4KIrtNPhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JV5Y7uiR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwfJFtdL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JV5Y7uiR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwfJFtdL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2EDhe406220
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KT6ssDxp33327j2BUAr04T
	8mMEKAUqPY+ZrsmKoNZsk=; b=JV5Y7uiRUBPr5aHUP6dzQ++RRgpPc1PHHZlrOP
	PHoIZ/6jrmvY53r8K/3Ic4Ll5TXgPusIW+xyVjBZBZgRI7jr0IpMadzYhiXRrH4W
	eg85jwJiCjyUfEnRHrff6LPuCttihqG5RwTJS6syRvcVyr+32sqyBi3lgu3c42hw
	gePtFddFO9aIq7yjE0rbmUgoHRveUU94rjB+S6tUnutKP2xmB2E2cY4kxn63l4eJ
	INGLqojIjEYBcv6UmIJw0tiUJ5kbDO1zx/Kj6aOJLnnPuhvBVuqp3sWg68UXGRR3
	x0Gf94OHMK943fBJTNgTcslyV86iZvCu+l6MMS1hC/vEQT1w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa2jg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:23:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3592749a017so699859eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792135399; x=1792740199; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KT6ssDxp33327j2BUAr04T8mMEKAUqPY+ZrsmKoNZsk=;
        b=UwfJFtdLGXo/WDW5vqKCilbXWaKSA49sWnRwiyU08V/PX4KXzKYtmXwBhzNEL32LhI
         RYkugr7V487/qXvI9EZYej+/cCYK42lGAmv1v+uzkZISwivLhTmpzQWqoPg1Iyn0qyee
         hTol0u5U4O2ZtXoH89+MDMkKUmB/gHyd+8MK3QZCP8LKKmvvXwZb6NxM8F+kCOc4ZFVy
         KqTIQxFIcmCUe1f/Sc/14/eAsNY2tAtfwhtsXa17HbKKeEHewrraRqo8Q+qcx5H3NhUc
         C+XVg+ZJwoXzqWWNpGgrYqq49C3Q5BlSduqd64qiLghxdnk5UTXxQXXi3Mb5LGbcWocM
         0+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135399; x=1792740199;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KT6ssDxp33327j2BUAr04T8mMEKAUqPY+ZrsmKoNZsk=;
        b=zmyktHyEBt4hqvmUFS902kkXi70r/SEAATEKbl0/JdqIWb1Nls1pCku8OoSEsOMVes
         En2mgTxRksOzbo6UAG2Dre1kC070M/TnMBZAs5pOmzZ9vUfjnc54uVvZA1BqmwJ9ZsS7
         GmD4CJ1+DmDI/DFzxBLNdbPoWYLRxp5rYovuMAHFx3sq2mAzxTrV2/IUBHt+ItqOPQDq
         LtgJLJA+5+x+Emjlre0vQ9dv4tw3vJ+qWTJHf54/jCYPpFqGn1J3SmOhWjOtewwP9DOu
         JM6x+Ift5nlo0nYo/QTJveOCsMSCvdjk8D07v95YbydAByaBfC90pvKLvq9THvnPkyNv
         Smig==
X-Forwarded-Encrypted: i=1; AKwUvBzJmiwuVsEEeqXzqCMXJjF1OkVqxisXmkawaswrPJAlkk2S2LpDK+i8qZZqHeDddMWPOv2Nh/pLv3tIBPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5xUGmwZbYwZYd3xuzXATv4vm8fqFTE52QNrsd6b/GhcI1O4Th
	MJ321NiFW/e2ceV+wsX9T6dZUsIcvQrtfSdg4YmirzMeSgX6CGt+3HGNWH9XRKKSk+1SVPqviFP
	vXIcubyZd4F+LDefgFSm3hwMNKDLrt8tbI6veU0t/eiD/Ac8XGtEjSW+EsiQURNnHIDw=
X-Gm-Gg: AYBFou1zHWhM4qgFh87wRHknmg2b1/Ro2y3W74YEeLAZru3kbRmSS8HGeAck7VMoaNc
	lSc8JG89DXyO+B1IfD0/6/9N9bGxhDwdj+0Sk4/HPKLN9rBI4zRgKWYPvFoiTUtps2Iq6U/uxH5
	VY1TAgopnsKUGCQpi37H6nj3Zy59/gKtnem14adLhoLc33cafZT/L9FmZpYEOpvQ37e87Urkr60
	OhK94pGQW2vxVIB6Dh3QdSCmRRKDNM/N4DyhttvE5NpKV8KoJRzwyS1vWEt/Nl/NvzBBirfpxm5
	RhohFtpPlY71UU4bsaQgSE4d75kK4lwjfDhKQ3RJjJ1h1jpi1wSo6Pjg/yg+zNPGeK/j6LMM+2E
	cHzwJNRqMg8DaDPlvoG77aQlfmbmrOWmtBPjPzRygbjdMa4OwsWwBNZFHcGxw9EPJMrIi3otl8w
	05PvB8XaQ0DH6HVqHYwQKUniyf+y8e5mbbVQ==
X-Received: by 2002:a05:7301:5406:b0:355:29c0:9cac with SMTP id 5a478bee46e88-3602dcda842mr3011799eec.10.1792135399124;
        Fri, 16 Oct 2026 00:23:19 -0700 (PDT)
X-Received: by 2002:a05:7301:5406:b0:355:29c0:9cac with SMTP id 5a478bee46e88-3602dcda842mr3011759eec.10.1792135398414;
        Fri, 16 Oct 2026 00:23:18 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm4024260eec.22.2026.10.16.00.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:23:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:53:04 +0530
Subject: [PATCH] spi: dt-bindings: spi-qpic-snand: Add IPQ9650 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ipq9650_spi_nand-v1-1-d341a76559b1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANfQ0WoC/yXMQQqDMBBA0avIrA1kJI3Yq4iEqKOOizRmbBHEu
 5u2y7f4/wShxCTwLE5I9GHhV8jAsoBh8WEmxWM2VLqyqNEqjltjH9pJZBd8GNWE3iBRb2rTQM5
 ioomP37Lt/pZ3v9Kwfz9wXTcD5kGedAAAAA==
X-Change-ID: 20261016-ipq9650_spi_nand-f1a41eeb4749
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyOSBTYWx0ZWRfX+oPu2mTJ9LMm
 iOxnqkF8v7+RGQTXBRav0nRBjTZC3FRanjFBl8e1VqDwl/xUQ7E9AT4sAV6wtInhc1iJUuoQ4CJ
 b/2HQje0IPCdGA8mv9lYGX3xXyokIT8=
X-Proofpoint-ORIG-GUID: qjwoQoWwIciTZAi38c3AISUiWJmd0-5l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyOSBTYWx0ZWRfX3nDJiBTvIc5R
 LchKARxCYt1nQly5SeY5r0F1yruSoPGAL1d3fmEc06BbMayOWw+/ak30v7y60HAKroO0LXV0zcu
 BhU3ADeTjgOc8lw3D6XGIHYu/Sq43A+O9O+w1ameibfruBc++sLa+QWpwBaZhLxVlhRGo9NXY3v
 zineqoeKGELvfP0NoipCQkFB0cx3lCMglwsp6ZtEZrti3kkTrfO4v4sJA8zwKzXHJlkd/JEu6od
 zn6Se70yLZ/C3NrDzE6gCnkCw/PZUPM8J9vQ5g3REDmhJUOkOslqAOH/ilyDXt5OA4zIc/du2jw
 gUJxvcp/qhhGXjIKcnl2rbjHFU5VxnQkufEHbgj+K7QfMhombfqCiKvDQt1xk5U4Twe8/zY3Zvr
 XY/s8LnwU2sCb6HuIXlan7zfUCO3ERI3rBiMz0FOMSK58UpuTN7hk+JPP2ZYFmOVQIFfG0Qt9iF
 SPLm0+d1Bp6pr1doIJQ==
X-Proofpoint-GUID: qjwoQoWwIciTZAi38c3AISUiWJmd0-5l
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1d0e8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8iOvvssTOYIHNyThGLsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160029

The QPIC SPI-NAND flash controller found on IPQ9650 is identical to the
one present on IPQ9574. Add the IPQ9650 compatible and use IPQ9574 as
the fallback.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
index 829da22537d4..071e5333721c 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,ipq5210-snand
               - qcom,ipq5332-snand
               - qcom,ipq5424-snand
+              - qcom,ipq9650-snand
           - const: qcom,ipq9574-snand
       - const: qcom,ipq9574-snand
 

---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20261016-ipq9650_spi_nand-f1a41eeb4749

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

