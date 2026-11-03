Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749204;
	b=iFgVCgQIK5eJ3v+pdi+Vf5T+sBJFACalr/Hxrn9JOi/EaUwJ4DMIJ/kVoTVP8Lsk/mEr
	 prLLGniCG4ZXJeIuABh1+rW2nyk/n2pq67bDWKNNRSKDPcMUsjeqNvM8WMicxMzdXU+DL
	 QBBABYyNQwIIRMkVO6cbYh6oMmIXu8GoWToFLhIYltH2DOqwM+F7WB4lBdNb2eh9pd3ch
	 bzNP204D/Ps6z15NxyjfnA6VgLhKypl8xnxcO518qBCmj7GHxbXL41l4xQG1JxRZF8QAI
	 MVArp8dblxEbiknIxLsiSKg/dLdqe1/cqD9vkgWReeJueY1ZVgQijDi7NhuyNr3EGNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749204;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JX49NbLw/imu5a3gQoSE/HYEqmaqAKFCIu6+mIAnbrw=;
	b=M2gkvQkridPeNkoaOeGUgXR46ACcsW0IlmbQTqWjAqWZ6IWSCdj17cOtibEd6gwTNRag
	 4aYSMststV44BCfQqUDHKJBKi8Ndu69jvIB8oNnbmMBj2ZaULiMn95zXnG9IGMR+MtiTz
	 q6ZPuILzZEIVICjTMQ1ObW+mM0PLTITg3F3113ksAaZ1ibEsxHWRF5K+oxrL1vrGOlCvW
	 la2HK3WiWivQfFewBNJ3JLqvb/J9yqet1R5BAyi1+gYChWDkTp4j6MsKPU0PMcv/lUN0k
	 sIeZ19NdolaSoXyRHBzdYxJ/xMqTUWu/GeRAOlY+yMIiq653N0bmgjcz11vUpYLofYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BOOS/NPX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WdNmF/zE";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E4D606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18E4D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BOOS/NPX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WdNmF/zE
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKpAj415192
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 23:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JX49NbLw/imu5a3gQoSE/HYEqmaqAKFCIu6+mIAnbrw=; b=BOOS/NPX6wGS6zvg
	GluggTnkfy2nKk/0ZYLGHqWbtou70j/15Vn1x3P0rM0S47QfD4fLDrxgyfpDid5f
	SIf/lu0SvUEqP/tz54UFZh6ipIVM10O98qxD0pBVjzw7/dKCVHYH8JYakHhNkkP+
	Lg6MpI5JNngWNEHo2UBu47Tjk7Bem0SvVAV78Fz63cM/UeK261n1Zt5o7umoy+q7
	SyOrYpCTn7Nl5G1P/vHZ4RqlaIAJCrTKlyNa0Q9fu7XjEo0KDF7MA8OL+4Ngnbpq
	27Zn7/RocITaK0f+JkWAXNlHM75iSaeKMKWlBnrXzCfzV7hDnVAXp+0J4v1r+VsH
	lv/wAA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgp9hq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:40:02 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so365144c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793749201; x=1794354001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JX49NbLw/imu5a3gQoSE/HYEqmaqAKFCIu6+mIAnbrw=;
        b=WdNmF/zEQ39akvRZFt7KAYgmcGnaK+C9bB1lv5EkjJrzzP4QfPu7zwX19Nt0oY6BeA
         ijlw+Z+J2exS4a0wZzhAqbsaTla7wZmbFm3P/siVNHj5oxn4yWUTggLwf2gE5fQKffc0
         uER8KGTLwBccwKp7dUbiiMvcNFLfgZHK1B5uLdRUpWIYYrIYDqexnj8zvcgppnoPVAq+
         FSkmG55FliUkLeUfisUc39M2rIJDWzKcKOmswQNKbyUpB1pzxiW3gegP/tEBlDyNckK7
         XJ8mtqs4SucIZsm4QgYTGYGZhWJFMlup/msfDX7nSMbV6ZJ0DS+i/LHgC5YdKeyF7Zug
         g4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749201; x=1794354001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JX49NbLw/imu5a3gQoSE/HYEqmaqAKFCIu6+mIAnbrw=;
        b=NY6dd6J67ZQbPsuM2TxtPBfar+e3wVHMFjVQ7BULoR3Z22oq2DF+shLohbanqZ76Mu
         OItRrD/exBeSbCi8mcqgT9SHPFWDqGyXi7JRs5o0uUgolJTfKgaUJ/EheStmjWwy92MK
         bwvKW1QWsarnhblIIfGxOaOgtrgIgYVwmA+KnPsSXO6XeXGEykdKjXjOvKQkx7/fmKAf
         r8BSF4W8mYVsRrbmGsNZBNJ9w3hjQugseX85Hc17mUjqxiY27iPempc8DdOV4RgwzX5z
         mLm+HpmxyzqlSKXdRHeO+sUGhaI2UZ31UvXL8x/nFRCjx3lVDmW2w3wnWmg1cio/91Ms
         ZGhA==
