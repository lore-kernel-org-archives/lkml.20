Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEC34F85B5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738313; cv=none; b=oF9KTX1N7YoT2DL1FzufOIZ/clsGUI4v2g9R+fg++EQdOcwmBwGssT+dfNgHUnG7fcPdgmvQtxIYVeSJ75cqCPJ/MEcZCkATxAaSveSQY0oIsiWn3uvLs/ogzJDNrzsl6A9NNZ9EWoLUcpkv/GeHzOpx5CnlqLhNGmgScMEyiGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738313; c=relaxed/simple;
	bh=YEa7KnX6+GkydQ4qITpT7kvGKuMd5PL3YYd6cmTdejE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VkQY86OffnUJDUXW/ijEXfQ9d7l9qvFe8doYDZnUvcxDmdr8Y5rr1i0F6ytK+ndWZmp0IhL8qGZb6RawNWj01Ijyu+9prq3IqnCOz2R2XKTUSMu6K8CbMHMjtYIZfDY3w8wNtmxJecsSWcxqQ6ZVeEqn2arB0NptCfPII2PAkSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mq+oFm34; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bk/v2KVU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mq+oFm34";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bk/v2KVU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDORfY3645735
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lunL2Ix0946Ebi3g6Sy0DVN1GNPuD0H8XFJhualJ6XE=; b=Mq+oFm34euC/FYpJ
	fkxlxhiWdSCrS/RTa28QHLGqV7NntJhntvjwcSg5AI99EmbhQEwms/gXIRclxW5F
	hq3o2nPvUCNxZcCPf0d9JldaLElps4VCY1I6uZJjKSuZX60yHsLhfaguk8I3A+4S
	utt5V8S3KSW6HCpj7cx+BcGoo3LcsxoOw2d0adF2pDsxhXy9mkkcyp90fX2UWMYf
	mjDcHrwWS2jQI0CfFCGz6koEwCf3SoHhFc7pWYZYUZsHwfZjNvhoOO+MRUY3g31k
	IZJealxllftR1kxM+xnpuS3LHMb4vEA9V3D3MaI9B1XAo5Tew07GUQGHGyKFFYE3
	/rleIQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dgr72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:31:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-868db1b2c64so1498054b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789738307; x=1790343107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lunL2Ix0946Ebi3g6Sy0DVN1GNPuD0H8XFJhualJ6XE=;
        b=Bk/v2KVUt7vPKb7a2hEqecmaUOz/NTxog72VMVEEZCPZBhUxkBqYZJm9HQfZz3LXgf
         JgQMtA5uY9cVUOmUUrbo8raef1F6aqML3OniqzbvqEMgYnTWStmowtWt0nOOwtBqp1Gm
         AWHUfiTdXG97jiGKiI05HRlZ8HI4xudNrstO519i77+MI1qEk0SnELf9fLqIhviuqw3K
         DDaIbRSYpiwZs+/GUL4GzLiYDARBtJZHvuEChr2Lp6l5Tw7JdNj5nufcfT4TCbGfieoi
         GTGub8Lfm7/4m6jMHDDDBCl7A9hAZDIcaqny3NAqfF69QAbI+V4fEOSc4qwY/oNoL8mF
         Z7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738307; x=1790343107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lunL2Ix0946Ebi3g6Sy0DVN1GNPuD0H8XFJhualJ6XE=;
        b=UjorrPctcafw/vxhJ82UUek7xatz88vdiF1HQLVqcPbNq+3RzdMx8jlLSWZJ9911X5
         ZuZELTu/idha/ZRG8o92+CbKC4w+64vEVgDXeAhFjrF7+v1gkgiOB/fNmOMxs7fRMMIo
         mu5Jp/2V6LPXlLNtXwXnr5Sy5X8o0YEXWK+o9Naexz7LohLGZQhDeq4bX0M2D/w5aobI
         wOupLx/BxW9X07KKmZGl1tW5A2N9EYQ6Ast7WfhP/EPGvpt/gSj20X+iryQeHIWeU0Cu
         EMcnhdu0Oa5gdpgLTGO8OlhwRojmw9hlZVw8JYEFz9ViCQRgjc9EBrWTjJRGLF2jAiMg
         SjTg==
