Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513840;
	b=FIys2NdiNzqLpPG1/3xvzVvBYQhvGRbIf5jg0ZW12U+59Bu4Z9jQhGNCXXufNpgmry3E
	 xtaUblpEJ3S66h75n6wj9y/01g1k7FMviXBbx0gAjB6UhdicSSaC6Cv/A3N9swdLLtrWF
	 5CDyxA1W6rS47OwW8qArTFpAkOwdsEzPN90BcK36q+4Fbk4hQhY0vQ2o5TpdN023oA8/L
	 muo/UXbVDhGNlOTdBcqeBsV51Y0QrJMJyvpgxu17NciuO2KB3Lsae7N52JDeRo0z7pNnp
	 p2HKOcmkUrVI9WewISLvTBO50gHiMFKDnHaFGT/WpfyVmB/iTAafdip/4k4N/yaowDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UOP0waMM+sHxlrwH6GNmYMDDdAIctadssvGweIo5pH8=;
	b=iC6bYVC0uxx9PlxMQP0cNH/pmiqL1f7SfYJRZ4IKNMxL61/awTHx0P1fc9K8oFIjn4d/
	 cwHXjctYUxETqTKWze9kq+x5egRABF/0cfDH/vAMx4fXqYOrcb3KP6GTa25nTO1gQEwHL
	 34Ysuc8Otsfbkhpf5NoKM3NJnHi//ystJuBu40orUm5Si6G2rkR5a9nb7++sLFydOtf2x
	 mhvObDzWrjkWfOxgDegGLWjSZvykMggSnOTABTEXiDHmpBjPcO/JJOqnoDg/PtVggYtRy
	 vZkV4nNGI/2Z6AzIg9lRa/62Vn/nEyskPbI4hApOb21qjrFleeM/7sDMdwuWUlXdGvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6TsvtST;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xl+eqbzw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37045606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37045606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6TsvtST;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xl+eqbzw
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KFa2wf2052857
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UOP0waMM+sHxlrwH6GNmYM
	DDdAIctadssvGweIo5pH8=; b=U6TsvtSTx4MkOtTdgMtB1yHOMtDA9I/gW726oX
	nvOujiXw6sZexFMejeuw5CGHWTAO36R1h1UyUkIzljBeALbnfyosRGB+DToBEVbt
	42z2SXKTEOwr9rCzhwJrjtm2hNgDn7oR1mGTi29Z+mJYBMHzDqQHYSLVsp4WZ9Wm
	5I32eMybyjlaAhz/po7EUv3xmAEtopn0cu604RVDujr8ICzw/zaljV2tY5vqN1uX
	vN5skCMJ1b5L0bM4koftls97cYhwHrSrJ2aJKfu/AwMP4pe0xM2ApC4iE1b+13Ys
	qzgoA+WVQiEmiaYJw6pBpR41ajV6DWxCbSCl3kIc3ieuOslw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n3dwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:30:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6900328eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792513837; x=1793118637; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UOP0waMM+sHxlrwH6GNmYMDDdAIctadssvGweIo5pH8=;
        b=Xl+eqbzwCfG8tQr0cUEkPnde7Ff+1t5mWt3FP8X/83yBEhVt7Yy8cow2LCgUKNkp6t
         kMyXohxcbquW+nIwCN/50MN+h54hp7O9zGYHOoWhtONpGibRtsjXfD7/bxL4CEcCem/O
         rdibS92uZ1uCw7sJIzF8URACMo+q2ynwP0SZGX4m9odj4G/ejpoMr+4kKJAN/aO/cnmS
         ElNTY0WtJ6OGV/dz6JbRCJZ49wPxptuXf4gH3oKQpgD7q4oSkzjEbs6cDKT/bjP0k5JH
         XGCG8itgjz5aftQM2CY6ViueUVunh8uHXuh5jor+v9aBUmPDNmjMx2zYSSl74jqmwo2T
         DELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513837; x=1793118637;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UOP0waMM+sHxlrwH6GNmYMDDdAIctadssvGweIo5pH8=;
        b=dRZ5A+Wu4Jwct0TIbINrN2TnqGfNAk3R4uujTQTUiEwLtQdpGyhv87TgHxMRdtucxu
         NhCB6dYhLOXBtBjvvvSdEj0oIKMmO0YSvDYNObfW3fOryWdMjW4B70gkDaOcpf+gsLZi
         qXi/o5CQ1hUyMrPBa5qf9y22e+ztVJPASRS6NTNQQwzIUAvbf1U3kWzeZv+jV31sqGQh
         b/qRdwjYe4EoAAH5uPLd2igyevBRmTAmSZKZuQVAEorFj/N+dYPmQcY10+uWHTvI08h+
         7F+Hb78zRJ5z7buBE1R+qpC1Kl1oiIX6tW/Dz8hqCI6QmRPB0I0rb65EeYXDteoeicra
         Z5/A==
X-Forwarded-Encrypted: i=1; AKwUvBzo3KCTY+SJxSfMBrsOU6ld2Ln7+gH2zFxcpz7MzYg2vyVnAyg7bFEY1+Sqm4dvs/ol8wGHlkZ0iKFzNkI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKT43e/aPb50BVlvq3LKC6pZ06gXK9GNOMaWJhuAtf2ILtJtGX+
	XwEVq6wyZ9Qog6oR2cc3Ysr7YDtb4V1FjKOX6k4chVy1aswW3+zooEl3jHry5Lm97AqrDlVW9MC
	XTdPYZGFY+/xF83w5Kny3QESDyHUzrguuGqayZsq/mDYnT8C6INhJLQcSkVrzpWx5Tig=
