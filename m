Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500435;
	b=X7Ueqo77DCUfYIsHEG8Uiu1H7GWIM384P8Lslbcl/loL4hj2oIgsEk8xymCsHEHTd05a
	 Rjsxij184y6a/1rgm886gxgmA/+HSN4yBgyj+wKLajYYaMMc8zY1//9t0Uhl3q/fXm1o0
	 zfm9+rfxSqg6lkd7Ow0NV3ViiIP5tXmNFzSWN4YdSYh6xloLQ8etFYrEr9zD7aUMuysSh
	 oAyo6+tMFWzwSIelBBQCAJZ+C+ig/ITSJb7c8+LwWahuiBXmvtIPNoQ0f/ykO8fVOHW0g
	 G/YCJnbnjxc/VALXD9QauCw6yu4StSxR7qQv0Ll6xHyv3P+RcgVj1dnsSnpP/Mos01A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VhmPApzpqUUOJORL71gIc0bfD6Q1gAcbmooPp/GkGBk=;
	b=1quybn2TR/yERXVUC0SgbtAT5wFvGcD3HB85CI0vPe4JEBZGtgEiiHggM8A4Mf2d5hhW
	 jhyNWxyyL5NmT96spBn18l/7CInLAFcDR08MDKzVNsRa+VzgpytT64N2p3g/SkYlFlEFQ
	 1grYPrlwtmNQWGwlAalB0DvoI7pcMnUAvm+xMd9FKLnnJaB2jK9SKDRAC6Vb1dC/f+GRJ
	 K4U3eDFVij5+qiC5p665LxxIEBEUPP+vncPR9Jhc2O2SEC6EzwQVAToN/uEXpwiDp2VUC
	 1cqfudR5ZjHxXrjq4vcjj/xHnaLYlX+KjIY8QI6GmIwjEWqDnZETGWrg49BUg0X7Lkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TumeoADA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P6ToD8an;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A407060A2614
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A407060A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TumeoADA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P6ToD8an
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxGWb1292842
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VhmPApzpqUUOJORL71gIc0bfD6Q1gAcbmooPp/GkGBk=; b=TumeoADACBM9hn1g
	S/XdQUzKNy6oQggwHIh2PyiepP8FYc/bMKAJzyHzR7y0Hbi+1fdH+DlxazlPWHuj
	bIac/RhDCiBYWF/vEexafwi99C+lqhzICogK7cv3FcCEl9ix7D8Rvim/DC+PHKW+
	97O1u/SpQKP2lWhYFgFzDrayAN8rYCAhuuniMLo5fnMIQrQ1nVrADzMpcdkgGJ4i
	8g5x5PhY/fiosxZixbycGik1TFvw6cTEkFyBTXrftyb1YUQ6LqXVQaBb1sAgbWDR
	nUtTSxygJaQl0fZtLChdMTlPYOQ1WVAbuzwJBuuEVIm8p9wceSvKWlNhihH0z9KR
	QsK0FQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2gfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:47:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso122585885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500433; x=1793105233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhmPApzpqUUOJORL71gIc0bfD6Q1gAcbmooPp/GkGBk=;
        b=P6ToD8ankuKVcE/bzo38RuSl+KD6Yfw7VbOR8H3mDj0hejtMVp5N3xKLR48hQcjw4i
         vUDprvjPe4jzMVUaMruoZXD0LYcnaNXOMVhEtI0KJ/6ULzXxueJu25zoj4TwXur7nZfq
         HSt4jEqUR2Yx2bG+XR/Tc2bkdc7ZysDgsmftzHRXZbrzPVAuCw8la25a2mqgmEU2Pbg3
         xiPnTpkIezeAdLJD6fo/jvqnJMZmupMQkC1ri+0DPwmDNNM7C/8wP/0zOrbgeRaBPKwd
         1tHW3NlRMy8QO4cigOJgEA4DAZWdts4DXIYOljIzUaNRxTa6tdXXGkpBX24AEsj7wgZL
         QwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500433; x=1793105233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VhmPApzpqUUOJORL71gIc0bfD6Q1gAcbmooPp/GkGBk=;
        b=Y6AKsB/HHX9Rh98V4J0qxs/INohs6fy5ORtJAqjoUWdh5X2z+moiKIewOO96isIiub
         emZvmV99LBQKQdJj+P5jFdMDDCxgZN0uEo+WYE7V9I0FG+5PjI+21Ef7caNOPkbDylrv
         nZul9qfFNlFu+pb4Tlvxtrn/uumrDYiMnCLadia90acwr/KR/5B/sIVZnb2/ZQEICDr3
         i+MkwLSrLGgJ0DsbLUOH2g1/1GeUm2QncDVPMr6b85CEnnwlN2MmidqMRaHOKAr0RRwB
         lzERDNG7ft568m1pIDOo3fOaxWqXY32FQej/tn1K5p/PKafkQrJ1orwQ5sDCIoMKKbAI
         kPLg==
