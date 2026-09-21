Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DD850AC0A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017730; cv=none; b=BbeEqprHhEBPlllPOZ2yGMQkec2Jr4CDOkbkEmmOGSgVLO6+WUOCjkoDgOr0IIsJvwhu17TPDG3Gs+NNdRzXw07mqw1RBeqwA06tmUAPQMKoGdS46AY7UAvtXA7PFspIiHvNenv4uQLDpCLhExnC9fbVXDuJmRxBAXo4j7uJpb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017730; c=relaxed/simple;
	bh=93trSbPzGcTLf7kCeG9wmsYEGv3akrfz6fUP2Eaqsh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHPwjCFQI+ImaX9xyVEAsPTUzaj4koPyOiqgUvfLedwaQvKQpWBM9FnzL1JD17gxVhLLC+2DhB0ebz2qZd8aHiy2IZ5/7q6Ud0QPHE+PYjp0mBNunrnRQHlOYO57+FBIk3aHGc3lqDVFJuBSAZHmdZ2VA+k69tfeeQvBG9jn70Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIriMfa5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqiAlf0S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIriMfa5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqiAlf0S"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFANZk1817159
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+jmAQdn9jXKepq5Rmmo8OwCGEejY+0pnncnb0YnbRzs=; b=IIriMfa5nWLvB/7E
	ePbU7A3kIRfovsYziJYMkzdEeikLqiDlNKhb0DXw+LvXd0dzpu4jpObDGyEALBkb
	eSsKjEV2+Y28wF5BF4LjuP6u4Ghl/93zSogDIg2/JkZaqfjaQSQwUbar3/zNDk2u
	CfTubqkif1y4UKiSTzKW1xfsP5Wk8cpt9SEAevHYENOCXGu7soA6924DyXmNMQyu
	UiT3pHlkTUtpYw5E/MGyLjHHc8ru1pl8et8LMYwfVF4RoDZy5uXzZby3xJOOkXbv
	GcWazqwxLyIS3RjK/aCfN9vEp9z/X3E6S+3qgfhTTyNu2ewIxxT3EmAS6xgehetT
	p5t+Bg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu011axdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:08:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d001671a54so62781135ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790017727; x=1790622527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jmAQdn9jXKepq5Rmmo8OwCGEejY+0pnncnb0YnbRzs=;
        b=UqiAlf0SQyJPAkIhAGa35E2wwsmhjiBNZFuHpTym1irE40CSoVvtNFi2AaDnFZmS5+
         zkW6bK8Q6kW4BLJxoaytk3CRF9OyOOurE+2KnUuiA95N04w+7HSfWcp0QYyghBzdmspb
         QC5MBtPZzaBX8Z3Zm4OWTC1CHrUAAZqZ00Fy0a5NVy+lw7509788U1y0N1CZq1M2T/vO
         bqs7NzYsTyYbdmxTa2/DrrgTtdvs4zv9f6KgmXK7AWXa1zE5WzuCFJHMP9T/R5zk5RgC
         mf506KE33w3ATMNOF1ZPrAc9kRbZE5fRf7lIgvKIK8fm3XMf+UjC+T5U3ZymfvNOGmz+
         oyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017727; x=1790622527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+jmAQdn9jXKepq5Rmmo8OwCGEejY+0pnncnb0YnbRzs=;
        b=mU4i3Ze0iyqvuN1MeLFIY5d6as55EeYi3zRNXq5DcWRr+zMUGhuo0+ppzCwZeYThhc
         PcLQW87sRyu7CqnZbxhkMmu2rUPPdks5vdpBgKlyeyml/5mYB8BeF6rsvG9iN/I3wyRT
         SkNrdoU+a2Dwf67hOfVJMN/uW0Snn5K+tV3TkXK3P2azUjlVtyHDclVzMlkdZTcQpjLe
         URznExgXl2ZVzwh3o++HZFyICIJTiXgoylqnMEXxQHDMnSHUowHpDxeel1e8ND3Yg5hN
         7TcDWdjTkogCzNimGdcmgN8dHbxFimG1l8L1Io26Gm5KDDer3Z9UIUsrvHWXlwHOUqjJ
         CVhg==
X-Forwarded-Encrypted: i=1; AKwUvBxzZKtlp7OV7aiU54w+yVs8e2RUE/dxejByikSbLFAaI8Iw6UUnk0TDoSHlWgx5PKfKPJZsOn99eeVG6E8=@vger.kernel.org
X-Gm-Message-State: AFuF++nURczd7uA9xlUYxlKWN489fCXbHtaXx0wA9qfBWk9d2KfT9qwM
	ZA3EEStRXgukOPdGfKhpW7COq+iTdc78XSnFu9HZy4n0HFSH56TSFEdMlfOeVJdePbxunPTmva5
	lLavP6mbGFmZRHiUL7LCtQPKuBYvSPKOZubGPJX2XdjJ3+Ry0NpzLmtuIeCyvr/evqQU=
