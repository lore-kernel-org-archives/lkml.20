Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920784;
	b=I0zgWKMo1QaxzYI/t+7L6RC1sxD3h3NUQxad7nAcWM9T0nsy8FgVsg9xDMsQQWisHPEX
	 yQBQF9dP8evfLx4agK5nuLowoPzLkBco4DpSNpme5P62oTVjNhk0VbItVn1+6B/mvardg
	 /uaenk3RMR5lyks5fX3KAFbjBi28iHCEjkyWZteNzIT9GJ0PTMNtBYNkRqCjTFbDvgtKq
	 tYVWwPrKDwdv6mrd2mBaDxF0r+/C/jkiobW80dqgBKp4RI8n5X2bS9BuLbjhGUIp5nCf8
	 n4uXcUioyD2ZXeC/d85MgA3mLlBcyGprPSlcyvqNBLkfjWWkUNPUsw+je4ZKhkDdRwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920784;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7KZKnHLwk=;
	b=FabpBxA5t/xBA0C164dHNgQyzrpWh66oOJ/VSE2/VvUgrZcG3tsZDEZ1JUM4k2ElIa52
	 o/57QTGguDiz/mZ1Yvp0st6aipAQRwqSqjL25HgUyEczXvKOndXYdTAreIHs2TYJpmajC
	 8iykr4mx1nP89uC7HzUFoNGxXxx12YUB0zAfcN/Jvy3r5lF9gXWvp/TQ1HYEAuD0Y6a0k
	 QHi4DHVXpqpo51KeJq5H6MRC2FhjviLkSnTjjK/UANCxzsOUL0CKEAiUTOjSVaLXZuLRU
	 S3atw00dxULiy8Ah6LazJO6tHOD2njRYoaWnfAPh9HCtuP9LMxQ2I7pUQqxmh3/veMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GubjcS3W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MY6jS2DG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1193E606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1193E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GubjcS3W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MY6jS2DG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1L2x466627
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7
	KZKnHLwk=; b=GubjcS3WWE//GTAtNVooXD6Dfo7xWxMD0xQSB3+z4b/XkFtE2Vf
	E5oEAbrcgvPs6Hg2rFUlGD60XPEVEPezlRL5Go1CnsIKU1IQu1oBqb9gbtRWB26y
	/rmZOsQew60thQTNvoPXehcYgbmq2Ufxh7M1hs9LjHvrkRT21sVSdmBLv6YSLAIY
	w4JgPgVwvDwSkZXL/g75UBPuJDh5mbUl2jKnxBpHXpRoUsPE3JuSVsVR0XL552vf
	UEnIg2N7dWfx/FyMMkZauIDFsAjANGjP87iNJM4+M2RPvNmiREP5hvoKZv6G6fAl
	C3l5emmzK/xAYe4hSaQelPUoxAceqpcUfYg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09htk7ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:06:22 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-990c957f129so584580241.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920782; x=1795525582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7KZKnHLwk=;
        b=MY6jS2DGf7bBCYaUMV58mWVRaw7N0QsxvvJTtb/mwGEbJTlyKJCHFBcnpuIMd6qy7N
         y459ewUh0gbgI2Sf8lbZPtT5dhGbWnrqGdTvbAOE5hviUYRZAoU9q3PFniYNwS04sexp
         CtkVPR31oYctXCLO39WL4pcI57/DM3p9bb4jNyTxcNBVSRb4STTEtmMq7N1yg0E0Vsg+
         7zILKEdHszbX5jp1JFIfPBYc+GpN4EbDOsER4fto0GDuGetxr2L02V8W/LlIO/a22f/z
         oiBdYl763XjFXafYYuBxAlUUrye9OjAPRHhu77elawxUk1Y29j9PZb4S55JZvFGxsGHm
         A+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920782; x=1795525582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7KZKnHLwk=;
        b=WyRWl0sr9MnURfhaHkT8H6qfnVC4vs/2vnP4MYd9hjbs28ng1SQbzRGjcI97SIlUGX
         Ubd96JDj9iMufr+H5NpOekVZGAz2PZ78miiFAUkFhOYQiB8NLKikU98rPEqnWBc7iqRO
         a4jaRfrAmx3H8D8bo5i3kTvuwaONN3GpZ6JGPi4nOh7JvEbLxKDWkYk/ZJCb6QIl9xJw
         RVITEVUlhBno7K1sKMvFt9mCTBL2km3yooLXTZZRYVmKDAf2igq33yl7T6yUFYVfsQl5
         feGCwQ/aGovOXb3s6qrldIpyiaOxQxNzw82sAJtwYN9brU7w580k74TJmBFVMok4j+h3
         +W0w==
