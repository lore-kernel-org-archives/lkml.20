Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406668;
	b=HMY0BRCI+sjsD8kxGKWcAaO2ovdVJre51jZgJATcd1HG4TQJddM1crbSRppuuS2Z1+lD
	 rSEvsHclT8bF0U7gJCgy4XKfP6gTIMCenpy/1J93q597TcLefj4TnOVNeNiGs9jrkl1uo
	 ScItOoE8csLiYaN3SJ5lbrRtYEjD9ah/+nsT0mYO0z00RCI/u8npdzkjihEhpdnskeLF1
	 TYM5XuEHcW+K4l8q2jcYLy2ajIyPacb5nydnITh1dOSwdHjTIT8zOPBkZYSwJE3QT5FEw
	 BNdju0YxqV0xltRfHPgpq705A0DGNWnFi1Va9gbjH7OA/Ew6wEKq7VYU9WCeN9hP5Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406668;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HhRoZyukr7bYFeRhMV71r6ms8s0PMJeU4sBttnMmwac=;
	b=oTNriH/SP/D5OBR0XAmua53Q1XgeCe/qi8PmiyszWBoy3nibq5/W8wOGajF1IVhwAkZp
	 IdcNmxLZjvnU/iByCcM9eYhU27+vXfOF3uBqoEL6Gl0aDRNYVqnSXX3Moand6Grc5mZo0
	 9jfg5GOCBl5mPCeKg2xZfEnZF6r1t6Sn5KZ3X+YiaTn2TFBz2JMC8eNeXGT+V6+G92f10
	 r9Qkpfgp8MssZQLE9r+m8RQndtpRZSNiFZLY01aKm1jeNEe9z4XxJBnZQOQJlihMmIW/Z
	 7/BVQZJuAvwAiP5E38WrGW1L+CU++Ea7Sc+xdYxzI871uyuk+I5YFlcpoMz876dLdew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ddexLkBy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g9tSoF5C;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B17D606A8B3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B17D606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ddexLkBy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g9tSoF5C
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEHPlT2556135
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HhRoZyukr7bYFeRhMV71r6ms8s0PMJeU4sBttnMmwac=; b=ddexLkByWfAtSnzT
	zBGdqas71W4aJJ8+f3UGgLZltK13cHbXI9XtJ8/YevWV1ySParxm1AO8Qy+eGRCk
	RKUiG5q2t3c3iWMPY+x/GZZLfF5hqE8mQUaazM9BmqtvRX8NYPqauBCj2VRHFeWc
	AlQdA4NlpurQMa9Yydgh9uEZvG4gdnTu4HSU8inRk+dp8FFbRMRB683KtH76Wcim
	PsQIj+6F9t4+xqkVL/vFlIib/xgi9INtpFyek8bswN4hJyWD5V/Nf9wwDbnR4pJa
	3wDwdlNSyAX5T+Z05fpYKSIM/JeTeViNvvY58JSuJZ9J4ZuZm76hsam3vQxoLo1V
	KrN/cQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmb0fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:17:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so6103030eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406665; x=1795011465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhRoZyukr7bYFeRhMV71r6ms8s0PMJeU4sBttnMmwac=;
        b=g9tSoF5CezKTnat9PAxczXODP1X9a5SrJWKiuRDe0z8+OYNHOjnBvBRgfuHlX9a1cm
         qRxgXApEc2DCFaWiljRwGKdb0drHoshjxvPkxZeiVqCCyWFDi74UDuIsgl5l/I/JKCuF
         fBtIfQ48mioLfWA8tD8g648rlnD36SAeddlYaNKbYOuxxpChOlVNh4tL5IjHTh1pUw41
         PC1VvPoVLxSpbVoFTtRuIcbDXokrLnzs9Z2htCaPNjXse1wpkYgb4a2eadyVvFWChx05
         IbI2GSgJmaJLGw1R4Gwlmc1hsJ9a4vDne44DrYmZ8CsNyYsJyZFyxoDO4mqSjLkRskwu
         7Hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406665; x=1795011465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HhRoZyukr7bYFeRhMV71r6ms8s0PMJeU4sBttnMmwac=;
        b=r37vsYfQGgj/OXunTY3otfQGEABPPLBXDeUOCmhfACaYF9nYEbeuyrtDkMuNpndZro
         mJxkXAj+DDAQmNbXWM6o6QvyIz0ITMPjavPvpWe0ALUsBT3NfgoCKA59d4iUoA8oQjSF
         gToTf6DcUdN2jbh41CPMoCL6NAIFBUc5fz9rR8xWOrKvIqhbpmO3VyzVmPweEZqILQIj
         32lgVXzcdrzeid6bGsGtFIfm98UQzq3j1quPeSbcgUBpsXyIaVNzPzuxmqn01kyI15kM
         MZ3qlF+CGoZKvN3FQYL0Xc/8wWGZTYIkGj6HQ4rLKrthZSZTRDGkV458v+DWEBYNmge7
         ZEag==
