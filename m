Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702537;
	b=DXVw6OcdXXIWC27uMKmagLVJQGv4SNptktRcYnD2IDupLhrbwK44b94J8BHNAtcMTB/n
	 jmVICCUytuL9ie6SnDVKJ6yQmDszaTRhCF6o0/J8RQAMTrzNzhDNuxdXXZlz5OJ3vzssh
	 0FNqw0djXwADT9CtD2cj9235AqsC6sEj2nyzQ311riYMzUkAjdhhrtNnvFj1yqKcCgeD9
	 endMUE8NaNCh90O0UGE172Htzp5WQuIejpk+1BnhiO7afL7LvXcmmqTHn9ouSkZ6cHnmL
	 1VhjLS+lb5tkmBEuP1thBBtrMnZpWi9FHapV22eIezurj1HqbyV74b2Evs6EqqeqFcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kswkVcJqFu6iYvk3uL7KCXJB6BHZdZBYHyJZNqF314Y=;
	b=fAj52Hn1gsrx40vF0wpY03LbmnPaO78N/Y0yBJvmRpI9W7zpGty7ZCjDGZsrg84t0js0
	 J3AsoXCMFcbvigFwB+3YFxN90SosGYQWj5+8vvPDXk4RCj8YDcxEUezbJv4v4Dfb6PgWr
	 Qo8zaIRbraqEg682+DgUldkLiVUS+p32Dm1X4Q823kxQ0LrRsrI3QIUG/RKeN2+oveWQ1
	 YUntHR7Tfv/3A4BXMsAYTBfNHrFz6uoBxZlJ+FDoHSGtRCLYsNRQZsqqw6cGtKj1uJ+gq
	 03T1CD6F/tf66uCI1bZhuNpPLPy2EjCLvvdBUCCxL25ekle9E2SC7bU6dt9UJehdvwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FKSmTOSw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gb6jKntD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCFD60A382A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CCFD60A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FKSmTOSw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gb6jKntD
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3A9xF63130802
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 10:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kswkVcJqFu6iYvk3uL7KCXJB6BHZdZBYHyJZNqF314Y=; b=FKSmTOSwWEpbl+Jt
	ASkt1SBXXAsF4qqnMXgWcToeVswAK2B0hauyWXgGIgA9OgvpyXUi2aF4BNYk1aub
	Hs81vSyGBG5db8K1XcEvsEDb0+E8b9ZIW+GAFj/mavCatSowhhELv7IXoo2oKjq8
	K/gh/htPzssAOiHQ59MpwwoZzmhZjtqUCzgp7hw6u+qIgJLYkhiDum+HlxJgSknB
	CiVU8L8qRrvNo0KMYoqF9I3N57epU6yfQHkoISygScBxyjYxdikz6VkpoiH/YiJP
	wWFI/l3zjk2wfSB8u6tir4NnZg2LUrl+SalZAv/K17sEkksupSkpAC/1DOGtCFSN
	I3/VIw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94csa1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:42:15 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf3a6cf1c8so3063354137.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793702535; x=1794307335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kswkVcJqFu6iYvk3uL7KCXJB6BHZdZBYHyJZNqF314Y=;
        b=Gb6jKntDBqlFtJxUn3wPbMU7KNfpSHx1fUuWoa6Ik6Hx0UruGNnDsvx4E4w2pGwLqU
         nCNDVzZDBVeiZtnHA36+Saj5BFs2jxjttrH75GNZ/H1UodM4Lw7kDFH5eAsIwIoa0hyw
         X6tjl1L92cW/2HedqIgHPWVLVWfCa8JiPH4KFxsbJG5l3cDwHSKInaZnAvHf1Hl9uZ1o
         LiLOLyG8KapDONSlesLGMNlWoL/JMjdXMye0HIrWNjtfdvzfi267yj2CuZc99CUoYqXi
         NQ20g/kCH6py4z1czhs+aX7CAk5FWTGilOh8ZZHyKRGkRvfswCu1+pLSetFi7loRtjbi
         Wcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702535; x=1794307335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kswkVcJqFu6iYvk3uL7KCXJB6BHZdZBYHyJZNqF314Y=;
        b=qbDe1eGfZOgQFOcv7gqS7BhRft4+wPB0fqMTN7Vmgp/Vhjl5V2KKh+yA88UtkAW015
         ej1znLeVYE6XbPHeuFpcg6hvvk3cgtndYmtrSPuzgyRbsoto+9r36vrj5zGrqaYYl0vO
         j2KWxsQQJPOFTIW3YEvWqkgmsdd2Mqj7o4W69JR3Sb++vSqimw9Nw8xQQOIfN/HW4LDD
         jWwtFb4f7cDlc7rdk6nWIEpcPqFck872XVDxCyLom6wcfKOje9oM71kwvgo5mykyYgVo
         m2S4FUfFdlWnwGkiLDsrDw5jfeXXKP3LlDLSTN4DMlmDwsRlVPXTvUkqfaM/O0Bx/n5o
         Ltew==
