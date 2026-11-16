Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797927;
	b=qvJJwNgucf5DEIQpZ2igpm/f8UtRhHnhWKz87WGz6lQoFmSF7xzcx/VNO0QQ+V/z4OyA
	 vvEDgrryxEN+raWxDftyEYbIicZjWbxL6xiq5F9M/it5bVbTMJOCSN2Y82SCzNoKfMa95
	 +Yk0uE+JSmpJW0cZ/C9+5BvjtrbpUaJeqmjAloukMFKn+P1e3nBk+QCHX7GDVklUcBFtF
	 R1Jp9McoNV81PTMBzYrGM5m70au+yMGmo26ybzCqS2f+FBsJ0YdJk6Lvb6PWf/8sh331M
	 o6jpyjK+EtPgbrhDwTPFczbWo5dJVP5Eu5D9nYI5smowBGelid4mbR+ctgYZMaCdEDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Va7rdmKo621e+pyyR1Bp19VL2VMBHcbaUbEEWyBa/S4=;
	b=SdecfX+X6QuJaq+Zb+3AaOiZU2PSNvqbjGyl1JIG7uyKbrEazm3WNlUTLYDguUF1XZnJ
	 PSyq4homKJRE2ddpqcn/Np1nha+I91Aqr4QLrkh7+nTcsuHmHoFAeiIx0UklzefRgtNQF
	 74xWuVhcGd5uu8G5nM4P+V3ee1GS7+qacTPfT663OShkFxna/GRwsbsE1uEBj23smIwdA
	 yGe1IFJxy4JOjlLbowmRm4kDRu0iIlk8RT6/f+mRrIwDeNMEsWSCkFXyCa/vxWInoRXBt
	 177u4YCq6L3I0qJ2vhbf+vLP1TF8FlJDk3HdxDO0EgzB2IIP99o+0yNQoJX+vlrd5EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pv/fTsZX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IsasEBbH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E763606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E763606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pv/fTsZX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IsasEBbH
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1LUFK2659905
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Va7rdmKo621e+pyyR1Bp19VL2VMBHcbaUbEEWyBa/S4=; b=pv/fTsZXf7ionkHh
	Nt1Kmr90OHCMI3E27TWuRPKcnjAKo0FlTsc26Yj81y0hZ6tRavMG5Pde1pcu0hPn
	f4ReIi5eyZHMBPFc7oavJlW5UxNtNVfw6Kb55cuPrz7uu8k/V1VGNh9wgcMuuxHJ
	X23Xrc+o8oniT+SaOl+H0SUBBcea9tzMfzPIJALpn1QxwIKBLDAzOkuPWDew6/4I
	4bbbP+u1nuarTc77CRJzRYFp+Lf+g1oHaZKEEoOd3ph4WVTFE90TgB3vfsfbhZsx
	yO8Xb/zwhXaUji6f9N4FeZ8Bcpc1RRVykxURDqrZ1+vwYRoCgWRp+ezH6bNEpbhm
	8ltyFA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmccd1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:58:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso2778384eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794797926; x=1795402726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Va7rdmKo621e+pyyR1Bp19VL2VMBHcbaUbEEWyBa/S4=;
        b=IsasEBbHWiAcuL3SLI5ofPO7m3AJtHLJfAW6ym0bt3dWf8rLtDnNRN9FMexZnwA6dP
         JjwsD8FXn04zZGp3TAA3gRnouaMv88mOQ7BfONVkGY0mE6CE17/7j8rSinA56yAmQdLN
         1CBCewgLfNzxX8taeoaj/JZyzDg+tqsYyzuRYzFY00eVNqjiKnw2s8G4eHpWXqG+HaAc
         ft39Tq4m3KU9MapKxwDTW940ugCjETlvkDw0G7+OqQQYfcR9E4/1Q7+V13+3hkk0GXhv
         tifHUkJZeKqv2arbNGGfunVTUgXJUiezbm6rBH0C1G+ixhEmVZsYKv0FdbIbLnALFlqc
         R/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794797926; x=1795402726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Va7rdmKo621e+pyyR1Bp19VL2VMBHcbaUbEEWyBa/S4=;
        b=DLzu0rZ6zmpREzDcYQupd+qgz0Zzu/nO0Kaz0N7sCYh0ceBcscz0v9T3PxxTR6My0c
         qCcZKVlRXTxsICn1h0YGl2NH/HziqWhidLqpzYxomImLOv1l+5t1+CAQFrBJc0X98fNT
         IJYzXgLUdvkNXfoJC342apcgfHvRwLiUex9Q4BzqhSRvlAK2XgT0wASizR9AJMGX6I27
         hq2cEhyAR93MXwXZ3G4zSYd1Mvdjw+x5v6/oHkh80LvcPASK2H1NDxXQ6+Gur5dPuciY
         2gY2ysdPbn50HaKlRJr1xv7h/abjTt8xMrwseAsFcZcSo4xONQoJtRdUDBXGhnUJIFIV
         1FUw==
X-Forwarded-Encrypted: i=1; AL+hErHbYs7XSgaXT1z7V67Bvjcgo1Z657ou8c8CCNQk5M1TTu1lLL8bNZl4Oxjuub8/I15/0+2b2Wz7ULsnZJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z89jo43TQbUGqKnkE6wIzFXcQAAFx8UUp55n+gtVddmBpmFd00c
	KgxLLIXagBb8zj/EYxl57PCLW50QCvpFSd1yEb38HS5VXgEz72EujcRPneIeiMFYuwZYELD/SDU
	Hg8tRGOagf5O4/8+n9O2EsAu4PNBFV+FcUCX2AdX9GP9bnk22b085SpkeoLz/7EHuFJo=
