Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406649;
	b=yBdCo5+v9FUuse9T1EbcuZoX7dciFVp8yjYBSRkqsSva0t/uQgpw/IkFBgE3D75jUJMu
	 cL1zBpUYfEycZywknZNmq0VbKkHRFpbWdQKQZP8HRSxTM3hKMDu0WrL6wp726/rFuma3z
	 StydBbmRkQbws/h52cYxHQtME3JZ8pCIjB14qn/FNMgz4uRH1aZsJDRZaafSqG5Yfjqef
	 BeKqQwqBV1EQjQCUos2g/2M1QkZdMdSKVj0vBljG3IHYqiUjAyzSC/u9s7Hij/uOSpqrF
	 A9oVHdKC+nzuw/RbS2G/I7E2MRt/jBGwVZ1F1S6COe/mAM5ndFZcCRf85mXwIOXIcQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=INKPgv0UQ5g64jW730Hr9K6Juzy/BAoRk4OPlmTA1sk=;
	b=OlrPSiqr56lzt3WuoRUWCA8DvX4yhUa8UKhOjkHlJY2Sn/RRPbl1Qi8dB7tCAXoJpv8C
	 VExTthiYqfPpXu04YbAlE/3+sHrkrWJoXToD7ySFgyaoL57b1UJo0lKH9xG3aMy+It+9k
	 9RMqE4qKlTLkdKM+sFkHTmmFVz6kyvAQXZxWMa00U0PKUVnoEq29sYB7rZShWYHyZOGac
	 bHWo51hjEuZjwJ5/b3MySffmWL0r18M9OtwP4amtK8NNgLLRZ2pd5Y9O8Q+tiBQLabF5P
	 Pd0KimsT8u1LPYuNhx8MPVMs2r9PHQHefzycv16R+60A5zgpcGLwh2q3qrCzWNmQoXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GWduKCsF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CIoz7MEN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F9C606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54F9C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GWduKCsF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CIoz7MEN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEHQqk2556248
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INKPgv0UQ5g64jW730Hr9K6Juzy/BAoRk4OPlmTA1sk=; b=GWduKCsF+T8AYjIq
	+ltI7zxzLSIy1boE5Ho4aIbuyURdrhLoSBAPMsJxitStXqT4zMVADe5aolBalsR9
	CI2bYJvkk3o8sRPNTDo1Qyra2XH6OPFpYNE97i/4i6ALw0BPfzSYHidfSq6G4a/i
	k9UfnHDBDwIBwV0dzaDR5BRHCGLf0AwHu8Y6f9rX1JStDlpVol7cnx8JjmHc1mnZ
	3aKLngKU1f/PCzsmsnOOo02XLQsaMh1lFRET9DNXgEQM4SqQI+5Z0fhq97T8Fsq5
	mgqhguqEahVS4pK8OHa9ow8XbzLIAjSMsr+Dd8cRfyAJy91aJ9acUr+xMo3IeV/b
	q1nr4A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmb0ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:17:27 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a5005fd0f8so15969c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406646; x=1795011446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=INKPgv0UQ5g64jW730Hr9K6Juzy/BAoRk4OPlmTA1sk=;
        b=CIoz7MENylzrsLGZifHLlVdEeYNg7W7gaS6Xr4tW934bvl1aggvgVUgCqKdw5U9xv8
         N8KPrCHa0RqXzSeKS65aAaulRv837oXb+GkjeYVk0awa+qKq5bP0L6jMJ2x4sFS1DgoA
         zFlmxyUod+1UObEiM45GKYolyIscdMxUQ060DiC8a/03mcrHDK2JW+BPe8V650yxcdxy
         0+AzuSQ57HDmySpeRFHvekaGWWgrnDXiW/Lx9eSgwzeAZajHrVvRIydDLGYNDFOQlyyk
         3fSX61D0lnA/ahIvT0i3veq4zl+fjmO2sreVTrC/GLkDlm3TMzHjL98B3z8nkxgDPQLd
         oyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406646; x=1795011446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INKPgv0UQ5g64jW730Hr9K6Juzy/BAoRk4OPlmTA1sk=;
        b=XxLsIksop39bp020fevZcY2xcrU2KyqjW9IdJLU7bHCtxku0ucsyfberbagmHA8Pxa
         iFso6HaIJxom0AxpGwZHK9/IK5Nt5buUsT6yWSS0kMmaaJzWMuCy+zxZ9lQIz3X3xr/O
         MkNHxUWLew97bUCDbKt0CU2r3q8NdSWngctvvyZWkiVrgrWLyplRErAJKmUmADnYQ4RZ
         qyvaMMIffjqaTh6PPhHh5qqCj9HmTrxYqcX3kYZvNY7JS/KG27h6wxVXxJF6253rwEBy
         hCFRG1dzmIzMobEDpDqrx2WwGXV89jU8lGfHX5aHbhSBhMUSOl0LPQZKJRBlJalBj6lQ
         IZWw==
