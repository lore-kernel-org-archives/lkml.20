Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256F33F23B1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107748; cv=none; b=iD7AuQ5lc0+78NBkCrLRVaom3b3+6Xz5JK6lgCVdbeb5JD6e0zDHf73We7vtXnB/qhUzv0CxNVkeG6W3IqZfOU1XCs6NhZySTYFejOMgi3vDyqhO9/oSZw0KuyDGm6gOthky10Myl4hYCmnKYeYkyzvP1F7v/nrDbix1ay15TjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107748; c=relaxed/simple;
	bh=jQhOx3vEY0b8cO6ZOGrXD/l8aLbSQYyq3/tXIbU7Iqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TdVYNedHfWxP2z+VaeQXeYfWwWVFJEWhf3p84YvrHiuM8TJQ7XrDeM/KLbmsNjf/NAQYiNQmJlBPmzEF9BdQ2cpa14pJB0XhzBroR+mM5lvBqgDFODbkxiG7lb5uZ9lj1b8gR/x7O06whVI350Q4ItKUUMO8TUbea+d9UfIaTro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sxonks// reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sxonks//"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B5LJ993137601
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FE8iTCn+Uly
	bWQ7qDFQypS2k5l4/hLWcIH1MjmtNl0s=; b=Sxonks//qAmQ+YeCSWe7KCI+bRA
	6UjV4X+S+gOab32X/ad9Y5weZoxu16KmpHup14xrLhGSEDHgvVzc0LtIFyDZNFwv
	vZJ49zOqZfOksy/X7D1TzatMFazT2cf743giv6qgGbIg08OICgyR2k145L6G8ZeC
	GywIQov9UIu8yeF+yaSOl52OF6AlUKSzFa26RyEdcwVSxh8v8SDMK+kFXWtMY9G6
	qwL66NwvgThp1a5/QTJrr2u0/ORvTWbrGLJM8IEbnQUO6TCAqNjq0fAvkKIrY0KL
	ABOGM3Svr++1ozyFDoVCPbA9QB7m06jhmfSXfhM+twbwsLxtvjoi9LRC46w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdr87ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e53b8a302so102494985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789107744; x=1789712544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FE8iTCn+UlybWQ7qDFQypS2k5l4/hLWcIH1MjmtNl0s=;
        b=OLOft+bSccxM6a5ntFvkPv4lIL6x8fV/LH719xwM6y4Mso1phZ34NlzMbVLkNpsIVo
         6l6yXmlOq/C86aQvSE9ZzUHzDvq2rsKgdq3j6VGMwTbysNj4QwIHmDGxF0pSw/8AA3za
         HKAABPtgKh5alZCZRx+2fVOyHJN4G1NCUgbD/fiueGdtP5EHj/+twXezQaPCCYlk6LTU
         BjvUXAP7lBpmoo2RYcEUvVN+TMg46D4YVyNqJwmieQ4qWAi56r6LvAGYN3fd8pMcktM9
         kZtH39l7gs+scgT6USx4SrL8SuZWsCvfwovgaoH2AnkPtJbyQcs9R625Z6fGMYtmLapW
         nBFA==
X-Forwarded-Encrypted: i=1; AKwUvBztTcOvQJHlqNy4emcRDju51AltBhaBRbs9LCWfijrm8rcSdZSrWydrH0CC12BhyvYxc+M6VscXf0dKprI=@vger.kernel.org
X-Gm-Message-State: AFuF++nI75RZy4oxUof7bwnA8tuNBKC1r7yhnkFO4+mfSI07kmd0Ca2K
	7zQ8sohQYgIVE8azWHNM5wIT4wjXAOsWRnDNC35S0jUK0cO8yG34A58uq4erVCBGt9/Jyv+icA5
	M6u4Amk06Cp57MhhfIav7h9UkTe3mtwk3nngW3YBL9jRHM7XoE1A1ZphzW+nf6ziziX4=
X-Gm-Gg: AYBFou3AjrwHLVyLV/2KDW8dte6Ou4OIiHwjazgTd3adSjt0Za+84m3hbGw56tNv8Ou
	bSFdmJ4qWJNRLwC5yp27FrhsTOT/009gA+hUVISHFWZVJQ9n6Aa6b7yXCQkWXjn/YT6pnFWfOEy
	YB2UZ+Cp32ndpUlSfE1gKovzDlXkOV4BGTI10rPbET+YFhP9xYnLNB+WIRVszIMdL8+CWrXHvGG
	6jOoKkwTi2VS0pGPTaPOl1cnVT/e0NtYEBhetGiKYLJV5jA8akLHWAmt01p3un5bdPoFqzc/uTy
	cCORLiKzk7ucrQihSZA8+9VSHM+JvD9IkbFhHBWOAF+m+pXssgaySaFmX08=
X-Received: by 2002:a05:620a:4103:b0:914:e3dd:17ea with SMTP id af79cd13be357-939ea051eb2mr339495285a.12.1789107744089;
        Thu, 10 Sep 2026 23:22:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4103:b0:914:e3dd:17ea with SMTP id af79cd13be357-939ea051eb2mr339492285a.12.1789107743598;
        Thu, 10 Sep 2026 23:22:23 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea60sm3681969f8f.17.2026.09.10.23.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:22:22 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH 3/8] media: qcom: camss: Implement CSID streams API hw_ops for gen2