X-Forwarded-Encrypted: i=1; AL+hErGE3JT3FgQZIRZambHCHw6fWe6N4MFbEDPef1DzAjo2GLD6XUaYTmn73AfzkzfwYz5xBYo225LCyTDLsVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GNTLjOT16lIimI5FWrHPWyGOVG9AVRipnNozPMidmE2+t9iji
	He2XuKZZR3c5qYA7R1DgVyOHObE1DQRCPYHfF3i6dGdcwQAJ1pyHRQBFA40/dDLEw2l2cMyePBY
	xhfxqoKDFjX+9QwZOBEnqMfAD7Xpw4yqjN1bCqeYviDLErY2DkQmNTo73Y5BZVKADBko=
X-Gm-Gg: AYBFou1nudQk1zXjqFPzLia6sdw8xpasv6UP6mNVSiMsN2vMoLPBul+ICwW/HaSQmR9
	nLEBOomf5LBVvECAPWtz9nvRvdFXYJdWB5zmOdMGW95LUAi76UICK6YA0mzovB9zNzGU0o5VDho
	/kHVoy6WRgaTnADUaGWTvKRkURMqBDNxUUcfb+ylmaIbdtBpsFbWOfdmv3ub3ecbXGs3mjj+P6l
	TSGYqRz1e4rXrWmrnCx1ohrFu9VjcTFO6i6vhzRZiq4bF7p4tqZ8kx5G9nbaF6lmacJWsNtPGr2
	MaRQdFJQSd1J8nRipOwi3KCFKri16yitkfBTgZ/GUI1WrRV8AjaD11cu5fCxjZGybbZ1RnSqMLa
	YYXdXDvHpr9HoBrOkCm0ilUcXFjltLD0XZCHPwVeeYJdM7aoBXjaHHh2TyzfHww==
X-Received: by 2002:a05:6102:2920:b0:7d2:fdb9:b189 with SMTP id ada2fe7eead31-7d69f850c5emr659921137.34.1794920781665;
        Tue, 17 Nov 2026 05:06:21 -0800 (PST)
X-Received: by 2002:a05:6102:2920:b0:7d2:fdb9:b189 with SMTP id ada2fe7eead31-7d69f850c5emr659906137.34.1794920781161;
        Tue, 17 Nov 2026 05:06:21 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5835117a12.9.2026.11.17.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:06:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: apple: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:06:17 +0100
Message-ID: <20261117130616.234953-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5232; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=clfI8+19pJhAA+hV4S1Z6XrUeG5urAAHKTU1TXEfHlo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FFJYgi+OqbMxgoQ89jlVKosb2EARn5KZIaER
 f9mvb0IWpyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxRSQAKCRDBN2bmhouD
 15HhD/9oH1BS9LqVZQUmtukQ4pBKCTUnveLA8banunKm54eECmroM6X+THHC/UIfkgTIp9t3WUn
 FSAhCkt01Vr+dQbCnSu8lY0JPjnuMK2wOaKZZZPHzbmUchlIfqpOjq4pwoom4AkX4Es+RmEXl+j
 3LJQNF3/DGw6d+YsEHxGCl0WNBqqCrIdTR5USi8kFXSbmIh8uFOo8iSvTcpZEXHhsw4o/m29O6g
 5fyalqopdTAJslaGkcPPy9E3NeMmGWWz52a+CAvcw+p111gRGN1W+j9JWpsEiJ09ukzCofT+zQ+
 5b4BmJXEOPUs2GkA1d5TTbF6w96/IsN0DNRdqHHOTj8EztnF+k2+Jvx4GFFruuDI9nCvIh0snBD
 x9PQTybp61IT07uCgumlUt4Hjfsl86eagESaE5Jo6xdDPPG38hvO4f60NY2r/sbayH6VETvYHD9
 Iz+2mdtArDeIRmNrl3G7LtqmzAj8T9IZ1yJq8r9zPsHiD5zemQ5gPtSBOK+k/7Z3qtjpmJiMJC3
 IGSdHVCHvrBRzXMFBS+bmH3TXODB+w588WrxwZ0Nr+3RMdUyb8lkWdsnwm6swZutHZsdrHl1+0A
 OtNrIpUmuNoRSr0v7+QrE+J+kaaXEV01l7HPe+6ltJVVgj/OfTs2Tfw1F3DcQNEtxEbl8i9dG/k 34eoEYM979TDAuw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX2ydSQbHSUEe3
 UyBi6YE3IeX0Ua50juzsHQWPf8OR9KMKK6B8wezD1YzNG2VoI7+KjdNVdcQoN6df9kdPGgPk4U5
 ctXxopPQTnb/PYtxk+sVCXjpSpvo5E0=
