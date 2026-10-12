Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD02949B5C1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818565; cv=none; b=vA3meqiqA2lT/HhzjFg4VGCF7ADMirBdVanO/zzDCqwVGilYagVM6sN7yhQb4k6iXUQxV4H4at1jiCihPgIB1JGZMA3pcBx0ScDC/UdQbEtepcTCIQb1QjgBP6i0Udj92A5wXG+8fTicX7rF2tssy5rBm94B3RKeXX3/pU9yAm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818565; c=relaxed/simple;
	bh=wLO0SDg8LbE5ewjmIzhxAYd/FbDV4A5e2FGlHVhYGSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xwn/tlWIYFNH6ZfYZEWxC36jPEvRcXuo5yCYrXtJxK+yi4HjpyziKS6XtGiDwIZRn30MtiSCKPWObq5pRZQC5/YP7fw3xG/iC59nZnqAZyg5p/sVv8zNE/s4Uxx3+hsOAlVox/l8ukO6u2fP8UMxUai+RJACSNlIZeVYuFtpdaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrpmS9YM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxzfVnkO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrpmS9YM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxzfVnkO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC01q21405000
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4v6rs6hZatKqUXv8cQFe2xzrddKsExWmxLIfwuCePs=; b=KrpmS9YMU1iWHKP+
	7y8K2Tzd4971JmNE8pvRL34NzAb9Xy9s5Eaph2D3xU9nUukxOwnmrdeOfO3PPUCK
	FPx+a2XUTOt0MiGCvnTHqQ+Iv1vO5A7F/v9rp+2255NoaCyGGHZ7r2AUI2fejU1o
	fHtkKrwVdUt8knjs4wa6ykkCWn3kmOPZAa7JGLtQClZJ1n6MnAukqeZTnwLWBLtJ
	/bSZ1bZVHV56WlykdZ6PnPSKxe0rb+BoRDO7akVz+Adwb6NaMdBjwsuFURHM5W3g
	wnzJXqgoYSuiaIrbffdFLC7q0joYk7uXaP9WM/Aosc2uqePdC8jHEJqSOb+EoY5L
	Hom40A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kssj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7a6634ef51bso35395137.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818561; x=1792423361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4v6rs6hZatKqUXv8cQFe2xzrddKsExWmxLIfwuCePs=;
        b=RxzfVnkOM0dccjk9oPy5wsEMXr/MPC2kMMND3mpcnXNd5y1Ie1iR20oLPoPBB6hSYd
         DsbPovlpyh612d4cVIv5aFoqIF1pq2PDurTPNB1SJCnhvWDCjI5DWG8TaQJ0S/0Lgf6K
         c5P0E1O78/U8J4m+dlolUK+C5xvVNzuzLmdS6TgZUO0gnhWzDjzX3enp2HA2Kt+qqXFK
         yQm3xss85SO2+ipq/2szpc+jcUEBnoDkSDgsIv+GeDm0lHDNqiQpOaxe/86LJybf97U5
         JX7/QDwf3YnhpZ2qlUNu6Yx8rTVGP9z4Pv5PEHmoj/tsdVs4+BiS9ylSBpIXndmqhqXh
         u9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818561; x=1792423361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4v6rs6hZatKqUXv8cQFe2xzrddKsExWmxLIfwuCePs=;
        b=RwO+aJfIcvPht5J8wihm1VlT4Aw5Za4GWNbyn0IxaIqmPGtD4UhuIC2XGyAbSw3VJZ
         TalWv3AZr/j2ZCsKMdliI+F7QVYFxHOFPC0EZlQvpIR5dCnUG6/YxrTgTzcmA3e2paRh
         gRqpzHKzC4OJqin/CgYiS/Q0oIYpT3fSsCuI0ZBsz236bQuLHxygoJj2j3YyzooVN1mu
         F1YsvIKLdNXvTIjrBpCxqIT1fbNMErYlguLs93XoT53/lblX1kr2nyrKPhJSAOGE8J5x
         LWzhub0e1fOrmwjwpIYGLF/WKPqablBQ4kqBPvldGW4saUeWzwv/kAk6wevgyAmoy0fJ
         mmVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkCDnSkjVPAuiD1JwTz5OUIOdJYLXjKXz1alKLDZ6vGw6qBFCcXeF77QTLeC5pcONvXEvS6WjzLB6ueWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJENOvrBUgLYPkAES/RhFJe7IB+8eg2UepVxnVMydDGWLMcCPSJ
	A+031RZ+PQXRMEKt2msvatLpBozFL+R/rgb4SRwXPrSvRG3qQuFAXZiNtEufzYfr8HdiY4Us8m+
	suqwJSAE7TYsAHxiKARJ/Z2g7C/EY4x+/o9wBBmRELLkVNdEVQrkSwZrd6kHfXjIm/l8i+EFC2m
	8=