X-Forwarded-Encrypted: i=1; AL+hErHzAnS/BeoMQ8NskkpomwVjmbcjrzxjLVGBqK6w2E0z78d5mskgvvpZPEtamyTSz8sDdva4TleHN0ImOgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TlEC7FzPfBDgYwi1hmB6E+iWpqPzXfyoSvOwP6i8mILTHYumt
	ILg0X++v9CQtzrH0Qd1Y6Wh8CeNNGYWvBTwsneWLa7im2aScYUmoB1aIPXfjb3haBU3d9GVEvOQ
	Sg3yqVhk1SQquZC1gXh+cCtC3m9Hl84sA6cWixeTHnpPn3/t8tBhBQ/G8POG4J1Vz4eU=
X-Gm-Gg: AYBFou3YtVEwhL9T5ldcV4z6rOI6tOfEo+Wv0P2INHfpCmuu0aV8wbMHuL+XIKdHHt9
	mA6dhLcGa0DqTfdi/1PFt9VqySdV7c17bs5kdgKIGXxicoRUZ8i9RdekAOpYERrDMcSCinMrE3a
	BuHvSiymHXO58n3aW5oem8nqAT9BkjiUE/oAuEfDV4yM7q/kvJNajyUA2+QYibj/zzRt4BQCDuh
	OUwuABX+2Nt7k/+eHIgHaScAl0zZc+/jzQc40LzduOsEpXL7Qq37p1n+LdMJ/M2WRY0xqN8bKHk
	WQgsqL5Z1AZb4f+PZmWHXFPQ/PkmNm84gzffZqegat6IqKTpE1mJt24yzpRCmOuhQV/6WXhn05P
	ql7ToXN6FfzO7d3E8LfX8Pzs+gP9zBencdt7qh7HgOV09rqkW8y7r8bS2s8/jXTJi86OVXV2ztw
	==
X-Received: by 2002:a05:701b:2504:b0:15a:9834:73f2 with SMTP id a92af1059eb24-1b3c0346852mr2286693c88.38.1794406646053;
        Wed, 11 Nov 2026 06:17:26 -0800 (PST)
X-Received: by 2002:a05:701b:2504:b0:15a:9834:73f2 with SMTP id a92af1059eb24-1b3c0346852mr2286654c88.38.1794406645260;
        Wed, 11 Nov 2026 06:17:25 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm33747063c88.10.2026.11.11.06.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:17:23 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 19:47:01 +0530
Subject: [PATCH v2 1/6] soc: qcom: ice: Add TZ agnostic re-direction
 functions
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
Message-Id: <20261111-ice-migrate-tee-svc-v2-1-29d19f6c92ab@oss.qualcomm.com>
References: <20261111-ice-migrate-tee-svc-v2-0-29d19f6c92ab@oss.qualcomm.com>
In-Reply-To: <20261111-ice-migrate-tee-svc-v2-0-29d19f6c92ab@oss.qualcomm.com>
To: Eric Biggers <ebiggers@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794406634; l=6890;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=U/F0N1m9z5s/jWcGR7AWZ8785xtrM8Lnbkax3sg42pQ=;
 b=tW/Kc5xDLUAuqgwhCTnoqqxnDJFCQuDBZ375Onj8DJKqzjyatjnlWdaKWJGxbE6Ohf9hAnBEL
 n0iJLzEu/K+CkEAhMol4pLs8RSIuss+rXYq/DN6FKowyF1C6s8iwl5l
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: tpuj0g1nNXVtXkgM2UTi0S8E1WVGGcjD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX9Jovwxm4bvvr
 cmdWvTln6VaYJrSesWwwHdJ6JM6IZUjHBoIn0YoYYXVK41+CxyEVEIAwPTNq/9ado1ZL0Lx0FYH
 mTBEikgT7JnKkQCB/QyBqOPeU1msQro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX7IWhs7obgQ9/
 TBYaXV2j6OZ8wBABs1ijeN42bmvZ4b4sv0SPwffZ+2tP3G6pOdWsH/V9ELmae2/SxMARRwIBVYH
 OY2gsaG6edn7b3B0vYPr1HzpmQlo08Q5dVtHLUEb8nvKQYEpwcKx5dkkP9UgX4q9tvjH1XUpuAM
 7x4vHNHMF2KAQB3OkU153liUYRtc6iBLeD2FYXJy8DeNsvRsd3OaE/ZhWslDMu+F0DzvnSNXZER
 +O1bCUDiJhzBibC8B0MNrp3pHLIHrSZzYj+hBvFJyFDLviFc/wCE8AJ/6Te6Ty25jG944vrIlLo
 BJ2KdDHgU+qtyzBg0IM3rwsbycPDcxUeVCOue3KMd38IJ1mOKGwINBRNwEaJT1YvVHanx25YFEO
 obne140l9F2LgXpjXMJqLC8l8kGc6VHYdF1R0VcRwWEMaFb44kth7VPdLbud/JqPRGWtBW6XmNd
 r9WYCCL9z7UiT94HfyA==
