Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1DDC2EA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505095; cv=none; b=IQCGVYvSUBLlNCE6C0wKjY/waMuiy8/4aIvLs4xGu5JWgETctJsbtRWL/labTJe6yU3fOD3DRvTRkBgJt7enaEtPsq3XGSPOyJ29S9uGapGdo1gXq6E5ZXsHurGHT/Q2fXLGrUAGl4aqpfKnyyC64S/jONpWaQb4rN6IIJOUk+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505095; c=relaxed/simple;
	bh=ZFeil9OwyvB+ttevEGeLJHHBev8PjDjG10AnscfM4Ow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tjeyPLwmmtx2zHM5hXqApnf6GHFhmPCVhkKh1TUnTAlz99QxlA+XM0JH/lQNW7g8CwsT6sDBZyspM1kuurPK3p00JpYsSm+YGnIdK0IJOfCNRmooZd9N08yrbpnMtZDPSpRZgikgHkIpjFETMmPhe25i1WwDvRA9L07iNffislo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=il67v3Ue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TqP7ATi9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="il67v3Ue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TqP7ATi9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684635wu3227511
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 06:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NLwSipIlwt4Uh35Xbe9B2buRpk0lXStHU+U69Bwrflg=; b=il67v3Ue4qQ5DvXi
	hNWbTorQL6HNxFFZRiBkUyztCfJmfLGiYoLHTHZAHPwk7yJeaVfdbuDjkmrjBf5x
	qoeQYgpCfE5zEBqMxZ4qWk+5QU42faVpl9DuEIOsCX73q+zbgIFqogC1zXrHBtjW
	/qqH3ceNPBsSpjoVcEiLJ3B1UuX9TyZw0A1o6iKuUu77TLEMw/xpb8Vb3GSCEzmj
	gA9WnXkxQvw4VH3E2JP/xbT2Hb9g2xQazdMAY2+3W3pPzRX3uqRSp2bNnx5LBmY9
	sXTxtU3UXvq7YKyKgll6Jg/2lN2jZ/O85Ghq4FWHE56Lz+BCga7j6As2gdhU2m2a
	ck/ZlQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfhc9sjnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:58:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dff6253so20903175ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 23:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788505089; x=1789109889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLwSipIlwt4Uh35Xbe9B2buRpk0lXStHU+U69Bwrflg=;
        b=TqP7ATi95xRKdqn6Bb+x64j5JWXxk6v7LuhoYSDqf2oCh4GMPzqLCZxX0NoHhBJl+Z
         oYMMQDWYyWgsxMkRstsTDPLNiDxwFlnNDnieESqEKhJF4k4U6yCYpW6fSw0GJbCQVsZJ
         n5kGG2MruW1zOXnMTJ+Dlkeil4fmSRDuxf3BvFqnAk8Hn3S13afXZq+sNPSay5C93u0I
         tegT0ei8axmBWM+jzHc/3FTTT4qxAEmJ+n+X+pyheKbcHbos+WF4hommZQ/e46/pD2pH
         UflIlcXDO79EvwTIWuN4sSOitCBzA4O1QbtWgmR3UthiQE/uUvBB6FhDmZ2ybeWTUlg2
         wkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788505089; x=1789109889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLwSipIlwt4Uh35Xbe9B2buRpk0lXStHU+U69Bwrflg=;
        b=G4K6vYPUMO8jm6clLi7OCwDK0thGIr+rjKua7nAk6RybHGW/oafFwb0l1O9P4XQ3qc
         cg83cKAZFxtxAaBk+xZImhW//flA3RSmG8JWY/dOaW9vpoIgleW7YaoodlEA2ZLfZNAT
         L2DjwSxvF2LFb9TBX5GbqZYGrL/UbbEcGzrPTdPQQLNY86rPKI3jJwvH0dOiVyRe6evw
         bTlfEm2gpwx4NJoCEf4/dqw8kF70xANm3zNTdTIjJidwAEYM6c7myWxQr3k57+V9kKN7
         Cx/ByLzN2iZ/opdVhlHUcDzW8Mk0XoF5NkhkCOOdikWnXhqgSfiV1EuU1oHb/rmxrwmN
         9VMw==
