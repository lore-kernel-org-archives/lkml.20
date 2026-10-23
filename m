Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764138;
	b=EF5v0i97y9u1N4Ac+GXCnjtOLscIowqAksfKnKNv0hciC9SieznV1bUwjqID3Z9rC2sg
	 cLZEz3P/XXrw0ct9OMswaaGJ6PNgnVaL9g5nQCuY78IKNyKspNQRd3x8yPywVlLVL4Nuj
	 Z0mu8MCY9DUY0cO3MG1BHQlRCQXVA/c+kEABNEM4DJAaSt2R5F2QifYRONxerFpdkVGN0
	 leCSWhPiqNszuGw5XtDSayZGXiSgKDRrf08/JNj+WBtq8ygiOF5m2jl6UQJGrnQ8CCid9
	 klbrBNHqpPKNJN+olAvbygwT3uVG90hnub2VpntZWDFTpLXHQE77eo1YNW+EjYWy92Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764138;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=;
	b=p5CXRq4GNwCb8dxjgMT/EioeJ+3PL6vfC2/QBIdz9/mn6ZmbpdNXPowhNBQgZP1dgUwv
	 Xzq8r5MgNgDnxJf3Wb1/abdu+dl6eliY+aqyMSzoKSLbrbNzts5kf6/ZL8vEmSzHRhNrk
	 Wg/PHWkinJ6dSQYtb5fI01Qyqx+yyo+piIh7TGJYlFCH6IGD0w2nsBm3wVRZlCkRou9p4
	 pwghe/vP80mBm5jVOCqG0J0yCAKMBOxNPIGumcRP1qH+/WEpiboQ670MEaS748a44/GQ+
	 3SU/Lv8sgEMw/9y5vB9sKIxCcHZg9afaCxR2hvgMDE59ktU2FoQ224ByB/vGhsBuxnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dg6h2ZMC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST6mbG7i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E35606A328
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E35606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dg6h2ZMC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST6mbG7i
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAUpw3550605
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=; b=Dg6h2ZMCLLsc/yP1
	I6qTTMVxn0gHmzaeTvaOGgud5bFVkeJocoTVCav4vqqdigQvcPIuygrlLDH2EIxe
	F+TGw6CKOac8cyTs6zr1XNCYrnoA+aNBnWo5jbsqL2U4MJIguL8QtS4PdAyxXJL3
	tzi/lByzoafs5QJ2whEB/A1L9sd1k+sxRfoQ46vJhdhtOcmQZqEOIjV51vgvE0ej
	EgJYrK8vcdyW/OaHkwSfAIfACEegabPswmbrzPsbvCXm1wt/e9CZkODgh2aTStbs
	z2pJclQcrIb2EWusOmtMfJgP+oYsJGA7HFyXYlCJkpMma8IznROzhB44kzgRqP50
	N9XDVw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrbymt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:02:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35bfac489edso70472eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792764137; x=1793368937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=;
        b=ST6mbG7i4M3s7DOpZVaASZUvYLEdViCqEw5SoAQmM6Yn9ENixSn1N9RlYYLBT+sM1n
         OUSc5Q8QBzIgQoHSuewVwox8nf08A9br3eu4ZocwivDB5VCSP0ijudwtzvvFiLI+07Lg
         +ZPPIhJ96tNUjeDDnQqhYSQ+rImFHtPpbkb8MEZALdms3woxZV/pRNNr77ZLzP6cN3OF
         rtVeGKA087k3cXi012uhq35c1oGh36Dfp+5yMbxPMUw9l9zgOkMu1DXKeOKQzX2UN8tm
         PMFJ++tG6CRibbs6QVtw8xPy1qch0crXaOsxxmi26mgf7Kfrvs6dkl27AGAtzTaBrKoo
         Dc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764137; x=1793368937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=;
        b=ChSU7dGBTsW2RQe31l7RBX8X07RFEqAPY7oPQXNNF18YnOBIxOPE7cr+l2+erJ0/yz
         wTT1JPeuGnNlj9F6I1prCOeDMWqNqJbZ0BtQMxbL0CJciM3k2TfZGOXP4UcSB8MCaW9l
         bqB8CDipreqobj09zhvDaThrcgPr9lKynpy2e43UXRqhXel7AahpiYSYoqxaP+vTGxPY
         8OcfG8NkTlsgqxGMvJtZjBHmHDrbqunLH8XcUKwyk6pD4Fb8mZr1ox5mvcTJoQRB+RWi
         3hQt2H1c4A4ry447KLfIIo64tf1ixbRbxU1SnAw1SGb1PWhat3gaD7VboBY88Tcx5k9h
         qSLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwF300w7WpO9swQdhX2zmzxm3oUaprcpvZDx9mqG/OTYGiHadlJbE7ytf6Ktj502sbsAdrbpo+AI1Zt1Ts=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9bYRoXzpkO2pK7qTzPKYQp43QrXai1Hmfv90IA5FS6a8xDbL8
	gsxV10jm1nqOtZ/f1OqOX7TLkmDeBP0PiUB7ATey09eT+8X4NQry2lVzNSYCSpAD9SMdj2JSsdM
	OJVCDttZMvCgY/NieAcOdsxPxU+kRAQcJqSBAVPzCWthbPPSqD2vfUCVNYNZQha8co0kIrWhfRL
	Q=
