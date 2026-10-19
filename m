Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEF25A6819
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421201; cv=none; b=IeXEX1UjxDiCvFLu4PNrN6y7+ZxvEkAcEtzAPYEY6rCDGZtQLunz65JrZaLe/03iMjvmLg+to3OtWwzjPHL9FZ0zPlgGeiNNXgz89mQuvFcfjgRcqzu6/Y5dBT/Fxi4bAZ8o145ekT11S5+zYxdJPRClozNKYpt+7KpVGMFk6iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421201; c=relaxed/simple;
	bh=U5DsfYf7sqacran+tCtHIouVxuUoq1D9dzdVHWqqSzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hnL+ayWHFr7k5r7b6ucYMtRdkGf3CnkjpuiFsjP6YROQ3CJXCFTriw7LflgcKNGORwrvqEnNIWEBgUwq/duoxFu3OMSkLWqOtqFkWesu4oEt2g37p5VhW/mJYp9XtdBRT7nfYsDE291CDjOp1UGDJ4GGtd2T8VwSuhfNjwI9JwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3/nDk9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCfV1rmr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3/nDk9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCfV1rmr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0IK52971616
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mNqW/OdrhkVgohP+EotV1nY1Qp7qskLwaN7gKePu5lo=; b=D3/nDk9drFO8V2Ub
	ekcw8fKLnZKLc8uIiIbCPbtbTAWyh/lp9MX/Ado9Fls7asV7kBJokAUMMlYgrjR6
	x+t/97QpG9vjQVEK74n9bjz8PGxsMHMqIY42uAwbWFOCK9750cizhxUYPCFztpHT
	sgE5ELjCW3Py1mWWtY/qL51lgth5MdYL7aU2JjVZosc9bLoi19Zbvk2+BiAepQOn
	tqwjKWZdVWiGgUafOF6mUE1B9hlIcoR2rYnFbKHwOTg8Vhsx8ZBF5ZRP3pDzLJdH
	xugFwFJa5qXITTpiyTW5VIlKFLaESM/VskbWxQ3HvUTt7ALtG4cRCQm+zIGx8luU
	0AObNQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x9rga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:46:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf634a101fso2057868137.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421196; x=1793025996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNqW/OdrhkVgohP+EotV1nY1Qp7qskLwaN7gKePu5lo=;
        b=OCfV1rmrRrscP/sB9jO6BKDAwK90rA1MKAhc3p5UY5FxwCqmykPWbsuJfMY4Yjdo0q
         0M7pMxZ87ZRD61OCZvzROCpgWPdA2UV63hZSdjAyGTv4qFdkrmEwWBKwd0yOfxIxFEl/
         5ISQxSvB0l4/fCLcCUx7wiGLiXZxKliTgNjvnHJ1GUZGeItXf2R6MVnaJif4fb0w+rt9
         AbSGtdC/PlfWtrfmjOD4j1PmZOdHJhtc/jj6XpL1CI2mJpVpjvK8NLVE1QXCsih+bYWJ
         KnctPeYpA7zmulvFnGdBeFjqM6fKvU1Ea5WYzrcZ5eYdLF82fx8EZdeyLPGXhHg/mgcr
         alMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421196; x=1793025996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mNqW/OdrhkVgohP+EotV1nY1Qp7qskLwaN7gKePu5lo=;
        b=jz7nVfdLkGCgYGoU7AeuoWeq7YPE7301EoTd+zjDD5A4TEGGdil+ex3Cb0D1+wdzgD
         f9C7Bp0mac8U0jBUI/ms0eEmtXu4dzSJ5E5ibvsZbDDOiJaVfzKr5pXj28urGQs3p2Zk
         D2jjpHan3o6ZAvdrrvW+KT3AWF/pSgi1UI9CVZrRy/TVG+1dEhtPtT45sEv9gdMVssR5
         SBJ/FowlKYgqcOO9BD30UaqjIUOiZyVyQe+yPgucmMpIWjfpfX49679PspqiZbTZlhub
         h6ulInh71kudfL21I+PmsM3+0jNisDY8iEIqMbucfDBQ7vt0oBC2qLp1lP5G3FZxvVTD
         yRdg==
X-Forwarded-Encrypted: i=1; AKwUvBztCjqtVJpn9UHckpGqajDERMBzwrNaijwWwc7/rIXIUk01SI+Ja+zZt5IeDI3pVzK0R8WSZYDnn1witg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0O7u33ujgUiBFJW7U8fSjdvd3Rc8pTshmKkOuQIHRR8NI08ol
	7RfoQfBHuSDFD1je+Fl3zMI7QrvmTa8JgInQZNEvGzidH+M9GhGWhY4WnDf1mkgzNZxo+VDGrSe
	F8c6oQPPUNmrXbxmE3k/DiV5NymsCL45kXYm4Te8RfqS8F8L7jd1g6XlsO9RRg/TV/n0=
