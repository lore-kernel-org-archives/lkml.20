Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895490;
	b=D2+wH0tCq6CYUVd8vSqu452Xhp76l6AL3uWw+pbrgeFwPEI3J4/lobOyWVuOYH8svzd5
	 hyQ9O1Lj5RWoF+kf/C7XE719fMZL3ukJ6AgFtXlENRizMZCSzUepm2hDptvdDPuWUmoma
	 zsb4GqIQOweZcuedpobpSTdWvlwa54bUzmkGAS2Fgt2tlPNdDNU103z1PLcNKMltgElKN
	 u62u+/EHQeJ9TuBCGzsYiT6Wj4R1VxsZb56PuyeYpGrcIhUyoh/RavBxgjmRqWeNAuWAi
	 PtvHAHLBQFVskLDX5KBOgq8vRhp66qFtVBxwT/eM6E+iCjFqt2fXHXAaEiL2BY9bNhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VoNRwS+TtcbM8J9SeVbcLxWp8HGpjcClaeSFz6/yJs8=;
	b=lg5V/dgzKtBtu52IrdQ5FqCAlDAsyKkOyRwHA2EGGUXuRofeIf2Cv2YkPphtaZFYARWK
	 SybkegHv8fuWUCIdBRS9WiyO52nbtxC0tS6af1wFPLsIoHiyuDvcbuhYg5ZAUrcxA9Wic
	 tRum0T3J6WaW2Yzu20+09DMlZ4NKMScolBu6yN5yWqpT/k5M5NE3OLjD67XTukj7/CHdv
	 ojq2hPlTyVm6Vw8kLLKNHd26+P9dCfbPeYva+TvDKJM8uJ1RvBzjlf/QODERDScPMUtuR
	 N82rU3MHzyA7rpUGcW5bKZocunkRpjDq4EhwM6ZaHHovOlQthKo7r7uaYaa/nEOZbmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwmqZr4w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J1K2krsA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B82A606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B82A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwmqZr4w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J1K2krsA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH44M4m1699694
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoNRwS+TtcbM8J9SeVbcLxWp8HGpjcClaeSFz6/yJs8=; b=mwmqZr4wzwrpJ0a0
	aS4Ju+7ycQY2VLpkKcQdZhMOkSAHWQoZKyWyuo3ollrgPtkJHGt6KM8/Kj31vlq3
	70aQDE7qfr7VEhyMTI4roAHK//i7QWmiQphjIcMIKz/tS3e98NYVTqNCqUsP96/s
	zsgbm6d9n6vkVmWjxFlMvNvTEg0mhuscKLSxs1ESqJyh2Zmf1gsJSYO6Bb14rAFj
	dSbHRKuqbAgQ30M5rLJfp9TXvew8qZEGHXcvLbTuT34my4y7jERlVPlQf/l7Mq5o
	ZyZAzmlzu9PBT2ykm3VPwQ6qT/U0aJL1P0j2wrZrAwkN/bLNQv6+N49IaPein5Gw
	T4GJvA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjugbmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:04:48 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5641cd2cc13so4829115b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794895487; x=1795500287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoNRwS+TtcbM8J9SeVbcLxWp8HGpjcClaeSFz6/yJs8=;
        b=J1K2krsAvbN2i4udz2z09wbLR0HXyvbxTZJcEbD7v7VdL/DnRhgS41U9ldfpmVAxMF
         3P2ia4oEsMmLbI6NCsj2bCVPxBFn1qhCs9o7+1T2j1JhBNS+7gtY7jXwS2t2gCbJLaj6
         txWBXN3LFmzWG8+hGvGcjDo77vB3UaV2Nl5G7wgRlJDj179XYJzcicl+e3En1FH1b6IO
         dWMNbqS/ZwMt7Xb7BsSz7STq1BDIFWPE085k7HI2eN/XLWdoQNPUzKf2XRMyej3AlcLK
         63D2Ufvm8Kqjrl2Vss3k+olaocE5Uw5VG8e8SPaX3jm2KbZ47e1JwtcQWvXSoikBnTK7
         NSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895487; x=1795500287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoNRwS+TtcbM8J9SeVbcLxWp8HGpjcClaeSFz6/yJs8=;
        b=Vo59ARPodayFELjRScwlx/QYV1H2YAaEnewIxx2Hyo+Oqf3+LNT92JHKGFSUrqEd6U
         TYscWhDnd/M1NZXxqzKkUm2pD1k6WtryUL6NCyEGUvoUwGkvLSRouX9GF2nENCr32ero
         FUUBo7D+DHHivaL7R/HNvZq8vVS/KX4F0skYUIDzhG6/Ne+gExDbEX8qVuWU7fwabWoI
         3E1M4icaa/N5xKz9WnI4L+eC85fNf3eHb5L1DSyLQMTJ8EUXChtp2a84R1wr1fHmK71Q
         invZJ9gTYS8+b4S5513qBbGu4nLeeBA4MbcLpnzSWaw1IcMP1q+irPh/MiFv79ZGmxlr
         8vPw==
