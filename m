Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953536;
	b=Tc/spp3lIwDFKMk7yFq0U4C5RnNjU17deMvhLDCobfiJErpwl9OIt4oqcHTkGF1vT/Ys
	 nc+1zt2Ij8l5favorOqsuItdHepIA68rShGSamvjUmKsNjfe24VFxK19PdQeIYNj+zodg
	 b83lIMpU7xcEcmlP9ZrKGwP+g9mMlMxAUB5KkHyKg+rmw3lmkWZBfzosQNAxayd9wqMif
	 c9A/x9YEBLC3XmfLj7soGwU0HkrFnA5LnDM1b5IuRAihkd/KZSe09x+VTogZnEjo66PHx
	 yWqqweQm2qtmrtHbqdGVuI8b1u2CmVdAMAJQCB98+pIEFe0qASBlgc3w8jW7X3xAmEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VJiVHhGRcwV/rD/F4p3bmkosbUsG62dv3yDIyyclfPI=;
	b=rFBjCNnpx8M4DhcOkPOZ8j69iP1xAKvgzUTQGHLKgBrlxQc+p/YhM4lN2npwYrzIE5p0
	 BDysnlyaANYV2GBRHq9fQQOpaQRuLBJ0Yd1TLXNGTnY6UG7EEBy5YUAGn0F93q1guzgOm
	 1W/txYYHwpl5L10hovs4X7oOv9xNexSgLDkr07mpelqwCPLJ+5POWft1xhCWzycZ5n7H0
	 nP3aIeMBNTW6p4XLA7uuE45Yxxxq6RwpmFgnqvLxTYC+lxE8Oc+WB4t+YKB+ZP5O4AqGi
	 LON81cjZZH533eXJ+m3CdwO87mMOmRTrxGK6Ue+LTRCdWLBRq8QVXm4COWEkNVkgGUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VC7HCygU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDrNbVvm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6380606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6380606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VC7HCygU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDrNbVvm
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RkRM3883402
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VJiVHhGRcwV
	/rD/F4p3bmkosbUsG62dv3yDIyyclfPI=; b=VC7HCygUR55Q2rwGgfY6e5p5n8U
	aBCjW4qpLSqYbtSsJQBxQ7fbwOOPfJMHW7nDMt15k/ubK7itnGIjVSOTfFQzKaWW
	sI8SITZ0/W45ahq/Te5YHrsfHFpewxp0V9FhO0UH6Z+CGFyTWwED2RUu244vVrGt
	9TXWWS+v13ojQMhAXrdKMDhNgV2SFPZZfrky1+fWK/D0RudbFYB72ODmnz0VIvFd
	TctV1DVNHOeqh2de6U4WDKWMgliG1/wOQYNY7iUXw1REN8AF5HkRXZhNsxZLw86E
	lMC15kf3LxWIkNgW9z6GwVJcqo6MRhnAJi2EGFT8KUZr/h0ibZdR+vCki6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb1unu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:25:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943e8ff02d0so41612685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953533; x=1794558333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJiVHhGRcwV/rD/F4p3bmkosbUsG62dv3yDIyyclfPI=;
        b=GDrNbVvm86m6fbFjHNEKl/wm5NEW1UeKKi9CqgbJP4l+ixVZJpajrmXP4AGISRpROi
         eo5MnUwrYhKJRIdocG1brnQwOtMnLIb8JNphUmwhJQphWWaYZ9sZ4Lmo9LRbGfEam4Vo
         TF9RgiprzLY6uiEU/p6ZKoKy3qXqxAP2nNkhnde+Ok0ekThS7B692axN+uL7sd38gY+L
         SiKgNhUaLnq2rf/WHEXzSxrrw8/ggDrviW7cpTDL4zZJNwzAdazHrsU8RORBm+HsNy9S
         iZQaxhGw73fT0KX25znsems++9TVc3QKOmopozgzc1f/x+ghxFTyMNM93oL4fMfrT3Pr
         YEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953533; x=1794558333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJiVHhGRcwV/rD/F4p3bmkosbUsG62dv3yDIyyclfPI=;
        b=VQGMZ7hccQiqORLIErGs+j8njLemDRxplptVXtTL/UB8QNmRFoCbYM87v4nPxLVOOJ
         wMHb7uXPQu9pgiDO/AtN4mOnsrAY/JttlPJetnaTjn8R/MTZ0gIEeXP00Mo7EWByE1vo
         SDV00hzKgkVCKwvR2SL1S00r63kmskctwBvg4qsE9R3jx77FF67S7yIfnqEcS3iOrw8W
         l6qwBRG8Zp4esk4NW6LTfMT9E/DOYHFZHA+xAExWmEKrWefDwe0sbnmbTbKy6yEv3nn/
         OyT8TDH0ppEG9tNhgjyXFGgBdA/PHhKazVKrFq78qYnWEjojoQ/Yb6stwU7oTzkvS0Hb
         v4gQ==