X-Gm-Gg: AYBFou2E+/K3mNRIuWHievuEDCl2FmRQUeVJOgS0ZGvy+/71jN9MUt4ef1C1aIwXld/
	vZDEPqo+LjwaVKLlCU4705PzCUfNewCbUkbnm+b5mpjdPgYKdRoBun5OpXHCQamztKNSGeFuyVv
	CVTtDq5L85ImQyyvZaHPhuv643JMKOLHrx0gbuZIZYZWo6of3Wm7a+dUhHMVuZ+HaFai1ZP+xEo
	vhUim16HtQA7eYq3FbqSFuFbnzt2u0Mmbp8A1Wab4s9jnLf5jSJglOQ6wGhb0L8tak+QKridlR8
	0tNnNFuN1LchHgpqECcB0Ym0QOa2MqKfZZdUsWR45vmBCNFzZjh2807rOk9OTBVtJ4nc+OK2Afx
	i5qc+c6noXZQA0mj4n1e7wg==
X-Received: by 2002:a05:7300:e9c7:20b0:369:d85a:d416 with SMTP id 5a478bee46e88-369d975dedcmr5567425eec.1.1792764136765;
        Fri, 23 Oct 2026 07:02:16 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c7:20b0:369:d85a:d416 with SMTP id 5a478bee46e88-369d975dedcmr5567356eec.1.1792764135935;
        Fri, 23 Oct 2026 07:02:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b8d3a041sm3976866b.68.2026.10.23.07.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 07:02:14 -0700 (PDT)
Message-ID: <d237678c-9279-4bd2-9d72-b98830db5d79@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:02:12 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6
 Enterprise
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <cover.1792761470.git.me@andrei-z.com>
 <d1bd2f947ad986ff3c3fca1ad367aec2f1cec6b1.1792761470.git.me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d1bd2f947ad986ff3c3fca1ad367aec2f1cec6b1.1792761470.git.me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EyeHwC4neF9wB9kdW-mrFBYM7wAX6OQ5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfXxbz9+xp5WxB2
 rSwWg3TcEa/KnZDd7GFALDcGJGpL1D8bvthgDBtbxddk8aDKQknDN0LXBX2/LGqzGvjp9obCeiM
 laDJWvSLyHHMzGWhME/IK9zWcBvUl6U=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb68e9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=J72pobsmAAAA:8 a=EUspDBNiAAAA:8 a=5oLZaV2ftHNI1lavKEwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=CEj32ImPKXYnrW9rpEIO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfXycXg2qaId5Xk
 ikqObMw7/MxbF8xvgsfNJMgMKvTf0RRCZ90do/6vtRiKwkctiHXDaZtPjjQSlgs1gnyDpbvm/VF
 t9Zdp6EcLJKfG+0y21VUDTgSxesbJ5dSLGlaGph8vXqcIijydX4lGQM9B9bvGri4ocoB1PhOLI8
 F24Nih6awZTtfTRSIMil4GyMtN3xBAIaJEdWJHyxrzskofvXPtqsQftfiHoY0LTrTIiEE5Cbj98
 zvisXqwA7yfFF9qY4eR6W8PpSJMMtruQI5kbaq8sBCFn/2LXbgNG+u5iG8+LAuSlu/2OLwHNgno
 acVfUqgTQwgzgcssIFaFM+tzxK9XQgtYSTjDGB2OT7eilfJq03/OdFiLlRgS1sXeyfKVkZDqnUr
 FHoFT6fxi2dG9XUl92+E4FOR5xPZ8cCpKPJ2K2QFznoIJg2Yc4ZIGFuV1JJ/FMaiC7gJi8PxOix
 5aVSEcTj59puTMdtcww==
X-Proofpoint-ORIG-GUID: EyeHwC4neF9wB9kdW-mrFBYM7wAX6OQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230054

On 10/23/26 3:37 PM, Andrei-Alexandru Bleortu wrote:
> The Ubiquiti UniFi U6 Enterprise is a ceiling-mount Wi-Fi 6E access point:
> 
> - SoC: Qualcomm IPQ5018
> - RAM: 1 GiB
> - Flash: SPI NOR (boot chain) and eMMC
> - 5 GHz: QCN9074 on PCIe0
> - 6 GHz: QCN9074 on PCIe1
> - Ethernet: one 2.5GbE PoE port, a QCA8081 PHY behind GMAC1
> - Accelerometer: ST LIS2DH12
> - Button: reset
> 
> Describe what mainline supports today. The Ethernet port and the
> IPQ5018's own 2.4 GHz radio are left out until the GMAC and the WCSS
> remoteproc have bindings; the LED controller and the board MCU on the
> I2C bus have none. The QCN9074s carry the calibration variants their
> board data is looked up by. The SoC dtsi gains the pcie1_port0 label, as
> pcie0 has, for the 6 GHz radio below that root port. The vendor QSEE
> reserves 4 MiB, twice the SoC default.
> 
> Assisted-by: LLM
> Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
