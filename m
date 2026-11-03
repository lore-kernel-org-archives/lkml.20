Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715558;
	b=OHdp0K6Z8qu1tKCZYJAFlzgymSVXgWkdlGK7c9Z1Qh29/fxRMEaLMNK1PZ0KRsGz+Ei3
	 qA1zLMKThcKMH+8/LpL6U4tkECdIBdVV5O57OVgGmPoexmsWKiwZwxHVJ4gpZ5/CV6ZKg
	 KiZ1eHasn6hkZhErTVboSUb6l8wukA3uDsJAZVEWvFYi/FJM5vp8PLjwH7GiX/5KgE7EC
	 rrAuNiGXDEueiKpuohiC6ymAaMQ5BeQIVJElU7HKQ5EO9awEar214wr9/UaysaZx1952f
	 yiLcNi9yVR06vnR8a4LPPeo6q623G9wUAwMh+mKUDq2UqwSl9Oz4qqSbyDFhG8EYgHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4LuEy6IhB8pSbk0kcs5uK0Z7FtwI3tqXcdLrx2Csgtc=;
	b=zRdyY6OoZhSZaSIOmE6c3T87gZBlm8ZCs6TysfudtiW0nOhGF88wi4fSCsQ4bnqokQzS
	 /bjFIBeoArFEHkVvJ6TKgfv29U5/ZxEAlhcIwlK/wvAz9tQE9T75Urn855dEjIPu7o2sJ
	 cCkK4o5RswwOwlddt+RdxBXLjoKA3oxaa6PdM/GUNV/onkC3vE4G1SAICWbGKC6XGosGA
	 O+zLlKv4ia8Qs1iMlSnlAOk9yDyixwnZA/Z4bOv9MKsRD696hZmnG05wgp74XZ/Fuo1U2
	 W56lzYb4aLcLTo7mXxqQcbhvI8ghbEAOUuDnbPMTWPQRDYjiNOVF3k3rxzRlvpNMuSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MbjjQj2z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F87wMSaF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D7A606EE97
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4D7A606EE97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MbjjQj2z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F87wMSaF
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9vI32526760
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 14:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4LuEy6IhB8pSbk0kcs5uK0Z7FtwI3tqXcdLrx2Csgtc=; b=MbjjQj2z6i2ztnqT
	dSBzupNWBAHMJuEcJVazkJuThEgr4Qzqfxm8kA5yekFV/c+sKvRkn3pIFd1/+mEB
	D9CubqaEOmRuUW/6bdK6OYuGuOoJkirx5CrzGrlB9pMF2Dtr+zPx5dk9sUVKny9h
	ef1B+xSnolHdht/nZiAVasUsOOoUpjVYyC9v3wFJOntkXu4TbmR82Aeq65XJ+9j8
	rY60GnLA44t+qRTR7yTpN7eq1NhpiaqW1FO89Pd2T9Ael8S2WoLX9YuQsTx2PHdl
	WmDtNS6eVocsfA6LFZ3pOAM4rFCRZUId67iG8T3lh5585Fb3TnLCLM6rZ2sXbjn6
	zg1HUA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7yctdqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:19:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so4388255a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793715556; x=1794320356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LuEy6IhB8pSbk0kcs5uK0Z7FtwI3tqXcdLrx2Csgtc=;
        b=F87wMSaF8WsLLpczE/r7Dj3ED84tIbM7JMA6lozpMKhqeUEgt5OPgFGCK45kn+bDdS
         egbfiVLMO75CnSCNnuWXHd2U2nURQCGNfyydp1mPOyUN7qhBR2/KvF75Vrl11yELvKWV
         Uynx2DF36i4mt/rcBSoNeFI5SzQcTL74+PIQCdGkArH1gF/yPix8iKlIOL933CurJ19t
         Qu+e6i8n/X/mwrPWJxIi7sjyRT17iI820KqImfVIgXEi1wKaPxBqa6AW3uY6G2HbMv7k
         UeqMPk7GM3KBDr/88eMr8ZEHMgk6gIjt0eVYULh4n8BhPSn9Eayv7nlweo/xuhHeh44a
         RgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715556; x=1794320356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4LuEy6IhB8pSbk0kcs5uK0Z7FtwI3tqXcdLrx2Csgtc=;
        b=I1LNUCSpjOps02KdFJ8dmQSwROZ9E9jhDr4bwng4GO72YuJqcaV39URyxK+B0eDm7b
         tPwlwJJh81EDhFs+KjyVDE3ZE3wOUdcHoGQ2n2NIUcfcuzbxwC19OyPW/R/gPEZKFhWJ
         B46mdqZt3A9Qky4BcMYUMOIuKKYWfe4XOBzDIGNKpPM+aBWsv1uUy1Vzs0EoRHk+o0qg
         P37tTdhkCtUpCV7/fSwL4rjjOITfP73+4xp4doCRDc9RhVJz966ixuhrJbF/fnzI7j+Y
         dx5awxaEDq1jilZg1Vhzu0yBrEHdAJ+21n/f93n9zr5yJZMD1L7d1Vz0Lr1zY50x/ahh
         1wkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPrArj3oMcpsuYW395BSWK9xxw4BDCzGwVScf93hTIGkAOhyjU+t0oU+lKE6hkJwxeZR7clUV2Jlw0ysI=@vger.kernel.org
