Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A0634F49F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751963; cv=none; b=W5mr/TuwGVhw1KclQMNhh5wUbAtoA/tdtmzD52NdmMfbv56Rs6/fZzwoXPz4nRejUyPWeV9z050KlxBjgv+fPAlscYvQVhXfXkYPx4gMg5sCeE+kF7Mq7ScGygu5//bVfEFDalU90eSr6dEi6NS4bo+Xb+12rPNKa+IAWrnKSCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751963; c=relaxed/simple;
	bh=AQp3ZzFGQIxMGUgev5a0WH6gQsFnNiiLrjLAVfK0jbo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CvCW9SrxhppCL2VHxYalTD2SsI+ct23JrHpk0TUK7SnkDULMKHoz1CAWffeGd6dRmzecg/vzd3RTwJIw2u62lm4vvUPW0bNuPruejIpGexMf3/egfEADFn1fyKvvbc4DyXNwrjcQBtjrunvE4c8QcbapW3H7xbbn4LqbTZPiIWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrVmYlJe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SNS+s+ry; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrVmYlJe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SNS+s+ry"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCIcn374901
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lVVXlwrDpraS1EuWGFKN4P
	A95ibIxivwprgpu4s411U=; b=PrVmYlJeQLnOGXbM/rVA7O300WFadHHcrCI7iL
	9YkZGSp5SMAO+JEZqFAc+hF6VnsytiYFtaFGdniysh/MSRmqQaLCaiAiA06umgbr
	6YELij2KdV+vta9Of2yCxcNADIAt2WeqX6lAXFz5Hqrrn8Qbr7cipcbkUJwV+aw9
	Za7cQKKGeWlITSxRJB6wdXQWCc8bwq2NuKGN0yBbPxNDjl/wOgRWaLwspeRoK3k8
	TwCbSSxrJ5NftYm7RIqXR+excb0/8wuqb8zAvVFfCFy9482wg1v2EBWrqP2qrZw8
	dKlGQcv7kdDMbYzlrBI0UsQj6q6CR6W55fAcaED11QmmpUEw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smxa2t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:45:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968dfff779so473935a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751959; x=1788356759; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lVVXlwrDpraS1EuWGFKN4PA95ibIxivwprgpu4s411U=;
        b=SNS+s+ryTqjG/jVTYgdG3MLqQZauzetoq8kAUlDC0hHNRw3GR7Lhk6o9XDYf+JXNSJ
         61Yyl26IDdKwIK+zkMAslzwYnHBaTEwvSsG93HQA/l/V5D/P0p6Wc69LansU/STJI7Ck
         ZHrl7s2pt+47c8eJHM3t2igolgn4K8UEe20li2/HbZJsi2mAuGktEVD+LTqRP5SneryM
         xUlEoWZUDWYKlY+VsA9LIWZKJRcW5Hd6EUVQfP/+nYq/dxgxGoq2Or7uacaYUOgmGBmi
         xVA+9vJhJ28bW/u5sbI1+ts8V46AexBgF49fvn8E702NKgzyuWv3FXJEK47o0FcZmkMw
         5I4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751959; x=1788356759;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lVVXlwrDpraS1EuWGFKN4PA95ibIxivwprgpu4s411U=;
        b=Uo6oLtAI3aD18NsFRMy4cQrsBX3QkxLYOE42NdWlzv5YuSrOhbw2XHyY41BKIh5F0G
         UZHbqrh32JK5MmVMSCYu2gOmf7aADLynKmkbVy9kktxW+dQD2oafxodc+LejVw9edtns
         uk6rI8s0ClrzD8p1lwoLA1H8G3TcB22zU1ynKa3qXID1lMJG4u6VTVywN91glrTg0AYk
         Yd4AYETnsllv7Zn5Yb24p6lOsLXuNu/k78A8gzwYzLsTT8GYOAPLWWD6+9nqeAUhL727
         f+r5Yud3voNdDrXRUKMSZT/7UvO2ZRzEXLjxnRwZwby1sbKCHCunyiofKbjtYxb2XaJw
         DUlg==