X-Proofpoint-GUID: tpuj0g1nNXVtXkgM2UTi0S8E1WVGGcjD
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af478f7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0IJvIL8Rtrd2xGF69cYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

Qualcomm platforms such as the IQ-9075 EVK now boot with both QTEE and
OPTEE. However, the Qualcomm Inline Crypto Engine (ICE) driver currently
only makes SCM calls into QTEE. With the arrival of ICE support on OPTEE
for Qualcomm platforms the ICE driver should call into the correct Trust
Zone (TZ) at runtime to request programming of the secure interfaces on
the hardware block.

Add TZ agnostic re-direction functions for all the current QTEE SCM calls
which can route the calls to either an SCM or TEE bus-based secure back
end when registered with ICE.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 124 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/soc/qcom/ice.h |  56 ++++++++++++++++++++++
 2 files changed, 180 insertions(+)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index e256595b9826..452896b1858f 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -118,6 +118,130 @@ struct qcom_ice {
 static DEFINE_XARRAY(ice_handles);
 static DEFINE_MUTEX(ice_mutex);
 
+static struct qcom_ice_tz_ops *ice_tz_ops;
+
+static bool qcom_ice_tz_ops_registered(void)
+{
+	/*
+	 * The barrier is intended to synchronize the data stores for the
+	 * ice_tz_ops data structure when client drivers (UFS/SDHC) are in
+	 * parallel checking for ICE service availability.
+	 */
+	return !!smp_load_acquire(&ice_tz_ops);
+}
+
+static bool qcom_ice_tz_is_available(void)
+{
+	return qcom_scm_is_available();
+}
+
+static int qcom_ice_tz_invalidate_key(u32 index)
+{
+	struct qcom_ice_tz_ops *ops;
+
+	ops = ice_tz_ops;
+	if (!ops)
+		return -ENODEV;
+
+	return ops->ice_invalidate_key(ops->dev, index);
+}
+
+static int qcom_ice_tz_set_key(u32 index, const u8 *key, u32 key_size,
+			       enum qcom_ice_cipher cipher,
+			       u32 data_unit_size)
+{
+	struct qcom_ice_tz_ops *ops;
+
+	ops = ice_tz_ops;
+	if (!ops)
+		return -ENODEV;
+
+	return ops->ice_set_key(ops->dev, index, key, key_size, cipher,
+				data_unit_size);
+}
+
+static bool qcom_ice_tz_has_wrapped_key_support(void)
+{
+	struct qcom_ice_tz_ops *ops;
+
+	ops = ice_tz_ops;
+	if (!ops)
+		return -ENODEV;
+
+	return ops->ice_has_wrapped_key_support(ops->dev);
+}
+
+static int qcom_ice_tz_derive_sw_secret(const u8 *eph_key,
+					size_t eph_key_size, u8 *sw_secret,
+					size_t sw_secret_size)
+{
+	struct qcom_ice_tz_ops *ops;
+
+	ops = ice_tz_ops;
+	if (!ops)
+		return -ENODEV;
+
+	return ops->ice_derive_sw_secret(ops->dev, eph_key, eph_key_size,
+					 sw_secret, sw_secret_size);
+}
+
+static int qcom_ice_tz_generate_key(u8 *lt_key, size_t lt_key_size)
+{
+	struct qcom_ice_tz_ops *ops;
+
+	ops = ice_tz_ops;
+	if (!ops)
+		return -ENODEV;
+
+	return ops->ice_generate_key(ops->dev, lt_key, lt_key_size);
+}
+
+static int qcom_ice_tz_prepare_key(const u8 *lt_key, size_t lt_key_size,
+				   u8 *eph_key, size_t eph_key_size)
+{
+	struct qcom_ice_tz_ops *ops;
+
+	ops = ice_tz_ops;
+	if (!ops)
+		return -ENODEV;
+
+	return ops->ice_prepare_key(ops->dev, lt_key, lt_key_size, eph_key,
+				    eph_key_size);
+}
+
+static int qcom_ice_tz_import_key(const u8 *raw_key, size_t raw_key_size,
+				  u8 *lt_key, size_t lt_key_size)
+{
+	struct qcom_ice_tz_ops *ops;
+
+	ops = ice_tz_ops;
+	if (!ops)
+		return -ENODEV;
+
+	return ops->ice_import_key(ops->dev, raw_key, raw_key_size, lt_key,
+				   lt_key_size);
+}
+
+int qcom_ice_tz_ops_register(struct qcom_ice_tz_ops *ops)
+{
+	if (!qcom_ice_tz_ops_registered())
+		/* Paired with smp_load_acquire() in qcom_ice_tz_ops_registered() */
+		smp_store_release(&ice_tz_ops, ops);
+	else
+		return -EBUSY;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_ice_tz_ops_register);
+
+void qcom_ice_tz_ops_unregister(struct qcom_ice_tz_ops *ops)
+{
+	if (READ_ONCE(ice_tz_ops) == ops)
+		/* Paired with smp_load_acquire() in qcom_ice_tz_ops_registered() */
+		smp_store_release(&ice_tz_ops, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_tz_ops_unregister);
+
 static bool qcom_ice_check_supported(struct qcom_ice *ice)
 {
 	u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
index 4bee553f0a59..89e62e151b85 100644
--- a/include/soc/qcom/ice.h
+++ b/include/soc/qcom/ice.h
@@ -10,6 +10,47 @@
 #include <linux/types.h>
 
 struct qcom_ice;
+struct device;
+
+enum qcom_ice_cipher {
+	QCOM_ICE_CIPHER_AES_128_XTS = 0,
+	QCOM_ICE_CIPHER_AES_128_CBC = 1,
+	QCOM_ICE_CIPHER_AES_256_XTS = 3,
+	QCOM_ICE_CIPHER_AES_256_CBC = 4,
+};
+
+/**
+ * struct qcom_ice_tz_ops - Qcom ICE TZ operations
+ * @drv_name:                    ICE TZ backend driver name.
+ * @dev:                         ICE TZ backend device.
+ * @ice_invalidate_key:          Invalidate keyslot callback.
+ * @ice_set_key:                 Program keyslot callback.
+ * @ice_has_wrapped_key_support: Wrapped-key support callback.
+ * @ice_derive_sw_secret:        Derive software secret callback.
+ * @ice_generate_key:            Generate wrapped key callback.
+ * @ice_prepare_key:             Prepare wrapped key callback.
+ * @ice_import_key:              Import wrapped key callback.
+ */
+struct qcom_ice_tz_ops {
+	const char *drv_name;
+	struct device *dev;
+	int (*ice_invalidate_key)(struct device *dev, u32 index);
+	int (*ice_set_key)(struct device *dev, u32 index, const u8 *key,
+			   u32 key_size, enum qcom_ice_cipher cipher,
+			   u32 data_unit_size);
+	bool (*ice_has_wrapped_key_support)(struct device *dev);
+	int (*ice_derive_sw_secret)(struct device *dev, const u8 *eph_key,
+				    size_t eph_key_size, u8 *sw_secret,
+				    size_t sw_secret_size);
+	int (*ice_generate_key)(struct device *dev, u8 *lt_key,
+				size_t lt_key_size);
+	int (*ice_prepare_key)(struct device *dev, const u8 *lt_key,
+			       size_t lt_key_size, u8 *eph_key,
+			       size_t eph_key_size);
+	int (*ice_import_key)(struct device *dev, const u8 *raw_key,
+			      size_t raw_key_size, u8 *lt_key,
+			      size_t lt_key_size);
+};
 
 int qcom_ice_enable(struct qcom_ice *ice);
 int qcom_ice_resume(struct qcom_ice *ice);
@@ -31,4 +72,19 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 			u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
 struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
 
+#ifdef CONFIG_QCOM_INLINE_CRYPTO_ENGINE
+int qcom_ice_tz_ops_register(struct qcom_ice_tz_ops *ops);
+void qcom_ice_tz_ops_unregister(struct qcom_ice_tz_ops *ops);
+#else
+static inline int qcom_ice_tz_ops_register(struct qcom_ice_tz_ops *__unused)
+{
+	return 0;
+}
+
+static inline
+void qcom_ice_tz_ops_unregister(struct qcom_ice_tz_ops *__unused)
+{
+}
+#endif /* CONFIG_QCOM_INLINE_CRYPTO_ENGINE */
+
 #endif /* __QCOM_ICE_H__ */

-- 
2.34.1