X-Forwarded-Encrypted: i=1; AKwUvBx9n2CYP42WpY/66aIq96j8gVMKxuVM9CrwMA1OC6Qudp+3kbDN9gGydSHsVJTZ/IL3cPB5iAoVo+tHFTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLguCv3TuvT7aRwXLh75SnwPjH7Ei9X1o+S9y+3F8WB46OlAudh
	WFw5N7iHX633cGcDvnMcERXUu2S+H82WXE5k9XQRzX5ec3Kf/Wu4JXNj005bMhgouW0d3/TjLU3
	oz3NqEj/JAOGNaueIH+9MCCC/AqPBFOWC1ZbP8uGZnllB01KHJBuojtnhaE4fLx7fN8I=
X-Gm-Gg: AYBFou3m00FiMvvAoL+H3WOnsnvsSix7KJKFxPEl1NRSCy8wsPBh+xMmNzI7XpzSPc3
	WQMI//L2EyQyh2n1yk4iMwznBB3b/JRBYK8nKG9DB7x9KEL0fN4uVxsOt032Dwo+TB4sJTgZnMv
	6/gF2P/nnb44PZWZfwDoqyLFQt3elKbqfcRQwJ9Dhl/7EjxQtZuSWnOHci5SEIW1G03+iRdGZia
	DjpLKJoCciruD5+TxwqNkAOgZr47alJQHw7vwmT64Pnx7OJ04jmTp50dMg+s0pUwUeDmzMZWZLk
	3ktSebx5Qz/fA9yvHp3YMROFxrBJbK+3HdGXTIX9Sz6FOQyrg73GaUPlkGhmn9NdjLohg+OrkX+
	Lx9eHhTNIgCT7a//RJ6KexATFsKNl
X-Received: by 2002:a05:620a:4048:b0:93e:5677:317b with SMTP id af79cd13be357-93f4c78259amr308825085a.25.1792500432805;
        Tue, 20 Oct 2026 05:47:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4048:b0:93e:5677:317b with SMTP id af79cd13be357-93f4c78259amr308820285a.25.1792500432349;
        Tue, 20 Oct 2026 05:47:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82456asm6544253f8f.42.2026.10.20.05.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:47:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:47:01 +0200
Subject: [PATCH v12 1/3] crypto: qce - Don't modify the TFM context for
 per-request fallback
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
Message-Id: <20261020-qce-fixes-aead-v12-1-77a2e09abd0c@oss.qualcomm.com>
References: <20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com>
In-Reply-To: <20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3265;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xsSBbPvqAQyK02H46/Up+3C2Q2SqMXYABogiTIJp0B4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq12LLRBQwpysYR6B3Ax6J4d9HA8L17bSGHAqR3
 ToiDVerpE6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatdiywAKCRAFnS7L/zaE
 w8DpD/4lQI8vV6yFYg7UeNNkqFfCfbvoPNyHeEE1uX0wS7pFWVFoTQV6IihlRRIsRfsHJYAdV+h
 qOqKuAeCgVEoEnp+jOexstDpQjuMbCdyLweOTiMaQbMpdf+0bzCJy4AqFJxO0oGd345ZGP8Btnz
 t+J/rp4/h4Ro1Cy/eB347I7Yq1ztAjGAnVRjibukr260nhQxx+iaVrbjckq7r9bn+g9DZQVUZ48
 dXr5eETgqOrXi9RMLCcttSjyiW8ssl8wc6lyOMlvTQkX7Io/MW5Z4FmAxcnR2Yu68xEMwaQUBZe
 /jHb22ffuCzIFnh02ISvRFk2jr9qoIPlEMH7OVStLmkeFvlWFAIAmCMX6c7xbeGQbHlSDXCZy+3
 1sQ/DXJyT7LHNc+cKCC+qkMeuYWC/aP65pBkWZ/8/ytFwg8OGXFAGgE/rtBMiqtJ092oaJwFQPX
 NGp9EnpMQod3DOtp7eRILaW5z15EuLTEuKukawyZXiM6PAa2N2SjB9Dr+xYjvCr+SzwvavNSPq5
 uv6hC4mOKdDjIvLNcBJq06aa9t69FN0DxBnumhnPU7SVWh/D4avpvTsaMRvVNMTGqAV31l0EMIE
 GfFKhpo2gai9t+9hBtIYh/Zl11WKDyA9hVQMS6EPzYlQ5s6BDyHLunn/6/pFAHYw/mBTOD5eRwp
 agPRAAUSGEtcUjQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: VdWUqTirhrrI2CeVfQ10-FIZBtwJGQxG