X-Gm-Gg: AYBFou0HtAu1C9x7kM8jbGAe1Q1iJOdgGpb12Fa5YOEkboOeIDFGgakcQjpK5RDrzLj
	xNPn25TVcCW/EYQXkoppb3NG16rQzN6HLaPZ2qY9HJ1N+cDFkj2S9NxACkvKRCsQeDLCNj5KNIT
	+VdPSPCzs5enJoao5AqQxhafEqp9ciHYOnXn84l52RYGCtXoTyS1Y34MSUf0iByuRIFI20mvHiK
	Pt9Vbn88D1acWBkktPdIPePCM5+nlY60WWa9k0TIb/bfCCk/mWP6BBkeuk1UYOoQv+7B+pRgk8Q
	QRq/O5TwCW16X1ZI3Ws2KPkfw9mXcXpFS3K4NieLvQXm25cNIH2xugfBtmCxRh+g819iuDcYzxM
	C/wmCY5X43i47QvZuwzhXgjTEokyGW+pv3Nr/5DeImhBx0avQJ+ZwXTB0oFFlGW7VU4PSsl5iEf
	L1A+Xb8aMVY/02zTv7h4+/7T5cJay7jbEQSfM=
X-Received: by 2002:a05:7022:f90e:b0:151:2e62:fe6e with SMTP id a92af1059eb24-185136cd2ffmr14599671c88.19.1792513836178;
        Tue, 20 Oct 2026 09:30:36 -0700 (PDT)
X-Received: by 2002:a05:7022:f90e:b0:151:2e62:fe6e with SMTP id a92af1059eb24-185136cd2ffmr14599624c88.19.1792513835419;
        Tue, 20 Oct 2026 09:30:35 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm33473794c88.14.2026.10.20.09.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:30:34 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add LLCC configuration for Qualcomm's IPQ9650
Date: Tue, 20 Oct 2026 22:00:25 +0530
Message-Id: <20261020-ipq9650_llcc-v2-0-e4c492acc8b2@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACGX12oC/3WNzQ6CMBCEX8Xs2ZJ2tfx48j0MMVCqrAEKXSAaw
 rtb8Oxlki+Z+WYBtp4sw+WwgLczMbkuAB4PYOqie1pBVWBAibGSMhPUD1ms5b1pjBGZPFWJTmJ
 M0xLCpPf2Qe9dd8t/zFP5smbcHFujJh6d/+x/s9p6f9SzElLoBO1ZlirViFfHHA1T0RjXtlEIy
 Nd1/QLo6oBOwQAAAA==
X-Change-ID: 20261009-ipq9650_llcc-903d7576288b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: Cg9JoCe2G0Im_nlHq6QTlPfKggJcFznC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfX0ksKBv6wt4If
 IQGMiirSM2/w6XGmoNgDhQtOH/SlfOwNng5+nYWQYtVduB+gIshUlEqgfe9z5loDSjzY2lqN0XX
 H+7pgFLMs575/6eYsTD8OVVlnXuKN0I=
X-Proofpoint-ORIG-GUID: Cg9JoCe2G0Im_nlHq6QTlPfKggJcFznC
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad7972d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_9f8UQ2UEQgcCYNCZg4A:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfX5MutH1yoF/97
 br0nXt/AOgokgbh9Dr8+GUlC2Q0zSmAh23Syw+HEBDIMtWEqokhn1AglclLVt0vs3sKs1yy4cQo
 aR0PPYLhGug10sP90o6+7wxLrLq0YQgi+S33kV+Lv8Wypiv9xz+0CKH45gCm2lkD+0sWbE/YbX2
 +0fl9ZypmDvGcOXmBr1sstQBgENE0N6/3hN9lejLWd+p3A2huX0xowISScf9B/FGTp4Qlh5u5tg
 AHgdWXQudemJ1PCGGaHMh1c7/2Qpd7o+UHcXB2ynuYgncrCeDkikOojri9XoLIFfvAjesOSLawT
 OMLyIw9wpmYkzoXjAmRQNnf3M0K4RyCgDOHgvtEbQ4g9bDCMLh320z1WwuSegeF/cFT/BX3Nq9L
 C/DQgGngp7TFfi299u59dGgkCipSsn0hbmcSn2euFXKPiU6n9AGqoPdLKyM7gZyG1JAzyQp/HHp
 lHe8gfZXo4zoJjUBoMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200065

Add the system cache table for IPQ9650 and the IP version is v7.1 but
similar to IPQ5424, there is no broadcast region.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Use lower case hex
- Collected the tags
- Link to v1: https://patch.msgid.link/20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Kathiravan Thirumoorthy (2):
      dt-bindings: cache: qcom,llcc: Add IPQ9650 compatible
      soc: qcom: llcc: Add LLCC configuration for IPQ9650

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  2 +
 drivers/soc/qcom/llcc-qcom.c                       | 76 ++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h                 |  1 +
 3 files changed, 79 insertions(+)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261009-ipq9650_llcc-903d7576288b

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

