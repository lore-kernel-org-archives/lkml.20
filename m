Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9E84825D6
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373117; cv=none; b=u9gtKOkQN+cVOEYLomRHSVq2b8TZiOEvm07cRrHkEdIKVA7Gzv8DSB0vtrk6Wy5PtlglNrM6IcbOmX37xsyyjb8AB2FlpyWZdxO+lqMXkfVkFAuqCAJCn8Tmq2yP/N85XOiQ5GCPrOpKZCWXNEZosjmjBpxzutuNK2DHkQHPhzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373117; c=relaxed/simple;
	bh=gD+sZ/XfrHoeN0nWyfXWUolsOlsAlPdOWWDPH+/1dI0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eDdXzln+GSNlM3bYyWF6So20jlJsNSGZ6dZB38Czfx2vCRqolmOIlFtbmOtfNLlvr72jML+lYt2MyM/kOF/fUr6OcjTctSUgvQLGoFEW4AYvCRZYaOY3zn0p0e4JCuVFuqpZEqomGyksZwLHl4W42QavP6ASKYkDqlLKcvXEgnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0K3CFwz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBjV7OId; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0K3CFwz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBjV7OId"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVCM03198233
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 11:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SCLqHrdRMDamyWTNpn1AL8
	6J7a2kB3ua/9lYaSuJ3BY=; b=X0K3CFwzxAayaOK1TtbGpm0N+yzvMeXqVWfYIu
	fqST2KBf3p07VV2eXmD72p9bOZ7bmV1YdvwB/TRe97/pFIqVtZOBxDoX+V3+OKV0
	L7An974wd4iyoyX7RCgbWasjGT1eF2b14vBQR+o92OuO3cDnlhQDoN/P4C0OICWB
	MWHf5VWngtAAzmhy24nvuBJKLTMrnSr2i0rQt3lP9srkDUr4DDk56vuvIjc9vogD
	m1tJ1N3ge4VHBvpAJid2MrAAL6wlNE7z/4Ut5aZ2h8ltIPFfkqVX+US9QP71PZ+b
	HYhx9b2uLarXjeoI49RsMYqKK1pLxEHVNhWjsglaxuALu1Ng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1w9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:38:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so7504410a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791373087; x=1791977887; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SCLqHrdRMDamyWTNpn1AL86J7a2kB3ua/9lYaSuJ3BY=;
        b=fBjV7OId4NXHZkv7o7CCkveGWdQ70RB9hRopQlbr+gFjGGP5h5EvwLBLWL5wAT35de
         cjaCSI0G2KNlGaoirx2lGG9xBuLXPrGf/xLt9fHJgCkmoPHJBDOg6BHl93cf58p20NDh
         wuLJ4OWh3Pj5Hoh8lrc2Jq8FduqJATIRZx46xJfMYTG3j6PEQ6SiGVlaB7uYxDq19fB7
         QdofIIHAe1Vqj8ooq2T78Bg2Z7xgxnwEyW0ZlyAbhmv8yjDnP+wQSvMErt/gyDZ9Ff0Z
         8/hZcf8yrzb76b3ECOXKHweHjjkeOXpTL+xd+AMENPYOsb08qzRSLtGnU2FfI2JJEmAa
         kc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373087; x=1791977887;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SCLqHrdRMDamyWTNpn1AL86J7a2kB3ua/9lYaSuJ3BY=;
        b=GcT2uwgB1CpzW8oxZEhEEYtBt6kWPiNpX01CCA1Ou0X3hiQ6yVRp7tB4FXghww14X2
         2VrDmCs950Q6+gkJezPSES8xxYI/1sxP+A4LsXrK3avlDQR0SU5JpE4yVxy71yK8djzI
         dmrOPpy7dhkwBwKYrrBQpAdP/vnmvuMXzPLaHotczhtZozgucveAxpmnjHN6ibTtJ47B
         m5Pj5DPNYmhW26rTwsr4YCAxGADjuGuob7+D++zU3oH8xAqwk0ccOsR7BWq31Ws1pjz6
         xFhAknzJAfT+Y8jKlCJRlF1Vdp71xrn7w4Q9MfYfTjuCm4whWUmHvpG97IMD03RWHhRq
         7iNw==
