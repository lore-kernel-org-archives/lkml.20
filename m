Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DBD284693;
	Thu, 27 Aug 2026 02:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787796302; cv=none; b=QyRoyDn7Cpf1O7WONbTGYui0s4dzYUKFmj08Ry5JQ8IomV0l8FlxQRW4QAMZbO2XilMtr9UIrU/3wRDYNBKdecrfjGYm+tNyzw8M2B67JYO55h96ZyV5ZteYVmbucTDvcFTxEq2YJ4NrQlB0z99+OV21GGtkLBR40/fHeO3WJhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787796302; c=relaxed/simple;
	bh=nyZE+swJePNDu+zLlOjoG+7TP24Yaq/1mW84CTN0F1U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Cu9dj/lYM4G1lrQ5K5oTOA+MlKDuGN3y1A/0U0hOVHTJ3HhiCyM1eFbTnFAKRptV5hcV0upC/F72VvD+xlFM876C1CAE+NnMCYB72Z6Rt63U7CNrreLovHweLnRLvajquyETtFpLTr5nsyM6fxjHcB9NEjBcTXyWqBM80x/TuEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b0be5a2ca1bb11f19a56ed5b684f684d-20260827
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:0014b72f-4a7a-4bb8-bbc5-e462f4f193c9,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:0d330f4a5d021cf8f9cd6a5ce3ece5de,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50,EDM:5|-
	100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b0be5a2ca1bb11f19a56ed5b684f684d-20260827
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2130908766; Thu, 27 Aug 2026 10:04:52 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH] soc: qcom: smem: Fix byte order in v3 14-frequency parser
Date: Thu, 27 Aug 2026 10:04:47 +0800
Message-Id: <20260827020447.2642830-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smem_dram_parse_v3_14freqs_data() uses the little-endian
freq_khz field directly when scaling the frequency from kHz to Hz. This
produces byte-swapped values on big-endian systems.

Convert freq_khz to CPU byte order before using it, as the other DDR
data parsers do.

Fixes: 1d234eeafc56 ("soc: qcom: smem: Expose DDR data from SMEM")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 drivers/soc/qcom/smem_dramc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/smem_dramc.c b/drivers/soc/qcom/smem_dramc.c
index 63ebe7f6db590..380746ac18402 100644
--- a/drivers/soc/qcom/smem_dramc.c
+++ b/drivers/soc/qcom/smem_dramc.c
@@ -231,8 +231,11 @@ static void smem_dram_parse_v3_14freqs_data(struct smem_dram *dram, void *data)
 	for (int i = 0; i < MAX_DDR_FREQ_NUM_V3 + 1; i++) {
 		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
 
-		if (freq_entry->freq_khz && freq_entry->enabled)
-			dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
+		if (freq_entry->freq_khz && freq_entry->enabled) {
+			u32 freq_khz = le32_to_cpu(freq_entry->freq_khz);
+
+			dram->frequencies[dram->num_frequencies++] = 1000 * freq_khz;
+		}
 	}
 }
 

base-commit: 94d3305d990b055e1561e3b78275344b1f40c86e
-- 
2.25.1