X-Forwarded-Encrypted: i=1; AL+hErEbUfWRxCJ6/KRTnGjjmdlM2mf+GUEix+3BbAgAdFuGYW+qvPNCcHIaRKbUckWFX+xgr6j3So8SstFLRrQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z//da8T4FLpZhK/JDi3ay6rPQ1IjwG2RyIKHRF+JNU51AGJ24vO
	aDlokyHjuoLkN+fZRMBijwOx/Ey68QbrKT1cHpCxYUiDUKab7dhotPqYEheBQyECVQEuapJDTZ8
	WV91xGDnmOGoGErShbTdK4iQnMijWxUykyzOAckALpHPasUbK2+7p8hr6LFIo9srqsWTIKyFSbk
	c=
X-Gm-Gg: AYBFou0nvzg0cIxW9iRF4GYHDvzKsSu+Y9FqNRzc7PbuCtClTlE53m8loJtHsAdsStX
	nPkxtJtJ66vScSeO0n0cpeOhERs/mTCh7+KB4MGiKMgIkIiw/fVpHnrf5eMzer0iencbIFX3LDT
	cxjc4XMOa0ol9+szodbyA1AGPdWTdSDY05kiUlh0Dv2kncpfkugl/1NMgd+zplZPCls36itGVOg
	GIQlC/Wp+EGvC9/fPyJd12lYZ/k8euGYlFEeI2UvX2eVC3m0yW0U7YvU0dDNDqxJApKgQ/kX9X8
	NyNMRgdL49hB+zPgtCybSdPDyKjjKc5Gz1+MKb/1d9GN1CDSF1oXkdGgP14Ll0XBJY4JHxXL/DC
	ryBNgqKqg/AfF9UHwAhw5jqFn0b8di/rxRFfQ+rJCAcrZVmZokp6Q9IgMckgkd4CheqR+jrlGTb
	BMgJtnVU4DiYj1hA2zwJk++Ukd8ej8gXeq
X-Received: by 2002:a05:6808:2217:b0:567:c44d:c1fa with SMTP id 5614622812f47-56e63790ff7mr10381208b6e.16.1794895487442;
        Mon, 16 Nov 2026 22:04:47 -0800 (PST)
X-Received: by 2002:a05:6808:2217:b0:567:c44d:c1fa with SMTP id 5614622812f47-56e63790ff7mr10381192b6e.16.1794895486882;
        Mon, 16 Nov 2026 22:04:46 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70243e1bsm11903464b6e.7.2026.11.16.22.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:04:46 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:04:35 +0800
Subject: [PATCH v3 2/2] nvmem: core: add byte-mask support for
 non-contiguous cell bytes
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
Message-Id: <20261117-nvmem-byte-mask-for-split-macaddr-v3-2-c02177658f66@oss.qualcomm.com>
References: <20261117-nvmem-byte-mask-for-split-macaddr-v3-0-c02177658f66@oss.qualcomm.com>
In-Reply-To: <20261117-nvmem-byte-mask-for-split-macaddr-v3-0-c02177658f66@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794895477; l=7363;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=ShDFJnDonjnKccpMuvBayR26zt22z2glIqSe+McEOEY=;
 b=3Jw0V6oJLKz7RVzjPuNMWtV3lagugOArDTGsepKjeR4X/ckPOdk/RxHQZyjcCnI1lYc4enxll
 Pd9kU7rjLV1B0blHbLKdSaXiqof0mQqjhaQbkzmZAgp+FnPC+XEDVYe
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyMyBTYWx0ZWRfX7C9fZPpL0K0n
 GKv72QkYoUIXxKjrBsQHra0BIkhsMfoQrfZ7Xo0RuOdiT0Wpyi8OeCptBHvDSYNZDQ37nvTnel+
 dqJmqmEJKvVU6B81vzn7FyzaBvDvtyQ3r3zBmyiuH7coUj+8Jl2dT/XhA77hRmf+YPs2xU1dy+C
 tJWQnFAmt2xpdZWLEQ7H7T4+USw6kmBh8E7nkrpvqF/PyJ3AxePjV44VJCwmUe0h42sYEy6+OVQ
 2XR69Qg7ojmb/n1bJJ47SmkzVG35A++BD51EB49k31VMy4SJjrLiWnO9Fut1+5ZJNaHD2G6PxsU
 lHvEs8vBb6IpvbEcKNqVh0QiAXLSQ2J9pqJ2NDih61H3/uG8u51updcM8XMvRXOPGZpI/p1aloN
 5Gn54bBoZZIPv0R5mVRYB2ZU5FKMRTospqX/mFUvcpTrg0L24xpP3J7WRq37btpJBBZXfCuplu/
 mWfIzOPxBfIKf0NnRwQ==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afbee80 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2v3GwsEA9jBGmIuPRc0A:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: 2AsQ2fJypZ8LXhi2c7Bp2V0TXLbLA-qq
