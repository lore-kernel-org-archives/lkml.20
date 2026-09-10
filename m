Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D42747A87A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045603; cv=none; b=O8Jz9igtpja/ghB29Cp/LnNjLHgAGg5Tlatv4BFC2GexvWq9gStxOlV7ticcDdcJDuG2ZBLmYcB+LhnyoD0ng8VXOG1za0HeKwql9dhIhIHe0STTHnVxfunHdXwVDlBug4Oc08u0Fmrjs1qBCVqUrKlyBqEK4R0lNp9cgIqqSaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045603; c=relaxed/simple;
	bh=c+p6s9yVI0Yq+ycRUv6lRoOCSIgxZ5LCLv0Aqa3oIhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eBoz772zKJ38GUo+M6s7fd/NqEdTVenS4ikeKacFs3SOkWWcMbpNGBo7GSNBGaHNCxk2EFFO+E1TDWlygPyRPjoIen8czmd7TwfGbYj8FLa4zAXjLRR+zkUJ9tMMIMKriUAYjpNYbB0rb47isf17couTbaWWi7NhJihbJ93ZHJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j/zu8NBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TiiYIbR9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/zu8NBD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TiiYIbR9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ad33893069
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	relBmYOFO1X/TjoPGlxLYddWYAexqzPnTlPv4wKY+6A=; b=j/zu8NBDplKfFUpL
	TAoC/Ri+PfVEgkZSNvUVQSYHBe//57LS89YpLcbJYj5Q3SsmciFDRFZKW1dYnMpe
	mzDm2dniDmHzSxklPb5WOVIWpOJYCxWR6V28eotCG1a+xSR6x3xSo/dDCG5dsRdQ
	ZC4O1pz2wZYoM1u7F7yuVT0z15A45LPO7WRAArZav6olBOSRbxYU2ecyoAzXaBcn
	qmxtYUzDNIp+iMYDamrPIWRGi5Xf7SCXTzTFM4EZR9APzhC2MCnXTN9VK55VTsjW
	sa18zBg4ew+NMOw2tillchvH3zHX3kUOzZWKQnnIsZ3bXE6trjuKRvVut5iT8VP9
	B/NugA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8rxje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:06:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93918756165so1229629185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045598; x=1789650398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=relBmYOFO1X/TjoPGlxLYddWYAexqzPnTlPv4wKY+6A=;
        b=TiiYIbR9+DKjvYDtcvQDljneonXeB4ylryd3sEz6i4G/CHDy8FdNkW+9q6rG0qTQWg
         YZkkIXLDU7EU6jZN0JkQ8FM7goWj+RJvIIRs/IWx4XgcmQiqxVTH2zjwkxZN2NKJSfXe
         eawT2XiP8Wmuy9jy8H4Ss3oeWOGsX0PMZw7BBtom/1xDI4pETg7OsfZVxg9nYdoqz0QX
         LJfS8XSz+gJknA2K1oI4VUejcVLPy1pKrq/C/74WZ7zn13hn2X3El50lPpU2NMVj6oow
         S3TZslW51IY7b31lulPI9AXMorix3bUnb8tthv5ccsJy9oLLT042kx1SzMjxETjDDIz+
         W2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045598; x=1789650398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=relBmYOFO1X/TjoPGlxLYddWYAexqzPnTlPv4wKY+6A=;
        b=a3mCGD9WSm3J6Eiu6ib/Rh13fc8tDkOcS+6FKNOzmywaKLHck5D8A5togT0h5mERbP
         Ffr/6fxnXhXWYNfnYn5WRyhPE0j994DtfQSR3mmN5yKLmocAkWr5Sanm/WuZ1PlS49J+
         raGz//VNYGKuUOD8rAVKv1ybB8XNfWwc9WjXw1Qs+RP3Tm+Oqnw0mEVEGR3nTct9UX+i
         IIW1j4G6Dpk2tLeeDfI1cBatiCLzS6mSITxwcOBgHntZNsl4Fxcn/PA+nYSz/CAa/7Pm
         nloHrtkCYsxCgoEy6M3zdzVne91OD5bDWnpTx0l3EgMreDtrMlyRzfNRctks7BOpoE+X
         SMqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpiQzIi878wYsTooyd0CcXplT8lxVblInkRSF0syw2LXBtOoCOohjuA2LSTgmtX6zXf/gNlv0Jvm3+E3M=@vger.kernel.org
