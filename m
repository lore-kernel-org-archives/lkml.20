Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D392F54B1C8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081887; cv=none; b=IPp6X0a1f7qbsa4kXLVgvSi13Em/0d0RApDkW5QvOWKirYflZQt+kNn6NjN8s/vd1ReuYRbmXMLckucf//S7V1FagKo/qhZE8DhnT36wXQiJfB9EzbL56ZcfCRD0V/88QX5o3JHZ98Tr47KMCT8R73S8lUiW9/moZ/gu5RvsS/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081887; c=relaxed/simple;
	bh=YpCAU/gxOh6WCk4K4j4tl5j4rP29wWVra07PGc+2iUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fkOdTbdoBl7/sLa/VWsitvK/XbI7uiysfdUiAOT6+gmnAYpgmpT2s1dUiXThfr0wNJMLdg/3dY6gqgbWVnqcUpK4YDZBTQDuKo7lpCyCcqcEao7VdeqMuYlaOLItrEedJ1rlrKJ+raERyyawQZZhTmWfqKfnIPTdfVjfYnjF5vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAnUF5t/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOC87v4B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAnUF5t/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOC87v4B"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPS8T269080
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x6SgCCR/AHalnKsDkyEEmSxctIT2a3LccETCeOzrgeo=; b=aAnUF5t/fsrfXx4i
	xQ2ZpxWnxe9SqmjlOzk7kobuFuyDqoaMh5z/547t/aFTVz1EPD2g8nmxud/zxc6d
	80zBVBjeHIZFLO8PGTXrLDA/SPqA8+Vy7Z86a4ba98bQVjnqQSRMbZOAgXrGRjXG
	G5fKZWrL/pmlfMDDC1s06ySoZW35ab6b4FF0toI5gM25/4TsvPWY40x9z5G6eupy
	fqpppbEjmHb79gnYuAIrNq4YqMtCRuCI1F6rRiIDDPaLKlIM8AGaxab8Qk1/L0SU
	SwidKS+JJJ4hIlC+uvofGTotrpc6trMtljGEfjaYLveTvq4wtkl0iH18k8AfQgy3
	nosjig==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbatqam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7d5444845so5891685e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081884; x=1790686684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6SgCCR/AHalnKsDkyEEmSxctIT2a3LccETCeOzrgeo=;
        b=DOC87v4BzPRTWzVR6IdNF2FXF3I8pf8MBZiRlF7D/FNYeOkelDplfM0UNLHdp0xR8g
         fw7Zl98YYaMI1Y8b5HlyQN/Mn3KBbgG+dgHiBhSY7nMJ9vUdG61p7uIlddjDVov7Ew/T
         1AcDCKmSbhC3BT59bKivHPkFcJi8JC1rRdJKcaRpjd27/nIjzROZMy8LVLvNuRdXMqHR
         dFfYDsQQRJkL8ADt70A1lzmkECxPHWm0SEGmWr6dqxIXwFMWJykYMHLoPaf00Gdo/6FM
         GIdBdMDihoMiA5ubn/JPoc3Z1NqgJHFBEya/jEiqBVok1rw0uNOS5M5U0kZjwgg795vq
         GZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081884; x=1790686684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6SgCCR/AHalnKsDkyEEmSxctIT2a3LccETCeOzrgeo=;
        b=ViDrGbhzT9id3e0/2xsNJ2VlpxLlniNRdoTK8/NirLlPBPuTQoojatTZ59coqGc+Ah
         /uefHB4+NHLUIIYu75NAmKNIDIvhwANBjl40vFWMKNMhwZj14fJ7NyVMMnhv65VPvRaI
         u3asvNg/qYduwt+PbVXoJK+zPDi/W9ARsACXVZFR4mPLCCYScJN7Vv0M572FpGy7O4pO
         bwnlgxYzG50RpJIbZa+HS9EO9hSgDFehIgXKGl91mZ4sKNPim5I/vtnXNXZ69H+yMov6
         h/OaGfEzJ91yb8lD8FdS8EpIEJVLN2H8J0fcOsBEus2O/bPx0W+aZFUZmMDlA4v9ITQG
         K41g==
X-Forwarded-Encrypted: i=1; AKwUvBxzhOcGFWjU/1KrKAgX/4sZ0+FMbi+UF7Ji83S1UrmRKX3mASJPwuWuuArjW4TbDR03jX4+lq2Y7xqd0/k=@vger.kernel.org
X-Gm-Message-State: AFuF++mqhFHAGvLjGofG4qx0fu4eYGsgxcor9+PrGOv/EPTPgjpjp1Ga
	5LotGbbptLvJDMFN2dcpls95FQpZwt4sPtteOODvQDtTektk0GNmq92RHnsmqlx5ZY8EWpDeWmH
	ZsV33CwPOCyblkhfbZZs3iQKEKSs0f2dInIeskwcB9Sf9Ue0y3xjmiBe6xuPbOMy/2R4=