X-Proofpoint-GUID: 2AsQ2fJypZ8LXhi2c7Bp2V0TXLbLA-qq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyMyBTYWx0ZWRfX9v+gU+b18Dq1
 cqGLOd7Dc/OGmMF29zH8yjYR6tWD6aDatZzdzWkNHnJi/CoS3kGLUbWis9dpyqFDqztwtmFU+Yg
 2jr0gvBChVClyHlPa0Xl5FwR+zogc2s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170023

Add support for a byte-mask cell property that selects non-contiguous
physical bytes from an NVMEM device region to form a logical cell value.

When byte-mask is set, bit N set in the mask means physical byte N is
included; selected bytes are packed into the output buffer in ascending
byte order. If fewer bytes are selected than the cell's logical size
given by reg, the remaining output bytes are zero-filled.

Four checks are performed at cell registration:
- byte-mask and bits/bit-offset are mutually exclusive.
- The cell offset must not exceed the device size.
- The number of set bits must not exceed the cell's logical size (reg),
  to prevent output buffer overflow.
- The highest set bit must not reference a byte beyond the NVMEM device
  size.

Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
 drivers/nvmem/core.c           | 95 +++++++++++++++++++++++++++++++++++++++---
 include/linux/nvmem-provider.h |  8 ++++
 2 files changed, 97 insertions(+), 6 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8e2742..8bc657cd9930 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -33,6 +33,7 @@ struct nvmem_cell_entry {
 	int			bytes;
 	int			bit_offset;
 	int			nbits;
+	u32			byte_mask;
 	nvmem_cell_post_process_t read_post_process;
 	void			*priv;
 	struct device_node	*np;
@@ -589,6 +590,47 @@ static void nvmem_cell_entry_add(struct nvmem_cell_entry *cell)
 	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_ADD, cell);
 }
 
