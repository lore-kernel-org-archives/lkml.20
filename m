Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143972;
	b=p+M6MTWYde2MZ1lJ6UdFEyXz+KUkEFrpVcJgHLEcgzDYBSPakWmKQViPDs2IbAn2HS8d
	 KmhPTS4honJxt0z0inb+c/MHE81L9+OLCvoFw72kr5aSNYl2mv8pM2hYrjnSyEiCddv/f
	 wPG0m/IkH0HgG0kTUmeHfr5NOTqtCjPBAk70fntbZ3t02AsuXt5fg1XTM+jkyvHSgXuWe
	 GWYJ+koQ9Gu2ABNNxWlUWE9DE/SWEkhyBYd10TvjyyEJbQ9Vlavi4DBMKmtQcQgU1lwy9
	 P3QYdqLB8TxuvYihiXBGn3spoliziGhV0zvjcsIZkdK3BP/d7v4V7S4Pedzv1ENMYtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FXe+y/k5WlRUSpbCLSG5IK4BPoly0uOYpoUf4Rjaxf4=;
	b=EPtYIEg7wBqEe7M3cih3tzdMXXvJtJlgIZh/cUHPNzYb5pxsSh4eBqBsrrOl5bPe/k5O
	 e5OdCTstSzSrx+8R82B6ADnfd+nytf82Zz/RfxXY37zFQs5WF8OndxPv7oQ+54tb8ry7t
	 pNKPTLGd0JKnkr2DNpXugJNTsKXqhY3+Zp9FMUQn+CYdx24HXpiIUP44oTjrji8NfTd1/
	 j6wUTRoNNKHt5wa9UUHZPfjsXdhlx/nbsg0cxxdGDyAQ41+MZKpGdUPkOxfi5g8o68fXc
	 hHqRDILaLqbHjJALwlATdErcSo4wXoyulOBm/+ZJPlai8t1fDtsmQO+0wsNVK5re4Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lp8FAaoB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lu8D+tRO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87853606A331
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87853606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lp8FAaoB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lu8D+tRO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AhkqF1252519
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 13:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FXe+y/k5WlRUSpbCLSG5IK4BPoly0uOYpoUf4Rjaxf4=; b=lp8FAaoB9SkKnlU5
	6b9lscm66V7JtydxZcsJ67meybrZr6iDzXdbllf8cV6231qrNwTK6+WqrLQHb7Y+
	EnHh/+4lnMxSwSU+VBWena8DRvxNAdRM8/+KrMWqIu+RZXz7RprmpRcF/vV5/4WD
	pMps3aAMxhRboDy1xj/fgLuWgEeJstqgzUiKUQKzJpCZaUNj46PfUTq/rxXIXlA6
	7dXA08BLlIE0O1R2hbFn7a7kZjn4PIuUpYs4Uzfsl1OHCoRoP+k+iU8bUuyvpOH5
	iuHF5IRucm871I8wL0C9oCNc1gfa5Xd8OUMxOzkAX3Hw4hvcK8dqPsMTEl1/xmfN
	+Ulh6A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv2uax29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:19:30 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so513681c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143969; x=1794748769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FXe+y/k5WlRUSpbCLSG5IK4BPoly0uOYpoUf4Rjaxf4=;
        b=Lu8D+tROfMQGOAA3pMZ+EZ1tBV41vijXM/ETrvZOn04mnnzr8HAxTyhq2lW9gxsUgX
         EUCeulMRzofnc9eJdfTFtMKTIPJz87sgQz58jFD7YjQxhPHmSGoj2BU48iTrRYuI+1rx
         quiCXPbWALKJCjasMu01GRQLqgznpFfZD2W0oo5SxGwWwQUtuZH8wF3CDCcy2zWGIMz7
         nQtXEAxH95Z30XQoVvjujyjxZtF2pezlf9gBfmXCPvb/cSe4fXBLHdJwwPBRQPemjHlL
         rvWKfCiPX/By6Tg42gIiAacg7Ket92nFzha2NtNiTfN3CSAPLddNjMZv1B8uh8E4GqEm
         CC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143969; x=1794748769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXe+y/k5WlRUSpbCLSG5IK4BPoly0uOYpoUf4Rjaxf4=;
        b=1INRiqZE1QmnktQcd+oWkIi6WTTGCciwIpVjj6bSija3JDKM9Zm0mXQBpTgQ5oOBq6
         5AgDkr2IYTdxhvw+Kl1emxJmoTVUrLKy4DBYiWSFQA53/HLE5sY2EKKlV1auTSSL/6bY
         7w3rzYGKv+iaAKoporAyGKPnSXRuBEB/AKKU5poz3dKH0rpOSd3pftL70JGjwhOrdaVD
         bcO4+f7ZWdkAupJpw9Q/8fVjTynXVu2l9wi44ovMPHkd2ODXCE85UQjmeR4I0TlPESBd
         GmEUAecLWq/ab4seFf5NhLk3bBfP+s1BlgyHgDUrdgFMrBHS8twHL9RQou6LW+kEERW2
         4Q1g==
