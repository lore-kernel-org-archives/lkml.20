Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884303749E1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789005075; cv=none; b=mfZk2Zk6b7TGsy316L13GhPQF5/gHP6NFbcymooVqPRKOZbkdi9glIs51Lkznibm2vH6nU2g2FFbMYvpfBg0eHxpLyVqvWaEWzU8XM+D+jwta+AU0Mf326UVYSCEXsAI2lNFiIpy4s5WSpl4xHYAzt/JCFDp2k5anHRVrEJirx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789005075; c=relaxed/simple;
	bh=ynT43ZlYjgcPbqe8Z2Sitet6cthgPvBbmZ1TJ8jAs90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tI+oZD01J9Pmoa2iQCKMEB8ixn7eJr3izAe5bMLCsodRHDFz31z3H40h0gTqm1Sv+7XYBhHVhq6LZFI0jiWgbrmbaNklWhQDbIcuYh+jlNB29gMXsVxs6+j1UwyL70VOVEhiaeVih9OuXeg6goYtgGvPGAcGcq3zNBgbr5pqdpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+uxZgmM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdFwU8tk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+uxZgmM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdFwU8tk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1lc1X3199108
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6p/ZNsYDwIyedUSRxVruTRQWYBLvpIq5hDQ1FGef1BM=; b=Z+uxZgmMztw7TZch
	MH/m1oP9vKWT2fWldgHsAt1dzxYUc01Pb4ol+aCd1EHwckuzSiAR2UYA6UF+nDeE
	qdwhOwHCFL12DvloklDWgSRTZlZCDyTuD6rG9RUENoJlkwnbdcbvk6XCny930uQv
	z2eTcuF/a8Z/1lsTic/WX3w5jbbCHd5S0dR15iwUYjaAiXsnAlg5cD7NJCnxxZ/u
	dBC5WhmBXkkm+8WMOo/hamq2tUPg5JH6PEDRBqalPN0xyHyK7WlFxx7rwhepT0bD
	HpG5651KRLoQtFWC+2TZEihXHwJc3FEPLqfh48YnjVG5m01FG5LAvk75cGdl+Pnn
	UXYjCg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydshkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:51:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396901263b6so11929592a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789005071; x=1789609871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6p/ZNsYDwIyedUSRxVruTRQWYBLvpIq5hDQ1FGef1BM=;
        b=fdFwU8tkaVlfkwXlwZryzWhu67PicCDrG6kzrbzlTsnz2YNyhTCn8KUo8YMgr2Ge+J
         IM90jttQDMY1P8zZkco2WGmyDlyxIN5gjRDoNoL5bHF5Q/80BwmBL+0MNArjZH8/doyB
         GXHpftejuHp1yUWQKyzFU3GvlOkRtLWdY4M6y6uEHd6AWCPQ2ZLBqV100ROV56reSnz2
         7lgogbD2ddkuJOTbAUZp37SC+xAGEluLmrbYzMm6DAjVS2068hHFwBHrzeu+pLeUiGZL
         O49kw9zwNQmqj8XELOUK+Nv94M9bupunDMK3ZAiGh1E99kGy64hClNsMO+AvjwGNTmFD
         90zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789005071; x=1789609871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6p/ZNsYDwIyedUSRxVruTRQWYBLvpIq5hDQ1FGef1BM=;
        b=lPQmyS1p5ebfTqjILWwlxL56Lc9dRUC2T5lyWPE1j4IDjeUW8lAwNAy+BLHhHdbrTC
         fqoAI8c46D45qhZ7F6qobl2EGDRM8WaGdocEqB5JEWKYqZUt0yuKJgD+Tupn/ACnZm39
         75QXfR+e26kg1JD9O14mYOtSJKTun/aINXgc/Q2pd8SX25RR9guqjjaNwR2zriAzGliI
         OWCw8nWfoMqTfhKA7IH0Frl5n5u+hv6L8g50T21FvzXzStCk4+tjYMFV38nqliqn3YEr
         YPShWfTRpXblxvZCcdzf7f7LaR/q9PugS5KXF2v/SgRxOV03xF2HFkPQYtFlXhd9wgS/
         af0w==
