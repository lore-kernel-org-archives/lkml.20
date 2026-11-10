Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278306;
	b=CZ2Y+gQmVeGapolSy4f1FRCDMWPsvlbSHSZa7hCmQ9pr2DhUVIJd0HXb8I+J0WPoA9ID
	 1+XSs6KI4QFxNAECbQsO/31oN5T+2d06qri9XAhNhbntmFphf2V7axCYndbBUsVsSQL2F
	 osbIp/fiveRxOJA9qAFfrYGpEkFjwrBuRgIj4AwS2SOTymRgUUPGCFvhrN6hjpjhy6H02
	 NhZmyxDvg3WQQzLLTLni/dIEcL8zO8uBN3ra1mJwicZz8spAmiVlsrx/Ch5Dn7GwJfdn9
	 g6BAjMZ2gFmJP6lVrwF6C6FcdFqvfW5OtCaHmvl9ATTjmGK6NHvU7UpyzeIlOfmuCwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=b86qYYRcrnFdnq6dKOOQoOxFVWg06uJ1Hxs0bUrUiVM=;
	b=SswD3BJyNEZ9EJI/JyA6wptoSvrqt/ZXIwrgkJrMEJAgqsvn4NhlvWWN8DVxmZ/pyVMk
	 nTHTTDar+fgPeFSaRi+j8rmVwnj4UHPkSQGWrf3Nh0oQcELd+81u+xzAAcUO/yLHA/cNd
	 pGqoyJ5SgA9aVxPIzSMaOGA7arHQjlB7q4m8PEzcznYP76rZAn2CuVMw4DwLPn1EbdN/z
	 WKaM/ZMCXAFAC8zpwrhF7LXIqA1l2mTd1eKHSBzBx2741xhJyaE8Hg4zxB06HxX5sF6z9
	 zUlIAQW1HPOeNeYX+tuhU9bBgM1dcuz2xEboonsKsIHuiu94C/KbOrtzhUpdRgcYqSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UNZBWYbk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V8+5CHSL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C31360A2618
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C31360A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UNZBWYbk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V8+5CHSL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jiVR1804793
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b86qYYRcrnFdnq6dKOOQoOxFVWg06uJ1Hxs0bUrUiVM=; b=UNZBWYbkZ/bCaY+b
	DdK5+ccuHtDr76rrcGLbWo36jblf4x1Lo0lpf0lgXr67yBP5EEg/YuJnZomGJ7vv
	UvgcBMFMwvya/5i+l3kfrRmgld7j5948MHyfBxJrcGNSfkoMiHEAU7Ev/1Wy+IEv
	97rAbmJQOEfGsM0F3lGoK4MGyMqGUxLp1P+fV0SjMGYP+N6X5Dh0vXSTCT1G9DL3
	seyTMxatJkgbd3OdKHbSYF+TnkurgvtF/wE8XOJFiDKfhGOMArB8fV6gDp1AIOyV
	ZzmqRMNi/pafU1y10HxixLOkE2JctUmAsqzyiEbxZI/q2hhry7gyKDFoVAq65hKe
	LBdT2Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapb8fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:38:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1971131eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794278304; x=1794883104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b86qYYRcrnFdnq6dKOOQoOxFVWg06uJ1Hxs0bUrUiVM=;
        b=V8+5CHSL6L3f7WCykWHwMhjzkJCOzo3Gh+kpKOKphiNTfuf8RHz4xinaSvz0jX6we/
         vSbLkT8T3fKeIR4vKiTyaa4DqEFKZW/5we96S6lyt7QW7ksJhy1/Je7L/6V+lOg/MJtS
         Ib1Jbr07JfDiXfcdjTj5VfvEE6/FBAP/qzH/AJjqLkmFuiF+KQSI6dvkL72TJQ0KS4A7
         CP2I/kWJ3KTyO+ERTi6QTDuRjrix4I0AxPXqmQwXCJLfkesLdycTGLk24G2Th5pyQyMl
         3tRhMgsV45XW49Whrm9PziScKF5Pp9rtON1GTBXEbeVnC1yt0XCRKMip4GbQj3DOR5DD
         3Kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278304; x=1794883104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b86qYYRcrnFdnq6dKOOQoOxFVWg06uJ1Hxs0bUrUiVM=;
        b=es/wAoQuRunUWVlQGFOaQ4t0/xpcTanQS1PTnBiodmk8wcLj1uHabM13sYCGj6OigF
         8mwJ/5SkubCe7dN8YfJ9/YkUq7ZR644n1VlCWECSkKBE4zdIAAic4GrBI3z3gr9foonS
         lJ632p33Kjxdm7BO0tv3bXZW+TDPfxE+k1QsSsQp8UT6eYcltCos53JnOGcv+j53vDjk
         eHkVbKOLOSGR+0UIjRM3SQBhsw9t+Zdejr6xx4J6cHJTNwYVQw5RvnXEe1g4F3jmoa/T
         IP9zwdY8s7KcbRqWi/oZFbrJye4WjT+i2naMPlv4ttaWQpxNIgu9BBFTq2P3wqO+jij2
         wLjg==
