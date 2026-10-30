Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349430;
	b=yItNMmw50prplwZJvS6hJrVxc9ShSWqxTrs0PT48SsfuTTjCtPRo1vDc7ooJBGTZsugM
	 7IMdzXJONE5tWVuQAGW0ZsQYFlElPQX/sbwF0j9V0a/nz9HBWossvqEjJwZ/QaSOrARfT
	 p0EMaYMwMcuzxxWx5tEub+QoQ6cMZDzDpZmfT43XokNSI3ySGfQuGqhhZVeGCw7JcEpSw
	 N0Fx8t2L5i6plMa/9J0eUIVwRdS7PicUJYceqlsnTl8HKBtCiQqIcZkShhl2QjFJ5kk1z
	 Q82VYCcO9bc3bYpBxhLonHhhPWNYZIeiC51Gsxa+4fVrXh4jxxycuOHDq2P+ZVCbLXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=maEaVUpqUTDE26hi+JSQNtxqgOMz7I8G9wR8nPlX4Bo=;
	b=NE0AIkZGQRpNmpuJ5OTP4iH49D8fJ1cPToxw+VCDRXqS44f3O5Itin8CeSylvCCx/dUn
	 sgNY6bsy3vpBYnXcw+U6Jc+uJX9ZjORq33jwKCfajyhEFLXsIEIrAz6W5SNLfTxA6sWZ0
	 IX5LdqzfMPAlyAjWXpPWrW1AZeAnUXKfsz6PTr9+QDpgQnhtGwiXKRkq1Jz6Tzorgn/+l
	 ICbviWJXprLLoOTfbQaRdSOutQDlOX//eVdL9I2HngWEVwTKdiByGWV93a2xWApokMArL
	 5uNqwjzNmAymkMt86HgFkNWbkHR1osp4aAJIRgjuuk6OHjvRYqsXDedMsT+Bze9KJ0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X+PBhZTz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLJcIPXy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6122606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6122606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X+PBhZTz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLJcIPXy
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F09f2721626
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	maEaVUpqUTDE26hi+JSQNtxqgOMz7I8G9wR8nPlX4Bo=; b=X+PBhZTzsT2bbHOA
	jCzcGlz7AqJCqcFbHqAp6gEWqyn8ytJDGWMmZMhZHC8wrcHNxypK0C3bK/GklafH
	sqF0sd9JQMR/JXrOmtbEsCSsdH21IfNCcWRyRmiWXBDfkBWzJp4rYA2NhLVkDM6w
	15JJuJ9T7JSutyZozwJD/OY9GYmgV6qQUISPQRRXTYpxy/QuG1hQ3fmjbPMy5FWM
	WVUBnYn0DtjP1JTqOJTLbCtaiX/aen61I49nqu7qe4amudDJJwzKhu3SGg+np8XZ
	51U9+bS81FE6xtZSEXyhBzNYFS/4EXKTY8me4OQAtQaAu9RG8KqyPnbOZ1K4jB1p
	nPFzyg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj1dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:37:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso9950785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349428; x=1793954228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=maEaVUpqUTDE26hi+JSQNtxqgOMz7I8G9wR8nPlX4Bo=;
        b=OLJcIPXy24cFhsMg0ERNJDadrLkOqROLv6IereptNbZXfBNjLeMa9bbWnPFSxX1AjN
         bXcC0/5d4mcr6ocCtUGbjacZDdqBh2BTjneLzPgPxVD3KkjBz/ouq7WHqk2hqNkQoHlk
         5MOvSRw4InYQnKTtd530DzHapmiOZtuFJV1qRedO2VpC3MjCUpo2zyb84pfnQVMEYG2a
         2KXXmqkOrbc6uu4Pdn5ynL+B0JzeXqGoUcrs2v/F8Th64xWw9og3GC6LPZYOQTT/Twx5
         5gu3hK5AIU4AjFSKI9gxAbrvhNXF2nBtX0jcg4PQCOPXUKNEjpltIuLrQ46/DwR4NDXp
         NZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349428; x=1793954228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maEaVUpqUTDE26hi+JSQNtxqgOMz7I8G9wR8nPlX4Bo=;
        b=xAD+4jaX40mTvMSv2jfz3yFLGMnLDIqSP7TeiiITbHRsE3G/1YZpS9HYU961jf3o5/
         y1zL4K9C0j2zQOoImWWU6RMWtV0F5thKBt71MzatOrYMZzAcZj4BjStjEBmEDbGI/PoX
         jM6+29cqqfmGfNmddyn2kfNWPHvrX4nWH1yunk2LvyBogSeIOG/oQDJAYJRWlnZz+pKU
         bTt/tj5GO1MzYg4IoG2V1nlTFglZUbUzPekMk06w8ENFpedCnwFUJTqc/IG404JCdh3T
         r923/sNtc11x2gUgg2CU2ZVt92FwCNc3LFlCE2EeNhTWY6lNYUvumwira9kkBMKHI6do
         V1ng==
