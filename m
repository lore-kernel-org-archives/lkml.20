Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323ED4915AC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045715; cv=none; b=R/AgtrkhDf9EeZt1Nwe1eAg6yfk0s0ay0LY8fuIBdUC05ikn4yQTMz0oBMP2CCKJHHQihK7h+N2v/4pTVYZWj/Yq6rDKCN8hXKmtGSov8cQcUfg2BKDnRKCaHuoEU9CEqRzX+N1kNTCbDSHP9klpLqtEsmHdegiWnR89a4Wida0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045715; c=relaxed/simple;
	bh=Uma3r3Qc44Y0Xz31JrEvI/Rw746qZICX+o0Zsz4ItL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FI6rqYvbKD56I7GiUPZqlEWU+5Kb8Zn8Xb+ZmDeCt1hJRxGBEt6qCT9Wb4IXlrTEkXM98jsJ6B7KNKDWu8hLM7zYXxJCSH9FRiqEJ/Qn3flE3vhq++pADKfKCMaqqN35uz+WaYXvJghcnt9LaTwiBf5RLpdQadLwcRgyc4uMei4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GadzsUIg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekp1j7Vg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GadzsUIg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekp1j7Vg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7vPb1440988
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/AX/Kem1ZM8Esmp/0yLI0NjEShE6PnXQcN8z1bGeCo4=; b=GadzsUIg2YzBBr0D
	XAFgVM1jy6rl7/SVGpPBAHcFAUPphOJFD9RTi3dEQzk/rymaMtlE884OdBid3NKz
	C23UA2mhV90HOmldiRUW4bJqiFbybB6JhSc05KyBIeJfAk3ymXQ7+C3/uPCQRH5X
	soysu5yYaOMTR0YF3IW/H8CAmBrDXCb9i0r+AlDYUE4ELnUmShccEzxImWU/38QS
	8gloyOD/WKhi4LdFIi/uXDU/QVZS4XfyFUnf+ngHi5Fz4/WKqNHMcbq5JG5hySXh
	fOhCQBM0t36sqCLk63TmfA2dbEmdTxuy3GJENDbkR2LdMAONwkKHVmsy0zWnAoFS
	n/wpXA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvscgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:08:32 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6bcff1b9fafso2796269eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045712; x=1789650512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AX/Kem1ZM8Esmp/0yLI0NjEShE6PnXQcN8z1bGeCo4=;
        b=ekp1j7VgsU+1uCzhZwf8mvgB0KoWlrqco3wzwpq+VTBEn6xepQUYttlPBajNJP4n4U
         eME+gAHXalZcB7I6/92MUCG+BydK5yxRMFyCHu+Xi9qD25b3ZLzZFMeC0LdCxSYXYyfc
         FELgFd5MyUatnvd423S6LImPq4Pukw+IBrrPx8CxQR/s9PUR9+pL8Esj0SmJGtfaV9vQ
         pWwjlLDgwn/ygax3MLdkXRN/Qc91YzyQS8ku6mG3fmUTbxmKH8iAUduML9DYwRENTTq6
         G9r2x/xhf/gr5dD0uVHeqxAKTzH+aLA0HvMXyMG85hnSUCJvc7s9KeHXDfQCXpWqlU1G
         1juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045712; x=1789650512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AX/Kem1ZM8Esmp/0yLI0NjEShE6PnXQcN8z1bGeCo4=;
        b=sDMlz9YGRpOo4UufKmP5KJygAt4kVY0vdr+6iTJVQvHj8nlowaPB7Pdh0RjVfv9RFh
         LoFhxkIQjHpxh8a5C/nN9hVT/H1Qy2xb29NHbkA3D+Ky6oEtYqWAbSRh+luU8MAQVtpb
         CCqmncse+285GKR236ml7fTw7AF6aa5BMdthek+6BvlYo6MKik5YuKD/fnwpq9CBM/u2
         6j3lSdfKggVh/SVKXFTNW62NRQZYFgqRL0pLzrWXijh4lNsq4w5VLqu3lGwgn/3ehKyd
         gVhl0MOc7UPKVrUQV/gMFhlVqjlDj/kx/bKTCHXs4pYsIXu60hhBVWZ5VZEfg2cK8ezp
         UKUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxED0gKy4BInLtI5RVh6/fbFTXwmamxt8fwt1wy63BrGl0urNmP/jOrYTszQvvW8Q4mcM8zbAisqnshEfQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kF9uQcqvTl7afSqbswXISMlFL3qsqMO6z1rJXLlGPocJ2AWOmh
	zDaVtmCnwjx0WbQwyTZNwdTcOhVyoLTIPYe7mfva9+wvtleHop2ImRIpzvd8EBTxsPOXqqbuUwt
	x+7o2iJkoTu1uTa9HjwqLyrFSWjlS05DhjySQtZFp34VGacCTp5mW8Ik1a3LGH5LE47z/k2mEsb
	8=
X-Gm-Gg: AYBFou0oxA7PHCGuGmmOblGNgvVo+A/Wi9xiRKqlTjtIQfU+RjU3w5mMchmuhVtBuV2
	NRjfErJM1TdcoC3iEZ5gP51i2dqtfAkBB1NLSbfla/D1Y8y2WEf7N0SY1rlEaGowlW3wVvCxwXV
	0uKjxF1SDpvPwF/Ix3ptf6rR3+0HUx3uHUvME6OnWAc5tUv3/3jDXyUyemn4KS9MCMcZCfzPwRP
	RQmYFF7mG0OqZrRJwMeaFVnLHOkkJ/UcGFtN8Qxpp7J+ma8ZSx9aa8czOuM47gsA46UQQ65XuRc
	ZHI1Sc8oxsTRdjMUUEXIRoVMVj0UaveZvqPRX2x7XRHSz9t25oxdU+m+xbcwFq9fdARpktS+To4
	E6ZA5Yc5v443T1P7cM8YCHM0Sl33r