X-Forwarded-Encrypted: i=1; AL+hErH4liFpBxEIUdV0VLBgSQ5mCbeQ68o+9kTfJ7DgylxXIPjbfCq5TUB+WXxGGVXGf67Wlvw/7ytfF2XjHhk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zCNohmaHkKmGqvpH3HFz4RS0Z68n9e0kPk14EqgvSWQTg5v8L
	EJVyeYh6N8jw5sAU//lHxaZLU9483XTKm6iZWiyDIeTNMf8tTJLlaXESSr2GprZRdtTUiFP3LFw
	Qiy+fv6GcPSjdOhlKEoRd8MFRz66rZiy8hLEFSsy9uOR89OgyiGMqfFk8nDS3RR86tbc=
X-Gm-Gg: AYBFou0L4MGyjs0KamkxwS10wiRhMNxfAvLZFFZLbDsu0u87qnhO6o5MLmP772SE6X7
	/bYJC3eo3562ASxhEPd/ZFK7MMvvYDcMXrLgnY8DzVhN1eL83BzsL2W6JE6qHGFn6L9nFVyvyRv
	mr3d61kZLPHf0Yzfk4DBs0nJdf7lVMyyI0IptQyZgzSrdHoR6dr/fQfWH3SNRJanI7KEzOpAE1g
	ujp3Y67c52hxOjTewOdRPKNQXJZTTMRbhoMTuzW5ie7hrPMu1Mh7pHcsnjiRlw+XIlEwn8f5FzN
	srv9PN7nNpy9U9Nh0Dxl/ux/X6lcPLjrim2iv0Omb32HP+90fBqk6Kn2VZo6yAOocDZ54hOrCtc
	pMvrtldVlwpRKsfjQRPJg5K9gqMeTX8K758MxKCrreM4zKgPvKNmm4bvbP8WSn4nlj2bYzpT5ci
	/jEPZd7lUIAHM6B+upmcSVUNWV
X-Received: by 2002:a05:7301:78c5:b0:36d:48e:82de with SMTP id 5a478bee46e88-3751ee7bed0mr1382873eec.12.1794278303694;
        Mon, 09 Nov 2026 18:38:23 -0800 (PST)
X-Received: by 2002:a05:7301:78c5:b0:36d:48e:82de with SMTP id 5a478bee46e88-3751ee7bed0mr1382834eec.12.1794278302908;
        Mon, 09 Nov 2026 18:38:22 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm3800183eec.22.2026.11.09.18.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:38:22 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:38:10 -0800