X-Forwarded-Encrypted: i=1; AHgh+RqcahuvayNetLok1eUp+CfZATQNvf6tmJv2yb1TRrVHSIaFmyNO56Otf5mTWou7JtHpWs7132XwiUT7HQY=@vger.kernel.org
X-Gm-Message-State: AFuF++lfjRl3OUFWVGi4sFFj6qFbYJMSqihD5WeeQ7HXCv+xB1019N2j
	GjpyL94oG24jsE1a0IjAo2/6m1bxocfVWYxifw26RYwJ/yOLFJkEHxYtAeA7kROQ1F7N6tQPmVY
	MwFN7z3IQ3h4RoeP2TivFW8ODN57Hsc0IE7uoANVUm0bY3aEqBAtKnjoqxo7H+8HRvSQ=
X-Gm-Gg: AR+sD10EKsni5tiLcVodDBOAY0gVFlfwPNfkxv+4zUunmytSr3PfVYP0HG3SjxC0k2I
	6W7T+EaeIyqrsEYF/lP+1ImS0Yhz6yF5PI2RMgfbffMn/hc22HtAdMIW/olKyw1s1KwFSiO1y2s
	8XeNXx14K6m1J1TvFzWeqc7w2wbr7DTNzdoHcVjXPsS/brnU4Xrs0Bu1wiMfbNAmHxWk6IbSQ8n
	AdiHmhdXzjzBvrQPtCrqNR3Nf3/mx4E9sTkcPNBWMKtlhu2JmIBVoe1IBcr49REv1gM8xCnjXgS
	9inqNHfydvSsyrhakPtGrRQMw69mc1/V/qthywOTrxVwCyY1wffigo0ZxyS/7w0FM6mhrY5M3d6
	xh5yJKwbQVSmUZwTdINbMUmHXr0Hhgo/mIA==
X-Received: by 2002:a17:90b:4d81:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-3966d8e8063mr7894136a91.9.1787751958558;
        Wed, 26 Aug 2026 06:45:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4d81:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-3966d8e8063mr7894064a91.9.1787751957965;
        Wed, 26 Aug 2026 06:45:57 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b64c48sm8179696a91.8.2026.08.26.06.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:45:57 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH 0/6] misc: fastrpc: Add extended IOVA mapping support
Date: Wed, 26 Aug 2026 19:15:42 +0530
Message-Id: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAbujmoC/02OSQ6DMBAEv4LmHEvDYjPmKxEHLxPiA0tsQEiIv
 4fAJcdqqUu1Q+IYOEGT7RB5DSmMwwn5IwP3NkPHIviTocBCIRVK8Dbz4NmL3kxTGDqhLZJFV+Z
 IHs7bFPkVtkv5bG+O/FlO83yPYE1i4ca+D3OTGapQsXJoa106xpoIc62opLJ2FZKUVkqtJfwXN
 dnVo1ALv0wicfp1J8GmMM4Yl2tdNWsF7XF8ATmbigDiAAAA
X-Change-ID: 20260826-extended-mapping-9b08b0c3108d
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787751952; l=3128;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=AQp3ZzFGQIxMGUgev5a0WH6gQsFnNiiLrjLAVfK0jbo=;
 b=kM2egXYF+WCbAy4qPAAH2BpmOef0OYYIbft1VAzscD98XzphvisNkTKE7EB3aJ4oIsxy3dGGO
 2odqsO3elrGBd6HghJdh7est9z974QicZKu7Ddtj69xeYsaSby1tmy0
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8eee17 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jGj642yAPOClK7eN77YA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: NXg0z-V7wgKGfiUjoEZX_rVmfLAmzFXB
X-Proofpoint-ORIG-GUID: NXg0z-V7wgKGfiUjoEZX_rVmfLAmzFXB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfX8SY3UCB2ntol
 FQfYwEZstBmT18ehXqVyrM0FPW4UQzm6ruZYZ9cFg1RYaM8iZ/0q/QKJCWHFoYNaQtdVKr6HJ+S
 GiazND48vfQj9kuv5Z437+T9fpke/3wYD1zr7qqIyUCv4z5YS8csZGeX0ewP7pGnDXsMGnFxup5
 nzxZS21H8qiXb6UD384o/q7uaHfPwzXroRM2RFNjlTDsa2Nt/RVGp2wd4KhcHju1q58u2u4nLNf
 EX9yMbBU7747l22/6+mnKiRL57Yki/ghIKj8zCRCitG07JmylpcruN5JQFjmnUXrg6mopp2ieM7
 I0DZNHrxyBcihh4K75CB4ZeFnymAHXMc2UZDCbaUIyRgLpkVIFTpQOdciGRXEH7XYY0pZfQ5GBI
 KjjUe3YUo4FKxznpIP9MGZpqJZA/k6yvUFpNSwyZm/dRK9Ykz9lWEHIjQlAkYX4EtQ4x35bmAXX
 UvtwoZAkhyLUSEHuL7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfXwHTuxFD1CwLU
 a6j3HJ6mHqO6Ow+0F/50zerz88mgZg0SiFryK+TIQb3zYMLQTX2ZvBRziAeSeu/LI27HgW00FEC
 XaxVZLWEZF/ZcXHExVhQCpBVmhgfFz4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260113

