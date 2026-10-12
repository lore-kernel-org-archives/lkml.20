Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A13649B210
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818533; cv=none; b=Wlaa3q7A1g0rwiTi6P6uGcVO6VaA7FnNNa6vKZzQtJ2vpCWsQy41rAsYMbJ7/GPj1JTgCkzHMswtA3t2+zWpu4pSgq504MNxSFB3Bj4+cUDRlzCzY/VXmsoyBtaiZ1eaSfZNACsaUs89hPcFGcGo6bE3JKTvyuoMK+kykhRevz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818533; c=relaxed/simple;
	bh=IJRoYw6sJZ0+0l+od7X0+0OrpYFWPVf9diA5uu82KIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSCV9bKq2obMO1BtyJwk/l07lkoEAc2knlW260jLeKT4/hpHPKwpL3fiv+Uv/DnCz6hZXXc5z8/MKY9pdWjdMo7008i3JI4vaWIe7J+bihef5qp86ywQLUQnaPFVWikrdJZb7qmcc4ARZNxLGWic7ZhpT85EVfTQE2ms+hIpyC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7F0DrT8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W0ctDeiM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7F0DrT8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W0ctDeiM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0CC22786971
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=; b=h7F0DrT8M9BWmZVq
	03NmCIdq00IQ82UOes3tXhmMdgcYRyXxUg+QgKkfEJNLgFzfB4Y6X1gJpPMlxUiF
	dl6rXBbm6sLlO/CoWPY/q1iCkp6Z8mIiGrj/0iB1axoeMR07SUNdAoJmR0Hmnc+8
	Qys5Bg2CFpNLJXgtQQ91TGAyMUzlHXgs+KwFKtMg0hgjanwLkjKoYzBXHeVYp/hV
	JlTFvZTae3hL2sBVvsapw3o4Iigp8aTrnv/O3T1It3xukVF7pAaYXDNASe+xLSAM
	44vEaMoFTLrImOPIe0d3i50uaaxBOO2k/ZJNbl7nutFcnSlFbQyYFsMQ3lHbR9PU
	OwZEpQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffhbu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:10 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so34360e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818530; x=1792423330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=W0ctDeiMCiEG1VTUFYAAOdNh6jPAqQRS9HAFSGKlVszrFG8sUO7VqfVC687WltOIYG
         951JWkf9XYCrJOsAZzRSOa4n5dK4jM4IFHP1ZNMIbrfPtU4h6pSF7b2XVQT5j8zdntEa
         yYe253B/O9GckT7gXFxLnc8bPKRtqBhcdQjpMhf1xwzwnRjBLKBeTFYhuNIu3lbjSIua
         UNvfDgvxozxf4Usvjhdq+exZPPMTSTrxjxBRVAGGpeq6D40QOiitT7fqs1+j9KwX9Bpf
         jW/bPZfg+9krPjmNvr4NfeTBvaCyyBiKocKo+dAWFLBDnVbXWG9VA3VyBsNVnUpn8hrG
         HGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818530; x=1792423330;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=Gkg6lqltqluXR0sU+TkktHhOhCgX5NRY8MnuZL+528A3V0RyGP81lk7m5jUSm0XSwl
         ZbkJNfSCnI2Bvj1HhpclOOvGag0CiRKYMJjGj/tDmtIULWrl8EdxV0Pz5QplOoTVQxbG
         4gSOL6OIpIj9HXtkDEMGUbYyG1lpURCeOhD40q+ptvB/CeqwINcr5HqcFYxaH4rkCpFU
         CekUacV66pD4TsmNRQLi3MgG7ciyVpLCq0D1cye1DbrtL1FUiMADbUDQ1j0PugWqHKij
         2PWjhUInNlyeq85tbdN+xzxSdp6k8HrF6km3f9RpvT+EtiJ/+hs7rne67yuXKsNT8OUt
         D62g==
