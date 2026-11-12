Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492655;
	b=B6Mkx+X19yAU+FoEZkdls/hnRk3pJ0HA3M/X7FrMlQpbtgxxsS5m35mzA7Yf2IAm4wLu
	 1O5FvY/tnSt3NkuYT2D9lDjzzyaktw7aPiueKdC7mqMQumYih86Rdhhh+ls07uJZF1wIZ
	 I81lI7rHt3HCCc2gN0TJbG1RrDWjw0zyH+nXl6rCB+xWAeeslV/xrZw/TcY0EH6fOVnyo
	 CKID5ln2hMN5g47G0swyGItZ8TWNSVZJq310cqqdRo1M8rYX2LtSIyvTuVcMw1eNabden
	 ZF9ND1YEDd44sLZGbgEAIJnYCuXcREFz2ch67oAaG2gn6Cma+KkPuNNiEdAWdki7Vkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492655;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oXGSSXGtbkPXvB7nHrz702paXG7FvJx+QlGDGhbF1l0=;
	b=wMpp3tS2fLyXMp72i7tEjG11v9nT2+2lbmgKEBvcr7ck6qXJNPGMEIyut/y4ogbv4DP8
	 ZulKXQu8Vyjmnoh9B3KhHOp1hLdh0LNB3U1zLGqu21+OwS5DXP/z9GDSGvDkKOZCoQ8RQ
	 NGOaLOQ06pNTPIPmx+oacwH75NOZe45/YxA2BVru0AaX2zTz2MUBtAJ+yHUH03le615rw
	 7I8kRy2PLMvlaFR/U/FkCPwy1BpDjod2PxmDDO457K7doKz+u46h8E4JzfkSt66T+U0Ws
	 Ktc3f0ZOrZSYno6U0PeUFFUpBayggqF8LnzjT317tcCFJZF/jzogEoJaCo6YaNbwMzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bgaAsR3u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JxltDWoQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DBF606A896
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38DBF606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bgaAsR3u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JxltDWoQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAminr2555149
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXGSSXGtbkPXvB7nHrz702paXG7FvJx+QlGDGhbF1l0=; b=bgaAsR3uveq5FK+A
	AoA994h54RJAfAESM0C/mGXB/bkwKxtovBnQGAegTxo745VO1rn2Zhzqc8tOfxfn
	Xlon1xTjuv0t2/G12xCkRd/Aa4CnAtJk5JPJGkEu4K3ZU+fMCmWuHvWFdpC1HdVJ
	3yymi6x3LcVchLDDAJoR408idd4ZECadXHtdFN2RXjKQZxsBcydFGNipzn2F06Ay
	c8NKELgHzMn9/piAMZQmBljBQWNxO8IcL8+PBb17Jz96pVWz6botSNSTmVpOWJ4t
	PkWqL5acXVJgXGOFOzp6RF3sixiLnEjWovQMqkzezyISyc+L5Rf4mV9hv6NeMmV6
	cASBJg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j0p70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:10:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2dd8c5aeeso796570137.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794492652; x=1795097452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXGSSXGtbkPXvB7nHrz702paXG7FvJx+QlGDGhbF1l0=;
        b=JxltDWoQnKQ/hklAS6rif7acZugzdi1Yn21cPhuVUeGLS25Gd0/hc3JLduVeOcZPBz
         UZY/8qBcb4nXJKx/zLo5hckXF3VaqatMLQWVmRuY1e5sOtdkyOmhxJNVmlq7u/T1erS5
         UuY63AVMmg9Zsyfp++6umgABhpK0Lox0ppFPHzstm0YxWPJ/jkyrSXaKEcaoPWke4q6g
         Klla771a58UyBSpCbwPKn2vm7bioHqVy2ekCQz1KSdRHUZ4tlCbvb3mtnivTIuxPpHaA
         Gkhi1m8yd8+cv/HBobNndmB8mRo1SmaYnGWG6/jKFAIEk3cngduCooA3r8JSRaZbBKzI
         Z9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492652; x=1795097452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXGSSXGtbkPXvB7nHrz702paXG7FvJx+QlGDGhbF1l0=;
        b=bmEspAVDYfQVjQERb2PuCnA1bwYBAH6uiu27BUNRMAYCNwwufoQ41xVyby24QheC7S
         pYU7xKxTm0fc4nNI6aBEuSm9lvlfAdXvY0XgZ5E4M0/vor7F17X8it2kxqr+YMbP8PGk
         +hBw+c8oHbn5mtlwnVl9czwBuNY7ar0w49H76ePatmcBT996KDGp82ZPBweNmda7v5L2
         LgEtmx0AnyIDRZRi+JFE0tIv8Xg/TeT/vhz5q2ADVDVBihNP73RQg5NpSOrKRA6xokVX
         waBfPcacoWlShqG/xlXXka38q8uOgl99hGWjWQTTc015Z8yNsKt1RtwfgWKNtAL/ZCtF
         BfeA==
