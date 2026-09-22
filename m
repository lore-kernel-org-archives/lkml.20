Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE84154854A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081885; cv=none; b=oAZLZrfYrVrsjXCsD+c/wHHIYsKDp8SP6ySbTo8jMZDw4Q9t2472wio9eIXElgEUIh6Whu+YXTm4sMavFSkLQy4gzAo1Xam6LyDcwtbeEnf3QB6dnTEcax1XvlN/znMP4MtaaxI5zSzyBGTEhiyd/Kn9huKhUDnEf8Ee53hrSvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081885; c=relaxed/simple;
	bh=bj9lX9c4+OC8dVs8JmPGc4UfJVDkKWl/nVNsAYzA+XU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oe40UrV4ZeJ8Iwr8LuQYR0EiXYglLgzJu2XZ4zFhl3sV/pDhmu/KqClXTxdXExoUhtiuE3oqD/nqHAt8G4aYXb+Kste0847QN1Fgnhb2/8jjJnF9W6Rx2FUK2FlMOlqcLvWDnViQxO/UylWcF3a+YBx5tqtbRnghyKta5NJ11aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chTdvJa5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fzeagXMI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chTdvJa5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fzeagXMI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPaDE2869482
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/MIEadUHz6VYfh8CAPIjr93K/GWIq3ryVLs8Yl2c6YI=; b=chTdvJa59d54BeGt
	WHVvdpJKKeOWEpI0Q+WQWmZzNDsl8Gjb3cBrl9MNlyCyVPc7cQKO2IbUfHywsIi8
	4Nnr3u5+g9eLLhtLJ25mwP9u2OxQWTyk4ZdMcpJ2QHFqBeO7yHbgIfzwOqoz6roK
	Lm5zft4YYZ053/wwUYV1Wv2Q0aXDdyKj8FMjtrMXGH0gc/gO6NBLkw67T0AUjiO7
	th4/W7KPPZZWLS3Kc8/DVpiO5WjZqRYC72mnVKGkFGxviM+3GLy6mSrPNrPnEVnw
	cFZquudFgZO5VtZ/CL4Fa+FvUTc6EAdpAp5O3FZupFa33tmXuD7ufORCq1DqCPXH
	JilFDw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj11233d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:02 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7ab4af214so1267383e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081882; x=1790686682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MIEadUHz6VYfh8CAPIjr93K/GWIq3ryVLs8Yl2c6YI=;
        b=fzeagXMI1TtjJ0kmLzsAtAAMM2fz7cNFhc1lUVznlvCJmezV2sqi02OdtULxJVHJJh
         fg0gRaiXnpejM3uCutUDnSme20ICiroW1BL0xJLEiDG7uIuZGe7jAyAb2N/hMYA+mwTm
         OIi3oHYN19uhysPycA5svq+pgPBYWvarAJF87qdQRdGcMkH/RxwMm+i8CzZna651LVj4
         XwADiMNGo8NoGAJqrbgoep4kEADHZd4gtGtqrbSuKMvh/vaNiR9Zd35+YcJhCYxqQdw+
         4tUwjgQNNGNOZM+wIbsq+C2vhfghNB1TtcTxu8FDBNMkoBjS/FlsyI+IGCgD3OxDt4FA
         2mKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081882; x=1790686682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MIEadUHz6VYfh8CAPIjr93K/GWIq3ryVLs8Yl2c6YI=;
        b=Xj82pXaIrijZe4Jk+hKjBsFbfuUiXlreGtGFdT+MsPv/jYSBSqAaJwP/snvSQmKd5F
         TjJ1gfjdhdxnIJpmo9EBEAAtXKl7AnEjK7n+NSGuvk2G8whXpsUJUrKBTKC6wXL9eGS/
         2JI/x7gMDd5ZSg6YG93xey6TQP8ag4yUAhRk/x1g/krX2qJWRSmuIZXKBSc2KC6qGpOL
         1xcZFJCszszHhS2GkxgdebTDZfcwMQvoFQf7RKiFaK+0TlKmDPTBKXt0MczUzf+4sVd/
         G147soVkt90tW6n9qs1dGfxrS+0V8fHSLlEFzCjshnENK3IPB0zV/j8DUBzR8aJCl9a/
         gb/Q==
X-Forwarded-Encrypted: i=1; AKwUvBz54EH8Ji5ArJMSb3QBpi4sR1D7jW/JV/bNFTpITQPSiLpMwqqbUVNfIHDtG1osXgtAIf4LIqJgbUW8kR4=@vger.kernel.org
X-Gm-Message-State: AFuF++ncX7K9Jv47JqaSeVAtRkaf/mvvvyIt+WhlWOkIwEAIwBUIRBMK
	40xMRjFcvhTI5qfof8WzgZVP8ZunAn56i9NvXjb+rjUqbQIGde5ii2smP4mtbYiRrMfp6FgwWWK
	gEaZa7UQrGRY9R+86+A3ynIGI15MtSmvzTUJLM43d8HwPrwgczgloq6wjXXRhkGWChZ8=
X-Gm-Gg: AYBFou28nKdYN7Rtfq31ZXFgr0UGOfuHKhn8JdH+NFTGA5g0oyDBsEgsTf3v3cSg8uV
	N55KXz8G3V+pcKfYZm819axXouVNprJjtTi2N74xDmtgdSkwHEvjLh1BKzzZP1NPOkjilGH6KT+
	KAXRLKPFJGofDUcafTP+aaQhf9AXfL6t854Sl+Opebjke+oZGVdttbcEcqhZJmOb6EttlHzFWFH
	VN0C633EMVYMNh9W6vLVzUhM5fUPMUSLBGvkyNLIzUU0yiAJqpwadsA01SyFkC/DGtmuJvhYsvz
	qA1Hnsg91b1g+Awolfo9FiHPQ7rg8uz+7y/3MqnZz+U6pMFyWk7CBV4IIf/6iYMPURD5aCcsp0Z
	Z6tB9UDYwQhZZHbFMXOSE0vyHe1w=
