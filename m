Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B65048F024
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045306; cv=none; b=OULvOMLiXYPo70ckrtQDPVA/Ahw8lmux3jep89mozoqFv1fC7KmDdQybxeX1i5hDq0EGOM2cXjYHZSaZps/n3entdWoGPXcqyLisxk7sP6G+QyVL6f29/8H/yGK11t33SVVZCUL8ymleWVjX+ICn9c5RdbF3A+Mx7a9UGWc/eW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045306; c=relaxed/simple;
	bh=tX3TRtZACxaWj28Vd3tV97Cdc6/vFpH99oExqmgwzeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BOumdkyz0oqBWH547PPIlQKb2kscUlgriPB3b68kBHTz68af+9qfIo2BfAEz2QYJBsydw97mo9U3+PhLbCsC4qnBmtYHZ2e0QZIJlZzXSSfqsRQ/0wpxuOP6dVOXx7h5jgdBJjNrZ9h+HldetgQkdMm/AfpL8PHEFoa7Qrnm/sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izw17Hbe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVBH1SDh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izw17Hbe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVBH1SDh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7jB71241983
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=; b=izw17HbeX/LIWuew
	ez8d3p5bVpW5JjGeoho24IeygCL+WiVIb24PY244bZ3XluycwT9gvuCbxMro6Ftb
	cOCAQjkSuN1TNnnN06BfdKyOoCTZk2HhwuDGQFoc4yxwxe4qUWVmW2q0qwA6eR59
	u9R1UpN8jSYmqro9ZR/KUxMGJu1PLGt9F7Zxo0nO4lIE5kWH89aPSuYgesTuNMuP
	Q+XlONIW0ljrLQoej4/seVMYcwOW4KqE1d23jzScl+Iy+KojTQ2i2iRTE3BjM43R
	V8Gjm2Y+gnUNGQ0I8AttEKSuwtmTm6ky4z1yURTCmSllTYL2zM98J9pK65mBkdic
	yAFfSw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjs7ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:01:42 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6bf68c1c11fso904243eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045302; x=1789650102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=;
        b=ZVBH1SDh82VlUjdAPqaxuz3Y8M+OLjxHk5rI0FcJu2bPlLKXpwBlqq39fxx2qeGKmV
         SvmPrkOkyHEJ66HSS8wHtRb1S7TNYCgs0wO3fiLCfY2E0SjxFfvg14dL1EWsDLOHdciU
         oxGYP4jf06mDRSZ7XRh3uc5VWva7MJX+fwNEdP0Mv4tMQ0zovDg88l5DVkA7TLLWkLBw
         +gsCQeF6DX0e/gpnhRemHdGtcPZfTpFlQf1/UAlNo0hRn6rIP7zWqz8LRMIqoiZ8+syE
         ZFkLrob5emnJ6xUyIvRim5HbCtfVvmejDuQs0OZMASMRlbRPPZy6yGoBvYM9UtJBehfR
         6R8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045302; x=1789650102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XpAwiJrGurnLU7swiLYwHwGFQJ26CvgKoaprZ+5NHTo=;
        b=iXzCX9J5062I6p39YlHzhdsjMis7iOnP6g2cfFyTLv35XfihigYm9zYcE7qEIlGe8D
         lhvrZblfdJd9gNyX/BmlNQDQE+tPuZgAy1uF1vEk13FV6HpV9aAkdpL1eRuBvRvIE1oP
         GokikEpd0VfkCjFXbj9ImuA3fAaoGeg8lTIdg7HevydGsTCMA21HbJdD/aPw2ZTVGsKf
         Zjy5QpTz+/mNoS7ngt4O69RMoKZnuf2x5UKsyEvDIkWgpYNYTABIFvaqK+uxOh9ty8lJ
         rJY2UOTNGZprBK1Yz7e/ejkWajvtvBtpqYJWe2+f2MOk/WBVn2oXnaYporU7l3/4ayeE
         picA==
X-Forwarded-Encrypted: i=1; AKwUvBwNkyEUJ8XjRh0SvCjNHtE3hQAVPCEn+yOuxwzgQtKYO3zidUzv9INcJ0CRHjPiNtlH/JQD1n22jeSU46E=@vger.kernel.org
X-Gm-Message-State: AFuF++k9hDtPloocsglvJge7lJbbbNhCA9R6ftx9Q9mPi5Ad6CPvzeBu
	qykcYkKSQz3Ghh9QSOQ/yxDfj/MQS08TycLsgTEII8rEh+DUxir1jMin2UAqNtMf0VigSh1NZEk
	eU8Ib3o/yT5ySYdfh7Mf2n9JjZTyDb0Ja1TqdbSMlH4eLU/wM4jaJhiXQLKXIOlQ0Kkc=
X-Gm-Gg: AYBFou03sZIMmyvvorRAyCWcifyrD6ddS2VLJmTQrQU0cMEQC6yTu5m7DVnZSqMpkfI
	Yv97dKenKDIYm5ycDTLF5t8T2aoBNIh5LQ7xyqdmGSz/O2YWZpM0euJtcm7/KJFPMEGWS8VcmzY
	HQyPs4czgdsMnBotBuwbf1Y7mLix03qNCjte1TSqB91Qf2P+MQkaX/a9QBlFGqHLAPj4H54gD69
	T6iEnDlSWOkaRHKHIP0EoUfFwjc8o2DzUbngTdZQvu3CAnGe9vMtStjx8Y5qSBz5zab1d+NvDAf
	bgsElk00wKO7SyrN0B9AavpL5bGiAYws5WBsIwagdX+3OVnHH/5rnR26SQaCqHaI9bB8Q540J/c
	1CfL2cf+NyEmuToJh/M0bLq+kfnO/
