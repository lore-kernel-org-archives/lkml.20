Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB575437F1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081882; cv=none; b=Qma22Ts7DQGomUOJ7nwU3zIeYAjQow4xLj8N5GvAmgsn4aO1WfbRQYv9GBLFaVJHS0y45KY8wWio0TBZVzhJLt0aFQPDrSbGvJP0SHOQPzUbc9pmiP94eR31YU6eAfJjaiysktdQCJWcY+/QrX80dnrxM+/DWKq6BBNDNuxyW1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081882; c=relaxed/simple;
	bh=xpzz3JdgUksau+y+CL1E9ypCHi86QMcAsuNeCRSZCro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UqiFNbHMAmuLaGfWE7TheyC+ObyNaEZ9rcL8pNzGlJMJp3Sp4hF3M2kvLbCtDNc6zg89M+92hRoOTqEKZxwxEr/jLR3x8QGk9w8RCIeJa2MbmVAtX4kKAj5y52kAr0tS493GxmbK60oND/P+wCC0KT5trRj4MFvlwYThDGTqz6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7S0LnbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+UXbdBS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7S0LnbJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+UXbdBS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPD7j015205
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MTwCsTzyd4T9CksymXrEcufF/ORaYOZ8beQnrYavCQg=; b=A7S0LnbJqrZQCsBd
	ebge7ty1+utj9ebWRFfDwhLsA5oUhxUo6wQQmNOrAXNvHoOM+MJj1QNC1CN7UTUZ
	9ylxigLOhYYw/mm9uB1jUwwqkj6XiaHkeiOlV+CY7KcE48mfK0e7MckYdf/rHt31
	6bzh5UwdlaEt62v8xEWsYBfd8K00j3pCDWTQdJC70RCIIEkjh/xbf0buWScFrIZi
	/M5lQGYFsB3TfihZma9JoS7koj7kSpkGb9K+g2frOkpvdQrWklWtFG5Uz0uARA1R
	1D3WDchwd+B50/vUoHgnPT3LAv2B83qXBx+V3j/B0Q49CL+hsu9ZnYsQwWJpQsmz
	F3MVrg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjysagp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:57:59 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso3230140241.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081878; x=1790686678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTwCsTzyd4T9CksymXrEcufF/ORaYOZ8beQnrYavCQg=;
        b=h+UXbdBSoLbqIo/efmyeskr+4PamGwjlPxpodtEnfciwzwIBp9yZfMfoL3I6rVOLmh
         zhalGnfyxZILHXOctDlR5CJd/2uuEeQ7oyUjkTQ2qzueYsJY4BntTprr/aUI0yd5X6Cw
         qhkCAqOrGEireyEaRv1AUgaToi9idR8qdrw0C0gzWT1rlnueV3yXaHXuEh+4OvKCH0pl
         1N8IfVdUmrfdf16Pg8eGizMgWDQDQbTqnr6n8wk8bTDpEfcVq7BMPTgd7oxSam3urkQL
         vTV1Y3EnqNt4ceWW6ypi/N8Wb8IvmTqN1iNC5qLHuOCDPbX6ZUQCzqJjfaqAGGuuOega
         qyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081878; x=1790686678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTwCsTzyd4T9CksymXrEcufF/ORaYOZ8beQnrYavCQg=;
        b=njraPnhUl/fxCqUlRTVYxT33m3C7n+XWNHFwJbaL3fkA4j6MbgLlw+Hya+yEX2qLvA
         IbgmipsEOVb7TxQa3++abEQCqhQjAdLTKRQTYSFfGAlmiTG+4/3rKmQroi3M3yYIUsR5
         zPsRKmIgTHIcSdGpP7uNPx/mHZEKhjeJBj/JEh/C9RoCCQpglHHZLGTC2ZKHvxUEREj2
         xgn+bQJuD25xkHG+/cjNa86YH6Cvpt4mDVsFZJEVuYrYRuM4FmCA+z/qC+x2oZWS/d+4
         T51U/zQC9Kyn8jXZSfTsddAe9hWQRHLtnucYTykMaYp+hjQjNghLFjLQWAq/vu7858IL
         +FEQ==
X-Forwarded-Encrypted: i=1; AKwUvBznqxjXUFAkVrt/GurKOoc5IZ75Odr9WfANWDAc3inpl5uYNNjNmMqZZECHaEZm51hYB3ph2o3uwp2LR7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mOS7mSPcxUENcyizsHQqEmaJVitcoGybZqLh3XG9yFSBCjT/l6
	dq42FiDrNa8Ul0P+hlxtN/r7XpG479Lv9LBTqFoVsBQ+VcQUiUzUja3hv5SayEqM4vJkKFD+JiN
	ECCRf6XGRwNfrCSK4tV+QC0mXBADnxZpnyYxPZ93oR84On1WzfiSvMrU0Ikhdx3rw4GI=