X-Gm-Message-State: APuU4Z97ae/2f6/flDVLoko8TTkkq5HHbOgGb2wCZ+8H09otTb4AdGZj
	HNM/n/e8gPLHpbk+LzkwIVNSdD3amOIZNzeKTdggreuSrV3JqMWII5oxf8G8kPGzna0chPOtkvI
	gY9zUq9heav/2Y2+95zMoZSZTCcKSKR2KtQC7lYG9Sr8lD/4IwGsL6Q9n7PvPxX2MsmM=
X-Gm-Gg: AYBFou0M4ndfNHdQgHXTwBkELVe8QgVx8u/HB9aD0W0XFgssn/DYgu4/jFGQ0SB04x/
	uqhAd0CO5YawxbQwJT7NXgp0zzvMpvkJl1UwZz0NPdK7OzVLWoeAllfEY+CyAiTyZ1NHCgPUuoF
	iZWF8Hvd4d5waOXGqLpqsx6xl/+DZ7YVf6AsIEvnp3ZgCI/8u4ChnlaQw7bWmeT4VLdQWrNTsep
	DxwmsA95/do3lOzSGIi0hXe17NDg5KekgrnaUpN4KOCLwHS/9Fjjh3Ueu0FFdwCpFtqrC2e2RDL
	lQrQuNQ2eAViarSgX9i2fB6Wu8aupQephVkGEfT7Ocb3HWIyukDq8aguIoFYm7e/IVZM+bmpI2y
	fdB+39aGTCk5fdS+d651XpCSy5v5yDVU2vLcqLqc+gv8zIDJPbWbfxid8eYq9zoHgTyUePNOTsR
	thpBbJOWoP
X-Received: by 2002:a17:90a:c88c:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3ae8984cf7amr11183300a91.61.1793715556246;
        Tue, 03 Nov 2026 06:19:16 -0800 (PST)
X-Received: by 2002:a17:90a:c88c:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3ae8984cf7amr11183277a91.61.1793715555711;
        Tue, 03 Nov 2026 06:19:15 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb36468be4sm1442126a12.12.2026.11.03.06.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:19:15 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 19:48:42 +0530
