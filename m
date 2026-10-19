Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E514F93D1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417706; cv=none; b=aoxSM3PNzWCW49UUwHNJ32grIfLYcEXfynx/+PKoDKd99PEBhsCQP3P9ipUgxpyNIKP97SBlpddewKEMLY5epUcSERhOlxUyhNkjVNQSVuTEq3PXi0EMjZOjn3r3pxSnA1xn16wNH/ilN6oeJmToRp6TIKw85qeb5lbnYSXgyoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417706; c=relaxed/simple;
	bh=5GHHihT8Q28Q2Z6IqnDJJLR49udVLHKyjwu/T6aBJ7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ncYwTPLJQWT1aXpYsy/FoRA7XQK+pBk9/lJ4/zEgrzyuUTzlGKHIuB2x8WVK8dEx4hRMFIbJH2UVWphkmdBvYT0whfbw+K9JVxGdtF7qodVi2+IKVxtdYr+SRI0pP98EzReXRla02/WFPHkRb1RdkaZ/z+4HN9NTNq6ixxk5gRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eve5dmsK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JUTLbyvz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eve5dmsK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JUTLbyvz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PCOv2193383
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3z8i+KPSNZ2br0pM0JUREqSlK3MOF1iO3EQWQGWiPH4=; b=eve5dmsKKTHeRAik
	/3vr2+iutwPPDVeub8pyF0Dt+QIu770JipWdLd7OrSqlxu5R4rXEnbJcCywz6vwc
	vBB3+EwI3JairFp7cdDTWkL+xGnXqWDGQl6Zgh2ro0uhBuemdXG8oNCmieIa8yWv
	kqqzG7ccjnATqjJtyuqtnNbWaAXKvpXBubmyXc6ppjSbeDPXlrF45vFcLxEerp6Z
	xXmBOacReS33qdhEk5hxz4tsN/qgJknxV5TTAFkPfBYIUncqQyirIbT10C48gwGr
	u0BL0LvlJvTAYd9cLxrrsWHSHGW4MGDJxpIqd0Vg9vV38cmObKktOWSGJP8U2+B7
	BZpKXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1ayus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:48:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so406224885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417702; x=1793022502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3z8i+KPSNZ2br0pM0JUREqSlK3MOF1iO3EQWQGWiPH4=;
        b=JUTLbyvz3CpDwhWSt0A6avupu4f61+inNrFvTYI4qgpQk6SsYQvDy5U+8nhKb6fS2s
         gLQBdNboW9n8t9mmgEcy/OvNVAA4Fiq19jvzru0+wYSHnt2DfAVbcLKJ9UM3pu8dZLRp
         ij7K7HUUVbpPXElzoLrg6rqQ+1fQbvkIAUej3FlUdpaLLqw8N5OC509FDN0AeD7po3vC
         7f6QBAlsEaIIKhOV1ZiU+o2H5UgETVfysS0QsmNkzJHBRUZwZffcM1XCTc4asTddh+MY
         ApY1P53/E3m+RTfOZHOI1B1qmwQSiVzwDy5sK4pf32qQswafAKapyE66899KcMFi+rGd
         EChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417702; x=1793022502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3z8i+KPSNZ2br0pM0JUREqSlK3MOF1iO3EQWQGWiPH4=;
        b=v/qvkdnRv+xNz6tuocjZu2DH91+/7OjSJrD9xjmq6yB77QMt1ztZbppS28BKTydmL9
         v06xJ5Sd3+bFuVXkVLLaZOIrnuYcdBJnbRIgKthUX+iGP0K2BGYmHVN7NnL4QathPqoO
         D4Or1OPfj+GY+qVXlmYr/W8zGXPnMbDrTgFiQUSWMngdYwRstwv5rQwGjHgG+/u1sxzB
         mKXM6MI9EowlSGdf90ZiMt9yDmqlMaaNJ6CqrwXG70VADiyMSaTD138mq6OOVekZrpkp
         mjtbZRA2tCTduWqy0/pqsEcF/bUY2abeUSj1ycb6yDNvHOgyfIoHGewJ41YxNJdPSLRg
         hH1A==
