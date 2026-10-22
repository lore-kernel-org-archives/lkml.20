Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660054;
	b=dBdCgQP/VBcFJbS+kBNXdfAyLAP/NruUyYZEj63awb9eP7oyOOapY8Rf54vd+legL3Cu
	 xnGlY4xsQmcBMy6KwRiy+pbEiU05KvbbS5/ysN/otOeJJSEM3lFXw3tozr+wBCiwYgssC
	 PFMDsn7TnfkVGBunh4HqwIBPV/p4gZzbRAcHY5k901iYOvKq7I0/tcBcRuuVmxbCcIdbf
	 iluIoFLyqpaJpR0IhGV77KSieMYqWbSb5w9rCPh3XadeFBPvDAvDdz7DTI1rNt/Be/Sjl
	 PELqcgkee41Ifd8rUxtPD9XuNNOnEB8HkiF8qnlHtMU7WqwN5IY85a24bv18uGQXVLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=;
	b=LQazBE9xVNkQhqYzxBZo4tAZVSbhN0aiXoRscAZINh7qmaUx49znQ5phvbeRZElAfE1q
	 0iAfiKYjrKhYtfKxEBBS4k+nAxG8ZdJrZjIRMvBztX2eK1m6VF1UlqEKApkZuFqIELyPG
	 4qiU5MkMOSN3AKISRtbZHgUHDtS2a0wSsBJVWUPDKHR3hljlnOJ4SNjH44uhsLThZm9ro
	 xq1O4egL3M00zABGAwQ7hOxw4uU3DMbI4DRyQl5fOhLav7tFJt+lnijUfcQKg6QoiPtym
	 HxaKfnthfGCRDq+Nb8z9ZcJbOlkLP/Mj9X7DSsBQla1k5Omd56kVR82RSBP4Ur5IQuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M586mBLx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LfhM2e6R;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA87B606A329
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA87B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M586mBLx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LfhM2e6R
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xx221560220
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=; b=M586mBLx+FD4X+tG
	R2Mk1TD2JkV2EZL8yi89fwMORGIse03JH2vFQSH9fImFtbxrK1C4QJDwi8c7EW7z
	HkKrxUS/8pFuTFkbNYrBO7PTzp1TJFJqN85FeTZVtkLBr8r4OCyAwIPSz6sahtEm
	KK5qXqiGl5dE0Voj0KEydZ5cVu/D+FUa8o2toyysfRgvw7Ma8HpH7q4oQYFQoRxC
	zR7m4j/DMD+wGONv4fxhG7KJlDpnG08roqKcj4ZDhUZiMWCHbtmGxf966hYrUGwl
	pQ/S8ITwYeRR/1CzVPPPk5LtucaHCebknQr2I2QgKLKapzQx6ACNEnR8GggRm8mu
	lduQGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahmv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:07:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso48449885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660052; x=1793264852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=;
        b=LfhM2e6RtHdQ0f+DWGwJRSFel2MsfAdRpUu0ZzFipI2hKsOfTXGcV5fUy6ZFlwnhjb
         F/DqiZ7bpJm41DiVto9Wm0gkZ6vZEwiVJQECQxob1BVqA5Lr334hkGd//OQcJpbP7x1+
         aS+eY7LWk1Yd5Ai5jjdIDClLlb51XWShMTa1lOuD/8JfnDijykR35/rgIkA9Re2/0KY4
         CsL/VABoP/ac8skzcSNmjwVCXuphy1noGZfEgUw7ILEejxuEgaMR3NFF7RwuDLTl7Z2m
         fwainCJXQjbYY26ujCbRjQStJ01el830G+SbW2tkxXVNznqvcQgSVcf2lB+0r8EoEP8U
         KktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660052; x=1793264852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9mZuQQYoWWsPIv3lgJNtkF+nm2oQ1HULJ9PRpgeEvM=;
        b=2v15iiM6Gut7MtGS/gm69dXKMUEhw2Ny26xRt5zIsVfFcTod+jO67WPlfp05wpGeH8
         ZhLAxrFJSw87oWjdCRpcFDicQ2PRQxl0XaZb1LslsyTZ/6myw0Lbg7okWcVvvKlQQs44
         E/WJC1w5xakHTojA782PJSABFe4M6k6vabwOytm5xEdoaN6m0Y9VBBix0beLert1tj0d
         fFjauplCaLtpRawhhZZ3oAxCg3RNVBf4LYmJnqmJFOxWY41r05qNK32A917lIfvLSVu9
         ME9zbL/9fvLS28oNEub5xgTIW1DIcJh/OxugkMxtNz5VYC08SKdQoLogWn30XkzS0UuQ
         foFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSR59kECKIeTgSOP/hICp/BJPE8I2vSVrLaP6cqMP1yhDo4PINeYN3/yR5wt9P9a3CaYXkWuZ06Hp55pw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK56QrIuQa9MLD+gEQON7QE+01spVe2JoxLZVbSbX94/EbxMzER
	j7GVz7oNLhtsFOuExPeh1tifCxgp5H+cgLci324Tkng9YOwIc5twHT4CE24v2dxXEkIZHnlHo4a
	lUyTFpFW+H/1bEW5ivA4cHjzW66Ln+DkZ9YzFmfIy507PDm+1g4VYL63abVPuYTQZRAM=
