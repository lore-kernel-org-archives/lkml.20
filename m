Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196603;
	b=PHEI4/HibXUzQu1xd94lALndrLxOqIFvnUQr4SErQqenebGJWtVSy50WsmOxoFM0kh/j
	 zaEwKZj0VHFEapGJG0hlvCv6j4nIDjwGrfcqpHESsiEPvoIE5i8JHnkYdHQoyp7f/zvLD
	 yrctAOM8B7XnvdKgY7G6hpDP7VdaVVYxypEGpqx2Vd1xsuKA9jE6xbq069sw5++4jh5jg
	 jnKqa+Z/sMjMYGUSVyslSHMkVcHypa/9cKie2aDfxxATqvHGBaN8iXTVORUqb+IWZxVFG
	 bz542uMFxk/PSkB7nRdRffe7l/71cO/CZBcm+EMJawLcjwCZAq3mIatJvlTS/dwvkAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196603;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p3uAsxXhMgLyxnZI9psBFiE1jxoSbDj8F6VZmzF5hR4=;
	b=4Z/U9pAb+DmNqf92cD5fV/1ssl+IReTvW8VaNqBbREikxXu+mcjQhqhjwgQuSDaigzNm
	 4y/EnWYo2502Pcs7cBZa6inPXGYXHododq9xcIiiv0atrawFS2/dy7UPywtzdHlNeSXOU
	 dH0j09TaR2mpoyvca1AlqtG9RPSEejvAhbj4ylCfH8GEnNNu98iuJKjNk3mNGmtECxntq
	 fJwDmMMXDt4JzZ+RDQx328dfnOay/4sNyCx9tK7gSpMehRi6Mirvgn3FBG1B0RaaQVAxo
	 gb21aowTUK6IHZruWt2nmdhPNewBGCnFPHr7spisUFh10s6zqzrJk3GPSZa0hHmK+0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m3XuOEdK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cIUx9o/w";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82141606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82141606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m3XuOEdK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cIUx9o/w
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDI9E6718174
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p3uAsxXhMgLyxnZI9psBFiE1jxoSbDj8F6VZmzF5hR4=; b=m3XuOEdKG6c+UAsF
	jwDnT2dsk/HeQBM7NpYlHhvBNSY+qEH8YZzXyzyUSLbsl/lBSmCHdmefdkQy60fv
	IwhC8IYfHMcFzLd8CTGLGbhi/u/aFSZKx1OzGiGmNdl+lU8TiBL/RyFW7tb/K4wC
	bnDp2E49K6JsGI39vmE2i0aQ4kAJEAG/a5GL6d1fUstBo5s3uqnPLk6Vc+rwCbUZ
	xnaNjHgZiTXTWGElubJMMPDQRz9lYiuDoztfVvF2XTESx39F1PsGMpSHBeSE3ZKZ
	vgYCEtFQeUquvflQ7Qz/7W+t6p+rfErIDCCkQ9H5ZFxB5ZMGFPmRhqMNklh5S4CQ
	mhkhpA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjg709-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:10:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc2c798d76so22025137.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793196602; x=1793801402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3uAsxXhMgLyxnZI9psBFiE1jxoSbDj8F6VZmzF5hR4=;
        b=cIUx9o/wSZT275hG2sisTTAO7EGkylWGkOLO+u1MAO99v3eg/bua7YLHjonc3+wWyj
         pWTFuIa0QPSzR/wT/kigjZdsKrZ3vKi1rAfZ45e1iglIqadyNs+KlVGJvt6g0Oa3ueVx
         RZI4+fYmhrAcCy5YznKx9bjXupNEnu5Le6Mvchi0WHFu72brAskTwxdOA3aHBE+pAjku
         ABF3tZyeabDigAsUw7t1LcPvuGfXo7Aw2b+E5hDrs2Deiz9I+aUI7Qtn/sFiIDSsjOL6
         Q9QvbiIT/DvaBVeOTsIo9lJJlmXk61TuwwXoszYKn/dHeiMy+yjcvEEYowuJCgL7pPCz
         ZamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196602; x=1793801402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3uAsxXhMgLyxnZI9psBFiE1jxoSbDj8F6VZmzF5hR4=;
        b=iyTLogeZZWmxDO7ViOOqrhEG5OPubygdxBKHjqGtMg2p+H+XFfZ5rRpW4yA4y8FXuy
         C2mGaVL/1IQuWtR/xZ852aoRop4nRtf9zc28r/KjHwwlspFTyESWLwJd09+G72S0QkWD
         D4U67EPx62tN1VwgivMlFJRgTCBpfkQcj4LJ4XFUh9tIjWLib8UEF1YOwWYjXxbqwtiG
         GvD4AimFGl+RSNt1vZsTRkZHNcQBlfxvReGsHW9kaXMAhHIPgMziqbTKm50Pp89n5Y6I
         NFyHSg+VGwqH5d08AIltcrbAdATwtTirmcd6JlyXBifRXp5r6dFP6GzQHDm4XnsVy7Dz
         e9Jg==
X-Forwarded-Encrypted: i=1; AKwUvBwjlEz0249p5kPNjg4gm0j2lDjaM/sUBgWraMlsALvLuf5F4uqbrkljSUn90cmZAsHdeBMEZhOuBVW7qeg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTlfdr2G60A6KsXrQwcRR4m0tlIBZmJhr4tD4dyoLeg0uMEuvy
	4K4G5aOYlhHp51LQZJb/YbkyFzQsXLj9wdJNCk+3agGy69mwalebZ3FUr82oa/wLqNy34rpi8tA
	i1/0NP6YAcxOzcu1xrWPgGv//hbMOf9Kdrs3VY8m2G8PfyMBWF6fhXXAcEoda/VJhBcA=
