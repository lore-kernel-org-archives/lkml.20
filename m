Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2220C4D3BC8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421198; cv=none; b=n2oqwy6vYKOb/27UdtQQNzp8H+6jGLpl8JaOd/LV9xwTzz0Vcjbhz/xyoKnEp+g2mdNrcK0Yiwh/skR1efkwDMWxPPaEjrQ76olAYav5gFN0CEtFvnVoUMJg6PjhD2DXykkoDaqzvp64hnk8Cc+Jhf8Kb1tIV49guX5v1QH94DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421198; c=relaxed/simple;
	bh=9e1xHrVqrngx1q2w5pMlAxQNUMEvWrkxxUwvMH3feU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vB3xPBfyHVkigmtkjsy9lEJv8ZFzu9oiZOl0d2ZAqMqRnAb4IJuUpOEZpxZiE40Vlgpq+DR2eQmkvWkLGlf14iuRHULm80kmuS3ZTSi4ct0gKALbb+9UKYkXOho1/pEVlGfSTCvMIbfqzzF+PIszBMKfDeWQrZH38MJ1SmD4oCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jC3tDrwj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+7jdokM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jC3tDrwj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+7jdokM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0aG92081550
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ai5AdOZWiu8bcWDZTo6oewJmsAcdheSei39MPbUjKzQ=; b=jC3tDrwj+e7EnAm0
	kIva6ThOIcyiTDhdYutmjYVUqJQZbBaYhCHWlKJXCuO9C5B2huBulQNZfgYIcuhI
	a1a8J0W3e6lb0LVNCtoi2LqMiIh0vCrKthNVOv5WnjFjgVeF91sNvIyGuusyhMK1
	bQUshCQFS5EXJK5GnblSSiaxJ6wQ3oWcwp0nZitSTVbZUmtssAHzaBWl+2tkcWuK
	8VGXkVaPdqLICCcDJQ6yKIM332NB/oWH34apFjK4lRGleBwZxj2f9krHIa5qhIg0
	jpH8SDWn0KQpCv6+H6c5XBnUtJVJeFB1xeToYfpH2RXO+U8SqhFYlYnhSzjWcUl/
	7G7MRQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rhpmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:46:34 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ead43326a7so152565e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421194; x=1793025994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ai5AdOZWiu8bcWDZTo6oewJmsAcdheSei39MPbUjKzQ=;
        b=J+7jdokMplyRL9IxwlPAxORyL5Qi43u65Sc1HOvl8SbN9ioLj5vXGolC84SuZxLpUj
         jz2Ie8vgk9hThs+iG9tv7LmgYMuCai6AOgV4afpUffn5nSf6zWtcRQbpIN4K+wbfBO6D
         OpUJZZSOVgm4FoJvbDtVy/peKD7k+5NCPErPSLEQEchHz2UPd12Cji3J2KCNRhUS1eoa
         fQkPHb+IfVSU5bHXZpSsbpTmrHp9WsdDLc153oGKWRYzJYkmGgJrWUePW2Vf9dHU0rmp
         BmC3+jJPoK2OqeDqU00MBXmGB/9LRFZBd5yCsh5JHwPVKQy+f1yi6+CpVHenXpnK9P6k
         a2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421194; x=1793025994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ai5AdOZWiu8bcWDZTo6oewJmsAcdheSei39MPbUjKzQ=;
        b=AzGiz7qD8jgKCpqKWa3TgU937xvrQCDbkZPpRHJDNvyRYJQqiUAMhpbzgajY0MSAfk
         qbr0lW9aLizZtiYThcYTbCKJqBITVzvCI2liDQsDb87nwOEApPk81+5yFNSwmsAboHlg
         Y+/P2L+hDAuQCzdBzt50RZJKMvnHJr3hai0jA9XvrFx6ZDkmv+vzgyN/d0H8yjbs89E4
         rNWaW5M5Inx+QdMePG9XjRec2pxeiCouSUbUpUxfh825a932NkHijHwgZ6U3y+TXwDo4
         fAUjK597i1/h3LX/OTMb7CTr84KNO5uX5MU9mQIrclkDYW8UrG/VinAcEfrAmiNO25Xs
         os/w==
X-Forwarded-Encrypted: i=1; AKwUvBytGPIvSqovKlv+cIUx648W6f1lKgZYbgjI1cxIOs+RsNueVMrcuFRJyOSHs+ei5c64nuT0lcyTHxDMldk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3SwRSwJwcGaDtxsY675UFLCjWIpZhmwisulTz3PBUC9UkVD0f
	i2d+nchILaZEGDV3bjJyoB5YCCqQxPzOrYictaVhsQ1cC2NjNoeYUv9E0lqkdZpv7fq4R5LBuir
	OFVamlJoZ02Kl5SmuMdNqDZR8AcEoKMv0CvrWienlz/BqGnUE2CnXrhzHyKv4dfjMjkbl2r0pCh
	o=
