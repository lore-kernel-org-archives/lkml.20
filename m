Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8605437F7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081875; cv=none; b=iBGHnbq91YAAfkLUzzKZ3nYWSm//qmURTxdbD4HjNkUs6wq8Og3I7xOcsEP58NPK5tBSbDQ52w4k6i0p7qh9hI9PgikBf6wzZqqbuagZdSTDvlXQlryinCSGN4vgfSnQmSIl2tD+gEa9wvSsw1uJbRqYsa0nOJ+zTQJaVvjCCcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081875; c=relaxed/simple;
	bh=M8H+MPXamFMq0WJoXACKxu5xswBagOiIf4IGpV1851w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aH0rokFqeb09R4InE77Yg0mVRFCoDBFaEsf98iFXYrKieAHYzFjK9CWo8DmQIIY49Z8yKcjJXmKeMXyAJVjPXZCE/SCIoXCRhQJnU48fzXIlZU2l5njU8bLpzavGZUdN6n4+rQiaL5oXiOqBUMYvhL903wqw2uq0uMVDsNF8auU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zt+TEc8P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BICf3f5x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zt+TEc8P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BICf3f5x"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPIb31146765
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WYSi2uh0Xa4ChBv5axZgn08de+UEeDLKohCgue7QxG0=; b=Zt+TEc8PIENLZEa8
	3h3zGokW40mLifhoR3tcxXoiKI8FE5knm9YNuh4KCt7sZlA1xP3m9A1ZyKe7cEwN
	N9YASAKINGVGipmffmX7en6McR1eFTDfUYg7yW295ulgfYXD3/d9o9rS4Yrgoepy
	8DIyMeOkWRYfDX3g3sNYYsQH7fYdMl4d1uEq9VCciTF1nD5hIBRzu/rzJHW74XNM
	kk/hOQw4R9CWAdPpy763wk9/hsIhro+E5VaUmlc7IzudMdS7nFFNxS4aXcZLgRUf
	v44QvgGFV7o7fLaAG+NqdCJ0Zb7DK7Hf7hJFQndYjxamJrqIceQBuZyOhKdeqi/p
	tXN4eA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqycrjn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:57:53 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7ab4af214so1267215e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081872; x=1790686672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WYSi2uh0Xa4ChBv5axZgn08de+UEeDLKohCgue7QxG0=;
        b=BICf3f5xA02FysfD3OkwgDB2RcGWwKfvA1EOpOqBoQ0gXbMkqZlEBPKmclO8okgWZd
         eunvMSo/Izmgyr7lroh5khiONDQJFOUA/2Ky9X6guMyp6hVpkuLTbONEQeADrZ5WQdEU
         WKYRE/ky2e27t8ffFcJSkMJhTRzx2JIIkBg+zld3mO8rOhxtbs3umQEhnlQ8MiAPlNN8
         7VNTNYsDWHQnOQ9v0kuCZr+kCxOVMjZCYEiMaC4sfhlyBGAW7KJFmmFpjzhBfoUalDEK
         S4VonVUT2PZhgEIFOVjrRrBhLNF7i/k1v/aW59PjwiqTJBHCjHTFNwPFVfFGU0+o0pNp
         Wj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081872; x=1790686672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYSi2uh0Xa4ChBv5axZgn08de+UEeDLKohCgue7QxG0=;
        b=C9//V7rySENrtI3tuuja8uAsIfL0hWVfCq2J5PSq6qKX0ZAMm88QFRGib5MhuiSdlo
         RUEHubZ1ObsAJnXX/VNoCzgWENwIr8Asell8CnfGReKXmd1ZHJO7HboGXAlXTlesYa0K
         agW/TURSuNxqllzi8YDJW2wNuASqX8kmlFQsQYA/s0Wkpw/+b5PrR3VDyyueTy9dZ3fM
         Ey0f+0L77PwPnPgjVRbqKdN1YE0zcEbL788fMZpgJ8gGzX5RJstajmIfJ1X3xon25LeR
         z+BPTAglAuEYglV1+AZz10qpnQ20fUsabW01eBmCOimEkqAxfdS0LMfc1C8BqzXx6KXV
         O+kw==