X-Forwarded-Encrypted: i=1; AKwUvBykJEEyapB2lKWLpv/kobhZ07J1H7OjC6NpvqPbrD7tlLN5dOZxOespUP5aImu57f2PlQN2eqslQRmsR1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XKtI49gG3Sl7A8eWz1XEwjLCv3EkAutq/ZDKG27Jc7PaX5zio
	Z8B32UDHQKr2rqXswS6XeEJq3fs/gTdsTV2l971VHeX9ZQiDrTuoBSVQIIVWXzUpWJS+0NedV1P
	9hCpiUb+gNZ5vpHq8w7qvZjlHmIMLLZpZ4lh3kOcyaR38i9P7OtHt4PCnMYdV3tvnKkM=
X-Gm-Gg: AYBFou0MWSbjTOfvYHkmvGJWjTkg21KD5haPPlUgx+AD5KtNPxfDcPc8vgGEGiDmmrr
	9Pi/6CZDFvDZUfn0G+cOyFxL6ArdOVzeZzxT7OP1Ynu/7FvfKPu+ThKgsxnpyHMKxAnAVhfUMn5
	Myf3LYBerrx5/la/55ml+da9eRzqSxr4z44Xc7M3RJndrpbC1nViyh5eAcKuxnPtb0In5VMy9X+
	iwoXymETXcXNxCOPEXnEh9SYiM7ZNM+0syHDW+vwACUyU0vsi/gcjBYSVSTx2Ap0owiNw4iP0rk
	phrVni5McXt5ro3aLASNYEwklQ4nBUM4MSHQ1NEyBsGeKndzdgvjAYVm2oNAf6pvUtQq2GNbUiv
	85DQ0n9hm7tiQg6VbiGKFaRro9xGPTuZ8jjnfbhCM4sY7XmcIKRVpFpaSHSxpZUj/RbUHYopRYg
	==
X-Received: by 2002:a05:620a:1999:b0:93e:c12c:fbd0 with SMTP id af79cd13be357-945f35f1873mr254277385a.76.1793953532949;
        Fri, 06 Nov 2026 00:25:32 -0800 (PST)
X-Received: by 2002:a05:620a:1999:b0:93e:c12c:fbd0 with SMTP id af79cd13be357-945f35f1873mr254274985a.76.1793953532386;
        Fri, 06 Nov 2026 00:25:32 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:31 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 3/8] media: v4l2-jpeg: Add a baseline JPEG header writer
Date: Fri,  6 Nov 2026 10:25:17 +0200
Message-Id: <20261106082522.1448390-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: WqEtt-o2yLkY6UDsE7s8hJoNuK3E01dU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX4fNY8Y1EsfiW
 7OKidnaRNayfwN/0ZR+VcUY8A0p0NwpM0SWN93VJX+QSLSw9uHJU734D7W/wVlD4i99i6S1f6Dc
 Yh2a2z5QnWg2GssGiuSz+RnC9q7QNcg=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aed8efd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=uaGMt4ufPnOKGkpinpYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: WqEtt-o2yLkY6UDsE7s8hJoNuK3E01dU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX55hRIK5OlO5x
 PmNOTQFAzNIJDT5jSGeMUOU4InsEJ2jjaEgwhvLac08OHJvM9dI4YrrqqQCcIYv2/6M/kJktY1J
 soa0J7tFGzqHg4yMJF/gYpGh4Ze6do9cbodnxKioWTmhDvnWCHIfanpvND4WmWwtCKtINd3094R
 yH4hvT+qrtUrp8rsp4BuzWAxRncWQa3bBt29jgmpxeFpyy1TeEb5DJdtf+95/9I+ux9FbbSfOEj
 593FnxO1byBXeHL16K7Ls9QSCC8QrSWyyyjFY7TbpfPn1w21Ma2pI0AFdI2juZikd68PmparZ0P
 3F1lLUu9IfAIJX3ZtRQ6S0wOpWrSkkEvQQAM6D6AjwkYS+6TLTOSNe+t9C+lBCZFug8fsbz7iYh
 fsgGeocdyEVj5hSSdkd6z2H2uKXNmuUZtEfjqgVgibXReLPZ/3GikJ/87ZTfUFIyLV2G8aSXFKP
 wDJI4vzgWroZgDSgNvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060033