X-Gm-Gg: AYBFou21ksRuycBDRNZ+KiQST1F6Fm+HDzvjANkgyn36FrdNEvhY+1WWiE6BZR2SW8H
	dy1n1b70GtQMzs8vdz3x+lAzEAgOv5DHDBP8hXxErcx0c7OoteLsjLL3nQjtdObIH+Md+RtZmdV
	I47iIv8DyhXaUwDwuTLL0wQJG5jLySVDlfzUKdab/opzUsuYKp5BSUg9f/zcLHPiyTmAwRaRbsk
	Y6/fX6SM6jibz88Zk2ip87aWC3HW2bGtzYbQfMTfEshJd/gZLXfpy9EZsfXDj+rKq1nxsyrxdc5
	sEZUqNsFrBvxVGn/5FR3ihS5dTEsOYWMdl14ntVqzvW/PoiVcL2Rai0iXo5mphmulj14BQ5/P5m
	d0bIQXqIwgDYdL8auIB5/cX34I8If
X-Received: by 2002:a05:6122:4f8a:b0:5d6:36d0:d20f with SMTP id 71dfb90a1353d-5eaaa99dc41mr2969624e0c.23.1792421193990;
        Mon, 19 Oct 2026 07:46:33 -0700 (PDT)
X-Received: by 2002:a05:6122:4f8a:b0:5d6:36d0:d20f with SMTP id 71dfb90a1353d-5eaaa99dc41mr2969600e0c.23.1792421193463;
        Mon, 19 Oct 2026 07:46:33 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e7657d4dsm98504635e9.2.2026.10.19.07.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:46:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:46:06 +0200
Subject: [PATCH v12 2/4] crypto: qce - Use a fallback for AES-CTR with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-qce-fixes-skcipher-v12-2-046e6be9bd83@oss.qualcomm.com>
References: <20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com>
In-Reply-To: <20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com>
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
 bh=9e1xHrVqrngx1q2w5pMlAxQNUMEvWrkxxUwvMH3feU0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq1i1CQgYyGhEyNdGfXYCF6P6beEIQCaiWExaql
 WrjVVESvpGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatYtQgAKCRAFnS7L/zaE
 w2ZhD/9wMKfU9yqgeSWTiGkZtiMnwvoJEBxSjbyFtLdKdwJZ4k3RUecBcJkFg3MuiOI9i/o007v
 fIyujnvRWL1qthyj1+6F9fGpC+sj/kqgnSxO+XRMKdblPomGLLsf3Qsl+KXWS989n8X3jUZiKVn
 48n86lQqU8CXbzUaPJWEk5JseZ8eeCNmvsvU4uKAKdWpjWS673z+wl2VgAaZkgE3fzJbIrmgVaf
 amRYb5VCu52Nv2R29m4CZlv1O/6HzK1Q9IyW9M2xVlM7nwx9lJn/EBWrqid090OYtwLD3IsB08a
 XtV01gJiXH4OGx69eflQwKUe9k7nZoxdbfrBDjbMVvZD+OBQsBFd/8N9KDQukSlsS2L1OdTkHJJ
 8x9Bo+odm16fpSkPrcvg3/XwwyFzQHt3nY5p3s9ALXYASvIke2ZvypFdLTacZ3XwBfPo+wov+RW
 8d9QsETpaQep4YqFJGtSRRme9HFV6k9csqM+BefuZbo0QZBQVMKtKXL353awfElqzearXjUkIn4
 6AZUjnObIn/mdnonDmSjtOKds7dD/fk9Wowvv3F/y7nqbKPfDxp/pxv2em0ia6sNeUaXpqoIPkD
 V/fYQ5T4E6HOwHFu5WPt3J4p8juM+TS2x95ItUlexf7KSCoqfPT0zU7o6qMP1mJWm5amsoaDvwu
 8UtNitzuGK+3hAw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 51gNOU1mto7lHWqt38r0z_L3qjg8_9cX
X-Proofpoint-GUID: 51gNOU1mto7lHWqt38r0z_L3qjg8_9cX
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad62d4a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vUpbTSJP45I4i0_vGVUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX9e6//lhIwPx9
 H9Z6i4w0awVsvcoDxWO9q4wjwp3qhgK0k1Vzn2l24ErbueyMnZ689Wq7A3eP/qWEG5eAehX4sbb
 oZfO7AaW9t6Hdix6UyjraTRx9snwIPdspAnaGiv8tPAGx+L9wyYg9hcihxRIrgUoGUu5VHwa/A9
 FIeVPEvAxN9tKBZLmMkjidziesUmu/dfodTcS/r8v2fTHlQdRu4lmvfdSo+TQDwCtnBnaXWizzs
 l+9kaylsr63ctmVYl9sXHEuEuHp2bq+B5N2cbKyvk+3H8aPZKwOWdPdzGdyqe1EMZjXcG9Q5AgB
 m9nVuDtXP/1b/fahrg4ZORhUxCFfE0YqCcgbny+eZyNLrrYD7obIoBCK0vJRvQW0R2J/a5ZzSk8
 aufojtUjrzanRt55DM0/d78GPmAvAWnKQQHVD6+Owpo4ZNDSjbFqSBi7pb7B8ZD3CoXVNLngzxZ
 L1ejOs73VUAK0on7RSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX1zJCJAaAIuSt
 hSPLPSjB4/HUtygl8BJQfOhhIhLTbvXiR//OmuzsCUkxodYnptEp7ABT3NgdZL2u4+e104gjPiQ
 noUZIjlgdxT/IIeKt7JAJCLvOcX0Ge0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190058

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
index d9a5b255015341e741515bdfd6ff54bd3b24f1e3..8d4cd1d08c0e9d78f044057ecb45e5aa8b9a40a3 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -248,9 +248,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
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