X-Forwarded-Encrypted: i=1; AL+hErHv1NphMQFMJrogIasA/2a2djQORgcn1p4llFTo13D9qwu0SBh4ygojcSyDR+xfgXLvo9LiTq0JeE/bvoE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9grTqp7jv6akCvNkI3PMRHZ/GAlGWblnzlwYWE+/2TnINQsK1A
	CZWUxzA3NG7R6AXS1EsewUfoIwwfnUMrD4NmG4G4DAC4zmfFXfG80JEyx3O8z0GRCO8/e64kPYD
	bRnEiy+5NeMtGcI3hXgdUwF2sO5mwnfgmlbfdawWAcZcHHl/ubuYQG2sl7Zue7cS2Ka0=
X-Gm-Gg: AYBFou3GlLHfkLe/gWTNnI6NSr02YyVHhrILDHl86Dbb7eyAuwaGX0wU/MU7RtclpbS
	qHl6gPDovtjlwT0BSTuIORc3QWfKOke5x+nDbMjdzTbtLIIpT3Ubp2/sVvtwp4oreUorWReIqaF
	Bg45Emhsd6crcAWoBtm9g79DlyP7rAdbeTj4UNZHdWAzNZX7BD2kLf+pHavjn1y6hFN6GTC53SQ
	cXwa/WPc9xJFa9O6URu7EAqNfNRJXpOmu5hmaenzHS7SZAKlXjrzjYXlqZfidPmFzsTUALKC/p1
	7mIndPKMdKBSnJszD8hK9HOkazaEb3PB5C3UndfyxYVNsd43PUQwmM521ItAYkHi8XFU9L0nX0T
	QM70Fr0g1qLqMSyxEq63uutyuoZZfLegcvjIyztE3yNf66qA3ddIc4Clcq4ZH5s389KXag/PDIt
	/erqvP2eE6J/8mTgPy0T990GME1+NSt+XLsU840vm7Kh0W04RuqVn9iwh8cdEol2s=
X-Received: by 2002:a05:6102:370d:b0:7d2:cc5a:f0bd with SMTP id ada2fe7eead31-7d4fb2e28b4mr2056776137.19.1794492652237;
        Thu, 12 Nov 2026 06:10:52 -0800 (PST)
X-Received: by 2002:a05:6102:370d:b0:7d2:cc5a:f0bd with SMTP id ada2fe7eead31-7d4fb2e28b4mr2056752137.19.1794492651710;
        Thu, 12 Nov 2026 06:10:51 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e271378sm81817775e9.13.2026.11.12.06.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:10:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:10:42 +0100
