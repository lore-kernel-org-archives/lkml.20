Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A7B498920
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045325; cv=none; b=lapD1edB1tGOaiNGfmwHQWlBfC25lbVHr5XNhjehWMXarCItF9Vxcn1uOd1hL24SOY9S1burZVSmQp26fARGs27JXUnstm5/t96iMW/fywIdHMIUk9mMVclmBRbiaQxqfHRiKzjcZ+RapJ2LhQkBtWhx7blIz1Tg7iztt60o+8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045325; c=relaxed/simple;
	bh=KW1xboFDIw7GUw5/K1L/QGR8hCZPAPAXS2iVODYVr6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R+/81NZXYUlRccU4IlhhouEnwaOZ3SLuRbtiJne6mv/sTtrS1WPRA8PT0gk5aYzhztLG+fP3kSNmFX7LDmeC7/zOjdNHokgIG5gn9vSp3xMnixGkuxpftV8A80VvAQZkVSbvKEN1LjoBs1XWnhPFKzU4iHN1vGDHsg+q5UYknr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhSy16JG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVU6q5Am; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhSy16JG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVU6q5Am"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ntu1242074
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7EU+wkow0wdDIWrKXMXcNY/o+lSeS9qvjpj3PNv9N8s=; b=PhSy16JGud3aN7Ip
	AajNj3x+7TjwIXShzDgfhQFg/k2CkB/mpnV/gXBBxNPwU6i35orUQxTdOjbuqQYO
	w2kvHD+jsePLgSvADwNNRAenyh7SQxPCv5ghlsnuG3c+cDNWArWvPqiR3LExXItd
	5KAOkwYjjbQ6juGcQ/FmkVgJkdeYgD3WX5Y+/prmmgX5t3fNkFdE+ho8sax3dkIY
	x2YHFC+KIYzKuIyVLiroEluZN/20z8dtm9MGdVll8A4hZ1GAxena8bMcvMoTKK/t
	md7ZyLhd0BMrUfqqdUEQswhY+k/KchyKzgVk5J2OulkZgUC5UG7U5NcBGw/QaSdW
	cMRvPg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjs7fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:02:01 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7b0f8e40bso7496473e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045320; x=1789650120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EU+wkow0wdDIWrKXMXcNY/o+lSeS9qvjpj3PNv9N8s=;
        b=FVU6q5Ami1CDAU5fWd74g3Uil08ir/1RlOHgOEO4/5APeU9/iJGu4sp5jFUsFkVdjL
         tLa5wM1XwnK+dcn5/+HoQSKXe4nCW7t+XB2MnpvbTjiFWxeUJEa83gqomthyX+QoSju+
         loPzjtXs1d9ON2SsZhwftuT5ylhd9KYhYvP/E+khvUUqdPjWLX0hhU5PYjzH3XXg1MG6
         eMyM3t3IDwNSk8QWlzfSxUjxk7y+lyjVnOJ+0zQdMtQ67itQSR2GSzxjr3K+mlTcfJaz
         tYukVaSKHAexM4REFFFKptrwHdYzKOaA3KWQTGOe/U8hMeL+7H4OrV5TuXj6ntCgwzwC
         1Ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045320; x=1789650120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EU+wkow0wdDIWrKXMXcNY/o+lSeS9qvjpj3PNv9N8s=;
        b=sYdTLr8lIOd4E/k8t/j/fnEMBIHhZcLWUQK5fmQNfxiw4RE+GfBSUvYCnpI36m7cq4
         o+POImAXocJy8wlyK0QlyUlh2j9OQFUbeLnshS6VgfL7ww3qOwBk5QWMF0XUsK/P4y/v
         VFrMdjh5+m8d6Bxl1roe5ZxuLw/26DyxSB4MlzgBJ4BdQqs0Sdz6ZpmeVZGG5JkwCAHO
         6UDoLEWLp0uLVv5BWnIC5Yr3Kq3RXORLBOfoGMikrzzL+vaNsLRC1beNrJ3yier+tauF
         AiHbyk9f+yzeVT9vJdFTlrP7qp29wgwpeP3TUB5Nm4bZ6dfIGMOTlVGRZSRZ0yw1ppdQ
         jR7A==
X-Forwarded-Encrypted: i=1; AKwUvBz7qKWA9yLPVABT8QhQntfvs491Uu/EfjqFESE3Zfmo0o9ahNjD0/WjSQXIEC/7/7o63TyYmuI8TaJCjOc=@vger.kernel.org
X-Gm-Message-State: AFuF++lgfKULxOGg27C0Azax2NNIZFH3JiXnIIjgbp22DOfLR622LbAv
	vS7vaSG1WKDpcuZoNlnUdniiMOdQBr9yIPhu/l1bOsrwSHthxAx5Ykc3s75cY+ZPp3IAD9Gt+Em
	lAUrJ08NQRvaOychTHEEMr8biRPTcOFOIEb7vQ8palVdPKx5PqKVrkV+pTxkJFEZR11g=
