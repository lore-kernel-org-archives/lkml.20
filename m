Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AC9522EF6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684765; cv=none; b=UanykELlAXOjZPBEbk20caI8bzKrPm3Nr9LUcAg7kG3poFYn2AHAZl/l3sRK7WgBbMG6pzChfXf+9mWUVRnBePiBmuXqqm4HtewIhg81nv/BsuOY4rN1qmX9SAWrONiDv5WPQdS93bd5H4TWwdTLxj/kFWFcLJngEKBagvxxiM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684765; c=relaxed/simple;
	bh=FL7ldl9LU54gpf6PaJsIAMaKHdINinRa+Hmc9p0bjVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YqpIvywpnPk3n5ZGVXA8m6+kchRU/gwz+QRgIYIAOV3ASn755pV3/49xbhFRBAeU3jX17QvTUkTbrzIEqJWBNUxDElWApqW0jqsdaGlhezzkfgBE+08883EJJg9AwUo8lKdlP/aX1zz8NDEQ91xht0EdhGO3jLU9MiUEXRZM4ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e8ERX0V2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixd98iKs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e8ERX0V2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixd98iKs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCEmtB4066673
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Obygb7aPUf7Z+CJroQ+0vxrBlTyHCRZkXWI/whnPI/8=; b=e8ERX0V2+cDjeUKF
	a+4bjWUBmE3gfTrWTdi5F2d+4QfXXnlpj5yJ0dlMJ7t1dMyJY0VEYM0F+Qc6sfxe
	zJyBuwylbwSkgWk4maxK0JIQV0wRFQRzqhnOI7kLLcfeaPyhJ4OJhOj13twwHrpo
	KjPz/4sWJ1roGwemcRbEKfQ1XbZbJFh+KZypfhnitRUU9HPQ/8fjDV8NzRA1SzKw
	Pza2f1iVyCOfzmB9lYF7Vmg4hco8GRhTT66wCgxNCwtPceGI0roNRQcBeEVIsqfZ
	tQVXmnbk9r6a/Bz+OBOcq7yYdpae5FRegkwilKHnqawC2JttXAoOZGp/Lfx5t687
	oO8ItQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnbymb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:26:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5328827bb8dso108780761cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790684761; x=1791289561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Obygb7aPUf7Z+CJroQ+0vxrBlTyHCRZkXWI/whnPI/8=;
        b=ixd98iKsyWHaHLgNdv3Xspwb5zViEXF9exTLlKyoTXS0xr1z5m06odnRfmDs/b8u0x
         ox1oglQSw+DsMWZkT9ZSkIiylxsFN8ENuL2MMhuDVNgUC3ieEXNz3Ejm4RowZUJBHr5d
         mhhUqs0tueeMfN1ws6NtSZ5hysCP1Lbd2+xJnKAX8izP1n9IgO2N+6LkkC++cKkN+nb+
         CsvfpK6xkRguZdD4Xj+JxCLce+Wp4J3F4O71ULLLyT7ReH2XkH9n6SAsFSCgKMwd3Iqm
         twY2PXVFN2r4X3dSpFITuril/zGHm9/992ARzlnSrAZ61w19dy09CP8Zw7/gxA9weP8q
         b7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684761; x=1791289561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Obygb7aPUf7Z+CJroQ+0vxrBlTyHCRZkXWI/whnPI/8=;
        b=B8Gxi279CM1aPikjVnwHoz8o6IcPH6BBzlbdxMgNpmJnh2JlX+4AyVqlbf8Xi+hcQp
         dVVUIP4uHZ0ZnJV7RN5snyneqcBndCMapsa7yv+KZ7B8lTTZGr8vTNFNyuVtvjJevEq1
         NHUqL2xbmtm47iYjWMS9a5O9PhLSOUlcFtmq6ZJ5UJ4QYs3G37eBg1KGG/eL5G+42J2I
         qdJUHJrD/PdA0UQQP+sKf+BV5LY1eFaa2MD58t5ls+5m9PX2NBZ+nWFURUi5V3teTHtV
         CoNXstFrtSrUNEwNxZ3u0Y3cEAS+wAFnJNhpV8aScraZoPxm/Ch0I/6yikiYY3FDE1Yi
         d9NA==