X-Forwarded-Encrypted: i=1; AKwUvByGaWHotsZLv8Odm165PCoZu9zFO1jECpkanSVfDgyd8O1hWIOOpz5UnCTkO7Co2j++aH8GmiuWeC9EC4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHknqB/Fvq2K3ni2cEzDTx+YQKP5CRZ3uDCVMCdaGdC4bmEoGw
	Z60SCF324miqm2ZqCgKw+kecMe/qFVSVANpEOzfOT3MgVkQJmUgnJt3sNWyqeosTy3d9ru6Qot0
	bspvG/bZAUF04A5A98U+k9e6sBklQtYdEauMXq0vDB/mR7vzMWA81zC931eoTWC3AS0s=
X-Gm-Gg: AYBFou1rt2Vw4HGYhxbhpyeExUxssg3AUMAgsIZgKgHdxItY9TBnYlCyZA0fDnVtYXf
	KgV1eJLm6qq30vgb0XpESLog1rGGJ/H8M3e4kYX0xanOIXuL7W0S6jI9kmwrBQfvCiczy8gCewl
	imCVg4AgBHffD4KLrTcB8LnzIxyLaIhtG7fUAq1P2HHza5AwlOEnE0jLo1r6C0s7OkPTYmRCawS
	9pKr3xlfsI0roihKs2KqQxL5+qIrbF86ra/IpmbQMYPFK0NbcapTI2FVWXG+0PyscdVwE9ua0zT
	c62LcWLSsKNQn4EeagTbkENfsv+2JOzII1WErJd6GgsZ39fcqZ6dbsuzyUghWhZrogbkjPAtDp7
	hWX6Rgsvx+/UVCutYJ2ES8BzrGTKATEbp
X-Received: by 2002:a17:90b:2584:b0:3a0:7cbf:b8cd with SMTP id 98e67ed59e1d1-3a8a17f8da5mr1710276a91.14.1791373087015;
        Wed, 07 Oct 2026 04:38:07 -0700 (PDT)
X-Received: by 2002:a17:90b:2584:b0:3a0:7cbf:b8cd with SMTP id 98e67ed59e1d1-3a8a17f8da5mr1710247a91.14.1791373086529;
        Wed, 07 Oct 2026 04:38:06 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5e0eeb6sm1454001a91.2.2026.10.07.04.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:38:05 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH v2 0/4] misc: fastrpc: add extended IOVA mapping support
Date: Wed, 07 Oct 2026 17:07:47 +0530
Message-Id: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAsvxmoC/3WPS27DMAxEr2JoXQXUx6rlVe5RZCFRdCKg/kSyj
 RSB7x7Z2WTTDcEZgMM3T5YpRcqsrZ4s0RpzHIci5FfF8OaGK/EYimYSpIFGGk6PmYZAgfdumuJ
 w5dZD4wGVgCawcjYl6uLjiPy5vHWi+1KS57fJvMvEcez7OLdVjTpoYawB7ZWqUTXe47f1KDoEB
 VrapmymY59EBXDnMWB5WCaeKe/cmZOTDp1DYa1u15rt/28xz2P6Oxqu4gD4v8wqOPAA2qBAb53
 tzmPOp/vifnfeUxnssm3bC2KmB/I3AQAA