X-Gm-Gg: AYBFou2lkxMN9NX7YUs1lCrJ60N55OfeO9ToCSS+rhEhzwYKU8cs3WDThEw/D2Pil3t
	axL+79ikbeLPkdDZ/HxpfuUxvXyRpFWL/iOJV/jT/ie9EF7io2XO/WHy9a0MUEy8iU/KTMlu4Ot
	Q05CopffoT1JOoRE3LcbSm2ZYuehOJH5DUyAqlTq2fBNHZmbMy9IiHj18kqsw6tqQX3ZP33faDs
	ucKLeAGvt4TEPyxzURjcXXVUrGaGFCW9itpR2pL/ZXka8Su+DrIGgvlQHlyuCpr1kTebKXZeODr
	EYWhzQ9iiimQq9Z91C502Te9508QfVRjyiG0cCezB9JIfavHy3z/2FspyMjRW3uxVXFZ4n9FJli
	7nijZP/0fhvH/z22d89KEqsSb944v
X-Received: by 2002:a05:6102:f9b:b0:7cc:22f0:830a with SMTP id ada2fe7eead31-7cc369050a7mr2611654137.8.1792421196392;
        Mon, 19 Oct 2026 07:46:36 -0700 (PDT)
X-Received: by 2002:a05:6102:f9b:b0:7cc:22f0:830a with SMTP id ada2fe7eead31-7cc369050a7mr2611634137.8.1792421195868;
        Mon, 19 Oct 2026 07:46:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e7657d4dsm98504635e9.2.2026.10.19.07.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:46:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:46:07 +0200
Subject: [PATCH v12 3/4] crypto: qce - Use fallback for fragmented skcipher
 payloads
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-qce-fixes-skcipher-v12-3-046e6be9bd83@oss.qualcomm.com>
References: <20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com>
In-Reply-To: <20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3507;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=U5DsfYf7sqacran+tCtHIouVxuUoq1D9dzdVHWqqSzY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq1i1C+Ctu1Q1az9umj2q9CNbZHy6f58znek/dR
 vs/1hl5eZWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatYtQgAKCRAFnS7L/zaE
 w2U2D/45jfsdCHHyvv+xzQogWs5/obGHAP0eRXA/Hj5z+pyC6r/Rk4DIao3QfhNkyS1STT23j8c
 TFD6XgrWneQpmoTnmL+gkNMvCZ01zNN9NogFv2Bno1UYwa6HiHJTAGe+Cyz/6eACC4uYjwv1pSA
 M96J/1qJM5S56RVl5yCsaH09IgQuASu0qK7PMIoJbXzEv0NS/zAjxXzFlxpQYcZUS1iDvb/udUj
 W8i4UtR5XaI+CruB6OCM5P+Flq9l7vhZXZdSk5j5COj0okK7p8Hl7QieT5rlVMaufCBEfd3Ho1Z
 GmRZgCAduN/4eJ1Vft5Sl2GegE7GThVZQ8SrP9cNJ0kkedICoglUiZHSSpxTddY1KHSqJaTx1PH
 E8S6Y6ZngKk901GvPqSTPDj9oFo5WqsPerP9wZNtG+cvngG7k1Ib62SMCYy51jte/z7nEMTAFRT
 hkk8jsjgT3Fco/VRoZ3DRFALX4K/q4ST2fC4oYiYOM46HDinYwvJ6/pnt66WV9NT0Mgq8ZgqIE+
 5U3k4377gAScEnBHebwMkVl/H8eBKkFjkB7PH8tWk+p7bIaBqK9GgxvCpyrerGggMINJ7vRuV8y
 S34AEg0y+9uyP4GWesug48CTB+S40Nhxl29AtH/rDBumHNR52IQMigHibLjjmr4GUXDyBHpm7OA
 LWbpotcQ1ZjmQGQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: mynytL2r9K4lz9bBUzrcM81OTGJWTbFg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX+oaToqYv+USw
 AXf1rlHb8lXpmlY4hnLt9t0PWnMqBso5Vn4TRvYMZcAOa3gpvkk8oK0fndciReRR+I2yBdtXifD
 kDzP5vMZM14rWZ945a3EweMoNJCP5ts=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad62d4d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0H9NDlJ9gza-_DYZ0SQA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: mynytL2r9K4lz9bBUzrcM81OTGJWTbFg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX4AvTDcnqfovX
 pLGSqUOtNiEkeH2XwAq+q7wy0wrFzMCnZLAs3BmQdfmAyuARhofLU5DsoZk10+XaDair/9qgHAG
 AEPq8mo5o3mTraOnpqPvNMajddmSTXSt//XMoZRCIefgejMHxmAUrcDRUcilyS8/jFM/uGqI+Il
 VnykZDAlv6dNQjDN4aepuvFsjnEwIeoMaM6i0mD5stIGy7J0nUFLUoLbLnqV45jM3i6DK6PR0iP
 6Yezq728TFC0ndSEhuf4H06/nvgVDqBjK6go96by1BJ24x6/jsgWe3sjS7fpJHt5MzP9Z4EsmnW
 8srrS1X25BETUsYnlZFDIHBU0uSBx8vbOzY5AdFSP02zWXfIJ4gTPx7Scjlz4GXXgzmbJcbL7Lf
 q5ISdblLiuu97wFBUmKQRQ6LzPqFx7lmn95RQmJ9KYHBrM0ZS2UzDd6krPX8ci6r5Wp/LrBFn5a
 WrFSpgwy4Rd3eJpX0Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190058