X-Forwarded-Encrypted: i=1; AKwUvBxz85dJ5LJ+L6MDtjqSRCj8OhR9xj3akvs6Ng21xm3d3ZJ6icohFcOEgZK8Ae3QT4jtgZfPlY0ig9mMQ3g=@vger.kernel.org
X-Gm-Message-State: AFuF++lwcIph00Xq5Wbbrfn6aGapmABK80uYVEXVfheMSsI/JUUF0E8l
	XvbBPGW8pEyr5ZnpsO+I9tRV65ETilydo5UrXubz5u991cmWZjPSAVpByOrqq1D6N3gyWqS5dNu
	0NOK4KAYk9BkcINufwOKQ9EIfuYg17rGEwV2uvQNosiK/J2NGIKlp+hr1R713mCOn47Y=
X-Gm-Gg: AYBFou2fhTaznGedFeWBCdpgUKVd/jTWXizEvpqj+A28F+aGwg5DTrHVdIt2aHuKlbT
	lLDBBjD91Fpm0SbLo7T5pg9DAnwCysXqjcUxVQPIOUl+rD0uRFsiqYo0k3JeEzH34rxuGVwCRSI
	1KcFnjYFK+w0QrJ0mxkiY//Bb1eSZK1kxfDvzzjxuD0jHWh6FdjjIXsqxg7Q5/EnZXEW8qOBqJj
	u0KwkDQ4E6gYdAOTJtHrQ+guaf10q29NenGHoaIL8YFWBSVJPiD7g9+2vq6XVzxfNijQhxKedhA
	pauGPE0uAmawjkQp0vu54clpdvPkOBC+NuwTEVMtTmM9WPBjzg7Gz2hiwD8xIEPYmbaeNnj+w+S
	OTTFEHYFyCrA1GvjuCgZuxw176R7BTSxMvuyx5uP8GCQt5PTlrCZv0V60xLs9UWO9OtpANBOt8g
	53Yw23UvxsFW/W2WkyLHPAtFkZRa4ZwU9kABkt14fdOUHegfJUW9Y=
X-Received: by 2002:a05:622a:9010:b0:533:2bf3:32f9 with SMTP id d75a77b69052e-5332bf34152mr167133171cf.46.1790684760477;
        Tue, 29 Sep 2026 05:26:00 -0700 (PDT)
X-Received: by 2002:a05:622a:9010:b0:533:2bf3:32f9 with SMTP id d75a77b69052e-5332bf34152mr167132721cf.46.1790684759975;
        Tue, 29 Sep 2026 05:25:59 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d302482sm9103956d6.12.2026.09.29.05.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:25:59 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:25:48 +0200
Subject: [PATCH v6 4/5] i2c: qcom-cci: Share the timing table across CCI
 revisions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-cci-clk-fix-v6-4-62a268cccb0f@oss.qualcomm.com>
