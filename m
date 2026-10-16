Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894474C8FE5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159928; cv=none; b=I6WhGBJNn2KUJPQNyb0XtdZ/dI+n0bis56ey1tfvFpxwiyxUvVXKcuxdvR5p6lEQsnUNL0+nX+8AbVEp5p8YFmdXHcgr/Bu/bWG+ObrdxxPVuhRppl0b/c1aFYa0E3nLNcyfaL7hya/lTZtilA+FgfDdRh6B0r6E54K+vAS4S70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159928; c=relaxed/simple;
	bh=growEXKfL95i1OZPjUOAOaxVU0oFXi+ujqUIx6R/v18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZtsfSk+X0i9NUsV2abQpF7M6bEVgXf7yZhX6yLixi6nqOKQISYfYiaK5S14G6PSyRVUattz7TzaiFXMHHTSp1QCCKfAokAXMFYwmdId2HwsRropNq9z9ihcqNpxDKE9KpOW1Cz8R18pw/hs21bokmbYciIi0AoS7Ffbhf00NIeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQrMijis; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWJwS0nl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQrMijis";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWJwS0nl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5wRq2154006
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWBaZNLE2NxmhBfPwxyYxR7jIhcDJqVLs/QSuWULptQ=; b=fQrMijisiW15+juD
	LXfLva94PiPeTaNErMrd6kDWtX0YzBGWNNhC7K54HQ70jVbzJaGiC+csoEHUw9rw
	KTUC2hFRaHjX07oU6/apZCDxBAFBgWr5LuEzVjPFKcp4lDRK8PpDv4pLXTIUxQSa
	V6iJgezvq++oH6uXhnICuSTJ6AGq25caFlgcT3dEZTN3aVmZzOBtRAGD9SYMSeYE
	h+iWPOcv0TXAGhHhK4sMISVQb2DjLSWyhGMEUpNdTUjz7M8tYVtrGfpq3th4LiJv
	vlhyOac7/YzkCsWbjM8c6ezyQ9u7ewcgQfJCIafCiHA+luqUtEaPvMKBOefFn/Vt
	PQ+ssA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhumruc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:12:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179a2035a4so26671056d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792159919; x=1792764719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YWBaZNLE2NxmhBfPwxyYxR7jIhcDJqVLs/QSuWULptQ=;
        b=aWJwS0nlPMhVsDlN79l+H7Cd1F0KRJvb0zxoqpLmduJj9RH3CJi2UDYG1QKGnquHvZ
         9Keyl7x2vHvhR2X+6ELMVnc7Gy9SpYxHm4LtF1sX6emJgWVG3FtpbSwerUkGK/PbO0sj
         GMdUEcNo5uxfuYfMoyH+nUtZS/Ziwx7bXJoARvU6M/5ovWT1sJSY69yAnQp9CCpsAbvB
         dwHk3RcbDAdeQdU4fiR9YIpA4Kakq57nHbLIHXojK0dZP2e032OGwOnalA6Oslt+TkWw
         gLf2wAEqTP8ad8BRDnbKhOotpASvzxl/0LI8ZfJ7D9aQm4ZqaRNQ2wfiVVjOmYw+b/PV
         dJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159919; x=1792764719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YWBaZNLE2NxmhBfPwxyYxR7jIhcDJqVLs/QSuWULptQ=;
        b=hUuoKYp8Y6b0RWCJ72GuDFD15yzGPbQWkaicSevL7yGgv+dqxc8+7LlKyPH9i+istf
         6O4BoStSqyjaVUasZS8kc1EKmmOPc4cKeik0NU+e2m+BDwgmvEXNKYFPq15Gz+4j2dFw
         e29KifG6KNjkNDqqRIIs6itnUYOf4dAtZgghTTIYsKENaQeKvFVd27BaOB1bxYI6no7E
         vTD35A1SnDe8baDt/zvhiBiR4JBzKR5bnsrlnKTl2UeY6MV2FEMWxbC0jS7axx/PJqYb
         h8tkFMvivpys0a8inexZ5fFDu9o1XcWSZl8XQP48dk+VAMJZNJlkDFXuiPMQ80qlvtNk
         AKlA==
X-Forwarded-Encrypted: i=1; AKwUvBxu4TXIz+ARvQsmicrnZsbPdjyca4V8hoOPh4cmMCkhjSEG+S9yQ/O7VXHCYZl6oEOXFI0NU661vPJq9KQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLky3YX1THbpNkiGLmyYGoM1FVBM7GYjrtq58wtSXu/hnHoHTM
	MPlbsNoLJi/0r7y4iKe3JaTiiI8LiwI39fWqrUmDl/DlxqWTtYC2GVGKTgyNR07yea0sz5eOT7/
	sYrK/naSURU+4amc4JNVKjHb0ysVoMzYJBh4TLAIB2o/tWCRWhC9LqjgCrSNd1n4XtdQ=
