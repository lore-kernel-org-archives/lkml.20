Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074822;
	b=M/Z1wW/tlEqHqHc/ijDFwycCSvYnUXKLSICaFYQfUBq4t9rpdIzHHhQDQ1dY8eX4YovD
	 B6Q12Tv9Ax9YK7a0D2TltHikyxXTnBJRu9KZKnG5s3aStXIIrzayuMGLhozItB+5ZGuSP
	 8f7Zr72yR1mKrXJiC7gUrq+eAIIfYagXW/C0F5XoGiuE91W7X0k2W1e6HQgCA8u1lHq6V
	 rkpDWy2el7xN1Hj75N/+XhVtbPgGbud2FRXLemUVOZkKMzoHTVwsrJzGQgb1D2hHW67Up
	 KUJk3WBKtGyMLPbARX/DjYpiPlgTWf8aMgPO+FMvvH9s+0qr7cAz21s2m8KAyOaNItw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=;
	b=ftZce6KoPzmh5kVUXoNYG2lk+1EfQu+OD5aCls5R/InBZD6xkN3eXkuDNt5hJWhebm7V
	 AFBZhSYQAmzXlBk/yzhDifZ8sUzirPLbvKwCb3rjvh66DWjO6/gBFyTjbcJRXG6lV4UxJ
	 DxcYpzM87+TIwUDPVUbkhsgTsgUeHJJwrN40mHU5j2en4wgOx3cBD+eDJz5+iABta0alt
	 HrkUGOvnlxK9ZUS0CtD1YggyW2w6g3GZOYcrhn98G8nRQsaEGZEVeggLmaOEOVxD0m94v
	 IAMDp9O53aH35JwEep5MPSpYDfz2vMplxlWioqnF6z5xYryIzAcJod8Y6mcD1H6VZVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c+FXOOV4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YlVXrR18;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDF1606A33C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DDF1606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c+FXOOV4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YlVXrR18
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7HsxSl2471585
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 18:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=; b=c+FXOOV4P8LCuKF8
	9DYVHgim+w3rFMHfQZByV6EWS4my2MLU79ycnaWLfTibNV4kZP6snIGgMcgficp3
	2OWyTSVCusxJScLN093/538olFGoYQj1QjEd/l9wyJNZeDXwvvD9Mf7RjDLSIEog
	BOMLEMwMPduVZh86DZXVs6GGqa58mKk1YGEIcQGQ6FXRsaxeovfvBgSLktGvDpEi
	hn5rl1xW/uraHscCYLqUYqLh0VcNMyhIc3sOfyd7NHwkx6w4O3r0DZiYbg0qa4Vb
	lm5yn3QXem7VZUx8QLiNYi7J9QRDYaxC5CO1IldcdBRj8N26sLrRQ2nlrt5xmbaX
	lav3Mw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99h8ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:07:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-351788121cfso5318013eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 10:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794074820; x=1794679620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=;
        b=YlVXrR18NxkBaSkupYMNuhlH9Tgln//HRUGwg0z8PQTW54gRptnACes8sPbqC1NGn5
         U4Qy9RpyZFuRhUvNORUUX3ZKxHSg3agXbNMF3vtDzaQgPWgNs7Jhfy61PWOjbu1OUX2E
         /+FiPrxOd8nxMu1hvpGAyj4B9Ru7CBNinapIOajlorjdEsUradNfzMPIbWaVgNZSR6KK
         h2fM1moWsOqe0MgfqC4sme0QlI9KhKgs9yzDwmi8wpTBHxt+D2eR3aF5dnPKkA9nCqFK
         tq9Zc7ZT7EAT85Qkhk0nwQ0OzKqApBt63le6x4dX341cimKPsbtH3mZIaVaXyDy1Rjua
         bdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794074820; x=1794679620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2H5Ad90S0fkIwIHF31nqLKj0/QNXL/xbvdffpwYqAhE=;
        b=JJHGH3te7AjeJpPRk0LgnnRlEMix2sIRqwicQboLaSML5PLJ5qKsFpkehh/QEO4jpg
         uAOykvswBpp+LRom4lyrkVB8H+c7RXKy2tGZ6S37TOyR0q/TjVKuhOq1SkFWzh4u2trO
         R5PxEhD7Vy9EG6CbQnfPuBmNrkfy4WtdHgwEBTALlnoXoqdbm1TlbM4tKWG5PTeU2lP8
         2ZPnQZqyF2XwPI+QYJTM/KQezQUQ7XTiW+l9vPBsr/GDrf5YnpbvZtFsuUA2RX8lSB0/
         HpqMlKzRNC4Ni0xyiBUcjpqMqf2MX4IyXQRU4pVIGQ41VLzolVvBg6WYhbjlcdpphE3Z
         Vhzg==
X-Forwarded-Encrypted: i=1; AL+hErFghX5UudgqAPTred0O0eGGvywun4nLV+DFouIoVLy+R/UJEsNIIWkC5q+PLqBshiw6iGctAPAES+LiRfQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Mn5WY1rufMz/Bg5dRSSwc5CIw0EuInF4WSKLdesWSBKOMl5qG
	1bj2xO1r+s0yV3VNRMmPZWLPDq8N560rMeP9xgS95zIMivT5ikzitNDyojZ8p/1ZpmFdBEEMrog
	dx4/Q+Oi21S8kGlD3Y1QGx1VXcGhDOX8ay6Yp1zby5d4MCywJ6lLEj5mSz8WlBWf8034=