X-Forwarded-Encrypted: i=1; AKwUvBzg1+rQ6VPJummnGCRzcgLExM4awUa5ERyqZE9mIwWwqxmTl3b1GjHAnhXDMMGAwwcU0ferTavtBHxKtD8=@vger.kernel.org
X-Gm-Message-State: AFuF++n2etu380qIDoQHQxSSKjJOF1K7/s95GE2VKX92BvY9xYO8F6sq
	zFJdWX/WDF5Rf1PEzy0+tLTonjmoS8Miwkytl0vQp+38iNh6rlQWCio5BxxfmO2hoplvB8cQgVW
	KBuyATsFuGWc2cTQx5tbUtvw4B5wMg1tiijb5Ji4hqakrvog+rUhO5uuMyZmNp6+0dSk=
X-Gm-Gg: AYBFou3wbVEQxPEmU7YLU9qPI+KaI6oj9z7LqYBc1bFvTo+0nnXEq+kvqWNicAaPaLI
	4Ozt+pXsGIiH6woCvJr3s5fTqxud1WCrpTzIpc5rXsmAlsDfWI95ZpDLXxo9uQDHXiXK1yGNNzk
	59/tn12WiXFx2RVs8I8Mvp232AvanC8MV6WqKuU8vvou/c4jYny51nonhfRNfTNNYuji+J00W2j
	bPtsjEJIFqoMojb1sZAJ+rWebMH0KXxx896D7rILaXyZmNdNe9s0z2njQM4c+TTAZxaar42y194
	BiPlkrZtuumpPCTJsRaUE10Awl4glkoE46pXNTuo8z9RPQuKRFS3F5cURSQ3KwV6Sm3F9OTbHqQ
	hUrxKiBp3jB9uBGxdiYfG/UpsZqQY+uecK+o=
X-Received: by 2002:a05:6a00:2e11:b0:847:7ffd:ce35 with SMTP id d2e1a72fcca58-874dbee3c05mr4564945b3a.8.1789738306809;
        Fri, 18 Sep 2026 06:31:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e11:b0:847:7ffd:ce35 with SMTP id d2e1a72fcca58-874dbee3c05mr4564883b3a.8.1789738306236;
        Fri, 18 Sep 2026 06:31:46 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8f8b00sm834747b3a.20.2026.09.18.06.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:31:45 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 19:01:12 +0530
Subject: [PATCH v1 1/3] ASoC: dt-bindings: qcom: add QAIF AIF MI2S and TDM
 dai ids
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-qaif_dai_id_support-v1-1-ed863c0e5e45@oss.qualcomm.com>
References: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
In-Reply-To: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789738297; l=4227;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=YEa7KnX6+GkydQ4qITpT7kvGKuMd5PL3YYd6cmTdejE=;
 b=XHedOAidHnb7pVXTEkW/DEB7WBKRp/iLc8rQme8UEr9u/8EqaBc1/E+NQlmECjus6qLkgbbA+
 geNWwTqWyItAuh9dbbJPVjiOEt+gw9AzIxP7qthHzRa+brNrgjic36l
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfX8MYhqNgaGW+J
 uHgA77SfsyFpqWVkYPNHtR/y9fyXpuequVfTncFFMGUvyiR+kKXtgZJ8jeKMPG/C/AOp8XmKIyb
 GF35CQvXaPc8/E9DXG8R9RZqUE5cTpg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfX4nzLrXq1Bn7d
 D2SsGdEVDHRb4Jeg8PjkhAKVWmwg/Zut9pwSDezkN8zIuJ96zhtEhaNn9ML2kDecCYwWqx0Ih7b
 zXcs49yIjd6CWrlG0LXXVtWixtKL2MS1j9wK+Oe+uZTL9q4kWjw3DA0EMSVyGFC3TBlPLkNr5sw
 MJ5sdtfa3ItFUcyro28j+5ZsLk+Vy6Gk9yhVT/ZxrwoQcPqDQiV6qJU7XFOcSEdR9AfqHdw1ZD/
 afA5BLiSxhdm5pxi1DmTdQURw/hMrgADLRdz7IilnpDjtCDNuh+54VxO/xME6O/Wqt1mPGuRA8K
 oJWL2GNX1TOeWubnrZ9n5OBDSekVftjeuFOAIGROlsXV/zaSMEnCgWC58wZ6F7TZTx4oTMuVuOj
 F6YY5hV5nGY3Jr13iatxbSTOsJbQc7uaSFlmZLEGFSyLXhwzR2TEccewHsVVodUXgIDiq5Z2GVs
 v+eoqB+F+i0wp+SF8kw==
