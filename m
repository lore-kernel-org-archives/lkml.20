Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562739;
	b=reKXiC49QuwnT0tT8Qjg+XD97lpYFCju9jEFFssZrVotdp7SfLkc99htwNX7j1nTCeMF
	 yEng9Wlsqy0V90HupuOZfUcMyTpX5N9IWVuG8woLy51UziUitS5tYqS0J0+8p8ct8zNaW
	 6gImGLfku06NZfGJhj2YlSfZY5tGzvvLtLiRbXNXsiKgYN107tB32Q/XcDfhh9maj4anS
	 4s9XVX386yPiPfEl9eHPQx3HQUjOTzxXYahnVOUCOMV9O39vjitwdXg93/u7RKIxzCQmU
	 ZYTVMf53O3ftX5SgP7dn9CH8ZonSjxolp8TqApD7NozkJBzMffuUUAbkYpgluR0Lx9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vMzl0oWBKFdcSse6+UdcS4D8zuTyqq/njdvWufDbLus=;
	b=EOHapo0o3SZWLd6IuuF9YrYVjrHziFl9h3Fm/xLTEdvGI4HEIipzZYvV3NYF+iieJ/04
	 YtJ5OhX6bHS+gt+ekE030PERr6szXSxYYxpObPx8syRahfqa5E7IL4vPjLpJQr+6yAmq+
	 6YQmMfXqTiZ0fuaE95Xdfi+SGMrP5S70Ny/YSdXNLcrv7Didq4/TiNFTfymLz1olXma1/
	 eu/hWjFynLIQ0p8BqbNsHZ9YJETwTtORAEgBsXrkfTouN+SRWWGmGk8wpZvVMRK8ghCva
	 Ynxba+PolxSju74O6ltLKAG6DaaTaqfw3rayBBtBBwjvd45vmPH6GuOwToFFG1O7cPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aax7Kmb/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hu4tRZgs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79597606A8BB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79597606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aax7Kmb/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hu4tRZgs
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8Uv7r3164532
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vMzl0oWBKFdcSse6+UdcS4D8zuTyqq/njdvWufDbLus=; b=aax7Kmb/MSfhJccA
	8PGDzmcGCa1jw3YGW+Ev1qQh8nZugxsqR6zOeEQBzE6bWEbCvGazUsla9ln8AE34
	dbyvSeZ2+p9UMQ4ARho3q12MtacbtoUVqX73j1RTieg74Zwu/0eHQOG5IIgwHVio
	zRVAbsBp7+ivRgj4urDKES/6ZCegI0uOzY4vZgBwcWmF0xn4bFrPr/dgSVzfO1uH
	Xs2byUCQrcO8oYCaCYMgMPWTknQvwSpcjr3TBcnR6gxWctYWzZ5jQhgFV+4X9K18
	ynNXEkubUaIdH6JZdk/ye0UQaMB9Dz+hUhUw6mKLz6sXsRafGoNOh4Q3bjOjZytt
	C4XoCA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2ms5dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:38:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2c0e6653so13170485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794562738; x=1795167538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMzl0oWBKFdcSse6+UdcS4D8zuTyqq/njdvWufDbLus=;
        b=hu4tRZgsk3hpt6KBZv4EhgKWo1vqvz/KNQmC6qlKE2mbcvcf2HhDz2TYn2+stAwl/P
         t9snqDOxRJPtUvK192W2IGsmey+ZShIbjWxxAVhMpTg9aTXLh9TLIVBCRsSU7ep+fyUg
         dY4PtSSZmZ4TSDNMBZ1clLwaZsLaIHtLJGnjub8pkYvnCDgQJn1AhTT6FTpljh9zBdvq
         14feMH4afGVQC9MTuDitF497UZzNbeeSxyB2pY5hicZpYWpbvTwzCXSyCYwZFWzA3S+n
         s/MdNB9bQOlwDSLcwrtOgFRw2/U2yZ7UoFYFEtrvhZP8m4YK0YGbES7adNFVOgPfGOkR
         c7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562738; x=1795167538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMzl0oWBKFdcSse6+UdcS4D8zuTyqq/njdvWufDbLus=;
        b=GCMsJ7zhgBBPGf9KOLzN8TvwvbUbxFlwMrZHgwo5lR8vNwE7z85c5BnYzPB+60SkbN
         xU9CvrkChTqfw6FCTMH1kom+G33rrdlYW2o/ZlSa/e9JDw3e5GsuYWkuEqzkv7Eg7Cv6
         Oq9lhLfMryxfmawgN9RTvL6YVwZRrH3mm3JRniReV5jE+M8cPefOqOE6gjFWe+aumztk
         ekytwsNZEE2ndq7VccNJJrpSrveSe/aNiWVSPrhx63FrGi3hO94ppwR/J47rrLC6Lry9
         SRgl1JoZdIu1uS6nImDmi+LGal2jd3OtFlDD/U4mpy+EWWoF2zheRGhr2m1jHbmWI3F0
         7zHg==