X-Gm-Gg: AYBFou0hWeFexpR2Ad/0RDMWKNJRBpZIcnaJ1cL7ceAAppHh61WtEOqVXlamF0RCrG5
	XQiJ4kABAgEbkPmYwykAarSfHNMkuLrx20rr+/ciqbbKk+xxQiL9JydDqkSsD9rjVCWL4mnCjsQ
	FTrVEIpWfSNhWJOFQUVFLCXfD0TLFSe03znDXWKsw7qwzd06mon7MyaOn3Lw7Czna4QEer0tc4M
	XAu2PaTQK94lKJ0cjgfKg63S3mKiyZALCvdqqy+WoAvy7evL5JG6D2HvTkvzHvvXncCAWdqRtQw
	hP6+IyuK8rI+uceoNcDj+irwJ1bxMppwkGW5aZVqpb4wh3YMkcYAgcqXcMkYUfQuA7KcKkaziFh
	L1dqs6gdLw3d0Uy/mFp4rSNlvcZL7ZSGMX8p7oP3oqG7ZiqnwVtFe6HuaxBaW+xNzuZJ76hHL
X-Received: by 2002:a05:7301:71a8:b0:369:ff7d:840 with SMTP id 5a478bee46e88-36f76c138camr9067079eec.21.1794074819347;
        Sat, 07 Nov 2026 10:06:59 -0800 (PST)
X-Received: by 2002:a05:7301:71a8:b0:369:ff7d:840 with SMTP id 5a478bee46e88-36f76c138camr9067032eec.21.1794074818692;
        Sat, 07 Nov 2026 10:06:58 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm24710212eec.6.2026.11.07.10.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:06:58 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 23:36:36 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add I2C and TSC clocks for
 Nord
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
Message-Id: <20261107-gcc_i2c_tsc_support-v1-1-433d02972d7e@oss.qualcomm.com>
References: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
In-Reply-To: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: FsQGFXGYwh1bkoeVlaslkX1NYNYUv46W
X-Proofpoint-GUID: FsQGFXGYwh1bkoeVlaslkX1NYNYUv46W
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6aef68c4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OfrIayanZ0Hpx6dNCfcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfX7xQPd80BU3X2
 5i3KDXLWoxRyFuCAfeTA5MgGBCS7g2rR7a/9Vh9F2ezX3Y4LwHa3AmnupMdhqWEol9u20dyFjO0
 fSWB6NW7Ah8UBMZ1Bzkbxo+YE16XkRhm3aizlmEtka/77ti+C7jRqs+XqtK2fZyqYJcDGJpCvih
 CCuvmutlvxflbPBLwKbUaqJb2iZ/mVwdNq0VLS3GSaXtuSygiDz3PUOcncV1u6XapMZL2ZEPTmF
 xIxjsoN923+HPMlktRF7Z5NHwH+TeOiwagNysuC0zF6XEH8oWLdgmDQresxO+zYi91auJfvaJr2
 cOz2T+VagcsIyhAEmOcxjblQVI5lH3EJSn1+Ds3ykgN84FEldGStNWB4VSjmIs/Zd+YE9WOVBg1
 hF0nYCsieJvAm76ufxHBwDHYGuhFdnGE/DBwtxGYLQVTWzG+pbaMdMeWLR7pkdsyOmhcAuvSSPP
 mrnDgCvUEYIWz16GwMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfX3egldKCZe9Z0
 Q1ghIVeQwEZ13ZPABGbyqDzoElmqMcdQz/i4IlASHy/jNxZnhcuQ477vzhGzKnfK9ImorDhfyxC
 ADOsD90XNWciRiAjJWUOKC3S90mDy1Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070072

Expose the I2C slave and TSC subsystem clock and reset IDs used by
Nord SE GCC in device trees.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-segcc.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,nord-segcc.h b/include/dt-bindings/clock/qcom,nord-segcc.h
index de4539b999850294926854a45db2997043c74f2c..921b216103da703818fae4d4a572a6a5288e1513 100644
--- a/include/dt-bindings/clock/qcom,nord-segcc.h
+++ b/include/dt-bindings/clock/qcom,nord-segcc.h
@@ -86,6 +86,15 @@
 #define SE_GCC_QUPV3_WRAP1_S_AHB_CLK				76
 #define SE_GCC_EMAC0_CNOC_APB_CLK				77
 #define SE_GCC_EMAC1_CNOC_APB_CLK				78
+#define SE_GCC_CNOC_I2C_SLAVE_CLK_SRC				79
+#define SE_GCC_I2C_SLAVE_AHB_CLK				80
+#define SE_GCC_I2C_SLAVE_XO_CLK					81
+#define SE_GCC_I2C_SLAVE_XO_CLK_SRC				82
+#define SE_GCC_GPLL1						83
+#define SE_GCC_TSCSS_AHB_CLK					84
+#define SE_GCC_TSCSS_CLK_SRC					85
+#define SE_GCC_TSCSS_CNTR_CLK					86
+#define SE_GCC_TSCSS_ETU_CLK					87
 
 /* SE_GCC power domains */
 #define SE_GCC_EMAC0_GDSC					0
@@ -96,5 +105,7 @@
 #define SE_GCC_EMAC1_BCR					1
 #define SE_GCC_QUPV3_WRAPPER_0_BCR				2
 #define SE_GCC_QUPV3_WRAPPER_1_BCR				3
+#define SE_GCC_I2C_BCR						4
+#define SE_GCC_TSCSS_BCR					5
 
 #endif

-- 
2.34.1

