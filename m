Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3402EEE88
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789005068; cv=none; b=Dof6HkDKGAIDwlHs4BP6iUxDsyamANbzFEKp3DJxlW3E0qJvUJL82LGtwC0L37l/afEeMQT4nKlnpujyammxs6FTNQoDj53Fnda2u+dMQlsf147dhascstHtL7D6y37oDiYnP6enADYxxxwBmAt9vtb7Xx5bs7JYLkZ0r3uQxHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789005068; c=relaxed/simple;
	bh=FOlFgBzNQmsmf2mxM1qain+v9nwTFgYyvo/6ZqB1Hhg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rsKf/5ww9THYTlLvL/tP+4qrsxuCF2zGEyonLPjkV2AOsgl87QW9qNf5CVY9mFqsCTMb9Ct8eGUT/wKxLM0azEVTO9V8wiQ6N48UmPW+5+MR6U/3MHwGTf/7YYm7Kkha5fTAWG1XEWH51cYBICqC2mrfHuYnjJnSVVHB9xV7/Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JR4ygGUu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hyq6ItSP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JR4ygGUu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyq6ItSP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1lah33730948
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SrSZI6Ybjmzh+sw0W1djqr
	FbVUp/nFn43K58gfPIONE=; b=JR4ygGUu0euvgNocvNM3Ix/rArZBvgIXjBlhtg
	R56sLgoTBd/bwQmbev3TPNWOqwsRDCUisEV9Mizk20dreyq83NyBtab0zryReJWq
	rwRc7XNDkVmuLjoNNHbAnFID0nYEnvnsHsYohLGluVyQ4VSERQKVn3ARLIgs2pNw
	b1qPWDZwmg0lhi/347KAsBuSLetPbT1lxepyzvF3ScwsnIh+C1p13w98bu3lDLxF
	tS3JL1wVRM6WSU9soiRapu25dnLWbICmhIb1IxyXG+Q62Mj6puCYxz2+B9cyjq0Q
	E347V+vSlgFOobNnIeKI647kyYfLJQbAcudZ9/b8YqFBbsyg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygsh7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:51:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso9515088a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789005065; x=1789609865; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SrSZI6Ybjmzh+sw0W1djqrFbVUp/nFn43K58gfPIONE=;
        b=hyq6ItSPWofR495e6cJXk7S/IhC5djxZht6HmDAOC9M+CSbgmYLGuNX5NxNC0z8KwT
         3qRs2Y3iBb/POprsXS0xKqMMnuq586IOXjFDyvRIx/8anv4vfSJVxeo0FK95YRKI2mBZ
         wedH/Dqyik5mwGaybXInYS87GMGWqSfTQAxAN0pMQwlBxaQ9U0nJsBLXYPX0EbxbDxxM
         O5kzgv3aep3PhsuxKrj01At0sx8c1GxwRhTX7gL/+OsuAaLrYtczKKitfjrVk1Ok/i4G
         lqYHYhBD7muCV9raGFHVac4Juu+duqNxThIE2m1Cr2teFxwV/sfqghp1RXzzJLq2issh
         yhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789005065; x=1789609865;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SrSZI6Ybjmzh+sw0W1djqrFbVUp/nFn43K58gfPIONE=;
        b=GgUD9pIwhMgDh1BCT/Ce+ynOjgIYzYGxi/OThctAaJ0fpiu2HB7w5fU1fDgfQ9DW41
         ZRESxodHo+n+FaipIlW3T9685DSZPgiTBx4cKvyer2p1OTt9nOJn2+7MFtwGQdNj6UIx
         pb/XSlO+rBoak0v7Hrs4BqS/2ya1qPsAI8yemB1/1XjXacso0KF1xEOaOQIAS5Fh83VB
         SdMDXQJ9mz21hM5KRiq3WMX3+l4IxWh7ATnkdZGvGHlV0NuM3VsaCwSjCeQ+OX6FlQHa
         TmbZOEQLJm9BWB0sYav7e5i2LqeshI+tcm038CjLQcxkJ5MOSfuiZMh8Oxw+V804DOD6
         1O+w==
X-Forwarded-Encrypted: i=1; AKwUvBzr0Wt1uE08C7U4qxxMyYRvFTh+WseEuhfUTHX+3Di83+0dr2/dc9V+e7EfkpoHhDVlAU8RAfru5SQn0Y8=@vger.kernel.org
X-Gm-Message-State: AFuF++kV41nTgCExI6WF9BSgAT6AG6ylLNugLJMWY1LIz9j/D+K1xyqc
	eMN7FzfPxi5Vw9sxoYpeJunh/hdWtKVpWh0BkNFp4JkKdW89QaTririaCvnzZgxlTxQAftUz34k
	UE1erD0giNFbRqI99RlpEBEXw+nqYGMPyRt7BhtB0UAdUtz+AozoK/yih2DzZQL1FH9U=
