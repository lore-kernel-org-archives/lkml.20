Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A40639A056
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880800; cv=none; b=bgsiAJs0CnDlVUczw9mIXrR4PQrbGUdOiL/cc15Jmny9539XCFxJF9ie43nPdqqNtVdomY/H0sZwV0oxCFIQXI+WeayAMRYyR/+GM2K2vDVOCPtyMK6XV4GAUmB0pzRmeU7jqKD8fcLBoqKzFvGvnwoWuxq/7Ml7/3LAJ2rl4l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880800; c=relaxed/simple;
	bh=1aL7EQLDdLDEJ89Mg5MD5ZUMkF+ph76lnTDMWKkf4aU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3xJ/ZzAw/M06FiWUgDJFziWogPLFqQL9DaVpg/m5yxHV1IsD/d3Gv+grJHuQ2leCHkfrEwdS8QenEsw9dXe0WoPw56s0/8vrIjy76AEbdlSVzWOizTxPSFAD+pf0uBUKFoZ83QIvl1qgwXKbmlyn2IkbzIENAjXrwlnyfSxH9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLkc5y0X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GeFI4344; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLkc5y0X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GeFI4344"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8RH3b4071816
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eNL7vgR4kDGeD5fPFGvpl05GH+Y/43WiLVBF8tPpz6M=; b=nLkc5y0XQPFD1mUJ
	sysjhMEBmQzsIDnt88JYqviIa6WrohOk1363fbZxP/QS/1rxks4/NQfmxFh7cEfy
	OUeaERIGqVFR2kukDs0FbS8IP1of8lbUjfO5jd1cBFdZCNTI/4OAniUq1MRoFmTb
	Dm4yCrW8faLWkO0iNXi7c5t5owEFnW8NA7G8ia3wNGz4JD2oYuN5Wgwgt6IC2kkT
	uy7hexJiVGkzPheO/Q3EngoHVLYwrK+jYLhcNbci6dcK+FyA9yANYYBlp1p5NIVD
	6Hv54PW3CZDkoWyjVKjcJcfUSQIaBZDosq98vnI+6ed/pgWGuPZ93oiesKvT9lgC
	Fc0OhA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h92jjujwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:39:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac58b24so23841885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791880798; x=1792485598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNL7vgR4kDGeD5fPFGvpl05GH+Y/43WiLVBF8tPpz6M=;
        b=GeFI4344q6NfFkdR4Bg3dZzZeQ4VAWCqeeIR10/ORzhMsvakOcstxQ7K6Y5l9xiR05
         8GeJfhD0x7z8Ub5pMo+NlKbi4J+KU2MVytMyNOZNc4CSwy2g2sywudINLzUYlGbpAh78
         LJeH8I+Nsy5vrwsaaq7gdujX/jSvRK4gjpiMERg4Vfn2VYwF3H4LU6DVOk+yq9+yfNAs
         5y6m8d5bkWdmdHsqAJiTUwj2gAk7hB8QcA6a5qxF9lQwJ2Dt/YtfaD95QffnKQznbTRg
         ut64t4E488QtNgce0tPP083I4WNHQJF/6JGTtZv9lZ935tJ2+zZ9l5re47dKIYUjJrWm
         KpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880798; x=1792485598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eNL7vgR4kDGeD5fPFGvpl05GH+Y/43WiLVBF8tPpz6M=;
        b=n6/pQVPkonaX9PtlrWRjWbNk/liVTtfJo41kOL1LuaJ94gtRp2nTFndK+hausdIpIV
         SYOHwiZoIj9nvr0WtLTNnr0w2RnhR2rBGO9vx5rla2Qa87H7ez56IoCJ5zhGdcP9g9/e
         W0pe34cqmObPUCl4JuLe+/AKYVAHi1xo4yBCjiFtsd2mEbk0a6D+UlmjBJymWv6cojyP
         BxbJAViw0TQ88IAuDrl0HGjd6f3ULGVioeulHs8Q40O7FYuOOeH7vAKzBpFJvQr96E6l
         8PLadpQ8wfhJvuOCWI9MrfLfswSzEe8OpWJajGKJye7d1CHjdiJO+Uykq2d1g92kJ7Dc
         SIGA==