X-Forwarded-Encrypted: i=1; AKwUvBzzdpyBbil82f9DjjLAByC62Vh3IIS3gElCOYTypba7knmbMhEhhUUqxT4URdgcLHhldiA7i9fctGvx9Ds=@vger.kernel.org
X-Gm-Message-State: AFuF++nEq4Cr6iY4B/jZGWOV5vWXZtT0ghSJ2RQj2BRTkAzicxskX5jW
	PqlW0Cyb9ThJ+PYsT2clCFAAeSnW3+89yhDs5JJBEO4QN+7NJruoqtlb6Jpl4wAb/vODlU6v77h
	RLizF2dnge00W47EAnBZsL6vgZ4IEl8Ybi+sOmpJ1Bbt4S5fJo/iJdmNnS34UiwSqSAP4KLX8VD
	0=
X-Gm-Gg: AYBFou3VtiesIAqOZhTiGPdIVCfzdG/VW85FrVYX/TFRwnbqh2VljPfyFQvkf8a6qsu
	8nm8QSGis5igXtmSHj8rRsKkgKw3nQMsc8vQJKyJPnGyGDdvLv/rTpt+ocels6W846het2cDnxO
	5vrufz73Gkk+XDj5Ql2LXr2wJ67LXuc0d+jYCVqLyORWEwtA0eb16xMm+uyBftrlTVWYnAY79eT
	YO9wg5uB/0F36x+shubLPuSKg3L9qFbJexKj3igEWTxDSBrzhGkQBuNvRUS7jmwjmwy4cVTbg6B
	qNDJb7h032ROvlyE4QgpHtxY7lbG9fnl9SCLXTCEbGrfTmOTMhMHG41ud9LfjgkC4tJovR/4geg
	wIEh7BZfhtCSIDhd71mANLyPWFaDlm3YAAMPNpSWyLSQ4DKnfeDHu
X-Received: by 2002:a17:90b:2249:b0:396:d28e:b53 with SMTP id 98e67ed59e1d1-39b0865350amr12594500a91.20.1788505089276;
        Thu, 03 Sep 2026 23:58:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2249:b0:396:d28e:b53 with SMTP id 98e67ed59e1d1-39b0865350amr12594444a91.20.1788505088769;
        Thu, 03 Sep 2026 23:58:08 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm4760900eec.2.2026.09.03.23.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:58:08 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 23:57:53 -0700
Subject: [PATCH v3 4/4] ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on
 16K+ page kernels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-16k_offload_v1_b4-v3-4-135928dc2408@oss.qualcomm.com>
References: <20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com>
In-Reply-To: <20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=afdRWxot c=1 sm=1 tr=0 ts=6a9a6c02 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4X7XonqLFEBPzPt-dYYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2MyBTYWx0ZWRfX7QutEpZ3uVKC
 HCC7FokS8Hdpx0+VIPI+S0vDzKu0qA5eFlQuad2qIFgG6QWlprCGS0BWo7SJ9V+QS5fQ5xweNqL
 lnsreO0L3PlSmnlg6WYw1cvs0JPdQ1brSPSYpVfIPX72zZ7uIkXi1CjcvXMWMhUvHGAYkhMq/bI
 P1Ibbo/hcgEe3WDZtpAdJBUNNBIJ+odSJIF3NMJfn89tduGuTLATNC3D93mWyWWM2hzEKp+E6FF
 h7U7CUTJk8JOg50qw5U4owFYaGaU7iy6jVJ4QG37dfGc9sQ9pHpQHgJ88hFQ/U7Ki6ltNaY0tFE
 we9ebswmDrGIkkz2RW3HGAJ42+tD7mfvTt6WdUO1fXSsxOTtfDxNRzTJnVG9KHJ+PTjuX+VdFFz
 IorFRDTtU6eNbOjkWska9SM4g2TFlSbwTmbukVPuKldJsfoVtk632Lk7qN1P0WL1QKhWSe9Ifb8
 N7rUU3iNhE4Kr8G7VGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2MyBTYWx0ZWRfX9zdy9AQCLlsJ
 gTISixObu/TGbPfi8B5tq6GN5fPMFSaVgU9wyojM90cpfyABjbqVqPwqYNwsrvTBcNjFk1XL/5j
 pIpx/LHWNNLIzTTCTn4KfFIH1Fx1wwo=
