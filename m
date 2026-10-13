Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8327947F770
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885492; cv=none; b=U1Zi98CQGSiRviK5RExnNTOiAmVjzMDc80tuwInKtot3yjRghOtVEZRvoyqBuH5tVIIeAKAYe0tpX3FWpR05bjmQWx6R5i+LcSSxuX0BDc1wak4wAR74jG/MERgO9o7JtlXa2KFoZb7gYWIOHSxbytlY2AXdqioT3xXHLq4wO0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885492; c=relaxed/simple;
	bh=10czG1yn2EOwOEpiuflfvi91l4e59NVnoKNaveNpS5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uT/E8TWD5u2WT849c89G359bvs6htgn0SoGGslwF+XrWzCvmtKPXD7fmgcBTE1WXHSzrnQ6R6aAWSsxeYgtQ/FyE2lhHuw0mXCWmFUmIjsbzl1m0OcVYkGcIaE+pCxIwci9DzVL0CFqa5FZ0qgR9wak7vVTH8Ia1SMErJ2xbfb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXyeWvDw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgOJEVUD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXyeWvDw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cgOJEVUD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D944jB483080
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	83Mt4HXkNxMhXoNbNZY+WQIFtNOuy89fZ73gqiGaArw=; b=QXyeWvDwyJzJZmF3
	SJPq2gpYsl2cjS918L9xmE5rDouOVwxHChyDHK+jWn1q8Cx3239kqgsSHIa5ncRO
	Dl3y5iynJLOI9Zk+APut40MONc3zpOY/T7vaGjzou8O9QbysdQtWVJfRITIX7J+s
	mgOpWgVsPxyWwTIA/2p2Gcdu9m+d/lL5e/HP5QUjyH9qwxeBzSmAlogYqcZ2sVPQ
	PB7t2FyqEchkGT/XqwACDvpZ9ePraray71r9Qgrr19IvaL0O2MstW9pzJsRxyQvM
	TbaQfXPR/6+QAFE/kpzaQXjXHaMdLjG6yszF3zQ+nNwudHEOErYNfV9jQDuHF11Q
	dv2/NQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg87g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9104eedb5b0so104139926d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885488; x=1792490288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=83Mt4HXkNxMhXoNbNZY+WQIFtNOuy89fZ73gqiGaArw=;
        b=cgOJEVUDxQZXEiCr2puxnSiiZbzTditHRX06/lo9AP7z63IhxnGWn3VBG4XjHvkthz
         Gvd7yfkIotog9E+lLdO4eEdKpelMkH7mt6+DpiG90zKAKWG4DxJ5I7aXrAtdL8MzAORU
         bbXtrv8efAQY5CQRlZ6T7YVkzqCAmflIyOIe51Xtsiv3XS8x8bBAtKo9U0w1nlgNtylE
         tYHDPO8cbFLcPsq1KllUc0AZjTCNYlcrPTQ2v5a2wzOnPalU1Ze5y19lf/EDHjr4T79/
         GF+Gb3Y74BpNvwHuTG1ioW8xyQhyqIHWYxtXgwsNKnnqNqhN98ssQYZFvMgrJa9trIaq
         ncDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885488; x=1792490288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=83Mt4HXkNxMhXoNbNZY+WQIFtNOuy89fZ73gqiGaArw=;
        b=Hj+11KzExLGhCnM2r6tfVkNhb32xLDnDdr1/xhakkkdzRZ8tafEtTNHx93DYnQutvp
         e5E1qi3uboleclCvgDZhPKHDp2F1mjoaZxMaEXknRybWOfhy2jDPaGGIy5crBoqouY67
         qWbPzsUsrEAxJeeuuZ1hJN93xFQX9VPPzh4arFhptQbVt7GUA+3fSsYs3bwpXmt10oCI
         N2cdcsZ89rhMRUbRX3ZH4n6ANbqR0Yrd6Ok9j0825oAtuUO3flr3IEQA19U0dXBY9KLS
         BN1K+9H3bhR5NCJYFspOoZYbiPUJ9Ylm11rt82PA5Ejw3yPfAs0tzoTOHM7J8W6PwCzh
         Pefw==
X-Forwarded-Encrypted: i=1; AKwUvBwh/5EdZj1whrndrsD6/PyL7X8HNPFF6rQMLyExsk3ssB+aK5nOcOTc/YuoD+TeZeBA5ZO24J1TXu08Res=@vger.kernel.org
X-Gm-Message-State: AFq9FYIT6rZvLrGFcsnNFbPoriyr1YhINjoVjbxigdsNxMTAlQqvrba/
	c0bBmeUDN+FOcpOnQnoMpgMsgAoSAByezo6Dn4UJh68B3/qfzbyPtUlOrpS1cxyF9Nl9EqrRLAl
	G/EuqUC0I2004C0IoeTmKmmIdu8TO9BJ6lP1J+RU3Yfdlo9TJaGhpLJwKyvF6l19ZuVg=
