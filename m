Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BAD47887B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807635; cv=none; b=TbfPSxXO588lO903KhbgHCW2ZvgY9McciI9rMwnH8PO5VY8/CPvD5fNwmg0FFGV2lPlw7cOvsT7LuIHVBbYLbWz73X3tW0s0UkNufCa0USy54qutzjrBPNqc/wxPpR5tA7jh/g5+jihtnxm708P3zz2Z9GuUkocFVMwlXpT5NB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807635; c=relaxed/simple;
	bh=+0cwDb9AxHxj3ozcBASMvKd1PUtKKmJ1ROtJdCUN8bI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdHtQzSUZZA5wpGn3MKoB9RZdM0Rc3UkdPEdHy/pATnlm1dz/4Dqd9CHu2W9+su8YTq5forVAIwEqQ9uY0+uvYxq1o+kNe0x+w9aCHkKuP0aEuXeYTcHw0/oNaRlRwkFztxTYVcMxTmkCIQ9CrjqsbeI5WOGc0ZAJ4Ns6W4lrvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WE4VHMk6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1LjCK4F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WE4VHMk6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1LjCK4F"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0BNn2275899
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3xSQ8Hop+s47RdDw/qQvt2kfapWwwDpBjw3tYBzfh4o=; b=WE4VHMk6CqM4fizg
	nyRItWpeOLOooHKG39AY09lku3FgiMP3RciMkUD4mdBQd95YKjZ9dmL9GWCuHpWB
	REk+b/sTNX407Nf7E1wjRnuTRqYy3vjA08nRMP23QbIirPQzoIPz97LAyJJ79CUE
	fm5CaeAThW12byM/hdW6rlykM5iWLx3A+KDNXRvs4sGE1+rWE06DDsRCxg01SWNt
	kDyFBt/HVp2iHt2b75MShHmFt/XQOdcE6lsOCvDZAw6/yUfLKXhEMW2cdLKgUPeH
	fYws3U7QykZBWIVgBggPg0yCUV7uZdrFoJ+DXnOi6iYxfulZ56Yi6o+ei8slCLFU
	+RQb8A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq193d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:20:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab341816f6so1664218a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807633; x=1792412433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xSQ8Hop+s47RdDw/qQvt2kfapWwwDpBjw3tYBzfh4o=;
        b=E1LjCK4FBRmGxXq/dkcRGMGb7OCl+51rznJtuNCmNN+ZfNbyNlmYOeg+G2WxR1rSl9
         MHnM6B531574c4yte5A7HgL2HcqEL9TLTWBBlo4jLa+42qQtyflruiySNdKy6Gdy2aRB
         kY5Wd11LxsLHlGzb1ZDaYfoM8r1K2cXYmPHQXV21v7ntPe5oIeGkE7kdQ8LkdpsA+wBo
         UUBQr38ajIDQlr3L1cXc5DiKw6sAJ/sxGipzbdZ67F5fh6h6eaYw6fNL6iygHi9PIGtG
         i6CiV2idEQP3bVW1KRTa5v5BXU4stL3M2dXHxrb3UOctNtg8cOnfgobRC2PIHE8oUCJ/
         vvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807633; x=1792412433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3xSQ8Hop+s47RdDw/qQvt2kfapWwwDpBjw3tYBzfh4o=;
        b=NhNtfNJWpF0joYgpJVCsKyh7kPKm8AEKFSRlF/xVC4ahHjqk0I0lLtMQFMcKX+hSjI
         RBj5K7ulGKDhkKVnh7n3JAHKAkilEFy8pKLoi62PiEORP8UF1JfC7ijug4fbd0qU8uAF
         Qt/g+9VwiQvn+KYCjrc9SbEKnALQ2TIYgFTiW0wBYcPgvQvsURsymDt8t5aYslRCXxZd
         gYJ0dYuXO01ggbzpzY6yUlM7+YeGeJtdqly0WI0AJ6c3LcLTrwtOQl2ilNg3r4sLumGJ
         dXr5Cg6L3infI1dKquGo9uNLDUcDKr2ATjcANgKieuUDuNLCI6sK55qBk0hff2KjYP5J
         e3yg==
X-Forwarded-Encrypted: i=1; AKwUvBzc6OS/yHymjnTbGcE6XW445TV5Xcw0wUglSxc9ZytkCBi/NIs/5ysNDHE97KeyEhrYnkGE/m76LSn5seo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnnBEbEtzx1bJ5uI98qdLYdFqLZ9fyFD6V9AjeUepIS+gtqrMB
	29Ny4171FAcdEd+pxVkkyEQd2ZoopTz89MXFr2KaZcDani0+8TMgV45fDU1+wueXPUontcS/pOm
	DS9E845NVO1q9RA14bTWk++I1lJy36avhJxdhQvcxK/Jh2cK3typ4T0n9z4F7WTAduoI=