X-Forwarded-Encrypted: i=1; AL+hErELCjNJIo6n1bIp/9zZMZplEXG0UhUIOBCdqMcdnPbnDOiUI1yWfDsQuzYMCr/t5+gkvGMW9vGHxbDaAFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/BnPjvpYTTf0o+cdk7ug9/2+MleMIA0ZZ/sdutOXnOhwXJiNJ
	4GegtEE2hYpV4rSLi6J4mZzMrVqVDgp4Xq2K9SpAhAskVjXFcQv6paDgHksxdPeycP1U3njuV9S
	/L30/gX8n3SIYK1mqVAIWM+0hIb9bJ6nhFvL8yiWJWUiITrPJPTb57IfK3mS3/wOLdEs=
X-Gm-Gg: AYBFou0KykIu9RexL8aWc/4F7pOmJOXGdBq+4oMZ69P5C9soyHzfh2r6OOm1h3rNnjN
	swn7Y7oCD8mYwwUmemqhwH06Fy6GXNa9lA1I21MXZcVRbPo91YUspqqhJE/WwlDNO/Vcx6zG4FF
	y8a2AwUukbuURtA10CGczghYre7gOknr7/D0OurfWb6ffI1BVvv6ZxijIzjcAdu2oB21tCGvk5A
	NfslmRaFpYrbe7w1FerH2BYt2ZlzhtBY7SFUJ67pwklrY+SjJvi9Xvm1JG8/JKpo4QTVySr1D8a
	GbGwaoJsgRJQksxxxtxgmsYISwjIY4NpnB1jp3i72KQ4txRPdwky9rRuJvTbxJxZj4h2xJ63KHq
	mS3nQAC/d+aH1gtlcF4//ccgyGwm78eqwICTqra4AJMS8YeE87Nr2lsImjpBPsdgNGdiGZ6suWO
	MJL/EPefB90vrXXqKzxmsP47oa10w9k1uVBsj6mOnGsJA4r0NqmxZnbsxhPZUmfLo=
X-Received: by 2002:a05:620a:199c:b0:947:6585:aedd with SMTP id af79cd13be357-9494b9c7ee4mr343349285a.6.1794562737876;
        Fri, 13 Nov 2026 01:38:57 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:947:6585:aedd with SMTP id af79cd13be357-9494b9c7ee4mr343347185a.6.1794562737443;
        Fri, 13 Nov 2026 01:38:57 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm46458455e9.13.2026.11.13.01.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:38:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:38:49 +0100
