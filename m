Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626501;
	b=muzTnkHeOi26GaboOqXxd0UTxyX3uqze/0xP7/q0IKlRoW2eDiagmnS4aOmCINoM7Uyc
	 aetUTkx7RfOeNQChvldeEfupGeA9BPELpaR+L3Hw0OtwXtlcntCW4zPk6oAnxkS3TXW20
	 u+ahPl99v9k0cN3aF0Tzi9KwqztAkSemyn/CD8e7rzdgRCPi8GsSmGE1O8wufp40O0RBg
	 49f+rEroOiHY8no+loW6xFx4+t4yk2ZqfoeG1u6Vlxgk/OUjUdSFDjFI3kGJv8OKJg+mc
	 OyGowD2ptnKppUWyOZNhV/MZEoTpxyRLjC5Ubt0CelPDR0O1k/iDt3Hf5bH/ftUqzjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626501;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D3OWRg1rBciJm/YVBuNgf6sr+pRkNnJI+vUSSl5wbsQ=;
	b=aGGbMKKutfVkwFzTokUcpUQ0CWr7TGYl8yRMS7OlaawfUOvNcnYSXebfQtivhfjLmUR3
	 kKAnEzEBgCt76J/Qwep583HLOKSRWbCFx/lYciOT3CgtM+Y4bJXYyRz/9dLKqFhPu95Tm
	 b6vdbxWIdU2Gs7Ci4oTRPuLCDXycJcL21S/IIi+5PO8+/lw8eVMXv4SMBEAbVO7zIV8/U
	 RM109XUj52y5PEJguACltM3TcpEkaXYkjSH3AqwiwRj6+db8Z8667rIqoYJmE7NrTEhJV
	 qT6z4TJaU2wInrNboft76LvYwJjaMC5WOs3i/wbXOGtbshGPyigQ8JeS6BEq+0UbMxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpi7fyrS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KO4vprHf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5E3606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B5E3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpi7fyrS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KO4vprHf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAcNP3974121
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D3OWRg1rBciJm/YVBuNgf6sr
	+pRkNnJI+vUSSl5wbsQ=; b=fpi7fyrSBEJTfdPY3Ac7FbpxbNfNRmqUrl5rsy4c
	fWTKZHcGigUUQxfQDV3oWicArPDkKb3K9yIZyEd7fwe9jwQsH9b42rUFTr6WwWgG
	dzYqYNxOCV+3pXJITXjYK8Z++MJPT2+eVWHw4fqt1zJElrvcUV0IHOsJ0NwQP17L
	HK1rXv3xV5kaehmaKbH7ykVshK6g76IbCwI/L6PE75LTXNwM0QhXk9gAttlumm8i
	8LCXrjnLlKlGgaf+xGac/2Z1LW+Gvl1Pn6saDyCAxgptvS278wiqrRTmUsr5siQz
	nsuuHzbLxjEgn60w/t6lD5rdx4a2SKZRJYO1vF2YVqgwuA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmesg82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:34:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc23a549a9so2352833137.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626499; x=1794231299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D3OWRg1rBciJm/YVBuNgf6sr+pRkNnJI+vUSSl5wbsQ=;
        b=KO4vprHfEwIEOMWdDGmZS00ApXb9jCCkr4ayuBfLU1wXUvpWYluYtPwOv0iF72DXAP
         a62siY1O5wfrR+ZY9XcZcZtoyyVTjPN8XcoZRs931M2jESk8R2sKTdBtMAwxznj/CGeC
         /WrMFV+5g4+2ciUH66gxLtdEY16EM1ga5cl5xr1Hwyk82wxLaH/0MUhjNJ1gfOTVNN0m
         +WAMGKoKdfhzD1XldLAkSJfrDXbFgFlJPo/n4r9ImqDkFXYzrKSDVP7+phH7eeNAet2z
         lR07lEZwG1FCfHxN8h+EhvF2zckfqYaiMSOfp2yHy8tzR5kh7b9Isoanc4HHm8fP6igN
         45uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626499; x=1794231299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3OWRg1rBciJm/YVBuNgf6sr+pRkNnJI+vUSSl5wbsQ=;
        b=EzFulVreZRVrBmSIMwNxrDIrHlSKVmiynj8LTqaPCAAlsIhXHACK01oBQpacv4qIVu
         HlSdROUPzfxd/WPNM7d2oChtVh5/VQH2stMnUdCRRpVNVtXndNwkkzaD5dF938AblYoe
         txBJsaPDhw4xXwe1zuhwnZlPifX55exiAGo6nArE/08OUNyeG4kRHwuwy78moKXn4eLq
         O9cohpIfsG5D8N94DA8tFIJZSyjgfS4S2LezXZwjCbaHRsAYovh8hJorf2e79IOV5APO
         qTw903riipneRiRd10pjFuaqcpryhBH51tl4abW5JtHNcRdox/VJs5b4CaJ1ELFqucQ3
         3PPw==