+static int nvmem_validate_byte_mask(struct nvmem_device *nvmem,
+				    const struct nvmem_cell_info *info)
+{
+	int out_bytes;
+
+	if (!info->byte_mask)
+		return 0;
+
+	if (info->nbits || info->bit_offset) {
+		dev_err(&nvmem->dev,
+			"cell %s byte-mask and bits are mutually exclusive\n",
+			info->name ?: "<unknown>");
+		return -EINVAL;
+	}
+
+	if (info->offset >= nvmem->size) {
+		dev_err(&nvmem->dev,
+			"cell %s offset %u exceeds device size %zu\n",
+			info->name ?: "<unknown>", info->offset, nvmem->size);
+		return -EINVAL;
+	}
+
+	out_bytes = hweight32(info->byte_mask);
+	if (out_bytes > info->bytes) {
+		dev_err(&nvmem->dev,
+			"cell %s byte-mask set-bit count %d exceeds reg size %d\n",
+			info->name ?: "<unknown>", out_bytes, info->bytes);
+		return -EINVAL;
+	}
+
+	if (ALIGN(fls(info->byte_mask), nvmem->word_size) > nvmem->size - info->offset) {
+		dev_err(&nvmem->dev,
+			"cell %s byte-mask bit %d exceeds device size %zu\n",
+			info->name ?: "<unknown>",
+			fls(info->byte_mask) - 1, nvmem->size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 						     const struct nvmem_cell_info *info,
 						     struct nvmem_cell_entry *cell)
@@ -603,12 +645,22 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 
 	cell->bit_offset = info->bit_offset;
 	cell->nbits = info->nbits;
+	cell->byte_mask = info->byte_mask;
 	cell->np = info->np;
 
+	if (cell->byte_mask) {
+		int rc = nvmem_validate_byte_mask(nvmem, info);
+
+		if (rc)
+			return rc;
+	}
+
 	if (cell->nbits) {
 		cell->bytes = DIV_ROUND_UP(cell->nbits + cell->bit_offset,
 					   BITS_PER_BYTE);
 		cell->raw_len = ALIGN(cell->bytes, nvmem->word_size);
+	} else if (cell->byte_mask) {
+		cell->raw_len = ALIGN(fls(info->byte_mask), nvmem->word_size);
 	}
 
 	if (!IS_ALIGNED(cell->offset, nvmem->stride)) {
@@ -804,7 +856,7 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 {
 	struct device *dev = &nvmem->dev;
 	const __be32 *addr;
-	int len, ret;
+	int len, ret = 0;
 
 	for_each_child_of_node_scoped(np, child) {
 		struct nvmem_cell_info info = {0};
@@ -829,10 +881,13 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 			    info.nbits < 1 ||
 			    info.bit_offset + info.nbits > BITS_PER_BYTE * info.bytes) {
 				dev_err(dev, "nvmem: invalid bits on %pOF\n", child);
+				kfree(info.name);
 				return -EINVAL;
 			}
 		}
 
+		of_property_read_u32(child, "byte-mask", &info.byte_mask);
+
 		info.np = of_node_get(child);
 
 		if (nvmem->fixup_dt_cell_info)
@@ -1648,28 +1703,52 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 			     struct nvmem_cell_entry *cell,
 			     void *buf, size_t *len, const char *id, int index)
 {
+	u8 *rawbuf = NULL;
+	void *readbuf = buf;
 	int rc;
 
-	rc = nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
+	if (cell->byte_mask) {
+		rawbuf = kzalloc(cell->raw_len, GFP_KERNEL);
+		if (!rawbuf)
+			return -ENOMEM;
+		readbuf = rawbuf;
+	}
+
+	rc = nvmem_reg_read(nvmem, cell->offset, readbuf, cell->raw_len);
 
 	if (rc)
-		return rc;
+		goto err_exit;
 
 	/* shift bits in-place */
 	if (cell->bit_offset || cell->nbits)
 		nvmem_shift_read_buffer_in_place(cell, buf);
 
+	/* compact non-contiguous bytes selected by byte_mask */
+	if (cell->byte_mask) {
+		int out_idx = 0;
+		int i;
+
+		for (i = 0; i < cell->raw_len; i++) {
+			if (cell->byte_mask & BIT(i))
+				((u8 *)buf)[out_idx++] = rawbuf[i];
+		}
+		memset((u8 *)buf + out_idx, 0, cell->bytes - out_idx);
+	}
+
 	if (cell->read_post_process) {
 		rc = cell->read_post_process(cell->priv, id, index,
-					     cell->offset, buf, cell->raw_len);
+					     cell->offset, buf,
+					     cell->byte_mask ? cell->bytes : cell->raw_len);
 		if (rc)
-			return rc;
+			goto err_exit;
 	}
 
 	if (len)
 		*len = cell->bytes;
 
-	return 0;
+err_exit:
+	kfree(rawbuf);
+	return rc;
 }
 
 /**
@@ -1776,6 +1855,10 @@ static int __nvmem_cell_entry_write(struct nvmem_cell_entry *cell, void *buf, si
 	if (cell->read_post_process)
 		return -EINVAL;
 
+	/* byte-mask cells have no scatter-write implementation yet */
+	if (cell->byte_mask)
+		return -EINVAL;
+
 	if (cell->bit_offset || cell->nbits) {
 		if (len != BITS_TO_BYTES(cell->nbits) && len != cell->bytes)
 			return -EINVAL;
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..066d27bb4284 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -57,6 +57,13 @@ struct nvmem_keepout {
  * @bytes:	Length of the cell.
  * @bit_offset:	Bit offset if cell is smaller than a byte.
  * @nbits:	Number of bits.
+ * @byte_mask:   Bitmask selecting physical bytes to include in the output.
+ *               Bit N=1 means physical byte N relative to the cell's base
+ *               offset is packed into the output buffer; bit N=0 means skip.
+ *               The physical read window extends to the highest set bit,
+ *               aligned to the device word size. The number of set bits must
+ *               not exceed the cell's logical size (bytes). Unselected output
+ *               positions are zero-filled. Zero means no masking.
  * @np:		Optional device_node pointer.
  * @read_post_process:	Callback for optional post processing of cell data
  *			on reads.
@@ -69,6 +76,7 @@ struct nvmem_cell_info {
 	unsigned int		bytes;
 	unsigned int		bit_offset;
 	unsigned int		nbits;
+	u32			byte_mask;
 	struct device_node	*np;
 	nvmem_cell_post_process_t read_post_process;
 	void			*priv;

-- 
2.34.1