X-Forwarded-Encrypted: i=1; AKwUvByNSteUqWwevpeXl4KdFO5sdgtJW4g8/WxFMv+Gg0pvcalY16i2XWbpU8Zj2N6/NI1+wtTU4yxjJ/22pZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ht8ahLwE9y4WL4BxqMf9z67AEDXLWC5nx79G5L/cFtK9lmGd3
	XpMGj4X2LTPc4SbXRqS+Aagzc00iFEKrZqw0XtMbSwShB/fnrIi3ZTYPkxq5r7bUdNADB++HDis
	8BHvyIP14h50x8shchZyZqu44IlJL6w7ysoqSBPhKT4YGa64DtvNr0m5y2qfXDPmnJQ0QeBqKCc
	s=
X-Gm-Gg: AYBFou2RYDWpI03LB9HAxmIpmioop29kAMpJ3fgmzNsLw7A7eyhhBkrSIg4z6GwpDzf
	blOzdAndgnh9NZGlCQUrx1mqFNA8cURJl0/bfMbKWNHMj6AX50FsVcBRej3A1nJ9M/WdUjHFO4J
	s1GZjP5ybIBEi1ZtgcGV9LFNi2XWuKHT/XT+lAqIqCWiZMLbHUMbIdxcl5ey7s0SVbKOiNDUPrB
	+YG0EsUxl4pCRJmi3xGLJCiN9uk5iDc10vKttNF61SfRb3qiDhtkjqGgBxT/wns+ohk+Sbhh4N0
	ZX9fzl6cHOBvENuKxb+r8/pzXceeInsGHmQPUb6hUxJqsIW4TY8IOfF/FIWl1QfJcJJqArWk7Zk
	FXE7JWF9Ve5Wizm6BKsyj1gUJhfseS6knWVrAcrYVPqnVrfMgvZ1XScz7iJUd9sIjqIwR3MmMIR
	My0A==
X-Received: by 2002:a05:6102:644b:b0:7cc:971a:61ee with SMTP id ada2fe7eead31-7d072bb37ddmr5514626137.10.1793702529808;
        Tue, 03 Nov 2026 02:42:09 -0800 (PST)
