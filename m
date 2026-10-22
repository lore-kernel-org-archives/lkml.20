Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659498;
	b=dYKZVy/GflqN8Tj9JjdlZgWFFYwkr4KEePj7SypWVl8lLtIgwlM7mg1t57E9ZPGa2kk5
	 zZMPZmTsVNbKYXTqqqDFQa2z83GiKAbVyqy3pXaWLoNAEbh+prtF7nRhZfdsSXEDC32Wi
	 5JRAvEXVTJDqPZs1ktposGNWaAgiTZqPQ6YZlFJHZp5S48ditS5XfQ3QidQ7SE+H1grAi
	 bo1kHcKky0wKY9Y1lQyZgO9BqJUPS4VsTIm9dxOApjR2gPKiA2ze7DIKZnh7rxfPoiuTc
	 jec3iJO/8oy8MaN4y0OdkIde3q7It3urCFCh5xBrcTi8UpCJLC+CaWU7qQstsh+S+GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659498;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0PgmRG5zgD8CvnXk8EtW3AgReOwJIYBKgnTHlR8v6VU=;
	b=ZbLNMXljQevSN92FJ+rQCu+GuvzpO8FHBYfQr0waahYC0UzEXZ34XQBGVPORINrJpi6R
	 rIGHjYfoiVB9j6Rjk3LG7qQSj72sfVBpGpvt1ODT8JwTLKdcz7uslhA4pyeTmW71dWIWb
	 71QFGYSR+PLGNkIdb060+fPJHYEZjxVUBz7S+A/VyDazImc9ub/3Uwg1MS9Z1QaBYOErc
	 9ksGnvOQ72QXqNbfBXAACNYZfNHwZAN8NKgC+ePccmvUyW7lHpkSyefF0KnPa8naCjjrp
	 bH9bhaZo2meob+qyDB5eOtLzLKcbRSO4tP1vaO0uj2y7WuXd0/ODRmpUqIELTMBCvTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jsVE8zcI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HlR0A0fO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB88606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB88606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jsVE8zcI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HlR0A0fO
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70Ljn2174709
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PgmRG5zgD8CvnXk8EtW3AgReOwJIYBKgnTHlR8v6VU=; b=jsVE8zcI+fke8xtP
	AGMzS/nLog4N9L8TppW315PZf4yVv3yfK4WpPVff2VUUv+Vn3V+oTHhtGCerGpoE
	f9YyFdt1vxxe+ouO/GHq1Q9/lHI0ZVr47JUtC+GTXNoreVL2x2wi5awuPAgEwSa6
	qXfDzZ1pG2/H+bi/AnZb031e76p/l2lXDjF+ZT6bhDOnNrevOOt005A2J80i95dQ
	cZ5dRiNYYvJD96Qc2xPgELqpQ0PMMZegD4x44ASG7WTlfBud7FpZBEPiFxU3nIYp
	LSrQc3HP4wOFa3tVYHE38p5z7bw8x7JcW8zhgQqoXbqrW3GD1e5nD/Q3QmhxbdrH
	Ng9HMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahj51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:58:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso219934885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659496; x=1793264296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PgmRG5zgD8CvnXk8EtW3AgReOwJIYBKgnTHlR8v6VU=;
        b=HlR0A0fOda//8wAag+5uEGvhf6faER9hInT3V73whhLVU1v0wOzQ3r9MuU1S91DBJJ
         PmkYCErku9Zk4qLU+rcj0QyQqm1dOt59VFrQDQ/n7PhUQ5+L2shHmOaBLFUllZmeCII/
         NC0OzC3fY48ggUB9IXOuBM+f4n6kCQ8ZrUV8P5QnXTGHFE9M/++04k0WyWWW0UCSL1S4
         lEc6qDQjITpSNeeltrLqkm3azpljp8VJidk+Oc7xOs0xNnTtO3kvbcEYqHpGuneVyhII
         6bEEC8OxzXKpL2SEkXMvGTsoLLI7gxx3AI3bm/xK8VuXLU44CvSTr65w6FTUV9vEqcHO
         9nCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659496; x=1793264296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0PgmRG5zgD8CvnXk8EtW3AgReOwJIYBKgnTHlR8v6VU=;
        b=pp1xqTNkApkzqC8VyuqClCuN5i3DL9gYCd/SMpfNOs7nxh6DPJ8MVaecza8N6gm/8E
         fGe2R1xBMFxCjM+U827G96f7UGmyxcXL908dFxr+T+ZUJAga8US1qj8e4HGR8NIZ9rdg
         Ka4cjAF3yVXz1dmt39qU6eVsLJHpNvqzAQ6KekD0ajmKVZ6WmoBUOCch6alPe9QOKtuY
         xxNEknItxYkumWVkCo73IIAwT6jOyAy8TCazSb7iQ4J6NBy3vN3WrSI1ibt6XMpl77L9
         8RFJJqU7lAdk1GDMe0P43rEDuzRn9K3CDdKTJ7g4HciU5w8p32a97lYaWcyct2kN4ka+
         xCYQ==