Subject: [PATCH v11 2/4] soc: qcom: add core driver for the Qualcomm Crypto
 Engine
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
Message-Id: <20261112-qce-fix-self-tests-v11-2-b86a65ee7107@oss.qualcomm.com>
References: <20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com>
In-Reply-To: <20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com>
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
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4989;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DCwoS/LvISiRO16djPQOua92B5KrkSUJ5INr10E+D0Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9cjlekHn4adtDthK6Pr87Jj53xre20mrcTQ/l
 5BLTafMcjKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXI5QAKCRAFnS7L/zaE
 w0inEACoUhLjGJYZi7GYfjLxc1TvdYUHF6eRl6bNiexRnFPqT6JqZ1KNVQOZMlXFof1HS/7Si8h
 Wj6tA0dVrD19EWqYCtHC298iY83qy93sQ/DKAMKPo3q2dZp1+2F6TlVXsL1/oih63tNo3aiQLAd
 TXvkpEBz0X2WPWc7zII6oQY3+SwyYRHL5nefoox99nnJR3Ije4rXm6RBOMmNT8afJr0Vcvt133D
 0uD4vbFFaCfTMrHOcWxp7Zu+iR+jGglAxfmUzzos6LTNqBYqFeOTagj84iTJMjcWBDQu+Hd5x1l
 YPGIgGqDYEWnUsUi05nZi5LrjuOwTEG4LU3tIGXEVNkKe2kqG0AQ4yYGh0t8AQRtqI6popUrBar
 gx87wC28mfapTGWpys+p9tog+VEHLSyStKOE9u1mDO9PzWb1C2ft4aWa0mK5FQUhg79+SQPYXE7
 Chh/sFAe7v2JQ7NzpbTWNJE0kGY0+51Voi6EHA9RDGDSKlkT04PAkhqoid2TEwXYnKS0Uzp/nCA
 nWgESU0DskrkVu4LLDQKwYe3FKJroz0nOWp2iUae76VUi0u0r79dTvuO6z3uVILgPP92DCpB/vq
 saXfP9JjD+7yX3s6fxKQSbk3TKKpMyP55yR5f8OhliOcyDkNYEXeTrQ4+7SOwnv6iy+ip5WN//L
 duzddPjJWHL/g8w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfXz8PNwJzUQEnN
 2fk0BjCmwNr+F98UmH/zU5duDK4fw/44MEUtIwyJiYiaozrjGmgHpwuoMD76F5qQtYdrF/GaHI4
 +lIXwv5CMgrDYZQCZ0nUY+NB8dZ4heU=
X-Proofpoint-ORIG-GUID: 04suFS-lm1Ev8YKRzZ8XyS6KHeOzpNer
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX9yNPw1/f/4JH
 Db/Hs9LogygyNoxKFtN/bTlEKD3lreqA2Yd4fUvEZZ9mkXzm9OLsdLz2DmxuxhuJi9kdCqMQhzu
 nRcfe0lwF82+rOAOLYt/74kwIgqkQDhnX+P8eQ6JEhttOld04y+tFuDaDhHxSbDtfwW/kK8Oga4
 mSbtwWXsXAd3cAE2LqL+S8K1JKtw0L+C7Yb38lF6KOaRrgiSPNjZPuuygvf5WVNCqu5eRFRKxl9
 AgG17GIvADZ2+ndgVZrGUkMI/EkhW0WSCR/7w6bCC1z9ZX4VP2A3LG5cm5W7zQDjYtakd4hBxbh
 Sv0kAyIfYbIIZ+whXObe/YBco3YemT9CCI1AKsppIzTYKXD3EI7l0YWAPaVSYxDfphqat+SooAd
 OjPvFn9lP3Bw91JAvXbyDZelFLuHEDBGKJ8TL0NFRUs6DNY6VOxmjDT7PENNenoiHmeuoK2gCfV
 +no02/eJrGmx5mgGwiA==
X-Proofpoint-GUID: 04suFS-lm1Ev8YKRzZ8XyS6KHeOzpNer
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5c8ed cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MCZKxbAby-unP1KIBZoA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120056