X-Gm-Gg: AYBFou3v5KjSJ9RuQKp5EHeqdqd6tJr255qfXzehwurh2WOC2RGk0TWQI6siTSjPhNW
	YwsmFUv2CarXs2GtE7HfcFM5LU7z0BJ5UQwrK528zt5vKPpKN9KgKNXf7u1IQJwZ0WbxrEzdKS5
	fwLmcJMpriAYsJNUlWpkWXt4jIU6OIH1QLOnUag02rtkHQj9E7VUXfkrQj/Q673gVFdalvUcCth
	7Bd/2QGOLtVE5fHhnd5pXW7VNvZ2AioOumO6+p2MudTvmiBL0msMNfdtDCocTY3kZh5hTHPSUjz
	zWz7zDIieToGqOVEYLAkizJasJSImtFZo3lhBlyNSRD6WjoNxSOKhC61/3y8og/2n1zqPlsxu4/
	nk2cH1kBA+t6Lwxkc/mXQBTWVh3VL
X-Received: by 2002:a17:902:ffcf:b0:2db:20fa:9443 with SMTP id d9443c01a7336-2df5b1c9d96mr974815ad.13.1790017727116;
        Mon, 21 Sep 2026 12:08:47 -0700 (PDT)
X-Received: by 2002:a17:902:ffcf:b0:2db:20fa:9443 with SMTP id d9443c01a7336-2df5b1c9d96mr974025ad.13.1790017725796;
        Mon, 21 Sep 2026 12:08:45 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec6ea45sm25855eec.30.2026.09.21.12.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:08:45 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 00:38:11 +0530
Subject: [PATCH v5 3/4] dt-bindings: sound: qcom,q6apm-dai: add
 memory-region and relax iommus
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com>
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
In-Reply-To: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ajay.nandam@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: IbxtkUUuSMMYw7EgkF-QKMaSxmI8Jjv7
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab180c0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qFCY1Pm5pv70LtJwGgMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfX6wi139uNx2EK
 YKa/iVzmtukZBelFK84WT0UwB9DyC3GYKUfdS14J2i/vZQ3Yi/prxfKaXYIcjI9h6HiUufsXHVu
 zMtKD1LkXH8a1avw5uMMjLNwcEDf04hDT+5lr0tzRQO6rq2hjzq8z0S2Jwd5WIO66gaeJjqI9+w
 IlbD0HtlqftVCkSkcjXgbKS1xmBFTWQQeYuk+lg+sawVxoOGErQATfMXDDC7uqHrtTuTMInsIJW
 ccLuVOTPpEgFAF2ObcgV3AydhT4tGUmTRhGZ3OuBZ/u7SppskTyjGHmonCDXaThd4iTxa8rMQ9P
 3jS94cFfPtiIixl4mUeAElE4PLueAJz70lPmQ5Dca8us/xapRK2cTqtUHvWJjwvYRQj6hs2R6nI
 QFG6SSrX3xmHI+3BfSfESSEC0DM/3O/AyPsw/sb/TKcuQoFICtSrFGo9wzCpqR1O1IMtNqRjyNp
 eDcRtf6SUinK5ZZAprQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfXwGw9z85Gb8Yz
 cAMTyOEiYvzRn5OOltt8BiLGlS1shkmcSPbVEmlcCTZYQL+WegdFa+KhNVukh3hhLYzHNdqy+i0
 vV62Ub2LNLf1YIBt9vaKQ2eJxM8FBKM=
X-Proofpoint-ORIG-GUID: IbxtkUUuSMMYw7EgkF-QKMaSxmI8Jjv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210279

On modem-DSP (mDSP) platforms the DSP runs in a stage-2 protected
context and cannot use the SMMU. PCM buffers must live in reserved-memory
carveouts that are SCM-assigned to the appropriate VMIDs.

Add an optional memory-region property (1-2 entries) for the
control-path and data-path carveouts, and remove iommus from the
required list since mDSP platforms have neither IOMMU nor VMID DT
properties.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 9e5b30d9c6e6..7d0415f2463a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -20,9 +20,19 @@ properties:
     minItems: 1
     maxItems: 2
 
+  memory-region:
+    minItems: 1
+    maxItems: 2
+    items:
+      - description:
+          Control-path buffer (audio_heap_mem) for platforms where the DSP
+          runs in a stage-2 protected context (e.g. modem-DSP).
+      - description:
+          Data-path buffer pool from which per-stream DMA buffers are
+          allocated.
+
 required:
   - compatible
-  - iommus
 
 additionalProperties: false
 

-- 
2.34.1