X-Proofpoint-GUID: K4fiLWWjKQJhUk9e8Mst1BoueWtx2Yt_
X-Proofpoint-ORIG-GUID: K4fiLWWjKQJhUk9e8Mst1BoueWtx2Yt_
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad3d43 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8HAztucr-13btVBA95wA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180191

Add new dai ids entries for Qualcomm Audio Interface (QAIF) AIF MI2S
and TDM audio lines.

Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     | 16 +++++--
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 52 ++++++++++++++++++++++
 2 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 3b03e2acd67e..63f53837bd9f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -108,10 +108,15 @@ patternProperties:
           properties:
             reg:
               contains:
-                # TDM DAI ID range from PRIMARY_TDM_RX_0 - QUINARY_TDM_TX_7
+                # TDM DAI ID range from PRIMARY_TDM_RX_0 - QUINARY_TDM_TX_7 and
+                # AIF_TDM_RX_0 - AIF_TDM_TX_12
                 items:
-                  minimum: 24
-                  maximum: 103
+                  oneOf:
+                    - minimum: 24
+                      maximum: 103
+                    - minimum: 179
+                      maximum: 204
+
         then:
           required:
             - qcom,tdm-sync-mode
@@ -127,7 +132,8 @@ patternProperties:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
                 # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
-                # LPI_MI2S_RX_0 - LPI_MI2S_TX_6
+                # LPI_MI2S_RX_0 - LPI_MI2S_TX_6 and
+                # AIF_MI2S_RX_0 - AIF_MI2S_TX_12
                 items:
                   oneOf:
                     - minimum: 16
@@ -136,6 +142,8 @@ patternProperties:
                       maximum: 128
                     - minimum: 137
                       maximum: 152
+                    - minimum: 153
+                      maximum: 178
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 3a99703dbc4a..e6c792d9312f 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -156,6 +156,58 @@
 #define LPI_MI2S_TX_5		150
 #define LPI_MI2S_RX_6		151
 #define LPI_MI2S_TX_6		152
+#define AIF_MI2S_RX_0		153
+#define AIF_MI2S_TX_0		154
+#define AIF_MI2S_RX_1		155
+#define AIF_MI2S_TX_1		156
+#define AIF_MI2S_RX_2		157
+#define AIF_MI2S_TX_2		158
+#define AIF_MI2S_RX_3		159
+#define AIF_MI2S_TX_3		160
+#define AIF_MI2S_RX_4		161
+#define AIF_MI2S_TX_4		162
+#define AIF_MI2S_RX_5		163
+#define AIF_MI2S_TX_5		164
+#define AIF_MI2S_RX_6		165
+#define AIF_MI2S_TX_6		166
+#define AIF_MI2S_RX_7		167
+#define AIF_MI2S_TX_7		168
+#define AIF_MI2S_RX_8		169
+#define AIF_MI2S_TX_8		170
+#define AIF_MI2S_RX_9		171
+#define AIF_MI2S_TX_9		172
+#define AIF_MI2S_RX_10		173
+#define AIF_MI2S_TX_10		174
+#define AIF_MI2S_RX_11		175
+#define AIF_MI2S_TX_11		176
+#define AIF_MI2S_RX_12		177
+#define AIF_MI2S_TX_12		178
+#define AIF_TDM_RX_0		179
+#define AIF_TDM_TX_0		180
+#define AIF_TDM_RX_1		181
+#define AIF_TDM_TX_1		182
+#define AIF_TDM_RX_2		183
+#define AIF_TDM_TX_2		184
+#define AIF_TDM_RX_3		185
+#define AIF_TDM_TX_3		186
+#define AIF_TDM_RX_4		187
+#define AIF_TDM_TX_4		188
+#define AIF_TDM_RX_5		189
+#define AIF_TDM_TX_5		190
+#define AIF_TDM_RX_6		191
+#define AIF_TDM_TX_6		192
+#define AIF_TDM_RX_7		193
+#define AIF_TDM_TX_7		194
+#define AIF_TDM_RX_8		195
+#define AIF_TDM_TX_8		196
+#define AIF_TDM_RX_9		197
+#define AIF_TDM_TX_9		198
+#define AIF_TDM_RX_10		199
+#define AIF_TDM_TX_10		200
+#define AIF_TDM_RX_11		201
+#define AIF_TDM_TX_11		202
+#define AIF_TDM_RX_12		203
+#define AIF_TDM_TX_12		204
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2

-- 
2.34.1