X-Gm-Gg: AYBFou3cgV+b/K9PnpbdPj9vTKy5sxp75m8Gegck6QVZ0oo1o7a19e/D2MnWtDSEhkt
	QzAy3RGWcKR57hnwyT4v0YYYBMSRXl6JrANjy2neoIec3z3XDi8sl4yJFnOnfSqXSdHqg8O2nAh
	k3OUSXTAHXVRy5kYKqZK5n9UD+ENMhysis4rXwochkQ1RWYxL9tYbX02OFcx72x0NzK6Q6mCAMq
	IedFVR5tE4k/LL/icN6OEjrs8R2aYE+ohasbFePwpMpydYxacQZulGJ5dVPwQjqeVpbcInxtZqZ
	72q0KMvqteZKcujOVUfLwgMl4lTJhucjBaPu2pH1AT4U0GRINt1rdUYfHzfaKKvW0xFjGJs4m2+
	9A/CosxJQCx0IfdzVToRxH0fxoyyc
X-Received: by 2002:a05:620a:270d:b0:93e:7939:43f0 with SMTP id af79cd13be357-93ebd247f8dmr2055647885a.32.1791885487734;
        Tue, 13 Oct 2026 02:58:07 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:93e:7939:43f0 with SMTP id af79cd13be357-93ebd247f8dmr2055642985a.32.1791885487269;
        Tue, 13 Oct 2026 02:58:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:31 +0200
Subject: [PATCH v10 02/14] crypto: qce - Reject empty messages for AES-XTS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-2-57162a38a554@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=10czG1yn2EOwOEpiuflfvi91l4e59NVnoKNaveNpS5Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCb+PXfJPflooYW0X+6u/+Z1zoTOjPBF4ifg
 sQTVCQOBfKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AmwAKCRAFnS7L/zaE
 w5OAD/44Cd45IorOSGi7mJwtmQ6WdaX6qmUoR1aecVb53vv1qqtm5lnfb1+IN2Dk7+NrCitUW5b
 e1PMnKqDk1SDFB1UP1LbKBvOtKdIcWNTU0mJCeFaLVKyVcAqxM1Do6tEc5BbNE3NtWI2GljqwHa
 qEbnP9Mhlw4LYMzo/oi/v+EY9qrsr0Hhk8g5D7vWMnfdU6zUGkckY/nQftXfAtqSS0cvaeQ4Ob2
 SN70xeId23HurGpcM0RzdJ+sIYZqwbKc9CaTe6Q22uxaWuwc9VUOarSN3dDE5rlMWr+5HNDhQq5
 I+Oww8JDQ0crG12sVqslneavK/nXvcBcZsh9VA8SflNa+1UlWluUkzPKKVxJfiqKNk1GpnTErBX
 NAkd3jh7LRuYX/YGn9M7vWZAhVPY6DC21q1zpYYu31ssbg4b3MKlr30GOYwVFQaGhm47/GhH7ze
 aqz5RLzouerOM2dr1ApwyecmfmK7GLbmrzFKgFDvJP1qlDg/2KrHsY3i+59TUVvqvhqotv3YDcr
 IVoqrFGjxfOGbjyC3zbkwMdD5J43XN3EA+jLJjjWa9CBoqqRJHSyxarR4EsBYLj2Z3RPkE4VAvO
 UwaNViQiK5BnqSagCdpQcbjNwOkH+Eu1mzLEKKv3OKLxKmGJPKyOlsbdq7XAAt8RIYtuwuId5q+
 X3J3tQo3RtNudlg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: AtfaNkGct7KrEQmwapBem5eyaiRyNpW7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX+gmo5XaUXpfl
 POaRtypyenNrdOOJU5NpdMFjlv5bo8MhFMk4f15pmU4ZnmzafOZ/Ax7myqUtIQ62gknDdB8ZE5N
 FjTv2Wp6kQe1x3+7fSIjJJfKk5eFWgU=
X-Proofpoint-ORIG-GUID: AtfaNkGct7KrEQmwapBem5eyaiRyNpW7
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace00b0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kiYxeA6Iecqc4QeK3QQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX3z2T28L+xuqz
 aqHJ0n9F6lHCyzRobYkatrkUDy5qfUw6JrLMG0nO9JWyJZsRSYsmgurNYoxeFK5vkZuaknbBvlP
 Ejjhsg/yMgJVvOwAp4fiSD6Tuj+dUMmueu65lrkDnU/IVRUsOSn7WTfJDa3x1nmv5AxXBhYSORv
 xwG6RAkqCVYWr8fO3Khj0SB76ftqlRzrZS5X2Q7d+rxtcgyyx3UGXeS12CCrb8UV+StQzTxov5d
 qj+EpZyMCK2vzxV5QiNuSG6n8D3OHUZ2ui+xZ4G5Arr+Vz930zn+cKIGa1SkVGcpxt6TIg9oGLx
 OI/zx1FF8VZixQ9P3uqEbOqOA/oaAa4vraRK6WOEV9NkhO66E1SuqaJgmTGh6NGIUSH+KEhvNO1
 dLNuLjtMf/pB37zaR/+ecEEluQZAZ7BRXz7z448aSyQNjoSk8oqtCI3kZl4qg7kKous2q0u26Me
 +dbeiO/0K+DgSjjJUlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130039

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
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
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

