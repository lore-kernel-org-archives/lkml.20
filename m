Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5EE491B19
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421196; cv=none; b=OxOjv+fwv7olC2eZWu07Rd0Jjuo2KPzZJ1NMRensDCYuvw1EiMRMYPXmue3+tTgrMqTuJ26bn7c+ao221AlMnGTWfYBmHEW2EnTUOwr7jBqQ7DhXu7ozZQOvqj3pT3eYnqfIYGG1E0br7XvmCAaVoTpAF4QnQbbf9HeDhHFFfuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421196; c=relaxed/simple;
	bh=zaDAUHPH3FRyGvoQHOCfbxcwxcS34UzOQiDHp/EmAwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUip8LZ1LBKWd4SIM0yO1ThtTrYXKVjArppdl2xMrdKuiJBMFIg/LBUAkUsK1ra0pxf+mDh95Ms4snxrt1KD/9SMEJsQQ3jc8E+zY3tNgkYVvJJW2E5Mrthp/F5IKMgMaeTywlasbfmjKIVMTGamo6neCOQA78E+7veWAwEcP6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/YqWyIm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBpBfaP2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/YqWyIm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBpBfaP2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0hT02081797
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sis3k50GOEV0dt3wgPQ6B7BfXj0xegRMlx0JZSqwuW8=; b=i/YqWyImmGbcycD5
	x991H0FTbXVUKpn3EhIRPQ0UfyG2kbXcU4PQBDhOF3CG+DFFICNs0+HfBu7hWHk7
	TZL7waGHSHebulmfOu3VyAvQMe60wmuVFcf/kZE0DxSlCPvJSQcaHd5UkMyBB//m
	pquqL8nra2tHxK/CxLCSG1kpkKis6Z3WkdZAWIM/1pPR+4K3rG6wLIG//5HElZiU
	t27bhJjv3hxWl+xECuexu6KhgnldygHVgamPtvRKrOiMVRGS9BuvskUkAqdWq94w
	Sr4NNpLY5XKRg07HbHyN/5AX12RgjG7uW95txiUwa3TLBzERlhBQKtX+MuGdcBj0
	vIVtHg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rhpmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:46:32 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaad8219b0so662657e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421192; x=1793025992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sis3k50GOEV0dt3wgPQ6B7BfXj0xegRMlx0JZSqwuW8=;
        b=cBpBfaP2SXiqTJAKUmOophgPT2rQR4oPgLT6/87H2UeXMalXw9JsLYuHwTzt14P+S5
         bS2Wn2l4AzQQi2AlzHeArrI5ESienihFpcNoEe3/tYnB3/MtAlgXuiNZ1kERGvIiniSS
         z9fpG3zBhM9KlzYaYVI/JA2dTgNwlWZENVr64LSj60r9swQJVVpk8lA2e351aW37IwmX
         dy1naL/wynMPCtgyjp3hfJ/OdbT1U6YeqxtCiVPCFOe2oyrGoSKUwzkRgw+NO/i+zSq9
         sWI73mQ/i269TPT/03zy/B1z2nWxnFpxaJdYcp/y2AycQisUzP5RZgugmTSOceGf9sHZ
         sXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421192; x=1793025992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sis3k50GOEV0dt3wgPQ6B7BfXj0xegRMlx0JZSqwuW8=;
        b=dUbAxvUk6Ki/bHzia0UTSnoD9vhgRqjG3lSdmZAWr/3xaSa54LXPXdb1TjmwPZufyA
         l/YdmowHPQGCakLjkmY06kEGn4gmgFg3TZfRZM1r5TMDY90WvjE8sm+RCfES3/ZEBHM4
         e2JxNuQ+AZ+eQJnUqAyPO9lVaSDMtBtWZhT0MzEU3eQ7F/zQKBwoOGM5e3WYVwuZLYlt
         2TpGEef4G1DTHBu5VJicE0Hgu/Ors2etsaWSl+IiRW8ViSZXC0stYGfpfQeXW4CyYwAR
         D/Pq+df4ZR90evg3NCZ8hZqCmjXl8i1Gc0a4i6AbR84NxN4S99uhliJLa+s5StTT/g7H
         33YQ==