Several V4L2 JPEG encoder drivers build the JPEG header in the driver
from a fixed template and patch the image size and quantization tables
for each frame. Add v4l2_jpeg_write_header() for the baseline case: it
writes SOI, an optional JFIF APP0, one DQT segment per table, SOF0, the
ITU-T T.81 Annex K reference Huffman tables in one DHT segment and SOS,
and returns the offsets of the fields set per frame. Add
v4l2_jpeg_hdr_set_size() to set the image size in such a header.

The field values come from media/jpeg.h, so the driver keeps only the
hardware specifics.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-jpeg.c | 165 ++++++++++++++++++++++++++++
 include/media/v4l2-jpeg.h           |  31 ++++++
 2 files changed, 196 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index 36a0f1a1b0d97..f466dc6a457de 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -13,7 +13,10 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/stddef.h>
+#include <linux/string.h>
 #include <linux/types.h>
+#include <media/jpeg.h>
 #include <media/v4l2-jpeg.h>
 
 MODULE_DESCRIPTION("V4L2 JPEG header parser helpers");
@@ -711,3 +714,165 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 	return marker;
 }
 EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_header);
+
+/* baseline JPEG header writer */
+
+/* Segment length of a header struct: the marker is not counted */
+#define JPEG_SEG_LEN(hdr)	(sizeof(struct hdr) - offsetof(struct jpeg_seg_hdr, length))
+
+struct jpeg_hdr_buf {
+	u8 *buf;
+	size_t len;
+	size_t pos;
+};
+
+/* Writes past the end only advance pos; v4l2_jpeg_write_header() checks it */
+static void jpeg_put_bytes(struct jpeg_hdr_buf *b, const void *src, size_t n)
+{
+	if (b->pos + n <= b->len) {
+		if (src)
+			memcpy(b->buf + b->pos, src, n);
+		else
+			memset(b->buf + b->pos, 0, n);
+	}
+	b->pos += n;
+}
+
+static void jpeg_put_u8(struct jpeg_hdr_buf *b, u8 val)
+{
+	jpeg_put_bytes(b, &val, 1);
+}
+
+static void jpeg_put_be16(struct jpeg_hdr_buf *b, u16 val)
+{
+	u8 data[2] = { val >> 8, val & 0xff };
+
+	jpeg_put_bytes(b, data, sizeof(data));
+}
+
+static void jpeg_put_dht(struct jpeg_hdr_buf *b, u8 class_id, const u8 *table, size_t len)
+{
+	jpeg_put_u8(b, class_id);
+	jpeg_put_bytes(b, table, len);
+}
+
+/**
+ * v4l2_jpeg_write_header - write a baseline JPEG header
+ * @buf: destination buffer
+ * @len: length of the destination buffer
+ * @params: header parameters
+ * @layout: returns the header size and the offsets of the fields set per frame
+ *
+ * Writes SOI, an optional JFIF APP0, one DQT segment per quantization table,
+ * SOF0, one DHT segment with the reference Huffman tables of ITU-T.81 Annex K
+ * and SOS. Width, height and the quantization table values are written as
+ * zero; set them with v4l2_jpeg_hdr_set_size() and through the
+ * @layout->dqt_offset offsets.
+ *
+ * Returns 0 on success, -EINVAL for an unsupported number of components or
+ * -ENOSPC if @buf is too small.
+ */
+int v4l2_jpeg_write_header(void *buf, size_t len, const struct v4l2_jpeg_hdr_params *params,
+			   struct v4l2_jpeg_hdr_layout *layout)
+{
+	static const u8 jfif[] = {
+		'J', 'F', 'I', 'F', JFIF_IDENT_TERM,
+		JFIF_VERSION_MAJOR, JFIF_VERSION_MINOR,
+		JFIF_UNITS_NONE,
+		JFIF_DENSITY_HI, JFIF_DENSITY_LO,	/* X density */
+		JFIF_DENSITY_HI, JFIF_DENSITY_LO,	/* Y density */
+		JFIF_THUMBNAIL_SIZE, JFIF_THUMBNAIL_SIZE,
+	};
+	struct jpeg_hdr_buf b = { .buf = buf, .len = len };
+	unsigned int nc = params->num_components;
+	unsigned int ntables = nc == JPEG_COMP_MONO ? 1 : 2;
+	unsigned int i;
+
+	if (nc != JPEG_COMP_MONO && nc != JPEG_COMP_COLOR)
+		return -EINVAL;
+
+	memset(layout, 0, sizeof(*layout));
+
+	jpeg_put_be16(&b, SOI);
+
+	if (params->jfif) {
+		jpeg_put_be16(&b, APP0);
+		jpeg_put_be16(&b, sizeof(__be16) + sizeof(jfif));
+		jpeg_put_bytes(&b, jfif, sizeof(jfif));
+	}
+
+	/* one 8-bit table per segment, luma Tq 0, chroma Tq 1 */
+	for (i = 0; i < ntables; i++) {
+		jpeg_put_be16(&b, DQT);
+		/* length field, Pq/Tq byte, table */
+		jpeg_put_be16(&b, sizeof(__be16) + sizeof(u8) + V4L2_JPEG_PIXELS_IN_BLOCK);
+		jpeg_put_u8(&b, i ? JPEG_QTABLE_CHROMA : JPEG_QTABLE_LUMA);
+		layout->dqt_offset[i] = b.pos;
+		jpeg_put_bytes(&b, NULL, V4L2_JPEG_PIXELS_IN_BLOCK);
+	}
+
+	layout->sof_offset = b.pos;
+	jpeg_put_be16(&b, SOF0);
+	jpeg_put_be16(&b, JPEG_SEG_LEN(jpeg_sof_hdr) + nc * sizeof(struct jpeg_sof_comp));
+	jpeg_put_u8(&b, JPEG_SAMPLE_PRECISION_BITS);
+	jpeg_put_be16(&b, 0);		/* height */
+	jpeg_put_be16(&b, 0);		/* width */
+	jpeg_put_u8(&b, nc);
+	for (i = 0; i < nc; i++) {
+		jpeg_put_u8(&b, i + 1);
+		jpeg_put_u8(&b, i ? JPEG_SAMPLING_H1V1 : params->luma_sampling);
+		jpeg_put_u8(&b, i ? JPEG_QTABLE_CHROMA : JPEG_QTABLE_LUMA);
+	}
+
+	jpeg_put_be16(&b, DHT);
+	/* length field, then per table class a Tc/Th byte and the DC and AC tables */
+	jpeg_put_be16(&b, sizeof(__be16) + ntables * (2 * sizeof(u8) + V4L2_JPEG_REF_HT_DC_LEN +
+						      V4L2_JPEG_REF_HT_AC_LEN));
+	jpeg_put_dht(&b, V4L2_JPEG_LUM_HT | V4L2_JPEG_DC_HT, v4l2_jpeg_ref_table_luma_dc_ht,
+		     V4L2_JPEG_REF_HT_DC_LEN);
+	jpeg_put_dht(&b, V4L2_JPEG_LUM_HT | V4L2_JPEG_AC_HT, v4l2_jpeg_ref_table_luma_ac_ht,
+		     V4L2_JPEG_REF_HT_AC_LEN);
+	if (nc == JPEG_COMP_COLOR) {
+		jpeg_put_dht(&b, V4L2_JPEG_CHR_HT | V4L2_JPEG_DC_HT,
+			     v4l2_jpeg_ref_table_chroma_dc_ht, V4L2_JPEG_REF_HT_DC_LEN);
+		jpeg_put_dht(&b, V4L2_JPEG_CHR_HT | V4L2_JPEG_AC_HT,
+			     v4l2_jpeg_ref_table_chroma_ac_ht, V4L2_JPEG_REF_HT_AC_LEN);
+	}
+
+	jpeg_put_be16(&b, SOS);
+	jpeg_put_be16(&b, JPEG_SEG_LEN(jpeg_sos_hdr) + nc * sizeof(struct jpeg_sos_comp) +
+		      sizeof(struct jpeg_sos_tail));
+	jpeg_put_u8(&b, nc);
+	for (i = 0; i < nc; i++) {
+		jpeg_put_u8(&b, i + 1);
+		jpeg_put_u8(&b, i ? JPEG_TABLE_SEL_CHROMA : JPEG_TABLE_SEL_LUMA);
+	}
+	jpeg_put_u8(&b, JPEG_SPECTRAL_START);
+	jpeg_put_u8(&b, JPEG_SPECTRAL_END);
+	jpeg_put_u8(&b, JPEG_APPROX_HIGH_LOW);
+
+	if (b.pos > len)
+		return -ENOSPC;
+
+	layout->size = b.pos;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_jpeg_write_header);
+
+/**
+ * v4l2_jpeg_hdr_set_size - set the image size in a header from v4l2_jpeg_write_header()
+ * @buf: header buffer
+ * @layout: layout returned by v4l2_jpeg_write_header()
+ * @width: image width
+ * @height: image height
+ */
+void v4l2_jpeg_hdr_set_size(void *buf, const struct v4l2_jpeg_hdr_layout *layout, u16 width,
+			    u16 height)
+{
+	u8 *sof = (u8 *)buf + layout->sof_offset;
+
+	put_unaligned_be16(height, sof + offsetof(struct jpeg_sof_hdr, height));
+	put_unaligned_be16(width, sof + offsetof(struct jpeg_sof_hdr, width));
+}
+EXPORT_SYMBOL_GPL(v4l2_jpeg_hdr_set_size);
diff --git a/include/media/v4l2-jpeg.h b/include/media/v4l2-jpeg.h
index 62dda1560275a..d789ccfeba734 100644
--- a/include/media/v4l2-jpeg.h
+++ b/include/media/v4l2-jpeg.h
@@ -167,8 +167,39 @@ struct v4l2_jpeg_header {
 	enum v4l2_jpeg_app14_tf app14_tf;
 };
 
