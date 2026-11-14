Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663213;
	b=z79oWQY3B6IAP4qp7Et+uM/BW5eaqaERb8OyGQ9RLP+GUd1Y3PibCsBKSbMrP4W5F3pQ
	 gZ+E/8urVGx1DCHOUVh4GxfrtnXmsjkfVpHjEEP4CU3VVnzTQW/ogSC98I0/ILSYOReKF
	 nGb/P5mmbapdn99z/9XueS//QMKNdZ872RFAW1YTObaMWf4tSHov7D/jicehEjtynNO0i
	 lkFIJyrvIgKpYRuE+IXb9hKjpP7PQJOCKJ1A8wFwt/yx33P0Djih/Rx4TxM+4G9RJQ84u
	 Z0FMjYvJssSGK7ZRZNdXTDS/f0mhjyFKmhdd2cnL6S639drSereNg/EjHEAEmZBuRgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MJsWmeSos7IaKrHFXU4bluzQsu4GddWDFWA/Y0oEdxM=;
	b=L4M6i0PtIQZWd5B5rSAZrrSWtINyjQawHAW9ZVVFyZNxwIwZMGRn5oE83HfNM63Xy9EQ
	 DXjsxjYLpcjsg8iE2gX+dk0+gMmcp3hj24h/5XhA5cypnGPDiX9JcGnveVvPbd5YAPB1l
	 9R5xApSLbOcW9FpyJb+lT+8yUE3tjibvvTmwBdikWuQyDNuUPxdi5mf61Tscy0S8N07EQ
	 rObLc2uDl+x33VM55m1eC5PG2ar9E+hLLDDDzZ/IUkNR0xZyDThm1Z/EicDAvsW2Ddmrk
	 3wAdzmtsUbctjPn/cZessgoHNWxR/W9QUEM8LvkcTKJxTMtlWpqoJD5gq7j4o9ignYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=El4lRT80;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2xEWrJf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EDD606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85EDD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=El4lRT80;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2xEWrJf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9w9fO464608
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MJsWmeSos7IaKrHFXU4bluzQsu4GddWDFWA
	/Y0oEdxM=; b=El4lRT8095Mo5J3La78QG4E3nlPd0YUTMqCKJRdbXljA459Op83
	2U2sQom7Z8g7rFDrVK6rErqzfIpGf8HLVxyaGkqeGOLJMJNov9JPmSIpdV1N2HFK
	INypKZWsWao5G+2zRyVseJeIcSlq9Xelr1ptkY1m80YHxN1qupLsNvLxeXj5GX4Q
	N/zIgMvrlPPntK72Gc15Dod+z7o4g+U4TOiC+c0R4DAsi5RTpaLLrXSZzTOY4kmW
	yJvP17tlScrdccxYWwv6qrEqn8z0xc2zgZ2CEe+ko4I7lca2QZg8CQA9nYZKMiSZ
	4CiiqTee2acs23lBBLunLIJyqciUC9KXGWw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdrufp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:33:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1122705a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663211; x=1795268011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MJsWmeSos7IaKrHFXU4bluzQsu4GddWDFWA/Y0oEdxM=;
        b=T2xEWrJfOyCZd2gFHE9W/S6aXLnCiG62Av+8WNyJJRgdI1a/BOP+XTU4QOeMv6j8AW
         1I33cNnv/mNQeQUG0Oi2qIexRqKSQ2Xh7CjxZwQHO9lHYBhgp0x2pvazQ8S5d1rAUT/J
         qxFWhBY0KXskWCg/9M7k9gJmwmo19ft2HBpVnz65apl9HSdmZ9tmrsOMpPnvKIMXZMuS
         P5OsMvRBhtjqPUWs0k2v7Io+RFigfq+OT61s+5OKG/3MhUWuCwPA39t+MPQQbXh4Hss2
         YjVdjfL14IXjLgELqsRaG1cwF25QtxfV13zwIv6ZsHKCtyeBsc1KBY3dDb0AxtSt4Gf3
         /k0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663211; x=1795268011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJsWmeSos7IaKrHFXU4bluzQsu4GddWDFWA/Y0oEdxM=;
        b=EkbX68V8rd0fgiJe9euuOBAoZJilhuoeVSlutK6zUEiglf4d2Sz3DHPyY2z4fQzm5I
         VfdgtdduOZiSGJDq1f+9MHObrP2C1wE7hgRLf8+XDCc5XTRlh6B7yh+/uR/jeBN/8r6K
         lPMXe6DIqD+Ue9nZSnudPkbZZDgvi8YuWoHHLbRj0gcDqNLCAaxNO1FqGD6uzFdi6+dw
         +PpXqLWzwn1ZidP2gUc7nm9ZmuR/m7GI5RVn9xYiG7v+dgRrZOVk35Hrn3lkX2r0nvaA
         I5/de4R25XTCHWlYVWqdNS5ZX5UzlKC/egKgEjcZolc7QUUfSom/FZpkpzHniJmBBYhg
         PpVQ==
X-Forwarded-Encrypted: i=1; AL+hErGCCZ/jiZAMl6GTF0gtwuS3/4gLwxuj9/+KqHD1Memf8xVCDzlyOjc0twvUoEKKAEtLjfBMYmyA9vG5kWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t3C9fAMLu5OCs22IRuKXu3rCcShd8BKjJnDx5hMgKdXW/Ku9Q
	uexkJQX8D+Hr71nnoar3zEJLNg11mIv9nygDtu5H6S7JOxNXnhsXNHgfe75I3KNTQL4SdyGAnVn
	zAWMKVtvkMDTbDa5SZT0b5WUzO9m78PmDLMRDT3+OcN+bj+t8S0i9ZjFh1JYqbb0fFy0=