X-Forwarded-Encrypted: i=1; AL+hErG0PfGf13ZP52fTUgZuqWRJEJiLCjCRWNyg60Tv69aN+dd1Xakt8cRXBGbnsjiAj+crE+TeoQMiT7kW5xA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Mam+y7jjEdocpeprYpnQvoqUTLzg0S++MZuWkUAyIJaYAWpUG
	GIZXnBrpIL91VHYll8iEYfL7DaAWvX213F1FraEWFtT1a/syV2mTvhE28JBaNkkm5UNeag05zec
	iKkxcqB5Pqrgm/fSjKKixfEj+TCSz3hWXBY4syJd7Uuhx2v/iTz/o3PmKjPrk1QX9I3kXerjURc
	0=
X-Gm-Gg: AYBFou2DewOWKWAlW0JBZ/z3khSzPrpGeET55D0TerFvfebTo/rlKDj2fYQBHny0n/R
	aFKwvYWoP2RHMKamysbg4keATkPwoKba9xjtto4e8zszRESR7/s1yylp8DeHkMSczk8LvvvbeyT
	uCX2jOiUQfxaqZDFZX80D/nNH+iyNYynVfYtthfGgEhU25H7seLErT3magNlKTMgCfR86GOZOLc
	7KgYOvUl+2K2k8BieMwSxmsH6XoEGj3F9V7nQQjug26h/NluMo0I2V393Bl6mIVh+P2FCeJpa5S
	gfyEgH/fJ4XtiTrBjwQL9vEpnE60tn6vHtTF8cQPYe+D8eudbg351xZSYRT9ooJvsU6uaxz1m5U
	Q6Rrtc31NIRID3emmcN2P1iVX43ox5aMl+gl1SmgnHN//zUolVbd2L/5BYkcrUb6WhPxdchoqAA
	==
X-Received: by 2002:a05:7023:a4b:10b0:1b2:60ab:1e9d with SMTP id a92af1059eb24-1b3c034aabamr2518775c88.37.1794406665314;
        Wed, 11 Nov 2026 06:17:45 -0800 (PST)
X-Received: by 2002:a05:7023:a4b:10b0:1b2:60ab:1e9d with SMTP id a92af1059eb24-1b3c034aabamr2518752c88.37.1794406664670;
        Wed, 11 Nov 2026 06:17:44 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm33747063c88.10.2026.11.11.06.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:17:44 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 19:47:05 +0530
