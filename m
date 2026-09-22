Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587ED54857E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081881; cv=none; b=QX57qy4UZ28mxLMwDhHvuR2YN011zB6JYJ3nJjDPEb3XwcbneT+05bcYpXeP3Z/4Su9HwBjj7LyG3TwsScGzdxiaPEO2g0NkVTEGHaPJmYaXV8Npl4N0Mi//BbS7Ss1nwVsaVgnruhnxC85HlgHQU/qrMOlsznHg8pwQfOINDyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081881; c=relaxed/simple;
	bh=CF/w/I2oWEL4xyyUISvXBZXxucJ1ol0yr2u30mZJdOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QLTO5Qy+enh3DpNdrMsgN11Xxr6K7AqjrMfe9Tqr/yzM59mFIKFL4U+5Ppknj0ABm58ER113HTteVfY8FvtmroMyytKjalZ7ThKlwEJQR/+t4HtWC53B8T40iwWXzsp0lbiaAq24Ohj5ZTATjTGaDzJI8JoLmdY2wW9x4vrriec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEXLY+o7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+0ORL+9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QEXLY+o7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+0ORL+9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPX2w3487073
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t8d5GV6KzLRz1CYx1P4YFuvPCuiN0aNrCkWkYjs7e6I=; b=QEXLY+o7H+Jkj+9p
	bWmSSlnHyCWzU0rkp9oX0Piyt9VqZgTY1IGj/GkBur3tL6Wg4/HzXkKmkRQcGS+m
	jzGDQnZD3KEbdKMsHSOBJGD9+0dvKoLmkF030j6ljEG2bv7uM1YQ+f8GCZ1ubK+x
	oJdvbkswJ0x2oWiPsEnemJYJus1fDCV6xP0SQ++YlohnKrjhdAsEixy7xwYRnM8S
	lUc9Wb4y63/DjMsMsgPdF2V/0vWb980XKnhKT9qSL7FAv95hOXPOJnvxQTdBvIEs
	CW7zkUJkZOwHrAUOXrnEeb2Tv4Ss05wacIIlcZ1A2U78cW081rXzbpovMQsb6cM1
	+hGp1w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0jyet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:57:58 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82ad4977dso4634144e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081877; x=1790686677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8d5GV6KzLRz1CYx1P4YFuvPCuiN0aNrCkWkYjs7e6I=;
        b=O+0ORL+9kYDyDZgt86Bzqdv/NKBjKgfBl0I0NkLFqBBI43JwiVugtUiJ49bVF7xQmJ
         LXk6txYsTUdDJwrUO/bEcAifEM+buJv8wpkDx3u2DAGp6cOm42KaOwE6/Ba+BEaWD1Jg
         tRHSSadeoBcbs1Ka0yOgrtmoK4EigbPmu1VxpoHQDCO4SlHwXN0r2Feo+8zl6SzObhph
         8x1zsqtCaDJtjJlxc72S4w7odI1X8KhX0ka7M7UV2ZRH7/vYmOpsKQOSUJm8y2s31Pop
         5JVHuRV0sUmtbwwnSO6l91fSzHEX0b7sgzAsZOPYpp88wcc9SAJaHFXWcsxHxLN/FKtq
         7gLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081877; x=1790686677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8d5GV6KzLRz1CYx1P4YFuvPCuiN0aNrCkWkYjs7e6I=;
        b=pF3XoSYoTriH+rG2yCyRIiJBqI7zrOqitw779hdlAAAaEa0Necqa3/JvGprfb9Nj/S
         k0hcb6vDtK9mbftqnVrFXvO5CXo9RUk/jvZ4yxYYC1N6bXcv9nCYI6eL8Dryf3PYODy5
         BWSqGTIg3stzrBVe3aldt/kw0SgHdETmcHNeG35a9KG19w68y2nd01GH6eKmOqQSNY/V
         VeaSNXrvWiFiFNumgC/KkOMdt0iphBCS03HC+OXrWmVqOF/OovZhWpQ3oaJAfrNFVIy2
         fzwwG/UX08i5xX7sf4ufuFCMpEHsffTcEZ+EbxZ+gT/J8+NSScxtdjZAltJ7+stvxGJW
         4Ykg==
X-Forwarded-Encrypted: i=1; AKwUvByLZnNLtuhi8FA0lvqjTwb/ad9b/kvzOKqSPpKbUme8lAZgILEj2bzh68e8U31/YdT0mVhJlNjyZHUrc+s=@vger.kernel.org
X-Gm-Message-State: AFuF++kXK21jdB+fPm+VorhYViVj2E+Tt034I3RZnbB7OFR6ESDwSuRn
	gaQ2LZp2aaUj/H2nphX44E1kMzyyN3e9BYpzgEIRcz6oS+HGiUBWY5bzHahVwuFfaBIX61jHVm/
	Hln+0S5X4Dhu7UA2l7dDqHbllc5fR1/lyiCS4m1LR1gx6j+873wD0npEocFuenAAtgNI=