X-Forwarded-Encrypted: i=1; AKwUvByhmXspBQKxunc9PJf+usm0Aiy10fL6Ta58FW1Z9UlFnWus9sNlvqDR/VFrsBWI45mC0UZS3995/EAyRds=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8OD6XVXEqTYnK43vK6Ldwpi2PKXOQ9BqsI35VDtPIf/mOFIKC
	uB3EmE3ZLHsGBCY+tuPkdgIC0oQrnWHSWH4RSkJ7EYAunDFsmcyJphuxJRUSpbE0FgNhi+pWIEC
	u0JW0GU/O88Z/rB1+5XcACuKrk5qr47Z8azYyhU5zOlTygO5ZjoUt4NWBn20x+kftY2g=
X-Gm-Gg: AYBFou1qd0Yx0WQVj6xWlfEjoJN4GfXHjJcOXlpPuzAIy49eWVzlGVXfZxnOXMX0Pp9
	yQuD8TCZ6Mq9jsiLLaN/ohaFtMUD8LXlMv+PxK0WKFmmKT2pNGh+FpwT33ez2vq+376wtl4zjA8
	etCnJ9IF1rQDSikuwIMsTRiI+jyLyidKw10qd7q8hJMYXwlpUQsVfP+SPfKAVjdCTTMJ6fcijOY
	vq1PUrb9HhndiTPKKWuWMKO5OAabqdUn3+DrPajFmi+U1nMdnK5vvcWkw7gv3e/kVSRCgHm3ef4
	f8D57+wcw9APlf3IWdKiGqAejinFx/CIMoDXTp8SRwn/dzrWbZT7bzfzDCCAYq9+cq9GvC/jTFq
	iYFVXjqW6+z18zzOBC0UXhuyo8BTh
X-Received: by 2002:a05:6122:2907:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5eaaa7a3a0emr2328628e0c.14.1792421191874;
        Mon, 19 Oct 2026 07:46:31 -0700 (PDT)
X-Received: by 2002:a05:6122:2907:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5eaaa7a3a0emr2328621e0c.14.1792421191478;
        Mon, 19 Oct 2026 07:46:31 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e7657d4dsm98504635e9.2.2026.10.19.07.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:46:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:46:05 +0200
Subject: [PATCH v12 1/4] crypto: qce - Reject messages shorter than a block
 for AES-XTS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-qce-fixes-skcipher-v12-1-046e6be9bd83@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1876;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zaDAUHPH3FRyGvoQHOCfbxcwxcS34UzOQiDHp/EmAwY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq1i1Cz6Yu6VZa0X9xCRCFr0RQZpclyUOWijj2F
 Wy0Fw1aBvuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatYtQgAKCRAFnS7L/zaE
 wwuQD/437GsZskSEevZGi7dGUYqCfTfpoU1FimzScOz7rlQ3opOtlitH9R/5WjOUq670bruqIi3
 bSxU+XxuAtw6h860sK/LFNrMBaZw3CAIhD0PnJXfxSmyBuIqIy5n1mc2ouHFCslygBNDb2NCo5/
 Jms6M36yBk8jW4HTw1giMefb7JVD/g/Kcp924Nwwi5G89kvUIrd/GlFJYuPqXeJuyRjelpuC/EF
 UqkA3iWas7e4z8CB0G91DdtzC4zZ/HJW+ZTO8m8H4LWXyk8kjVcou6gMK3Ok7OctOCS7khdjGyG
 o3EKnglJDxQxLQ9WUTP8hNM/OMCHIO34p2aSc7HZ86LjSPjQlTzLbj0LQU1dKbXDTk3eZPKrJhC
 XYp40lIAHrcSgUq2NvWcxTtLZULRuwZrjLdsiqQ1fc7OvGN41Urwm4te3H7bQszsYectR/rKJCp
 CqKx/796ZjWys4o0uRMaQpbIq5QoQSK6t4LBMVGN9jHMpDcStCV6nPt3ZYZX6SXLeig/hnOY0vq
 W8DReYvz2hiiJ7taTC/gzCVqaauCN+jWYiYguukANfspKQ6kmmHVdtv/fs/a+dG/lZ8SEoE2AyU
 NnL7QSlSS2r4JyAIC804lDbYXxilaenZ/HLjt7OPM6UkOf/751pWA9ADJFWdKVjtEkzCdIJ+/9J
 gkO0VpKtwNDKoeA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: BUWfrcQA4PPBFiFe-hQ14nKu3vkXpNJm
