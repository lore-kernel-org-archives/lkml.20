Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080EA4FC358
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417714; cv=none; b=Z35ov+jDj9c96p9izokh0E7tGBUIUTlPHW0sCFvdoXhIjuVML2oxeH/kkKHuQREWc3RrYkxZjPwH3xNoCdwt7haqq3fSZs04xeqJSchMPuPnFEULWxKUUolOROp6WnFyzFxCBCYU5rFKggK7RtoLOplKTlcRUeFoVikQrN41coA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417714; c=relaxed/simple;
	bh=1hMzuROJV8vdtq+SPxtxFWcFHZLQfN64YbfzueOmtbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YRxLYmzSgnvsmmIxhoAdXMjXhhKFSoeFHPTm3KDvoCUlCrGbw1zXghVbO4idcDGM8ZzaSP7hkhmlxPkII8jbdOWAhWWjcIN3Ad4jDmP9lA6kpnoe5e/IZZzJP5u+63zXBabymEteEFkglflPYEdwX6/YdyZotmjhR+kfte8wvxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=octoAkzr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iG1MxK0j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="octoAkzr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iG1MxK0j"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P16Z2042040
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8MQmVTCoCCyaLYdia8eZ2MhXz2oL4yullhOBRKIMS4s=; b=octoAkzrATYM594x
	o5fjh6aHB0CI/s39uHHJs9XbOBIVK8vV6w7rNiibtcg3KYz6uu25AB5rdz+6Kprf
	iTDfSeo9ez1vmy7KiWpRHsvwucFQayCYNu9JGCJObHBUM/T66iz2YYQZ7vE09Mpu
	M8/NAOfTcj0IYsz94xfUun1rMxiwearodti69J316yyXicsXuLFKmJ1SJqHQqKmd
	42XNZ1lXgS1oFKDSK4oAHK4lt8ewwCKcvO8vKgOhmczNtWSoezwDOcw8l1QzdNhF
	GUF/jkHvtkOxqFVu2pygBHEeocYA5pgoj0AQcm9Sp6ZduKuaCZqTd/VGlirO7O6x
	WAYHFg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur303q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:48:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso426095685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417707; x=1793022507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MQmVTCoCCyaLYdia8eZ2MhXz2oL4yullhOBRKIMS4s=;
        b=iG1MxK0jY3Pn0m+QBM0VBeyuqeNvBJQGMqw5aymdGBKdcUKRomRYzr6HX3QoNaEyB3
         oGX8i57DWjZrRZ1dFD2AiHBIL7Wlsfcw8Whd/NokQNerSiG0lN/caAouUaA7lLp/24+X
         vm7yEfhUlIckp/+Rm/G9Qd19YJNnq8ImGBfWrjqTGYi6z3rYPmZbQBcpLLu5qiI1Irth
         KDNSTbJ6zTTqfM+mTP/fFcOY9OsZ38sJcLEj64QEaLly35eHg5s21NsGBuhNuDO2WN1v
         oBhV4sHs/2+JdJJsMTlRfu7u0BH6l4f09F0aOzX08pzpbM83Bw+ragHYn1/V2SFH5JoW
         Df0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417707; x=1793022507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8MQmVTCoCCyaLYdia8eZ2MhXz2oL4yullhOBRKIMS4s=;
        b=UUovUdBqPEQzRXQtVDhc3VLGvW7itNmSm2cOyhntxb8MF/7r6Z7yypIzC7z/F5Iu41
         0M2oYgVujqIF70OhAcsOKxrzAibfvkkvXr5tm17PkzB7a3/BpRHOj0QelB9t8GZrFqZq
         i8mThzT2bwv+6eC23T6zFGY3Ent+ccmNeGEYrxKkryuEzWFUEXQSc6nXdZ5IYPk3m1rm
         3BsdWTFnXQXsqzifkCcvLtTCWxLasX26ES3cMS7s7K+ifDxjbZyaLQ7ebaz5Je1IJS1P
         7sJmO+nWGGb5zHQYrMhfx5Lc0G+XyVEiQkvRCb9+h85eRRIpmmNnGUIq8iMJoHJZQ/q/
         BHkA==
