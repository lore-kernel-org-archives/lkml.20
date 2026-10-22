Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677838;
	b=R6pWlHAa4Oq3PffNJ0H8oqbRlU70eADgR9OkudESEH7pCeuENB12TTHCFeRIjmwp+2zK
	 pWLcaX2PZ84OJmH8Qcqd0V/l6d8zHLyGEpp1igS9X8wKy2RkRV4PqSCFHZSHPvqmAgV2A
	 uIMXeDD8OWm9XI3lTrII6S02eSnSPJ19T9t6O67f1HH3wWavEMdObHEnJIu8QdX1UBDkp
	 s9+w8+HdDEXAxhhJGcx4p8lORGXu8eaXd1WJX2W/f6akRwQULEKKqxk8kH3G350WfGjNz
	 ZDSW2MsFp2OmaNTooZCI9/QOfZvEzOlXMdhdsQn3ODhSQ8Z3Xovn/s6P7FKJJv32G3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dYet1TJ9ECRAvdmQuLH1a/ExsUsZFgZXEboaE3A6WnU=;
	b=vKGNOwYwyWMtiYX21noYFvkf3quu551SPew7vihUDtmau/KwaQNvNWvUEzVi4U0yuvLb
	 5Wx88QsIlpq4xGhFgEMWZNFWmeGGY+VzZha0RxIU5pzcqcCkTnQt8PJ+BkQE+HCDG3evg
	 9H/Uk98Tz/dLaYCDEV31yEOXFb2C/h2Xsq+eSbJ5aDUoCUeb74+je7HN/rkfV6amfi+87
	 9iDES8xymnibXzB64pHHhb2PrjoD5QDieCdahwVPKSF7MyK7FamJosdj8wuIKRCrQ3KeT
	 cQBpL2knL6h4awpZOM6RcbkZiwYdZWXG/fbFcuYPnRpxm2xWGnrNVxQ6Fox32UXsqbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gP1a7Dlz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sbumx5U8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADFF606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ADFF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gP1a7Dlz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sbumx5U8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0WBP3923119
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dYet1TJ9ECRAvdmQuLH1a/
	ExsUsZFgZXEboaE3A6WnU=; b=gP1a7DlzKa2RRxnjTA1WXFVW1tweEUNd61OfGE
	/fuBa8QrkPvVg5cA7/ljN9JAJITukTmRB3T0w46w20K3ULOTHf64ZtxxQZxeoP9V
	A3BYGBwg/cU3d+UTLrX+ZQ0NXgqZanHtU56hrg2gcRepLV5CG9hCoMu+D6gTIyC1
	fjEZLNOTZRZYoQrX6abZcWAQ6Uhbw7ACXpLDGJUjo3vi2fZPBmKAdr9GM1kge5E3
	0hkrxAEocxEFp6MEBml0amHNHUdNVeDS45nyew9uRt2KW4viOBHcp7OG8CwXkebu
	y1zz9QLjq9FmDOuKOklOebyGlhv+ju8WgN6IM+vEI3jXbhRg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bkypg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:03:56 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc2c29ba27so443484137.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792677836; x=1793282636; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dYet1TJ9ECRAvdmQuLH1a/ExsUsZFgZXEboaE3A6WnU=;
        b=Sbumx5U8tm3iR/xQAG+u6+XCuRILx2btymdtiTATSWrsWJ7IqsW1a6cvvvHk7d9faM
         9Oq7WPxmuVpWgZQ27iRuw4/ZwlV2Qu/sck4o3yHj0Nt2YA03GwMbPSxb0YfPxiuJEeGH
         Qd/lz3SN+WwkH3oNeA2kZCG4TT/B4aHly7CQCd77yYkOucaTds9AeWvagNg1GsVrUURS
         P8Dwx302/dTrfodRSHSQ8V4SE9Afqu1Q4YYBYhkr4pZdrB9zUZwGf/8OYIZcQz0dK+ua
         nh1n3f8azsNaxAbSJQex9n5zRkXMagrcbzcAZHr/eiCAGAwmNniSD7+hJOC5nM2jTPKa
         gXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677836; x=1793282636;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dYet1TJ9ECRAvdmQuLH1a/ExsUsZFgZXEboaE3A6WnU=;
        b=PaYIOYm7phu99YXCORJLNZKkHZXywDAdy7/gkb4pxx3nILceQ6somPyxK0FnnZGMfr
         65A3NIkTeIKYviAs63Iqg209U3vfSSjCWkAFvHfbeI4uiSa/bXhKxWt60o1aZ4vt4Mpq
         uIw3sWPyPjgScZ9bcqYIk9dJvWmpvFssffIZ0P0mrWoBNTTGdfOJD1XFN8Lz3eI7f7AH
         EFknhtkP1O52HlhIxPYUayMNnpSqP3ggEksgGqsjGZBJm6mAAJ+ZMO9W3lBHoRZp8dz4
         5S9uyhzUzig+ufKiq/258KtzkX+TIbLJHc/LDsfWek/6Cr9nIMzQZWwBJo4brAEpwCkm
         WMDA==