X-Forwarded-Encrypted: i=1; AKwUvBy2IdrqQiLxDwz5uJfG1RFKDSI6uzYIwEdhrz6yB+MQ28wqWAb8+6gTexcOrcuuZlMXAnRwiN3QJM4BUrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VELssdpFp1YQe8SedB1mSpmdxvpU/g0I38o8C1++eo+nAoqj8
	oCaq+R4QK8dJ/iFl92m59iljlfCqzJX/DVTRFKsWz7OMq17kVsnxIL9RYHgOS0K9fUCNDqyKndV
	jYtUmNMkthGcYyFKsw//oKllwzOKSrLsA1uE51wxFLJzqqkztYWnzVwyMr6TsZOkrlq4=
X-Gm-Gg: AYBFou3m0oUm/deJHx7bpnij/MgRnfmFcKV3q+3stu0rQZCD98Tebm+6jIoHMIukk48
	CiNSCOtedUEgvVJ/drLK2pN/IHGqNTUr0/FIHaHsjNheUpnvPzmjbmm0dBk8AoEQ5eDJWm2Ybvn
	BahdRX0+B5cNpd3gIZ3KXcxd4YRO6/UmoB8r8LFifl9c/PsUMm3EVShYWUrNDLslTF/kXNN1d0K
	ZmRuSgrx+f6oTNL9y3YESlvtF5PSkKUjmot9qiWXfhOuzzplOpf2UcdK1bKYB2QzbQecx8NbW+p
	E0kHndgWhWRGa3u7JcY7fAFzYrBmQZrHKTVuMp0G5ny+3I3FXWYtfeLri+n4/jF/Dm0tytNDjal
	FITPHZQiS3cnvb6jRpM1kEDMD5ShTmw7ioTZeeHLU1Absq+OmPppgUzowgVoZHhwelRLavtnuTl
	DDppFoKvkuGmdkfqYw7yf3m1yczw==
X-Received: by 2002:a05:7022:b042:10b0:19e:1ad9:1c2 with SMTP id a92af1059eb24-1ac5c92da1amr21435002c88.38.1793749200863;
        Tue, 03 Nov 2026 15:40:00 -0800 (PST)
X-Received: by 2002:a05:7022:b042:10b0:19e:1ad9:1c2 with SMTP id a92af1059eb24-1ac5c92da1amr21434962c88.38.1793749200087;
        Tue, 03 Nov 2026 15:40:00 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm2356442c88.1.2026.11.03.15.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:39:59 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:39:56 -0800