X-Forwarded-Encrypted: i=1; AKwUvByHlheki1pYNC1uI2NTIsMWfXZcovpcpP6QwkGRAysOKHL74kQwN38+dafObw9MePXUJo6gDqpfLzbVIo0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1zry687Hw2ivvhatSAnO9/zRl3XoXlYXpqSA7JjI2Kt3SrSUa
	jb0NxhhN2UQe7ew8oCXUCA9E4SA75kb+aOK4H4x+D1JjZ03OFwB/dizhV/Mb5ADF0iMlbhohrdC
	NK4SlY87tZCRSOcfHz31zBlfomqzvzkmifTOJ85fMydZ6/C0ivzdtF/s/nWHHqbGEb7g=
X-Gm-Gg: AYBFou0hBAT0Uv2MKE6MFLwgLtTX0VW0jq22a9vMJMpBhe9ssJKlPm1qMhIP9O5q8F+
	zsxqfbx6kzFI/N/OtvtoMLs8kYSIaP+qcJsKtyoOvS9PJ/jkP/fq9JF3B63zB4jyVPvHShJTumK
	r0oZ5uyPpcDxT+kahsy0KE8lLa0pDjLQWNznKCUMRf6gCAQf6NlbtOvtKkn6lPZxIspO8qCt1Uy
	BksiqMjHT1QDdmzP5I1kfNr04wcKw5zNFKEhKJK7n8AogMPfLs/eJyj+snJnuVaAZYmpYRjvUnA
	cUJQFirg4supb6BWPByxWLg968VkoNE8xoEvxBRQTGgb3flrrAKAwRwJAqwt43sY/B89ni+nwbp
	Wu+WEX6ZaeaMFzk5fiqzrjOahVQ/T
X-Received: by 2002:a05:620a:708d:b0:93e:96e0:25b8 with SMTP id af79cd13be357-93f29d3983bmr1284664285a.42.1792417706877;
        Mon, 19 Oct 2026 06:48:26 -0700 (PDT)
X-Received: by 2002:a05:620a:708d:b0:93e:96e0:25b8 with SMTP id af79cd13be357-93f29d3983bmr1284659685a.42.1792417706244;
        Mon, 19 Oct 2026 06:48:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm20595574f8f.15.2026.10.19.06.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:48:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:48:10 +0200