Add the core driver for the Qualcomm crypto engine. Its task is to bind
to the qce DT node, set up runtime PM for interconnect down-scaling and
register the auxiliary device using the crypto offloader driver.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig    | 11 ++++++
 drivers/soc/qcom/Makefile   |  1 +
 drivers/soc/qcom/qce-core.c | 92 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 535c8619197b3e889e536da072ab89d3bb729804..67d54d5211ff21bae77cd8408fa47af630060949 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -121,6 +121,17 @@ config QCOM_PMIC_GLINK
 	  Say yes here to support USB-C and battery status on modern Qualcomm
 	  platforms.
 
+config QCOM_CRYPTO_CORE
+	tristate "Qualcomm Crypto Engine core driver"
+	depends on PM
+	select AUXILIARY_BUS
+	help
+	  Core driver for the Qualcomm Crypto Engine. Say yes here to enable
+	  the top-level driver that binds to the devicetree node representing
+	  the QCE, registers the sub-devices implementing actual QCE
+	  functionalities and sets up runtime PM allowing the interconnects to
+	  scale down.
+
 config QCOM_RAMP_CTRL
 	tristate "Qualcomm Ramp Controller driver"
 	help
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index bddd6f0a583673047067b1f0be725b8bb5d860de..9ef0f11d015852d1f599769074d761f1140c08e9 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
 obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
 CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
 obj-$(CONFIG_QCOM_QMI_TMD) += qmi_tmd.o
+obj-$(CONFIG_QCOM_CRYPTO_CORE)	+= qce-core.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
 obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
diff --git a/drivers/soc/qcom/qce-core.c b/drivers/soc/qcom/qce-core.c
new file mode 100644
index 0000000000000000000000000000000000000000..d51a791bb1a3682b7593928cd9857a1c00e60bbe
--- /dev/null
+++ b/drivers/soc/qcom/qce-core.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/device-id/of.h>
+#include <linux/err.h>
+#include <linux/interconnect.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define QCE_DEFAULT_MEM_BANDWIDTH 393600
+
+static const char *const qce_core_aux_devs[] = { "crypto", NULL };
+
+static int qce_core_probe(struct platform_device *pdev)
+{
+	struct auxiliary_device *auxdev;
+	struct device *dev = &pdev->dev;
+	struct icc_path *mem_path;
+	const char *const *subdev;
+	int ret;
+
+	mem_path = devm_of_icc_get(&pdev->dev, "memory");
+	if (IS_ERR(mem_path))
+		return PTR_ERR(mem_path);
+
+	dev_set_drvdata(dev, mem_path);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	PM_RUNTIME_ACQUIRE(dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	for (subdev = qce_core_aux_devs; *subdev; subdev++) {
+		auxdev = __devm_auxiliary_device_create(dev, "qce", *subdev, NULL, 0);
+		if (IS_ERR(auxdev))
+			return PTR_ERR(auxdev);
+	}
+
+	return 0;
+}
+
+static int qce_core_runtime_suspend(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, 0, 0);
+}
+
+static int qce_core_runtime_resume(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
+			  QCE_DEFAULT_MEM_BANDWIDTH);
+}
+
+static const struct dev_pm_ops qce_core_pm_ops = {
+	RUNTIME_PM_OPS(qce_core_runtime_suspend, qce_core_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static const struct of_device_id qce_core_of_match[] = {
+	{ .compatible = "qcom,crypto-v5.1" },
+	{ .compatible = "qcom,crypto-v5.4" },
+	{ .compatible = "qcom,qce" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qce_core_of_match);
+
+static struct platform_driver qce_core_driver = {
+	.probe = qce_core_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = qce_core_of_match,
+		.pm = pm_ptr(&qce_core_pm_ops),
+	},
+};
+module_platform_driver(qce_core_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm crypto engine core driver");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");

-- 
2.47.3