Subject: [PATCH v2 5/6] soc: qcom: ice: Migrate to the TZ agnostic ICE APIs
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
Message-Id: <20261111-ice-migrate-tee-svc-v2-5-29d19f6c92ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794406634; l=5172;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=qCnIYHdcdZa9tT9loLAe1P+MQ3/ypMPb3+Zoukl5PY4=;
 b=F4GkVG10NXqzfMwaQcRMHQozGvxXbfvPeyfh4EledV/a0ni62K0y/XVsCIdWdlufsgponbfwi
 5QwbkJo1iFQARevmUYe+JxXAHyWDWfQ59sFArCM3NCGP1J32w/wC10F
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: gz1XEdD8gCj8Hv9Qf3U-_8FOABE-1mH2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX7x8D8EugLyq3
 G/BwmXpR32Z3HZN4u/i8QY4MXVtG6WzPmXpjRAJJhkV1/kOo/KsynHjFZxJA0XCweqFdlDuG0P6
 QBNUmmFjXZAlR/9GtOMLuynnuGogels=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX0F0qbQ5eiXYy
 f9GMF+w09/GPwivJEkQ4ilR+NTwKDH3SgWFu4OMtfTJiN8BCz3/JReU6yzMMeAFk4IjTGzZnqJr
 8Dqj+L7pck65YAzfGTEMcFiH2f0rHz6+Ls8Hjv0U6cH3eGW7DeML+WXN1Fi+7sYRrIIQAy8BvOa
 /zZFCWPDiwiXr5+r5OQXQXoFyfzOmnLwrQsvBgBllKjDnNOWnsq1049nf340SSwGcP6394jhmR3
 PYfImRRqDlPPStZDL/7AxAy16TnvSRCKx9kF0HfY1UZzwt8G6UMYIpw43IISPqYpq00yXwE/kXv
 L/oOYVlxsuoFrENpy3E7DFnG65fXeUImM8c/CdH79SB723/C4kEK/UDqsUIfjs2hzM/v9UDRC6e
 BKiLtrnKmjqyNbwZePXpRL09/tKsQF9TTBFWXX9MnqBXxH14IrZMJIclOIXmLyBsvxhrmHOc//R
 9Z7285pkdUXYCVZyMVQ==
X-Proofpoint-GUID: gz1XEdD8gCj8Hv9Qf3U-_8FOABE-1mH2
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af4790a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zftoU6j5KQ9PehORJHMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

Migrate the Inline Crypto Engine (ICE) driver to the TZ agnostic ICE APIs
which re-directs calls from the driver to either the SCM or the TEE bus
based back-end driver at runtime.

This makes the ICE driver agnostic of the TEE firmware (QTEE or OPTEE)
running on the Qualcomm platform.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 4844621b7497..9bab177f7ce5 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -307,7 +307,7 @@ static bool qcom_ice_check_supported(struct qcom_ice *ice)
 	 * advertise support for raw keys or wrapped keys, HWKM cannot be used
 	 * unconditionally.  A module parameter is used to opt into using it.
 	 */