X-Gm-Message-State: AFuF++mauMMnrVF0yVSKD8jjybEZF/vAO874EceLx/otHuNXb2Sm2eaf
	Zs9GijagJMzPjE1ctOmccwnkf/sUbwiohDrBZGQsK1IEYACfGar/U6H9CxO8Q2VWdHpKXL7Sn8S
	J4i6LArXMHk8XH7BgNNSkVCg0OowovSW3uSmCLeY/rQTA43Kqfqa1mjOm9bfFItdTivm8S2nJm4
	I=
X-Gm-Gg: AYBFou3u+FWzoTeqqoSN5KlbD5RRdJCK0h92rDQzJLqcqG9REMbK47k7YDQhDnrSQFn
	lNP6ZpvP9NcNm0+Myk53mfSw9KnuGkK9iiiOL8Nkks299PGOq0zMmqCD4PCtgAg+/O6gbNVghCp
	fStXabfqjK3KWmh17wvg34zIeaIo6oNRhz7qx/kn9Etjnlt1pE0CpJjFMDWnScRhNOVh+l86ab0
	cm0lcGF7nwx8phkj+FzveLQTowzx+N38ZLjM7YZ6eQgt19sgwL7vn3cQu4v682ncNcNlY9ZyzZd
	NqRMkg6aisLzCiEen3byAzJ0upt/VdK+0Bq4gnwfNdgeW1s5Qowi7RbnA9SwQG/D77ZXEO2KHVA
	PSQXz0m6VmCsidx+tC+zyFsavxgYM
X-Received: by 2002:a05:620a:1a19:b0:939:8856:d8d2 with SMTP id af79cd13be357-939d4a464c3mr916072985a.25.1789045597768;
        Thu, 10 Sep 2026 06:06:37 -0700 (PDT)
X-Received: by 2002:a05:6102:508a:b0:785:d308:cc2e with SMTP id ada2fe7eead31-790782135b2mr3092851137.9.1789045291582;
        Thu, 10 Sep 2026 06:01:31 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c9b1:abfb:f300:5e98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm831849866b.25.2026.09.10.06.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:00:49 +0200
Subject: [PATCH v7 08/12] crypto: qce - Use fallback for CCM with a
 fragmented payload
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-qce-fix-self-tests-v7-8-cdbd2718af14@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2908;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=c+p6s9yVI0Yq+ycRUv6lRoOCSIgxZ5LCLv0Aqa3oIhA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoqoRbRuzkoShNdtafGIAgnA0xnyF+lEcp06+H
 kgD2ZQkLDeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqKqEQAKCRAFnS7L/zaE
 wzP2D/9hGuL67BDBK626TexNAQhxhQOnt3xU/y99CgCzBWmniHe1EDoxiWB76ijWDYnK747FI+k
 IO7qzuXvb1Foj5AIuSK0Pz2SG5PNBUJbYcYH5zdcDAwUSM14bvjp09Fl5ptswMbH26GRlsODQzc
 Su56Ayh8sTqVIQa0s6VQM0ZDBthULVt8Bssv35qIElmbr1apZH5yjuoG3Jdw2gyEreNflamLF7C
 t1fHgRXt/gHEXtO8hqnMbfDrWGaVImdamkDEUkIZSgfVcFn9bMlV77uOv2QbcAUjb7tmWFrx/3N
 c47YTXni1YPv7E+oFfB38W6UPS6NnS0kL/9yIuimyojopjkeI7baUu+8KydaWvEH7fDmEcO/YWz
 c7liyBbY1tZWuFuy71GQSh+fWLaYigze1Mqh78IsJPqrRadfxpmj0ue77sMo5madqR+DuSw8M69
 jEuWER8BOOlkLqZ3abvl6YZT1iLMnwN+M+OqBIvxVixvh7b7SSl183xvqzPDMflyOA5yu9CJ8jp
 dVgHnbwgDIrfTume4n6SAyuMWR76VpQkgZiNlD5cT4TL7jrIWoukQ2V5sJnWtcGM6kZTyvHn0gs
 cg3eqiTPQ+XBnQyHziymbJTSsj9NhfWeX2lVRpQuOFFGyYMqpWyQnJe06kwD88ytRq8fKcUEyPv
 bKJTCYgwQmUxP6w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 8fvXEUm5fHFXdB6yza6f0ftCvSI7D7dH