X-Gm-Gg: AYBFou2fqjzxLFZaei+9qVgB8oVglMtKHJOW4DbUka5TsEKLybtY3gU2AxpsVszTuOA
	XBnS/CTjXsG7HFukVfNeP+fgAJVe6CXy68ttZa8dtQOhvBhs2E3pCwJYztUZkEnMuL/logXrdHU
	MQ9nWgcnzyFTjdF2+H5Wc/DN05lDt9hdmEHTln1GwgbVkRtOyEjBkQW6yao8l7v8dLv99WIroXC
	R5FbKXSbU2gVBtwwpauPzQPoC/ocoIH9RpIXJzelpHc3X3R9lsl7Cjjq31QxC6Rb+YkizOOzHAU
	OGQydjcJ5Jwr55+6MOSThXTU4LAS2KHF72wrAwc0hJpJhOwM0h+X79PN72T3CszbP04i6v3yflv
	9klDqt+NR9kRabpjGoxTksw==
X-Received: by 2002:a05:6122:464f:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5e91f232dbbmr1995734e0c.1.1791818561195;
        Mon, 12 Oct 2026 08:22:41 -0700 (PDT)
X-Received: by 2002:a05:6122:464f:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5e91f232dbbmr1995721e0c.1.1791818560645;
        Mon, 12 Oct 2026 08:22:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9f776sm472745066b.48.2026.10.12.08.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:39 -0700 (PDT)
Message-ID: <f90e9e64-ea08-4264-85fa-79fd72e06e0a@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/38] arm: dts: qcom: pm8084: Remove superfluous empty
 line
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <5b04cfc8ded6fb16cf87ef9e339274763b0c8fe8.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5b04cfc8ded6fb16cf87ef9e339274763b0c8fe8.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXwlluc4OwQtaQ
 0VFqEkDH4JtLsxV9Lfb6kSFQiHtqMG6DQi8+BIfX5nr3bu1MwnV5ZfoiD26HB1XhBmgiBRnpEyW
 +x6h2vofLygyJDyJ8PtBfi56O4S+f67YXnBxp6GSN3+GkRzVFEPFG+spy/lMVlU9fPZdheyfHZV
 ZqrTml/c44rJY3szBN9/TjPCJmXsWvMLkMzDt1DWkwqKMHDMGLCmy1f+ceKoXcPFksppd+U3j5z
 YmOzfbboTEjQja6AkNIR32+MUdVSNf8RJ8+QMxVDBFXdq2ycGAiRz53umX2l2f3BDzC6PhHLkji
 6Gyhr9SDH0zYsNKYZkO57mJke/iIlWyfKAewdAD94sQ8ZQulbM1GlehrA3qX/RlsDVJYCJAOLFX
 hiWQWpnaqFC4lR0ru+hs/OVjnew3DYa8xfEH7WfK1A9cf/mnmnATMBqJY4S0+BWcbWOBnAGiEhd
 MF8uehVX+Whbw2PYyTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX94wU3e+iZJkD
 jeuOaZoUuXnq6w61LvswMsaHfDvoahoRFsDzM0uXMq8/xz5NmlfiSv/Pk+V57xCc7RnJB4h9FSa
 XCOq43UKv2zs8DSituEBMwWq37YW/uo=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6accfb42 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=YXrApte7LvgGaje0e3AA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: LClFnn6U6nhhXoaaj_Nu4TY9Orh2CH_V
X-Proofpoint-ORIG-GUID: LClFnn6U6nhhXoaaj_Nu4TY9Orh2CH_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be a newline at the start of node definition.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