X-Forwarded-Encrypted: i=1; AL+hErHRG438QLuENZDvHQjJsTdbFhVX4ETj46JGsdUPPlnCQXrBnlDA9QLaXU5wHjl9vbDQdWIFql37ifFjrcI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SUgxaOlSaidV6NXJT1nXnLvytk3BMSh1n+HLZ6WdLPDNFhkie
	1eSxKDXHYJ9C7UYalAzhucgvCyWKKhm/qow9wPsoTr3ujfHVoP3X1h4J/sWFXr7YEhhoJroWi/7
	Ck1++NUMshZTxtz2JsbkTGLk2dLurCeKyqckjs5TRdwAUVWdiS5G5DKse5sZsmx3OVvM=
X-Gm-Gg: AYBFou0YgW5BdabyZB9uvGEWCvPP8SIaqVMy+INOjHvlnrZkn94+knrlETNIXmoJXdj
	NxU8o14Pt7A1ubHQjMoSN6BFhs9BJg2uHYs9rK7LKTCNxVMO8ev9kv+UKAbGmDcr52RnV8qrqYD
	P+IpY5Pp0rsjFDaYnXuEqd2OtGBxb2IbzZxyOJbE5LQ9FBua1OgyB5QPGUlU+pf6eJrV3p3IwPF
	bwn1eOOj6ztE+N8sRxFmcaRXNiKBEnthOH6u9tzGOvuS0kImytsSOxKO9Lepg85eg6Aay0iNOg+
	cD2xN2HsMRXmHnCgDjFZvzDwR/u43+N4gN8zKsQoAR+bld0qboOzbOGJrhQNRz2xGSxZ/tiNKDg
	SyRT0tS6nANkbTN0JxezJDKdxUqZ2URuSj1m1pfBMRRscoURk2jFf3beWigbkfpjaugTw6JlGFL
	A8Vvk=
X-Received: by 2002:a05:701b:2611:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1b39fec9030mr1867716c88.10.1794143969470;
        Sun, 08 Nov 2026 05:19:29 -0800 (PST)
X-Received: by 2002:a05:701b:2611:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1b39fec9030mr1867689c88.10.1794143968780;
        Sun, 08 Nov 2026 05:19:28 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:28 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:30 +0530
Subject: [PATCH v2 09/10] arm64: dts: qcom: shikra: Add support for TSCSS
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
Message-Id: <20261108-tscss-v2-9-d5f575010427@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: DXHfDzrCFixxs4OMRaPEPM11btTEvcd6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX/fVwtvHqFZom
 o5S30tS5P9DB0MizjvCuyIoIWhkb1rAb3AoeHC472/xvVoCil32P2SvIaen+epsyCEPuwAVtec0
 OaOdMwu6J9QA7JfZfJzj2ozSavCjxb4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfXxQujZWaJc7yp
 lS9IE923TFt/WvXM5s/Iks5rYeIfUn3uLZBQr5vmy+ayC+YM5WO9LX6YkMKkMHjKGOwNCa2xRu0
 jqvAM5zRv12DakWEShg67xhHdmeI5J6AIZvoqkyj+Yc6B03UaM+vKGXD1T5cEyrz7aRe/IRYv7h
 hNGAwwHWP43DeZ5pgvS8wFZlzUGeOv96NoyjXyY+ngp7QP6wABBLvGVSIE3WfFkuHUm/grNbG98
 DGWzLC+O1LgixnwABLOqPaa1DqJwmM7+IY86PWkUisb+AnTXn8oUtG4GLqjYlMnSzPzCQ1lMtG6
 4entdeQjEmnjTdM4pP9Grgkd8TuJBoQJaHh1jXQsuKx+B3uPsXpWvXi4dfoPjpjHwuBP6ZSE/yq
 2N5/Hlu5dMekus8irH07SEHLLxcmWQ4V6EKZgnSXPNBzqjtsjK1eBp4hrYEUmznd0LaxxiWn68E
 TmODLxNrsZ0ISNmkFnw==
X-Proofpoint-GUID: DXHfDzrCFixxs4OMRaPEPM11btTEvcd6
X-Authority-Analysis: v=2.4 cv=f+rdl+yM c=1 sm=1 tr=0 ts=6af076e2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gfsEk818mMD8xhq9cSEA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1011 bulkscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Shikra
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f..09aabbf447e0 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2481,6 +2481,18 @@ compute-cb@6 {
 			};
 		};
 
+		ptp@4b00000 {
+			compatible = "qcom,shikra-tscss", "qcom,nord-tscss";
+			reg = <0x0 0x04b00000 0x0 0x2000>;
+			reg-names = "tsc";
+			clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+				 <&gcc GCC_TSCSS_CNTR_CLK>,
+				 <&gcc GCC_TSCSS_ETU_CLK>;
+			clock-names = "ahb", "cntr", "etu";
+			assigned-clocks = <&gcc GCC_TSCSS_CNTR_CLK>;
+			assigned-clock-rates = <250000000>;
+		};
+
 		usb_2: usb@4c00000 {
 			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
 			reg = <0x0 0x04c00000 0x0 0xfc100>;

-- 
2.34.1

