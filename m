Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69B53F0761
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371551; cv=none; b=RksooASzT/JNrhBxK/U1Ubok6yGlxAMJ9RhxSoJFy3LVELouoJ5AXQpMrkFyD1Ytw7UfHhpwLJfzA+V3Nivv7sQ21LZOmHt8fzqk6G/LH3OABPE6wEXw4EuaECSTXiYE1r4cVgLX3LuXyrePGHtiBnxMHK5H29I1DGhW8fk5MKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371551; c=relaxed/simple;
	bh=h+JU6UTNI+N15kkZy39dX21ROFBFk5dWP/GVLMUZJ0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tz2Lri5WVpIDCVRysPDRTNdoTjc6L87RJsfib0u5qxwTCsT0E2a1HckGKvZU80fE56pyiYwnEc6Bh6+oIAEz9zHnQt2HlPeMteNl32NyYX46VWrXYX0MvdW01cU4sItLI+vvfcKdePsBLJyNQHFBbBYCMsmy+jrPbP4ykZantN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jfTN+u7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RNHYO8oI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jfTN+u7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RNHYO8oI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jKHl3842723
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IXK1/kL2U0HScIthPTsqaR/1KhHLZK14qm7gOn1yzQo=; b=jfTN+u7S6s8Kygfv
	0tQlYEdwyKq8ulo4jCKxzfpCIEIokRYe67J1CXZq2zfbGPmL8hsEUcBco582PNp8
	1zYSZfZNhKI97emj/ts84LZXDvpvzHX/6rJUppL0yKTC5J3wGOgimLHKeRsthC51
	PzDrO6MAF7kEk+5xCOjqW8WLB6s0hW7itvI8yROr4s5vy1q7gZYtpw9ptSDp0ASM
	dPAjafj/jl/zCsj/qMZ6aAB+j8Hg/JFfMxZiYvJd9yb9GZ9QeP0x6DcTZ1FtZJpX
	CDY2HucOfa4tuFIkz1OmtBCbNSBdEuG3yU1L6ZIRljjWUpewpggZrUQQRzZ30+Ma
	f8MYPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5jq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939fc317691so48154485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371547; x=1789976347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IXK1/kL2U0HScIthPTsqaR/1KhHLZK14qm7gOn1yzQo=;
        b=RNHYO8oI8JW/ibXZaCnTWEA+qs0YOb52iaZnMYca6zZauq41vxx9mkrIR84s0uqv+S
         UwzTPMJ99VSrJ+OLntE8262Lrs2LAIWac98VM8agNAcf0jUxjdU34x5Rw+LRK56VfV8H
         xB0avop1Pctuftqi25AK4beLhEWHEGDnVWzz6yrMX2m4iEvr6ROv7lyZzfbtQDo/DNIh
         QqrZtIqMK+6cM3C2hiD65EKnG6gmHOfWSfTr/AL+YxJYJLQEqA6Aekd2CMEPlXJJFKgh
         EyA3jXb9S/aeB8tXk7i51lduRX5I5svIpqPuj/tHGI6Vy7saz/qBnp2ag9cHtMboeCVQ
         XrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371547; x=1789976347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IXK1/kL2U0HScIthPTsqaR/1KhHLZK14qm7gOn1yzQo=;
        b=YpKfUvaAE/1B11fUyoUS+7dfh0ekNTw88br1Qy4wIXS0Y+uQsoBPA+n+k7j4Vd8YKc
         AFIslzPBEOQWcTXTe+c5xK5kvU5Jzcs6ythfYsiSWEUO6TKV8YBYHRx66HBoiHB8iPr9
         sJbhdLYkkLuEuERIeDHSGFqvBcDY8i/ypJMtZTK/RoPiLqOeRLlR33m/ZH/bPPJu5J7+
         s5X42IZatrBb5FJahVkgnBavLrdOTJfv3cu+U7vEPnn0TaMAiRO/B3mK+e0KfDhy1b5/
         lTgI/I+9qtZU6Fj709dmWTIFe7bHEkk73a87nG5kw54Dh6IYNN2SPrSL+Zf/XB9jKUjQ
         uU4Q==
