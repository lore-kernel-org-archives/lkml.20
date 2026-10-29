Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281023;
	b=xEasie+F31Kx7DX6s9b47tGS0e2aAF1JNhN90UgcAHp8yIYhBH0QZS5NDbomawxSQq4u
	 J+c3iD/acthe0B12G9D5YeFwZHnNBfx/6pENYGz7qFWkPGQKH8CXTNJ5dUv+j26nUhMF4
	 hCdjpupFDkpJ3tt/fhGJ69fxp8BnfLaMV6s2t3pZjh1iXeMsi+YAABzs52acVMGc7FZLU
	 trujCzBH68lNumyay65Nst/eCgKMgKNcD2iW7P4DOlxSWJMWJtkVk6HlMB9sJWg8a1ezZ
	 2YQArsK3NTo8XzYNx9TDjPQwkIOVhGlpV5gvktGdCaFxLkCgDKjV2mUsx1f8Pc/4J2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jxn7SsojnXA5TK+qHLQ9eCfFXNVPdhVIuJ5lM3etGbQ=;
	b=KseusQb+bZbCcM92p/EUDyto3kEf/RGSkQdlpCuPoMntnVYufiK0FjndZN/0aysEPgvE
	 XvCydYilg7+H7PthXprOfO9/ohRXZGBh6MnFWXc7hhXDT9lbkD48Ji3pJ/sGQmeOBytjC
	 fivqEANA4Kua/D4qIVcYlV+QdKUfgCKQlcehUPO/j5HaOb3yVlGGAqwqgNm2wEutcqyLq
	 ROQpZFBCEeXInU0awkEQysINq5PG+yzf9YhOBfmWeV7JyspM1n4s2Le/fJkTnEyqaHmpZ
	 AWwMAnAC45u9VO5oJdmIxRvrKMB10v5hhFZsahvPmr8HiVkSKn7oJv2bOvvmcxYNn4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XKP49g+E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TInvHWKh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8715606A6D0
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8715606A6D0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XKP49g+E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TInvHWKh
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe9VF1177678
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jxn7SsojnXA5TK+qHLQ9eCfFXNVPdhVIuJ5lM3etGbQ=; b=XKP49g+E1V3HrnjM
	OLz2cPTX2f/an3poZcEYQE8Z+1+pHpYNnk/uG9BOXs7EdPPMigtPBqdxwx6UzsVo
	ftyIOU6RPOaqISQKjkiv+QtFZirtbtzmUwSjgxAhTfNO3PAOm3M6qQrK5hLpsbn2
	0jxfdGWQlqTfaElpWOImtGOPawamcNhZxiZu468zpSNisl7NSbQd+fXRRKzsV+D8
	7f7T1ZgMsCWSUf9VQJF7jswZmu98oK76ja+aPjvB9zXSzrMHmJfvH9ehvvBiMpkA
	8iUULKI20Fu6VpuSeM73jzHpIaj0ommcULuBG8Li6IfUQi1PUBQVtcKq6P2auEFX
	ua7l5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a20nhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:37:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so46704785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793281021; x=1793885821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jxn7SsojnXA5TK+qHLQ9eCfFXNVPdhVIuJ5lM3etGbQ=;
        b=TInvHWKhQemca17g1eepV2jDyc6mKi2+PaP1hyRkXodbfXPBFlBwcxQBkQHiDYxwTT
         2ks8NAcTFbdVSe44A6Yy4r3g9A/55ozHewUBCKHgCTQCqW72SWQeEd4hFWgaFnfuIp48
         aa4sfCTQottotg+WUdg12jf/503efesCspUaQBkPYUQQX10XO2p6XQ8f9IsuMIxVW6As
         8ozT8r9nfD+aAEC/tNAnlIJMS64kITIFLKlAQMU7z3P8KAbt5uc3oTrUEIh23nP45ZIG
         q1DtItPW+iICZLaCrAzl2pjIdFLKMz59A3AkJIFvhLBZh6MRkJOmZUoCxlrELcvekt8y
         JZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281021; x=1793885821;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jxn7SsojnXA5TK+qHLQ9eCfFXNVPdhVIuJ5lM3etGbQ=;
        b=mHLVyD6Lk70Hc2Zq6J09Qva23Avc2WjWtHhl/y1SF8oaldVFiTdlMbEmTkKMVjEHxD
         UNaOwkFzzM8jbmP4Gb74QQ2bCw12Cz+/O8cFQIyiq3h2d4KIRLzoYfZS0kq1qds6Y4T0
         Q0vcRsZ5EX1OC33LiM9NYyiMTHbThufHNony97i0seGybyZnKLJ2ctE8U83GJuZaaImC
         SjgUkLvlAqQBQibXY9aZHraj1leQ5eCC6EeejmjstTBp1zad22x2FVw3nX356t/LMAC7
         k5Ng/N9EkCg9RuVeLBKVPwIQC5UShYFVAr0zkYcsC4UTOihsMHQQKp+bc5jMn+Zyibkb
         BHQA==