The crypto engine reliably processes AES requests only when the payload
is a single contiguous buffer. A payload split across multiple
scatterlist entries makes the engine stall waiting for input, failing
the request with a hardware operation error. This was uncovered by the
crypto self-tests, which feed the algorithms randomly fragmented
buffers.

Detect a payload that spans more than one scatterlist entry, in either
the source or the destination, and route the request to the software
fallback.

Cc: stable@vger.kernel.org
Fixes: 25b71d61d631 ("crypto: qce - Improve the conditions for requesting AES fallback cipher")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/cipher.h   |  1 +
 drivers/crypto/qce/skcipher.c | 13 +++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/cipher.h b/drivers/crypto/qce/cipher.h
index 850f257d00f3aca0397adc1f703aea690c754d60..daea07551118d444d2f749588bdfe2ae2c6c553f 100644
--- a/drivers/crypto/qce/cipher.h
+++ b/drivers/crypto/qce/cipher.h
@@ -14,6 +14,7 @@
 struct qce_cipher_ctx {
 	u8 enc_key[QCE_MAX_KEY_SIZE];
 	unsigned int enc_keylen;
+	bool use_fallback;
 	struct crypto_skcipher *fallback;
 };
 
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 8d4cd1d08c0e9d78f044057ecb45e5aa8b9a40a3..6a8d642c40a36974231bc4aa2717a5378f17134c 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -215,7 +215,7 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	struct qce_cipher_reqctx *rctx = skcipher_request_ctx(req);
 	struct qce_alg_template *tmpl = to_cipher_tmpl(tfm);
 	unsigned int blocksize = crypto_skcipher_blocksize(tfm);
-	int keylen;
+	int keylen, src_nents, dst_nents;
 
 	rctx->flags = tmpl->alg_flags;
 	rctx->flags |= encrypt ? QCE_ENCRYPT : QCE_DECRYPT;
@@ -241,6 +241,11 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 		if (!IS_ALIGNED(req->cryptlen, blocksize))
 			return -EINVAL;
 
+	src_nents = sg_nents_for_len(req->src, req->cryptlen);
+	dst_nents = sg_nents_for_len(req->dst, req->cryptlen);
+	if (src_nents < 0 || dst_nents < 0)
+		return -EINVAL;
+
 	/*
 	 * Conditions for requesting a fallback cipher
 	 * AES-192 (not supported by crypto engine (CE))
@@ -250,13 +255,17 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * needed in all versions of CE)
 	 * AES-CTR with a partial final block (the CE stalls waiting for a full
 	 * block of input).
+	 * A payload fragmented across more than one scatterlist entry (the CE
+	 * stalls waiting for input in that case too).
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
 	    (IS_CTR(rctx->flags) && !IS_ALIGNED(req->cryptlen, AES_BLOCK_SIZE)) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
-	    req->cryptlen % QCE_SECTOR_SIZE))))) {
+	    req->cryptlen % QCE_SECTOR_SIZE))) ||
+	    (IS_XTS(rctx->flags) && ctx->use_fallback) ||
+	    src_nents > 1 || dst_nents > 1)) {
 		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
 		skcipher_request_set_callback(&rctx->fallback_req,
 					      req->base.flags,

-- 
2.47.3

