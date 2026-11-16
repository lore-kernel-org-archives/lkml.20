Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846146;
	b=mW06eishm/kqhHKmJuGrUowqAnl0G2mAYOWH+O5haIyxz6gVO5I3hhEVxoLxpUDYOLBj
	 RuMoxuSiR/QwsdN5SI3llJvxhbafdWkhMnDY99YgqfrvP3NAnsH3Es/ta+Ea0eZ+xNffy
	 dZ9uY+yp+VAkYTKiyN2j3nUjLo59Y7AVGamB4xKBv69nilEvc/cfXOLr9nTIKJFpwzRQR
	 oOff01Hi5IIjoUSaN3jzZc7RBHXRuAjDFsC3+ZpHNgtEi/dmxPCrKbdG8Fvfpan4PEY2V
	 /CJ7fPxzA9HIcliJEMg0Jwckf+buKOXbchSW4OOljaoKQF+w5r3mVcC/FTQGeoTbreQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846146;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uySENDl4qHKLED5Y781UpPB/TLSVGsjWluRr5p+nyD0=;
	b=O2A+p86tq6pbWKXpcxFv0H+8dNOCrQThFzEuQ70a6173L9ZOUdJQB6wdz+h5ry+zHMy0
	 M1ZEe9+88izJO5HTS7gH+OZDoAlU5dXWmjsJu9TAJQTIKH4yyDNxAR4U7cHmVxnKp65cH
	 ua5XBGoNmlH0ZvaIWes+/q6RZpwcrchW3p7Np2hp8B8UB/2shecy6WA6QRh99uDodHL+X
	 uC6bQqNtnv4fDiOUt86+frB9yv4qRcVbUH+MUx34ZMl3na/nfeFagnWIpJjH2/GlPE35/
	 EJRIpGqsYBLTrYVbS+tta1Y9//HWpRiPo0TG0FZba3JXIAXKaYZTxklXvBCLmdnawpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1P5lJvN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C3inMTJO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001A3606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 001A3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1P5lJvN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C3inMTJO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIGQc2126194
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uySENDl4qHK
	LED5Y781UpPB/TLSVGsjWluRr5p+nyD0=; b=Q1P5lJvNIeKfL56TfRIjIR9jsbt
	77bTCWfZSMMnZXthPUTgZCdXpi4O2Zen0smhOrBw2karVbUu/j3OLL7aN8MglY0P
	bGJvdD4H3Xu0ByqdwaJVvWSdqOKH41uHf3VhbLRtzbMKAGEFaCkemwzQjUw8ao3l
	G/Sd6Iu4A7qRqNEwx/uhcR+aDj1Db70ZP1ARRIeLTctUDqzGwpb+fbl7kKjxxiFF
	NMBrW3TMolw/qsJAgwxAN2B3Z625QLgJCPte4FneviTa73W5lH1TVWNjC+j2wOKV
	cHQH4ip5qU2JKos01EIjcSpvU2+6j7Tre8SmYWS9yvw9okcMylQgj1en7gA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2hnq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:22:24 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1aa0fb7f157so4355386c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846143; x=1795450943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uySENDl4qHKLED5Y781UpPB/TLSVGsjWluRr5p+nyD0=;
        b=C3inMTJOEFnoq3f3SuD5ndqNzYP8JBQvQLXsR3yhpcLZEKdYBLTv8zBlU/txXDdLFO
         SvX2cwYudo40C1hOPkuEWaMBUQMfnO/aJ2j5HSBl4LqvEMbvX16ILl4rkTTsCP54wuzy
         ATUN2ZXSvtQVm/rVzjk1zttkwC9Tv8oq4wCG/YtVDeU1PmvR3l3YdS5C+wjQHOsxknyh
         VG7eARFgxmo+1ah5v4y7qdMhf/2OtBzAWCUEgVC9II0XGMF5afjbLDaD+Y3luGxyhjrg
         78fwQHt2F3Mn9Xb/mM7aJ3voE9XPsdoDiMmD/8XOHa/91DN6hSncAAvxW41GbbecY+lX
         ICWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846143; x=1795450943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uySENDl4qHKLED5Y781UpPB/TLSVGsjWluRr5p+nyD0=;
        b=qs3mphJSzW75hG+Ho6piGOtI40zVxcNVetoyaEs365lK+JXGPp+GCLbISlFc9Q3JBg
         2U6ZIyk46V42xFx35OpGUq3eel4cw563T+NEkFYeM/UdRdzNJ1c3PIHhzEil0/WXUmEe
         9L2/pYVZAOYZEaTuHwmfNnrAgKWQBPaqMPPPtqpOG10eddYsTJLcTTj2kCw2l0luX6ZG
         G2qO8PrVeGMmkboF2ASiBB8PotoJn4gEw94wPzsYjQ6wruT/VWsVbUxa7e0IkFdf27Da
         F/XikdPQ7wJ6Ozx8STRzagxMTdLebRck9a5hfTVJp6sjpfC/ZvmoRpr2Fr0ll0QRvYed
         8H1A==
