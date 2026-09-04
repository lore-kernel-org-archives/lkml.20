Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA5420477
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505089; cv=none; b=LFhLbIZwv6NhfDnswlfSHQclsKDAFBNjksyuXvTU3n7Q+q4ruLo1FfAprbnHcY6WrK0aJhpCrAa7vFwSUJNqGaZY+j8X/dfLx/PkuiCwrnSEssqrhIlfsw0v9dpPnT9mJ0wpfNdG1muoIPLZ1mB/Im5ZAf2iUdUDFBqP+Edm4lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505089; c=relaxed/simple;
	bh=4M7fW0W6k2SMLhuePvMSSN1hN5aqIPrugUZcIW0BbsY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hFVOJn1DMq9izMrNf0wETUWpg9ivjZjIFkof+CxxSIW0Bg9b5hXS0pVHuTqbbG4CTrFKzx66m7ai5jMizz+btjJZvMQgH+I/KKM9MjGJAOfKfAGuKo1e4CbeA22CqGoiTwV3BV+VTCdwo1ZQv6F2O2NtPb0gh27kdnFv57i4NlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iq4KgQeT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ot6Bv8Tf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iq4KgQeT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ot6Bv8Tf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462Onw2886161
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 06:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HnRkMENpbWbqBF8fAOgmy7
	G9W+ZeKve5Xmct5CeDQDs=; b=Iq4KgQeTkZP4x1klL/MJkJRZ/hbQus9o/l5zCB
	RaqHqr5N5YUXCvY0kt2xPvTMDrGBLfy02XNLMVnW2j4M28bsvWGhqJfsAVC/l1Vp
	3AdfGqt+xfoslTMrdjp4scx5zr755uRLA7nE8dUJ+Aiugx3O5JEyRaAGIZk2Qb6H
	LhOZRTXaCLsoP9MopCjW8QFTHYPlYPBav6bYbx8H3BCAD62JW6uNcX6RtIev1lNR
	iqsjk0ehUb1Me9f44jEY3+/KGdWHcjdrkZ6OT1vUrue1yApWQjBapRbzR3dlUPez
	8kmfpLlDeNfx6GA7CpfbCah7W9GAhJbfqH1+x5nJV3RMFH/w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp780k6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:58:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so1126210a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 23:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788505085; x=1789109885; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HnRkMENpbWbqBF8fAOgmy7G9W+ZeKve5Xmct5CeDQDs=;
        b=Ot6Bv8TfZPPF4DRtiT66MFwTe3iDWnNl7S6HV7HF+58edzduMVeVcxTRiu/CE7NlTD
         LQ2M8QczvT36Ev+nchWOf0bfrARHZ5uGp0VWNNtVbDGXFamrgswEcG2G79iPOU2Bstgw
         /kbCz+dLbpzQid153D4NSrAA45IEupMlqpFf4wUBAUwNEHjw5T41ka4GauupU69H8Lnq
         WTfZAS1uwwJU+S5ltxkB/hgCCwUSiuKSyH0t25Sfz3uVAhLUJFNMs41vjyZal4qRbkRo
         3KrsILScUyGNsVyI7MV0wm2AAnTokv9yNOMevZ7G4nT+AHzpnWLABdfHbnAtfg0iPfYW
         jSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788505085; x=1789109885;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HnRkMENpbWbqBF8fAOgmy7G9W+ZeKve5Xmct5CeDQDs=;
        b=mQy4if2eqI3BUzUaxAbpPMvl83D+FxZyVCpz+EaB+CabmiVlm6f07Z35XfNQeKmw9s
         YY4acZqfjvt6AX7v0t3yFkLVxVPrbt9/7fSkp2XPUA9E8+y4hS6pIRQu9YTENH820Y/S
         L/9bpavoXLGN38T1q2BYMTYWv0iG/q0eiq+5/yXkNE5vK+LZnmhacb7fXjIGcYFd5y+6
         ZQfEpvdnFS6rqprnNrK9jAHHItAreC15tAozlSijvMfp09/YJl0zr34ZjktBvnfdM+0S
         ZY7TwkaaJP2wwl4+bQfKk19r5HqNDwPB2IBTjUlJJOScReCbF0/QM2mXmjVeQ+Qq2aQm
         J68g==
X-Forwarded-Encrypted: i=1; AKwUvBzS+6uEwN3CC1rEizpoJLE7fZP9CTbQZ6tvqeldnjd9uhEJvQ5B4vlbcJjpoDBgboFjJVCZwfANFIs3laQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kgrJhoIciadEiix+sLDgels9BctA+/q6vn1xJTyIVDuSm0Tg2C
	pKTnMbl41dSf8uT3PRen2qy5402XN55nx8WxdiztLAnZtpdAtAW9DJ59gPE+GrPia9XP4kc8reZ
	zzQi+OmYrxKGEuwXO1wtHeX4i/ZgWkivgVmCuYaRnL5T1IYQQlcYQ5xwiPlApIZHfmpA=