X-Gm-Gg: AYBFou2DUFZD2R4FXQpAEXAJKKBzsV7Pf7ClTtT18Cr7+Dy2sihZqOnXex3H5Ld7Li2
	vPDmOK4jPlQM4q1IIDXVF5vkDyKknLsRMuaNHwfyBoS1djY6BOLxtwy7C/0K7hcwUqSNQC2FHGx
	s57m+VtbKf1lBlE+3W6IN0F/JWBNxnfcHXxt+UGE/aNZbQtptFoGv2x40yDy7cPDG5id8SFaCEp
	uzF5dCKD6AlCiHJpgZIWLAnQX0LGkrvaL9AgA35eYGp2LFL+bOntsZbpOohIyw0QPCoafrCNqen
	ToNeMAQubLE8hyjP45lPoqo7KRxhZuEGiPPTeZFPwEfeP2Cn8wkPfA3NKd3oVuNrZK90coBq4ts
	bl4tGXQE/vqesIx+ew8Kvj9tIDhHM91s97jCQ
X-Received: by 2002:a17:90b:224c:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3ab3a0ef48emr6979264a91.0.1791807633104;
        Mon, 12 Oct 2026 05:20:33 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3ab3a0ef48emr6979241a91.0.1791807632581;
        Mon, 12 Oct 2026 05:20:32 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9638fsm15935932a91.3.2026.10.12.05.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:20:32 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:50:21 +0530
Subject: [PATCH 1/2] soc: qcom: geni-se: Split IRQ status clearing from
 mode selection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-cache-se-mode-v1-1-22945ed0da29@oss.qualcomm.com>
References: <20261012-cache-se-mode-v1-0-22945ed0da29@oss.qualcomm.com>
In-Reply-To: <20261012-cache-se-mode-v1-0-22945ed0da29@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791807626; l=1430;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=+0cwDb9AxHxj3ozcBASMvKd1PUtKKmJ1ROtJdCUN8bI=;
 b=7yJ5uQ5A/fZFgdklQJixVBGvjPdqlBDq6rBAk3SngjehTv9h/8I9fz9ybLywOhhSs33hQXI3v
 42bSw1Z7cE0DwBRmVCC23P/8oAKeaa/ntzRNwKRcHxptYRpa4O/io/U
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accd091 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7I5-0i5XgEyiRPbWXUIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX5bbUH05BmOXs
 Mm1RXVxLvKbj72A3NRG0QHtGGDbLA/KEI7b3fG8fK1KvqpcrzbDTPI7wngEkkTzblbjnnbXCljU
 N2ck4awTTJBHsqbHEVdiRxFxb+Bfgd8=
X-Proofpoint-GUID: EqPh0ksdxSGjCLP1TX6lKVNZ5lBA49et
X-Proofpoint-ORIG-GUID: EqPh0ksdxSGjCLP1TX6lKVNZ5lBA49et
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX/EvdTQNqy5pz
 u47csDavQMNrh9EojBcw/U/dcJuHrCQG79f0jEKG2PzyAM2KFhde0fhjXIzxNT0UkBeSwOjatzr
 B7j7ptc+RNxKqX7tZ7m13BOkMmpbSx2y40fT5sTlBro4xs+IMfo1+e9ga8eiQeabhzH+sM3OIlX
 /JdxDtW7RQmu2p7/ycCEW4PMpBShjD005EV58KtRjMedLqrbtwu2pPh1UHVSF/dQ3V3JbZeERAR
 48LWpgdYUCGpEg865NIsMW62ytweHqHjL+v22j8tVl7hf1ZD+SwVLmEK3+arSfgE5L7QFw4udul
 o+GnZhbrBg6+EQLFS7rr/sT1lpba7A0DWzOEbgizDnZ+lwQv6RPFsi4eX983X78tOdgE4/D9sHk
 09CuPoj6UBQwthdQ5BI/rC7ARJOlvEDV+/GXmTFSmHWtMEXSEtVf3LNyowC2z0PmgPTXzWFF3mS
 ITnYv930PQ15RP4wDUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

geni_se_irq_clear() both clears pending interrupt status and updates
mode-dependent event and IRQ enables. Split out the status-only operation
so cached mode selections can discard stale transfer completion status
without disabling GSI event routing.

No functional change.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 074087c592cc..311046544b4c 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -342,13 +342,18 @@ static void geni_se_io_init(void __iomem *base)
 	writel_relaxed(FORCE_DEFAULT, base + GENI_FORCE_DEFAULT_REG);
 }
 
-static void geni_se_irq_clear(struct geni_se *se)
+static void geni_se_clear_irq_status(struct geni_se *se)
 {
-	writel_relaxed(0, se->base + SE_GSI_EVENT_EN);
 	writel_relaxed(0xffffffff, se->base + SE_GENI_M_IRQ_CLEAR);
 	writel_relaxed(0xffffffff, se->base + SE_GENI_S_IRQ_CLEAR);
 	writel_relaxed(0xffffffff, se->base + SE_DMA_TX_IRQ_CLR);
 	writel_relaxed(0xffffffff, se->base + SE_DMA_RX_IRQ_CLR);
+}
+
+static void geni_se_irq_clear(struct geni_se *se)
+{
+	writel_relaxed(0, se->base + SE_GSI_EVENT_EN);
+	geni_se_clear_irq_status(se);
 	writel_relaxed(0xffffffff, se->base + SE_IRQ_EN);
 }
 

-- 
2.34.1