X-Gm-Gg: AYBFou3xp/4B2X33WOlJqHstBGt7oBF/6dR9PgFZnsHO6YzNkntG514H9sTrUYoK5ws
	K1+5jUdAlMdoAcSG1DBMo1hhRoATqgJw8X0CX7P2sof34AweCNwrrIhjNE4Ff/QvubZVa0CXN8F
	nGacEJD7ZWhzow7y4PoKp+ISpurfQMp59ged4m/jFFbIfRUwzpECv+rxzHkmeRpWGt5DSfnpxd5
	FKuieragHgKI9hJjAWBXpA0Wppg1/hPGds3SsE9o06x36nDvqYUyyZCENLcQzMcknshhPHBFO90
	Z8pI9MxXLPQqasQeqGCEjs2Cyw2YZExXCQ+EBnjzUf3GmBRjX3s4fKXK5D1rqmkkXCJSwrSnLvW
	efs/sd/idG0BV2tjn++1f6A5bCIc=
X-Received: by 2002:a05:6122:a5cb:20b0:5c9:c60e:5cf8 with SMTP id 71dfb90a1353d-5c9c60e6106mr4431592e0c.22.1790081884182;
        Tue, 22 Sep 2026 05:58:04 -0700 (PDT)
X-Received: by 2002:a05:6122:a5cb:20b0:5c9:c60e:5cf8 with SMTP id 71dfb90a1353d-5c9c60e6106mr4431562e0c.22.1790081883761;
        Tue, 22 Sep 2026 05:58:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:58:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:23 +0200
Subject: [PATCH v9 08/14] crypto: qce - Use fallback for CCM with a
 fragmented payload
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-8-b1aa742e79af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2908;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YpCAU/gxOh6WCk4K4j4tl5j4rP29wWVra07PGc+2iUU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns9tW+msfotN7ObK5bdVyb/2O/lX81u6V4ca
 uPlj7nYgq+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7PQAKCRAFnS7L/zaE
 wy73EACvaJuqYGZfb+m2zogj83eX2D6otZ5mOpBlMgGX8q2C0+bfwKb3Tn8NXHwRwC6KyjaIunY
 p78OxEQ9azhzFmN0/eGo9ywGzyvBfYSKPs0C5GRwAFvWc7lc5zOzGj8R/bICdcZDpiS8dBBDQwf
 AzHWZUozwCuFa/QjI8TMBeOlZeJCz1Sgm0nodtJcX3O6slWzHEZl+/eJvDbj4dlIS/R/avfn23v
 mGPHi+KlC/8CXeRTle8Nrd4mkF0CVSMDZzJG10ycV1OuVHJJUfgT3St2mFgbK+WO4P+/hcUsOCb
 eBJr+mIPFKGbX5mCLMY55SNraWHhQ+eZ3wAJ9+8Vo2Av2xXOAXCm0I3GfpFdganpiLXUjMMXJ9c
 8tb4UnE2ZDtiTm6/xWSRGpQx8iAFhH0Yc+bXc1zT751QfSTxHEOR0KM+0PTruKS7fQgw/NHs6VU
 1dpe7yBGjceG3eZwmX0625mei0mNcjPn4703qW8Iit99OAsD/U7bgcuAMqsdBapnRyXdbyRaADK
 LUNVHz/B9mcgfFtkMEUEKdhQuXs6wku/ozZebHZBrw7CQ8zozNep/CUGNRJmd7MrtGOi2P7oorH
 Ug2PPVfL1U2tFpvmxMMKTkVX+sMb2wP+fKEAOoNVnlbsKUezULwX/cwPz99WDqNPLJiKqzrwBws
 RvK00xImvqFACKQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NiBTYWx0ZWRfX6RdDzrt59IwM
 uqQ1NUuPmPCqFV307sCPkvPOHvEonclZL41Am9P0LDM04U6552KsBgpxPMgJUcYjJi6rhA58qI4
 52dOpVekuHDUPE64naUq7ad2zyc/7nCuWWMorm5x82Y2+KSNL5QKJc7VJ0c3ntJlfc7mdH028mZ
 ALW97UhS9fC8HFKJRVVSZtWpBZaMsY32mH2vYiUTYWdFlXV6qfbDYz/iEaUFRDtfEL2b5QgZxp6
 VQfNxQDql1XShhlLfEFjUib9TYTr1SjJOikoO4nWpwxTMXjpMrzofA5wnCqYCPFoP4tJbu/98YE
 B2w3Fb1cD5YmUQZEvLDbI2Z5qxe8IL0/YgfdiZruFbK6nR8s/lazAzPNgxyLUQ/mGJl/VX/wByv
 MqUrgNlqdBp5bb5T3ejdurBWFfzKYXxWG6/es2+NHcO+zsporNH4P0AzykF7QFy6r7kYvjM/kOp
 H3EZ4La1Oq/95OMtFMg==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab27b5c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=phyxH6jkQibGXiXynFEA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NiBTYWx0ZWRfXzTTv+PmiYxO+
 Pe6ns3FaIUBz5QWhjse73wX4tHYIQsPVSkv1WAJTwNYwHOig4qac0yrjXRSDWXvijxKGYvc6nTc
 XuIp7wiZrkzZ09w571+LT6Ydd1Bd3yg=
X-Proofpoint-ORIG-GUID: TGMEj7tHFqxAi1Fsw11A-1HiUai69X5M
X-Proofpoint-GUID: TGMEj7tHFqxAi1Fsw11A-1HiUai69X5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220186

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
index 02e1a7684a7e51ea7ccba0660eea97a17589c3f2..37199cb50744fa3932e3404448689451b0004b77 100644
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

