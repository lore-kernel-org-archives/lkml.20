Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421613;
	b=JRFWMKtegFYgrWv2TY4AXl8j7pvGbiEjrEA1pPY4gR299Vy8+/fV1J8gPq516CSqexpJ
	 renITzyoszN4FbyvWC2P0/1LYj2qLQkd+UwfmkNBDy6K3jQALNg3qIYFe7MZo706h5wEt
	 GvKc7Eu2ss/1VWVxkMjIC/oZnhgoZnawo+DCxOTwnL2jGbbQsDw9sKXR3WzuYDFEzs5WH
	 J/dDUICqO+q8kQVWu8xmFLTMolvntkNufjLDdmMuLo5pAWvtU7sD90ewxm1E+Ix1kIdbg
	 +mp9uPRxYpmXELNxvJJi9JnHECXbM+j5abSWfUgXpAgtsymcjM8J/+5Y4cumLY3PELQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421613;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
	b=SVVgaKHdlHfi8RpcUSvkCbJpd7mrfMeahaJzsVqZdaSg6wbgVXOvtynawhL2GnLUrXEH
	 TishJ0TJOe4rZw7fB3qxsPE6gsTnQn0hVPlwWr1ZmXzr6jtOzBlHGh0MYuIj0wuHk1tzP
	 oypwjvJexZBeBUJKI19cJZ8MIxMfwXgA5QqIvhF0cwdpPgWke2mIifGADPlG3Tl5zrdao
	 2P1H7aXAWUjdkhW2OGbQ4KuIZitVhcRO2ttt8RJQHmYFWnfwUpgMeRBZY84aAJSTaYfy1
	 NAJkOWff2RvB1uvVGj5KmOIARmgV9PjBLmKEIqnd2K0ZENMVuwIRbx7XKbUjG/SPs2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="P0yGY/me";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YIoAJzoB;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FEB606C145
	for <linux-kernel.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0yGY/me;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YIoAJzoB
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315A947D95F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421613; cv=none; b=BWkZ2grHPJvS+/31qFadiaxs/EUBctINDCrHxMKUoGBhH13+yuQpygl3ojqvpdGIyXZmuo81PVLl+XVwlEe6mzde4vHAiSXxol65gvUuaE5cxgNyqkvuAJbOnt8MPIf6bjGRNpk4ZJleUiKfoNS0m8Y0ABdzl6WwkdQ7SvJKQW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421613; c=relaxed/simple;
	bh=8QzhEza4cmQmxyVPqaeJPOjfbUX18+JD1Hl1uHqCQBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcbmPWD0eBU2Ue74j+9Y9J+IORE+cJgBdlQzMAovvP3SyHcBFbz7GWJLjYpAysvBi26NAmBYt3bpma3/kM6jWxPDKzovoSLLSreJZfDuMfmPT5atmCSPbHTl9NzUYnV78bibAfQbUky38RC3/FGbPqNA6ebHLCmyFBQblLJ95LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0yGY/me; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIoAJzoB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0AHN2628165
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=; b=P0yGY/meToCkfXMD
	ERJxZldNG/3CN4TYtWvURt+Nj3E71DWN67WF+qoqtKV9jmDIwtOuGSTXHsNVIXZC
	R73aUpsQJPaS6FKVK1j75E1T4zr4eG6zOWWl3KpIIcA8+sZrdeHX7w67lreawtvx
	gAtR3+GpkMogP9gnAmYj7LKxD3GIyQ27V5V4etMPOpG3WC5hHsiZQfwcSfFJpm2S
	u8gdHYJ6vToL1QZirfusd6YW7L1Ap3zydnHU2M38mY9DGhFE+wKnOQpgr+5up8Mf
	tbQ2FtusEFlkKqRY4bXw2toI3frV+js12w+cqlk3bZrZ9DFKjeMzbsMNPigx4tRp
	yRsswg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfgjh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:53:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so39281785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421610; x=1793026410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=YIoAJzoBzAZOEr7tRnwcN5WijY4FhiRXcslGi0gyCMKMOoRxOs5jNGj9y/BE1j/6Rm
         DmbLjXtG3UNgA5AyKV8c+liIwgahwZqJjfTXDPKLE3MSA5LmvEujgPuxbngPqNs70W42
         PWQqaW17ILJ02BJ8220hXbVlqQAbreauniOoyEUByafJ8vqGhud041H9qy9ojOrwNZvU
         uVjGGIXABvjf1yUqX31FkFd5UTgdHDYji2pUrVmVZ0WS3gtyz5oDobMmwZJwXMysSYPm
         VMBdTE7ZQPftA6QOCaLSb+CWw2TPWQp2IedDOG3FGRU11ejYwztFWctnrB865eTUwDV7
         xrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421610; x=1793026410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=zfoqPTMXfD6s6ijN0lAOGYxg4uQ7467JT3x+xN5I51zhdGsNTVSC9hc5DkccoWSuIU
         ZrOSx3yIOLrx/l8Ic3pYQvpbdzCMjNDsj0ezKM02r9vbCkL+lqnZFvdjFGUZ85A3B3D7
         YrxQA+Xp/7sRPxTkDUB736geTRmV7DWuTIsD5Y2g4dxVkLk51PiOzDBb4Zf99GoHC5YD
         2G/3TsIpbPgo+ULP/d3jL/WPJWkPn88exgh1eVj/rpRtsi4i38P3+ZpgIRinPBEgKtxI
         FIoQ39esISw4y+rLM4y6CgbWo7P5RnK5WnNLMcW1+amkYiEEnmnD7rxNjWxgSkY17V4x
         fcEg==