X-Forwarded-Encrypted: i=1; AKwUvByTP/enYWBAu+mHzH59oNqpdaZkc9Ow0TkBWjIqwS63Jn3zvpqA0rPmbdAYk2gh04oFmHFQ4jsx4kERhGg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgrVPjHuUyIVwUbC9ZPVj3S4s3MLZuzRmxtx0aUeWsJqcQ3z7s
	idh2b8/K/KH6KevEJBHt8F7wrbixTbz9oj26OSpnlwH3WoE5sGNdLUk/W1PSvzi/r4yYU5LxPzr
	09IRpifs5iy73w9gIZe4OiN7szUAJJjp02bmYGmUrShF0wi0m9taqWlpCdPZk9Uvs+aU=
X-Gm-Gg: AYBFou0y9fi5+gOoB5s7BNk68kYw5Skh3PF6xPII6wxSGbtJJzFuYHSHXnr/i2kk0Ls
	3Ftaf3tqSc8ZtiJO3wY2ZfzwyX9XXroH5m4tn+WG0bA/O1JCCMpe0JBqsdk+qaWv8tb9fu2hUlV
	a1sMEm4IbSCdr4OGHfe9uhWdCeRqIVGev+2zBACAm2R6btm1TpTz+HLh2B6N2Yz4g3kS3Pkuf4x
	Eiuq9hn07TjM+45oa7Q7aunvKqiHATO/Z4+V2NUVAnrISYIi2+UHIwypeaQQLvRlFEgWpu/Y6Pd
	YDItSKeF8qKULRqwMHojJGFtY51Ymlxp4jPtUD/lOntR77NrXQ35DMN9c9yx0R0lTvY4+UQpY8q
	eK6fxB5IUfvS7qt8RL6QLpj/+DeEe
X-Received: by 2002:a05:620a:6410:b0:93c:c2f4:9182 with SMTP id af79cd13be357-93f57f66009mr872004885a.20.1792659496034;
        Thu, 22 Oct 2026 01:58:16 -0700 (PDT)
X-Received: by 2002:a05:620a:6410:b0:93c:c2f4:9182 with SMTP id af79cd13be357-93f57f66009mr872002585a.20.1792659495503;
        Thu, 22 Oct 2026 01:58:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b28f70sm61625525e9.4.2026.10.22.01.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:58:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:58:00 +0200
Subject: [PATCH v11 2/2] Revert "crypto: qce - Mark QCE as BROKEN"
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
Message-Id: <20261022-qce-fixes-broken-label-v11-2-0d33c34fd0c3@oss.qualcomm.com>
References: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
In-Reply-To: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3620;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lcYKx5PHTS9y7X7qBQ5d8cuijJO8c8zYjjKHfQc3vNA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2dAhmptlaoat7oiLg/6ol82V7USxsh+/lLc8Z
 X07B0BeF4uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatnQIQAKCRAFnS7L/zaE
 w9kLD/9Yfb48Ar8hhOmNvaf4Glb/uNcJDnptVhvU10P9yDGMc1ZNdIv0tuqhlVDUXbhcyZlDJkN
 UNGU57+96+7hSzAx2m5hVC8ZKKP1LmKjqBSlwVVaZ9vCLGrhmCc/eO1h1r/JV9eBYrzl/TiTXjj
 QagN9AACbUcgvn45Rsd009YLKGabZoSBQ0j4cGescYA3Mqv9w0RTCe/Drcg5uuTHxKp/KNparBq
 ABgeDfhBtPIHYK8Kv+vTVT6ISI19mg3/z/mePdltsf312LTOgAeeMaoKgNnP9R2AyZqHNzVi2n2
 QY7j6VxNIlZlSYFNi21ZyoIP/75OH+ahEyeOO13zWWjd8VCZ1upLEh7P2jrvj0/UD8DmAsBv1cH
 gE//7YZSE85FGRIwxmm6mXA2yDkyDD51PdXPBct/eaSvfhuzBKmhA6BGnUxEnaJU0mZ73roqZoO
 2CWlAhMfsExy7OyufmEqwv1cSUA49/0YRdZeVEPJHHnnjb0fgi5jyWRdgh/T/XIedokRJY5zF2A
 ga4/uix7hUdYVAR6LgDN1bSwFSINg6D13n7Ry718U+Zg+qAN136rw/B9z2n2HWnu9dmHoGoq2M9
 gboZc7CynC++IyLQ4VphDwJjItxmPAMhnsJ/5DXcAQ5X5V9qii/Mw496+xWlG02dHVz6po+47bR
 G1rxtcHnt3afpQg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 1iOWVDG9HGailunqeauEh1L9uryPE_gp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXxzYBz5a/q7VK
 6qdytCKkKVs+QOy4YSM6VjmAIAIXJLjebDOaj6E+OFXAxWVUuH2/FuqU4AZU7rtoSiMBCboijp4
 tkyECIzLo7WJLHXe1DxkLZgWsF1YeUo=