Subject: [PATCH v5 4/4] ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on
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
Message-Id: <20261103-16k_offload_v1_b4-v5-4-67184126e91c@oss.qualcomm.com>
References: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
In-Reply-To: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfX3q9hwp35m2YJ
 uGwBYTR/VzXWnQTv6LLNp5T3u7sWxqZmYv/xMDU0anAko224dX977JN7yHzpefhVI8LmUuRGYv0
 CLSyG8Bj3vmLt6V0tNM4FNiXyMfdKW5O0vqNNd3OvJazh7GcPXg5jzWmGrZQM+2fGL4CSDUxrWV
 g1Zb7yqAr8CGuWYEd8Lxjzdgb3DHFSEYOgtnejR6mD8VpuR3Xv8LTSOUh9bKk7JABAWQKlpw2Qi
 1uYLcalJYLyYS/3+5xzpuNTMbXT8PoyQDq1ba0iKfLInJhrXmuKBlCi/kahAwDJDOE6ddJqUzNR
 IQe1x9sC12qmQ0NlvNG0UoHCURRVHJ/SKkG458qqj1adXjoJ9qWILejbmxvasFbAkq88mt/GJZm
 OkKpTJdOiKGZTFoxWIXTz+IjrcQ9kZeZxTcxUq5IeoZlyXBGSXR6H2W93lgFtSYVnjZJfPJzzFx
 0raiSr+w1s3poSM7E9Q==
X-Proofpoint-GUID: PytVRDCAoDSWuUMz7s17OQYrzCxepMGG
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aea70d2 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jlV98JOHXxtXOl5fqgUA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfX0lfjRbcnsD+S
 nJEzYQPjv93hyaB3KhxPDHMzOLOyK35xHkgZVsvwoAbE0KdpJco67DFACQZKUJuyYUWT5Misbtk
 nCtXFmaOIbrE5rcfCTObpehSxZWZ9Pg=
X-Proofpoint-ORIG-GUID: PytVRDCAoDSWuUMz7s17OQYrzCxepMGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030094

TRB_SEGMENT_SIZE is hardcoded to 4096 bytes, but on kernels built with
a larger PAGE_SIZE (e.g. 16K or 64K page arches) the IOMMU still maps
and unmaps in units of PAGE_SIZE. A ring segment can therefore start at
a non-page-aligned offset within the page that gets mapped, which the
sideband sg table reports as the offset of its entry.

Add that offset onto the mapped iova before sending it to the ADSP over
QMI, so the reported address resolves to the start of the segment
rather than the start of its containing page, and report the true
TRB_SEGMENT_SIZE (the sg entry length) instead of PAGE_SIZE as the ring
size. The offset is taken from the sg entry rather than from the ring's
DMA address, which is an IOVA when xHCI is behind an IOMMU, and whose
low bits then need not match the offset within the page.

This broke the reverse direction: recovering the raw, page-aligned
iova for iommu_unmap() by masking off the low PAGE_SIZE bits of the
QMI-reported iova only works if that iova happens to already be
page-aligned before the offset was added, which is not guaranteed.
Have uaudio_endpoint_setup() return the iova it mapped instead, and use
it for both the cached data/sync_xfer_ring_va and the
drop_sync_ep/drop_data_ep unmap error paths.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c | 45 +++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 48ee55116004..dd904d72badd 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1178,6 +1178,7 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
  * @card_num: uadev index
  * @mem_info: QMI response info
  * @ep_desc: QMI ep desc response field
+ * @ring_iova: returns the iova the transfer ring page is mapped at
  *
  * Initialize the USB endpoint being used for a particular USB
  * stream.  Will request XHCI sec intr to reserve the EP for