X-Forwarded-Encrypted: i=1; AKwUvBxBj/bHU488xS+JdPJ8/TtzPtgW/zPer9/XXmX70d/pAo6EP0jmExpO6XiUsWnWKhyWVoujFNNao5FhyAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAUsiOYMEcDUbQRE6RVUaMla1bgmsNRFqiUHRHPX3FVFycMUSx
	Qtjex4Xj9qSmkU9cXzmesQC0hkvxdi0nWxuuAnIMjabRFnBJ/gIEfxAwt6DRs/VqbAjn6tYb3Ga
	wvU4NL+hHqI0NZPay7MbqYGbL7xWDM92pXF/mMBz1hGJ2hs7RPicPK2J+VnkkmjlvobI=
X-Gm-Gg: AYBFou3ifXwGoq8twceRUVeloRJS+2drI/gBIC8xF+UIHniHolIs1wl7Oj2OUDuTGiX
	8RlgzzeZen+j3T4NSxlE1hYLS/D4r420Pp3DD14maRRULrGZJ1aK/joL3GNZpM5M0y5PfqyROeH
	hfH5VH0C4zqDA/frnpphrKJ/vcc3kMaOMY2dTr9sSRWtD+SqXMYZVcNec0/louCAgPSq1EwS0sj
	4Hqe09tPSOi63dzfkE2+Aw7e6SoCVEiAlQ0WD8Gu+YFluFEnGwGGXmSTsH4gUPdPaI31xI6x2C6
	+i1Yhm5pv1dXjHKDhBfKT/uw49uTqHmjWkFOi7udpbYA6MXdPD7IPzSBVRZ7hrMlpO+mRxX5ejr
	rNnGxtjJZPDXDueXvrgffPMxCOUUj
X-Received: by 2002:a05:620a:4547:b0:93f:2610:fb6d with SMTP id af79cd13be357-93f29cc832bmr1363859785a.13.1792417702236;
        Mon, 19 Oct 2026 06:48:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4547:b0:93f:2610:fb6d with SMTP id af79cd13be357-93f29cc832bmr1363855185a.13.1792417701785;
        Mon, 19 Oct 2026 06:48:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm20595574f8f.15.2026.10.19.06.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:48:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:48:08 +0200
Subject: [PATCH v11 1/3] crypto: qce - Don't modify the TFM context for
 per-request fallback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-qce-fixes-aead-v11-1-11c55cc7a695@oss.qualcomm.com>
