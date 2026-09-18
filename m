Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6A74FC8C5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737585; cv=none; b=jJ5OI7ERHxOu7Wtt9dFBC5ptaLvXe9/Hs3EyW/YCV6jscxxZq+1M/xdhWxh2oNp6XeFpW5wat4Xopmc2sNpYwwjhuKOfBoT3ATrlKvvvGGbCzU0AyjUCQgT2ueKSFNc2DOeSEDKQQc1tom8t4tvlTW9yDmk3ZnYGWRQgMwNTkRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737585; c=relaxed/simple;
	bh=/H9GH/lQ1ALwgeqTcIx0s7pOIycSN6qFIhiEh+CM8vU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nF3tyF+OMek1AiNTNBZ0QhG9OCRCEPnhL9MVEIEhaKOvmtRmYnVKAmHbzx2OACV4tOhCq1SGTvudPpMUEtkh+qRDlizs24dFpnYefxbGW4Vpy4FiuFP2Svpbk1b7Mww+W/5LDJ2my9i9NY7mh9DuHCV5fpSRye3Qk12YidQ9ndw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GfPgHwED; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1DGplZ7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfPgHwED";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1DGplZ7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICu2ug819764
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oSYrXj0qRL6
	iijgn56YH1Ou/LIGAHpwxuNfyBoq9ZJA=; b=GfPgHwEDrBvFZI67n/zEdowmwF1
	FaDnjg3TdnKvnMejAyNyorfPdy+L5T1ofcRy1V8S0ew3+4BE5iJ+rBB6bfNTMvUr
	2BIp2rzyaUPhNFWWYhYr/toNjsz6pm2pgcIRpeyegV8dF3mB4suX72vWWKAEOcCF
	D+/UdtlPva67+EIZlWH9ntmPJy3IU73LYFMHhVdNIbJquCNGhUqnZXHJXWuP7035
	nNLfU+Q/QFJeo3+sl9PDrxeRdnXKIt8Q4bSU9hxGAADBBtZb9klyLa+iJJhdTK4a
	u0CJJ+PN+gw52TM9oxFJdwBo6zBpD3ks9JW4x8HOruF9q/hffdTt5IV2m2g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrt2wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:19:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1b824e84so144305585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737580; x=1790342380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSYrXj0qRL6iijgn56YH1Ou/LIGAHpwxuNfyBoq9ZJA=;
        b=V1DGplZ7c8skyDQ7OJYVbCDdMiya7VCGittmvnDIZkmHpeQWn/k1mNTuJJtEPNaoI3
         DTPztBS2JqWaBryWRKzug/RXohzchcVpSlbQtFEcJPa5UpbaojWQG7zCqlEU5rw57cJf
         4OFrm6yUFr99xvMoLoGLb8uScdM8l+iU1BVv7FgrnHcK6+LgKRCWf5Mgw228Gjg3ZtrL
         3IDTGx8fdhb0u+EiAuepTFTQ6PlRlUyWhUzZbVQoRI/InrOi5x9atoKHc3YRmR32+8VQ
         AadYuNRdrTA6gd26XJKox5ANHwFwrQRmJ1/Oni5+ELihlzqiO7UtAgIu02Q037OMHk39
         SQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737580; x=1790342380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oSYrXj0qRL6iijgn56YH1Ou/LIGAHpwxuNfyBoq9ZJA=;
        b=QRzmwCtL8W+w6473SXRx7JaTvj9UakkIIqZNQUOQM2NTUJHMISh493997evPvQxtHR
         xXW4sB0jNYGeq5U4tGtEmW46c2hEbvwuZnAO6c2/A0VXHeTUzl4+hHqamUuxlBCtXwCK
         ivMEL2cghHy4ieZEYLAV/gJrELxywxXfJGcKtwNubCq7HbE0TJ6z5bM0wUmp+dipmci7
         QbiksY1x+ZMqLLgvnhGDIBQ7RbS9ZBV8R0Phv7Z7bz1uWd61hDiOgPncV6bwfWKbffwM
         y4l/VpWc1kmd715J3dKcd/sut0vavlybl6TUrBzPN4HFWcONE5KC3gVbxjV/fkgIER8o
         Fm1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwAMs7cULabyxbBtlWpkGTTvUM9Tt1eG2Gl+unIovYTtkWT4mnreNZK0eJjHAKVsO/HCrqBTOQpiDM9UYY=@vger.kernel.org
X-Gm-Message-State: AFuF++m7Y7jIO417xz0I9hERt5B/VveBxphKi0/YTZRpn8HLQqaB0pyb
	N9WLkXykxQvG81Rot58bN4k3tvC6G6qSqOr1K6/Ak9mCdQiXl2kAoBIsK/xbiy+oL4XLhUpMHSU
	RAXa1xnJMWwKW5LkaispMS3lUYim41ENmp/W4Q7yxCTqXTeTU7JsKj8WEkXXHb8x7qIY=
X-Gm-Gg: AYBFou07YH5DtbuocAFJUQlbCDaEbsP+zUpYUwd5HKehTDyLz33wFRf/5p0lT0RxF0V
	1rG6M36IpxFPaa6+YHxqsZ6QLiWHxNrkZRiaBVNocvAI9gxpvSjIvI+tSDmgHR/qkNu9nUiMoE0
	UhzEaciditUivnVdFt2cPkuwAy27NwCMCiXrqiYuF3Z9z7AfypmT0Rmfh88jpFWu31iqQbJMPJn
	RL9cam0oLJqqKK65liDg7qKjDHgSRKmYYWQpTTIO6lCu8gePDN0RjSuqfnheBZtpXK4RyT2ZrOM
	TtrTFeqmi0bktX26mpoWZIFh06VdUFHJvt5eEP8UjB9vgqxCPP3Ssul5fJq24wioTFPemkXtLob
	O6ICLWS7if/8E3g==