X-Forwarded-Encrypted: i=1; AKwUvBy2zxfZl/2TVo29jJvKHuOIT3tUlMosmGrPh9QsJhX9ToulwUnmrTGmCo0RhRkT3/GJC7Fwjyg3UxmYa84=@vger.kernel.org
X-Gm-Message-State: AFuF++nSCmLWNDsQC+cN0hfozRTp0HeLcXFdXVYCH8cuy2Dy2YrfdeQO
	upbkIHcxYFpvWDJ0iPZUC/ItL9MoOw7ZYiive0ag5a1hp4SCWnbDVIFYeLCXhPIKmnaMyeWSwKj
	gpblVgoHBoZrApdHZVci2vYdh+ntm/4FJl0f4jpoSYNURCWv91ofOJpFfKxQS701p2aQ=
X-Gm-Gg: AYBFou0A8UCf3HXxcEx9m3mOdsha/WowPu0Z8qeUFbYHnXZjCJnKmVszlj8C5St2l+v
	VGOV2ReIplx2DKPDdKNlqWnIhAnJgIgfJHx9AP+1K8lI2qdGLgkfo2EG4uFdDa4daUJG0BCP4oN
	MXNGHpGBqIW2j0WUGccdGao9L7unXYyhP3LQDtACjGaq33gsYLF5JoEXv1QfKQBb9t7F1i6EyKo
	4NQyivN1N7LLzBo8wfLyCqfkd+2OPQ82cP2H3iqCeX1tXJ1Up/ot0qbs8ASEH4IrEfmkFvqSnlk
	v1XubfXlPWQ7M+BLxoBkdkxmhKaZN7uxi41zrdDn2YiUDfEW6nUiMVCY5RxyBLTq5ae7jszsaww
	s6D0ZOrW9jQRZCk6zibvq0+LXr6Q=
X-Received: by 2002:a05:6122:3d0c:b0:5c9:a617:5812 with SMTP id 71dfb90a1353d-5c9b8b73530mr8218887e0c.15.1790081867021;
        Tue, 22 Sep 2026 05:57:47 -0700 (PDT)
X-Received: by 2002:a05:6122:3d0c:b0:5c9:a617:5812 with SMTP id 71dfb90a1353d-5c9b8b73530mr8218859e0c.15.1790081866586;
        Tue, 22 Sep 2026 05:57:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:57:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:17 +0200