X-Proofpoint-ORIG-GUID: 8fvXEUm5fHFXdB6yza6f0ftCvSI7D7dH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NyBTYWx0ZWRfX4XoQ6D5lzgeB
 WeG3kF2tM8o3yzoHMhO4E/MW/zh/dQC+1iFrLEuzEkoMENHWAlGmC/Mzx7mSDVWoqnJFVlTKt8b
 0v60QbfrC5U82Esdcp9ckOUH9KrZbAkOWfgN2CkbYMw/535okNZtGRlUnWCC9kk7qZgLcN5e+eh
 h3cma75UjsF8wiJvR8WE1x8t53tTA12U046ot3R6n52tAHbYWIUE+iN+SX3xcV4kM7J3TKJwIzR
 IpB1rjbURyKi+uZaIoSApCtGDao4keCWpf19XRNoxvfAb9ecUJgWUj7ZKP+H+CIMVC01m61kO3F
 QQ02UsGgSJ+etnyec5jBtdpj80HVgdT1X0Ps+WQhQqnCtytmzIpiCWGtC/CrN34x2/bBmn2+WUE
 TVjoDjvRYhy/iOigfbeEuqZf658r/hTwPbably5LzfA7l6zoCGMkzBv3PbNaK3EmwybhpiHhscv
 JTgSPX3KDi1+RgZY7KA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NyBTYWx0ZWRfX4ehSYflVeANX
 KkFWdYbF3iwuCHtzUlZm9s+q3twE0o91v8Q3gMDpnA4olgXudWf1WoxTZGz+uAT1cKod2tbSFDD
 5uIZ/iiHDXPD86anamYs+DDBlP4U60s=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa2ab5f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=phyxH6jkQibGXiXynFEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100157

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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index ddae743903229f248d1dc7037c4ae78537476563..bcd505579556c4d54b793d280a6a7f819ba573c9 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -498,7 +498,8 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	struct qce_aead_reqctx *rctx = aead_request_ctx_dma(req);
 	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
 	struct qce_alg_template *tmpl = to_aead_tmpl(tfm);
-	unsigned int blocksize = crypto_aead_blocksize(tfm);
+	unsigned int blocksize = crypto_aead_blocksize(tfm), authsize;
+	struct scatterlist __sg[2], *msg_sg;
 
 	rctx->flags  = tmpl->alg_flags;
 	rctx->flags |= encrypt ? QCE_ENCRYPT : QCE_DECRYPT;
@@ -522,6 +523,27 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
 		ctx->need_fallback = true;
 
+	/*
+	 * The CE reliably processes CCM only when the message payload is a
+	 * single contiguous buffer. The associated data is linearized into a
+	 * bounce buffer before being handed to the engine, but a fragmented
+	 * payload makes the engine stall waiting for input, so route those
+	 * requests to the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && rctx->cryptlen) {
+		authsize = ctx->authsize;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->src, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? 0 : authsize)) > 1)
+			ctx->need_fallback = true;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->dst, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? authsize : 0)) > 1)
+			ctx->need_fallback = true;
+	}
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3

