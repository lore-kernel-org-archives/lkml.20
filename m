Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414ED3A48F7
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326495; cv=none; b=C8EoL3uScPGd7GsXkyHWEgkNLUtxAslTUCZareJjYKUI0wV+eCi3HoDXm2VdSgyuKcE2yMGAYGluvBa7QBZuK8VPzsAOtsnqSjQgRDpXLDoyb9eBKlNOdlzgiq4GMtQo/rJ1I7rZRgBG2JKwM3JBt9pos7fh4AlwpczU6q/eSQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326495; c=relaxed/simple;
	bh=2hKc1ZoGqwUQh1gTMahm7DabCTCAHzhOeNtSIJ0Xy6M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j3GEmfu2dcriCgj5nrAUQkEnjDwATartWHjxKbc5scK83Ozya9l3vqHqWNNLBjAQ0709Lup8zqwxlH9ivsYlRPPprNgC3GnGccrolFJV5FRFKvfBWmAhviLDQE9kOxoRCKcnsRcLhKvAara3T9Ug8JM1/HZ10xBdmOONPluSTO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1lyhsRP reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1lyhsRP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeIt41029262
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JYdD8egJwrL
	g7NcyXfZXtIAdt/Efnj+hzcMMsvzKWN4=; b=H1lyhsRPLW60l0+9q/Z/MIxKJke
	yqe5oNxiHtGNC3vuLFKx2lfZpCUtR2KRH9MLphlcfAV1m9zJLwsHsDfyNTHFXRkA
	Mu/dZ4Gi9AW2uvwZQlFzdYl98n4buvLtRV9iLLbGsbETCZtZPjmgFkWFgPDN3Nvi
	25LSK39ofanak6w3TXdWJw9GAwHFvp8Lc0RAJbQr2H+35gaBpj42flIoMggKpbuH
	fZnaFN3b4iwNGFJiOyKkgvgKNtgSmRuncG2hE4889/3Ci2MhNUTSmF0RHmY7zo+d
	+pUfFcj1Z9+h5G7GPkj3NCl8JgLzRU1hlZy6KcuegvFg7uAYmoTdLvJGaoQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53ashu2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:40:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c5ab5c136so550454485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326458; x=1791931258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JYdD8egJwrLg7NcyXfZXtIAdt/Efnj+hzcMMsvzKWN4=;
        b=KFpphN6qW6q2TGF0ZjHcpZzgGOm/eUY2CNv8gbmnpM3LXHw9aEYbVDCrVTwIIXiKIF
         CAjwNnEpY1PS8fvDeSNALfjrgKW/khPmJtC6D/FS2saUf5bqEQkFAj+vDmS6hgjJBEH8
         bgIPIrQJQPbLB9/uCz9g9woelB05ZyDDsW3O0r4siguZVni6FSGNRp3NaoVyY2fsjI0e
         D96IVaKI1URyHdDSeFRuRshJ6I5I8hoYzP80OLoSOasSi/LsFeHw0Urn3/egcpdyj0YW
         lHDT4CEBN3AetnfU+yKqduR+xb9VO6DlwvTspBwUg+DwFIUyW81i5D9ubVTF6YrIz2K7
         w3XA==
X-Forwarded-Encrypted: i=1; AKwUvBxo3q1UHOPDCCB2ezgOrzA937pfWWanO3ydhUyRdHyBdAjNXphRTc3OTihOVAlNFXGo3F1aAsDMiOEWYBw=@vger.kernel.org
X-Gm-Message-State: AFuF++k/xlwWsrKqCqyBwRX6ji+XQikPtUE/5b007rp0J7k2L6KuLWlK
	XQ9mWXI6EyNqbZEAFibdpOxQo0ltiOriyLmktT4BIBforYUQvs7S1/pQ94YshRbr+1qTtUTQq4K
	pqLnyHNf2qJ0WtNkWCYVH78dqZHJuKj3xz3+RjkbKd7+wo4/5ahTnQM6PiTR89XqPppo=