X-Gm-Gg: AYBFou35ZzoCuJOH9ONp/6xFlhnxttHBMfvhu5W8prn2k0QdSDrDnPEZQ9fcLNFfqaT
	OpYU5XwQIfy2+2z4EPCxjwmRIU3g/E13ZVem+TlaDhKSP9+DTSzfiBEoBbEGdBaMHdXwAWM0VDA
	kdN/Rf7BnP2JKOPR3eaZQY/lf4p1YZO+yuX58WiqGiRVjcVM+Y37YWyE4e86vv7krpHmu1h7kzb
	MTcUx/pm65C9tKcUDiCzFBQP1Vzn/qctP+DtxhpukVFGCfqJVSzGc8hXzq3N83wYlwEltPxpEY0
	kss7NFn1achNuuuAeuwcUH1QEmLV/THjP3goP3S4UHUAgh6Z8eWvTEQuA+QLlALVnujZelEKmPk
	SuFJMZxQxgH7gQfJ+AN0l2gV+LcpXqZkRsKBn+j6FhM72KQnDZoWX
X-Received: by 2002:a05:6a20:7283:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3da39d0d473mr5924616637.8.1788505084744;
        Thu, 03 Sep 2026 23:58:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:7283:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3da39d0d473mr5924575637.8.1788505084285;
        Thu, 03 Sep 2026 23:58:04 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm4760900eec.2.2026.09.03.23.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:58:03 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add larger page size support for USB audio offload
 path
Date: Thu, 03 Sep 2026 23:57:49 -0700
Message-Id: <20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAO1rmmoC/33NTQ6CMBQE4KuYri3pnwVceQ9jSFuKVIFqC42Gc
 Hdb3Lggbl4yybxvZuC1M9qD424GTgfjjR1ioPsdUK0YrhqaOmZAEOGoIAxifq9s03RW1FXAlWS
 Q1phxxNAhzxmIfw+nG/NazfPlm/0kb1qNCUqN1vjRuvc6GnDq/fMDhgiyUnCpOVKCopP1PntOo
 lO277N4QJoJ5BcqtiASoUIwTnmppZR8A1qW5QPhk6DMFAEAAA==
X-Change-ID: 20260824-16k_offload_v1_b4-3d1460405774
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2MyBTYWx0ZWRfX/+EvnlFVzXMb
 PJy7VDDFgyi5vZ2Co4Bw02PxxDxZLAlqsUyd6G1SBEzLahplW0Bciws1SIcpYJZMJEyYfAL0IhN
 1ukqOoshDsZzjHrmoVqkSks53Rqnulg=
X-Proofpoint-ORIG-GUID: p87jiwTZ32tPGfeouDUvTozdisO-8suA
X-Authority-Analysis: v=2.4 cv=ab5RWxot c=1 sm=1 tr=0 ts=6a9a6bfd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=ag1SF4gXAAAA:8
 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=GjhRyQdd-c_DPEUQ6LMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: p87jiwTZ32tPGfeouDUvTozdisO-8suA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2MyBTYWx0ZWRfX4JG6SWy/bXrC
 l81TJgzI/9VF03U/VjGp7EscTsdos/mseMi0Ncw4uxd6N4D7U9Sj250Y8TuoKcb6Jt5Py6eBt7Z
 RWOI1p6bDdjSYoIgdl/7Q2CcSe9ej1Y+YO6z/J14jAyTB9w8cFNIZ858G+3yrGLO+EgsD9jLDRz
 LKWscxRfrVSrAMfPOnvd1NneTpZ3KWFtWfHnDn+G3f077AA/4nShF1yoeSQ8lFcYVyi8RNaJbmj
 DSobNgSfO5uPrY46N4W55rZZz31OVU1yciGqmiIpI+oMfbtYhOPbHXxYCDPTHrdCpn880tkynjF
 dLoye6qKKE4GY6BQEid7fqCiTTo17acxGwg8UqR08dC/t8tW7TqMEUT5tACbEJ25WOgJjx7FzfZ
 IKfEDi63FPEx7AM14Bsdp5fkF1XFSbZ2DClnlVkisI0qQOTqeFHwuWbCGAURyf3INYLrde0Jp7Y
 J7Sq8ZnMP41c0p+3MRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040063

On some environments, 16kB pages can be enabled from the Linux subsystem,
which manages the IOMMU mappings for the audio DSP within the system.  In
the current design, the following assumptions break when 16k pages are
utilized:
  1. xHCI ring size is equal to PAGE_SIZE
  2. Ring addresses start at the beginning of a page

When the USB offload driver maps the rings (w/ the audio DSP SID), it is
set with a 16k granular, which is a problem, as several xHCI rings could
exist on the same page.  This is because the rings are currently allocated
from the segment_pool.  Hence, potentially mapping non USB audio related
rings into the region accessible by the audio DSP.