X-Forwarded-Encrypted: i=1; AKwUvBx8ia7oPV3D73qzZQJucSZuPpEc2WGfinFEiUf4k98x0lEnA41dUpgRxCO50apRwvDue6bP/QIvgRjMHNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2ZmpqotL/7ns8S2qbpdjNRNWDMlyHTdrDc7rNuhwmqWfbhLdN
	Zx0rsBAd2HMUEU9RpChdq/wUDXzGjRwEQTu9aRrs8s9ghEFK9FjEBTmqIdPB6xaVmqEM4TsW5Uj
	HsO3rL5aaFl7t/fV08qxUXhXSJ6Y451HIFT5gSiCA6yGfjH3GLTFRgMM+5zxW+LM17cE=
X-Gm-Gg: AYBFou2O96Z5RkJZ1bxRy5lCPkoLFD/0CPxvp1cy01zZFPT8amXLcpMxogblzNQ7+TR
	87yEYk9FeXXz1c57xy2VShLQrI8GEHNQCyepV4W49ufjdTBz9KnJMHi8S3eb3990uYTXSO/vvhh
	vULHWy2gOxYJqtKnFE2mx5aY+WDjeB/fKGwvhYH8I3w5hEZMwtXV8ZcXj7GQR7A6v27taz5Gq4r
	twt63bYB+7nlXsEG2NSKqcq4IAeSosnOIvqTXPFJcF0brsCIFwpyUnka35hVyeHaHb3QGqYWeML
	7qegEicPXHWSe19cdqKGSUnvQ2N2wPIrg7vveL5X4JCFmkq87z4pxwAdQ0u6Pj9quGhXwI2GhmX
	sMGO2ieoaa054Gp1xjF+HXsB0TjiA/qcv9mRYrkPTJClFP6hS7quExQEGdQwF0xTXx4TVac0=
X-Received: by 2002:a05:620a:a8cc:10b0:93c:61e0:81ff with SMTP id af79cd13be357-944089b232dmr755694285a.1.1793281021231;
        Thu, 29 Oct 2026 06:37:01 -0700 (PDT)
X-Received: by 2002:a05:620a:a8cc:10b0:93c:61e0:81ff with SMTP id af79cd13be357-944089b232dmr755689185a.1.1793281020725;
        Thu, 29 Oct 2026 06:37:00 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a50c434asm416606766b.5.2026.10.29.06.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 06:36:59 -0700 (PDT)
Message-ID: <5ffe4da4-b5c2-4e24-9418-1edeec777932@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:36:56 +0100
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
Subject: Re: [PATCH RFC] drm/msm: move VM_BIND op validation to Rust
To: Alice Ryhl <aliceryhl@google.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot
 <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        rust-for-linux@vger.kernel.org
References: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
 <auMWZyxtC1d_BUgN@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <auMWZyxtC1d_BUgN@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX/rbrPE8rRBOy
 NXT7FpGyarZpjbsyo5DzFskGlQmhvv+ld+6VAnf4fExdEk2kICx4NkOJ4RenribN6MZj44YAvja
 snjm0ws6dFX9UpDHf4FwMXaUjSP/mE/rQZvJ3lTuSuHtsSms/tVgAW5mhHhNtuglBY2lqN0l/sQ
 5KJJDiwzW7EUD716L7+32+GZkYKfk1FzJJ8KEtFTLWbF81A8kKmgypu0XlV/4isuklbDiSEp0CK
 rzNGP6iZWEnWajlldgMBXCwhmLGvttcYBabBY+APlIA8zgV+xf+WNQpYaGxL3ZTGvephRqwnh7S
 gslQ5HsW6kjSlrq8CFOS5pHbdeoxIhKWesKG9MX38KzR08Bv1/LZOtnwISmvNBo7v3bToK2hjDu
 Rlprh7crcx+CLvx5wwiRWU0U/i3gDSUBUxxP3e+Ci9nH1wZxLatiTwJIAynKK7TR3PZiKW3KYtB
 4TgMGoqPwCk5+W/LvBQ==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae34bfe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Y42vabP1fUe4KHNzalkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfXzYcSwJJj1c7b
 egW5Sw9+4jtGhqATrw3FdhGqN5AzqSTdyz9Fg77J5lbqjWnAQN/2fm2a91TyKmV1Ig9tGpgagTx
 nbqh1DIGxTHtza4EFDfRwcer1RZbslQ=
X-Proofpoint-ORIG-GUID: iXMZfhASWqHRumGH6NbpB0TCNAEJJ2vu
X-Proofpoint-GUID: iXMZfhASWqHRumGH6NbpB0TCNAEJJ2vu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290053

On 10/29/26 10:48 AM, Alice Ryhl wrote:
> On Mon, Oct 26, 2026 at 12:40:02PM +0100, Konrad Dybcio wrote:
>> +#[no_mangle]
> 
> If you use the #[export] macro instead, then it has the same effect
> as #[no_mangle], but it verifies at build-time that the signature
> matches what's in the header file.
> 
> See for comparison:
> drivers/gpu/drm/drm_panic_helper_qr.rs

Nice, thanks!

Konrad