X-Change-ID: 20260826-extended-mapping-9b08b0c3108d
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791373080; l=2625;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=gD+sZ/XfrHoeN0nWyfXWUolsOlsAlPdOWWDPH+/1dI0=;
 b=4f5g65+nQpadyWvy9XnL7GP5GyYDJdMYOEVAV15iwEdCkAjPxUAXj3rHuGhCzStYbAafzUT5x
 +ZD33dIOYyuBQ6+Ix8prgKtIxSuF2v+C8jdAH5XbjAMLYUQ6VskOYxG
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: yx6LYfNbFIbdj9sl6cLBdXxRXehv8xMd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfXx61J0GvX6nV7
 TyvGdu2f94SALo0ARehcsz0N/sblIZWVscgW7A9VgcQjSxPGK/Ek0Zjiyo/rvXdFJPWdj3E9llY
 Rn4NkMUEf8diS0wb2S8B35v/15hUW1Za67d2tfrBPfGyrd+aD44h1ky3+p4natdkLf+lq5swA2D
 892SA+zxq25vpZ32fq6cRbrWoFr4GeJeM1k+41Xy+gypwh7+0szItZ34lJ2YkwfVTqcArLrxeOo
 43NkRo2lICqt0QGA7BSw8T4qxBKqGSNlwoV1+/8isfS0uokZDkdkdIrhmxa3uhYKVmn743YA7ad
 GORHPI9Sgk9SMnZIqQNlvdlXiae4/FoVwP6sJHEpfVT+tUTBc2OOHbQ7nqtV+ecpExvmvxAgqyM
 fACmPnEoTID/DUrTG9r2noWPrEoW2MNOE9WoFUFQklVeXjM5bCGwHwwU8cMpRQddNVJ/RFRUhRC
 NXrehZSPpOW5RuRrKxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX3gfgwZS7EMpU
 yj7wHQHz9Lr2y4EyP5gp4h9l9sRviwesuLnF7fMqF1hCtI5uoywgBIZKK1uHzjn8XVJbPWT1lru
 fcw2/zxZ3PM4NeII6FBsGXuOFoPXYx0=
X-Proofpoint-GUID: yx6LYfNbFIbdj9sl6cLBdXxRXehv8xMd
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac62f1f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QMnnIbI3AxnTgdsYXzkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070046

FastRPC context banks on kaanapali and glymur are limited to a 34-bit
IOVA window. Large compute workloads such as LLM inference on the CDSP
require mapping buffers that exceed this range. Dedicated extended
context banks exist in hardware but were unused by the driver.

This series wires up end-to-end driver and binding support:

  - Relax the DT binding to allow 64-bit iommu-ranges values on
    platforms that require extended addressing.

  - Fix SID extraction to read the correct cell of the reg property
    on platforms with #address-cells = <2>.

  - Detect extended context banks by the presence of iommu-ranges and
    register them separately so large allocations can be directed into
    the wider IOVA window.

  - Add two UAPI flags (FASTRPC_MAP_FD_EXTENDED and
    FASTRPC_MAP_FD_DELAYED_EXTENDED) so userspace can explicitly request
    mapping via an extended CB.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Changes in v2:
- Split DTS changes (kaanapali, glymur) into a separate series.
- Fix DT binding to allow iommu-ranges on compute-cb subnodes.
- Fix krealloc() called with GFP_KERNEL under spinlock.
- Fix dma_set_mask() error path leaving stale ext_cb entry.
- Fix ext_cb sessions not invalidated in fastrpc_cb_devices_destroy().
- Fix lockless read of ext_cb[]/ext_cb_count in fastrpc_map_attach().
- Fix fastrpc_free_map() using fl->sctx->dev for extended-CB maps.
- Fix fastrpc_map_create() reusing a cached map with mismatched CB flags.
- Link to v1: https://lore.kernel.org/r/20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com

---
Vinayak Katoch (4):
      dt-bindings: misc: qcom,fastrpc: add iommu-ranges support for context bank
      misc: fastrpc: handle multi-cell reg in context bank probe
      misc: fastrpc: add extended context bank support
      misc: fastrpc: add UAPI flags for extended IOVA mapping

 .../devicetree/bindings/misc/qcom,fastrpc.yaml     |   6 +-
 drivers/misc/fastrpc.c                             | 132 +++++++++++++++++----
 include/uapi/misc/fastrpc.h                        |   7 ++
 3 files changed, 123 insertions(+), 22 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260826-extended-mapping-9b08b0c3108d
prerequisite-change-id: 20260609-dup-sessions-ea2acaac1994:v5
prerequisite-patch-id: 425dc9414848bbc3f2a053d067195d849898e2ae
prerequisite-patch-id: 4fea14b47d11a5a3e18065d8cf3a461841ee2b86
prerequisite-patch-id: da0a3d55397a522ea4b77769e387df9faea8e024

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

