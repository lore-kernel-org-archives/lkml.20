Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956916;
	b=Ef9vi0MRzCUx2V4EbUSEILkuI5BcOTgKDuDq4eGGj2JgGb33bAglaP9QKY+D90xFXd82
	 hNeTUvzjbxj1QJlTEyedi3dtOrQHn67o9jy4wgR+VyUi57HXKH9K0XVxyKHMwkv4gd7cx
	 Gzye9NhBxQns0gFqUEJDXaJ/yfY8NVe5tPRN/Sz32eSLa9bvRtVNjPJ75GI3cCzdhi+6y
	 GP0m1JLC7cpCepqOSxWHX7abTFbpYXOAxivgnqEUzdawi5Y0gqKSqA5atw6jBcZonXpGz
	 ao2hSUhAkFbKSUiPCi8OchwU6CJBjXlF1KxccnVzs7Y/pMFfvU7LwYG40cGmPTMWDXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9Q9bgnOsPt2pZGh1aS1ZuMPlyXR2OY5Sg5aeV9vhJ6c=;
	b=hfN5xKjo2MlRkRNqPN9Zx8zoXdxwdNClZ2TXnRCPW6bzou8F2ssLu9+LOXIF5uIpap7S
	 R/ximXhn8ukcwW5ZK12j8yyQ2I0zS3e2tjRsiytCu+MyzCVykoEX2PvMmrDrIyXm2U51y
	 s4TWfy5PX1ESkN+BkrsAA14hXU3V/syaH/+hHJoMAgVDX8BbOK9DpmIQFugTt69cib40f
	 URET34ByMbJMRyMvJ2zxhdLcst9YiztrlPNMiTPbXJjVwM00yVfHiCwYVRvZk8twrbLJu
	 ofF2XP6VhkCTp1kmN/ssTBtPYHYcnE06N2Srne74MxSTBHhlXsXnNZSeHdW0OM1omTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OKTG1eyn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GGNkyDNm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4F4606D833
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A4F4606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OKTG1eyn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GGNkyDNm
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RJLS1679504
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Q9bgnOsPt2pZGh1aS1ZuMPlyXR2OY5Sg5aeV9vhJ6c=; b=OKTG1eyn9ccy50l5
	I4RqtoTGWg0KsGtlON5NVsdmdZk24SeVUdA/tfqhZqhpFGw96srG0rGG8LZuxtH4
	co2Sn22T9qRn3k+OGX20E7rpIJ4TEtGeo/SjSeAVgQyySHZqfX1+MiEhidUi45wi
	7q586wxzf0N9v/awvQ0/mnwwMKGb0PXwAk6CvabaGkO58ye78fP4WqbSAeFPVBfm
	6FUppPRCjA/VAR0e/xPYL9vjgOWosMxG2OsvCQuebrCjTuGnQkKj2zl6rxxj3Tgm
	S+dT6vsWYc+jTqwhyRP73QwnJOvjaN8lfvB8iOXZDWtt0kyOgTB5+SEi8QIUu+I2
	WBBvAw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pca2r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d1353fdcdso1784500eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956915; x=1794561715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Q9bgnOsPt2pZGh1aS1ZuMPlyXR2OY5Sg5aeV9vhJ6c=;
        b=GGNkyDNme1DX6Lf/UOG7FHMSbMmkj7UlGeXCksbz+0PL43EPMaRdlvCdp1sIn1NzLz
         R2Ajpfx4yuNP8zwmEcmp0g169c84JfOzx8R9dP8w7wX4a07rRbcrG9CPnww9w3xOt5XY
         Nzw68+UmnNgIkpZ/0G/ilL2Bs4DK4TXhWmtDE8shn+WjAF+i9GcHe8FV0fM7L4w+2a1C
         RqhNWolMJccT5FxWNPSoOi2C9W1P1stEtwyBbuzvUn0lkxvi4VqhNBlMTI7+LlHuAR6l
         hop4wTKZbb6VNBfa3XNHVnJwWRXLLjQmTGMsCuEl444xCLesWjr40axUn23mktpivN+c
         /9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956915; x=1794561715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Q9bgnOsPt2pZGh1aS1ZuMPlyXR2OY5Sg5aeV9vhJ6c=;
        b=fAS2JshiEfx2eQ7UuU2alZMz9f9iMySt27WSBKsijp4hTwluIXebQ5K+Zad+OFIAyY
         4zhwLUgwemVFE8Y3OeMRuWsAXWbBBuu/c/S8czCNAitKejdLnQ26IdaiXUrSQqKVBU6X
         r3C6iAhtkyZC5Ot4FHRmOIFonA+Nd2/ttvM0M+leSGSPlkDBBQoiw9pBZeo1Kid8ElaT
         YyL+QzhnMTzkZu1xsYFuyta8cHkm9qddVAJRIfKOQYw79pmYEpyA02hwOjWtXgPKjxb3
         CR+CeGcpd0zDVL1rNGab6TJoa1rWPkIH7pfdGkhfkb/87NgWiwyxgJuw04eUcXQU1Tby
         YMHw==
