Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779190;
	b=uIUa0FvevFjJsL+54bzeqr9la3i/AnHyl+vjV+BBQFy+23oBHCXwZSlVqkSOkwHfIVrN
	 jh7m2bChq/45ARSOgRHF5gzCdmDfJy7Byz8kkGumdiaroaZS4k+LaELupjEWObqLIhgNP
	 dF0gcqzH5dWYhg7cb6kZYolwviTMmKtMTafZC7z7u85eDF7zlNrha2zFFy5990Pa2VxdT
	 qaoQapx2u5bJaB16eASS8/I/Xuwgxz016Iesmf7frGB/flp00Nh0zpNCKbKqkBMQbafsf
	 I5JLFTqL9lHXDaRgbzB00yzazkXpv6DC4UXg+223h2GBRSlFtp0gL9NuAb7KtoDVHeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rQiyefZwh/K4SuzQ+nT14r/+BbPDDTBUa9cvkZOYWWg=;
	b=GSXPyt5FA9KZqG6+3BTyVrFWAdyIdV4zQodUExhQwKWJITkHJPTfUlu+aTSRDxt2TJ9R
	 W2AugdRzrrT4xq04w+Sj2UxJg+sp+XXtcNQPNbaZPf/sC+M17fZ+mpBbcZUhvzbqWlGPE
	 aXlMXPGmVAJcd4uVWihGgOb+Jt2ZMVPg6KNUcfN1aiQRbqywnZhLe+shaPA1K1I7PwQsY
	 jazqn0HIp3wML1J5B3tJsegECYZey1ITgQpc+kbaQZ5kW1M6GIHyPnhLm+sgFo0blCXWT
	 tkl4QvHs/Ibof3HrkoufrQgUqbyZ+bYGG3TJv2ujKGiCCRT7ziwyGYQzXrlvJuePj/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJTaQJ3z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MI6UlBCG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABD7606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ABD7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJTaQJ3z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MI6UlBCG
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A43PR74268400
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 07:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rQiyefZwh/K4SuzQ+nT14r/+
	BbPDDTBUa9cvkZOYWWg=; b=JJTaQJ3zlL8QjekIKvg70/vV8Z5AqeTkyn2YDPOr
	J1poufU/uBnFZFg3udEL+xL+3q9Ac7e91+KTVFdv3J49+s67njGSeh6OxHH/Ske1
	WS3LHthv4/lQryuq/aK7//1pWUCySYQGykCyc1WxyNWiygX7ZNOv5YfH6pYBe4Ya
	s8j1aEBNqFnqWHMdtvRnwq3Phqls1yEu8HIHmgxRK+SY2yTpqqPcdtR0FoA9NNGC
	BNTr8zqQoClwQ1rSoU2SrIZmcHfbhYMJbyWeR1/b9NBy4b25IHAZv82P81jd6/yl
	x1xw62UGLVe4UbQuh+y3gX4XiucjBP1w8FODeh+m1K4rRw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg8yjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:59:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a08e315b5cso226887b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779188; x=1794383988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rQiyefZwh/K4SuzQ+nT14r/+BbPDDTBUa9cvkZOYWWg=;
        b=MI6UlBCGcCNqmhcf3SotAsKjIHBoWpZV/Ld6b/waj1XQLsR00tPyi51AZBxXKmMXA2
         hU+Nb53aRlmDtRnVzWsK/qXBySvcmGcdYlm2LxBwOdKASEBurHwbE1j9rI9k2zV6yh95
         WPRqL6KlHbjYZNJ4z5upyYwQt8VWJoQf+L5vCHl0TeRj9IS6si1fzKx0yg5yZJ4I+8Ii
         jdWUhCqVLkEpK8pwktqLOfH+Zduz5YUl1mUXKVSVoXg0Q1zvevbbuIlHGkSuXILRS1A3
         l5tHebfSixHSVdIsL1+BuyWyfPxNb4idzCS/VavffvcCGfIPjC23rh8N3T/1QTmdbbJW
         XuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779188; x=1794383988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQiyefZwh/K4SuzQ+nT14r/+BbPDDTBUa9cvkZOYWWg=;
        b=Qd/gu44Q7V9KeSsNSs2hAmQEa2cKc4b1u5xKq3q1tQH4ayhg+y7hvIkyGB4JtqLCCC
         IDRb6+beDAe7h65RXhmSQ8b1ZuOBKRJJDJFb8nyMoo1fDPBVdXdaHLS3WM+99U8jY00h
         RrK5z2oAl0JQpqXFeeXA9LTlWxfO861eDywq6jG0PLjtn33XqNAg0XJ5GWqHR62CLP2v
         Fp9NwjtD2FUqZXV2Op3zKQ6ZWsTMnQh/2ASJajfewuFtJlNBjzBncp9ftn55pCw9pMLW
         yYg+Pw8hkZOKv+e7GY5OEmadppd7JHVwQMiN6XYJ5YfdYZEvCur/uW8DTmnmg0VG97nV
         1JSA==