X-Gm-Gg: AYBFou1ZTqJTg8StRoOMyGnQU6FdWN3S0/7LuirJhSejqh47RA16XQewHNTydCoAE0V
	9FlayidOxsGaz75DOxz1fp8+wPLo5zk0VUDKjrdTBbJqobzoqg1KxkRE7sqyYyEqpO425iudo4i
	TRIiZxmKNpPFRx29Yfyja4P62Et4eTlCJGAgNtap/JJ9m8G80VtAJJ3pib+uuYGIPKj3RDPG1cB
	J6KraoyrMwmmgB43mrNIW1pjiI38X+81txiEyozXvxE6uqzUuXArfD40i2aZrtBNszUQTT3Dq25
	sGmDO/o+81gEvFhj3ko0VpHC9MLFwPmpHXnwkUJJOJ3wEM6PQrnR6ENhI9TNescc7YW5Ydi8gmA
	F35zHi97dbA17nYZostmPGQ76qkE=
X-Received: by 2002:a05:6122:3c46:b0:5c6:8480:35c8 with SMTP id 71dfb90a1353d-5c9b58e1207mr8032621e0c.8.1790081878527;
        Tue, 22 Sep 2026 05:57:58 -0700 (PDT)
X-Received: by 2002:a05:6122:3c46:b0:5c6:8480:35c8 with SMTP id 71dfb90a1353d-5c9b58e1207mr8032590e0c.8.1790081878172;
        Tue, 22 Sep 2026 05:57:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:57:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:21 +0200
Subject: [PATCH v9 06/14] crypto: qce - Fix xts-aes-qce for weak keys
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-6-b1aa742e79af@oss.qualcomm.com>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4152;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8CYB8IJJEyolqYr1f3j4TcjRobX2+UHINpIZrcnUD6c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns79xTCzjsoUaCQdInS9yny4yM8oZvrB+7LM
 fs/mLigT52JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7OwAKCRAFnS7L/zaE
 w5kuD/9XpHCtabaTYp8HVBinHS02yg8pWr1tPG4/7/gST795uYvSOngLVmc8EsKahbAwXRb9mF6
 RApIGlZFZDVPLhOpGwj4nqe8nLdrp29W5Fh3n7ygCFXjYeVuJOwpwtNJYr4UbVHuftgPagk765d
 uTWq+ZClxIJ2+gY8aANEmgzqtZVMnFsEbbDJuHXefXRAtOG0ixzc4msDYJ3xuQn5GRcaZd/C+tF
 MuyTmPUE6/z9FC8iWAr3cqTxifBhc1tIi/IfBGbsB6jXF5pwvv8kkcSMgbP5WPd+39gtMZMW9w1
 G1f7Dj4PZFdj+bKwXuNDkb0YYr6MEFH5dI4RZjyS1x4d/q5g9yHrPlJQQNUjrajaPCDfLADrxxc
 m4yF2zxT2yFy6HBtvBk8hInZgewyjXkdagNZm6NHd1p+qMOrelQNkL6XL8+hM5AZV2G0xBCboH5
 28J793ob6srJf5joqKE7Xl40N5/DI0ncJJWwypEQ/8Pur3755KgQW3QZza56Z3mI4kXM8bx3P2x
 4AvzCAvPbJBUXZ8xLw28eOt8KbRU+lGeAkXELy3IPVzBr/npvp5l7v0fZCcNfEitnIUS4WaqPuc
 h+/ff1anc926PdK6GBejthayOX/zFMOOndZr9KxiGkxMO1sbvvCJ9Ap1GjBJ6ZwlWrvZz+/v4Dx
 KgW8pl+duP5WNdg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: lbnDIy7OATkweYgrHn51W4O7GjfcTn3-
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab27b57 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=tpKvEUOkdOp8HkJiz7sA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX8uWGjn5wMTrs
 Ft9hjlgIDpZA3iUaZ+93P7ysai37j3Gr5QTKcAZvdKegcNbFyIGYjJKVBp513fTxT4G7Xm7gGS0
 hiWj8CkCZkdw+VUXGfo1DhGJqQXn+lsGB4+h/hfCoqyhRzqS2bri6JsidF0mTSyKLbrTBBTj4Ve
 t7ktUODixaY7EV2u+4uyCA+WfXFjOYZvkfcUSmkriUgYZPFYVKWSORE+zTQoMsabo3ZdfxCwMHT
 N3jaglYJ0nRu11oNiRYhzrVIxA8k5PU0i17D9FNiAwl+zQvABYT6z4hRnyEnLnMr7BIwUhyHD7z
 yQJjj3mYA/KOM9BvPbXgPINT5J0kqZrHBXbt2vwMq95b6TIRnV0PL8vRPwvkLP7oGqeAyAzu2lG
 40sJDslHy9yN0zqCy9j38CGqV1Gu+3UA1HDWAbqtpYW1VnC6/Yw4makgB9hLUAvhMkUSFVXwZ2U
 EuCi0vPXnzumnHW9wfw==
X-Proofpoint-ORIG-GUID: lbnDIy7OATkweYgrHn51W4O7GjfcTn3-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfXywlau0mQC7Jg
 FXn7yYeDAI3QSN4/QsQfSqSmuFvkN+kKzfkr/q26NoRieoiGjcHm/d3Z8B9NnhnXBsEKFhyeFTk
 x5rSkWkw6FkqQLD0YNeLK3smOUwTddg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187

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
index dcf2c6ebd588fc74c759820807b08000b274a501..7abc1d7b1cf0403c456f3b3ce1f28820839a5473 100644
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