X-Gm-Gg: AYBFou2YieQapnepYdY8ZfMVr/SEIcVz6gbXAbrR37kRXWkLJUhAG9BU1Kh/yAJ77on
	bkwSlo4He+D+/BlQlvEwk5XTiiJoi++TOQixsR1hg+LcqsPAnR28gveEnqB5kUbroR/nqneMf45
	2HLk8AXvboy6HLR2w00GiUAAWL8Gmw03JrIRRSzmJmLTlvCohXMSd+cqzgl8hmLWgo7r18FmnDg
	H0YtHp6pdXIdt3lXiL976dTePmNto9qRwdxFmWPGSRBQvW7BaeqT5o0m/OjEHuBIgUZfgPAAyne
	bIXNYaKGwEeiIm3zCIAyFAv96EhWoSfSh5qderjB9b5ZXmCbZzHk6smDd63RCDTuON3VZEVYaDc
	EHerRou4eXypF6374p0O30rSCaNeRQL4R6y8WBfPMjYprufl5PyckKHU7OPSUf522hJh6/7A=
X-Received: by 2002:a67:f28e:0:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d03a4e9c8emr928074137.2.1793196601486;
        Wed, 28 Oct 2026 07:10:01 -0700 (PDT)
X-Received: by 2002:a67:f28e:0:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d03a4e9c8emr928020137.2.1793196600819;
        Wed, 28 Oct 2026 07:10:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49642026esm1559192a12.22.2026.10.28.07.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:09:59 -0700 (PDT)
Message-ID: <894c4e6f-cc8d-4ac8-8401-d37c17003398@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:09:56 +0100
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
Subject: Re: [PATCH v3] arm64: dts: qcom: sm6125: enlarge reserved_mem1
To: Roman Linev <admin@mswin.me>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        barnabas.czeman@mainlining.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821032541.1856299-1-admin@mswin.me>
 <20260824155535.335494-1-admin@mswin.me>
 <20261026174436.305327-1-admin@mswin.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026174436.305327-1-admin@mswin.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NiBTYWx0ZWRfX8m4J51IPxUVN
 R5K10T5sA7R4cwwKpHna/3lqyYe7mGztHOFsBpB4gzzWEdhTyUahIC0JoXCG6TW/BfNMh7YXylT
 AlgFM7avnzcoqfWpda+RUeJwUHHDUN9MPfR5Oe65+d/eFPQYIazbbgleKR/odwMHbNqHT7Jns3E
 HGEjxF7LFMabV7daFxKGRKZ03NaZM3WExDNU4HGvsot5wJo+06n/56PQbNojnf7VK6YJC1m7PJX
 p9bVerNSKrUEHMbalMVgMozsYtkuBtTYX5aYsOopctkdgneoXVyrvZHkt7dH+1kFYs5lJHmkIQU
 gPdHwJURPIGnPUHjxRXBOLgZKW/qz+4cQ9fEIR0XKveO1DpOaytRLr5jEpQ7Ad9AazcNzCoVTel
 JmoF/Etsxq/5qokMOUpsZwxbxP/b9N0ZhXCJeiWkB5xzz/HSSrPUZW7nzhii5TQ2a53bHi6BANT
 n5lnE2vDB1mRyh4xE2Q==
X-Proofpoint-GUID: i3Y8j3UUDtImPa2m6x0ftc2ySOIHPLf2
X-Proofpoint-ORIG-GUID: i3Y8j3UUDtImPa2m6x0ftc2ySOIHPLf2
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae2023a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MpzG7HhK7Oj8BWxnim8A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NiBTYWx0ZWRfX/p8viCtCP9kU
 ptCVkQEXyaI6TYhdGUNYMGbmDML1LrWDgMnMHGK5WmhEgq3i3Z6LJswQYky+YOwzcBOJD3lAaHU
 G7G04O8Dqoe1nw9V7MD3e386CSEo2Hc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280056

On 10/26/26 6:44 PM, Roman Linev wrote:
> reserved_mem1@46200000 is sized 0x2d00000 (45 MiB) in the SoC dtsi, so it
> ends at 0x48f00000, while camera_mem begins at 0x4ab00000. The reference
> firmware memory map for sm6125 reserves 0x4900000 (73 MiB) at this base,
> ending exactly where camera_mem starts, so the 28 MiB in between belongs to
> firmware and not to the kernel. The dtsi nevertheless leaves that span as
> normal System RAM and hands it to the page allocator.
> 
> Every sm6125 board inherits this reservation and none of them overrides it
> or places another region in the gap, so size it for the firmware map in the
> common dtsi.
> 
> On laurel-sprout the mismatch is observable: page-cache pressure eventually
> reaches the span, and a store into it never completes, which hard-locks the
> machine. Before this change the board wedged at roughly one lockup per
> 59 MiB of buffered reads; after enlarging the region the same workload ran
> 691 GiB of buffered reads with no lockups. Booting with CONFIG_MEMTEST=y
> and memtest=1 sweeps 17 free ranges with no bad ranges reported and skips
> 0x46200000..0x4ab00000 entirely, confirming the carveout is out of the page
> allocator's pool.
> 
> The downstream laurel_sprout device tree describes the same base as
> removed_region@46200000 with a size of 0x4900000, so the reserved bytes are
> not a new claim about this hardware family.
> 
> Signed-off-by: Roman Linev <admin@mswin.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