X-Proofpoint-ORIG-GUID: VdWUqTirhrrI2CeVfQ10-FIZBtwJGQxG
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad762d1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=L39wXrjeY-JAPnv49qwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfXxUuCkZ5PpOsD
 a3KU0+74y09vCniC4et5R2htmPMajLhUZzOGVR7qhsJUgOuYWLlhqyarHtPwQSpbKlo7uLxtqIp
 9kbUhvrOhBi1lKzrI1A+G4Rl7m5OfILrtumml9luhufCsshZJYGSLu+qry3m4MZTXZvE10GUEHA
 7iypvgy7rxcsaH60Iffv94p83JsqgUoiNsza9H5bjjepVYv7T5lp32O3DoAlgFQDOFBK4GOcP3K
 ltT62NM7kpq0GrkZ3hlB4DOd+veDvzYf6khaRznOHKgQVT80sOARMEH7qVDrGa+VW6EK0KiCPCC
 035prdP/Fetc33r/U9w7orgS1TXfkcL7yoms+ZqwloOLlcPn2QQ+4npgvZX6e9tqqSg2TvXxSu+
 hQe4c5Lb2JPMPVp/hqRipyVPNKinWYnNCYukFlEw0QPQ5DlyNNKM8jZvzS61dAtjqCRTaaOYp47
 so5AgoycVoIg7HbsSFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfXx8i3tIeW3xnM
 AWTIGdckIVqUf8Nb3/bqOQySPPpmjmMljefFdtAjxJU347ywpvSQF3hK1+de/0CURMRKky9c+03
 kiqprYxSEEcCwCOrXs1QPzxYlzqHMVE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200050

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
 drivers/crypto/qce/aead.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index e0061bfab216861444e36700d6530e7a3cd347e7..b7873852249dffeb91d09df3bae6534f77c08b7e 100644
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
@@ -577,8 +575,7 @@ static int qce_aead_ccm_setkey(struct crypto_aead *tfm, const u8 *key,
 	memcpy(ctx->enc_key, key, keylen);
 	memcpy(ctx->auth_key, key, keylen);
 
-	if (keylen == AES_KEYSIZE_192)
-		ctx->need_fallback = true;
+	ctx->need_fallback = (keylen == AES_KEYSIZE_192);
 
 	return IS_CCM_RFC4309(flags) ?
 		crypto_aead_setkey(ctx->fallback, key, keylen + QCE_CCM4309_SALT_SIZE) :
@@ -606,8 +603,7 @@ static int qce_aead_setkey(struct crypto_aead *tfm, const u8 *key, unsigned int
 		    authenc_keys.enckeylen != AES_KEYSIZE_192 &&
 		    authenc_keys.enckeylen != AES_KEYSIZE_256)
 			return -EINVAL;
-		if (authenc_keys.enckeylen == AES_KEYSIZE_192)
-			ctx->need_fallback = true;
+		ctx->need_fallback = (authenc_keys.enckeylen == AES_KEYSIZE_192);
 	}
 
 	ctx->enc_keylen = authenc_keys.enckeylen;

-- 
2.47.3