References: <20260929-cci-clk-fix-v6-0-62a268cccb0f@oss.qualcomm.com>
In-Reply-To: <20260929-cci-clk-fix-v6-0-62a268cccb0f@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: cryAVZTbgf3fJ3RsG7QMyDY2nATQ6cgT
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbae59 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=aKP0LZVuKWpzAjQh7DIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX999ja70WULHG
 mx4QW1G2DDya3cFkAgjvGcrM49No+O0CIoj4AXIxd5P1ayOUc5crhsDvWqgaDi2l41k3iDT5+tn
 FsTjNBWoyUWcUicGLU+6nXXlxwPf8qPgU8bgKmNmVKMVE/9z6hARce0sD0Xm7cpunYnND6htzqO
 ZXkZQ/9N91P93lmhscyC4QIdURMIOa77PizODYE34II91Vbvtw+8lBdGAp5UppL2xK13s+4xZLC
 j0oKmtn/+LQ21h9pWaLIXFeX63W4AVsrEPemrDpMrgvYiBAz9nuYb5lfLLRw6hfuNFR0A3SF3+P
 HOQuXheEtV1rB+wh2ZlhS2WGjGpvFdfA4z06iWTsBYEvuVbg0Twaxd1M0V4NPkUmQow6zfWhCvp
 UXkq3zS+iNL0FVn5DO/VjwtJDQ70rAQQ5SqKLR9BI+ZrGvmSGUDocnnT8X4p7FOElw195ChDkWb
 Ba/E6rFDLPVf4F6EzGQ==
X-Proofpoint-GUID: cryAVZTbgf3fJ3RsG7QMyDY2nATQ6cgT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfXx/k+WK31ZOUb
 DPWSv99lUDBkgjGlpPRLwZvrLz3sPS10/Wsk8vxWLJukz9/ek9GYcVsNvkyb+Y8Dd8RHMHOYTxv
 ohXh2TFf8+nKHNaqhgJnPMRXxYNuu2k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290049

The hw_params timing values only depend on the CCI clock rate and the
I2C mode, not on the hardware revision: every per-variant table used
identical values for a given [rate][mode]. Only the set of supported
modes differs between revisions.

Move the timings into a single shared cci_hw_params[rate][mode] table
and describe each variant's highest supported mode in cci_data with
max_mode instead of duplicating the timing values. This removes the
per-variant timing tables without any functional change.

Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 181 +++++++++++++++-----------------------
 1 file changed, 70 insertions(+), 111 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index b6fa37a306758ec33ede6fcc39ce4412b86d9a84..21695c744502f7fb5d333f1272f3771e4d9d5508 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -124,7 +124,8 @@ struct cci_data {
 	unsigned int num_masters;
 	struct i2c_adapter_quirks quirks;
 	u16 queue_size[NUM_QUEUES];
-	struct hw_params params[NUM_CCI_CLK_RATES][NUM_I2C_MODES];
+	/* Highest I2C mode supported by this variant. */
+	u8 max_mode;
 };
 
 struct cci {
@@ -249,13 +250,76 @@ static int cci_clk_rate_idx(unsigned long rate)
 	return -EINVAL;
 }
 
+static const struct hw_params cci_hw_params[NUM_CCI_CLK_RATES][NUM_I2C_MODES] = {
+	[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
+		.thigh = 78,
+		.tlow = 114,
+		.tsu_sto = 28,
+		.tsu_sta = 28,
+		.thd_dat = 10,
+		.thd_sta = 77,
+		.tbuf = 118,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 1
+	},
+	[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
+		.thigh = 20,
+		.tlow = 28,
+		.tsu_sto = 21,
+		.tsu_sta = 21,
+		.thd_dat = 13,
+		.thd_sta = 18,
+		.tbuf = 32,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 3
+	},
+	[CCI_CLK_RATE_37_5MHZ][I2C_MODE_STANDARD] = {
+		.thigh = 201,
+		.tlow = 174,
+		.tsu_sto = 204,
+		.tsu_sta = 231,
+		.thd_dat = 22,
+		.thd_sta = 162,
+		.tbuf = 227,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 3
+	},
+	[CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST] = {
+		.thigh = 38,
+		.tlow = 56,
+		.tsu_sto = 40,
+		.tsu_sta = 40,
+		.thd_dat = 22,
+		.thd_sta = 35,
+		.tbuf = 62,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 3
+	},
+	[CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST_PLUS] = {
+		.thigh = 16,
+		.tlow = 22,
+		.tsu_sto = 17,
+		.tsu_sta = 18,
+		.thd_dat = 16,
+		.thd_sta = 15,
+		.tbuf = 24,
+		.scl_stretch_en = 0,
+		.trdhld = 3,
+		.tsp = 3
+	},
+};
+
 static const struct hw_params *cci_get_hw_params(struct cci *cci, int mode)
 {
 	unsigned long rate = clk_get_rate(cci->cci_clk);
 	int ri = cci_clk_rate_idx(rate);
 
-	if (ri >= 0 && cci->data->params[ri][mode].thigh)
-		return &cci->data->params[ri][mode];
+	if (ri >= 0 && mode <= cci->data->max_mode && cci_hw_params[ri][mode].thigh)
+		return &cci_hw_params[ri][mode];
 
 	return NULL;
 }