X-Forwarded-Encrypted: i=1; AL+hErFIAq2txQeenlBWXEUJNtROb9O+rM6vK83gh1c6klUchTb4thLuNteHy6AigTRXVz8o0VjK0OgNzw5ujxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FFJfnWQzYMwvnGRf8Z0GyKkTAKTLzHRnBsWUVn5wPf6oHwhJY
	6VJ5IBumUKvmu43J6MDX4M/gnuZnlBgvlIm+DR7lX7VZhfU3PsDjYZ/UtDcixeB5NgssDjShCdi
	Wu4kIrank6oEPbIu8MaugaJuUCX/8vhShB4SpIdb+wfYHW2/T9sWiLCgQoTkc2UpeTUo=
X-Gm-Gg: AYBFou3VDVAr8FrAeWj/RrgBBu+uwL2s/gmTYndntk+IwVxctU6eGd6dxyOvaIiSqng
	BwsTQ00/GJ9HkzWga7Cw4WY3lgTRQ8T+DZ+cW/fG6Vac0DR39jJAYFYdIXJpLb9mcEUBvq+YkJz
	2qzXCwlUqWxZpWcyByUu/z4fyQgdIAVLEn5EHIOjs2KtGsR+nT2O4S9dpQafSB75Fve4sUthpYv
	ONfFVF2C2PXsXVafzZNtOIJ8j160EfZrdyucfLmTCu7CiwZ4pxzIcaOo7w4f+5ns2ZcW/OSQ9gc
	bqlTiqgkaW1qotOHBQ5eXj+I6X1YLaXrSEsiVuYy7Ks4b0x/tDynQxfdmSbdJHxB6XDW3EgFYws
	j2RzIaA2QpqwVVsf0PItbXDeTRwXJNB1fFHbR9PQ6sMNf614LpAqvLq3VSLSFYw==
X-Received: by 2002:a05:7022:7f1a:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b523e75033mr5758249c88.19.1794846143392;
        Mon, 16 Nov 2026 08:22:23 -0800 (PST)
X-Received: by 2002:a05:7022:7f1a:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b523e75033mr5758228c88.19.1794846142809;
        Mon, 16 Nov 2026 08:22:22 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:22 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 2/9] remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:41 +0530