X-Received: by 2002:a05:6122:17a2:b0:5c7:a814:b987 with SMTP id 71dfb90a1353d-5c9b8a6c1e0mr7412281e0c.2.1790081881621;
        Tue, 22 Sep 2026 05:58:01 -0700 (PDT)
X-Received: by 2002:a05:6122:17a2:b0:5c7:a814:b987 with SMTP id 71dfb90a1353d-5c9b8a6c1e0mr7412232e0c.2.1790081881084;
        Tue, 22 Sep 2026 05:58:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:57:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:22 +0200
Subject: [PATCH v9 07/14] crypto: qce - Use a fallback for CCM with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-7-b1aa742e79af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bj9lX9c4+OC8dVs8JmPGc4UfJVDkKWl/nVNsAYzA+XU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns8hv63zSBtiXYbUTGccvk1xP2mkvo1BVVCt
 yxLjs7/kjqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7PAAKCRAFnS7L/zaE
 w7bFD/9Kth36eGZBIVEX800vPqzyl9ccVlbjzHLpgw9p41gcpsdUO/y1PCbrtzgGxVe3nXy8b39
 K6lvPIGz1pP7NJR5uugWdMeFouuhSHIgQnBEiTEANpTSuR2xdAbZA/sCQhv2Ol1IJmpXQnjQXqD
 pDiTSHTVOEPLFF/59RnGbTmP2u5sjVLns0ABiT7NwyWBlATOo2n5dTaZt+mlmcSV4YuLazFqfym
 RE7XWqXTxZl9rYW8amIehXm53GDlftRqYvXeQTxayswNQvJB6+qJyuvyh3GlpmLCu3HBM+la5RE
 eiyq6XyeE8mS9L7nEqZBd8YhLHEpC+AzNQ2tEd82lm1quGeKbVci3NBDbC7lsa2q++JMQwp8Yka
 LVaIRfAylSlZJ+ivGZ0RVXBESyHK+okQf5CD9FDcof7hY6cTNiC7rlIX5rpMPeUUbzQH27EBa+K
 TYdN4lrpVAscBnNFdlFEG0xnZoR6nAoh03VufvdvhVdos4W6MORxU0u+HWIJnhpVVq6Ih6cPdWC
 GI5eAyD5BydUVjmGK55CZubxwNkbSejZCH9ygAbJ8j2h1rAPW6/rbiblywD7iub4lnltMTnT7Pl
 OuI7dg4J1TvQ0LUkQCzS5qRwmcnFeyBXpyeEwB8rFkuNFCy2PbRAK6QstkH344ndMpTPfJRqAWl
 h/2sTB+scr4lNrQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: QgElfD5lbtIQnU-q_eIUjGyk1TVIy3-B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX30mNpXREIie/
 TAT9BKQAIN7x7WicDrm7pe9evOKjIpJxBmTDE5DA3q7dC6nCEf66xDAofBaS2eYoHL0pzdhmWz7
 RwlCZbT52SjEtSmplgVbbzHlMQFp4+k=
X-Proofpoint-ORIG-GUID: QgElfD5lbtIQnU-q_eIUjGyk1TVIy3-B
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab27b5a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dx2SfONCXZg6tt9xEGkA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX7nsOiqnwEK4q
 u3lygfvNn4s1uaJOseXcZRE0qv2ZoUoHkpjOeifwZk1sjkijX1pbzI2GQ4FuEpadKMVEJ3/J0Je
 jse3kH5RolkIBQRrtQDzasdwiAdoVjOW+voSKYLuV4chU7vpsWhnNa+Pw+U9Hy6L/XyxJYOmOII
 QQ2TUL7TnemrOnKR3goGyugSRGchooM6WZ1rjFZkHIIaIdEmt3U4cmUMfMU7XPUvuAz6uIuujH6
 ZrideVkLrwr10ogoyZDwWC/tOXRi9TRP9Mjw28o2Wckzey4sDTiQCz6tX7e9pAh/hcG2nuZC1fa
 SHv4lT9RfaEFrKJcf/UvSoq2QzA3ES71D6Td3BuH67O18fcIfZMo2MIeY8DOs5tC+5gktnrKBsT
 Pe2EP8ZXK25xS4uwMUxxDI8jdRLe1psqDR7L848OiXirylWIyw0bedHOehBtlOiOYZ7RXeurWH9
 6YvoakmWJ3r8BQKeL/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187

CCM builds on AES-CTR for encryption, and the crypto engine stalls on a
partial final block just as it does for plain ctr(aes): a payload whose
length is not a multiple of the AES block size leaves the operation
incomplete and fails with a hardware operation error. This was caught by
the ccm(aes) crypto self-tests.

Force the software fallback for CCM requests whose message length is not
block aligned, reusing the driver's existing need_fallback mechanism.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index e0061bfab216861444e36700d6530e7a3cd347e7..02e1a7684a7e51ea7ccba0660eea97a17589c3f2 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -514,6 +514,14 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 			ctx->need_fallback = true;
 	}
 
+	/*
+	 * CCM uses AES-CTR internally and the CE stalls on a partial final
+	 * block, so a payload that is not a multiple of the block size has to
+	 * be handled by the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
+		ctx->need_fallback = true;
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3