X-Proofpoint-GUID: BUWfrcQA4PPBFiFe-hQ14nKu3vkXpNJm
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad62d48 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=k8o_H65wWHdScxXBDjwA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX5jkLWZxwZfl0
 4KzrHcBB2/EzOwiEp/DewACzmoY9/gzYwoeriehsbkIfTGWr0LDGwT2lSu5f8I1YAvde/OHePrz
 r/UkRGftNEDxFoB263jjQI3W8x8Fynb4O9WMMw8qh7FBC7YKkFPgzFiFQdSomsdNeViuKmUcWDx
 7mjzzWbhqi0mv6BPet5Zi4k/a7CSWUt03ikqrFk4qbnZ73OF7Q5KjkF1rRpn0BiD8z2NQ2XmGku
 dnwaIRcfxLCEJeLib+ZOiQJtE+j785AP55sQsQTveMGoezEf3ncrCsQLghnWpQylzUpf1pItEPm
 bvm8206NdZsaHTvqmvqC6dx9iD0xZ24r81iEqzKXkD11vAnNWY65aXJIE5NA1EINF1r4x5a8ZvM
 xwA5gxbSLV8Syec2PBkSyflUZCGiq/ppAooq9Ykz4K9ZziLVB258dYu16HUayqNlGIPFQd9XcIj
 QmPqAqAjskQP6C4aTug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX7cuKy3QGkEPi
 GvxRl91VFgBt0jkQ4bAtUPNNmX2DvRZG84GH0lBrUN7eMsjDfRG3EDxb9HxKEDiVa1qH4ogefZ9
 StUgVK5Di5NqHrqFj+ZSAEqYPu8mfhQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190058

XTS is not defined for a payload shorter than one cipher block. The
driver treated a zero-length request as a successful no-op, so the
crypto self-tests "unexpectedly succeeded" when -EINVAL was expected.
Requests of 1 to 15 bytes are not rejected either and, when they are not
diverted to the fallback (e.g. with aes_sw_max_len set to 0), reach the
engine which stalls waiting for a full block of input.

Return -EINVAL for XTS requests shorter than AES_BLOCK_SIZE while
keeping the no-op behavior for empty requests of the other ciphers,
which the crypto engine simply cannot process due to its DMA not
supporting zero-length transfers.

Cc: stable@vger.kernel.org
Fixes: f08789462255 ("crypto: qce - Return error for zero length messages")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 03a3cec2bb90e8d8c17e491ca40ec740a003d1b4..d9a5b255015341e741515bdfd6ff54bd3b24f1e3 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -221,6 +221,14 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	rctx->flags |= encrypt ? QCE_ENCRYPT : QCE_DECRYPT;
 	keylen = IS_XTS(rctx->flags) ? ctx->enc_keylen >> 1 : ctx->enc_keylen;
 
+	/*
+	 * XTS requires at least one full block of data. Reject anything
+	 * shorter here as the engine would stall waiting for more input if
+	 * such a request reached it.
+	 */
+	if (IS_XTS(rctx->flags) && req->cryptlen < AES_BLOCK_SIZE)
+		return -EINVAL;
+
 	/* CE does not handle 0 length messages */
 	if (!req->cryptlen)
 		return 0;

-- 
2.47.3