To mitigate this, this series introduces a separate segment_pool
associated to a sideband ring.  Before the USB audio offload path
is enabled, the USB audio data streams/endpoint are not active.  Only when
the class driver issues a usb_set_interface() call (done from
snd_usb_endpoint_prepare()), will the xHCI allocate the transfer ring
resources.  Which pool is selected is all based on if the sideband path
is being enabled, and if so, memory can be allocated from that pool,
which expects to be owned in conjunction with the audio DSP.  This
concept allows to keep the same model existing in xHCI, where multiple
4k segments can reside on the same page, which reduces potentially over
allocating based on the page size.

Likewise this mechanism also allows for the offload client driver to
determine which SID is associated to the segment_pool if it decides to
map outside of the Linux subsystem.  The new ring allocation flow for
sideband/offload clients will be as follows:

qc_usb_audio_offload_probe()
  ├─ segment_pool = dma_pool_create(...)
  ▼
xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR, segment_pool, notify_client)
  │  sb->segment_pool = segment_pool
  ▼
uadev[card_num].sb = sb

handle_uaudio_stream_req()
  ▼
enable_audio_stream(subs, ..., pcm_card_num)
  ├─ data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint)
  ├─ xhci_sideband_add_endpoint(sb, data_ep) ← ep->sideband = sb; sb->eps[ep_index] = ep
  ├─ snd_usb_endpoint_prepare(chip, sync_endpoint) ─┐
  ├─ snd_usb_endpoint_prepare(chip, data_endpoint)  ├─→ xhci_check_bandwidth()
  │                                                 ▼
  │            xhci_endpoint_init(xhci, virt_dev, ep, ...)
  │            pool = sideband ? sideband->segment_pool : xhci->segment_pool
  │            new_ring = xhci_ring_alloc_from_pool(..., pool, ...)
  │            ▼
  │            xhci_ring_alloc_from_pool(..., pool, flags)
  │            ring->segment_pool = pool
  │            ▼
  │            xhci_alloc_segments_for_ring(xhci, ring, flags)
  │            xhci_segment_alloc(xhci, ring->segment_pool, max_packet, num, flags)
  │            ▼
  │            xhci_segment_alloc(xhci, pool, max_packet, num, flags)
  │            seg->trbs = dma_pool_zalloc(pool, flags, &dma)
  ▼
xhci_sideband_get_endpoint_buffer(sb, data_ep) → xhci_ring_to_sgtable()

qc_usb_audio_offload_disconnect() / unreg_xhci:
  ├─ segment_pool = sb->segment_pool
  ├─ xhci_sideband_unregister(sb)
  ▼
  dma_pool_destroy(segment_pool)

Similar logic is added for the secondary interrupter path as well.  The USB
offload class driver calls xhci_sideband_create_interrupter(), which will
be responsible for allocating the secondary event ring.

There is one point that was seen during disconnecting the USB audio
device while audio offload was active, where the offload client driver
was pre-maturely freeing the DMA pool before xHCI core was able to free
the DMA memory allocated for the rings.  This is the reason for needing
to explicitly call the ring free during the sideband unregister path.

This was confirmed to work on the SM8350 MTP platform, with the 
CONFIG_ARM64_16K_PAGES config enabled, alongside tinyaudio binaries:

tinymix -D 0 set 513 1  (Enables USB_RX multimedia#1 path)
tinyplay -D 0 -d 0....  (Routes PCM data to ASoC platform sound card) 

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
Changes in v3:
- Moved sideband segment pool assignment to when a sideband endpoint
  is added.
- Address an issue where during USB device disconnect (while offload
  active), where the offload client driver is freeing the DMA pool
  before xHCI core is able to free the dma allocations.
- Update xhci_ring_to_sgtable to correctly allocate and fill the sg
  table which capture rings within page offsets.
- Link to v2: https://patch.msgid.link/20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com

Changes in v2:
- Moved from using alignment_req to having the offload driver maintain
  its own segment pool.
- Fixed OOB condition seen in xhci_ring_to_sgtable() and will capture
  page offsets properly.
- Addressed inter-patch build failures.
- Link to v1: https://patch.msgid.link/20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com

To: Mathias Nyman <mathias.nyman@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org

---
Wesley Cheng (4):
      xhci: sideband: fix ring sg table for sub-page TRB segments
      usb: xhci: sideband: allocate sideband ring segments from a dedicated pool
      ALSA: usb-audio: qcom: tag sideband endpoints before ring allocation
      ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on 16K+ page kernels

 drivers/usb/host/xhci-mem.c       |  63 ++++++++++------
 drivers/usb/host/xhci-sideband.c  |  97 ++++++++++++++-----------
 drivers/usb/host/xhci.h           |  16 ++---
 include/linux/usb/xhci-sideband.h |  20 +++++-
 sound/usb/qcom/qc_audio_offload.c | 147 +++++++++++++++++++++++++++++++-------
 5 files changed, 243 insertions(+), 100 deletions(-)
---
base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440
change-id: 20260824-16k_offload_v1_b4-3d1460405774

Best regards,
--  
Wesley Cheng <wesley.cheng@oss.qualcomm.com>