X-Received: by 2002:a05:6102:644b:b0:7cc:971a:61ee with SMTP id ada2fe7eead31-7d072bb37ddmr5514613137.10.1793702529297;
        Tue, 03 Nov 2026 02:42:09 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm21625057f8f.58.2026.11.03.02.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:42:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 11:42:00 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: lemans-sa8255p: add ethernet
 nodes
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
Message-Id: <20261103-sa8255p-emac-dts-v2-2-05f9355df966@oss.qualcomm.com>
References: <20261103-sa8255p-emac-dts-v2-0-05f9355df966@oss.qualcomm.com>
In-Reply-To: <20261103-sa8255p-emac-dts-v2-0-05f9355df966@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6718;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wIX+dtXap22vxKfHl3aQrXg5c5Wlb6duJC5eFQWXIro=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6bp8jxTrJmclMCjpynGYSq0oMBrzUOA5EGHws
 2aH9g++ET2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaum6fAAKCRAFnS7L/zaE
 w97QEACRpsauiJHtkI0xoZtApx4Ey0lCGCzCYA0GZVnjtPgA31RelbTcBpOePxbW4ZolFYbJ0eH
 F4ttQWRJIs6ZTnSRFjj4trS+mw9OSii2vG0oDyIyiUFoty+ZhyyEi38Nn7dmHU7z097ShB4ypoD
 HMimZo3lPEc8bmLlqRecy1cveiv4Nd3H7COQmqBRXieTGam6szmX0JJrY13p61aOZRPwbYLmamq
 gkLYo7X2JhGVKsKjYM2tdZtD1Yt/dvsYA7VU3iMhYK2mjVKDlDx2cy7pIl8942tcUqoH2VeBO7W
 bNu0SwdEXcKocLlutWRwW+A9H9qxUIE9GU1UsIQP/d2nJ9V22OyxfAIfFe2uWWsXQD05sGOHBg5
 dZjlQcERSZMRiKN1bhA1TN4atKRK4cj6TiPmaN4un0qvCtUEp0mRFTl87+FjslntQk3v7sP/LbW
 sX1REHQ/Nt+w7HlCWz/FFXwu8zjNSaQSJ1SMTjq0K38VyN8Eq0s8AuCn98Oc5ejZTK2mZLxLMSF
 2G3xjNwKzlF19XFI8d1hgSSKmySWHXAjJhmxkaE+32Ya7/76f3XL05Nvi3p0IkrALOnH8phwWTk
 Kj/ZZMYoFjo7hKHp02CZ8DGZlEiyluSxzcgXsqoAoeJPWmprcdaelgwdylKyWtHIQsXcZten5Bk
 YAndQpx+BNNoxkA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9ba87 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=cRoNPkShb4stmH-eh20A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: wweoX1N8L6IyLP0E_XYzJefoe2OxCEtK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfXzw39rmOY28q4
 xnj6H4HNt0DF1IQXv0wxu837a48JxIQDkLluts01TxEckzZchKQz3ZEJdT0ksf+hmsBX5sioE72
 kVoDds0xsnU2V+BnQophf7Bd5dk0kE8te+PBpMUWvYX3X22IDoKOTK6qKxk1evOgEE1wr3b8V3i
 ZhrDep9LZvKPduDifkGQu5eCp4CMmPtKonIH7aR/TDWgHyu2DuLI2q7xutZ6K7aJb/mzKlgrtLV
 k9t1UylY3Y3w5I2NL9CpvESiscqAXQ3qALX/fTTmrZftxRbrmzJCKKtRLAnxDSYyMyIKBNE8B25
 o7Qpg4DCRnnQUKRpaZQnwul3csn9PTEKKy8znIFwO3d/0TKDTHYErU7lfRdlcQcCLCpayNtGdxi
 uSNdmOjRg6Y/BNXSPfFDEzgD7l+e9piSLFmjTAeYcj/e77q+k/8CpBhLjqdc1kDg6kkmP0ubOUX
 1rl5jX4rLXHbQToVTXA==
X-Proofpoint-GUID: wweoX1N8L6IyLP0E_XYzJefoe2OxCEtK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX4mvighE6u5hC
 vvNT3xIWgibTc1ALqSXLFRKjgwvDPrvX9IajOIDMsHeaP9qtn0joxrANeQwcatWM9x0u3Yk8qgX
 pc8WgNCBYBf4MMbZlDXjgjp9XzeriNw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030042

Add the ethernet nodes along with their serdes PHY nodes for the gearvm
variant of the lemans ride board. Enable scmi7 and scmi8 to serve the
EMACs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  30 ++++
 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 207 +++++++++++++++++++++++
 2 files changed, 237 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