X-Gm-Gg: AYBFou0ZUE0M8EyTsv9s3ozzB3hHOWE4RdUCLdQAVg2Gv7Wmpb2cVGUtcTXjDzugD1B
	f9eSxpSD9AIVuCIjL+OHihR+qb2r85ja+tbuybkyYGA3uTVv815Xsjdr6WzZPI8vJ8Sabq0FHus
	77T0HeUZ00v29C9F+SHGXwjZUMBKv319dg7FgAhfYD4nhL/lnZDIiqmogO1yLHNPFnsHVR/PGoX
	4Zj4TnxmWumtUHoJoAolDU0PjVZ65TB6gsMmPmGJxCoxeh+gjRMh5fN3HUv8SRM4zQaXDgF9f3k
	+KkGxbBhngYgw3t9rSzBnJaJ9qA2Ds4haNUTQelRkip9RLSBvfeh0FCMV7SWP8wTATia+IOCPrr
	FJyLCQnGA1G+ZMTcWtKY9042dtZc=
X-Received: by 2002:a05:6122:310e:b0:5c9:a60b:e5a0 with SMTP id 71dfb90a1353d-5c9b597ea0emr9167076e0c.11.1790081876004;
        Tue, 22 Sep 2026 05:57:56 -0700 (PDT)
X-Received: by 2002:a05:6122:310e:b0:5c9:a60b:e5a0 with SMTP id 71dfb90a1353d-5c9b597ea0emr9167055e0c.11.1790081875488;
        Tue, 22 Sep 2026 05:57:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:57:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:20 +0200
Subject: [PATCH v9 05/14] crypto: qce - Use fallback for fragmented
 skcipher payloads
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-5-b1aa742e79af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CF/w/I2oWEL4xyyUISvXBZXxucJ1ol0yr2u30mZJdOE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns6exnmLRxX5OeIpWKZ9CFxYKoMxcYdGq6gt
 cdm3/WHvXOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7OgAKCRAFnS7L/zaE
 w2T3D/sGvLLVisZcqbLMZgMAXE/FdWjALLQ1JRvjQYr2eJc6Hn4KRry+6PH1nn4R50f5e8CVtoA
 GES/YQPz2THEjelD4rIyadz/Je1U9JN5JR0YqqPsWq7+M8s3AGfB7mJG7DCv5MM3/53CVAa6bff
 yxep+hth4qyb1yL+l6o/Mq846FGMy3whIJTPu2iZ3QvbYmhSK3YxxDtWS5YTaV55daF17nJWfw6
 c6pHi4A2H3fGDniJHnldPMgab9OY5blrBnNxQEgOwIuHAwE4/by/xJdohq8fVL99SG1DJddS4uL
 kJNVmumvpcST8QVhjo+7PgzwFbavUloxXCOXlTlhCMpJkinS6Xxy4ryo56v6YrkWu/HjCeqDY33
 HOTt/x+UAjVJgyaL0V9hVMphFBV+f0/jxBgJ5L7mv4E62DSNUX89HHG9KQn5LLNBQpwLg5E/E6n
 I/BZ/erW4lvyYY6DQS+vN+DIaI+VSwtOsxtzZ1uwSWIf8bHq0II93HxJeFNo7Ftu3l1C1vI+1cp
 8+a3pKeN4wCUd3eYVc67M+S6KRMw4HMeKR8L9MjhPfVoM4p0JCJTSp4mxu98aN/DlhZytql/AyV
 IOPXkqLuzig4t5vZaG67WDCzN+Kmh2F+0R+kcVMEl4UqkMIvbM9F40rXOV5HYrF5rbxnp1d+rU3
 vFeJ06oA6P27tmw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 4ZNYlNNg0GD29bGjjcjKviFbJyXgQDeH
X-Proofpoint-GUID: 4ZNYlNNg0GD29bGjjcjKviFbJyXgQDeH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX6VLiFXHXOzxu
 Y1dEfgX5BPkmptuHP9RCrVByTxIf31yP85VZZrni9RXYrXqdZpTTMWYApsdyGQ0S0BF7ZZz0hrj
 52vchsa2JlPI+OtXb2KEvp2U8Kq3FG2bFmzYHZ/GvQOndkZVMrBUkiN5bHWrlbQsEKzXw0A0+qg
 mxHY8Fb0lY4TyjG+suRW/k7zciiYX4C7KQ/XC9ERX+Fhm9AcRWLnxx9wEgZtSSO5VR3jjintDOt
 K+095e8RIhsSQ3deQEM3kC5fcJaeRz5FX6KM7cnO/7d+JUeJxooJTT46uy27nCXnLUWkrIB4Ta4
 kfT0t1IRFwfKgq+6bnw20umWKqh9APkQXh2ML8Q1Eyo0aFbcFXV3s1N4U2ktPscVjVhwmNn6LjA
 9rssaqLXmAa1d4/USYdpIjUm7SWttGMw40mdtwZKsZNY9svzfHwa/d2qNQWv58QrEBhWoYxp5/Q
 EBhSV8MBGMmJmWwuUOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX0NronJ45xm9q
 CZPEp/CXjB5mBa81UWECQuW5zrEs5nMgZr2UPpVYDlWExiKubti/31dZ2c1P+Eg6q4mpRZGCKiQ
 eTTtYxG+cIlvqBaE0iPzGPI1uJRO840=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab27b56 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2ArJjka39wvl4ErYtigA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187

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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 27ce87be2029d896fd987608f091084ac64f5185..dcf2c6ebd588fc74c759820807b08000b274a501 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -261,13 +261,17 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
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
+	    sg_nents_for_len(req->src, req->cryptlen) > 1 ||
+	    sg_nents_for_len(req->dst, req->cryptlen) > 1)) {
 		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
 		skcipher_request_set_callback(&rctx->fallback_req,
 					      req->base.flags,

-- 
2.47.3