Subject: [PATCH v6 4/4] ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on
 16K+ page kernels
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
Message-Id: <20261109-16k_offload_v1_b4-v6-4-858c6e0e007d@oss.qualcomm.com>
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
In-Reply-To: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMCBTYWx0ZWRfX3gINQZPG/TIr
 XhLVpW759v06deN1vA/yoKDrtWGKYOzOcjYYOovRc9eFsth5nF27/hPLaJqjYHJrvwPXd1CW9hp
 Ov5CjgMtPrRsZn00iLSeW1s6giuS5/DvXLJyp1uQq2KpRAfB/0fB2l84GPUiqMG7FPlEd1odQuk
 crBpYNMz9/LmeSCMhq5taaS38nDl6Tm1ppQcZHQpGjoFj1F3cILpB3yitw18fEDbKGoodmA3R4u
 z1Y1yJrv0zkseeW2rzqc99E76cAwi2g7jgPAtfhU/UyRvTDJUWdJ7D3fH5ZnOsufPrxx10neWi4
 F3YfQuesqkIa5uWBzkq63UcQzOxOL24RThbHkT8pzVEIr+JwAnyg9OE8Hp0cs85U80hVMIPN2pQ
 Rxof08YkiS4NVzE1kZwa6Q1D+HaohZkubXYIVBv/XM0xAEzQVmuvC60bjxVXdzWPENIqQrKAnAA
 bf222Amlp1y+RPc/tmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMCBTYWx0ZWRfXzEYhWfmLHFFX
 o2wdwQe6jt/b2qbt4edMFBRMdSeC8dujG8KY+yLp7We8NGJPXxv1SJ5paTsOUOKfTa83DhYdcpo
 fTH4uh1luqfTFv2rf0LutMuv6fPRNgM=
X-Proofpoint-ORIG-GUID: jYM39oMQFd0O_5CgawAiqtiHc-hFXQt3
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af283a0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2sccOLmyyyIGCYaHHw4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: jYM39oMQFd0O_5CgawAiqtiHc-hFXQt3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100010

TRB_SEGMENT_SIZE is hardcoded to 4096 bytes, but on kernels built with
a larger PAGE_SIZE (e.g. 16K or 64K page arches) the IOMMU still maps
and unmaps in units of PAGE_SIZE. The driver maps the page containing
the ring segment, but reports the start of that page as the ring
address and PAGE_SIZE as its size. This is only correct if the segment
starts at offset 0 in its page.

For both the transfer rings and the event ring, add that offset to the
mapped iova before sending it to the ADSP over QMI, so the reported
address points at the start of the segment rather than the start of
its page. Also report the sg entry length (TRB_SEGMENT_SIZE) instead of
PAGE_SIZE as the ring size. The offset is taken from the sg entry
rather than from the ring's DMA address, because when xHCI is behind an
IOMMU that address is an IOVA, and its low bits need not match the
offset within the page.

With the offset added, IOVA_MASK() on the reported iova no longer gives
the page-aligned iova that was mapped. Have uaudio_endpoint_setup() pass
back the mapped iova, and use it for the cached data/sync_xfer_ring_va
and the drop_sync_ep/drop_data_ep unmaps.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c | 45 +++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index c8edc48cb80e..65bf64c08b6e 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1177,6 +1177,7 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
  * @card_num: uadev index
  * @mem_info: QMI response info
  * @ep_desc: QMI ep desc response field
+ * @ring_iova: returns the iova the transfer ring page is mapped at
  *
  * Initialize the USB endpoint being used for a particular USB
  * stream.  Will request XHCI sec intr to reserve the EP for
@@ -1188,7 +1189,8 @@ static phys_addr_t
 uaudio_endpoint_setup(struct snd_usb_substream *subs,
 		      struct snd_usb_endpoint *endpoint, int card_num,
 		      struct mem_info_v01 *mem_info,
-		      struct usb_endpoint_descriptor_v01 *ep_desc)
+		      struct usb_endpoint_descriptor_v01 *ep_desc,
+		      unsigned long *ring_iova)
 {
 	struct usb_host_endpoint *ep;
 	phys_addr_t tr_pa = 0;
@@ -1196,6 +1198,8 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 	bool dma_coherent;
 	unsigned long iova;
 	struct page *pg;
+	unsigned int ring_size;
+	unsigned int ring_offset;
 	int ret = -ENODEV;
 
 	dma_coherent = dev_is_dma_coherent(subs->dev->bus->sysdev);
@@ -1220,6 +1224,8 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 	pg = sg_page(sgt->sgl);
 	tr_pa = page_to_phys(pg);
 	mem_info->dma = sg_dma_address(sgt->sgl);
+	ring_size = sgt->sgl->length;
+	ring_offset = sgt->sgl->offset;
 	sg_free_table(sgt);
 	kfree(sgt);
 
@@ -1231,8 +1237,11 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 		goto clear_pa;
 	}
 
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
-	mem_info->size = PAGE_SIZE;
+	/* add intra-page offset so DSP IOVA resolves to the correct 4K slot */
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova + ring_offset,
+					     uaudio_qdev->data->sid);
+	mem_info->size = ring_size;
+	*ring_iova = iova;
 
 	return 0;
 