@@ -1189,7 +1190,8 @@ static phys_addr_t
 uaudio_endpoint_setup(struct snd_usb_substream *subs,
 		      struct snd_usb_endpoint *endpoint, int card_num,
 		      struct mem_info_v01 *mem_info,
-		      struct usb_endpoint_descriptor_v01 *ep_desc)
+		      struct usb_endpoint_descriptor_v01 *ep_desc,
+		      unsigned long *ring_iova)
 {
 	struct usb_host_endpoint *ep;
 	phys_addr_t tr_pa = 0;
@@ -1197,6 +1199,8 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 	bool dma_coherent;
 	unsigned long iova;
 	struct page *pg;
+	unsigned int ring_size;
+	unsigned int ring_offset;
 	int ret = -ENODEV;
 
 	dma_coherent = dev_is_dma_coherent(subs->dev->bus->sysdev);
@@ -1221,6 +1225,8 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 	pg = sg_page(sgt->sgl);
 	tr_pa = page_to_phys(pg);
 	mem_info->dma = sg_dma_address(sgt->sgl);
+	ring_size = sgt->sgl->length;
+	ring_offset = sgt->sgl->offset;
 	sg_free_table(sgt);
 	kfree(sgt);
 
@@ -1232,8 +1238,11 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
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
 
@@ -1263,6 +1272,8 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 	bool dma_coherent;
 	unsigned long iova;
 	struct page *pg;
+	unsigned int ring_size;
+	unsigned int ring_offset;
 	int ret;
 
 	dma_coherent = dev_is_dma_coherent(subs->dev->bus->sysdev);
@@ -1291,6 +1302,8 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 	pg = sg_page(sgt->sgl);
 	er_pa = page_to_phys(pg);
 	mem_info->dma = sg_dma_address(sgt->sgl);
+	ring_size = sgt->sgl->length;
+	ring_offset = sgt->sgl->offset;
 	sg_free_table(sgt);
 	kfree(sgt);
 
@@ -1301,8 +1314,10 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 		goto clear_pa;
 	}
 
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
-	mem_info->size = PAGE_SIZE;
+	/* add intra-page offset so DSP IOVA resolves to the correct 4K slot */
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova + ring_offset,
+					     uaudio_qdev->data->sid);
+	mem_info->size = ring_size;
 
 	return 0;
 
@@ -1438,6 +1453,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 				struct qmi_uaudio_stream_resp_msg_v01 *resp,
 				int info_idx)
 {
+	unsigned long data_ring_iova = 0, sync_ring_iova = 0;
 	struct q6usb_offload *data;
 	int pcm_dev_num;
 	int card_num;
@@ -1470,7 +1486,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	resp->std_as_opr_intf_desc_valid = 1;
 	ret = uaudio_endpoint_setup(subs, subs->data_endpoint, card_num,
 				    &resp->xhci_mem_info.tr_data,
-				    &resp->std_as_data_ep_desc);
+				    &resp->std_as_data_ep_desc, &data_ring_iova);
 	if (ret < 0)
 		return ret;
 
@@ -1479,7 +1495,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	if (subs->sync_endpoint) {
 		ret = uaudio_endpoint_setup(subs, subs->sync_endpoint, card_num,
 					    &resp->xhci_mem_info.tr_sync,
-					    &resp->std_as_sync_ep_desc);
+					    &resp->std_as_sync_ep_desc, &sync_ring_iova);
 		if (ret < 0)
 			goto drop_data_ep;
 
@@ -1540,11 +1556,9 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
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
@@ -1578,15 +1592,14 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	usb_offload_put(subs->dev);
 drop_sync_ep:
 	if (subs->sync_endpoint) {
-		uaudio_iommu_unmap(MEM_XFER_RING,
-				   IOVA_MASK(resp->xhci_mem_info.tr_sync.iova),
-				   PAGE_SIZE, PAGE_SIZE);
+		uaudio_iommu_unmap(MEM_XFER_RING, sync_ring_iova, PAGE_SIZE,
+				   PAGE_SIZE);
 		xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->sync_endpoint->pipe));
 	}
 drop_data_ep:
-	uaudio_iommu_unmap(MEM_XFER_RING, IOVA_MASK(resp->xhci_mem_info.tr_data.iova),
-			   PAGE_SIZE, PAGE_SIZE);
+	uaudio_iommu_unmap(MEM_XFER_RING, data_ring_iova, PAGE_SIZE,
+			   PAGE_SIZE);
 	xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->data_endpoint->pipe));
 

-- 
2.43.0