X-Forwarded-Encrypted: i=1; AKwUvByRCY6Uc5N8zPBosNflZ5wDknokhaVkHB+rcIZcYnqH8Paoi2IhbEdI7AY/yabyb7+41RwiteWy60OhRHg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLS23DAl9XouXIxu18aY/hHXCOF3go2vvvZQB8Syt5/YLK1l8/s
	VhQvA01RUIZkgy97ERQ+g11xHE7ZUsezEq1KtMu9Xw1ILrh1qVG3pBXq2ooQblpjzn0hOcjuDTd
	iWWKVK/ZsHdzlYQK4Rg3CWmfblvB2Ys1Q/tJdmFhrsL9CoaQqHkXFPj3lRQpUPT5OmQLE6dvNqe
	w=
X-Gm-Gg: AYBFou2wOVB4T04GA9DqEI3XgcphN94fi5/zp9nGpy17v/vRwLfw8t5o3xBpB9zzmEH
	u8oTtfYJiTnBOcijp1d7MsiQmBJF50UFn/apinY960N8OHHNfgyuwIEnKarI6AlcBqld8C3TsLo
	CZNgHZ95Y03FHv4cuHW5o3U3TsmmTcbNnpjjGXfc9+zhdzKXUhDwtoKkO/dMCH6gVYckcmQsm/+
	qvGO6GVWA7rxDAcS3j4AzO8DffS8ScWg374NxhZHdro/7VX/5bjLX1VW9KMxNe1afc+DlxWO+9y
	qx0VQRY3FZ60iv5NELZ9d1E765DCi5YKZH1gnuqwYUdA5zkVs9HIyxuE7SgPVcTZQyCDtwnVw9z
	t+WIoO45QhNneC5XRmm2Yhg==
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1470501085a.6.1792421610304;
        Mon, 19 Oct 2026 07:53:30 -0700 (PDT)
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1470495285a.6.1792421609756;
        Mon, 19 Oct 2026 07:53:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:28 -0700 (PDT)
Message-ID: <2d491ab1-b7b3-42db-8302-5adf4d1a48fa@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:26 +0200
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
Subject: Re: [PATCH v4 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-10-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-10-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QeIt6qXFM5DnHQpHsQnufm3JAlZA7byY
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad62eeb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_ybYkvnUm3iZRZ9voNMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXy4VuQKQE26uI
 HIZTD6Zxh2rv5mok3EGVCX5+HHWk8EOKtch6+W4lmCuNNxAHex2C0TaGQ9acAXPjY4QQA11Cc8d
 QSOhakwGuMShFcK62Obj4vA+f5nxtu9lKwVifFTjkJjlSyMnAfYQn0x0n6uamrxnsJ8TgyTiK+t
 LwCi0q4pMbzdZfZfEe84B6puXaRcEVSzqSybYu2G8fHqtrS4mOKFYuv4E82JRLjD3egNGQdPUjS
 K5F0k9LZsSUHCaJ8J/6hLp6YlRf3zhR3yweyy1O1/CFfTv4zSKbBZ1s0m3VKcScQevD/0F/V/oR
 zSSN6Ooei948vJ06LI9YLEAtsfQGq94SBvYaJXQa+orbjYqnSrL4pVfaMxNBlV81VW5uXHILPny
 RojYTlSBV9z7TcD0C1M51FfIsR3D7WoXRsuaisxePYwvBW5gGQSqE9JHP3ifnfHXJSqEIRqHLfy
 sI3rtpYas3Bt0al0xTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX8c86n4LxhMcj
 +SGzC2G8aPvSFpFryAZqXYG4pqysTDCUrW0TdgbwDwtqupT6Kx584nKjmfhQS3wrduEBHqcuwZ2
 UFNA07GuDO0etorncqvcLl2qYRDA63w=
X-Proofpoint-ORIG-GUID: QeIt6qXFM5DnHQpHsQnufm3JAlZA7byY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
