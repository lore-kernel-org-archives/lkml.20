Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143979;
	b=igwTOSiahtX88GORJepMrogI7Zo/eIZInwPgmXPwZv2ghJBi1W+zXRZj/tyKum+wwkoL
	 aeNftpKdOM4Vu8z25BQ7VYsVqpryreMcwiFegzHw291eZS8XbETmh4p/mObgFICjQ5Vhk
	 7RDugyiVApNBvT8nue4OQZzwOxq8D5xUM/S9lzRKHDUxvwEhyqBDYpsyZgZicBqeV5Lv0
	 GeJsrL0bTw321020HYPND9nQwGCW/qmALHKapvgY8+3nYl2OOTnGTkFz9x65rrRkEr937
	 cU2p8O6kUpy6qokrDnrFoKlLA4MpM4PERCZvRtURLgChD8qRlKcjFcEk//DBGJN1bzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143979;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=os3+Z3gmGPhuuIdUXa0F0UdTAjPYMsTLw1Ci60+60m0=;
	b=jlXjTSgpKsjuP5AeplUynD/jLjz6EbbaUvhrCmYAF+z71R9uTAKuFJ0dbQeaESwlnBSV
	 PSY+r+rpv4ob+UIN0wj5n1Wm8VwEbiwPvFb2qq8HlhDqWEBKffOcPfcrycHtuXqco7EAm
	 EYbmBvrpTCL4zHWZek8g1636/jVx3yzYj2XHNGJIzJ1/Fq/xgBP/mgS7Z1LBWl+L4mbpI
	 R9OxGHqlUIcDi426yxWuLBY6rAZFTWgKvOWb79cxoX7/wfBdq6TztqrCMtfPH1NHtV8f3
	 wiYWcVKGk2gR7i0qJcHZVw8hTwQQc/eMyF1dpRwSsL6HwBT8mjvNRHdsKB2+VbduW5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oqOeAZcf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+M8Lwee;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EA3606D81A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6EA3606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oqOeAZcf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+M8Lwee
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AgExg1249911
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 13:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	os3+Z3gmGPhuuIdUXa0F0UdTAjPYMsTLw1Ci60+60m0=; b=oqOeAZcf1CEBgkNo
	osfPDYo2JSn6y4y7fric9epbL108442IsmosBfdD6B3zuzn9G7n1+chTak2rCo4P
	acnZWxaanxa0pzMhgcD926zyEH3ADJkBL/9gImOYXkPLjNAu7DIPXS4vbnGwqNRb
	MDIbXOrhYo4HkTxJHXOzF+APh5XKl2J2QMpHoNZTzwn7tnk1iBGCHr0EgN3m/IeB
	GdExYaGKmsFjHfVGW/N2sNhii2PWNqRXDBJdOwH+KGk5F0M6tmCrHv15GgjCAy0Q
	DCaSMr8StG6/27ncMjwFHZZM+UyDkdXSglPoXGZR8GQALPqQu6khytbj4kdIOGPD
	ibm0Zg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv2uax2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:19:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3724667bc16so48679eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143976; x=1794748776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=os3+Z3gmGPhuuIdUXa0F0UdTAjPYMsTLw1Ci60+60m0=;
        b=X+M8LweeeHu0BRPZnpXRxOSu/lsgE0c4EtkF3WPdg7cQ95kkkvQYoRg4O+aZDEzzMg
         y50E0qk7WL3pz3AweRW2RHVlNAYirWl/8NetZPxHFa0wZZyD4Pv3uV4n07sAptBjNC/g
         IVdreBGAtD7JVY4y2LcaGhBDtLWI0KXVyNFix3VF410JAzaSREi2AKzL7fnix8gEpHzO
         CmY/sjs0y0fRQtGxGLpT7D454AtuuB0MJRaBaemSHN+h5nxs8tWqJ/hsLsMA5sRuvwjp
         erd7WQFBLIj/RkUYOMEoV3yFjXrDVOES+ADTu8Rq8PAuhLJWkIr0XDyzpXhOxrKeFWwz
         itiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143976; x=1794748776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=os3+Z3gmGPhuuIdUXa0F0UdTAjPYMsTLw1Ci60+60m0=;
        b=y8Nyqvu626S65evlQZABbgMMiHsgWRr/0vo5rAfGb1jgMdtshI9aPcuIbVC90q2mw+
         Wv6fWAAsZU/3X8QyuvUl7qL0WlACyOoQrb3aSpNVaUyaSl/DVqEFIcPP1zkFd92JLOI9
         TNcryNbzT3OZ/5NdG+yqR/m5eLslYLX42tHmyAvTezEexKQJoEZ8btOf1/G/OybCgyxq
         uhnwjPHEE0tZCRy/iYOab+8VtvsNB/Gvk49cvWiSG6xplcjei39hHGRfE9EKv+F5JJKj
         2N30OesrmfkrvZqQiHbTXuP3CUZvA44tgO0Oi2rWg2gnXRAD6GX1da6oxr1yEr05qpEc
         m4KQ==