X-Received: by 2002:a05:620a:838e:b0:93b:6113:218 with SMTP id af79cd13be357-93bdc6974a9mr313704785a.12.1789737579991;
        Fri, 18 Sep 2026 06:19:39 -0700 (PDT)
X-Received: by 2002:a05:620a:838e:b0:93b:6113:218 with SMTP id af79cd13be357-93bdc6974a9mr313699385a.12.1789737579470;
        Fri, 18 Sep 2026 06:19:39 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cebae2sm48254015e9.8.2026.09.18.06.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:19:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 6/8] ASoC: SDCA: add sdca_apply_default_control_classifiers() helper
Date: Fri, 18 Sep 2026 14:19:11 +0100
Message-ID: <20260918131914.681588-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad3a6c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=V3wSzEE_ktrjQKcqLJ0A:9 a=O8hF6Hzn-FEA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfXxrlGfbJuaFT+
 Ay30nW98PdNvFZTBUYLVxhEC1PC0GXq0OuPPqPPZlQ6D0br6e+fhrpNxWoPnWoVxMp2cQQsxpGY
 c4xyCnMaKRf2VyryZq2R1XoKdgw8tRB1oNqxeOfbz+rQ1X9kvb5eubvOPFvcit7fpAuJJK0djEc
 0JWnLZ5o77V3/pjrhGfgtco/5LoGuKwoW6fDNGP5Iq+uOHlUhKaxwZYiTbGUJT9154MAf5suVMg
 LnPrCy/EgvnPCVziekDqe1RSLNwtkP6dR3+HKa2IIfRhb+TKGv3Dhgt2KhNu7nuxjrWhdOTLVYa
 ysgkEV+nNXoZekZV+/ZHcXwPhaTO/5/vtG1sFXt+kYC9WMo97iQ7lAWeFIQe+lDlURs0Ihn9m1h
 H61oeIpbotHeMfmDBxs1rEFDJmOpubfLKOLUhNlHFeCNcSQxqoQdO2sJ5ZCdtTh0LEpG+LxTz2i
 5JXLT9vOtz4A/SoDBbA==
X-Proofpoint-GUID: jZ13SpwpKas92Nt62ABI8mTzlZ9Lt_VD
X-Proofpoint-ORIG-GUID: jZ13SpwpKas92Nt62ABI8mTzlZ9Lt_VD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX3ywYsg4coYIy
 Sxp1/DDJeiFPfjFYqNdpExEuOkiGxYaCd1chxUTsh3+82pG+K3C0aR7hkQkBREdpIA1Y1QVv5Kt
 1FRJoO3u0FK8H6Qkzu+tWttHmHtyzv8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180189

sdca_parse_function() derives is_volatile (see c7b6c6b60594) and the
spec-defined reset value (see 02d851b46b36) from each Control's
(entity type, selector, access mode). Codecs that ship static SDCA
tables via populate_function skip that path, so RW1S action Controls
end up with is_volatile=0 and get replayed on every regcache_sync.

Add sdca_apply_default_control_classifiers() to re-run those two
classifiers over a Function. Elevate-only, so codec-set flags win.
Call from the tail of populate_function.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_function.h   |  2 ++
 sound/soc/sdca/sdca_functions.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index e580201d69d5..d3d77d8bb7cd 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1464,6 +1464,8 @@ static inline u32 sdca_range_search(struct sdca_control_range *range,
 
 int sdca_parse_function(struct device *dev, struct sdca_function_data *function);
 
+void sdca_apply_default_control_classifiers(struct sdca_function_data *function);
+
 const char *sdca_find_terminal_name(enum sdca_terminal_type type);
 
 struct sdca_control *sdca_selector_find_control(struct device *dev,
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 1eb6418e132d..52ce9355a22d 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2266,6 +2266,35 @@ int sdca_parse_function(struct device *dev, struct sdca_function_data *function)
 }
 EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
 
+/**
+ * sdca_apply_default_control_classifiers - apply framework-known Control fields
+ * @function: Function populated via static tables (populate_function path).
+ *
+ * Runs the same per-Control classifiers as sdca_parse_function() so both
+ * entry paths land on identical @is_volatile and @has_reset/@reset fields.
+ * Elevate-only: codec-set flags/values are preserved.
+ */
+void sdca_apply_default_control_classifiers(struct sdca_function_data *function)
+{
+	int i, j;
+
+	for (i = 0; i < function->num_entities; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+
+		for (j = 0; j < entity->num_controls; j++) {
+			struct sdca_control *control = &entity->controls[j];
+
+			if (!control->is_volatile)
+				control->is_volatile =
+					find_sdca_control_volatile(entity, control);
+
+			if (!control->has_reset)
+				find_sdca_control_reset(entity, control);
+		}
+	}
+}
+EXPORT_SYMBOL_NS(sdca_apply_default_control_classifiers, "SND_SOC_SDCA");
+
 const char *sdca_find_terminal_name(enum sdca_terminal_type type)
 {
 	switch (type) {
-- 
2.53.0