FastRPC context banks on kaanapali and glymur are limited to a 34-bit
IOVA window. Large compute workloads such as LLM inference on the
CDSP require mapping buffers that exceed this range. Dedicated extended
context banks exist in hardware but were unused by the driver.

This series wires up end-to-end support for extended IOVA mapping:

- The DT binding gains a memory-region property for context bank nodes.
  It points to a reserved-memory node whose iommu-addresses blocks the
  lower IOVA range, pushing allocations into the extended address space.
  The driver uses the presence of this property to identify the context
  bank as an extended mapping bank. The binding also relaxes
  #address-cells and #size-cells constraints to accommodate the 64-bit
  values required by iommu-addresses.

- The driver is extended to read the correct SID from multi-cell reg
  properties, which are needed on platforms that use #address-cells = <2>
  on the fastrpc node.

- kaanapali and glymur are updated to add a fastrpc_far_region node
  blocking the lower 16 GB IOVA range and link the dedicated CDSP
  compute context bank to it via memory-region.

- Extended context banks are shared across all open sessions and carry
  a 40-bit DMA mask. They are kept in a separate cctx->ext_cb[] array
  rather than the normal session[] pool to avoid mixing exclusively-owned
  and shared resources.

- Two new UAPI flags (FASTRPC_MAP_FD_EXTENDED and
  FASTRPC_MAP_FD_DELAYED_EXTENDED) allow userspace to request extended
  mapping. When set, fastrpc_map_attach() iterates cctx->ext_cb[] and
  retries on -ENOMEM, falling over to the next extended CB if one
  exhausts its IOVA space. The SID offset is corrected per-CB so the
  IOVA forwarded to the DSP is valid.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Vinayak Katoch (6):
      dt-bindings: misc: fastrpc: Add memory-region property for context bank
      misc: fastrpc: Handle multi-cell reg in context bank probe
      arm64: dts: qcom: kaanapali: Add CDSP FastRPC extended context bank
      arm64: dts: qcom: glymur: Add CDSP FastRPC extended context bank
      misc: fastrpc: Add extended context bank support
      misc: fastrpc: Add UAPI flags for extended IOVA mapping

 .../devicetree/bindings/misc/qcom,fastrpc.yaml     |  12 ++-
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  37 ++++---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  35 ++++---
 drivers/misc/fastrpc.c                             | 114 ++++++++++++++++++---
 include/uapi/misc/fastrpc.h                        |   7 ++
 5 files changed, 159 insertions(+), 46 deletions(-)
---
base-commit: a8406e6c0b793ce0788019683837c40855b55995
change-id: 20260826-extended-mapping-9b08b0c3108d
prerequisite-change-id: 20260609-dup-sessions-ea2acaac1994:v4
prerequisite-patch-id: 15f76eb917232e683ce9271fb3f0f465a4d60abe
prerequisite-patch-id: f225961fa033cae9dce14a906752e1232b052290
prerequisite-patch-id: da0a3d55397a522ea4b77769e387df9faea8e024

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