X-Forwarded-Encrypted: i=1; AL+hErGvVMG2bZTJ4+SsCz1tANJ//u2g09zcwP/Wp64b9/qJ9KXR5kUOZb3GcPxmbRFfs9yV5m6BDExEgwL/WIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QbAAJ3IWpv0iMaXbGzmaOhRIGHfFQ1vzbWmZOPgKQJF7yXL1A
	fBUrVQwy+KB8RCM6V8ybUL/mi8Wm4SPP5LcRvqi3F6Zq3NeS9izqaVxYRGn1L/bPYEVt1oSLduE
	UJ4yjG92FTXDoroGiVivEzoyYaV5YkXX22qp2KE1LrhwReGMd7ysIu1yrtGhO3tNmvEg=
X-Gm-Gg: AYBFou2Z7d+vRrCNsTKlWOGGIMVv7v8cnFNVXQXjun+e3XKdTG1YBu6E4b+osjAIyOU
	PNdXWXrSGCWuIcKPNxT4By6GKECSDhzm8ALwrfBKtCupnZXMU7AY6uHRWhZs9z8UTnUT1DwcWLH
	6HHIBpdeq56vVCbjkqHaQwK6oacqd5aGOdiizKXjBc/DxFoMAg33MzqTCNgenYPX+cRJ4plcbRW
	Ks8ErfB+j1xhJG7L2rDhi+NC7MnjD7ztCVwymNZFb7St4rmKlJmZLWnJt2dZsSouceo+iQHFJlH
	2TTfBR+o6BP0Ne8/QO1WREIZTvbWhYHciLL4mZAKNmfJB19IzYRN8sOccrgzIAnqNYNW9Uj6ZAx
	LtZAZFiBD7diAMQKctxVSwWP2XLHnJPsakAoHZHh2jtNcRZW6qKDeQO5taxNIzonzjy6jrR+uHj
	M3Wvk=
X-Received: by 2002:a05:701b:428a:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1b269b0c10fmr6631573c88.14.1794143975513;
        Sun, 08 Nov 2026 05:19:35 -0800 (PST)
X-Received: by 2002:a05:701b:428a:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1b269b0c10fmr6631545c88.14.1794143974998;
        Sun, 08 Nov 2026 05:19:34 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:34 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:31 +0530
Subject: [PATCH v2 10/10] arm64: dts: qcom: nord: Add support for TSCSS
 node
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
Message-Id: <20261108-tscss-v2-10-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: IZxqA3HkRjDpN3tmha7cL17x17T0dZrs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX5sfByRrOY8RT
 Iv9tBtaw/OPVnSQPmEhA7k446JRsirsBIf6Gqx49SW+Z7hECQjVVeT1Ki1c4rg7DQJ0OkfxSwDd
 h1qbKPZpVwY5zHLgEioT1qG3XB4RbpI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX43YW2xUPFQU9
 U9dz7azDmoOOEjWx466BHoCCOJ6f5YnIUVrThOoXPo+aFxRce+79bDEvmzZx3zhT6xZJpdMGIU9
 lfS6iTt+jO4FIjfW/ycSpVcZlBc+GOjCO04phKMqwcuJnDICnp/yiIQvD5/QjfbfJABdzgLDFQ9
 dqr4S57I9fEIlHWKusvDLnwkHjpJ/93T1zRFjzbYG/2tdcf4eF6I/d2K9XEZJkH3nfhKE7CO/GV
 HcBpXC+k5PZdcsVTo/e9s6tLepk+fFJPLJ2g/5M2jXcmODjZBL67nPiCi5Ummj9DM5WcROfG1cc
 NSUu+shpdLoM8YHeioV8r2Bnrd2D5iFfSbqLnME9G8RlZ19i9fmHV5RPnS+De2tZNsmHGU6z1mY
 CbStRED8r/uZAKF+9n8ntqadnWJ/YGMbnNELgZb8jWHihtNdoTTc+wXcyfgrx0x9q2bqIpUNIM+
 TQ3nv+wnv3UecxPJpzA==
X-Proofpoint-GUID: IZxqA3HkRjDpN3tmha7cL17x17T0dZrs
X-Authority-Analysis: v=2.4 cv=f+rdl+yM c=1 sm=1 tr=0 ts=6af076e8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CYmVgZtmzWouJOFkMRAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Nord
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ab7d9bc3cfe..1d5f27336f73 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -736,6 +736,20 @@ pcie_data_inbound: interconnect@1c00000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	ptp@1c80000 {
+		compatible = "qcom,nord-tscss";
+		reg = <0x0 0x01c80000 0x0 0x2000>;
+		reg-names = "tsc";
+
+		clocks = <&segcc SE_GCC_TSCSS_AHB_CLK>,
+			 <&segcc SE_GCC_TSCSS_CNTR_CLK>,
+			 <&segcc SE_GCC_TSCSS_ETU_CLK>;
+		clock-names = "ahb", "cntr", "etu";
+
+		assigned-clocks = <&segcc SE_GCC_TSCSS_CNTR_CLK>;
+		assigned-clock-rates = <250000000>;
+	};
+
 	ufs_mem_phy: phy@1d40000 {
 		compatible = "qcom,nord-qmp-ufs-phy",
 			     "qcom,sm8650-qmp-ufs-phy";

-- 
2.34.1

