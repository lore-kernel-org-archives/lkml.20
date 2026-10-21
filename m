Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792561973;
	b=XiAhTk3qIAPRF2qjvHNc2riCiEApWr13K4mIUkHM8FC5eUQm4RpoxwntnU/ozs2mBMNb
	 0+PboQillvh+Hb4eJkVwE8neI2+gseNQt2dH+CAS5oWEKHp/OIEr5Grei3ZpBlKz/Eq5t
	 sF0HnJmEzkMOhHeXLkwbT4CVDPyyZeZ00U8Pgfe27iBRvzvCS1kDR2g8sOSbgsHlOS91h
	 bcBzHbWSBBrLIKVd89FdRidkN9N4TNMJoo4ke673hscN4e8EFSrjQK+goaoh9KaawhkMN
	 nfeSiEykQ6sh4X8vOQU+mu+kGKzjGqIKjZQMo8afte5CBmZPhiktPUUGWNjGnQEvw4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aeBOLAfuvG3vLQIFm4QLu9+eSGhAKNA99zhnOE/PgGo=;
	b=Fr81sx+bb98j/XievIFmjoIOS5Y870FGLmCtqtMjG5TIaXcs+ot2MwAYOgv0hcSmnEVZ
	 SLsTxn0kFwOaPXgxsW4KDYthhIkLHU+e57WJuuYCV3lwUAwbNN21XhYA0dk0kRAIKQaHj
	 u7VET/LdTPebe/uxyXP5Q62ES9B+vVlRohUrztddC/5at90jFTPjEI3bsZw3EM2eWhko8
	 ISQTaKBE6/Zh+HG7F+WAB7xEYchcs+rvDPnuQsf6RlAfuTSImOgotz3TQ5Z04Hy5dKC3r
	 0SZhcsCX9hGT6f8Scad3RHBcwrEHlRi4hYH7B+iFsczRo5F4fuA/JxydaCcvgftQudA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CQxl4eRu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JzDvXP5F;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F3E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37F3E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CQxl4eRu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JzDvXP5F
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j4SG248187
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aeBOLAfuvG3vLQIFm4QLu9
	+eSGhAKNA99zhnOE/PgGo=; b=CQxl4eRutcoGdA1Jg3xSfH2ckXztn98/jdR6E9
	QWAbjjxNQMJ09NR/YG2cUZPOBfXI0kxcuCCiJ7vW5PgB1rzl/bUHnd/QIKXyr2kB
	SwsYg11evoE7PVaB+8BFvZLuJW+CHpw0tOskRYU/3nDCyeHtmDKip64hQkDdAJXJ
	QiIq9f/8MlowszX4k8KZ68qI72cOsr/c3obDEtru6QitKmSOxDBKirIUa8W0ixVD
	EDQ0wX2q2Gi2T8BatQnI+SveJANbrqL2x96ETo6eubQDjBK6nJm6tIrEnNNNTUo/
	zEzVDDqlFAOywSESmhpzi92uUgWIzmmOnSh2eYsTJXBZ/SGg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajj724-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:52:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so767516a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792561971; x=1793166771; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aeBOLAfuvG3vLQIFm4QLu9+eSGhAKNA99zhnOE/PgGo=;
        b=JzDvXP5F5GnI/6iPdXVDobc2CsmdTfyJbS6/bxpnYc03VS/0kxrqErnga1u9VUmVsP
         hbvSV+/d2UPJYllfOU49tnsk5hDG+B1GRU/eOzp54v7Ak6EBBkkK9KOcNyf0OyqPQigl
         2hnCLmzDUn8BUTChdmKZ3MVTG6MSJFG/xOKMQcbTeEN4GrHRe4dn0vezgGFQSotzQh/i
         VrfA3DzJIBFOClj5SaCocbYIagH7+wcmTOB9M9tJelZPPs7WBrUNujE1MgBPab1oSMKy
         eeotc0NTFc2XPyeaGh8HOLK83JAWtuEL6ucaCbRChK4fxWY5KrjC65q7WFDIjq6bJLYA
         tm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792561971; x=1793166771;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aeBOLAfuvG3vLQIFm4QLu9+eSGhAKNA99zhnOE/PgGo=;
        b=fEl2KdeTjM8dYKXsUa8FHrBdbw3vh6MqbcPZpGLBeXtENh38KscSbZ4lAy2KYX15ld
         mwwdBw7MSwxEDROhmzP6HVPrqe5GejKIR7dIForsmQeGFajSzbFzCZI2RpbCrNuSUm0F
         bMct9oAvcFmFn2MvgY9iKKCNJpQRd/GjGdYuuiaRQJf7qljgXqTUI+yUmXw67wPrjIdv
         P0JO3r1Ju7uZbezAHLIxxWMim4LLFIDBNeoJKAfmGh3CHuskLKBMjElLIfNjYrzOv92r
         +EvMJza0V4J/zwimwq1zF1MfVS+4SzHIigLFaXLUDkn+gW/cDxeP4xteO7862Z+V5oMW
         xchw==