X-Forwarded-Encrypted: i=1; AKwUvByWIyTvoREtA5PVJSOZlNIuwHEF0/0aSoOVYqRgtxLNonmC5+9Pzv7iKHNMXyjFEZ2xHZMQh91NhOM8bFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kuKZHJVty/hhDgK/QWDSW191RzIDkh85Ct6h0Buq1AgWXkND/C
	XUJe4ka/q4+cxEgmlnwMoXzfC3Xz33N7NxOhuMRjQh0Ruxkow+hboS23HuAMnQB0+ExVjXIPKei
	PRW2Lmx5OCGHlAKM2DCLfIEKk7aRf3gKn/5UOsEko3ZH1rdwRyAoEbhqvtJM9ccGTaqmy1kKrEj
	Y=
X-Gm-Gg: AYBFou1nFcc6/qIrYz6xvRS1Fgq6Kka/wJUY7N4tFqAwDgQ9XbAFIbs9BpMi0kRjN3R
	KetuadxcVhal3d5sDLAfuY7sREcRQGMP5oelxLCZQF7MUo5fhZ1AAJP/afHXli7Zdz7u3as3wPC
	K/c3v9p5oaTDclcs8nil4J9hbEcELhIzhP7i18wu0aG44olLueQioqoq3s2RohOwaHiGemXy/xg
	uxIR54HSFm9gSM/V91QvbUh10snBpJfMrGe6imfsTyv3O06VA0nb3grK3OCOybzhITzYbF8A1BY
	0CJSUx0KT7cOedaSPRPHIlEDnQMMLpN0nd7Dwx4b0mniX9yA4iAJCUkNuKAOsQr/zgFC0taEyA0
	OyQ3KN2lTq0JPB6MHs7C3GA==
X-Received: by 2002:a05:620a:4707:b0:939:de49:6c78 with SMTP id af79cd13be357-93a297cbe3bmr160272385a.2.1789371546948;
        Mon, 14 Sep 2026 00:39:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4707:b0:939:de49:6c78 with SMTP id af79cd13be357-93a297cbe3bmr160270385a.2.1789371546524;
        Mon, 14 Sep 2026 00:39:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9d0ef7228sm2170656a12.9.2026.09.14.00.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 00:39:05 -0700 (PDT)
Message-ID: <31fa4256-f285-40a9-bb8a-0b5495badf69@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 09:39:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx+: Increase GMU FW init timeout
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Greg Ociepka <greg@ferrisoft.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20260912150915.28700-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912150915.28700-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D7CSJhwMkxm85pm2hSe8fITFW7kYGK6U
X-Proofpoint-GUID: D7CSJhwMkxm85pm2hSe8fITFW7kYGK6U
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7a49b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9tEP0OE30YQ_IqY-BwIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX1X0NpaGzWRTs
 9oNdbj6m5rrIc5j/f3Ds+JES0uP8sPTCXfgGFE89WH4TW5cyH0D5kGiiQDv1HCpd0wB4i6epLBo
 UHblREGVqYRHqkpkA07T0o4EH5yqJsNx1QA2NuP5TLkdou5i2mtOFqy49uj9uznIjcaCP+emRn7
 qDILixoAcyFzpS+rcqqLQHzwXaAgirOdcMnpAsjOoIpoLHsmwfvvnIDK6TbZ5DPQWjnhM3T9rFq
 eQR+p4Q7yocOlRKocmpE0t/sjkR4Ov7tm631oTrIqFHkredyCPjoEm4C/3fvm15yLC6tvB4YJFb
 4MZ9vBAqGKuSdrlfS8RrVkOMGvPDvVf35cnO96rvly2Mk6ywLREcXNwCz5PpxD7r9yBM+TEn+Bd
 6CCvNvKtkegrhALRDtJYCqBJiAcz8hEZrfJCEtsB68MIF/i6nkJY9stJWwcnIAkmy6Fl0oGFEZa
 KywkFa035TkzceEJa1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX+VuVE3sjKdFA
 D78O3le3oQ/jCYP2entvFZvKMsiO1qfTs/usJheC7f5Azfj4ngNi+2UPM+aPvTai6J+T/eavLeh
 bNLY7J5wwSXeBLZvZOIV969WPeQLgtA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 9/12/26 5:09 PM, Rob Clark wrote:
> We were using 10ms, kgsl uses 100ms.  In practice it is usually takes
> less than 10ms, but very occasionally goes a bit above 10ms, leading to
> a "GMU firmware inialization timed out", from which point things go
> south.
> 
> There are probably some things that could be done to speed up init, like
> increasing GMU freq.  But to be safe, increase the timeout to match
> kgsl.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