X-Forwarded-Encrypted: i=1; AKwUvBzr6DGSRuizXyYvmp203DuCq1QE3oPsSqbEsr84WPHx5yPaFb06fpLgDyPlcBGPSBMi/+wo9QjDfYnHg8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYImATjV+68x27T14T/dYiMotdQ873ht4mY4cY03WqfGfWk+1xkW
	wKkSFpdXHAQPdVOXsUfoGL6ZomILHUKaJbHo4gogOeAqREcVwxYvuYM77WYRXTouAG86Vkaj1IG
	6cTUMQaa8bcY/MsTNsF9cp7thtWO4PD+V0nct9nAZcS4Ef+fRYFusBAusYdKwwWbdopM=
X-Gm-Gg: AYBFou16C7OAPpMtiFqkmGA8azkUGT9ApNp9WZzp2xaMm5TJEvhVBZVjTAy8fuLzTnH
	BCjslPW1Dd4G0FnUJeQ1HtAHsho1Pg7sCOGO2SvqoaUTg6HfsVAO9m7YiAA12zpzATODGEiMLFl
	gqpCWRJDjsBdcXVNpMTJ60Q98UkLGKhvhHoXH15QiFnH7hxOeU9sdlwp5i4fK7Ledf5ADrWWFt0
	WNb19R0mvcjG8CWbOFFJRjkutrrZtKKKJRQjW+AT9F8ZKowav3HnEMxb3sEt3QHlD1R6CDgDhau
	kP66eYDfxgWWbAvgOW+TdVBdE8g5OzC9tAUaoBDY3tbVbf6qEmCnqi7vfAlYqkZckZny2xq2Etx
	P3+u1oMzTdWP00MIqabF8gg==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr2187957985a.3.1791880797400;
        Tue, 13 Oct 2026 01:39:57 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr2187955985a.3.1791880796886;
        Tue, 13 Oct 2026 01:39:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c36fe6dbc61sm51688266b.30.2026.10.13.01.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:39:56 -0700 (PDT)
Message-ID: <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:39:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mbMZ4Elr9lKk4YgYYj4hkA2rwUrs8KsM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfXwnIonM8jg/mO
 3+NkEItjQhGVXx1xW8yykRre6gaZgtSrb5fUTuxOi7lEGW6OZt80qwDPBpLhsGSry4uQjDkXZ9L
 4N62e7J/ZMxh8l/xyC0zc6j0pNbVlhQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfXxZsNqar6Qkkr
 mBIeKbsBpwrbMzWOj+Uskeg9zncVf9YJ3UdQAjRZv97sKlOllOqnnwC3Zf4VYM/zpWKGTVJzNkx
 FIm3EbdKdV/A2wZlGYIAHGaBha2b1OjRy8FSUaiugvgyQq2w71MAXkXF7NRjaPplanzXADEC0TR
 26+4xKDdiQHyFQNeyqtDhNdQ/AdkFyHe7zgs6lzpGo9yzfmInjOlCW9UuMP+Z8kqUHisY6G39G1
 8oBlh41JuEV6lrrtb/lPyOej3N404Wvxb14VCcErJFmla1zCO+U4UMLc19ALOjLrvFpwdtrTGpD
 RkfjcaT1txTtqekM8m9fkOvepZgy07g56bbRdarwtCDGPO0URL+FJpRR5oV/RDCyVuLxYdkwMSL
 01CcuA1wOEOdMPr2+zjNnYZhrKJUflZqpAJsMzC6NDT9Co2LqrNEMsvocfTspjOkrMjRYETn6aN
 yfWEsZzdCx52/JYoA1A==
X-Authority-Analysis: v=2.4 cv=GfKCDgXL c=1 sm=1 tr=0 ts=6acdee5e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rd0sP4ULdwr9m3flnKMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: mbMZ4Elr9lKk4YgYYj4hkA2rwUrs8KsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
> 
> 
> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>> ---

[...]

> Before review, I'd appreciate your input on the naming.
> 
> Surface Laptop 8th Edition comes in three sizes [1]:
> 
>   - 13 inch:   Snapdragon X2 Plus (6-core), UFS storage
>   - 13.8 inch: Snapdragon X2 Plus / X2 Elite (Mahua), NVMe
>   - 15 inch:   Snapdragon X2 Plus / X2 Elite
> 
> This series adds the 13.8 inch model only. I named it
> "microsoft,surface-laptop-8-13in" (mahua-microsoft-surface
> -laptop-8-13in.dts), but that clashes with the real 13 inch model, which is a different board (UFS instead of NVMe) and will need its own DTS.
> 
> I couldn't find a codename for these, so I can't follow the Laptop 7
> scheme (romulus13/15). Could you please suggest the naming you'd prefer
> for the compatible and DTS file name? I'll update it in v2.

I can't find any. The LLM suggests the 13.8/15 in codename starts
with "ROT" based on the INFs.

Konrad