Subject: [PATCH v11 3/3] crypto: qce - Use fallback for CCM with a
 fragmented payload
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-qce-fixes-aead-v11-3-11c55cc7a695@oss.qualcomm.com>
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
        stable@vger.kernel.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2870;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1hMzuROJV8vdtq+SPxtxFWcFHZLQfN64YbfzueOmtbk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq1h+hpWfGBIuia6d4nh65sDa9I1HnX7UAYTmxX
 Qm8J54iRtaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatYfoQAKCRAFnS7L/zaE
 w/PGEACl3i46kg1CwlzXm6p0G837vMiZAHNmWcJ9otgezPC7qpCJS5XVeo59XpfZ+0VoHuRAZUs
 lVlhL7+Mzj8AoNHkdaLRkKuxHIRNt2nQNmZd0OnMXBHHceMcvrQmFYak5xuE0/dfT5ac+A5bZSs
 5O8t8r9itJ4ozXLrUpwyiieTp7yb/LZ86a5PGx42L/deEhWkB/UWNN3y3dy53v+BVqSLUjsWjIJ
 ahIP7a3rCfbUHW91vuQ7kdcoLH7WVmlkOyL9Cxd+nGqUzqT/WQJy/0UYBWkKPTOrIh/RZ4GeVe0
 HUy4Yii9pS2xuDJKk8cboV7BaE6lBRaoYnhqzoyqgy1sA2K8836OcYP9QzQBEGi7R3BMlewL0GH
 mBXfFwzavEeOqY2JRsvjeDVWqOa5e4CAt05ghZe6OPeN6RTJM4kCfpUrMkLxoTJ8TcPN0BzfLjc
 gsx86zQHV9YBgH9vp4TdSUA9sBbEfvughVTYc1PN69bpUwFiOm0Hqux945Q12ZbK0EoOtm62Hwk
 IIgFQKPv7/dceFXCJzW28u2i7d+X1fk+rqG5hYCdMv/iPI4ZzCoc4pEjazfJYojoZG6OYrakz6Q
 D2gA8CT6L+JiVHJ50WkekWRAWAcuV/I/weDSjFDpbcrBLApNQwaiHX5I9uxEoHyl6zoaCI15CTI
 pAKLwAIQIRk4IzA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX66urLFSXwUzk
 JRjuT9vgIHcOeB4UsdFKqUSu0ARoPT8tjqH7/ZCyinmYZvCt2RS6vSbsjrTfE5+SFbK61l46PvU
 9XqZn7pejSR4Vp+cj+J8Kz57eONcdJw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX+/ZvNtlSEd7I
 qpbZF7vcYZu/wvAcqCd9g4YP+AH4A/pijjN9xs+C2lZvAx+h/FcQWlfSye7rScDIZrmJ1wm4iHF
 iq2qrzq+2fiCZlKkOolIZFVGf7CuNRMB9r3B3UG0vLbul/7LGh/kiTsWfqa70NrOu1Gj4mlwfIA
 B80LeIBGIXugYGGNA02EUDSx1Tno9YEL1BjGVBvlpa/oY0dnSKO1TIl14cWIsKo70LzGlaVcKmT
 6cFWi0bBgaI37iRpYIK9BHfpJlrKf4VeXzzFmave26QnN16R/Jb8FM6Cz0eegxRXZgD7La2WLbM
 vsnfyuXznM/oIcz9h/YI9Zozgj4SWsXJLiyl1wN60AXnYIuMlV12JFGEIXQMnwBF3xnou73480e
 ilzy4mLWUgLCMN4LCCSKxHE6mt1fd6HE3BgKRjuEj+LIEHt9tgqlSk6dolXh3aIICbQ1YYwM09M
 WiaDmfirh+vW42dJlfQ==
X-Proofpoint-ORIG-GUID: kXmMmffgp8XFz4okiwKchq-EFcDiexdw
X-Proofpoint-GUID: kXmMmffgp8XFz4okiwKchq-EFcDiexdw
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad61fab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=phyxH6jkQibGXiXynFEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054

The crypto engine reliably processes CCM only when the message payload
is a single contiguous buffer. The associated data is already linearized
into a bounce buffer before being submitted, but when the payload itself
is split across multiple scatterlist entries the engine stalls waiting
for input and the request fails with a hardware operation error. This
was uncovered by the crypto self-tests, which feed the algorithms
randomly fragmented buffers.

Detect a payload that spans more than one scatterlist entry (in either
the source or the destination, skipping past the associated data) and
route the request to the software fallback.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index f34e4feb3004d9bf63c2c8b2aeb3975d86ac486b..ecc33570804fa435db9ec9fd6fbf38c3c8708e2e 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -498,7 +498,8 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	struct qce_aead_reqctx *rctx = aead_request_ctx_dma(req);
 	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
 	struct qce_alg_template *tmpl = to_aead_tmpl(tfm);
-	unsigned int blocksize = crypto_aead_blocksize(tfm);
+	unsigned int blocksize = crypto_aead_blocksize(tfm), authsize;
+	struct scatterlist __sg[2], *msg_sg;
 	bool fallback = ctx->need_fallback;
 
 	rctx->flags  = tmpl->alg_flags;
@@ -523,6 +524,27 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
 		fallback = true;
 
+	/*
+	 * The CE reliably processes CCM only when the message payload is a
+	 * single contiguous buffer. The associated data is linearized into a
+	 * bounce buffer before being handed to the engine, but a fragmented
+	 * payload makes the engine stall waiting for input, so route those
+	 * requests to the fallback.
+	 */
+	if (IS_CCM(rctx->flags)) {
+		authsize = ctx->authsize;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->src, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? 0 : authsize)) > 1)
+			fallback = true;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->dst, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? authsize : 0)) > 1)
+			fallback = true;
+	}
+
 	/* If fallback is needed, schedule and exit */
 	if (fallback) {
 		aead_request_set_tfm(&rctx->fallback_req, ctx->fallback);

-- 
2.47.3