X-Gm-Gg: AYBFou2aA8NHufInWQFGAPTXhCZRgDxe9bv4v8qOUheNBgcSq/jN8NKggi92Fsjp5XZ
	915167ZyQlS8sbhNXTVnBy1isMo7CRIzG080vV5tVAbbcEE607WXgfuGXft3hKyPA0qzcoqQ62t
	EG9TM+ZG4IgOE41+sikmkDIMXwVqSY9GA26Nbhm3F8M3RHKnRMuEp8RfaI6eNWx2iVLMIT8ZIru
	eXDXdwXQ5mfCYSO/V0U0WLKSv+5HHGgaRCzhj0eu41EyejhKOwEVAXsAoAIHIHPLyEBEz8+9tOM
	aFoeXgc85df5gr9I4/TmcHnZYLDj99aTeMQZRIAwrZWQb+j0FAtm8ZB730bEQUoUPBBYwtkI83f
	K80QpZ0uItuarTP2eoc1AByQjkzP/c60wVjt1OBeuZkIYOBS5qbVbsqBcx1yWTidFaKfZoR3MAM
	R6kgmuzOnYrNtnyPf/+03nUedcYKNDXSh2
X-Received: by 2002:a05:7300:231c:b0:36f:3c7e:3c13 with SMTP id 5a478bee46e88-37967ae7f85mr13837072eec.22.1794797925628;
        Sun, 15 Nov 2026 18:58:45 -0800 (PST)
X-Received: by 2002:a05:7300:231c:b0:36f:3c7e:3c13 with SMTP id 5a478bee46e88-37967ae7f85mr13837039eec.22.1794797925038;
        Sun, 15 Nov 2026 18:58:45 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm30469991eec.14.2026.11.15.18.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:58:44 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:58:35 +0800
Subject: [PATCH v2 2/2] nvmem: core: add byte-mask support for
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
Message-Id: <20261116-nvmem-byte-mask-for-split-macaddr-v2-2-96f4a0c08264@oss.qualcomm.com>
References: <20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com>
In-Reply-To: <20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794797917; l=7666;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=vbRtmFtXmMIqsNIBcPeGrbg7gcHrGqgrIkzXS4nzL+0=;
 b=d5Z3n9M80wTHuDRCx5wdZD0wND/NI7bsadjnlROxRQ/3Psn+r/OdebUxn599GdSv9yCNCNlH9
 CYeW5F0QfVRDr06jICxirQhAihRg8WOIkoDjUR+O3dyMhgZq0C7Vgkd
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfX+jSy5C7qYsfV
 vQakxUKzlD9feURdZx2CBHoRMs5uDZbOe+u9yHqCTn9X/dPEfnKyFuhUBVjLK7h8RMrDWhB7nRd
 Io5w8feBZgj6LQiN2s1DgezEMKFY/dw=
X-Proofpoint-ORIG-GUID: YvB4kdTzrl7B1_2R6kJXyHbPD7onR9Q_
X-Proofpoint-GUID: YvB4kdTzrl7B1_2R6kJXyHbPD7onR9Q_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfX6/TC5tfNcWgo
 hXk7A5cTqlHvHM/j9uKNBnoNGxGv8f+aY00rSROHcHuwHTr1vaW01Frjf5KG4G4Tw6ZLwy1lJ40
 aFS+V3fhNLGIcn6q/4aQ6fOv7sFOb//HPUMrJxKfQhPmFIl/T1lh5SxUz8byjc2J2XN1N3Rfepa
 Im7/432M0PDPPstHuKrl+83oZlDitMOAXNUFlVixl/gGA09cyfosoiT6+yN2mtvceAarVuCf2SJ
 SwuPfkajuZHkSywW/iCBCOBlAahTWCH8IgIt+m2ESrzQgpeNX7sPj5SyqCcxItGpVvO+qc3Vi0W
 Fra01SvVDBWmWmfotvLnlZcFiD6utgpNHHol5fkQ8J0W0CqkjDeAuKkWAj4vGnPKL9b0WhbWJHP
 Oq6XzDsXgkQKbuckIAUMxl+M8NO9ndV29Qq42eo2LmWt83c3qz2QE64ZDQL5A/GyeHghFwb+03y
 W/FUX8muxNZfqWPvg1g==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afa7166 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2v3GwsEA9jBGmIuPRc0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160011

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
 drivers/nvmem/core.c           | 105 ++++++++++++++++++++++++++++++++++++++---
 include/linux/nvmem-provider.h |   8 ++++
 2 files changed, 106 insertions(+), 7 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8e2742..7e96b84bc4e2 100644
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
+		cell->raw_len = fls(info->byte_mask);
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
@@ -829,16 +881,27 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 			    info.nbits < 1 ||
 			    info.bit_offset + info.nbits > BITS_PER_BYTE * info.bytes) {
 				dev_err(dev, "nvmem: invalid bits on %pOF\n", child);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto err_free_name;
 			}
 		}
 
+		of_property_read_u32(child, "byte-mask", &info.byte_mask);
+
 		info.np = of_node_get(child);
 
 		if (nvmem->fixup_dt_cell_info)
 			nvmem->fixup_dt_cell_info(nvmem, &info);
 
+		if (info.byte_mask) {
+			ret = nvmem_validate_byte_mask(nvmem, &info);
+			if (ret)
+				goto err_free_name;
+		}
+
 		ret = nvmem_add_one_cell(nvmem, &info);
+
+err_free_name:
 		kfree(info.name);
 		if (ret) {
 			of_node_put(info.np);
@@ -1648,28 +1711,52 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
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
@@ -1776,6 +1863,10 @@ static int __nvmem_cell_entry_write(struct nvmem_cell_entry *cell, void *buf, si
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