X-Forwarded-Encrypted: i=1; AKwUvByyRfRdt98K0ZrBsYvHBpL0OVV3/8FDjVSqVUkQ/XQIX+4ge1wXBCv7YWi2IJHMOILDHOi/KlH/vqY1128=@vger.kernel.org
X-Gm-Message-State: AFuF++nCmmUJuRSwf8SePlBajmQl10hF9Ks5YkCFp7qLD5/voYjXPqfZ
	9gxhUtT5MpIPCruE425BSBcAASobHfu4Rwnq6VzqFUbpgGb19LDTv145da+rhBGdbXNyon+I7km
	ANYFBFWtI4dgWN7n0kf4Nmhikl+av3z3mgeNBtMdFFKF0tSYP05Q0BbirSGyGufXtcUY=
X-Gm-Gg: AYBFou24NKwoSzl9GSz2UH4I/ZaPlSy7vnv3QWmsh+D3p1Q9dULIIkbyj+CIj/tH/9s
	WpjcE1ta2xR3PCN53qAwToI1TDZbt+43cfSSK+s+fjV/XU47rWRXIeqDUn9GzHwVADuMQPgflQX
	8GPKAZG/VeytXdt0opw6WKyy+pBbDifhmS/EhZQXaFY1ZDDV3eXxcdFIhus9qPLFBL7AkNahJFe
	4ZEHtbmfL2FiYHIiQ4Z8n3tnPf+c1Gng+raUagCzOkJ0lrH6ZnGxJifbGMXQzubNZOTN0Nb154W
	QbG2Ak4YKpqr/Wv+ygufPryNMh6KjeIuwBIUt6ZqwB9Mm6qJjsvMYuFlxWhfFdmQ/rkWf2Yhq/D
	sbE5JGqLxyct/itmzeAreShC5xVT+MAnGHXdvfxqFNyMII+ayVbZe
X-Received: by 2002:a17:90b:4d84:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39bac138257mr13113620a91.1.1789005070531;
        Wed, 09 Sep 2026 18:51:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4d84:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39bac138257mr13113546a91.1.1789005070066;
        Wed, 09 Sep 2026 18:51:10 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm47446234eec.12.2026.09.09.18.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:51:09 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 18:51:01 -0700
Subject: [PATCH v4 5/5] ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on
 16K+ page kernels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-16k_offload_v1_b4-v4-5-f24a86617597@oss.qualcomm.com>
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
In-Reply-To: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa20d0f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LmYBifCbusCXSjBzSPcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: GJnacwIieDFRlLGWvULl2W4Y66KJ17qU
X-Proofpoint-ORIG-GUID: GJnacwIieDFRlLGWvULl2W4Y66KJ17qU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX+7KE1k6xvL4C
 OMBn9ry9YqZhRN8JOxGRd2YXn6bEHr0gi2SfwV/VvBBfhj3//ZqZ6I3WRTJhQhnNY7Up2yUgrjO
 XyQjUi3P1Elsg5f+EE7WhkZFtul/ovI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX4ULqOnepWuyt
 4bg5EM8Of3jOjINisy4/Ejp+a6ATFL7WSVPlVihKze4fz2Q2ssfN1PASl7xvU8U+6lS9hgroma7
 gABe1XzngniCOKU3Lhz281/oo1DsZy9dq+rCHo+FCjU5vCGSbRdKoAW/8yK+0H+LTxLWfo/5hS4
 aD8FAyovUtxed/CC8RMxEsFYomXrezF/uO7YI2GZoMK5ocmqDNqHpf9EBAW+AO+tTqK6QDgGXvb
 d5Q0y1jFRlJV0DB0k2TeNYjwmx02f3RAfifyhkEGbGwt0uFbMZAxbB6ikep9HOH8pxInTHB+Uzs
 IWsxHabMWY9/CDQLUxqPc6J5UT+mKHSOFlylIVx5EqbUXSzJJHHik62YOQ8O236paNo94oPfov3
 rGBaATFaVZnDLjr+QTpELFdJ5V2IsytOtEhl0UDmX4gnYE0y4b4LDK59fy4AIt2sCnDGK9HOMiA
 g7qpnF8Ay30j+I7qsog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100018