X-Forwarded-Encrypted: i=1; AL+hErFydUtREf85XJ+EvAwP5TAYIN6pRPD5x5iF7PNyKGC1nm/6EwCMcfm+BThFo+DjVxW3E2E7QUnhwsN7PFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m6gr7AGccMXO+K9Ev/6/Oh0T+2LH4sKP4XKu5I31T/776Eez6
	Tsy1fdJ4DVclo0TTfqcXQn46M8ijuRLGjzrtwU+mdhSAq7dLTi0fZpFC2Km13zyE10LoTrKbNQb
	3qGI1gJveqaH1FtAsOysllhEeqCpY+y1icrUZaR5TXTPH3nj0sFF4LmGWdbapdVMqmGI=
X-Gm-Gg: AYBFou2koOknIWu3oKjhZCp9TNz9SbsV1wIJgkZSbqyqe0/1anoFWDiskSDJ+oaQw+g
	bhmxR0/D9rupEcjnix4IHwbi0K3wbNRbln3CRzpt05y1aq9lOKW8mnKHwiZI0YhrNjPWDXQgNp+
	1h3XeDnK9Y2npj5ozTKI41FYEAXdCsd8cRQ7mljsXABs2AQJIhyrH1IikYzMzJxKsOsP+lnduhe
	CAtS08L/nKliiajbbiWVuu6fAf7fzg26fEu+iCLIECeoVsW+HpT+IVQfRa3QI2TR8AYpF13yZBo
	BPyI61rRKNqO8TJJ9nNTDY/Sda5cAt0inxqHCXsAeToBHGtGKTkk2ItaN/SrSG2aVBOc1dNDqVN
	+7goIltDgHHB3NAtYCdWw9JRrvjE2Lz1S+az76OYRcGX7VQabbHvkIAAauN/5KXMRTl8MqSE/Gu
	+SLzehsOsxz0CaRb+hic29OajEoYUM82MgHD4PvzktVYn2mDqasAOPWzpKyN85XbZUewj4lJGID
	XD/dg==
X-Received: by 2002:a05:7301:4610:b0:36c:a281:1bc with SMTP id 5a478bee46e88-36f75a2b0cemr2640823eec.16.1793956914778;
        Fri, 06 Nov 2026 01:21:54 -0800 (PST)
X-Received: by 2002:a05:7301:4610:b0:36c:a281:1bc with SMTP id 5a478bee46e88-36f75a2b0cemr2640800eec.16.1793956914305;
        Fri, 06 Nov 2026 01:21:54 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:53 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:51:00 +0530
Subject: [PATCH v8 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
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
Message-Id: <20261106-08-dts-v8-11-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: tSo757DrGlOGKxU-YzQEzHKokl6-WJSX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX5nWkb+xsf8cd
 3dEH6LBW2Am8DV9PqUuMadNovePdjgFbXWFY9LT2106h/M8+iNMHtWXeNeb5hJqCaO3pwAMzLs5
 uBSfLSaZvPNb2AKS1oFQ+r2yaE6ZYfm0h+3ydayzRCetXQHcEVGm7Os/j53tzZBKfRtThCN4zF1
 Jf5/hKq52xLaMyw/2SMw6f4J2cnkmfLZ7W3c6DCB5b4mM3oswfZRuif/dEPfKPZWDLEi6St6RWB
 O++b8jvlsxiUHa0c/2aLV4jf5M4/Gzm3C0LVm8OvKcNgJdASMsK0pemvPu1dIixCQvwbRm3WyOh
 D1QJgx+B9szda0h8Eq/Wc/vokdhxTHAcxVfHuT4goreE/FEOwDv4vX85Ojg3opTHxPeYgu5envs
 +GOV259ZhnJmHidLyVK46f68lrP0b0P+zvfNXntg1i8xG9mCo43Pt4v9vo4+TB/VtuwvEHCbvYE
 OmXsiJPi6dFlWPI+6WA==
X-Proofpoint-GUID: tSo757DrGlOGKxU-YzQEzHKokl6-WJSX
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed9c33 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XHihiHp7Beehtrn9I_oA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXxAwz7uk5Q/is
 DA6+93CCaZsMRHT26vNsBD98hhIQgEQ3P0VWQ+md1WLVEt0mLNeFyIByij4VQD5Wr0c085QCvGh
 1H3+s5/mcwmJISb7GznTyWeBB3g7P0Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add random generator node for the RNG block present in IPQ5210.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 61a58fd5d4ce..91ec7eac8a67 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -386,6 +386,13 @@ tsens: thermal-sensor@4a9000 {
 			#qcom,sensors = <5>;
 		};
 
+		rng: rng@4c3000 {
+			compatible = "qcom,ipq5210-trng", "qcom,trng";
+			reg = <0x0 0x004c3000 0x0 0x1000>;
+			clocks = <&gcc GCC_QRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;

-- 
2.34.1

