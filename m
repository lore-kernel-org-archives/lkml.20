Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202814963B3
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885495; cv=none; b=USwCJluUyIWxIGuh/JLD15wesMIgtlL44RefFKG0mYTUWkZQ6yB0cDbEMtId7nJaNe9THYOwLlPvPqwRBq+sZ6FuFOGMQpAlshveEcyttM9bL93j0ecCZORICeSyVXPkwsrRdH/oP/NK6Gvc6KFwfZr349a6QCeH1MgmI+0YO2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885495; c=relaxed/simple;
	bh=o2PLt208rLJX1I1Ev7CtiLH+CY+pRMd25u8UBju1Wmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GDap+TymB+5l/bkcakWoTqbXLzHfeyAo3DkT2V6tFEx5x+t8OvPDJXSkBznN1/2wTmZVBM50DN+rjqrcURTsGf9IDW0QvoebJgaG63GVnHvUH7DiNyoEzoga8K44Dr/8CHWsqtI8iJOhz5GHZz8KgRf3ouba/Z22WRjouxaBOsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8tndUkB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HU1SXrr6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8tndUkB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HU1SXrr6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8NZvo3907376
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXvlAkzFWJa0VY+9IClEkg+ej24Kwxvf5XUBwFS2R1A=; b=U8tndUkB63edaDXv
	sD05wREmauABsI4wh8KHBeP/Vn4KyFXztX2EVFfHcRP45sZHFCOwue2qmfbYSPsq
	8gy5FuFX1Ej2AuhwfyQZ235OaFtQ9nbF3I9nuo5aRh2NksUmZmFqhCEXWkbK7lLH
	u/9Cen9o9nxzL2JRiMy6XIfVFBQ1I40aa4SvVKzHzoRb3ykzjvhqe05wStDrs2P1
	sGkJ39jhF+DeQrIHwJpjf8gHdi2ptHUZLZitsPWb+EVOTOKVCnCnIdsYKYnaxh+5
	WyBAShntYaBIY7QzFdnXCbq3uiLFZA2aD4bd2tzH0W/JdhzJ/q9uyX2f6+cfJoqx
	jyr4Lg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqtwft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b8c60c550so34451406d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885492; x=1792490292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXvlAkzFWJa0VY+9IClEkg+ej24Kwxvf5XUBwFS2R1A=;
        b=HU1SXrr6wQMFD2x7tOC2dhypNXykp4iuYgC/rJWOxwttQgAFZR6Lkb37ljIb78A/A+
         ZNgUbRAgKH9fs45Diyvp4B54pnGGncA1B/kzMs45MVoSMp3fELPvEPK02bbQCsk1Gok4
         a8j+b1CjIKphZZPS0SWxjX0cpSNfFBy4UgT4ARaLKvq/O0Pin6J6os9s82X2AhjDs4pw
         4/Qmbix6zapRiafBgxtaKF82xc9N02joL+ypKfBBvx85r+MsreWlg99llD67Gfyy7Iba
         swLWZIiy5ED2ytXYXJoWTaI3fCr13I2olYl8y74axOwONqF4uzjozZ9HzcUwdEqYSlQJ
         H/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885492; x=1792490292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXvlAkzFWJa0VY+9IClEkg+ej24Kwxvf5XUBwFS2R1A=;
        b=c+ctb4LD0yNNnkBS+TmxFTN1xZxqyhBNg6mswkQt+UDRle6UP6AnVpHYVR9u5gnFaC
         A2YACR5hZcKh409z4Z2v+nPZKUN8NjLesyF1Av6g8O0EtDkrivk9w2jFTWNUBx9qsXHa
         /7YcJ4j9W6Mf/3eUF/MnqHTA5/RMD1jf8LIEqLDZ25Jdze5djiUt8uwugiu/6oSA6L9S
         kosBxcmmWZ2JCLvg+IKVasZsPGG+XU7Gf3+DojSDAMy0B0CqLm8YG9GEqjZDOr1QzgJ8
         3mypfyEzWNhIV7T9L8rpQiMLCI6vMdbscU9zJyepztme9FJXua8Kh9nVCii11bfYmZFZ
         YkeA==
X-Forwarded-Encrypted: i=1; AKwUvBwZIHJwZBu61VShNtIZfPkT/3zjVlrLrEURPMoacyX61+j6c12bwNrr1Bdc0uvyNzKqnL35rJRkW7i7jF0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPibMi87dkS+pmNGhH5gQRlarZvfLpUp4XGzOMmcRvaHgF05KL
	1u5864Xnw9gTcMtTKahV2bsXOAuQFBUzHNPP2XFRnyc3tSGFoeN3qCo1bI0/bx4rtaTWUpk9Kbh
	U9EetqjjfVT/oRqj4XAqloEwO0wjeG3WSfcOxlq1cBBLrXzVeWTSjdP9lT8q91ppvwOE=
X-Gm-Gg: AYBFou0uqFQfbj8K6RnhJYRlIDyvgQ1LfbQVgDv1jgydCEUB4kBmYQWEg00RKQiaGv7
	8GhlQ2kmNZIa9ubg4fX3YzdlYPPCgNApbKaivV2iVQu0g3kCxNWTEH5PynH1HN78spaz9sMJ1p6
	Xc7c70Y0stxAA6oFrtJ3ldVIrIFewv4diz6gq4W/W/tKN4yxzdzpMlvJBV1TpIP+T7QUN0ramk4
	Z5/MXs3clycVXuFUarVtW4+FXfzp06QdYraqUPqVjWrxj3b8FHQL0LiggR1sJk2lOT6I6Nnw9oP
	uABpoOIQWlF+Dkl/J14fohZTOXbY+CRHjf0JOAln/O/H474XZgdFUH6fZBoIBa9KzPGdAiAgKEW
	HU3r/Z6WSFF9byg6daEL8GOj6HEYm
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fe with SMTP id af79cd13be357-93ec12c4aa8mr1766957285a.75.1791885492223;
        Tue, 13 Oct 2026 02:58:12 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fe with SMTP id af79cd13be357-93ec12c4aa8mr1766953885a.75.1791885491701;
        Tue, 13 Oct 2026 02:58:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:33 +0200