References: <20261019-qce-fixes-aead-v11-0-11c55cc7a695@oss.qualcomm.com>
In-Reply-To: <20261019-qce-fixes-aead-v11-0-11c55cc7a695@oss.qualcomm.com>
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
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2422;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5GHHihT8Q28Q2Z6IqnDJJLR49udVLHKyjwu/T6aBJ7g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq1h+gMOTqjQt6l7IKLo91jf5mwj0P/GJHk24Py
 KKqGkk9mZmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatYfoAAKCRAFnS7L/zaE
 w94ND/4k+pDq8J3I5zsCSvWVpqkCQyoYt9nrtKvRWvKqvjlYsSe6yybcwAtZuig5BWOUTwzi3QC
 8KcSiGBv8klBVo3MBblAG8tByLMV5Y89PGJg/DKdpA5ULdhS/h6iNkMEV2m48n3WlU62ZPSPG0E
 NEiBZHkqktVGjYaIxsWE3qhuHLfn+5zYV007HtvsmkRBLSUja/5uua+fZmpXiGujUe6pTTIec3O
 qxQhIdPkEf+oNItFdiCJblNNtoL05mo2KHsaCgmJ77+UqozwZLZmUf2QvhxdFTt0oazP38Kun8a
 Ci9CynxK5nB1X5s/QaPV6/Bp0/0FrWiQLMc0nhpGFgu3PBDBeLec1qq/sz1kFmp4eSl0IwzI9eA
 60hXOPVQbWUhg7klpEKfVDbE6iDY0OxtiBtt6H0JLWKFxmxlYHMcx+Q1EIpH5t073DKDdSOzvOH
 4gt1Zr3hEzKpin5+dRQBASjn6itMEOTMvqEHewA1VS0TAYYBW8g/5MoaxCp7g9VoR/KACh+xU+J
 C6sxjVRND4U1me8UiGrGE6B6qjMXd0Escb3C+9BAn3XK+NRiWsq36r+v14K7Ox0JjbaU5JO3Tv/
 Ag7qxUJ+ehUZM67aF14ifyFZS5VVZzC2mEVGjLdUfyfidpM8QPDEwrcS5i/GeOwNL/LcvJAQafN
 kBCTaQrv9OgOMHg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfXy9lqsVT3+cE5
 sWuXDnt6kw3TMSyH+FwXEs0ZvRZhyVtEMFNsuxpc4n4f1j/Cpyx+FXqFyTPypZ5022vqUKjmOnp
 W3sWYdprxM2i7aB5JGh/QN6qWCKPnB4=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad61fa6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8On1wDE6BETRpeAr_T4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX+WEqt6Yj9trs
 2sYkCY3JnIhLLTrKzCJBDBb6muGJuDqszcQOIz0OoAkcRY224h1SHGD7z5+Zp1hK1NDOQdYxUwf
 E0JyN0mvFCex0DZ0My4UX7kav82QK70IQeKxGs1HqBsR6EVOWUzPahuNe+9KowIoH+vG9ShmjfA
 TLa2YvrEsf+b+sp3lHlY40DHMALB1PKOISf1nEZOdq0y/ZG/f99L3XlXSYMR3zkFwyQIHTzvY0q
 UmaT7IvdLL227ZIMIvFqgJtxVMgZJ3RDO40O97lzKZxg3BWUYNcnw7mVXk7EN1/YnY+whZUqaG4
 eIzEgnmXfP/voX59MIaKIh+XsjsNNxkVl+VBQeM6wYYeMokS1xU7sOLg7Co0j8+vRhaZn0i8eG4
 pEAKPlzB36/pxHcWq1D6my6NnLLKm49jtvJx6e1j8gwhsySWnVzENEt3o74HKtZfMG0Aja8gTNd
 iHcw1ctEpkuf6mgZsbw==
X-Proofpoint-ORIG-GUID: I2WWQOhH68IrO5qffYNkxw-hkt-xZXUx
X-Proofpoint-GUID: I2WWQOhH68IrO5qffYNkxw-hkt-xZXUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054

qce_aead_crypt() records a per-request decision to use the software
fallback (on zero-length message) in ctx->need_fallback, which lives in the
TFM context shared by all concurrent requests on the transform, and then
clears it again. This has two problems:

1. Concurrent requests race on the flag: one request can observe and
clear the flag set for another, so that a request that needs the fallback
is sent to the engine while an unrelated one is diverted to the fallback.

2. ctx->need_fallback is also set by setkey() for AES-192 keys, which
the engine cannot handle for any request. Clearing it after the first
fallback request makes every following request on that TFM go to the
hardware with an unsupported key size.

Use a local variable seeded from the per-TFM flag for the per-request
decision and stop clearing the flag.

Fixes: b51dcf05c1e9 ("crypto: qce - Schedule fallback aead algorithm")
Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index e0061bfab216861444e36700d6530e7a3cd347e7..81c1a9598474c7c1623e71a9eac876fcc0c111b4 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -499,6 +499,7 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
 	struct qce_alg_template *tmpl = to_aead_tmpl(tfm);
 	unsigned int blocksize = crypto_aead_blocksize(tfm);
+	bool fallback = ctx->need_fallback;
 
 	rctx->flags  = tmpl->alg_flags;
 	rctx->flags |= encrypt ? QCE_ENCRYPT : QCE_DECRYPT;
@@ -511,14 +512,11 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	/* CE does not handle 0 length messages */
 	if (!rctx->cryptlen) {
 		if (!(IS_CCM(rctx->flags) && IS_DECRYPT(rctx->flags)))
-			ctx->need_fallback = true;
+			fallback = true;
 	}
 
 	/* If fallback is needed, schedule and exit */
-	if (ctx->need_fallback) {
-		/* Reset need_fallback in case the same ctx is used for another transaction */
-		ctx->need_fallback = false;
-
+	if (fallback) {
 		aead_request_set_tfm(&rctx->fallback_req, ctx->fallback);
 		aead_request_set_callback(&rctx->fallback_req, req->base.flags,
 					  req->base.complete, req->base.data);

-- 
2.47.3