X-Received: by 2002:a05:6820:a0b:b0:6bd:f333:7b83 with SMTP id 006d021491bc7-6bee53a5566mr3889418eaf.16.1789045712345;
        Thu, 10 Sep 2026 06:08:32 -0700 (PDT)
X-Received: by 2002:a05:6122:6c1b:b0:5c8:4409:602a with SMTP id 71dfb90a1353d-5c844096071mr109779e0c.8.1789045289387;
        Thu, 10 Sep 2026 06:01:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c9b1:abfb:f300:5e98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm831849866b.25.2026.09.10.06.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:00:48 +0200
Subject: [PATCH v7 07/12] crypto: qce - Use a fallback for CCM with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-qce-fix-self-tests-v7-7-cdbd2718af14@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Uma3r3Qc44Y0Xz31JrEvI/Rw746qZICX+o0Zsz4ItL8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoqoQWFinvRcFAnUPd4tcM/rD2YmCQ7Yz02TzF
 kzcr8WKelaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqKqEAAKCRAFnS7L/zaE
 w/1OD/48D1BIRVEjmOTkZ1OTGEWgwaQ/dwyRiP644llwbqISK4/pqV/Inlwv5tE4QpyEdtpTxdA
 Df7w5Bz12wbRguaAd02lo31r61KrjHVTbBVXqoEo80ceuMRk1J+8LfrSYx0NnQ8KtBD2OnSdXZH
 UGbX4HI7FbSjGSOgUMaE6I2wDWVrAPcia/yWFtyS816NpAytkqKHoND3dlHmXNPA17Tet/FO80U
 WeuX5kRPrxp+jcnU9H8af1GuR2T1lV0SwqZ8nsxqjuVoH92nKd24o5UTxcMA0Qpf5WwIAJYcn5p
 P4oN3MJphGRyLvnQ9KS4KHsfejsoGDl13uRKAclEI6TcwUGYooiVrzgqbjcZExh21imLVS2iOO/
 rA7log+daqucMzjZxtW/xMGCdazuGXKL9w5ujt8z5GdSJDNuzpX1OModWvWo4izz+Q0XPrnOFXV
 HBQ1QHPrmlkk9Jnaf2v49MSx1C+9Mvb1GtnID+H73kSN9k9qYSF0uf+z86TYeGJCfuG0OXm03OP
 VQ03TzoyOKAVkTZuN1IDFsd+peHkQ4/H09el9UHpYI8nJgNUdk73/rAFud+y8pGSNzRK7/x39P3
 dXgJX7c19T+RD5BCxZtuFOUU+WoXtnwrcCPWhVg+DY9179m6Ut9dWqgHupDiSryMW3ja44w8yyd
 r8Nz89K4h5eKNUw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa2abd1 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dx2SfONCXZg6tt9xEGkA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NyBTYWx0ZWRfX/EPHWBcavDqC
 9U6OCQn1/wXJdmKzhBIXx1GZYx0ChdwIC70BVv/23WmO05/vpqkkPNpd6PsdgHrrtfH4uB4nPwV
 y0N/CKiSnctyCrFVsOAiUUmUvV0SRaUCWla4S8fJVKIxTSZ0cfJzq0pgZzUHWxiU2OfVtPHzlLT
 mhsFCYOUUvuOJmqlp3a7wPZ/hI7M5UpVIjC3AZI4y8tZ8pfIrEhBXV3J9cfFvWTUfQhxaWsABc+
 Ji43Jfy77vuYdI0K0VoT9Z4N+/wFEX611cs86C7yu0NpU4g5IkyaiHkotcrUwg8gOe2ByRdqJdl
 WPmDXY8yxoSuiZXb20l1LzDXP/rhpkm2xnDmuIqBJSFgQkHHiA8k/f96g6n/2AcvpLFy6pJK/GS
 Isl4XdiBK8N2lfdN/rACGraFwTW5M+8Aivd21Bsq9xSIUhbDdz7PAjk3ypAJFhtfUW7WqrSw85k
 ViZfY2C0aojPcTIHlRQ==
X-Proofpoint-ORIG-GUID: i53JKAbJ4Nk_Hi6As2UCQPA5XqCDCFv2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NyBTYWx0ZWRfX90aX6hgqZYL7
 pKLBcQTJQoAeubf2uHHFU7EBE2nw7vpxE6ZNA/wavYxteOgbuyRWIl54lDtY46tG3B3R6I2pjOF
 HFVt8SAg4O6EuOCmxjPLpQDKwCDEm60=
X-Proofpoint-GUID: i53JKAbJ4Nk_Hi6As2UCQPA5XqCDCFv2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100157

CCM builds on AES-CTR for encryption, and the crypto engine stalls on a
partial final block just as it does for plain ctr(aes): a payload whose
length is not a multiple of the AES block size leaves the operation
incomplete and fails with a hardware operation error. This was caught by
the ccm(aes) crypto self-tests.

Force the software fallback for CCM requests whose message length is not
block aligned, reusing the driver's existing need_fallback mechanism.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 0453b806408c96db9d67e8f1fcfab83f145ffb26..ddae743903229f248d1dc7037c4ae78537476563 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -514,6 +514,14 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 			ctx->need_fallback = true;
 	}
 
+	/*
+	 * CCM uses AES-CTR internally and the CE stalls on a partial final
+	 * block, so a payload that is not a multiple of the block size has to
+	 * be handled by the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
+		ctx->need_fallback = true;
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3

