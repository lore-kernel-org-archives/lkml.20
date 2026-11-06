Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956437;
	b=rkSPlZ+gfZ7Ce5JwX6trKI7mUOjT/hPShT3Dei/hJPzhVvqICYcGWtVhVzc13Z3Y/Ys1
	 H9UBJ6tUYNKb6D+NeytsGIwkTGPQnhhNWouDUCIwIr3tDJk4KVh/dkKDNpi/YKl9FTLlE
	 9xIrnXWOfVkJzpWt9g0eNdR44ND/H77ghFkV0FJZJY5VK5wW6gqGVhBMyjmBEkWutA0jc
	 CQnivYP1IJAnFYCfqxn4kKvTILXOjrFR3a9ATrZo2POadlESLtpHJaQ/b+yBuNFZCRiws
	 xzMWgXF8GucxLkTNHvBJFrSu025z32kz6kqygaUeunwt2/cItjZogN+3i8NS15df7dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956437;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k+mqe3MwnqN5gPVSMUZCJY7jnzPClbnClecQsC+GqSg=;
	b=x9RDIgd1Zq6E22qiyY+gmwyBywGzUqWRUw0SZDYNPKsjvZ5JpB6u0xUGcQa6VLqsk+bp
	 kQobxblmL/lnFyXT1Lci1E6LZ1UuRaVFImk3b53elBkCyy+uBtst1I48kcoR5VlVdZyxW
	 7zv+oQwp4LDYw4w8yAP6M6h3kKGvi5JHYi9iHXH9IL0Q+gF46wvra5UUwJsDThCUOgOx7
	 5t3ds9Px9x0uRJvwVfCwOUu0V1Zb1vOpkzNyH870jxS/WG1UD/8+hcziLWTg1l2wNEmwH
	 /bhcJk4oN4ZPP1jynk7VmQdAq9JMn9wnkM0ouHYwoOc6tFATIrisE4VyTzWldSUGidg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjU0Wgdo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUKcgbmW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89409606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89409606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjU0Wgdo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUKcgbmW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RRrE3907031
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k+mqe3MwnqN5gPVSMUZCJY7j
	nzPClbnClecQsC+GqSg=; b=OjU0WgdoKjr8OAJ6LFtGpoyEW9/cNidtU+wvJrDB
	m8tm26GM3QDPWy4vWs+I2K/WyWPB5w3eLUGoZpZA8bgkzkmfdrtk5LGag/jsIpHZ
	SCdxuW9FOLufbHmY54eNUqPAIYgd+33b1VqrRYvUCcd9+9+LG0lF0/yUqzkj237P
	jrWqmMezFGrC2sHuCBjt5ESGUTOiThx6WhzY1Oz12GRl4h/Vz9Zb0d33Q4SEpa6y
	AexRNBkQEc8bE7dy1/agGEPpLEdaIOJ6XZRrI6YZTvjFnzOlXQU78XEvVCu7GJJt
	OgW2xlF69Hp+nyfXP2qOalbBkau2wkbImwysu/w3pI10Mw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pat1ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:13:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d2a94abf7so334398eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956434; x=1794561234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k+mqe3MwnqN5gPVSMUZCJY7jnzPClbnClecQsC+GqSg=;
        b=BUKcgbmWWyaO6oaCLaFgKAi3x+3vQl8xa2Gdtwfrtj3/Ro34pUr/v4yZsdbijtqez0
         wa7nKRmtC7e3B0zdt24lm6L/rZdasf4HEgX1dqZIwzzgyZSElhBxXuULHsktg4XsYrBf
         YW0t1BB9O0qAwjLSOMY0cDDIMHZ9OYONt1uVn/Gy6vgcNJ+Vida7xJp+PrbsCDtzSmgN
         FBFLQY7SyHScpP1V+4Cdp64FA5G+ZVZWtb0KAPY8w7pBVquPlxc1G4CihhTfgfkq3Ih5
         Jo6DW6baaBRghQOW1lm0OgNekltINlMe1tTH03NHwHRGd+4kGBxB/6k5gzeRfEPaiXik
         81dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956434; x=1794561234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+mqe3MwnqN5gPVSMUZCJY7jnzPClbnClecQsC+GqSg=;
        b=wgKMMtXZvM829avBrcg0mQTyIpzcmoK64SvTjF5pvMhukedmXfHX5GuxF+glJlfK2I
         Wxm9sWd9ikxzxP3Hm06COJXNSWNFTUyyAiKxjR4fkr7DZRwhE0dAUovAOGf4YASxFT6v
         EPXOluc9QfUsSYGALPu7AD72km5+zEeOZm9EDQytAKzvruu/4VT6g7Q1RMESIAWFPPaj
         BvuAqMCmWPBa5qe0bEn20RXaU/g/mWK/ayLL2j6FZGoFPB7EPbSxrVU8RUyTd/kI4RMM
         g6uC6MFMjHZShLxAt0dtN0PbUqcRy94HbNKXrqSdv4JF2OiGknn4evaNyYOPiXzut0t2
         84vQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7OlVfsaYi9HrD41XmUg2tg7K8XtYe1O76FTYbI49vBcYFjiugyYKyBc5KBycxXcUhh+n7of7pI38DR7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z84m/4bSNozXJV+A3qMgXrt2n1wPteivV5BsTNqCBkO3Hxtx5q6
	ebzAZuAIwL7tLINcsDWEvuUsDSEhR2o6MPJ9pdyFUFM6k2bS6NMohJ0HWsiPLUz6VO52X8SvZDW
	0Odw6+C5VFQ29yg3MOq5Q/Dx5m6pLTy8UzeRDJl86AnJzmlnz1yLmavQEA4bE8zu7uPg=