X-Gm-Gg: AYBFou2usbfa1cnBtRtw5L391AvwXGyYrq+IqN0h7tgpMUPZLfYeAm2Nd1G4vqn1zwq
	UyDNA+8hPV90a1Gawq8UZuf90ri4ul13fUB5rj6wZpjsEDthK82+rwGfq6JgqBx6IS8LGGWuaHY
	VteRX095qkgVvHP/TmhdQNbqwULTBQ9VWtvSWbNx5IDl9vJIXmkjSMOUDcJXvEN6rTMPLSw3ydn
	UMgzQQfnTA6T5XGCqg8/Jj46OhxpBhsKcl/oKP6z8CwudP/26KmG3HJGSh+x5po5mMDTY00OCF/
	ZfXW7RilqZPnAg5VycjLvnm/ZA3sC4kD5yqb/RVWC74ofg7Hi413MfIoWp4Z4u/sWAflSCjxJKo
	ec9vwmDe0M/LwJw4lQbqyal8Jy8/5
X-Received: by 2002:a05:6122:881:b0:5c5:db2b:5baa with SMTP id 71dfb90a1353d-5c7ed7cba16mr23879210e0c.6.1789045295749;
        Thu, 10 Sep 2026 06:01:35 -0700 (PDT)
X-Received: by 2002:a05:6122:881:b0:5c5:db2b:5baa with SMTP id 71dfb90a1353d-5c7ed7cba16mr23876494e0c.6.1789045286926;
        Thu, 10 Sep 2026 06:01:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c9b1:abfb:f300:5e98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm831849866b.25.2026.09.10.06.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:00:47 +0200
Subject: [PATCH v7 06/12] crypto: qce - Fix xts-aes-qce for weak keys
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-qce-fix-self-tests-v7-6-cdbd2718af14@oss.qualcomm.com>
References: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
In-Reply-To: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4152;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LHxn8qZQ7172JYTQczFIpOi+jAmwYv5eGxN5U2DeL2I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoqoPgcYYNiS9bUT7TKZOvXgiycY+xCV/pgRGj
 9yf2ltWAsKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqKqDwAKCRAFnS7L/zaE
 w1sIEACsCiS++eDUogxIPE2LIXSNpcedycPtCM2m5ypQYo0berGKN7DnBkEt62W0a6zrMGKwx7w
 ifuQwMzYrEJHbkcA6siFI8kgNIn1ogCka5vvbHmLRmj7TCo4MGVaIJz2t7CE6rcBtH3lShR2mLQ
 EgD0VWSw0wEQcuAKBB8/MU28JXRDirKeIcuyqzmAt/Vv5JWnc0ETq9MwKs79e9VntK9D+XTgCCW
 Y0xNniIyWz2CC611h8tHPylhx2lNGJlMMhxZ/7sHQbqbgO9mXcUoWKnu180tse4Mv0HMXb+XkLJ
 c5+AK6dsKpMKMtSyL3cTjGiusL1HOzvpWdrDDOg4vQE3vX7wcgWffRjgTeJrTi8m3unLgVMYwA+
 HMB1urFNmPRWzzB4buwpHiPOyH1mpOBIa5aP5WXPI3YOUOOO2MiEeF2zM4x6Y1JCXs0v24VMkQU
 ao1dCjmNLy1ymqSwHt6Z+L38iGCQkoq5/3dbdRYA1jciT3jlfYcy7BGsv3iQqi7CXcqb0aFFxzj
 CO4F1om6lfNtEQ4WrLuOrxe4QKVbPC//oQwpHwnTfOLF5O8zrccrHxyY3AO3QuR9IQ60rwEN8Rx
 84UbgCqSTSNMy3/AQ7bFSz0poa6gU2aSqLEQRhg0zdu1DshnJIoCWUtNwTE90yKsA6POk5BqnSl
 QfT5+JYR3phTK9w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX+UO1usMlQowj
 OwefjXWBpqFi+RoobEwuMmXv/Iy3yMv5zXd2LiAYaajqLz2ntK/YEC+0wdwsrQkTkGLgaYi/WAc
 EgyppcWd374GFQ3rIHPtFVUPHVKNQTs=