Subject: [PATCH net-next v4 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
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
Message-Id: <20261103-qcom-bam-dmux-vmid-ext-v4-2-3690cc5ca0fd@oss.qualcomm.com>
References: <20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com>
In-Reply-To: <20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com>
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793715537; l=7774;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=VwmK+MyKjTC8xukaiMXq7SzLhv0/pAEWqgxjqWNpToo=;
 b=f3KTiwTICHdaJBHNGtP4Y4NAEQFRqO7WH7OnCEmM0E0CNXrjyWnCbGlXpIeoqGjsg5Zbf7Z6X
 tPWVTJliuNmCCDGHEKrn8ieVVut62AIulJalu7cbKP+39de22xCya/M
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae9ed65 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_LqUGthVNh1NuqRdQHsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: SoSiKH6RRlHc_jRPZG_0Pgb7xtPnIlQy
X-Proofpoint-GUID: SoSiKH6RRlHc_jRPZG_0Pgb7xtPnIlQy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX56io2VvmX5Vt
 srV3Ij3FwVBzXRuoFURJuwzZUdX4A4Js25DhxokU9NU2wemzRgr0CyxdI4Nu0932SujMSzh64FA
 EGitExorgdY12Ob1lFtHQM1Uikii5xDVLV2ampLHtf8oE+E/egfYd0B1ZffsXvCLc/3yjoOPRVq
 ryFd3zYPDBynP1xU9kzM7m9btnYo8rDmuCo3s3WDoBe+w/YVH+p6d006Xcan+kk4Egq8EEICLpq
 Mf8ZvDJ8ZxjrYG4jKCNEcrYPbWqt6FDEB/mUTIyYZUKGGn0O5I/fmpy/SzdyVNvKGPiEs5ujYoa
 E/X2P5XmLFwG97+EbbGgIBgurR9vQN78UNbPEIlqv/XRoMOiDRXNk5uh27/VlDOSks0kRZUphEu
 Fgl3nUmf8s4qJnZHfKl5VdygxaAgm5HuQFt2RsyDOqDeFJGtTREeZSv8bnudfJICysSEY/RrW1R
 ogJ4J4ffg8kz7aRA5Nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX3gItrfGn4Z91
 zTHbUyUYGCEXX6tanXS9Woy4FCuz+/X58DYg5JaViEgcOJP2uVybqXdUPUh2Uj6zgiyeBW936lI
 +GD+pzRaRszk3dzRdgaQRPOwV0zvb5A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030056

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
and BAM descriptor FIFOs must therefore be constrained to a designated
memory region that can be shared with the modem. Accesses outside that
region can trigger an XPU violation.

When qcom,vmid is present, require a restricted DMA pool and assign the
entire pool to both the local and remote execution environments before
requesting the DMA channels.

This ensures that BAM-DMUX mappings are within the assigned region. When
the BAM DMA controller references the same pool, its descriptor FIFOs
are covered by the assignment as well.

Track the assigned execution environments explicitly and reclaim the
pool for the local environment after DMA channels and mappings are
released during remove or probe error cleanup. Skip the reclaim and
leave the pool assigned if the remote side still holds its power vote,
since it may still access the pool.

Fail probing when restricted DMA pool support is unavailable, when the
VMID property is malformed, when memory-region does not reference a
restricted DMA pool, or when the pool is not attached to the device.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/net/wwan/Kconfig         |   1 +
 drivers/net/wwan/qcom_bam_dmux.c | 114 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 113 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
index 958dbc7347fa84ee869439bf8b503037faab8bef..1b133c56231615269698140187ca3141dfe48dbf 100644
--- a/drivers/net/wwan/Kconfig
+++ b/drivers/net/wwan/Kconfig
@@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
 config QCOM_BAM_DMUX
 	tristate "Qualcomm BAM-DMUX WWAN network driver"
 	depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPILE_TEST
+	select QCOM_SCM
 	help
 	  The BAM Data Multiplexer provides access to the network data channels
 	  of modems integrated into many older Qualcomm SoCs, e.g. Qualcomm
diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
index cc6ace8d64371eb8d00c638a39b234ee540b83c9..c9639474e58acc16ce0d04f181b2e999cff42bd1 100644
--- a/drivers/net/wwan/qcom_bam_dmux.c
+++ b/drivers/net/wwan/qcom_bam_dmux.c
@@ -9,14 +9,17 @@
 #include <linux/completion.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/if_arp.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/spinlock.h>
+#include <linux/swiotlb.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <net/pkt_sched.h>
@@ -75,6 +78,9 @@ struct bam_dmux {
 	struct completion pc_ack_completion;
 
 	struct dma_chan *rx, *tx;
+	phys_addr_t dma_pool_base;
+	size_t dma_pool_size;
+	u64 dma_pool_perms;
 	struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
 	struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
 	spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
@@ -762,6 +768,96 @@ static int __maybe_unused bam_dmux_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
+{
+	struct device *dev = dmux->dev;
+	struct device_node *rmem_np;
+	struct reserved_mem *rmem;
+	struct qcom_scm_vmperm dst[2];
+	u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
+	u32 vmid;
+	int ret;
+
+	if (!of_property_present(dev->of_node, "qcom,vmid"))
+		return 0;
+
+	ret = of_property_read_u32(dev->of_node, "qcom,vmid", &vmid);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read qcom,vmid\n");
+	if (vmid == QCOM_SCM_VMID_HLOS || vmid >= BITS_PER_TYPE(u64))
+		return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid %u\n", vmid);
+
+	if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
+		return dev_err_probe(dev, -EOPNOTSUPP,
+				     "qcom,vmid requires DMA_RESTRICTED_POOL\n");
+
+	rmem_np = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!rmem_np)
+		return dev_err_probe(dev, -EINVAL,
+					     "qcom,vmid requires memory-region\n");
+
+	if (!of_device_is_compatible(rmem_np, "restricted-dma-pool")) {
+		of_node_put(rmem_np);
+		return dev_err_probe(dev, -EINVAL,
+				     "memory-region must reference a restricted DMA pool\n");
+	}
+
+	rmem = of_reserved_mem_lookup(rmem_np);
+	of_node_put(rmem_np);
+	if (!rmem)
+		return dev_err_probe(dev, -EINVAL,
+					     "Failed to look up restricted DMA pool\n");
+
+	if (!is_swiotlb_for_alloc(dev))
+		return dev_err_probe(dev, -EINVAL,
+				     "Restricted DMA pool not attached\n");
+
+	if (!qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
+	dst[0].vmid = QCOM_SCM_VMID_HLOS;
+	dst[0].perm = QCOM_SCM_PERM_RW;
+	dst[1].vmid = vmid;
+	dst[1].perm = QCOM_SCM_PERM_RW;
+
+	ret = qcom_scm_assign_mem(rmem->base, rmem->size, &src, dst,
+				  ARRAY_SIZE(dst));
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "SCM assign restricted DMA pool failed\n");
+
+	dmux->dma_pool_base = rmem->base;
+	dmux->dma_pool_size = rmem->size;
+	/* Track the destination VMIDs explicitly for the reclaim operation. */
+	dmux->dma_pool_perms = BIT_ULL(QCOM_SCM_VMID_HLOS) | BIT_ULL(vmid);
+
+	return 0;
+}
+
+static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
+{
+	struct qcom_scm_vmperm hlos = {
+		.vmid = QCOM_SCM_VMID_HLOS,
+		.perm = QCOM_SCM_PERM_RW,
+	};
+	u64 src = dmux->dma_pool_perms;
+	int ret;
+
+	if (!dmux->dma_pool_perms)
+		return;
+
+	ret = qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_pool_size, &src,
+				  &hlos, 1);
+	if (ret) {
+		dev_err(dmux->dev, "SCM reclaim restricted DMA pool failed: %d\n", ret);
+		return;
+	}
+
+	dmux->dma_pool_perms = 0;
+}
+
+static void bam_dmux_remove(struct platform_device *pdev);
+
 static int bam_dmux_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -796,6 +892,10 @@ static int bam_dmux_probe(struct platform_device *pdev)
 				     "Failed to get pc-ack state\n");
 	dmux->pc_ack_mask = BIT(bit);
 