X-Proofpoint-ORIG-GUID: ivBORqsEf46AadG_ZyD0oQjW_PwI4jDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX76xsVo0Pp0KD
 0G0IQyM4svSXKqHSePYe/Prz3HJuS8V2iz0ZAV00O6Fz6BHQR72nZqMlHnfvLbzP5e7hnhdzavf
 XeeiRE42Wr5GTYiaGzoAU/ILmZQrQzy2m6fBlGh1XcLw8EiZzYR+mvCs1rsAbJLjhBnuKeCTjxa
 sZTLGBrlt3DAnWYANUxIMsrqAtFwpJHRUfmGDJqkn/rNZfmNTVRjiUt15KIyjvPU3unNwuv0WE2
 CKx7I5kd7U/jzz89kvfjFn9x5PIoGXNcLO/qiIXsFG00Qrf4kSleTH5vJ/nLjsSa70SlKnGP7mT
 ZUHG0OIvcdZnBBPvmAC2hmdzaArO9Vm7DNlpGdIyTyJCN47YWW4uOSul7h/gtgi+/YGb66GzDGm
 OtIEML9fnzzY9Ei5rBQLEW7BQlRG3s8giKT9Jua6406g7ww9igpTvABn53kkuuPZtS15IF0T93I
 PjvzDWnY5TT7ICX2hfw==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afc514e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Zz3YpKYli0cBJYq3SAkA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: ivBORqsEf46AadG_ZyD0oQjW_PwI4jDk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170052

The atcphy and touchbar aliases were never approved by Devicetree
maintainers, because they were never documented as actual ABI.  Drop
them, because no new custom aliases are allowed for years now.

This might break users of this undocumented ABI, so these should be
updated to use only documented and approved ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/apple/t6002-j375d.dts      | 4 ----
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 4 ----
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 4 ----
 arch/arm64/boot/dts/apple/t6022-j180d.dts      | 8 --------
 arch/arm64/boot/dts/apple/t6022-j475d.dts      | 4 ----
 arch/arm64/boot/dts/apple/t8103-j293.dts       | 8 --------
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi      | 2 --
 arch/arm64/boot/dts/apple/t8112-j493.dts       | 1 -
 arch/arm64/boot/dts/apple/t8112-jxxx.dtsi      | 2 --
 9 files changed, 37 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..9f0476e1ae2f 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -15,10 +15,6 @@
 / {
 	compatible = "apple,j375d", "apple,t6002", "apple,arm-platform";
 	model = "Apple Mac Studio (M1 Ultra, 2022)";
-	aliases {
-		atcphy4 = &atcphy0_die1;
-		atcphy5 = &atcphy1_die1;
-	};
 };
 
 /* USB Type C */
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index caded1636f3d..1a745c6593fa 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -15,10 +15,6 @@ / {
 	chassis-type = "laptop";
 
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
-		atcphy2 = &atcphy2;
-		atcphy3 = &atcphy3;
 		bluetooth0 = &bluetooth0;
 		serial0 = &serial0;
 		wifi0 = &wifi0;
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..3540edc56b0d 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -13,10 +13,6 @@ / {
 	chassis-type = "desktop";
 
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
-		atcphy2 = &atcphy2;
-		atcphy3 = &atcphy3;
 		bluetooth0 = &bluetooth0;
 		ethernet0 = &ethernet0;
 		serial0 = &serial0;
diff --git a/arch/arm64/boot/dts/apple/t6022-j180d.dts b/arch/arm64/boot/dts/apple/t6022-j180d.dts
index f76b887429dd..0b1f1bc46270 100644
--- a/arch/arm64/boot/dts/apple/t6022-j180d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j180d.dts
@@ -18,14 +18,6 @@ / {
 	chassis-type = "server";
 
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
-		atcphy2 = &atcphy2;
-		atcphy3 = &atcphy3;
-		atcphy4 = &atcphy0_die1;
-		atcphy5 = &atcphy1_die1;
-		atcphy6 = &atcphy2_die1;
-		atcphy7 = &atcphy3_die1;
 		nvram = &nvram;
 		serial0 = &serial0;
 	};
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..4fc9a42160ea 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -17,10 +17,6 @@ / {
 	compatible = "apple,j475d", "apple,t6022", "apple,arm-platform";
 	model = "Apple Mac Studio (M2 Ultra, 2023)";
 
-	aliases {
-		atcphy4 = &atcphy0_die1;
-		atcphy5 = &atcphy1_die1;
-	};
 };
 
 &framebuffer0 {
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..779da65a66e3 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -18,14 +18,6 @@ / {
 	model = "Apple MacBook Pro (13-inch, M1, 2020)";
 	chassis-type = "laptop";
 
-	/*
-	 * All of those are used by the bootloader to pass calibration
-	 * blobs and other device-specific properties
-	 */
-	aliases {
-		touchbar0 = &touchbar0;
-	};
-
 	led-controller {
 		compatible = "pwm-leds";
 		led-0 {
diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 686fb1dd215d..5304a5591984 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -15,8 +15,6 @@ aliases {
 		serial0 = &serial0;
 		serial2 = &serial2;
 		wifi0 = &wifi0;
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..b0c93788c72a 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -24,7 +24,6 @@ / {
 	 */
 	aliases {
 		bluetooth0 = &bluetooth0;
-		touchbar0 = &touchbar0;
 		wifi0 = &wifi0;
 	};
 
diff --git a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
index 562e7a25a1e8..31d8d2aaf30b 100644
--- a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
@@ -11,8 +11,6 @@
 
 / {
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
 		serial0 = &serial0;
 		serial2 = &serial2;
 	};
-- 
2.53.0

