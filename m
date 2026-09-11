Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54783418A58
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109457; cv=none; b=FX4q8jRJnb19fn/sqyPyitrxz1Dgs5ZNLZVmUxEcPQdMEKykcOm2+M7ipzT0jeG6+p7meMJl0k0lGElHiqKi9jMet47ivngTyiyHqDzmR8vI5Ln9GrRaSLIkGHahrg0fqrHmwMO2nktTNii4PVDgzmrdMnvKKxloivSTcvvFfBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109457; c=relaxed/simple;
	bh=Zy1nDF/DGXGbilrIO9Eq9qTkQ4vO1zgJJLXe4gy7WTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d3nJZ/116b3JWZvSjraPK6/ptiUqAvpvVMtEbhPJlgom9fCR9At/cz+gtK+nem0Oi68Isf7UAfpfby0RykN29uL9irUHt5ptj6eofZYB1G3U94wJujFOgjHRQsE69cHkN7opoP2B2UrwR6txJse5hLnLC249tcPFs2zYC8y4Nik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aw//CoOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4yX+Y9x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aw//CoOx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4yX+Y9x"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kQn33551408
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YNUwZadVXTzYgsSTqLloNJAy2d3SAMmkGcycRnUt7pM=; b=aw//CoOxEYODLNkl
	xnyJy6mj76bIChUB2L516I1KAH0YOXtd/LkSG1AmvVUf5o1Zfzlzi06PBzj0lniM
	PlJrGGzD814xb0bkAjIRXx5u4LxbNxhQ3Ou7L67Y4UA+aVfMFH3raB2vzWHKfI1/
	WiVA/k4WUbGzndv63q+Raw3P7Wo7mT0XX23xW/TVeNLFmyv1Xh8BMPWcTZW/jnmh
	caVfNj2iyvS9whoMD/NxRJjuGTOfa7nPlzBnb5v/ljE41UZgxEa6GDHtYoI/1G1D
	IKsQXTytNNuDOuJPXbkZagNzEn1Nbuva1v09KdlJ/f6Yk3pq9vUNyM9apxiA+yL6
	xPi5Mw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg0gbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc39363cc88so718310a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109434; x=1789714234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNUwZadVXTzYgsSTqLloNJAy2d3SAMmkGcycRnUt7pM=;
        b=P4yX+Y9xLcz/ha17v6aMn4bY0HTtTeH7a1X6KWAsIQpuUVHwJts/3FPErb2Vz8oNv+
         8zV9qTnmmIqOH7t2XQhNLr1o2TSYuim13AB8k1dHx5tAAd2ypueuqR06Uxh917s+1qzV
         wdyj5bT/B7k/kUGJNUp7wLFm4CdNvfqoHWzKp0EyVCigIAuZjZaBFRrAz9TQdSpBrnZQ
         fsagg+KGrkQokV5/WCChgrodnQXBtFL6N48UZ/B/kXnapqJOQpFrSHjjFlkWtrOIGfHN
         qZi82u+flU+LlC30qVFVhJFf4N2johNeVBG4Mp5+Kal+qMNug+otiAPR5h+/Bw85Us4d
         KjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109434; x=1789714234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNUwZadVXTzYgsSTqLloNJAy2d3SAMmkGcycRnUt7pM=;
        b=I9Q9hjhNsAlY29m9bTE+5BaEndTxUhI+NZDe8wQc9i0VNL9lW3d62LASiAR9/fzB5O
         YsBkOkNhx/aOsMjOHPXGYjKhf2pzdB//xg/zSNeH+FGwBaXZXHW7TD4MjklhOVOQX1fZ
         tH7PiHAnMBAAiBIZS0YUiFFjWVibDxMt0s/YQN/q2nPqZC5XE8HRe7VIvbwsuAS51scf
         k6MqWo1EdeWitYVI9wpPsBEsT98iWF1+wWevKoijMPe+xj2qhl23xrOiP5lfBt+AMrL1
         Ny1D+2vUNwUh4YASqGrvYCVM9Iibp0PIFMgGLw1Up/cGXM5Qwl0ihFO1iRKWXZht3tvC
         kS3g==