+	ret = bam_dmux_assign_dma_pool(dmux);
+	if (ret)
+		return ret;
+
 	init_waitqueue_head(&dmux->pc_wait);
 	init_completion(&dmux->pc_ack_completion);
 	complete_all(&dmux->pc_ack_completion);
@@ -829,8 +929,11 @@ static int bam_dmux_probe(struct platform_device *pdev)
 
 	ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
 				    &dmux->pc_state);
-	if (ret)
-		goto err_disable_pm;
+	if (ret) {
+		/* The PC IRQ may already have powered up the RX path */
+		bam_dmux_remove(pdev);
+		return ret;
+	}
 
 	/* Check if remote finished initialization before us */
 	if (dmux->pc_state) {
@@ -845,6 +948,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
 err_disable_pm:
 	pm_runtime_disable(dev);
 	pm_runtime_dont_use_autosuspend(dev);
+	bam_dmux_reclaim_dma_pool(dmux);
 	return ret;
 }
 
@@ -879,6 +983,12 @@ static void bam_dmux_remove(struct platform_device *pdev)
 	disable_irq(dmux->pc_irq);
 	bam_dmux_power_off(dmux);
 	bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
+
+	/* The remote side may still access the pool if it holds its power vote */
+	if (!dmux->pc_state)
+		bam_dmux_reclaim_dma_pool(dmux);
+	else if (dmux->dma_pool_perms)
+		dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");
 }
 
 static const struct dev_pm_ops bam_dmux_pm_ops = {

-- 
2.34.1