Subject: [PATCH v4 2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP
 I2C/SPI engines
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
Message-Id: <20261113-nord-gpi-dts-v4-2-e4a1510687c0@oss.qualcomm.com>
References: <20261113-nord-gpi-dts-v4-0-e4a1510687c0@oss.qualcomm.com>
In-Reply-To: <20261113-nord-gpi-dts-v4-0-e4a1510687c0@oss.qualcomm.com>
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10298;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cAFCNjNiOqULQgAoBZ5vMAFaF79vP+0nTT2bGTSsVc4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9tqrVNEROJllRbx11XQNn5t60E3TB3iHgvMkp
 g2DRQoyGEeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavbaqwAKCRAFnS7L/zaE
 wyEHD/42/rlmfcsVAbClFSi/W/hXqLHh7eQVzcxaqXE9e5hs/fYht1Jc134/0b+S5zx+CrzHvct
 YjMK9KFS9dXA5tePAVQhwQ6/DbAV1ZoLWBaNve/70qCdN5Wg8klBS6CCftOb5UkEyhpYQrpWHcH
 i0jPXVxoovWV1zrdPDmv1FO4Hiv6HDySNQqnqkx/QSDtDdoZnQWkcnck28wFbZKVgmunpIzflZZ
 pY1UCEF5MUZMrSO1Z/fM4JK+sWLI/+WqxUTB2f05/soIXB+5ucR8T8RNfk3ha5pqQ6rweJYpOnp
 L0pHkOti3f+rglQIXb3xbp2r317wk8ptACtfsAA+sXPHpOfbjeFGv/WVqcEoOhuTkd7MTcEJ/mw
 CNXbAhJ2H1CoDKJguJCH64mkeG3TgnViIbW0KCyNAKxD09ya1FZdi8kIucgOGWXs3eSayVNkHw9
 nVlJRJmmesfphTUpw/KyWA3FvTaAaahiD+dDJW/L33eg29VWghHUlstPLZC+G6FqkduNcPKChFP
 mqmPn3wo5pAF5slCIR9LiimDBfHz/AuLRaX5c3VG88Van0XueundTFDZaoAatlJrtC4QvYeXmhP
 cRKYPnXYkaJ2SfDLW+hVYeBqbQQctjZaAxGGQBBqvNbAcnND5WcrA4VxXgT6jFqk0+rKo5IX/Ui
 QMnqzu1X63eGb/Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: IVXwDzpVMr8a2aFHpzsbOOKuvHs7Mu0N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfXx5WcEzOvsmev
 3+t3osWEAyStk7hgz1PFwPLTuF/RmmjEu05YWP9p1dZIYFIYNUA3GhRnuCc2bQ6Jo1jS3TeWhUu
 EtLsVfsZEciYJ9UrP47VDWbxAaypbUe5S4GUCJTwnP8kYhq9rrlQ/45Yb6SyNtSjQBCggevrqZx
 BeWluJUHW/xPpSpDJtr14CMR0RCSSlOdpzLiCYnYeR3yCb1ZqELRlLQZcfJ+zCy6OnnrPNQABng
 g7N2z6XjyLL+TPAw7W0JZON6nQ18fw3nrQ+oCCKyTD2EPD3DbhcOZyAY0+jaGacsrDrccwbPg0q
 c+1DDL3hrElcjL87ja8opOxbKIDzBBZ2dO8/NC1VNQEV1WKVTB7vZRDJpeVeP9S8OWgYUPZB9aA
 jH4szxNWrgH/CyasKkEqtreUvTZiusb4r4T/T9hUa2EDo7ohhN6Ah6HpYQpfyKac1wP8kvYlRZF
 aAfA1R/7SMhzcgDsWjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX36Ur8VSN/B47
 M+5GMzsc1VqYFH1nmBQQRYL0hqtgRcs+obAVWU9oS696xXO1HfceBPAq4VZnKT0+aMs2FUSNemL
 EYP81fG+YmOb9D5Jypk6Exj6tIUuS0E=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6dab2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ZrG3xX64ESdAxBh5B44A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: IVXwDzpVMr8a2aFHpzsbOOKuvHs7Mu0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130038

Add DMA phandles to I2C and SPI QUPv3 serial engine nodes.

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 124 +++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 68787db708f613d61c4b88762bc31259304e7f71..818f6054bcec8b020f25b25a774191942e98edbe 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1071,6 +1071,10 @@ i2c14: i2c@880000 {
 				reg = <0x0 0x00880000 0x0 0x4000>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1098,6 +1102,10 @@ i2c15: i2c@884000 {
 				reg = <0x0 0x00884000 0x0 0x4000>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1125,6 +1133,10 @@ i2c16: i2c@888000 {
 				reg = <0x0 0x00888000 0x0 0x4000>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1152,6 +1164,10 @@ i2c17: i2c@88c000 {
 				reg = <0x0 0x0088c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1179,6 +1195,10 @@ i2c18: i2c@890000 {
 				reg = <0x0 0x00890000 0x0 0x4000>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1206,6 +1226,10 @@ i2c19: i2c@894000 {
 				reg = <0x0 0x00894000 0x0 0x4000>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1233,6 +1257,10 @@ i2c20: i2c@898000 {
 				reg = <0x0 0x00898000 0x0 0x4000>;
 				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1244,6 +1272,10 @@ spi20: spi@898000 {
 				reg = <0x0 0x00898000 0x0 0x4000>;
 				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1290,6 +1322,10 @@ i2c0: i2c@980000 {
 				reg = <0x0 0x00980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1309,6 +1345,10 @@ uart0: serial@980000 {
 				reg = <0x0 0x00980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1317,6 +1357,10 @@ i2c1: i2c@984000 {
 				reg = <0x0 0x00984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1336,6 +1380,10 @@ uart1: serial@984000 {
 				reg = <0x0 0x00984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1344,6 +1392,10 @@ i2c2: i2c@988000 {
 				reg = <0x0 0x00988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1363,6 +1415,10 @@ uart2: serial@988000 {
 				reg = <0x0 0x00988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1371,6 +1427,10 @@ i2c3: i2c@98c000 {
 				reg = <0x0 0x0098c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1390,6 +1450,10 @@ uart3: serial@98c000 {
 				reg = <0x0 0x0098c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1398,6 +1462,10 @@ i2c4: i2c@990000 {
 				reg = <0x0 0x00990000 0x0 0x4000>;
 				interrupts = <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1425,6 +1493,10 @@ i2c5: i2c@994000 {
 				reg = <0x0 0x00994000 0x0 0x4000>;
 				interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1436,6 +1508,10 @@ spi5: spi@994000 {
 				reg = <0x0 0x00994000 0x0 0x4000>;
 				interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1482,6 +1558,10 @@ i2c7: i2c@a80000 {
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1501,6 +1581,10 @@ uart7: serial@a80000 {
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1509,6 +1593,10 @@ i2c8: i2c@a84000 {
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1528,6 +1616,10 @@ uart8: serial@a84000 {
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1536,6 +1628,10 @@ i2c9: i2c@a88000 {
 				reg = <0x0 0x00a88000 0x0 0x4000>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1555,6 +1651,10 @@ i2c10: i2c@a8c000 {
 				reg = <0x0 0x00a8c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1574,6 +1674,10 @@ i2c11: i2c@a90000 {
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1593,6 +1697,10 @@ uart11: serial@a90000 {
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1601,6 +1709,10 @@ i2c12: i2c@a94000 {
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1620,6 +1732,10 @@ uart12: serial@a94000 {
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1628,6 +1744,10 @@ i2c13: i2c@a98000 {
 				reg = <0x0 0x00a98000 0x0 0x4000>;
 				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1639,6 +1759,10 @@ spi13: spi@a98000 {
 				reg = <0x0 0x00a98000 0x0 0x4000>;
 				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 

-- 
2.47.3