X-Forwarded-Encrypted: i=1; AKwUvBw9mf5HEDhc3B5d3muxhQEpl2f9ntFEO74cNdjOVWpe7qkZnDCIOUYjOmQQiulXcJ7Fb1xf6WB4fwpR2+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nO0xlvzYFYjd8lMIIO93wZvdeGxt645GtY7QF38qJgf8rhuEJ
	tBAlJvuymIPz1N0rRDO4pHnalpjW1YdfMsQd3YK6iuiRVioUiC/LptxTyDvCB5/602bbwiy+v8o
	ZBVNmHIhNWJewzS53WvuHDhHBaoysHhel2bW9CJ7mbiwNMP7rETZkRWPpbiExakO+P8VLK1EYcF
	uoyA==
X-Gm-Gg: AYBFou0pWwBfdI7nf+JmjUXLnIBprTdgC00+C4gs8Apc0ImxygMKqwIVpgiPBOKlPcP
	ZtekN7ds4a78ClCwDt5nHD6gKgEBYPyHJlFi4HZ2Flvyf4MMiF3q01MtcxU3Q1FCSj4JOVIaxDx
	aBk/PW7C8J6D/9gZJ9SGUjjDj5IxBl19rGMsPVajatpWz/bNMec7f0J1iXIodpsTdLh8IAPq5Ae
	G6RiZxgx0DXf/0McDbWhYviQckGC0h83bYONPKQAxopKsbUrNVYknGkXK0sngaAUkh5WMoTJ7gu
	qDU6o8TB9+bYGWtdL1gYdMXBD7zqghLYuyqiw/B4RoyRsH1tFgW0pRA2BMeqkLMpo3QWL2CUQoU
	2xMRvA87sW34SvqJAxTiTTUMkH9iAfxluSdfxOR5JZT1sfcm8mYJ0t8kARnnYYzM=
X-Received: by 2002:a05:6102:524a:b0:7d0:3ed0:c630 with SMTP id ada2fe7eead31-7d072d5f983mr4251365137.34.1793626499132;
        Mon, 02 Nov 2026 05:34:59 -0800 (PST)
X-Received: by 2002:a05:6102:524a:b0:7d0:3ed0:c630 with SMTP id ada2fe7eead31-7d072d5f983mr4251349137.34.1793626498551;
        Mon, 02 Nov 2026 05:34:58 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm19915342f8f.23.2026.11.02.05.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:34:57 -0800 (PST)
Date: Mon, 2 Nov 2026 15:34:56 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: milos-nothing-asteroids: Enable
 IPA
Message-ID: <gyfssymhkvifeb5a5xh5bazpoaguqtfijrxsjlibtd6u2zm4x6@otcsrjngserp>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-5-66a56c537749@pm.me>
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
In-Reply-To: <20261030-asteroids-dts-updates-v2-5-66a56c537749@pm.me>
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae89183 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RBzhS24iIX_dIUMOZkEA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX1gJ4Tqn3gjfZ
 VhMV+jhVhWXXPeBzaEmuhW8AXnkq1k5g9r93co9yW2HxngqAMgdjvZPuokVNRXz8gmEHXmlLN7P
 39V1QR8o7yRXPU4dCmoQ98xbw8oKucKoWjhhZNuJNegaBtfJCl0aLazzQARco994AcW9cGJntdR
 dgAA8KIRbqLCqxXnDIXNlIG1/QGe7bP9rxuYp5FZsmsAusKDJ48KifzYcFe6ASussxZ65DSPg+2
 biiau8rI+G3sF4pJWyTkCMk4JV5dkKVqRmEe+MlKgAZEGAEM5TURKtf3Jbsb0MJr/+h0L/CIY2T
 Kg/VpLcyjmWXdYk9QcaiNpWGFzr3zx+xa+A2O7WKbcFti+ee4beNJ2Tp8GO2Xy+eTlu3D1ND/8f
 riFTvvTaw94RkRD3R2KqW9GCpC9qMRdJhxIqEG9jeqDLbhVtGJ0uSjlu8fpqtE7YOx/KvqlDpky
 ktkoBvso8MaX0/b/nrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX5VnSDCowmdRq
 /jcrVWJ/mKY4lfg/tgtGaE1d5jvZoxyjcx8BfTvui6pDcS5jhcxaPp1wFqUUlGL6PON6u51Z+6g
 F/SNr2dziwGdYrwjFF24B+kYaFZcbms=
X-Proofpoint-ORIG-GUID: Fqpypm50rpzqMr_MRnpncRs0jlr7bP9e
X-Proofpoint-GUID: Fqpypm50rpzqMr_MRnpncRs0jlr7bP9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020053

On 26-10-30 22:41:46, Alexander Koskovich wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