X-Gm-Message-State: AFq9FYL2ugspSYfibfvypLfjAPk+URUasuZ7MTpFt74npsNBF//DxcJw
	U0XKj+OoO5b40t/KWT/OUE2Yo1pdCp6a5LYpJRI9+DS6sYu45itooiP4Br6AxQ7m9zxo5u7Ojql
	Fdn7q818cELCB2fY46W2XwweXmAzV8PMzRAPGw1NQH0cFF929yvtYg1D4jFenut2dEp0=
X-Gm-Gg: AYBFou339/ZxE8aE2PJJUqayVAmoboaqPmbo06FJ3JgHB7h/kRgaw79OUfASvTdqvZr
	LlcB2+TQevFNPHjDJyGnlmiEXih+y2eaHFM2PN0UtAeKKkL1QFj1EUuoegRBYbV6VOtDd0ngGco
	A8XEVoblKzRpguyFaFq/c/kO+dqPnxjywyLCys3V8hZLCP5GxtoC3Ugk94CUMGwkTH2u5IiF5xN
	xPYdpmQQVjslEeYD/bBCjZnMFT8eRAp4UkrIY3odgtnK6CxqdLG71yMlebvCk+LUmkpoO/5VyRI
	S1/LbcNagzxOFbWT3zcht3NR3z4QQIRvGAc+c3rCJUhOzaoV89pUO+klmWVycrAEl/z3pwyB/K4
	dmeDtxiKRjZ/EtPzpRq2jmAgSw99Z
X-Received: by 2002:a05:6102:4187:b0:7c1:f530:2d8e with SMTP id ada2fe7eead31-7cc9273e2d7mr2149851137.35.1792677835906;
        Thu, 22 Oct 2026 07:03:55 -0700 (PDT)
X-Received: by 2002:a05:6102:4187:b0:7c1:f530:2d8e with SMTP id ada2fe7eead31-7cc9273e2d7mr2149819137.35.1792677835267;
        Thu, 22 Oct 2026 07:03:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583f25asm12247676f8f.45.2026.10.22.07.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:03:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:03:14 +0200
Subject: [PATCH] nvmem: don't use devres in subsystem code
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
Message-Id: <20261022-nvmem-no-devm-in-core-v1-1-61c372bd7a74@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKEX2moC/x3MMQqAMAxA0atIZgOmRQWvIg7aRs3QVFoognh3i
 +Mb/n8gcxLOMDUPJC6SJWoFtQ24c9WDUXw1mM4M1BlCLYEDakTPJaAoupgYNxrJr9aPvXVQ2yv
 xLvf/nZf3/QAVNsscZwAAAA==