Message-ID: <20261116162148.2864501-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afb2dc0 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=BENypEIf3hN4rM3MEzYA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX4QLfD2Fh7/e8
 l0/xeMfQanWMNSd8tetf//d+qK0wOhj9Ds1OrKzEcFSyebmv4nw1PLeSh4HBNcQZmeUHq71U8qx
 k1mCKvERfM+2pd6J5tLfhOv6yHt12wI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX91NdtSdM0dkh
 SGgM+wxR3KgrmDuWQn5dENY26B1cQaZqC/MRWzns2mkAvtGk9x7XG8/YKkgESeQiRCgJnYK6tCW
 /PI2TS+u3h0m43E1K8fX8ztzheaFJr0kADi64HQ2SatmCPuWEmrPbOxdgDDTOkwkMml/rdnhT+c
 vlNJ7z9mFrVpL/wZXCPPnUmZpS9Tr+f8QpbwFqdGijNVNTAtHbuTqBet/X/NbkjQDIbX2tUWs+l
 FbwrpbgwzO7ObqBf16EgB2GOXjoxTQgIG4yjJGtxjX/cAUYkLDiAwgzi7Gh74tHyO3E3aQowMow
 ieMALbmzPzeVBTaJElJFugXcDTIKhny17dZ9J4KAFfzlgLSUUhsAzaj02pUs8w6rIVrN3rjddET
 Uw6HNZ9JV2mXHCt2kHwlfZumuYj1L8WabWsY8V0vCteogIwRsdx4gVAiqsZjmaQpCNmSbS5BtCH
 Wdt61HD461xz7T/6AHQ==
X-Proofpoint-GUID: 2l3bcvtdunHf_fZ_EFdqQgS6bHxm9p-s
X-Proofpoint-ORIG-GUID: 2l3bcvtdunHf_fZ_EFdqQgS6bHxm9p-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

wcnss_load() calls qcom_mdt_load(), which bundles metadata init,
memory setup, and segment loading into a single API that does not
expose a PAS context, and wcnss_start() calls
qcom_pas_auth_and_reset() for TrustZone authentication, which is
the intended behaviour. However, a new qcom_mdt_pas_load() has
recently been introduced that works with a PAS context and can
handle everything qcom_mdt_load() provides, along with additional
functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to
run while Linux runs at EL2.

Allocate a qcom_pas_context in wcnss_probe() via
devm_qcom_pas_context_alloc() and store it in struct qcom_wcnss.
Replace qcom_mdt_load() with qcom_mdt_pas_load() in wcnss_load()
and replace qcom_pas_auth_and_reset() with
qcom_pas_prepare_and_auth_reset() in wcnss_start(). The existing
devm_ioremap_wc() mapping is retained for wcnss_da_to_va()
address translation.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_wcnss.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 02f38fe29f20..840fa67a6928 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -96,6 +96,7 @@ struct qcom_wcnss {
 	phys_addr_t mem_reloc;
 	void __iomem *mem_region;
 	size_t mem_size;
+	struct qcom_pas_context *pas_ctx;
 
 	struct qcom_rproc_subdev smd_subdev;
 	struct qcom_sysmon *sysmon;
@@ -157,9 +158,7 @@ static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 	struct qcom_wcnss *wcnss = rproc->priv;
 	int ret;
 
-	ret = qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
-			    (__force void *)wcnss->mem_region, wcnss->mem_phys,
-			    wcnss->mem_size, &wcnss->mem_reloc);
+	ret = qcom_mdt_pas_load(wcnss->pas_ctx, fw, rproc->firmware, &wcnss->mem_reloc);
 	if (ret)
 		return ret;
 
@@ -257,7 +256,7 @@ static int wcnss_start(struct rproc *rproc)
 	wcnss_indicate_nv_download(wcnss);
 	wcnss_configure_iris(wcnss);
 
-	ret = qcom_pas_auth_and_reset(WCNSS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(wcnss->pas_ctx);
 	if (ret) {
 		dev_err(wcnss->dev,
 			"failed to authenticate image and release reset\n");
@@ -599,6 +598,11 @@ static int wcnss_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	wcnss->pas_ctx = devm_qcom_pas_context_alloc(wcnss->dev, WCNSS_PAS_ID,
+						     wcnss->mem_phys, wcnss->mem_size);
+	if (IS_ERR(wcnss->pas_ctx))
+		return PTR_ERR(wcnss->pas_ctx);
+
 	wcnss->pmu_cfg = mmio + data->pmu_offset;
 	wcnss->spare_out = mmio + data->spare_offset;
 
-- 
2.55.0