+/**
+ * struct v4l2_jpeg_hdr_params - baseline JPEG header parameters
+ * @num_components: number of color components, 1 (grey) or 3 (YCbCr)
+ * @luma_sampling: luma horizontal and vertical sampling factors, as in the
+ *	SOF0 component specification (0x11, 0x21 or 0x22); chroma uses 0x11
+ * @jfif: emit a JFIF APP0 segment after SOI
+ */
+struct v4l2_jpeg_hdr_params {
+	u8 num_components;
+	u8 luma_sampling;
+	bool jfif;
+};
+
+/**
+ * struct v4l2_jpeg_hdr_layout - offsets of the fields set per frame
+ * @size: header size in bytes
+ * @sof_offset: offset of the SOF0 marker
+ * @dqt_offset: offset of the luma and chroma quantization table values
+ *	(V4L2_JPEG_PIXELS_IN_BLOCK bytes in zigzag order), 0 if not present
+ */
+struct v4l2_jpeg_hdr_layout {
+	u32 size;
+	u32 sof_offset;
+	u32 dqt_offset[2];
+};
+
 int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out);
 
+int v4l2_jpeg_write_header(void *buf, size_t len, const struct v4l2_jpeg_hdr_params *params,
+			   struct v4l2_jpeg_hdr_layout *layout);
+void v4l2_jpeg_hdr_set_size(void *buf, const struct v4l2_jpeg_hdr_layout *layout, u16 width,
+			    u16 height);
+
 extern const u8 v4l2_jpeg_zigzag_scan_index[V4L2_JPEG_PIXELS_IN_BLOCK];
 extern const u8 v4l2_jpeg_ref_table_luma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];
 extern const u8 v4l2_jpeg_ref_table_chroma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];
-- 
2.34.1