Subject: [PATCH v10 04/14] crypto: qce - Use a fallback for AES-CTR with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-4-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
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
        stable@vger.kernel.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=o2PLt208rLJX1I1Ev7CtiLH+CY+pRMd25u8UBju1Wmg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCdyS0irkJUuouCdhrrlVSxeOpNfphJ+mMZT
 Z0BSI+5n9KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AnQAKCRAFnS7L/zaE
 wzqQEACh7NqpVgqvOFp/vxH6ipDstZLUdS0Fkk/8DS9bZ2/zwSFvyqdxFcgBCRtxM+Qsz2oCV1b
 /fL0RLZjg8VG3QEdN6rEi5y2+e9hBFyXqjV44HwKNnS1PRNAZm5wkJu/qFuhZLDBZTI+PzAwpaw
 AJHY9xQVMgPiyIXnG+R5EcEoqzHZhk8xRe/cxHPQ8T1sKGm1/vvclwFKQWzCs6IQgPU6kmeZq6q
 IfDv+jIzjoQRtLxeCpcwSIpZVot1N6Oa9iDqcdwfw4ZX3cOAauzILv7z6fQxmmUidlhzYMBbWyB
 V0b4+Ix5h6j9jHGdmN9PeVQnh9TwUUvDOHXvvfui3wcCHJlpiFUbEqErRj6f0wuDCAEhoL4HGZs
 am5cX0f7l2dWXKkyExRsezNds1KrXxBJT14Ld6caU0tFumy/kzOimV3XUEZi55GIHNyJL+KHWzV
 c0253hxjMYI6R+Qgkjy1knkcZF7c9llINZhoNRe5FWVTxPc31lh0kS3IjQLK7rtuD3+3x0bZS9m
 beKOhfx/c512WrQ/3erNlM3pWsa1REkb+ZkGTkCYwyeeAIIbuV5nCuubpF0aC6TxMiazswKcx6K
 Om0XiuMwXKNI32F5xc3mwyN606GcYdNfGXXzwK5pdQ6oNBxH2XQkh1ZjVxZADaEwcA4RCfcH+11
 asD6z6tkH2ESkJQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXxcHPYwqhvnQ0
 EidM5H4Uh98lUWw5y+QK3ITDAqfSjfLvBDQlW2REWNlFcokpPCYeKqQjBvN4mfxiM5it7USJdlS
 4WxC3fTUth5flP7/UmnK0RQx2c8rsznwS8/Kcq6XIeV2lrt+8ca3CwPs4xS+gSIQrbWNQjf3a4w
 hXRdQzwHt+AqbY17Dr4qdYTKJ8yhfPt/yhJi877ulBDt3TZx1nfj+e14+uFsWu9PHSvhlI7Ykqa
 eWzL02BuYyU5C+YZyedEtmwd+ImxMy5AkZBW0ilWt6XAvtqwXcmcr8P9NeECqNs8ok2lTHEPKZ/
 fxr6bHZijVO5XOg0b0rjPApXGVFqYVpFB8SJvKB5524OvLs+WqtLY5nOB6CSM1oC+iu1C4XB2yN
 meaDUZv+O57qqdZksvTKoIROt5r9gppIAhGQJNKqbW4guw+ego66ja31smqMnTMJBWGEz8i0aVz
 NlKfxkg58p1zH0/ikSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXxyX8pW+K4dwy
 tzVFthVJO3SxlUkhhEKrPrgbhSApksaTysUSzgpPf6ZeJ/Avz4ru/N+nP9hZBmsmog5nf1mVTO1
 iBnRBNyiPF/l3/IEnB6bt2HxmNCY5Nk=
X-Proofpoint-ORIG-GUID: TDbYjam3Z0TT4JBaDwBlg8ZNUrcddsZz
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace00b5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vUpbTSJP45I4i0_vGVUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: TDbYjam3Z0TT4JBaDwBlg8ZNUrcddsZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039

ctr(aes) is registered with a block size of 1, so the crypto API hands
the driver requests whose length is not a multiple of the AES block
size. The crypto engine, however, stalls waiting for a full block of
input in that case, leaving the operation incomplete and failing the
request (and the crypto self-tests) with a hardware operation error.

Route AES-CTR requests with a partial final block to the software
fallback, which already handles the other cases the engine cannot.

Cc: stable@vger.kernel.org
Fixes: bb5c863b3d3c ("crypto: qce - fix ctr-aes-qce block, chunk sizes")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 86e3184812e061943822928a805d542004347ca4..6c578bda8363c6656b61105e2c3c62b9ed55e7b4 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -252,9 +252,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * AES-XTS request with len > QCE_SECTOR_SIZE and
 	 * is not a multiple of it.(Revisit this condition to check if it is
 	 * needed in all versions of CE)
+	 * AES-CTR with a partial final block (the CE stalls waiting for a full
+	 * block of input).
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
+	    (IS_CTR(rctx->flags) && !IS_ALIGNED(req->cryptlen, AES_BLOCK_SIZE)) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
 	    req->cryptlen % QCE_SECTOR_SIZE))))) {

-- 
2.47.3