X-Gm-Gg: AYBFou0TgZddYSGKPCsqLk7RD41KrC3+/BHTa0KrMpKyAOuwPR8BxYoWQ3jk5L+Se6Z
	Iq7Eb4qiupphTCFayOT1muud2Zkn2v3pAXRY7qKjYRIvNBCfJyHaoySdQAgHBmKAOt9dZwsqkVX
	0Km7P5dgokWScoX5Y5Pd1mImXqUBHQu5Xlu6L1Xqw8lBcLkKWnGG+dwps5QDVdwbiPW86uX8xaQ
	Ptp9lN2/e2iytxDvIJ99qltVPQ68LbUdInW7fmfnNgfPiF4/uG6kY6aQCPLZ9Ytb5NFRTusYG3v
	7TC3QwQSrbQJf3KP06wRZ1vBXXtGyMJunA2SMezMPf2Yy3GCQy65NluAHTgyI65NDJrENQx6zbN
	zbZvXnspc7qZq+knxeRvF9JhmmXoDq9Nd8Eda6odOMJSch7ihZRTA
X-Received: by 2002:a17:90b:314e:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-39b261500fdmr52970999a91.4.1789005064803;
        Wed, 09 Sep 2026 18:51:04 -0700 (PDT)
X-Received: by 2002:a17:90b:314e:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-39b261500fdmr52970946a91.4.1789005064302;
        Wed, 09 Sep 2026 18:51:04 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm47446234eec.12.2026.09.09.18.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:51:03 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 0/5] Add larger page size support for USB audio offload
 path
Date: Wed, 09 Sep 2026 18:50:56 -0700
Message-Id: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAANomoC/33NTQ7CIBAF4KsY1mIGGJG68h7GNECp4h9aLNE0v
 btUF7qobiZ5yZvvdSS6xrtIlpOONC756MM5B5xOiN3p89ZRX+VMOHAJiiNl8lCGuj4GXZWJlQa
 pqBhKQJgvFkjy36Vxtb+/zPXmnWNr9s7eBmho7Hy8hebxGk1s6P3zE6NAsdDSOAlWC1iFGGfXV
 h9tOJ1m+ZBhJvFvSI1BPENKoxSycMYY+QMSH6gAMQaJDDExL7iqLEdQI1Df90/P6rOcXQEAAA=
 =
X-Change-ID: 20260824-16k_offload_v1_b4-3d1460405774
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfXwCL+v0zCkhtL
 FRXOUB7Eeo0hZSJs1LElFcvAt6P4VdC7BNcb0ckxTUMO7RDSb55tUleHKIY6aMP4iEM03OKqesR
 sPSeN9lnsbNmPAwhG5g8vlEhfATHaaxf3JIQiYwxON+tTQaSvAuGgwgFfkcXEf5ATgEdWDUEUYo
 rEoHXe7h+sfmr0PlOkF4TfhqFi1KR5aTzD3wd13lhjbXDfjqQvPhQI8JKCJH13xAnNVftUlA2D2
 uJzbuOFWHTmUjxP18ubQOlSAjNaBEt7GI77FiWF6R2+IzFp3Rm5YMOQxKY3xLbu6qiT5ppKH2PH
 1wJ2asvJ95ir+KNBADhoYOQFoN6ZEjH3A/WYIoP2A3PgtR3q6AgZR4bMeQXcNfv2v2vdboJY7bp
 QBSwM3eUbj+GciCZBDDY36poW1nP93rF0BrmL9GEA/CkktRZamKWksrZD4pHXuP6a9R8EbKRs5X
 Grp34snsQItKmiGrk3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX+Xrsf9Bl4PTX
 FBvSM+zYezqbLy4SwnUPgXCsRVJgLDHr71KjhQzDV0rFE1NDbw0azHajyfdNGIBDiDWFqg9/hQ/
 KPiicoKc5Xy/2yEFp4hj8N3JcCQhmHA=
X-Proofpoint-ORIG-GUID: JVj6EKKWwVOe-fRY0lp59ZMIAb0TLEJE
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa20d09 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=ag1SF4gXAAAA:8
 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=GjhRyQdd-c_DPEUQ6LMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: JVj6EKKWwVOe-fRY0lp59ZMIAb0TLEJE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100018

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
Changes in v4:
- Split xHCI patches from xHCI core and xHCI sideband.
- Make the dedicated offload segment pool optional for secondary
  interrupter creation. (xfer rings support this already in previous
  revs)
- Fixed some inter-patch build/functionality failures in
  qc_audio_offload. Incremental builds between patches now
  work on 4k pages. (16k support at end)
- Link to v3: https://patch.msgid.link/20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com

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
Wesley Cheng (5):
      usb: xhci: sideband: fix ring sg table for sub-page TRB segments
      usb: xhci: Allow to specify a different segment pool for allocations
      usb: xhci: sideband: allocate sideband ring segments from a dedicated pool
      ALSA: usb-audio: qcom: tag sideband endpoints before ring allocation
      ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on 16K+ page kernels

 drivers/usb/host/xhci-mem.c       |  63 ++++++++++------
 drivers/usb/host/xhci-sideband.c  |  97 +++++++++++++-----------
 drivers/usb/host/xhci.h           |  16 ++--
 include/linux/usb/xhci-sideband.h |  20 ++++-
 sound/usb/qcom/qc_audio_offload.c | 151 ++++++++++++++++++++++++++++++++------
 5 files changed, 247 insertions(+), 100 deletions(-)
---
base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440
change-id: 20260824-16k_offload_v1_b4-3d1460405774

Best regards,
--  
Wesley Cheng <wesley.cheng@oss.qualcomm.com>