X-Forwarded-Encrypted: i=1; AKwUvBzow3YUE7bov5+3ylpUAzJ5G6JP7Qa0W764KpkCT1aLr6LhVLilxD4Ff2lB8wpSlbRlhlG3JT2pzDnJkiw=@vger.kernel.org
X-Gm-Message-State: AFuF++k7WacYC4nUJQ+wPEVWCq2prz/hbLRhnVpiTNehtriilgZjBgql
	ZkjCEFDGggYDxkBZotv74b9dBTVoHcVDQ7Bdo4tjdixyU3lzuuflUgzI8rxn82Zj/NAnrieFWp8
	v6PY2wdb9TzKQd7EiF6PSIeQ0WWmq4Sv+QMoOgeGyTtOgg9UMboJzjHl6Rqq8veo+1gY=
X-Gm-Gg: AYBFou3HpCNJMOQ4gX4mtE8kYrErcHRX+kRFUnxckA7YfcWtkllac0ytvX5d3Ph7A/4
	HaxraNrZrwDZ+H85yPPUkhMmLFUVou2uNXHOvU8zfQ4NMPU1Mt/lOKo3CdlQF3qA7Y2UDvuG2xE
	SxGfuI5tHZMoLHb/EsSDRPKcZNH27upCORUuLJVlk4aMP4EyzLSec4xTKtcYq0xi+mnDCf9dnCh
	Qv3wggpdGeuieftKDa1B/8JUMuOqzmZtC6/MnDP+JtSAytl5gYRcfHFwzViFGjCEVDTj+ccWCEd
	7yJbOp0dwJw1d8c9QpAlMMJwmnuCcDN6SE2jQVCjWL/mwISw3Ew/U4pXMOvEvmCfW6eGXP6yojv
	hb+xucyH1TpnHY71rUPzZjchqxmT61pEF2u0=
X-Received: by 2002:a05:6a20:1611:b0:3d7:eb3e:1c58 with SMTP id adf61e73a8af0-3daed1c1684mr5578951637.8.1789109433340;
        Thu, 10 Sep 2026 23:50:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:1611:b0:3d7:eb3e:1c58 with SMTP id adf61e73a8af0-3daed1c1684mr5578897637.8.1789109432863;
        Thu, 10 Sep 2026 23:50:32 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:32 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:07 +0530
Subject: [PATCH 6/8] arm64: dts: qcom: talos: Add t-power-on-us property
 for PCIe root port
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-6-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=806;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Zy1nDF/DGXGbilrIO9Eq9qTkQ4vO1zgJJLXe4gy7WTc=;
 b=nxjjBJNV1POpH0eJm1s41i43XAC2I1huQFPC+S/p3Na2LNOpt1Qgp54qvqgXYTKbCgtevvyta
 oJZwlEZAigvDGse6SRzr+MYMTgdkwOKwKehuot3Y5z+tTexipBxA0cF
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: o7okG0WwFeGPPf_XBT1Z65dF29prrzCM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXx563jR1qZm3U
 XrnQOf8oWA7CB6ymHzNuCay2Wu2J+x9XyuJcrmEuiFHnvBCNx9Nw3OvQ+vVGZWP0gGiRHz4yS3+
 A/AKdGF3M0ZtucJUl3e3VQknkgRgUj8=
X-Proofpoint-GUID: o7okG0WwFeGPPf_XBT1Z65dF29prrzCM
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3a4ba cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX7Xjl0z0cCzrI
 /WPewTMFQ4k5lLWjqED0b5zaK0uKhWcChtxur6bPss8AcEXbDA8i4WBT8MRLEJpnrD1eWChGsjY
 Y1A0wxeB3bOyyUZvlSlyfgIn4q3r1bcRxfab5pxxp9/0VqKqEzpwGEMdC+fEt2sOpMlN3Bb2hA9
 +YR1id8HEbq0x+8jcsoHM9jOkOFKIBLg2Lt9F31wSFrrXitu8ZEu7W6yJDCOau6rXH/3rjBzEdr
 9tXjAEAeHh8kLP7f4ztso+o6n0vlsVoihPoRMZfQ2+9pZrxZyYpTkyT1YH4t4irmFQXKTpsPQtf
 ZBu5+LnfQ+cdjoWMR3YBvX7VWDYtK9rwcgKkZ0k+/jLaF5xK2kZTwIUqOW67B2O66DmqAK+OM4q
 P1dWlbjwM6Rt18Ec08qmzvEoXWNdRfh6sjy6jX7T3ON5mw19IB/Cb7jvHGAVlN7YLrJx1unR9qQ
 80we8gn55WZ8xOEqtTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root port so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eedfdce3c479..ceb1dfc5189d 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1401,6 +1401,8 @@ pcie_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				bus-range = <0x01 0xff>;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1