X-Gm-Gg: AYBFou13QvtxGQICuDyq0JGL/EAL9JMnCdraWeK8XHgFpW6O8Molz2YvHbDAKGYXrH0
	p772mrsLe8QKGKM5kCuSPRKG6BjshFbPT7yHOs4zwefmOl+vAPal258NDsyy2heG+gcddPsZY4Q
	JbxRBXXIF/BBmpUw1m4FnUWMb3kQpN5DHIYjvMlUNOfB797MYRZtvL0okm+4LbzVP80bKqOOda7
	8KVGecQSemXUlD6EnWmr2Ln7/malB1BG+XBDwT7P2YMn0HyGyQWKA+qWrCkslByr3ykwa4Cvvl9
	x2akK1nWUT7tVU5iTV5s4+3NQ3eZs6tsmRgBQ084OZSL+m4FhbLUOTfhrAL3+xvLqtBx2KdUliv
	VIkFIeuqD+8G5s+ycSOl1mA==
X-Received: by 2002:a05:620a:450e:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f57faf861mr1017573285a.4.1792660052287;
        Thu, 22 Oct 2026 02:07:32 -0700 (PDT)
X-Received: by 2002:a05:620a:450e:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f57faf861mr1017570185a.4.1792660051883;
        Thu, 22 Oct 2026 02:07:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55ffb2sm81973866b.38.2026.10.22.02.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:07:31 -0700 (PDT)
Message-ID: <aa18ce17-4169-4f3e-8e25-c088c69db0c5@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:07:27 +0200
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
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: add device tree for SDM845-HDK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
 <20261019-sdm845-hdk-v5-4-4aa7e22cd0ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-4-4aa7e22cd0ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX1BZQadK7XUo7
 B3B68fnjfdjsrSI86wpAY1Lt/AjhzbmGqgimLC+dZiZO8W2p4V5bvCtbyIgLbBGaQFl3yTsGvC0
 Yor0bAjrz2bYMYLRvKLBlIBcWoSUFYicc19j+IuR4mhnX15AIfPZ+K0MpITbikSM3FE/n9Qq+DD
 6uq9fQTiSszeXoB8t3/Og8gqd4IEaY7A41kiWGwi60hpRWO/U2zp0mVfZ6ZpJ7PEimj+uUazs0d
 trktXQG2OusWH2DYQsKkJunJ0b+r7kxI9DClXEVGNwyWKJqSxo4FDyfOUrDHsF1+nxA6g7h+aCU
 DI3xRCqdzCGOmc0hNlprR8nrNWbE7lLGofbvfMRd8miILR3jO2xxDg1ByuTwbKCxnXol8n02Ug1
 zLUZIG50iHqhEI431zoouuD5uidbvea1y9kqlQ4+GoR+dcUFcpVukNZctsGVTnvufgv9V5ue2Hk
 Lvqo9WhjEArVN1pUlzQ==
X-Proofpoint-GUID: NwG30vD5z-Ei5Q1RTzDZbDNcn3-Lo2k4
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9d255 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YDUdIes_syoG-XcJBr4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NwG30vD5z-Ei5Q1RTzDZbDNcn3-Lo2k4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX9xB86urwYMdj
 nnlfzg3kSMEEXGUzVyFbXVvcrDoXGEQsbRGXIxidVixVrPp5ZOcrYGj9v3imf9yF1TKKXXbq7m/
 kU1anY3mp2qtA23emWofa+qcw14bspg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 10/19/26 11:18 AM, Dmitry Baryshkov wrote:
> Add device tree for the Qualcomm / Lantronix SDM845 HDK. It is the
> development platform using the modem-less (SDA845) SoC, optional onboard
> DSI panel and a rich set of connectors.
> 
> Working:
> - HDMI display
> - uSD, UFS, USB
> - DSPs, WiFi, BT
> - Buttons, LEDs
> 
> Not working or not tested:
> - DisplayPort - TCPM not supported for this PMIC
> - WiGig - requires power sequencing driver, doesn't work with the
>   current in-kernel driver
> - Audio
> - FingerPrint
> - USIM
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