X-Received: by 2002:a05:6122:490e:b0:5c2:c0b2:9880 with SMTP id 71dfb90a1353d-5c7ed478a49mr26857234e0c.1.1789045290868;
        Thu, 10 Sep 2026 06:01:30 -0700 (PDT)
X-Received: by 2002:a05:6122:490e:b0:5c2:c0b2:9880 with SMTP id 71dfb90a1353d-5c7ed478a49mr26853962e0c.1.1789045282599;
        Thu, 10 Sep 2026 06:01:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c9b1:abfb:f300:5e98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm831849866b.25.2026.09.10.06.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:00:45 +0200
Subject: [PATCH v7 04/12] crypto: qce - Use a fallback for AES-CTR with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-qce-fix-self-tests-v7-4-cdbd2718af14@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tX3TRtZACxaWj28Vd3tV97Cdc6/vFpH99oExqmgwzeU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoqoNxRtwkAolAz49O7BFo35y6dlM5H7PtpM0H
 UCYJgUd+ZiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqKqDQAKCRAFnS7L/zaE
 w7OEEACx2OmTFHwHBMdYiM46jjJfnDB8QinT0zeL5ug9AvvELNZNFb/PQiO/QznG/MI5WQVfmx5
 zDIqeM3GUL9j3yheB5Y42QGiG+U4+iYtcYOOiVblTvr36W24isO37L48/BdIW7w9nO+0APskpyC
 ziXVRFyihsQ6hXWsZjYaKd+y24MY4jJmYxUfqHlOfwBHOG7JVChF1jm5J1arqDZMDyC4kv4JrT9
 QpZ7y/tO8DUEwXhcbui02S1CtUlJx2St9ZQnTI0ljA4FVni47ykIzjqdj98mrcjYGVfO2az8xTS
 E+Ji/vBh9QpsD+p2UMxydfyzJeAso1S3pP4w8lW9tX+TrGEuD6yBetNzhtSkOf6Uvngezk8mvbX
 mnMO7k1TeLqWid1/jhPTIRS9TOmeByIF0QSKljIPVYeVnatomIXiaWpLmZKV3hNuOWqzooJdfM1
 9sTMlClLUH3D1sLAQmiQ1ttcejB9Ej6E9IuIzTerajRRBLeMemstXeY/iwryG1mae51GVWpK2zX
 jLWmuoCMnzgqQYd8e2NoaWMy9Tzg/Fnkw10uk4TwSxFPJqA31pc691ERTxSRHQ02bZUelr8aSiR
 7SASGDgPrdIxZTyF/CxH6ddAWvE2SPHAph1h1JNad2ibDsVWWAaNUud2fs+XqaqFCMkBrUOpngY
 iRdWRP9aAcmF+Sg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX2FuHNj8QZ/6n
 dp6CYvxEbnDTvnjZ4Z2Jjyb5ZP2+QMS/bk9rcj2oGvXtpG5JGv0fw16qEYlU2+Q+eS+JOr7OC73
 qjYJgsEHE/O2xD5X9atbda0+UY/4gqo=
X-Proofpoint-GUID: kPcCqb5pIFkh6vlgsVDvIRnahOqAXSy5
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa2aa36 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vUpbTSJP45I4i0_vGVUA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX7h8KhFoODMLW
 utynbmHJjyyB40KpRQCDhFcdmoiWWWiJHwaqLLF+IWZ5Kumt1JHRK8UntL/+otpVO3uF5YC7aX3
 3aI1c6H/wtYCiIVPNYIrdUHUM6nkhQb+Ve6nTAaf4mCNj8jdW1IlbT1mj0ZD5Ja6MfewKNUZtJW
 OdIYt1L5t5qPIhvt9CmRGjbGrRB7DcQ8Dlrd1IjeKTWtMN30y1FVIWUsmlnv7Pj13rW56K2hAdh
 j8kZJgqzehlwkJjigorvfuMcxQeFhKiW7r9h0W/Co5qX65BK2CvtrOFjKXL5Kk3epCn3e3BDkOb
 FtSfl26ofSddcGxXPsG5hOzvuPfy0ps+YZ5neEhaIsjayRc6WffBHAfXhBXYPecjqB0tKFkKt//
 CmF+HNi6L7Ovdxdx6cYjYC+ghQIFECchmv4FHJGduM8gWohPL9rNAfahVd4v/VoaQ5X6XPhUCzt
 8WO1FpQdyyKf0D1TBCg==
X-Proofpoint-ORIG-GUID: kPcCqb5pIFkh6vlgsVDvIRnahOqAXSy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100156

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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 0a872beff4807e6e5af612e336630ea7a36e203e..e2ca2f7a6eea1129edb724fe30659d55aaae8190 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -259,9 +259,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
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