Date: Fri, 11 Sep 2026 09:22:08 +0300
Message-Id: <20260911062213.195007-4-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: s9mMyj43TP8khkL2gt-v8jHzwzjOx_1N
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa39e20 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=Uk0bjlubZieTOrE2B0cA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: s9mMyj43TP8khkL2gt-v8jHzwzjOx_1N
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfXxyTKKaA4q2ct
 EiTwNfGk0rZHjS6R+6oOr4d+0puCSvFIKrt1plg00kpAkIDaJ28T1RI16o6aFPB/4MYlcblP1dG
 fddj0lRRnVoDbPDUrVG1WEryohitqXQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfXwmyZ/DZS3m5P
 OfQuZW5P7h6E4H3v9eQgvqZoJX8H0oKCaqSmm6EFKT6JSbxh9jtTmKkTTvrf1/NNRecGIdZZimz
 0uZH87fBhIiIKAKlIIa02QNNJFupK00uMk303fNZqtffuOMR8szyGPc0uoHyjrv8UqoSjFRPJv7
 Ub0cgm9rcYB+zeLwnjPVwR5H8Gh070gJ9JHrXyqjM0vLYQZigU0IDyRuAEaBG1kaaM++gyEt7BU
 GblgCzwnHfVWAzGlUNU9bw2hWwFMEuQI/mDfgpevH6RUF+c2PUtzSBd0DsI/XRrw6mErOaH5ik6
 EWbpX/GCIx1aoxpHdFaQeWSxXGJDRFRAI/UpgWHSszrxS7e7nM9gEm/CKI3L3eVusnsnwoGGKv1
 k6cmRzyILlFhVoh/uLydI+Qd1hO2Kw3jYju9bQas8WetLx5XOgEAAJgjFG+Sq7DJ3tjzYpmxgdu
 Rl1LTrsokzqsOQYFz8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110086

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Implement the configure_rx/enable_stream/disable_stream hw_ops added to
struct csid_hw_ops, for the gen2 CSID hardware backend used by SM8250.

__csid_configure_rdi_stream() now takes an explicit data type parameter
instead of deriving it from the CSID source pad's format, since the
streams API keys each stream by stream_id rather than by pad. The
existing configure_stream() path is updated to pass its per-port format
lookup through to this parameter, preserving current behavior.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csid-gen2.c     | 59 ++++++++++++++++---
 1 file changed, 51 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index eadcb2f7e3aa..2512cdb16d94 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -253,13 +253,8 @@ static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 por
 	writel_relaxed(val, csid->base + CSID_TPG_CTRL);
 }
 
-static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc, u8 dt)
 {
-	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
-	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
-	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
-								   csid->res->formats->nformats,
-								   input_format->code);
 	u32 val;
 
 	/*
@@ -281,7 +276,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	val |= 1 << RDI_CFG0_TIMESTAMP_EN;
 	/* note: for non-RDI path, this should be format->decode_format */
 	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
-	val |= format->data_type << RDI_CFG0_DATA_TYPE;
+	val |= dt << RDI_CFG0_DATA_TYPE;
 	val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
 	val |= dt_id << RDI_CFG0_DT_ID;
 	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
@@ -330,15 +325,60 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 	/* Loop through all enabled ports and configure a stream for each */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
 		if (csid->phy.en_vc & BIT(i)) {
+			/* Source pads match RDI channels: pad 1 -> RDI0, pad 2 -> RDI1, etc. */
+			struct v4l2_mbus_framefmt *input_format =
+				&csid->fmt[MSM_CSID_PAD_FIRST_SRC + i];
+			const struct csid_format_info *format =
+				csid_get_fmt_entry(csid->res->formats->formats,
+						   csid->res->formats->nformats,
+						   input_format->code);
+			u8 vc = 0;
+
 			if (tg->enabled)
 				__csid_configure_testgen(csid, enable, i, 0);
 
-			__csid_configure_rdi_stream(csid, enable, i, 0);
+			__csid_configure_rdi_stream(csid, enable, i, vc, format->data_type);
 			__csid_configure_rx(csid, &csid->phy, 0);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 }
 
+/*
+ * configure_rx - Configure the CSID Rx front-end
+ */
+static void csid_configure_rx(struct csid_device *csid)
+{
+	__csid_configure_rx(csid, &csid->phy, 0);
+}
+
+/*
+ * stream_id is used directly as the hardware RDI port index below. This
+ * assumes a 1:1 stream-to-port mapping and should be revisited once
+ * per-platform src_streams data (stream id -> hw pipe) is added.
+ */
+static void csid_enable_stream(struct csid_device *csid, u32 stream_id, u8 vc, u8 dt)
+{
+	struct csid_testgen_config *tg = &csid->testgen;
+
+	if (tg->enabled)
+		__csid_configure_testgen(csid, 1, stream_id, vc);
+
+	__csid_configure_rdi_stream(csid, 1, stream_id, vc, dt);
+	__csid_ctrl_rdi(csid, 1, stream_id);
+}
+
+static void csid_disable_stream(struct csid_device *csid, u32 stream_id)
+{
+	struct csid_testgen_config *tg = &csid->testgen;
+
+	__csid_ctrl_rdi(csid, 0, stream_id);
+
+	if (tg->enabled)
+		__csid_configure_testgen(csid, 0, stream_id, 0);
+
+	__csid_configure_rdi_stream(csid, 0, stream_id, 0, 0);
+}
+
 static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 {
 	if (val > 0 && val <= csid->testgen.nmodes)
@@ -425,6 +465,9 @@ static void csid_subdev_init(struct csid_device *csid)
 const struct csid_hw_ops csid_ops_gen2 = {
 	.configure_stream = csid_configure_stream,
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
+	.configure_rx = csid_configure_rx,
+	.enable_stream = csid_enable_stream,
+	.disable_stream = csid_disable_stream,
 	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
-- 
2.34.1