TRB_SEGMENT_SIZE is hardcoded to 4096 bytes, but on kernels built with
a larger PAGE_SIZE (e.g. 16K or 64K page arches) the IOMMU still maps
and unmaps in units of PAGE_SIZE. A ring segment's physical page can
therefore start at a non-page-aligned offset relative to the segment
itself, and the DMA address handed back for the ring
(sg_dma_address()) carries that same intra-page offset.

Add that offset back onto the mapped iova before sending it to the
ADSP over QMI, so the reported address resolves to the start of the
segment rather than the start of its containing page, and report the
true TRB_SEGMENT_SIZE instead of PAGE_SIZE as the ring size.

This broke the reverse direction: recovering the raw, page-aligned
iova for iommu_unmap() by masking off the low PAGE_SIZE bits of the
QMI-reported iova only works if that iova happens to already be
page-aligned before the offset was added, which is not guaranteed.
Add RING_IOVA_BASE(), which instead subtracts the exact offset that
was added at setup time, and use it for both the cached
data/sync_xfer_ring_va and the drop_sync_ep/drop_data_ep unmap error
paths.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index bb5a0d54cd72..2e6397f9cab6 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -66,6 +66,12 @@
 
 #define MAX_XFER_BUFF_LEN (24 * PAGE_SIZE)
 
+/* recover the raw xfer ring iova by subtracting the intra-page offset added at setup */
+static inline u64 ring_iova_base(struct mem_info_v01 mem)
+{
+	return IOVA_MASK(mem.iova) - (mem.dma & ~PAGE_MASK);
+}
+
 struct iova_info {
 	struct list_head list;
 	unsigned long start_iova;
@@ -1241,8 +1247,10 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 		goto clear_pa;
 	}
 
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
-	mem_info->size = PAGE_SIZE;
+	/* add intra-page offset so DSP IOVA resolves to the correct 4K slot */
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova + (mem_info->dma & ~PAGE_MASK),
+					     uaudio_qdev->data->sid);
+	mem_info->size = TRB_SEGMENT_SIZE;
 
 	return 0;
 
@@ -1311,8 +1319,10 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 		goto clear_pa;
 	}
 
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
-	mem_info->size = PAGE_SIZE;
+	/* add intra-page offset so DSP IOVA resolves to the correct 4K slot */
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova + (mem_info->dma & ~PAGE_MASK),
+					     uaudio_qdev->data->sid);
+	mem_info->size = TRB_SEGMENT_SIZE;
 
 	return 0;
 
@@ -1551,10 +1561,10 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 
 	/* cache intf specific info to use it for unmap and free xfer buf */
 	uadev[card_num].info[info_idx].data_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_data.iova);
+					ring_iova_base(resp->xhci_mem_info.tr_data);
 	uadev[card_num].info[info_idx].data_xfer_ring_size = PAGE_SIZE;
 	uadev[card_num].info[info_idx].sync_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_sync.iova);
+					ring_iova_base(resp->xhci_mem_info.tr_sync);
 	uadev[card_num].info[info_idx].sync_xfer_ring_size = PAGE_SIZE;
 	uadev[card_num].info[info_idx].xfer_buf_iova =
 					IOVA_MASK(resp->xhci_mem_info.xfer_buff.iova);
@@ -1589,13 +1599,14 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 drop_sync_ep:
 	if (subs->sync_endpoint) {
 		uaudio_iommu_unmap(MEM_XFER_RING,
-				   IOVA_MASK(resp->xhci_mem_info.tr_sync.iova),
+				   ring_iova_base(resp->xhci_mem_info.tr_sync),
 				   PAGE_SIZE, PAGE_SIZE);
 		xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->sync_endpoint->pipe));
 	}
 drop_data_ep:
-	uaudio_iommu_unmap(MEM_XFER_RING, IOVA_MASK(resp->xhci_mem_info.tr_data.iova),
+	uaudio_iommu_unmap(MEM_XFER_RING,
+			   ring_iova_base(resp->xhci_mem_info.tr_data),
 			   PAGE_SIZE, PAGE_SIZE);
 	xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->data_endpoint->pipe));

-- 
2.34.1