X-Proofpoint-GUID: dJXlvMax6eKKetup6QBKfvjm9mQlTxN4
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa2aa49 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=tpKvEUOkdOp8HkJiz7sA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX08gnZ9vr65Ru
 T7mGdV15yqKYlmj96XM1optFleozoWBKRUTPvE2LNe705jcCanlLCMNvLZTLvifgwP/RbQKP0jE
 j5w8NCCGy3iTwQ6MDtrJjJsbDW/bRUh8XouJek93jri8ILQ2Dx6QzlciBLO/f9mSbuJ+iFW5mUF
 CRmJedFrLkKUv6kd4gomdzJSKWtuva2bfXPlOKqPIfjd7rB1V5dFtBZ1AFwPM9sNkjR2d4mQ2RP
 rpAZSnhJTs5YjrhfiDc8JyKFqJQgWQtPCqIF6LxpFdATJ+gBdKI3rpuwfYYDSOiyNfkYsRVu6O8
 7S1jA0NLZIyXf3opNTsFegGZRJPSkWp+x/M/GzM3IgbALhlniePMIxNb4GRxTT1V+p4O/U4JII+
 IoxES1wD+cE+WneJLRK62C9w2xI4BkoB1ZxEcS9QAgaW929frRpDcyTLpvJc1R/EaK5y5BVspFy
 LbxwhHkO3oBhi2NsnEw==
X-Proofpoint-ORIG-GUID: dJXlvMax6eKKetup6QBKfvjm9mQlTxN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100156

From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

The QCE hardware does not support AES XTS mode when key1 and key2 are
equal. The driver was handling this by unconditionally rejecting the
keys with -ENOKEY(-126), regardless of whether FIPS mode is active or
the FORBID_WEAK_KEYS flag is set.
[    5.599170] alg: skcipher: xts-aes-qce setkey failed on test vector 0; expected_error=0, actual_error=-126, flags=0x1
[    5.599184] alg: self-tests for xts(aes) using xts-aes-qce failed (rc=-126)

In general for weak keys,
- If FIPS mode is active or FORBID_WEAK_KEYS is set: return -EINVAL.
- In non-FIPS mode, Accept the key and encrypt successfully.

Since QCE was returning -ENOKEY for non-FIPS mode whereas the
expectation is to encrypt content and return success, the selftest saw a
mismatch and failed.

There are two problems in QCE behavior:
  * -ENOKEY is returned instead of -EINVAL for the FIPS/weak-key
    rejection case.
  * key1 == key2 is rejected even in non-FIPS mode

Fix xts-aes-qce behavior by using generic helper xts_verify_key() to
reject keys early with -EINVAL for FIPS mode active(or FORBID_WEAK_KEYS
set). For non-FIPS mode, since QCE hardware cannot accept the keys, use
software fallback mechanism to encrypt the data.

Cc: stable@vger.kernel.org
Fixes: f0d078dd6c49 ("crypto: qce - Return unsupported if key1 and key 2 are same for AES XTS algorithm")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/cipher.h   |  1 +
 drivers/crypto/qce/skcipher.c | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

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
index 4b7545e6aed220b7fb5af7dbf20ab47db5d1d180..35bd59656931c5f12614405490f1e254849b9eb5 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -12,6 +12,7 @@
 #include <linux/errno.h>
 #include <crypto/aes.h>
 #include <crypto/internal/skcipher.h>
+#include <crypto/xts.h>
 
 #include "cipher.h"
 
@@ -194,14 +195,17 @@ static int qce_skcipher_setkey(struct crypto_skcipher *ablk, const u8 *key,
 	if (!key || !keylen)
 		return -EINVAL;
 
-	/*
-	 * AES XTS key1 = key2 not supported by crypto engine.
-	 * Revisit to request a fallback cipher in this case.
-	 */
 	if (IS_XTS(flags)) {
+		ret = xts_verify_key(ablk, key, keylen);
+		if (ret)
+			return ret;
 		__keylen = keylen >> 1;
-		if (!memcmp(key, key + __keylen, __keylen))
-			return -ENOKEY;
+		/*
+		 * QCE does not support key1 == key2 for XTS.
+		 * Use fallback cipher in this case.
+		 */
+		ctx->use_fallback = !crypto_memneq(key, key + __keylen,
+						       __keylen);
 	} else {
 		__keylen = keylen;
 	}
@@ -261,6 +265,7 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * needed in all versions of CE)
 	 * AES-CTR with a partial final block (the CE stalls waiting for a full
 	 * block of input).
+	 * AES-XTS with key1 == key2 (not supported by the CE).
 	 * A payload fragmented across more than one scatterlist entry (the CE
 	 * stalls waiting for input in that case too).
 	 */
@@ -270,6 +275,7 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
 	    req->cryptlen % QCE_SECTOR_SIZE))) ||
+	    (IS_XTS(rctx->flags) && ctx->use_fallback) ||
 	    sg_nents_for_len(req->src, req->cryptlen) > 1 ||
 	    sg_nents_for_len(req->dst, req->cryptlen) > 1)) {
 		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);

-- 
2.47.3