X-Forwarded-Encrypted: i=1; AKwUvBzN2V/oriufluPPI2QW5Jzj+Dm7XT1GhhB4NfSXjCJ80SB9Xr3Gjt/U4VQM6gJ4Yqw01E6g0JUPAoEZ+8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIawfDCapC4S17qwbhC9j9x5KBg23Pcpuj9h9cRtYIorTRx3/Cw
	j4NQu1psEBNX0nknTjf4iVoJpNk6NNHTzAYnxGLU6CobFvUp0x7qlCNm7NguISAlvMH9VvbRwm3
	pHSTGcNIxhWcbFVuQe44xwOZ3M8jKvasxH/FpgAyo4djql5vl+341/4CS5i6su+sfANE=
X-Gm-Gg: AYBFou26EqrUZp7Ta4yYyF8EJy3vYrXnFIyBb8DSfyjZBx5NJbfrnTexttqF0wMNn4o
	JCUAX02zsuyw/1zKXsxrl/sCf2v2ldOAUDDEpRlg2WjZtFhL+7sotAV56DiQObSIsG2F5rqlT0c
	+1CItG36J9ZYRXNSeaKg0quO31xPURGLVMDbnNqjVC8vkI4uJ8Mi691X3FYrzAiyrD4KlKCiLdN
	JXfMpXQ9DdK5qsVviwi0G+/HsbyLIlQp9pfVQOLupNyjtNfo1lj1OHFAlI8Yzbw7QJqAazPhjFz
	bNxz2hjjbwrcTb18/oyrNOI06U/Q8CFQ4+AhOVSy0L1HGQXnTqTscOo49JisSMeuktnOWllWv+E
	DbxPJbQdGbIxoXRUvyvN3Dg==
X-Received: by 2002:a05:6122:8711:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5e91f339ea0mr2105796e0c.2.1791818530352;
        Mon, 12 Oct 2026 08:22:10 -0700 (PDT)
X-Received: by 2002:a05:6122:8711:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5e91f339ea0mr2105770e0c.2.1791818529874;
        Mon, 12 Oct 2026 08:22:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bcbsm478161866b.38.2026.10.12.08.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:09 -0700 (PDT)
Message-ID: <96c79d79-328a-4174-b0df-4e3212d5d3da@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/38] arm: dts: qcom: pm8226: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <34fed5048be259dbfd389acce205461d21dac6bd.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <34fed5048be259dbfd389acce205461d21dac6bd.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX0zcx6OdDO/55
 hlmKwnSqM4b32o8+wjPGmZHZo/cj5ClyJb6xsp9FnkqAkM3Ri3tjCE8h+tOKTR57eYQTWEUNGb7
 Bzw0yVdeI62Tmcw6ZUuEFHcwQKsYEmDqPrTz0b5WeiR9jjBcs4s4W3PerGg4TFVNcACUsXIzOdB
 LkQkq9d0MGIX5NwAJkZf2gNCirm6lfBxm1JZ/5TbyZPBihXx5tP1xM3QRBG8F9L5dm0fUU15o1J
 dsBxnvQO3+v+96ePftQQ4ZXgWcmkGuh4+JoYeJ2q9s226GXCIgfYeDaZUeWy3bsvoa5dlW0VoFz
 qHf4zirBhhHWfZWyEaEcNUrZnOXLDeQJnUcxBhrwBH8h2f0hWM26na0lLiRLSUne13+hjdhKBBD
 W7BJv1o4rOo7I4CkUQRwtwU7wspjJ/OSsoUxCD0O9DUrfKdpiIj4nBpZjw4uB0+T8fMnWxiqafD
 BY6ZRC+5Nf1+cpT7BOA==
X-Proofpoint-GUID: Izaj_g-rBEPaTEGXEmdOd8LqhSCEO55O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX0DG4JFOtIyno
 oBYUiVuK7ppRKLfOXbpttEyCbotYtFcMRRy+qC0oVR1Qn2+ZcvmqD3QFOXArQNhIl2kVrt8OT92
 PWuAepIc9ng1vVJ2eMKyv21V9Qq392c=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accfb22 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: Izaj_g-rBEPaTEGXEmdOd8LqhSCEO55O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