X-Forwarded-Encrypted: i=1; AKwUvBxhVGLM8ezTmwe8+XHG5oO03CiIydOkmNGFVOB893Anv6bmdVgLMyjwazTmTKV48f27fuLBVLVNbIpP12g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuiK22WvYF3hzHse7qtQHKpaWGhKuIv3P01evTtCYrpk6Plqdj
	Z7l+98YiX4c8qsySbdupY6HNzGOP80D5FdpML5qqyN1taVRNu/7cxivfSdVJYXtBt8VLWJTJ+f8
	nQXDzh7Qd/HuTQGQ5f54GhjOPJBzZ+vkM4MpWNrFGNXkMT1dYzQmtIb+cPfSZP7cUgREBxIVcYs
	0=
X-Gm-Gg: AYBFou3/QhuMAtE3PlMAQKhoBUepmgKYMMhmhJ+mBt+ye6RReicl7WtpUfA3K+nu9NK
	WLcu0mu0zO+93kGMKMcIP2rDVzbx0lsKgR+riBz+/8MzOd3NOGJLDfNuU0sUW5/5WawzAysw3zl
	bsT8WG65L1rK3MiEoY5TA8zu9pfrCH22k7W8NTHZIoJrLUPBWriklZP0jyBU+tvUyWQ/JpPbZYQ
	JBYDtQuZtcGsjCVBr8gLFqM+moZ0HumHjTZiFHcE/snN4KYBR5G5QxwkDAMMD9AaEg8xmiDs51a
	InEOpT5TKjBV24+bbe8Rb/xAKRK8+QvejlaH5XKyZdF0elnyPJjRXORHlAfGHSJQ8Y9OZQF9ZPE
	aGJniR4QGG8C4qYny32d1AasvDboqnpT9fPgPRWCf82ts456HME2Z5t5IDa7SjreK3JDfnvY=
X-Received: by 2002:a05:620a:a0db:10b0:93e:508b:7800 with SMTP id af79cd13be357-9442140aa25mr263599185a.0.1793349428376;
        Fri, 30 Oct 2026 01:37:08 -0700 (PDT)
X-Received: by 2002:a05:620a:a0db:10b0:93e:508b:7800 with SMTP id af79cd13be357-9442140aa25mr263595285a.0.1793349427936;
        Fri, 30 Oct 2026 01:37:07 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc7bsm40134566b.21.2026.10.30.01.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:37:07 -0700 (PDT)
Message-ID: <9e8468ec-c9b9-40c0-a219-1c202a5e7c6e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:37:05 +0100
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
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8350: Mark USB controllers as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-6-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-6-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 16IcxJL4MhGMRk85B46aC3YLCqBqF9FR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX7dj5Ywdvp1BF
 LnMwymaynq7In9SGesOtBkhVZGBVFir5gx6YtDYgx4NOG1P6mGJoxzuEGWhWPc52p2cr69CCGRb
 lwyjzZGxISJRnu2Z7Wz//DVZz85xBuM=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae45734 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ekXOaHz3wcDJCqmUXkoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 16IcxJL4MhGMRk85B46aC3YLCqBqF9FR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfXwXhRfyCtqUcK
 1O20ncO8twKuOAUmUFANTYi36DSbJWr50W3qU2mHu+4+unwxNUUMxIO1eSiMvxdvt0XDXKOJaZG
 gA1W/kmjhLOwN7j119ESnHQxGGkUpO7URM+GkPCDl7cL6g07r1NgfB9ggORx9+uaKraXarnc61z
 Gi3U3eoIAUFyljrb9AK9VmuuTQee4gIrRaR4Zz5AL/ZjgKJOGigLXs0xXmVmwA7Ae22TnSiGUhE
 o9bT52PxUw9/ELa80zB/ag/wGC2wvAu2qz1zxYkmCzbFeabbLZMtkTqNtEosyyU9cPA0OvB1kLF
 d9nLxT/ADHBvfCBzxQkCHsiChnW+iDGAwG5SvjwCaVy7elRU5U5kTXHu4l3HqC4e06r29f5Tmca
 QhkSbP07aHYQRN7Vq5Lx8RsJb1/zf6RJBD2GH2JXC/xqBDk3EUIMkIhJp6Eu+VUXS2MqfRKdRaG
 Inh6LjuBu2Ni5cyQCSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> Both USB controllers on SM8350 are DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