X-Change-ID: 20261021-nvmem-no-devm-in-core-b171da3d753c
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5855;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QwDuTgExMKgGGQagEWigMB/ZQLQJeelI2S86tBkakiw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2helBZNQcJCrFvpSg1ULLLxa4q2YiCRmcXYZZ
 OMhnSAgkMiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatoXpQAKCRAFnS7L/zaE
 w+SyD/9TD9sRD4POQMD4EzxOSHUr50+r47naq1LmpBctSfrEuuSOFIwe7ahlkHAiF4HKX1nIvEh
 EcAmlsyGo94P2b3Il9N5a/uMKF4YLQjiTh8cBmZCn8NxdgKLrj/5UXqSktFBFbTdJPQJZbFK+UC
 sVHLAtc/z0cnmdzkKlF9PjoiSDqTcxwhlMuF03aQbNsoR0HRcJUldeSKnuLQuu6wW+EJ+IUCz3z
 c6c5rFEj9ycmmarkkX+nOuW+1tcQZ6Nfwa7wHxYqYzLQlcLw88xFlckLi6VR9R/4RaxqRgABPmJ
 kLEMI+DL9WFQPrBtMrBdaV7dvLWDeFr77eGdty7H6ctLKnQhVDm/5gWttYIGy/hGgOL74mUvgvU
 aE0/qlUUrLT2Z0a2PKjzWPZV2TBCbomwnhFTuoX7tSXYt/fuusPsvEOQEfObUPhAmqvakRSRvNf
 oOhVhZ2Uamss1SdhjYdU90tgss57Mz+p7O/mHpuwDD9mp26dmCk9pE7IW30lRAO8xSzWCsDw0/F
 FeXntr2xijQfJ4avqPTmXoXZmf7T7WJlYUz9Oe5FDdP82fJWUpvsFV5OHhMNTfExmk7ObxLlROt
 OwqK0lsvOME6bYChds3EgrewvGQ8b47RssQlD0P/UgLkYPLN71o2nVNLZ7kFWvipKDpQi1kSO16
 NL/0l3wli1IXfDA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1NSBTYWx0ZWRfX52WQxj00VIRm
 lpZfZIw6IawNxNMcVcPFDsdgveWqFMR+n2z97wlyVYG/VM8szxLeyQYFmmeIsrGvzuca3bJDF7R
 Ee1adNLpzM2x+XC0Fyl/74dxs8Rhkv0WrTyQDNWhNRcgh6Qv8cL44aBIvc+YP7qLaC4iOLLhu9y
 rDhBjCecpeTMhTolqKC2XjuCmHEnnzmEdxWqvC9GeaqVEjTCZ+UpgcATIih1srZ3/5cYYCfEjR8
 H2OSDpEk+Iq7g/GUNv7BF7kuSYf5l33ryfY9iNTS6HE9FvQ5OM7XoLY+BkfWuTcLPa/vH/GyIHm
 KAZ2X4+k8NabNmO46MmIJwpIG7Pkeon5lMZOBJImrWZU6qi9vyTjEQ2a0in1vJVKWJtGgHa4zoA
 Ak+udgGdiK/iF2iekwSfHIG4Bs9Pj9okZ3Km/RHCTRp9S6VZ/3/7HcTUPOLYYhGYB7Z7mW5GbpF
 MDblKY8XHwTOHPOM53g==
X-Proofpoint-GUID: vz2ewXngfyZTx4epmjAo8UrolnU4u1ji
X-Proofpoint-ORIG-GUID: vz2ewXngfyZTx4epmjAo8UrolnU4u1ji
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ada17cc cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=hvGKnEPc_sym07eZqRQA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1NSBTYWx0ZWRfX8BAaP1nM8EnP
 pdqG4a455LZifaUzM2GUs6xYR6Wm16wMr/anPmWCUcetNlTg3qdSgkqaT4uPchAalmyDLS2zSGW
 bQkUSkRSVla9NO1eB3AtqmW95QHqn+8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220055

Using device-managed APIs at sub-system level can cause issues due to
lack of a strict API contract, especially when relying on managed
resources being freed on device release. Devres should only be used in
drivers, ideally only when it's bound to a driver.

In nvmem, the release of the memory allocated for sysfs attributes,
happens when the last reference to nvmem->dev is dropped, not in
nvmem_unregister(). This means that consumer holding references to nvmem
devices keep the memory around after sysfs files are gone which happens
in device_del().

The rest of nvmem/core.c manages resources explicitly, while using
devres in sysfs registration hides the details of what goes on and is
inconsistent.