X-Gm-Gg: AYBFou1obym35F3NV3hn+Pk7niQZqS1VYiCP+NfsZ6vl21+ajhvmwQ6sT76kFyWK4/D
	NXaSoyUvt2HXwDh5Nu+kvIvR2hsYMQJ9ZAx3nma+gLSaiOcZ3/F7oUclOSqOVgkfLnhT3DWOj4q
	A5gQSh+UkpNMNNMLKg4/sZ89gnUJoRS9V7sUSOYEOfNg0dcFysQ2olALEOtA6uy1Z3acvU69/tX
	1hNA/UNdEr/ZspemsBKsm4MFnv7vLKm4vzqvRwDmLERTPS2MxK+l66bPitRFPTmPvlqDGCavakY
	8SgezTDvdLwRaQE4OPjVKlXiLDjgLdTma7i7XNDd92mhqXR8okbUt6E2IAwheE9nnK9BcygxsCP
	UyP5mC5vaSA3FI5vb05DaYIdVXiriNfRVLtlagNh1AgUiI5DQPNQSLPyz29+4v1gGLw3V9VTTeY
	Yz5G+EIPsc3/jLquvAJS4NT7aTKdwlC3PyUHdT
X-Received: by 2002:a17:902:d4c2:b0:2ed:ff4a:6d07 with SMTP id d9443c01a7336-2ee0de075cfmr50771115ad.70.1794663210871;
        Sat, 14 Nov 2026 05:33:30 -0800 (PST)
X-Received: by 2002:a17:902:d4c2:b0:2ed:ff4a:6d07 with SMTP id d9443c01a7336-2ee0de075cfmr50770825ad.70.1794663210383;
        Sat, 14 Nov 2026 05:33:30 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8eb275sm20266965ad.64.2026.11.14.05.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:29 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/4] soc: qcom: socinfo: Fix SA8797P and add IQ10800MD SoC IDs
Date: Sat, 14 Nov 2026 21:33:00 +0800
Message-ID: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6af8632b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=i9xxBTrTDdKVDmfy5nMA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX2IKB1bLuoLgM
 N2HX2lo1SCUDTqTosUGaQjhVrwdPPk52SC/aEiIlkzjI8TH7Mhwg/JblsAirmeVSAiB1jiFZNKj
 r50lK+c+xRcSt7OqeqM5B6rwu2Gf+eU=
X-Proofpoint-ORIG-GUID: wLr-BY8Xr5KzVW4HroQRvUMUxJBO9mZZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX/YWG80qHhbGS
 1eK1/qNriIixa7j23jOOofV4v1S60sJ/n+DuoyXNPaYGKqBnfHfdGCpybFQdWbm6dHrIJMAYfA5
 GVyD+SCH1r3jKuwCD1xm7izx14DOuMV7NsvLu78sY5aU5HVBbXJ1NMCaDlZt4adMf87LW459Mdg
 jbzCOX9ucAXY6/1EtaoTEcbKWdX76ltk87PFxtLIzBPWuZ6qIztzVEjrE0a80Lx7dN9i6aQUbmX
 w9QgUl+/BqBg8q1d6AR1/1QnczpUxelTr3GPi/GHnWiYFiuLYCWPJZDrMnpZfk4pcq4uWahhWsR
 R0LEO/1KuJnpLdClIf5b42QiEouk82Z4TeMLboHzRdlnrxqM67lFFNay1xb6wisxtVS6AlLK4Ne
 qgIcHOqKtE+o8UfX1z/36uysgEoZNXa2jeDMPkupZzgQHJQaI8g6QOltSv/Ml/Pj5lzVeSawLmv
 WyhRut7Z+GdbfvN+ldw==
X-Proofpoint-GUID: wLr-BY8Xr5KzVW4HroQRvUMUxJBO9mZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140053

The Qualcomm Nord (NordAU) SoC ships in several SKUs, each reporting
its own SoC ID through SMEM:

  - SA8797P    648  default chip info variant of the family
  - QAM8x97P   690  Snapdragon Ride modules (QAM8797P/QAM8397P)
  - IQ10800MD  798  Dragonwing Robotics module, e.g. on IQ10 RRD

SoC ID 690 was added as SA8797P, but that ID actually belongs to the
QAM8797P/QAM8397P modules, while SA8797P is 648. As a result, boards
with these modules report a misleading "SA8797P" as machine in
/sys/devices/soc0.

Patches 1-2 correct QCOM_ID_SA8797P to 648 and add QCOM_ID_QAM8797P
for 690. As 690 is shared by QAM8797P and QAM8397P, socinfo names it
"QAM8x97P" to cover both. Note this changes the value of an existing
dt-bindings define; the socinfo driver is its only in-tree user.

Patches 3-4 add SoC ID for IQ10800MD.

Shawn Guo (4):
  dt-bindings: arm: qcom,ids: Correct SoC ID for Nord SA8797P
  soc: qcom: socinfo: Correct SoC ID for Nord SA8797P
  dt-bindings: arm: qcom,ids: Add SoC ID for IQ10800MD
  soc: qcom: socinfo: Add SoC ID for IQ10800MD

 drivers/soc/qcom/socinfo.c         | 4 +++-
 include/dt-bindings/arm/qcom,ids.h | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.43.0