X-Gm-Gg: AYBFou0f3qV/K7kV//U7s/gNSGC/i8l6E7D1i3G6ZiEsar6dalMebwzjdKiCa/RNyJS
	Qj9Hs/OEiMn2CuOEkGVuSu4Sb8KtFxq1ieunYxzbYmJb8IEGzg/mT9w0mMTKceC/2NoN51CdOnl
	NDsAeFASz/o3DVBo5zcPA0jgQngY84F6AGYHKRjvfijOaApOAgPItn9q3+SsFw/7nng94fsAacV
	rzLqd3kiMPNCVJQPwqcNpxPMr+kt5w3XVGtfmeYdMXFvyLtQY1meRr9wIuxyzD4/dFye05thAO9
	H1q5VMktYf81vQgUjYAgb+edqIZzzOqjCG4jW5cZCGkXE/+TwQRLDmFb8jwynTlxgwRsjEy2fwl
	HdWCxcfwHZdYpmIoQnmsXpeD5/m8U
X-Received: by 2002:a05:620a:460d:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-93f17fa8fb2mr547498585a.39.1792159919407;
        Fri, 16 Oct 2026 07:11:59 -0700 (PDT)
X-Received: by 2002:a05:620a:460d:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-93f17fa8fb2mr547491285a.39.1792159918844;
        Fri, 16 Oct 2026 07:11:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8babsm5760145f8f.33.2026.10.16.07.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:11:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:11:47 +0200
Subject: [PATCH v11 2/4] crypto: qce - Use a fallback for AES-CTR with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-qce-fixes-skcipher-v11-2-d13ddfe609a4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=growEXKfL95i1OZPjUOAOaxVU0oFXi+ujqUIx6R/v18=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq0jCoWfLCOU4A74xiIahuAFqOMrVNEEzNe38mf
 H62uAZckAGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatIwqAAKCRAFnS7L/zaE
 wwrmEACo1tT80qq86C7wP7y6yAx74Aa/SHZfhkQgklqsLYyoqNRLy8JFU1tW6LkME+cCWMucmkE
 1eioGn9WgzXIE3ZjRsff5ntnTjgE3Tl4e5dfdCC8W5zluevhP7hZvIG2UAia95ejB1s/FZJlmFh
 dEvfv7429q23bk0R7dE93ZF0ysQL68tYgkxRdpvI2r23QaPikIqra+P/KxtMJi0baWvDgJmHeCr
 e+H00vVnD2/x17xsQoH6nHW6xn1ga1tzOrQFxdWqntd6bKhkY1QdwwkGIDy+WqPvC0G+mHw0jia
 e5ooWHluJaBCW66r8JQ0yErf62x/sT2hZM/5760PvRukPJ1i4y94aA7WnFlhac5s1AosCgfDRtN
 KyOkl1SI2xpcZ34WHrbdEHv1B//Azq5bq10//PHec2M/w8ZLuJaO2MCMWloVPK/B2TpETTnCx7i
 SvPnv0OUw6zOAohpsJhz2g0Tmx8i/1MA67eoDAIR3/+hTQRlK2h/x5bd8PwcLu81yS0O6OS2HyL
 a/UphkjLDbmQDkfqqkXxNSuldiutFm3YOKyq0Y0AhC1TtzuNZbkbXyOt749/GC6f9Flzn12QWAo
 bzS4pi0B/csm+8+29uusXxZTVt0rONyPonhH8u2TqOv5nIwAXMSmWb5cQRYowkx007ytwB4CtIs
 Zvxqjwdh+2v6yag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX1IBXguJ6Rcv5
 Ytsvv5KIr4IDPmS8NzRvFCzYgaYbm22pUcRGqHBKmFb+z2EUiLSoGYXfZuRBmlBRL9+QGTzRmHR
 n11gSyKJtxEcAMUoB6Kw3gIM29J27FM=
X-Authority-Analysis: v=2.4 cv=H+BOUOYi c=1 sm=1 tr=0 ts=6ad230b0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vUpbTSJP45I4i0_vGVUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: CzJLf9QQd15obYZNmIZ5oq-KDay-_oth
X-Proofpoint-ORIG-GUID: CzJLf9QQd15obYZNmIZ5oq-KDay-_oth
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX7Au4ok1LIzAs
 C4VYPlPBo4kLy/n+ETnJhHDVkgXjx3wB95sqU9UeR8w6t0PqpE40xwprdSLEnaZiLzQP+xr8UsG
 S3tp02V0EvtAZ0+MddphSkKYWN9Qn3WGtpCziEWVy9cfcdEiHw15pc9D/WHnk1ImvpgwOAmd6XI
 sFiPIFoSly7UnfGns/OTepSlOgL+0l9a2OcAA0n1q0lRaH3uSHLcT+N7D6NsqMtb23LIiA2PMZ1
 tTtRXBITsAgUUg6jqTBTWshQuCbjwKhY0zIrfYbYvB2SRIWD0n0sdu4gqmKjcSNX066f0T9Yd3z
 9mCA/ZjWvq2Y88cwG+37vkp9Zbfmd4sc5ruAs9Bv8q+ll/wA1DqKYKrqIjqAtJ5QW7bMH2wNapT
 LobEHGxmtKBtiYTZLfu/yezcFYwn/FnXBTRiwfprjblVioyhzRtoAum8kZtWhJcTL+eXVuR/mQ8
 D8WjhLt1mvDzdYGMmOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

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
index f177062eb735148561f798d0d3e65265f3235da8..c23ebc61873f1c542a4b475904c3c3a3d89bcc35 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -244,9 +244,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
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

