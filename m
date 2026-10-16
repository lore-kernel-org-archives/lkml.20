Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D2B4D0CE0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159927; cv=none; b=LdwDctZaC7NLGRPrvJII9poMU+jf0GkeTEBQVxmHjZHaMAVhQ7ms2edLkvgqp4O/7CZNkuEh6PXdvWrzvQ/b2McBlWl/xVbCvG2KsalAvlJYVQZmog3jg9TrqNASoRuJfcSCyjs3KkPAk3cMQvOvRiejq0tL8nA7hKz6g4LuN40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159927; c=relaxed/simple;
	bh=PLKMvG5hyotQDMRVcZZ8iNkIZWwNLAYfcjvBo0H08q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mtk1KMerCY8Mz+LGdXfyIX65kO9i9vrIkQsu9aMFUucmomSLegt9KoTnYaQ+jYHB8AwjguVdL+UdA3UogqohF6YJH1mdt1eqIKHmP2cOXQ2LCIvS2ZQ/R+hgfTL/ui3WObM1SuRzOo/66iyQcxARkqm28os7LPMmxn+fsKgIQA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PAsqdvf2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jXrlApRt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PAsqdvf2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jXrlApRt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5wRr2154006
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cgh66chNi6rdMtMPBnHowPkYFSFoeuEVr7iErvjPiLo=; b=PAsqdvf2LgaNy4uV
	d1KgRfGSWxM87rPVtEM8va0f2J1zmL88i2AKebB9TZtt+B04w2/3bYUgdVq9pYWz
	lUxhDgDJgwCj4LZyqI+ahH3khbQhgyjvBuZzfYww1CT+CakFQYp6lzVq5iLdFCSz
	Oz32Qbp/wNmPI/GLxeijaFn2PFnpz5qMq8NuCY2RMR7zwTnihlos6aChepbYt/xN
	5rF41ZfuQStxt5wsZ3K0GbCDEtNxL0VCgK3CipvmkFUYvclepjnfw/+BT1Om/9vJ
	zXAbVmHom3n7WzWXwCFTCyIGkyy9MX4nlgWq2DoVKgziTUSP7CalAFcdyza4gLcd
	CUiUXQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhumrucb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:02 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5e6f7b15640so5533695e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792159922; x=1792764722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cgh66chNi6rdMtMPBnHowPkYFSFoeuEVr7iErvjPiLo=;
        b=jXrlApRtc1SHl5Kqy9REC5ZO13PlqJUqt9Miar77wsiG4skxYzuAOXYuNElWqBIRVC
         izVX5crmUQV697gDAZ2/DYHxX7+jCrPF+8soTXvV6vNsIArlTbUOlbVU50xVhdl3u5di
         pQ8xp6HSQzNWCKiB77gfCI805vBmI3Bu8T0lZJbF34qj4OYUnFcYZ95YmTgGR8WQgPix
         QzP7P+b4raYth339n0MYQ799l5hfL9so5M/xD2JnIG/SeZzBcTvEyCi5U032msdeykKc
         PyOGK2GZddmu4iHFyApA4w5OL4KGnIHJiN+XWcPJg42XfPqS6dHFEk/WqMIFlJ6/vrHe
         Qa8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159922; x=1792764722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cgh66chNi6rdMtMPBnHowPkYFSFoeuEVr7iErvjPiLo=;
        b=QDEbdEYVaCg+w2V98fbpnETsRRsW6425jjx8AXLlbuWIJKA3d76TS/VK9eJWkm+Fx5
         ED3iUd2JxVkI9oHzsp+Fq7Ga1Uj/LFuifaNj/TSdKTVO7vtxJi7k92KXKS7gDw+O6PAT
         RyFBbRp92djB29yHv/YtkzxEPrXLXUalXMZQAXmbG/dIkz7LFn4C7tbqrBbfo65sRLWU
         w6LrJdGYLUAUlMbRmBxI9PLcXg8YWsVU6WVSHec1vMlymKDXvHP6qFaGrpzWy7m6SQ7m
         fNLx128Ygilmdcpb+OHXlMY4jnPPN2xSJET6b5CvD/d3Dax4vFKEyFksRaW5JyQ9h/yW
         k/HA==
X-Forwarded-Encrypted: i=1; AKwUvBxvfIVTMP67Y6v1klIoVDDA0kDiOWX4xnmrf+WnzQj4cXbEqDwlkK0rd2JYOrCuNS3ZPZHnaaWpNv94ey0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBlIxofhVXGNb8tVcQkzSDleUdyO8ZM+hmq8NDQLEEg0OMN8Go
	pKW4a2eonKDSS9XZ8bSkBHIUDZANUitZnXD9fEWeToy8WKHpcpw9o21qqgU+H2g9XjBsJlAiW8H
	iAKIisDzOMpVXefCOCFiRkacpjsNPoMAdxDxPM1vASgMb0Hp6ZTxKGWm8pG5uXeP+CvM=
X-Gm-Gg: AYBFou3WPojRU3nO0Af4U6wO0YibRqeSpVaMHHrp+5UOssgpOwOWmnAizR3dtCoAQFH
	0KON/FN9e30gB8yNfHxljJd4LUObIb9sWvSsToLhGsylYXxKj5wrl8CMM41PqmtdupfjoJbNuNB
	Pu52X/D4DWgw5nCpaGWSdazqYakWzUP3AbhVHUSs5mcvbTHySSX7qvAV8o7PMkSho+wbNjF/j8K
	nq3be51+P/2xgMGEXUEFO8T4P4mLFfQbPJP9CfyWMcO2yZhyOSASJYOtrXMUxp7LeZjwJpBg0Jg
	8ftF2002yO8VoRslXf5QnlErRYBFyu0hncK3s4WHPrg2SNsuwsZEaXW5Qs7/KIr8LwZt8NePsmW
	r4yT4AWmMWr+mdugfS/iegCs6PtyT