Subject: [PATCH v9 02/14] crypto: qce - Reject empty messages for AES-XTS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-2-b1aa742e79af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=M8H+MPXamFMq0WJoXACKxu5xswBagOiIf4IGpV1851w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns2NF05OVLf3x0BlKxlMYYjKLgFGd0Q0jxPu
 SojZU1UJS+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7NgAKCRAFnS7L/zaE
 w1jMD/kBe09jKjOM6rqKowD6dBQaMaFHmu91AvkXmalQ5/R0rESCSg1XSr2F3w/dm709XwkhGdk
 MfQwKzf8qKH1pxBWwRj4Q8cmvUZa9r0NZa8DsB8g8nFfrEFYuF8gI3t8GqchqdxN5NwRWi4or6D
 5qkxc0bTGuCup1aEEHQ/0oHzQs3c/xhrUS09T/rE2NRbLxkZGyDZ7tPW5RrOahc1eOsoRBplSlO
 gNxgZz8R42P/78aH0d7BcIg2wbRwgSZu/cVAEnTXN3nMFYp9jwvHULyLMLzWeLmlYBqf0mpihrb
 eszbGS3zEURhE7J6BBqkV3+hGjgIqzu3Z+wvJDgP7jze5CDn12rMUGdivU3m+Cx/Ow27hTQ8i0r
 FonZekhc+R74RLuLmZUT+fqERQH+fnPdLGKAKfet/oxEBiz4d/ijpzBG9wzdWqSblAop5Rafrl1
 r7nEgLK57yfQ74IxKO3+aUP+UE0hyVwmr42mcbIfvUccuA7IavKbL9sec/4tBMAgbSuLG4gxlpt
 dnCgdxAlmQgpEV8dOrvaGfZAWmJfnjn4nviw9gaqTubFasXSNaVzxHSaI8tm/ZR06uuXFHq3PnO
 0lDJKE3q6MIa6BwU9u/XL3UpB68/2ZWMYjobJHBnZ9u1yp0vKjzJqF4ZOOR9ZkOyE8nZM05UzNt
 W5vmL3weQJJB49w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: qSa0Dy2l91Tt_sa55owr0gyMqt7fFAid
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX/HubJXTQw+bD
 +HP/5cm+SKIFwyMZEW9rUvVZuPhWcnRb2UOzEqUKFlSMntsy27d6h8qnItTiSpkEw8lYSYBGaq4
 SaySdKJjAmw5s9O/HjHbM8wJKlhM1V1sfNTEk0nD5EwNXv2ZtvnpmmKW3XjaNDWfKygSlsHn+qC
 nB9Hqkm9ct1KUqf1VIpkEb9cMHO0izx0aTOE+xgsjYMYRy+u6aXhYowk1VI2XdEHNTQ5qm8M5M6
 Cxq0SH4d92m25Son3RKb1pwwi1fqAXUbaowMTER4eNpn2280kmKeZrn9xOnHyOYsvnjEEZijneH
 /QHQjbKPxd5a8tfATn8aiK/+i3C88xKdAcnd+cO1x1pUoChxThXEFRYMYHtjYyejxoJjuqQetTt
 MhTTsT+YC1idkLWg5WF6hwb/qddzMbWT1Bl7NOGT6hFF1iY2aUpz8eGloEltoo682QT5hT4mSBQ
 GYTR7YRAERcpObQdDIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX42PIcajvFRhh
 woRVb/hy2Q7UN+4hQXIrhat/k3dlsczEjQJQe+RgJHCbMsLIdmjCgqu96bmR2alsrv5jmQVcWwm
 d00X0Ypw9rIPJ+iu4iZv85zrnz0bhVQ=
X-Authority-Analysis: v=2.4 cv=c8I+0h9l c=1 sm=1 tr=0 ts=6ab27b51 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kiYxeA6Iecqc4QeK3QQA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: qSa0Dy2l91Tt_sa55owr0gyMqt7fFAid
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187

XTS is not defined for an empty plaintext: it requires at least one full
block of data. The driver treated a zero-length request as a successful
no-op, so the crypto self-tests "unexpectedly succeeded" when -EINVAL
was expected.

Return -EINVAL for empty XTS requests while keeping the no-op behavior
for the other ciphers, which the crypto engine simply cannot process due
to its DMA not supporting zero-length transfers.

Cc: stable@vger.kernel.org
Fixes: f08789462255 ("crypto: qce - Return error for zero length messages")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 03a3cec2bb90e8d8c17e491ca40ec740a003d1b4..f177062eb735148561f798d0d3e65265f3235da8 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -222,8 +222,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	keylen = IS_XTS(rctx->flags) ? ctx->enc_keylen >> 1 : ctx->enc_keylen;
 
 	/* CE does not handle 0 length messages */
-	if (!req->cryptlen)
+	if (!req->cryptlen) {
+		/* XTS requires at least one full block of data */
+		if (IS_XTS(rctx->flags))
+			return -EINVAL;
 		return 0;
+	}
 
 	/*
 	 * ECB and CBC algorithms require message lengths to be

-- 
2.47.3