-	if (ice->hwkm_version && qcom_scm_has_wrapped_key_support()) {
+	if (ice->hwkm_version && qcom_ice_tz_has_wrapped_key_support()) {
 		if (qcom_ice_use_wrapped_keys) {
 			dev_info(dev, "Using HWKM. Supporting wrapped keys only.\n");
 			ice->use_hwkm = true;
@@ -483,7 +483,7 @@ static int qcom_ice_program_wrapped_key(struct qcom_ice *ice, unsigned int slot,
 	struct device *dev = ice->dev;
 	union crypto_cfg cfg = {
 		.dusize = bkey->crypto_cfg.data_unit_size / 512,
-		.capidx = QCOM_SCM_ICE_CIPHER_AES_256_XTS,
+		.capidx = QCOM_ICE_CIPHER_AES_256_XTS,
 		.cfge = QCOM_ICE_HWKM_CFG_ENABLE_VAL,
 	};
 	int err;
@@ -501,11 +501,11 @@ static int qcom_ice_program_wrapped_key(struct qcom_ice *ice, unsigned int slot,
 	qcom_ice_writel(ice, 0x0, QCOM_ICE_REG_CRYPTOCFG(slot));
 
 	/* Call into TrustZone to program the wrapped key using HWKM. */
-	err = qcom_scm_ice_set_key(translate_hwkm_slot(ice, slot), bkey->bytes,
-				   bkey->size, cfg.capidx, cfg.dusize);
+	err = qcom_ice_tz_set_key(translate_hwkm_slot(ice, slot), bkey->bytes,
+				  bkey->size, cfg.capidx, cfg.dusize);
 	if (err) {
 		dev_err_ratelimited(dev,
-				    "qcom_scm_ice_set_key failed; err=%d, slot=%u\n",
+				    "qcom_ice_tz_set_key failed; err=%d, slot=%u\n",
 				    err, slot);
 		return err;
 	}
@@ -553,9 +553,9 @@ int qcom_ice_program_key(struct qcom_ice *ice, unsigned int slot,
 	for (i = 0; i < ARRAY_SIZE(key.words); i++)
 		__cpu_to_be32s(&key.words[i]);
 
-	err = qcom_scm_ice_set_key(slot, key.bytes, AES_256_XTS_KEY_SIZE,
-				   QCOM_SCM_ICE_CIPHER_AES_256_XTS,
-				   blk_key->crypto_cfg.data_unit_size / 512);
+	err = qcom_ice_tz_set_key(slot, key.bytes, AES_256_XTS_KEY_SIZE,
+				  QCOM_ICE_CIPHER_AES_256_XTS,
+				  blk_key->crypto_cfg.data_unit_size / 512);
 
 	memzero_explicit(&key, sizeof(key));
 
@@ -567,7 +567,7 @@ int qcom_ice_evict_key(struct qcom_ice *ice, int slot)
 {
 	if (ice->hwkm_init_complete)
 		slot = translate_hwkm_slot(ice, slot);
-	return qcom_scm_ice_invalidate_key(slot);
+	return qcom_ice_tz_invalidate_key(slot);
 }
 EXPORT_SYMBOL_GPL(qcom_ice_evict_key);
 
@@ -604,9 +604,9 @@ int qcom_ice_derive_sw_secret(struct qcom_ice *ice,
 			      const u8 *eph_key, size_t eph_key_size,
 			      u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
 {
-	int err = qcom_scm_derive_sw_secret(eph_key, eph_key_size,
-					    sw_secret,
-					    BLK_CRYPTO_SW_SECRET_SIZE);
+	int err = qcom_ice_tz_derive_sw_secret(eph_key, eph_key_size,
+					       sw_secret,
+					       BLK_CRYPTO_SW_SECRET_SIZE);
 	if (err == -EIO || err == -EINVAL)
 		err = -EBADMSG; /* probably invalid key */
 	return err;
@@ -627,8 +627,8 @@ int qcom_ice_generate_key(struct qcom_ice *ice,
 {
 	int err;
 
-	err = qcom_scm_generate_ice_key(lt_key,
-					QCOM_ICE_HWKM_WRAPPED_KEY_SIZE(ice->hwkm_version));
+	err = qcom_ice_tz_generate_key(lt_key,
+				       QCOM_ICE_HWKM_WRAPPED_KEY_SIZE(ice->hwkm_version));
 	if (err)
 		return err;
 
@@ -654,8 +654,8 @@ int qcom_ice_prepare_key(struct qcom_ice *ice,
 {
 	int err;
 
-	err = qcom_scm_prepare_ice_key(lt_key, lt_key_size,
-				       eph_key, QCOM_ICE_HWKM_WRAPPED_KEY_SIZE(ice->hwkm_version));
+	err = qcom_ice_tz_prepare_key(lt_key, lt_key_size,
+				      eph_key, QCOM_ICE_HWKM_WRAPPED_KEY_SIZE(ice->hwkm_version));
 	if (err == -EIO || err == -EINVAL)
 		err = -EBADMSG; /* probably invalid key */
 	if (err)
@@ -682,8 +682,8 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 {
 	int err;
 
-	err = qcom_scm_import_ice_key(raw_key, raw_key_size,
-				      lt_key, QCOM_ICE_HWKM_WRAPPED_KEY_SIZE(ice->hwkm_version));
+	err = qcom_ice_tz_import_key(raw_key, raw_key_size,
+				     lt_key, QCOM_ICE_HWKM_WRAPPED_KEY_SIZE(ice->hwkm_version));
 	if (err)
 		return err;
 
@@ -696,11 +696,11 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 {
 	struct qcom_ice *engine;
 
-	if (!qcom_scm_is_available())
+	if (!qcom_ice_tz_is_available())
 		return ERR_PTR(-EPROBE_DEFER);
 
-	if (!qcom_scm_ice_available()) {
-		dev_warn(dev, "ICE SCM interface not found\n");
+	if (!qcom_ice_tz_ops_registered()) {
+		dev_warn(dev, "ICE firmware service interface not found\n");
 		return ERR_PTR(-EOPNOTSUPP);
 	}
 

-- 
2.34.1