X-Proofpoint-ORIG-GUID: 1iOWVDG9HGailunqeauEh1L9uryPE_gp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX+vRkTGesw7ua
 Yoa5RpZ1Pelau3GSifcRvGOSs0vOhHwzhmZvdkuoThFODuDGVU9m78tkZNoF1uSru9/DgUU5qFi
 CuK2/Y3lX6Y6RaMlYcktx3xuR5xk7HQWTVAWRQm8exqk2Eq62izW4Pj6WvYepBjAqpeUFRoO+XG
 mWX6U5xuCLamC2whxGn+stEB5CTv/YeOmkLJ41J7uqzzr4gsiSchXPazOvQDU0Pv4TNOmFspcv/
 ZCkfbdgj63Jrhf+UjNOYZamzAJlDVXkGZn51OH63oilcQtM1lQIYodZmqbm7jzEBMWzHEvV9k+k
 tJVoZpp5+bZQEj4N0nvt9Jguzrszo9rKkNuk6A4CgGd4HsBOl5tkI8ORZShjN3W5v/fR64iDLAl
 DLPZjELgx7VvddIEaYV7/O/uavblkdHrUhx/UeQRuCyy/ePEKvy/EqghBukzNHRlJOjhmMBbz1h
 +s1YklblTnHnfaJ+URA==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9d029 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=W_IakApU47TVE70GsD8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220035

The self-tests for this driver have been fixed. The crypto algorithms
are only registered if the user explicitly requests it with the provided
module parameter defaulting to false. There's no reason to further keep
it unbuildable with the BROKEN label so revert commit df373d39c6f0
("crypto: qce - Mark QCE as BROKEN").

While at it: update the Kconfig description by saying this is an
"offloader" and not an "accelerator".

Cc: stable@vger.kernel.org
Fixes: df373d39c6f0 ("crypto: qce - Mark QCE as BROKEN")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm64/configs/defconfig        |  1 +
 drivers/crypto/Kconfig              | 22 +++++++++++++---------
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f9b8dbf9318c9d4947e56ef0159311634bf0c1ee..2d6292f8cab39596b540084fbd8b30f4c25cd4ff 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1323,6 +1323,7 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..e80927f87ff26fe3f51db6409f509fb99ad614a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1949,6 +1949,7 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 0189dfdcbbe11098ead0ea194293422a31d8fe65..adcbe15851899917fb3039efe89a77c8fe712bf1 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -527,17 +527,21 @@ source "drivers/crypto/marvell/Kconfig"
 source "drivers/crypto/intel/Kconfig"
 
 config CRYPTO_DEV_QCE
-	tristate "Qualcomm crypto engine accelerator"
-	depends on (BROKEN && ARCH_QCOM) || COMPILE_TEST
+	tristate "Qualcomm crypto engine offloader"
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
-	  This driver supports Qualcomm crypto engine accelerator
-	  hardware. To compile this driver as a module, choose M here. The
-	  module will be called qcrypto.
-
-	  This driver does not have exclusive access to the
-	  hardware, causing races with the secure world.  It
-	  is also slower than the CPU.
+	  This driver supports Qualcomm crypto engine offloader hardware. To
+	  compile this driver as a module, choose M here. The module will be
+	  called qcrypto.
+
+	  NOTE: With qcrypto.do_register_algos module parameter set to true,
+	  this driver does not have exclusive access to the hardware, and may
+	  cause races with the secure world. It is also *slower* than the
+	  CPU for the same algorithms. By default it will not register crypto
+	  algorithms and only scale down the interconnect bandwidth and disable
+	  the relevant clocks. Use qcrypto.do_register_algos=1 at your own
+	  risk!
 
 config CRYPTO_DEV_QCE_SKCIPHER
 	bool

-- 
2.47.3