X-Forwarded-Encrypted: i=1; AKwUvByMFjQXkAv9jkdF9dcjPCTaXxQ9KL6vJZ4Kn2Bgw0qieAnXm8N4lfa+kAbL267q+wZYqZE3Uva1uo2biF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q0QJFSt7hjwNoWH4HP6LUkqJ3kNR9hwJsq9eQgyPbUvWu3Ha9
	aTqJBEP+V/02gQWnlwmPHBguygl9LX1teoYXWz5z/HDsfAu/Lm5e7fTCzbexdA+q7SBC2rO+8ZI
	C8h7BRTpU+HbP5kCgVMNuUoE2x5wADdVToI/Fa+8DvZjyTkKCF1aT2/LsJpU3kNhPxk8=
X-Gm-Gg: AYBFou3s8ua4+9uCLWycBiUfxyi9es0dL1v7/8xNEpmfgc4n2SL3/VFMS/tuav325NO
	Ar+iTuA5UrZY1Rz7imH4nrC1fE9pT7dhisvv+X64Mpni0aPA3gFgXDZtd/al/hlEkZQKltOHJMT
	SIYTUPXjXOv+SDGTMK+h0DVbyaEEm864o4yatbfMiZNR0qiibzuE5UkQg5he8ETOXaImf0GxqgQ
	Q0VtT+2CATfDHPX8DZ3Au8eU+Z0t78RQG/VxumOv+xooV9n1xeAIkqsOVZ3/B7JBHkz7BZR+oUT
	IBHIn/wTeT+Gfc6QJ5L0zZv0aBFU8hBnVQWM5B8pl7GEXO7jOJGIm7r9Kamb/XJoXrwDEGGhgqh
	upSInggJQ0H9+nc+JLNo8V2/YDv9lqRE8Dntd44M0B2QxzzLBsZWXSmU6N6SprfQIxL1RyUvs3W
	PCCQFYqJw/1+58Cw==
X-Received: by 2002:a05:6a00:2e10:b0:89f:600b:610d with SMTP id d2e1a72fcca58-8a9bf3371bemr13298022b3a.31.1793779188057;
        Tue, 03 Nov 2026 23:59:48 -0800 (PST)
X-Received: by 2002:a05:6a00:2e10:b0:89f:600b:610d with SMTP id d2e1a72fcca58-8a9bf3371bemr13297996b3a.31.1793779187555;
        Tue, 03 Nov 2026 23:59:47 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09af91781sm566203b3a.24.2026.11.03.23.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:59:47 -0800 (PST)
Date: Wed, 4 Nov 2026 15:59:41 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
Message-ID: <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeae5f5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SSptHCAamaIDb59YXrMA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 7KKDJuWmp85ASX3bW8lPi2endOxS-S_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfX7qCm1bY9I35C
 pGQP70jp7yteJ78a9pHOCfvMksBG0+qMyjeJkZ2f2sg2aN+Q7oXIPjOL5sbFi60/lHdd/TVP7S8
 mqLDeL7uC6bGKXG4ok44vtgAVHPXnqzpxU2cd9erVkUx3W0raSeChWHHS9wFocOGE3U8JAwU2Tj
 TWiuJghcPIH6TeN8DKOFnn6FSnxu46xcGCOV1mmZ2F4t5ZBAJgkjTUsT+kWuIHZCR/o1RX7ngxH
 /DZ40u1el9ddWq9OHfTMIboxHYtJbeUaCsuzob0xY9KJf15rpcQhTaQTrJIVnxAZWc9KadrRUxM
 7EtFij9jm2/qtglSNVyv/gWOja7RchFYIXGlaAh/VRQYJFxaydHX89uMHTdqYdhcwMRQw5VoUdC
 cgAnA3QCTYbk2NIkqshHFGS8PJaY8eBlbP8dB9y0FVPn7LL1DfZk2o6ZzexscGPY7uZ05mvvm6+
 SLmkClMOCkEzU8equVQ==
X-Proofpoint-GUID: 7KKDJuWmp85ASX3bW8lPi2endOxS-S_K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfX5gd7PTmaxDPr
 PpxCRyUGZEgUmarpLq+8IGFDqIfRT5xthXCxe6SwMPexkjLetzsVgtJE9R303KSmR+K43n8K9Yz
 OrrcOSc7thj4/DuJARWfDQzYO8MESdU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040031

On Mon, Nov 02, 2026 at 04:01:03PM +0100, Konrad Dybcio wrote:
> On 11/1/26 9:04 AM, Shawn Guo wrote:
> > From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > 
> > Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> > SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> > and DMA queues.
> > 
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	phys = <&serdes0>;
> > +	phy-names = "serdes";
> 
> I believe this holds for both GearVM and embedded, so you can move
> it to the common DTSI

No, this doesn't apply to GearVM. The SerDes is owned entirely by the SCMI
server firmware for GearVM variant. LDOs, clkref, reset, and the per-speed
PLL/RX/TX programming driven by an SCMI perf domain whose level is
the link speed.

Shawn