Switch to non-managed interfaces exclusively in nvmem core.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/nvmem/core.c      | 61 ++++++++++++++++++++++++++++++++++-------------
 drivers/nvmem/internals.h |  6 +++++
 2 files changed, 50 insertions(+), 17 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8e27424a032fff59a1189847adb1898168..e43adc3b9a2427918f7291bc146790b163a7aa5e 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -478,12 +478,7 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 
 static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
 {
-	struct attribute_group group = {
-		.name	= "cells",
-	};
 	struct nvmem_cell_entry *entry;
-	const struct bin_attribute **pattrs;
-	struct bin_attribute *attrs;
 	unsigned int ncells = 0, i = 0;
 	int ret;
 
@@ -494,44 +489,72 @@ static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
 
 	/* Allocate an array of attributes with a sentinel */
 	ncells = list_count_nodes(&nvmem->cells);
-	pattrs = devm_kcalloc(&nvmem->dev, ncells + 1,
-			      sizeof(*pattrs), GFP_KERNEL);
+
+	const struct bin_attribute **pattrs __free(kfree) = kzalloc_objs(*pattrs, ncells + 1);
 	if (!pattrs)
 		return -ENOMEM;
 
-	attrs = devm_kcalloc(&nvmem->dev, ncells, sizeof(struct bin_attribute), GFP_KERNEL);
+	struct bin_attribute *attrs __free(kfree) = kzalloc_objs(*attrs, ncells);
 	if (!attrs)
 		return -ENOMEM;
 
 	/* Initialize each attribute to take the name and size of the cell */
 	list_for_each_entry(entry, &nvmem->cells, node) {
 		sysfs_bin_attr_init(&attrs[i]);
-		attrs[i].attr.name = devm_kasprintf(&nvmem->dev, GFP_KERNEL,
-						    "%s@%x,%x", entry->name,
-						    entry->offset,
-						    entry->bit_offset);
+		attrs[i].attr.name = kasprintf(GFP_KERNEL, "%s@%x,%x", entry->name,
+					       entry->offset, entry->bit_offset);
+		if (!attrs[i].attr.name) {
+			list_for_each_entry_continue_reverse(entry, &nvmem->cells, node)
+				kfree(attrs[--i].attr.name);
+			return -ENOMEM;
+		}
+
 		attrs[i].attr.mode = 0444 & nvmem_bin_attr_get_umode(nvmem);
 		attrs[i].size = entry->bytes;
 		attrs[i].read = &nvmem_cell_attr_read;
 		attrs[i].private = entry;
-		if (!attrs[i].attr.name)
-			return -ENOMEM;
 
 		pattrs[i] = &attrs[i];
 		i++;
 	}
 
-	group.bin_attrs = pattrs;
+	memset(&nvmem->sysfs_group, 0, sizeof(nvmem->sysfs_group));
+	nvmem->sysfs_group.name = "cells";
+	nvmem->sysfs_group.bin_attrs = pattrs;
 
-	ret = device_add_group(&nvmem->dev, &group);
-	if (ret)
+	ret = device_add_group(&nvmem->dev, &nvmem->sysfs_group);
+	if (ret) {
+		i = 0;
+		list_for_each_entry(entry, &nvmem->cells, node)
+			kfree(attrs[i++].attr.name);
 		return ret;
+	}
 
 	nvmem->sysfs_cells_populated = true;
+	nvmem->sysfs_attrs = no_free_ptr(attrs);
+	nvmem->sysfs_pattrs = no_free_ptr(pattrs);
 
 	return ret;
 }
 
+static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+	int i;
+
+	if (!nvmem->sysfs_cells_populated)
+		return;
+
+	device_remove_group(&nvmem->dev, &nvmem->sysfs_group);
+
+	for (i = 0; nvmem->sysfs_pattrs[i]; i++)
+		kfree(nvmem->sysfs_pattrs[i]->attr.name);
+
+	kfree(nvmem->sysfs_attrs);
+	kfree(nvmem->sysfs_pattrs);
+
+	nvmem->sysfs_cells_populated = false;
+}
+
 #else /* CONFIG_NVMEM_SYSFS */
 
 static int nvmem_sysfs_setup_compat(struct nvmem_device *nvmem,
@@ -542,6 +565,9 @@ static int nvmem_sysfs_setup_compat(struct nvmem_device *nvmem,
 static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 {
 }
+static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+}
 
 #endif /* CONFIG_NVMEM_SYSFS */
 
@@ -1085,6 +1111,7 @@ void nvmem_unregister(struct nvmem_device *nvmem)
 	synchronize_srcu(&nvmem->srcu);
 
 	nvmem_sysfs_remove_compat(nvmem);
+	nvmem_sysfs_remove_cells(nvmem);
 	nvmem_destroy_layout(nvmem);
 	kfree(ops);
 
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index bc7a99f5aefbffced60d275bec888ac867fd9032..b461ec6a0e86db2241a27d4789196bf01532efb0 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -7,6 +7,7 @@
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
 #include <linux/srcu.h>
+#include <linux/sysfs.h>
 
 /* Hold pointers to callbacks owned by the nvmem provider module. */
 struct nvmem_operations {
@@ -37,7 +38,12 @@ struct nvmem_device {
 	struct nvmem_layout	*layout;
 	struct nvmem_operations __rcu *ops;
 	void *priv;
+#if IS_ENABLED(CONFIG_NVMEM_SYSFS)
 	bool			sysfs_cells_populated;
+	struct attribute_group	sysfs_group;
+	struct bin_attribute	*sysfs_attrs;
+	const struct bin_attribute **sysfs_pattrs;
+#endif /* CONFIG_NVMEM_SYSFS */
 };
 
 int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np);

---
base-commit: bcda2aa8c41de315a5cd5d672210541b8aaaad31
change-id: 20261021-nvmem-no-devm-in-core-b171da3d753c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