X-Gm-Gg: AYBFou1qWkWDvpoJEwbHncPQwjHNdO/xhVMHAVqiht5Ib0kOtyyoF5SnA8zTL2/fCup
	0+DXqWmKDvrxWFjB4+bgWGWhMvQRcC57354tTbCJfdCvc8SVFz85+w3v2dnbJvov5HRaPSzyLCQ
	ML5DDFNLLabUrkVIB4riVjiFOr5Z6dLT83ql7kRQJjQq13uALGehWC1xn/H1r/6gtomzK3uOweU
	6bP5oxFkpZDnD/YGr/y+FBfz/tIU5+L9faGMOmX8vgT2yd1V/e1kjUS3Nna1H3chsJkoj/ijw6S
	WJqQhCQNLRUdWqLbKrbcXeLdeL36ZeNbyc+Tt2r2QMSOPY3NuamkuLjCL/efoVCXZ9Op3ri0so/
	s4s3u6QS4PHFr8L9mWJwm+lxkr9S+rsBJG3cK4JbAC9AWUq4Y5rYMjsnFo9KdgoSFFi0PTi6uwA
	==
X-Received: by 2002:a05:7022:4381:b0:196:7590:8bed with SMTP id a92af1059eb24-1b25d285a22mr3210887c88.2.1793956434423;
        Fri, 06 Nov 2026 01:13:54 -0800 (PST)
X-Received: by 2002:a05:7022:4381:b0:196:7590:8bed with SMTP id a92af1059eb24-1b25d285a22mr3210814c88.2.1793956433582;
        Fri, 06 Nov 2026 01:13:53 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm7709079c88.5.2026.11.06.01.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:13:52 -0800 (PST)
Date: Fri, 6 Nov 2026 14:43:47 +0530
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
Message-ID: <au2aS7m7DrpA6B9R@hu-raryan-hyd.qualcomm.com>
References: <20261029-pm4125-adc-thermal-v2-1-8f405d9dac96@oss.qualcomm.com>
 <8ddb1fcb-5d16-4a58-8279-a8f574021626@oss.qualcomm.com>
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
In-Reply-To: <8ddb1fcb-5d16-4a58-8279-a8f574021626@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfX6f114RnYz8Dd
 tmBBx6gEfzUoSMVoYXaHHuj3AID4U0LRGyQiCtWHDlaNyUa9Kda5EwODTCRzlqdKyOfPGo02AY4
 1St/iwmwLMK7m/VmwYnF3Gw2dlEFlcPNrvJ8DKzgG/3NwyQ+2TaMVOLbkYEoJ7+tUtLQOQ6tkN4
 kzpk2InkPX/o0+0dqqGB5p8HwtSC/iOBPNj0/Ac4nw9nsUwJHZ+Ooa9G3Z9JH1YIt6TzzOaoNnu
 JtHUByKDEa9UtFemHCiz9PVFzPFubq7SN/AO+62YaGfbOjamxlvBkq1IWwEu879HR9xx5vlPhvD
 YpKhSYRUNgy/K7Vv7LZbup1raFg+8oBo5DNIO2QxdoVHMwEPzL1TJizBQghBpR1itZYL3hmNsQN
 zmPYWMDDccENnFARtLTs3EfmUM6z58pA6jglfz8j+LfY1T1r31A0ao3X3XMHaMiYsT3C2xKsZ5U
 yKNdfDVHfrbeqvFMQUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfXxXVqD9kR1noZ
 d4T1UBgR8xB8ZpkH+9LN5c6Ei87LxErr3Hnbe/arYSfwGyzlRRXppCT2+Py90KuweGUTYigqhiM
 I8Th/bSnrKRA+fEJ/xSUzl2+LFH/qF4=
X-Proofpoint-GUID: 0lWHTkHXY9IXaOOGlvRtkDkCk-ihP97Y
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed9a53 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=E6EYp718zQjunR1OsgUA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 0lWHTkHXY9IXaOOGlvRtkDkCk-ihP97Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060036

On Mon, Nov 02, 2026 at 02:06:27PM +0100, Konrad Dybcio wrote:
> On 10/29/26 2:47 PM, Raj Aryan wrote:
> > Add ADC channels for msm, quiet and xo thermistors along with
> > their ADC thermal bridge nodes and thermal zones for PMIC
> > thermal mitigation.
> > 
> > Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Moved XO channel into pmic DTSI file. 
> 
> You only moved the channel, not the associated nodes, please
> complete that.
> 
> Konrad

This change is specific to agatti QRB2210-RBI board, if we move the
associated nodes in pmic DTSI file, then it might get included by 
other board files which might not be exposing them.

Shall I still go ahead and make changes as per your suggestions?

Thanks & Regards
Raj Aryan