X-Gm-Gg: AYBFou0gjlgCPC7coOPUUnzeSIFxdgX7eJ7UkcijGgGIQtH8Txg8+ShrUzEBE38eQmO
	XBtTAJZvA8DEusd09o9WvA/YZhGdmiLkE9r8gEPHOabU4V+kvwQIpoB0ILD57rKTqYS2FDe+wBI
	YGQOAEpfNbVtGXzvmKsDO6ffwnDgt4Uv4c2KHTTa5Bq3B3eG2efXysTreA2GQ8YU7ePdPVxeqva
	96ddfGwDMf6fWJjGdoZ3QckLmSeR1K01iUpNdSUKoddtAAcdjSZOBrxF+RMVXB7yzZTtpcHL6Da
	7SGqqlPCB2MxRUlgSlh2wiPqmNjAgKo/TEVP9HndUJhnKzO2OwMpKBChtWA=
X-Received: by 2002:a05:620a:2586:b0:93e:9808:8d6e with SMTP id af79cd13be357-93e9b857d84mr73448585a.72.1791326458231;
        Tue, 06 Oct 2026 15:40:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2586:b0:93e:9808:8d6e with SMTP id af79cd13be357-93e9b857d84mr73444785a.72.1791326457711;
        Tue, 06 Oct 2026 15:40:57 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:57 -0700 (PDT)
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
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 18/45] media: qcom: camss: integrate IFE devices
Date: Wed,  7 Oct 2026 01:39:26 +0300
Message-Id: <20261006223953.3382273-19-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7RaRQZW_2lseBAyKoRrpGZ9RSjff7F1s
X-Proofpoint-GUID: 7RaRQZW_2lseBAyKoRrpGZ9RSjff7F1s
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac578fb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=mQKNiLCmDEPOf1wI07oA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXzmyqM4ANaivk
 ejuEZKoINY24TUUlm48QDBpP1neaH6njQB0pCARHxTlFhFZJmWbhE+dMoYOs7/kGGJdFX2F/9k/
 XiTU+KAMiyFnB7ngRvA8V/l5L0egU6Fhbd0QwspGgILG8x2ylv1idQleW2qWo4YCEo+QzxKN0QD
 dPdFysWi7u7QJsBmMCO2ZJBX/hhI2JHhDkln2sXGvc7act4vzJgyuMRrJFwlSNJ6nOilMOojP22
 D/uhYsAUZfeR0DEw8AcSRMVEEQYQaG9Xh8HPJ5EXCdNc7DaQOqL5s0XMSHNDT9tTB0jz4/ypkuj
 YBsIh5X3i1bgyXnpuphbeiwHBK3Ex5DRn5Y15O3Vb2jN6ZU4O0VylYce90z80APq6iQE/WGCWTH
 FtK7RR7T9AIV6f9OTYMa1XSmrp2mIaPreTS1cNRq7uTBweJbm9dj5V+Yc76a1O155yMjTVfv/p5
 WackdudaJ5RtPsRX7aQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX+YqkoD98a/Rz
 w5QU69VDjWCmwJVPfTGD4zMkWU7qJqC2Yaq/deL7y1pXgwOO9TjaSp8keo5H8DSde8JDsc0uLVI
 yadUuZ2VbOIFcAbJsI+8rxA4njLJ/Vw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Integrate IFE devices with CAMSS probe, power management, media entity
registration, and performance management. Keep the legacy VFE path
unchanged.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 471 +++++++++++++++++++++-
 1 file changed, 460 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1f662b1caf5a..7c355003c957 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -32,6 +32,9 @@
 #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
 #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
 
+/* Number of pixels fetched per clock cycle */
+#define CAMSS_NUM_OF_PIXELS_PER_CYCLE	2
+
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
@@ -4653,6 +4656,108 @@ s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
 	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
 }
 