@@ -1260,6 +1269,8 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 	bool dma_coherent;
 	unsigned long iova;
 	struct page *pg;
+	unsigned int ring_size;
+	unsigned int ring_offset;
 	int ret;
 
 	dma_coherent = dev_is_dma_coherent(subs->dev->bus->sysdev);
@@ -1288,6 +1299,8 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 	pg = sg_page(sgt->sgl);
 	er_pa = page_to_phys(pg);
 	mem_info->dma = sg_dma_address(sgt->sgl);
+	ring_size = sgt->sgl->length;
+	ring_offset = sgt->sgl->offset;
 	sg_free_table(sgt);
 	kfree(sgt);
 
@@ -1298,8 +1311,10 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 		goto clear_pa;
 	}
 
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
-	mem_info->size = PAGE_SIZE;
+	/* add intra-page offset so DSP IOVA resolves to the correct 4K slot */
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova + ring_offset,
+					     uaudio_qdev->data->sid);
+	mem_info->size = ring_size;
 
 	return 0;
 
@@ -1435,6 +1450,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 				struct qmi_uaudio_stream_resp_msg_v01 *resp,
 				int info_idx)
 {
+	unsigned long data_ring_iova = 0, sync_ring_iova = 0;
 	struct q6usb_offload *data;
 	int pcm_dev_num;
 	int card_num;
@@ -1467,7 +1483,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	resp->std_as_opr_intf_desc_valid = 1;
 	ret = uaudio_endpoint_setup(subs, subs->data_endpoint, card_num,
 				    &resp->xhci_mem_info.tr_data,
-				    &resp->std_as_data_ep_desc);
+				    &resp->std_as_data_ep_desc, &data_ring_iova);
 	if (ret < 0)
 		return ret;
 
@@ -1476,7 +1492,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	if (subs->sync_endpoint) {
 		ret = uaudio_endpoint_setup(subs, subs->sync_endpoint, card_num,
 					    &resp->xhci_mem_info.tr_sync,
-					    &resp->std_as_sync_ep_desc);
+					    &resp->std_as_sync_ep_desc, &sync_ring_iova);
 		if (ret < 0)
 			goto drop_data_ep;
 
@@ -1537,11 +1553,9 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	uadev[card_num].usb_core_id = resp->controller_num;
 
 	/* cache intf specific info to use it for unmap and free xfer buf */
-	uadev[card_num].info[info_idx].data_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_data.iova);
+	uadev[card_num].info[info_idx].data_xfer_ring_va = data_ring_iova;
 	uadev[card_num].info[info_idx].data_xfer_ring_size = PAGE_SIZE;
-	uadev[card_num].info[info_idx].sync_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_sync.iova);
+	uadev[card_num].info[info_idx].sync_xfer_ring_va = sync_ring_iova;
 	uadev[card_num].info[info_idx].sync_xfer_ring_size = PAGE_SIZE;
 	uadev[card_num].info[info_idx].xfer_buf_iova =
 					IOVA_MASK(resp->xhci_mem_info.xfer_buff.iova);
@@ -1575,13 +1589,12 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	usb_offload_put(subs->dev);
 drop_sync_ep:
 	if (subs->sync_endpoint) {
-		uaudio_iommu_unmap(MEM_XFER_RING,
-				   IOVA_MASK(resp->xhci_mem_info.tr_sync.iova),
-				   PAGE_SIZE, PAGE_SIZE);
+		uaudio_iommu_unmap(MEM_XFER_RING, sync_ring_iova, PAGE_SIZE,
+				   PAGE_SIZE);
 	}
 drop_data_ep:
-	uaudio_iommu_unmap(MEM_XFER_RING, IOVA_MASK(resp->xhci_mem_info.tr_data.iova),
-			   PAGE_SIZE, PAGE_SIZE);
+	uaudio_iommu_unmap(MEM_XFER_RING, data_ring_iova, PAGE_SIZE,
+			   PAGE_SIZE);
 
 	return ret;
 }

-- 
2.43.0