X-Forwarded-Encrypted: i=1; AKwUvBw7NBE9z2s/Fjjwr4nOKgKbZpQzQkaRle08uOonBd5tZmzTu78HDj45d+XfKmhgX4ivMIC2kGsr5EcxC48=@vger.kernel.org
X-Gm-Message-State: AFq9FYIz85qtFL6xtJsS7/WW7ZvopMECHQxrNjbJ43H31INMnswkGRO7
	QLIGku9qFJVIJzUD9jt6gdntQ/TGwWeyTZh0JodLzdlDV7d6yWcMf31wVC5ySOe2ZF0BMzj0457
	wfiafiIYywwvljr7ltGuUeOax7uRJ5jdsYZ2W2bVk7qX+M4T3XaJzJOb/GBqYXgd37Ks=
X-Gm-Gg: AYBFou0xvMCTAk/RuQKbgmVbBhU7TDb8o4lV31pRdSSEeLTdZ3JxmVLj5GJIfm2UfVd
	92Jxr8wUfw+WjrBastfuVma1MgTiqsZ1k6m2aj+XSjHTF1+ibYbKfT+7thzoajhLsIRPBHwsbaI
	NJttVzHKyRNDfbfR+Rbyj8F2EyVj1B3e7NKSn9lsFEaltLnEgXLNf8yFcVG6tc6q94aC+Gsx4wF
	kkUqgLsdvA2Y6wVerMEJ2/efB0sKu8/1ZRxk+RNLR0kMkyU5K/Q9DtwVFZgEplylsjDX71e/cnc
	kgGNv+P20uptN+uc4zcpT6df7AqWHiOQSAwlTZLS4kslDRIWbWp9xivziqUk0Q8ywwix6kWl58c
	CYZ7Y8gVn7nW4FsxcEDsNDRJ1bYh6dKCjBnE=
X-Received: by 2002:a17:90b:54d0:b0:3a7:9adb:2a18 with SMTP id 98e67ed59e1d1-3ad870a6e58mr927333a91.62.1792561970894;
        Tue, 20 Oct 2026 22:52:50 -0700 (PDT)
X-Received: by 2002:a17:90b:54d0:b0:3a7:9adb:2a18 with SMTP id 98e67ed59e1d1-3ad870a6e58mr927320a91.62.1792561970463;
        Tue, 20 Oct 2026 22:52:50 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad87b464b3sm1537488a91.8.2026.10.20.22.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:52:49 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:22:35 +0530
Subject: [PATCH v3] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
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
Message-Id: <20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACJT2GoC/4XNTQ6CMBAF4KuQrh3SFrDoynsYF/0ZpIm10mKDI
 dzdwsaNxs0kb/Lmm5lEDBYjORYzCZhstP6eQ7UriO7l/YpgTc6EU76ngtUwaO9ASQfGSUjOGsB
 phFZWylS60ZQiybePgJ2dNvd8ybm3cfThtb1JbN3+ExMDChq7VuhGKGH0ycdYDk95y3VX5kFWO
 PEPduD0F8aBQW2U6jqKjdDtF2xZljdEg6NoDgEAAA==