+static int camss_get_num_lanes(struct media_entity *entity,
+			       unsigned int *lanes)
+{
+	struct media_pad *pad;
+
+	while (1) {
+		struct v4l2_subdev *sd;
+
+		pad = &entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			return -ENODEV;
+
+		pad = media_pad_remote_pad_first(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			return -ENODEV;
+
+		sd = media_entity_to_v4l2_subdev(pad->entity);
+		if (sd->grp_id == CSIPHY_GRP_ID) {
+			struct csiphy_lanes_cfg *lane_cfg;
+			struct csiphy_device *csiphy;
+
+			csiphy = v4l2_get_subdevdata(sd);
+			if (!csiphy->cfg.csi2)
+				return -ENODEV;
+
+			lane_cfg = &csiphy->cfg.csi2->lane_cfg;
+			if (!lane_cfg->num_data)
+				return -EINVAL;
+
+			*lanes = lane_cfg->num_data;
+			return 0;
+		}
+
+		entity = pad->entity;
+	}
+}
+
+static int camss_get_pixel_clock_from_link_freq(struct media_entity *entity,
+						unsigned int bpp,
+						u64 *pixel_clock)
+{
+	struct media_pad *sensor_pad;
+	unsigned int lanes;
+	s64 link_freq;
+	int ret;
+
+	if (!bpp)
+		return -EINVAL;
+
+	sensor_pad = camss_find_sensor_pad(entity);
+	if (!sensor_pad)
+		return -ENODEV;
+
+	ret = camss_get_num_lanes(entity, &lanes);
+	if (ret)
+		return ret;
+
+	link_freq = v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
+	if (link_freq < 0)
+		return link_freq;
+
+	*pixel_clock = div_u64(link_freq * 2 * lanes, bpp);
+
+	return 0;
+}
+
+/*
+ * camss_get_pixel_clock - Get pixel clock rate from sensor
+ * @entity: Media entity in the current pipeline
+ * @bpp: Number of bits per pixel for the current format
+ * @pixel_clock: Received pixel clock value
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int camss_get_pixel_clock_bpp(struct media_entity *entity, unsigned int bpp,
+			      u64 *pixel_clock)
+{
+	struct media_pad *sensor_pad;
+	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *ctrl;
+	int ret;
+
+	ret = camss_get_pixel_clock_from_link_freq(entity, bpp, pixel_clock);
+	if (!ret)
+		return 0;
+
+	sensor_pad = camss_find_sensor_pad(entity);
+	if (!sensor_pad)
+		return -ENODEV;
+
+	subdev = media_entity_to_v4l2_subdev(sensor_pad->entity);
+
+	ctrl = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
+
+	if (!ctrl)
+		return -EINVAL;
+
+	*pixel_clock = v4l2_ctrl_g_ctrl_int64(ctrl);
+
+	return 0;
+}
+
 /*
  * camss_get_pixel_clock - Get pixel clock rate from sensor
  * @entity: Media entity in the current pipeline
@@ -4746,6 +4851,156 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
 	.get_base_address = vfe_parent_dev_ops_get_base_address
 };
 
+static const u32 cam_cc_sbi_clk_rates[] = {
+	19200000, 350000000, 475000000, 576000000, 680000000,
+};
+
+static int camss_set_perf_level(struct camss *camss, struct ife_device *ife)
+{
+	enum camss_perf_mode perf_max = CAMSS_PERF_MAX_MODES - 1;
+	u64 freq_min, pixel_clock = 0;
+	u32 sink_pad = ife->sink_pad;
+	int pixelformat, fmt_index, i;
+	u8 bits_per_pixel = 0;
+	int ret;
+
+	fmt_index = camss_get_pixfmt_index(ife->pads[sink_pad].fmt.code,
+					   ife->pads[sink_pad].desc->sup_fmts.formats,
+					   ife->pads[sink_pad].desc->sup_fmts.nformats);
+	if (fmt_index < 0) {
+		dev_err(camss->dev, "%s Can't find requested format index: 0x%x\n", __func__,
+			ife->pads[sink_pad].fmt.code);
+		return fmt_index;
+	}
+
+	pixelformat = ife->pads[sink_pad].desc->sup_fmts.formats[fmt_index].pixelformat;
+
+	ret = camss_get_pixfmt_depth(pixelformat, Y_PLANE, &bits_per_pixel);
+	if (ret) {
+		dev_err(camss->dev, "%s Unknown pixel format: 0x%x\n", __func__,
+			pixelformat);
+		return ret;
+	}
+
+	ret = camss_get_pixel_clock_bpp(&ife->sd.entity, bits_per_pixel,
+					&pixel_clock);
+	if (ret) {
+		camss->perf_mode = CAMSS_PERF_MODE_NOM;
+		return 0;
+	}
+
+	freq_min = pixel_clock * bits_per_pixel / CAMSS_NUM_OF_PIXELS_PER_CYCLE / BITS_PER_BYTE;
+	camss->perf_mode = perf_max;
+
+	for (i = 0; i < ARRAY_SIZE(cam_cc_sbi_clk_rates); i++) {
+		if (freq_min <= cam_cc_sbi_clk_rates[i]) {
+			camss->perf_mode = min_t(u8, i, perf_max);
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static int camss_core_get(struct camss *camss, u8 entity_id)
+{
+	int ret;
+
+	if (atomic_inc_return(&camss->perf_ref_count) > 1)
+		return 0;
+
+	ret = camss_set_perf_level(camss, &camss->ife[entity_id]);
+	if (ret)
+		dev_warn(camss->dev, "Cannot configure the performance level\n");
+
+	ret = pm_runtime_resume_and_get(camss->dev);
+	if (ret < 0) {
+		dev_err(camss->dev, "Core domain cannot be acquired\n");
+		atomic_dec(&camss->perf_ref_count);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int camss_core_put(struct camss *camss)
+{
+	int ret;
+
+	if (atomic_dec_if_positive(&camss->perf_ref_count))
+		return 0;
+
+	ret = pm_runtime_put_sync(camss->dev);
+	if (ret < 0) {
+		dev_err(camss->dev, "Core domain cannot be released\n");
+		return ret;
+	}
+
+	camss->perf_mode = CAMSS_PERF_MODE_MINSVS;
+
+	return 0;
+}
+
+static int ife_parent_dev_ops_get(struct camss *camss, int id)
+{
+	int ret = -EINVAL;
+
+	if (id < camss->res->ife_num + camss->res->ife_lite_num) {
+		struct ife_device *ife = &camss->ife[id];
+
+		ret = ife_get(ife);
+	}
+
+	return ret;
+}
+
+static int ife_parent_dev_ops_put(struct camss *camss, int id)
+{
+	if (id < camss->res->ife_num + camss->res->ife_lite_num) {
+		struct ife_device *ife = &camss->ife[id];
+
+		ife_put(ife);
+	}
+
+	return 0;
+}
+
+static void __iomem
+*ife_parent_dev_ops_get_base_address(struct camss *camss, int id)
+{
+	if (id < camss->res->ife_num + camss->res->ife_lite_num) {
+		struct ife_device *ife = &camss->ife[id];
+
+		return ife->top_ctx.base;
+	}
+
+	return NULL;
+}
+
+static const struct parent_dev_ops ife_parent_dev_ops __maybe_unused = {
+	.get = ife_parent_dev_ops_get,
+	.put = ife_parent_dev_ops_put,
+	.get_base_address = ife_parent_dev_ops_get_base_address
+};
+
+int camss_attach_host_data(struct camss *camss, struct v4l2_subdev *sd,
+			   bool is_sensor, int id)
+{
+	struct camss_host_priv_data *host_data;
+	struct device *dev = camss->dev;
+
+	host_data = devm_kzalloc(dev, sizeof(*host_data), GFP_KERNEL);
+	if (!host_data)
+		return -ENOMEM;
+
+	host_data->is_sensor = is_sensor;
+	host_data->id = id;
+
+	v4l2_set_subdev_hostdata(sd, host_data);
+
+	return 0;
+}
+
 /*
  * camss_parse_endpoint_node - Parse port endpoint node
  * @dev: CAMSS device
@@ -4833,6 +5088,46 @@ static int camss_parse_ports(struct camss *camss)
 	return ret;
 }
 
+static int camss_init_csid_subdevices(struct camss *camss)
+{
+	const struct camss_resources *res = camss->res;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < res->csid_num; i++) {
+		ret = msm_csid_subdev_init(camss, &camss->csid[i],
+					   &res->csid_res[i], i);
+		if (ret < 0) {
+			dev_err(camss->dev, "Failed to init csid%d sub-device: %d\n",
+				i, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int camss_init_ife_subdevices(struct camss *camss)
+{
+	const struct camss_resources *res = camss->res;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < camss->ife_total_num; i++) {
+		void __iomem *csid_base = camss->csid[i].base;
+
+		ret = camss_ife_subdev_init(camss, &camss->ife[i],
+					    &res->ife_res[i], i, csid_base);
+		if (ret < 0) {
+			dev_err(camss->dev, "Fail to init ife%d sub-device: %d\n",
+				i, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 /*
  * camss_init_subdevices - Initialize subdev structures and resources
  * @camss: CAMSS device
@@ -4882,6 +5177,11 @@ static int camss_init_subdevices(struct camss *camss)
 		}
 	}
 
+	if (camss->ife_total_num > res->csid_num) {
+		dev_err(camss->dev, "IFE resources require one CSID per IFE\n");
+		return -EINVAL;
+	}
+
 	/* Get optional CSID wrapper regs shared between CSID devices */
 	if (res->csid_wrapper_res) {
 		char *reg = res->csid_wrapper_res->reg;
@@ -4893,15 +5193,20 @@ static int camss_init_subdevices(struct camss *camss)
 		camss->csid_wrapper_base = base;
 	}
 
-	for (i = 0; i < camss->res->csid_num; i++) {
-		ret = msm_csid_subdev_init(camss, &camss->csid[i],
-					   &res->csid_res[i], i);
-		if (ret < 0) {
-			dev_err(camss->dev,
-				"Failed to init csid%d sub-device: %d\n",
-				i, ret);
+	if (res->embedded_csid) {
+		ret = camss_init_ife_subdevices(camss);
+		if (ret)
+			return ret;
+	}
+
+	ret = camss_init_csid_subdevices(camss);
+	if (ret)
+		return ret;
+
+	if (!res->embedded_csid) {
+		ret = camss_init_ife_subdevices(camss);
+		if (ret)
 			return ret;
-		}
 	}
 
 	ret = msm_ispif_subdev_init(camss, res->ispif_res);
@@ -4942,6 +5247,9 @@ static int camss_link_entities(struct camss *camss)
 	int i, j, k;
 	int ret;
 
+	if (camss->ife_total_num)
+		return camss->res->link_entities(camss);
+
 	for (i = 0; i < camss->res->csiphy_num; i++) {
 		for (j = 0; j < camss->res->csid_num; j++) {
 			ret = media_create_pad_link(&camss->csiphy[i].subdev.entity,
@@ -5126,8 +5434,24 @@ static int camss_register_entities(struct camss *camss)
 		}
 	}
 
+	for (i = 0; i < camss->ife_total_num; i++) {
+		ret = ife_register_entities(&camss->ife[i],
+					    &camss->v4l2_dev);
+		if (ret < 0) {
+			dev_err(camss->dev,
+				"Failed to register ife%d entities: %d\n",
+				i, ret);
+			goto err_reg_ife;
+		}
+	}
+
 	return 0;
 
+err_reg_ife:
+	for (i--; i >= 0; i--)
+		ife_unregister_entities(&camss->ife[i]);
+
+	i = camss->res->vfe_num;
 err_reg_vfe:
 	for (i--; i >= 0; i--)
 		msm_vfe_unregister_entities(&camss->vfe[i]);
@@ -5180,6 +5504,9 @@ static void camss_unregister_entities(struct camss *camss)
 
 	for (i = 0; i < camss->res->vfe_num; i++)
 		msm_vfe_unregister_entities(&camss->vfe[i]);
+
+	for (i = 0; i < camss->ife_total_num; i++)
+		ife_unregister_entities(&camss->ife[i]);
 }
 
 static int camss_subdev_notifier_bound(struct v4l2_async_notifier *async,
@@ -5193,6 +5520,20 @@ static int camss_subdev_notifier_bound(struct v4l2_async_notifier *async,
 	struct csiphy_device *csiphy = &camss->csiphy[id];
 
 	csiphy->cfg.csi2 = &csd->interface.csi2;
+
+	if (camss->ife_total_num) {
+		int ret;
+
+		ret = camss_attach_host_data(camss, subdev, true, id);
+		if (ret) {
+			dev_err(camss->dev,
+				"Failed to alloc host private data: %d\n", ret);
+			return ret;
+		}
+
+		return 0;
+	}
+
 	subdev->host_priv = csiphy;
 
 	return 0;
@@ -5210,6 +5551,16 @@ static int camss_subdev_notifier_complete(struct v4l2_async_notifier *async)
 		unsigned int i;
 		int ret;
 
+		if (camss->ife_total_num) {
+			struct camss_host_priv_data *host_data;
+
+			host_data = v4l2_get_subdev_hostdata(sd);
+			if (!host_data || !host_data->is_sensor)
+				continue;
+
+			csiphy = &camss->csiphy[host_data->id];
+		}
+
 		if (!csiphy)
 			continue;
 
@@ -5247,6 +5598,53 @@ static const struct media_device_ops camss_media_ops = {
 	.link_notify = v4l2_pipeline_link_notify,
 };
 
+static int camss_configure_ife_pd(struct camss *camss)
+{
+	struct device *dev = camss->dev;
+	int i;
+	int ret;
+
+	camss->ife_genpd = devm_kcalloc(dev, camss->genpd_num,
+					sizeof(*camss->ife_genpd), GFP_KERNEL);
+	if (!camss->ife_genpd)
+		return -ENOMEM;
+
+	camss->ife_genpd_link = devm_kcalloc(dev, camss->genpd_num,
+					     sizeof(*camss->ife_genpd_link),
+					     GFP_KERNEL);
+	if (!camss->ife_genpd_link)
+		return -ENOMEM;
+
+	for (i = 0; i < camss->genpd_num; i++) {
+		camss->ife_genpd[i] = dev_pm_domain_attach_by_id(dev, i);
+		if (IS_ERR(camss->ife_genpd[i])) {
+			ret = PTR_ERR(camss->ife_genpd[i]);
+			goto fail_pm;
+		}
+	}
+
+	if (camss->genpd_num > camss->res->ife_num) {
+		i = camss->genpd_num - 1;
+		camss->ife_genpd_link[i] =
+			device_link_add(dev, camss->ife_genpd[i],
+					DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
+					DL_FLAG_RPM_ACTIVE);
+		if (!camss->ife_genpd_link[i]) {
+			ret = -EINVAL;
+			i = camss->genpd_num;
+			goto fail_pm;
+		}
+	}
+
+	return 0;
+
+fail_pm:
+	while (i--)
+		dev_pm_domain_detach(camss->ife_genpd[i], true);
+
+	return ret;
+}
+
 static int camss_configure_pd(struct camss *camss)
 {
 	const struct camss_resources *res = camss->res;
@@ -5271,6 +5669,9 @@ static int camss_configure_pd(struct camss *camss)
 	if (camss->genpd_num == 1)
 		return 0;
 
+	if (camss->ife_total_num)
+		return camss_configure_ife_pd(camss);
+
 	/* count the # of VFEs which have flagged power-domain */
 	for (vfepd_num = i = 0; i < camss->res->vfe_num; i++) {
 		if (res->vfe_res[i].vfe.has_pd)
@@ -5351,6 +5752,20 @@ static void camss_genpd_subdevice_cleanup(struct camss *camss)
 		msm_vfe_genpd_cleanup(&camss->vfe[i]);
 }
 
+static void camss_ife_genpd_cleanup(struct camss *camss)
+{
+	int i;
+
+	if (camss->genpd_num > camss->res->ife_num) {
+		i = camss->genpd_num - 1;
+		if (camss->ife_genpd_link[i])
+			device_link_del(camss->ife_genpd_link[i]);
+	}
+
+	for (i = 0; i < camss->genpd_num; i++)
+		dev_pm_domain_detach(camss->ife_genpd[i], true);
+}
+
 static void camss_genpd_cleanup(struct camss *camss)
 {
 	if (camss->genpd_num == 1)
@@ -5358,6 +5773,11 @@ static void camss_genpd_cleanup(struct camss *camss)
 
 	camss_genpd_subdevice_cleanup(camss);
 
+	if (camss->ife_total_num) {
+		camss_ife_genpd_cleanup(camss);
+		return;
+	}
+
 	if (camss->genpd_link)
 		device_link_del(camss->genpd_link);
 
@@ -5382,8 +5802,23 @@ static int camss_probe(struct platform_device *pdev)
 
 	camss->res = of_device_get_match_data(dev);
 
+	if (camss->res->vfe_num &&
+	    (camss->res->ife_num || camss->res->ife_lite_num)) {
+		dev_err(dev, "VFE and IFE resources are mutually exclusive\n");
+		return -EINVAL;
+	}
+
+	if ((camss->res->ife_num || camss->res->ife_lite_num) &&
+	    !camss->res->link_entities) {
+		dev_err(dev, "IFE resources require entity link operations\n");
+		return -EINVAL;
+	}
+
 	atomic_set(&camss->ref_count, 0);
+	atomic_set(&camss->perf_ref_count, 0);
 	camss->dev = dev;
+	camss->core_get = camss_core_get;
+	camss->core_put = camss_core_put;
 	platform_set_drvdata(pdev, camss);
 
 	camss->csiphy = devm_kcalloc(dev, camss->res->csiphy_num,
@@ -5417,6 +5852,14 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss->vfe)
 		return -ENOMEM;
 
+	camss->ife_total_num = camss->res->ife_num + camss->res->ife_lite_num;
+	if (camss->ife_total_num) {
+		camss->ife = devm_kcalloc(dev, camss->ife_total_num,
+					  sizeof(*camss->ife), GFP_KERNEL);
+		if (!camss->ife)
+			return -ENOMEM;
+	}
+
 	ret = camss_icc_get(camss);
 	if (ret < 0) {
 		dev_err(dev, "Failed to configure ICC: %d\n", ret);
@@ -5430,8 +5873,10 @@ static int camss_probe(struct platform_device *pdev)
 	}
 
 	ret = camss_init_subdevices(camss);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Failed to init subdevices: %d\n", ret);
 		goto err_genpd_cleanup;
+	}
 
 	ret = dma_set_mask_and_coherent(dev, 0xffffffff);
 	if (ret) {
@@ -5463,12 +5908,16 @@ static int camss_probe(struct platform_device *pdev)
 	}
 
 	ret = camss_register_entities(camss);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Failed to register entities: %d\n", ret);
 		goto err_v4l2_device_unregister;
+	}
 
 	ret = camss_link_entities(camss);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Failed to link entities: %d\n", ret);
 		goto err_register_subdevs;
+	}
 
 	ret = media_device_register(&camss->media_dev);
 	if (ret < 0) {
-- 
2.34.1