index 91c97a55f2787406b104650956b9a511a6a34c23..96a54f32f0eeb16dbce9802e74eec82622ecd35f 100644
--- a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
@@ -58,6 +58,18 @@ &cpufreq_hw {
 	clock-names = "xo", "alternate";
 };
 
+&ethernet0 {
+	compatible = "qcom,sa8255p-ethqos";
+	phys = <&serdes0>;
+	phy-names = "serdes";
+};
+
+&ethernet1 {
+	compatible = "qcom,sa8255p-ethqos";
+	phys = <&serdes1>;
+	phy-names = "serdes";
+};
+
 &firmware {
 	scmi0: scmi-0 {
 		compatible = "qcom,scmi-smc";
@@ -3218,6 +3230,24 @@ &uart21 {
 			     "perf";
 };
 
+&soc {
+	serdes0: phy@8901000 {
+		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+		reg = <0x0 0x08901000 0x0 0xe10>;
+		#phy-cells = <0>;
+		power-domains = <&scmi7_dvfs 0>;
+		status = "disabled";
+	};
+
+	serdes1: phy@8902000 {
+		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+		reg = <0x0 0x08902000 0x0 0xe10>;
+		#phy-cells = <0>;
+		power-domains = <&scmi8_dvfs 0>;
+		status = "disabled";
+	};
+};
+
 &ufs_mem_hc {
 	compatible = "qcom,sa8255p-ufshc";
 	power-domains = <&scmi3_pd 0>;
diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
index 6f19064997a4b50525fdf630307b843604368645..2b3c9e90802bf89b91354039f0e6a24941fc95d5 100644
--- a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
@@ -14,6 +14,8 @@ / {
 	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
 
 	aliases {
+		ethernet0 = &ethernet0;
+		ethernet1 = &ethernet1;
 		serial0 = &uart10;
 		serial1 = &uart4;
 	};
@@ -101,6 +103,179 @@ trip1 {
 	};
 };
 
+&ethernet0 {
+	phy-handle = <&sgmii_phy0>;
+	phy-mode = "2500base-x";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,ps-speed = <2500>;
+
+	power-domains = <&scmi7_pd 0>, <&scmi7_pd 1>;
+	power-domain-names = "core", "mdio";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sgmii_phy0: phy@8 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x8>;
+			device_type = "ethernet-phy";
+			resets = <&scmi7_rst 0>;
+			reset-names = "phy";
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+
+		sgmii_phy1: phy@0 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x0>;
+			device_type = "ethernet-phy";
+			resets = <&scmi8_rst 0>;
+			reset-names = "phy";
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&ethernet1 {
+	phy-mode = "2500base-x";
+	phy-handle = <&sgmii_phy1>;
+
+	snps,mtl-rx-config = <&mtl_rx_setup1>;
+	snps,mtl-tx-config = <&mtl_tx_setup1>;
+	snps,ps-speed = <2500>;
+
+	power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>;
+	power-domain-names = "core", "mdio";
+
+	status = "okay";
+
+	mtl_rx_setup1: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup1: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &gpll0_board_clk {
 	clock-frequency = <300000000>;
 };
@@ -145,6 +320,14 @@ &scmi6 {
 	status = "okay";
 };
 
+&scmi7 {
+	status = "okay";
+};
+
+&scmi8 {
+	status = "okay";
+};
+
 &scmi11 {
 	status = "okay";
 };
@@ -162,6 +345,22 @@ &sleep_clk {
 };
 
 &tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
 	pcie0_ep_clkreq_default: pcie0-ep-clkreq-default-state {
 		pins = "gpio1";
 		function = "pcie0_clkreq";
@@ -205,6 +404,14 @@ pcie1_ep_wake_default: pcie1-ep-wake-default-state {
 	};
 };
 
+&serdes0 {
+	status = "okay";
+};
+
+&serdes1 {
+	status = "okay";
+};
+
 &uart4 {
 	status = "okay";
 };

-- 
2.47.3