X-Change-ID: 20260714-qcom-bam-dma-vmid-ext-8a3bd3c5c00e
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792561965; l=2323;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=GKu3U/JCde6C7CFbeQ7u/luBX2KRqwiMUvd07abBmHw=;
 b=8UBo3+7w2W1I/hvoc27B4fN+nKagnrduc1WllIkWSNVUERVb7XKK+TZaQDH7/c6JfE/2lY4CI
 dHVWr4ZxD93BAHm+Z/eTYG1pBONsOmc09ykiGJbA9sav5pg4CGjJofK
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfX8qk8vxl+hzyJ
 DqnaO/FLaNONUnoo5OzQXi1muXr+Mic/JUJHWBLkDYa1x3eyx235f78yjpI9PeRa6ILvC3pR+/K
 BRAV8qZJAy88GvV5Pnp66vBe/KmrLnlebRylOzmoObmDOkeuRxMmtU/d+SyPaAVbPQJie9ojfPg
 CPqyCMZbtNCzLY862c+8ip66Wv6YtO9fNa7u+o6nXP0pEXizO0m+IyAolSKDTZjCNiYy8Bhffgl
 rtyMKZjC0K5ZW4ZOXnJVSUQeZxT8wO7Q0HjCzwcsZdkiI1MmPz9dQPCJGsvdwU/3/3rRzt6C9S1
 hcdrgMwQieNJhBAno+fk1xhRRZGyn+HeGrfttTtr4nERr4joAB6uHrzrp0Kp8isdE6HAhhcWT7c
 4BozI343YV6sJwfsQvZ5rncH5XN8hori9h+dcZoInU9zgq/lph2kId0WtI3btopLzahtsoQuPNj
 NZv8l3vw0vFEPq2IjIQ==
X-Proofpoint-GUID: Xo4WrljdRTzGvHdwcLImnH1FLmJqShtR
X-Proofpoint-ORIG-GUID: Xo4WrljdRTzGvHdwcLImnH1FLmJqShtR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfXyUfDzzN2A5qN
 zjDbwkj0mpnSp1XCaI6jbFHBwqUitsvczhcZP/EBmUeGtmZfk1MrVJHq/af6Wn0rcF1FvFJRV5w
 mOrvN+8SS7tqVJIEaxrfVm0vKf5n85E=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad85333 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_tQzNdYRXts5BJOlV6YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210022

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain, preventing it from accessing BAM descriptor FIFOs allocated from
arbitrary host memory.

Add an optional memory-region property to constrain DMA allocations made
by the BAM DMA controller to a restricted DMA pool. Access permissions
for the remote execution environment are managed separately.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v3:
- Drop the example changes (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com

Changes in v2:
- Replace the qcom,vmid property and BAM DMA driver SCM assignment with
  the standard memory-region restricted DMA pool mechanism.
- Rely on generic DMA handling to constrain descriptor FIFO allocations
  to the restricted pool.
- Drop the Shikra-specific BAM compatible and all BAM DMA driver changes.
- Drop Rob's Reviewed-by, as the binding was substantially redesigned.
- Link to v1: https://lore.kernel.org/r/20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com
---
 Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index e72adc172af102d8f400044ea0dc32db6b2365be..b7b348bf6ae2feba32ecaf17ca8696817a1ada4a 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -50,6 +50,13 @@ properties:
     minItems: 1
     maxItems: 7
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a reserved-memory node compatible with restricted-dma-pool.
+      The BAM DMA controller uses the pool for DMA allocations, including
+      channel descriptor FIFOs.
+
   num-channels:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:

---
base-commit: 2c455ddca7827ad8fa3a64fdbf5a60efb928b46a
change-id: 20260714-qcom-bam-dma-vmid-ext-8a3bd3c5c00e

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