@@ -696,30 +760,7 @@ static const struct cci_data cci_v1_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
-	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
-		.thigh = 78,
-		.tlow = 114,
-		.tsu_sto = 28,
-		.tsu_sta = 28,
-		.thd_dat = 10,
-		.thd_sta = 77,
-		.tbuf = 118,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 1
-	},
-	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
-		.thigh = 20,
-		.tlow = 28,
-		.tsu_sto = 21,
-		.tsu_sta = 21,
-		.thd_dat = 13,
-		.thd_sta = 18,
-		.tbuf = 32,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 3
-	},
+	.max_mode = I2C_MODE_FAST,
 };
 
 static const struct cci_data cci_v1_5_data = {
@@ -729,30 +770,7 @@ static const struct cci_data cci_v1_5_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
-	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
-		.thigh = 78,
-		.tlow = 114,
-		.tsu_sto = 28,
-		.tsu_sta = 28,
-		.thd_dat = 10,
-		.thd_sta = 77,
-		.tbuf = 118,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 1
-	},
-	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
-		.thigh = 20,
-		.tlow = 28,
-		.tsu_sto = 21,
-		.tsu_sta = 21,
-		.thd_dat = 13,
-		.thd_sta = 18,
-		.tbuf = 32,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 3
-	},
+	.max_mode = I2C_MODE_FAST,
 };
 
 static const struct cci_data cci_v2_data = {
@@ -762,66 +780,7 @@ static const struct cci_data cci_v2_data = {
 		.max_write_len = 11,
 		.max_read_len = 12,
 	},
-	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
-		.thigh = 78,
-		.tlow = 114,
-		.tsu_sto = 28,
-		.tsu_sta = 28,
-		.thd_dat = 10,
-		.thd_sta = 77,
-		.tbuf = 118,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 1
-	},
-	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
-		.thigh = 20,
-		.tlow = 28,
-		.tsu_sto = 21,
-		.tsu_sta = 21,
-		.thd_dat = 13,
-		.thd_sta = 18,
-		.tbuf = 32,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 3
-	},
-	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_STANDARD] = {
-		.thigh = 201,
-		.tlow = 174,
-		.tsu_sto = 204,
-		.tsu_sta = 231,
-		.thd_dat = 22,
-		.thd_sta = 162,
-		.tbuf = 227,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 3
-	},
-	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST] = {
-		.thigh = 38,
-		.tlow = 56,
-		.tsu_sto = 40,
-		.tsu_sta = 40,
-		.thd_dat = 22,
-		.thd_sta = 35,
-		.tbuf = 62,
-		.scl_stretch_en = 0,
-		.trdhld = 6,
-		.tsp = 3
-	},
-	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST_PLUS] = {
-		.thigh = 16,
-		.tlow = 22,
-		.tsu_sto = 17,
-		.tsu_sta = 18,
-		.thd_dat = 16,
-		.thd_sta = 15,
-		.tbuf = 24,
-		.scl_stretch_en = 0,
-		.trdhld = 3,
-		.tsp = 3
-	},
+	.max_mode = I2C_MODE_FAST_PLUS,
 };
 
 static const struct of_device_id cci_dt_match[] = {

-- 
2.34.1