X-Proofpoint-ORIG-GUID: ldTVLevlezW0GYDOsBb6QgiFjAHgzLFu
X-Proofpoint-GUID: ldTVLevlezW0GYDOsBb6QgiFjAHgzLFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040063

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
 sound/usb/qcom/qc_audio_offload.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index f09dae8334d0..515f4271a58c 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -58,6 +58,8 @@
 #define PREPEND_SID_TO_IOVA(iova, sid) ((u64)(((u64)(iova)) | \
 					(((u64)sid) << 32)))
 #define IOVA_MASK(iova) (((u64)(iova)) & 0xFFFFFFFF)
+/* recover the raw xfer ring iova by subtracting the intra-page offset added at setup */
+#define RING_IOVA_BASE(mem) (IOVA_MASK((mem).iova) - ((mem).dma & ~PAGE_MASK))
 #define IOVA_BASE 0x1000
 #define IOVA_XFER_RING_BASE (IOVA_BASE + PAGE_SIZE * (SNDRV_CARDS + 1))
 #define IOVA_XFER_BUF_BASE (IOVA_XFER_RING_BASE + PAGE_SIZE * SNDRV_CARDS * 32)
@@ -1241,8 +1243,10 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 		goto clear_pa;
 	}
 
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
-	mem_info->size = PAGE_SIZE;
+	/* add intra-page offset so DSP IOVA resolves to the correct 4K slot */
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova + (mem_info->dma & ~PAGE_MASK),
+					     uaudio_qdev->data->sid);
+	mem_info->size = TRB_SEGMENT_SIZE;
 
 	return 0;
 
@@ -1311,8 +1315,10 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 		goto clear_pa;
 	}
 
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
-	mem_info->size = PAGE_SIZE;
+	/* add intra-page offset so DSP IOVA resolves to the correct 4K slot */
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova + (mem_info->dma & ~PAGE_MASK),
+					     uaudio_qdev->data->sid);
+	mem_info->size = TRB_SEGMENT_SIZE;
 
 	return 0;
 
@@ -1551,10 +1557,10 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 
 	/* cache intf specific info to use it for unmap and free xfer buf */
 	uadev[card_num].info[info_idx].data_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_data.iova);
+					RING_IOVA_BASE(resp->xhci_mem_info.tr_data);
 	uadev[card_num].info[info_idx].data_xfer_ring_size = PAGE_SIZE;
 	uadev[card_num].info[info_idx].sync_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_sync.iova);
+					RING_IOVA_BASE(resp->xhci_mem_info.tr_sync);
 	uadev[card_num].info[info_idx].sync_xfer_ring_size = PAGE_SIZE;
 	uadev[card_num].info[info_idx].xfer_buf_iova =
 					IOVA_MASK(resp->xhci_mem_info.xfer_buff.iova);
@@ -1589,13 +1595,14 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 drop_sync_ep:
 	if (subs->sync_endpoint) {
 		uaudio_iommu_unmap(MEM_XFER_RING,
-				   IOVA_MASK(resp->xhci_mem_info.tr_sync.iova),
+				   RING_IOVA_BASE(resp->xhci_mem_info.tr_sync),
 				   PAGE_SIZE, PAGE_SIZE);
 		xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->sync_endpoint->pipe));
 	}
 drop_data_ep:
-	uaudio_iommu_unmap(MEM_XFER_RING, IOVA_MASK(resp->xhci_mem_info.tr_data.iova),
+	uaudio_iommu_unmap(MEM_XFER_RING,
+			   RING_IOVA_BASE(resp->xhci_mem_info.tr_data),
 			   PAGE_SIZE, PAGE_SIZE);
 	xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->data_endpoint->pipe));

-- 
2.34.1