X-Received: by 2002:a05:6122:1782:b0:5e9:3144:427a with SMTP id 71dfb90a1353d-5eaaa918625mr50082e0c.19.1792159921519;
        Fri, 16 Oct 2026 07:12:01 -0700 (PDT)
X-Received: by 2002:a05:6122:1782:b0:5e9:3144:427a with SMTP id 71dfb90a1353d-5eaaa918625mr50041e0c.19.1792159921032;
        Fri, 16 Oct 2026 07:12:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8babsm5760145f8f.33.2026.10.16.07.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:12:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:11:48 +0200
Subject: [PATCH v11 3/4] crypto: qce - Use fallback for fragmented skcipher
 payloads
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-qce-fixes-skcipher-v11-3-d13ddfe609a4@oss.qualcomm.com>
References: <20261016-qce-fixes-skcipher-v11-0-d13ddfe609a4@oss.qualcomm.com>
In-Reply-To: <20261016-qce-fixes-skcipher-v11-0-d13ddfe609a4@oss.qualcomm.com>
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
 bh=PLKMvG5hyotQDMRVcZZ8iNkIZWwNLAYfcjvBo0H08q8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq0jCo3pAMan40/z9UMiqByq0ZVspFfxrqhiBE1
 n/mTvdMtZuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatIwqAAKCRAFnS7L/zaE
 w8iUD/49hMcTKhTSHUaF1cuIalNVjPDNk0o7rQm3koAyMyEAXNQE6iBus42vBQjq9nxxQgxLULy
 picWDeQu/tDBGhX9b3w+GwAUO8fAv4OyWi0kUNx0Tj9NOb1ExLtsyeHRP+4cBTwBiHdyVoJ4/l2
 MkT/qzXNBbOwn95d3SGz+3jqCnMEhXqGvaEeHx/khBlcpIR4UYXEEETP5x8wBZVhonkIlvPJvso
 xas3heMDCFw76+o4TYAYYJHxx/B2WwJ4ps1PnZWDkv/xOEjlb0RRbuZp7+ijYRf88dGx2x1phFT
 mDbnloS/rERP3h/RqsTpn/H/0oXnH9mEOYq1wpdDXxwdnSl/WBLixxe9QG1jP3ZSkhWEUN8greK
 He5sxwadiuJgXd3yOrrK59VSJQnsTqNUw0piWeaLOPh/i+rSqqjeudFyNzdKXlAZTjd0eeqfEAd
 e53K3L8+5knVDqtGKrNdgWlUzFFKCHLdDrC2DOvWuVwGEAkHPEBEtA33brsl7E6cua3br9CausU
 N5AUlPNuksUHiUnuBvYwelHLsVH7HOuT072r6990ru4mh60v4PbFA37FcTixTBIpaq37Tdyc1fZ
 zfCdnmZWjAXOAAMXINacruOFAUsPkfV4TPqOt2ZdJZrQFrvYOAmAkHJu/Nmq+QCPYSalv0Yn7Cu
 F2ITHRNLceVrygA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX6xB7DfLIqeIW
 eo+GIC59xG5A5X8uzoc7LcXYUFgLodgbe1SRGqZDXivoEo2HZp9vxSzkLFh4Tz67cNqgeK5p+mM
 jp2+ltnaDvSsvL3ZUPbZ9TxrVgjUnto=
X-Authority-Analysis: v=2.4 cv=H+BOUOYi c=1 sm=1 tr=0 ts=6ad230b2 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0H9NDlJ9gza-_DYZ0SQA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: BKKaNUFJT28nDrtgOs7mWxGSjhGOXKPJ
X-Proofpoint-ORIG-GUID: BKKaNUFJT28nDrtgOs7mWxGSjhGOXKPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX9p0OUdec9ujC
 ZRoTj4d8yavuPvlVo5c7REuusmwhkRPwQc4m0ZPeRBnOWQOL9XJdHRXtEaOJTprVwQyID2JQ1PX
 mCw3Flv0htqRrBLTISdQ+U5DRXSC9B99ClTBNPeGLs5U+dracMq2zLpnwlgDphmwb0KqCivujTq
 r/EtBxpm0gtZQDigxByHqQFz72Stl+g4Y0Zw8aSjvsF8JxdoES327U/WcKno27vedKY0YA8hnyF
 IbiiKEC5Hh+yg/KJCLMpcgGmqMmwGNDWYx62Fv9h8MoejKBdmoYwQDrNFCkmglBhwyqLatdU/IR
 LhfqZqSPgBWFvrZ2E+dU/NYbcpR9BmO1Zbu/4ZrDAOt8Tdm4Xl9A4hgKvCiStS995WC6zrOmxqu
 RpBejjSexmi2BR6rzzsUDXFIMR/EuS7wNMdnA4wol/RJlpEib1hA6N/d4uT8GnDG3XZ+BeI74HL
 4cBejm0inf2s6ymH+pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

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
index c23ebc61873f1c542a4b475904c3c3a3d89bcc35..0473033db2af90e119b731b9a6ec96de5973d3c8 100644
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
@@ -237,6 +237,11 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
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
@@ -246,13 +251,17 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
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

