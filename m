Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028644;
	b=mquBKy//IaroTmZTrDLBQoG3B9Hz6ZaF9O55x4ABQB5vspNkAa7SzK9vpe/yOIOkADg4
	 gCAoXu4G5DddwHZ3kxJF92mieFVdEkeQ3scUhVVFFC3w6aaSaTpj+qGwlVJMQdCojToxK
	 EDO2W+hkVy244BTUdRbRMMlZQ7Z9LLtqQJQJzdmGw34k/vQr22ZgebtagzgUUG7z9uGsN
	 Fts6ye4kU515GUz9UFThIcEHNU+sxCw2l/xnrcWBLm5HL26XdaCi0B3G8c1gIyBfNh9A9
	 BHMbbTodTswhSeRzzXOxQtVfu+kFFxV0SegyQ5/9FhbVBJJ+iccO3U3Ze6IC3u5Ni7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028644;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aNEN/0vWce/15eUz14WckhE2l2ohDRpHNcQP7Q+mdfo=;
	b=fRGaE3j++fUsqw//wS+uQQM5M6TIVlCET0L9LM2+xTW8tTLEmHa2r2oPAZ7IIDJV/J2G
	 idfmWV0yHOByjCVzjs8WV9fbAjkMWWE/KftfxDwY2bTwf6JqfikugRfDkjvoeUaKIlFWI
	 IFVNP8F2N/iRsIRTfYEbdjawlImaoEYmm74bUR9ggmNa75kDqFVI4LJEo+2Pr/GOwl71N
	 BmQY3owPdJY4ioEDvgs/Z+y4rzYXZ00boHPCIt5gheMiDH9XpWerF5nYzOZDCYC6GlVws
	 h/CfboCvX48OVR6ZdRisl8zcBJV+Bmt8TBIFZ3SAux3BSaZfHjelZ8EYXuhV12BwwpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eSpW+L2W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YSQSmC1/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851AA606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 851AA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eSpW+L2W;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YSQSmC1/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvxwS2707794
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aNEN/0vWce/15eUz14WckhE2l2ohDRpHNcQP7Q+mdfo=; b=eSpW+L2W+Csp5WUY
	GvxBySkIFVAQMZDJu9L5LzxKEJW4zA6tUbyUJ30PNCJh7eFycvg5q4yjUoI/K74O
	s4bnSEYpe809dALsn3T5v/PlZsUrCJOZI+O5/CsnItZZOQvcOims7eMpT6O780dA
	oEWEFAxUo1ftvTTDWDHldVpRFns1GAIp0xuChWsQRFPVuHSZtqegzef0LKDxlFFM
	uwWWjUr7Ar0+hnxUJCQQmCTC/bbaBBqIcZyp/7HnJM4qYnKAF2Bo7bDiyjbSW9HC
	lMNG/NVva6MDU83MQbjG8IJpZmu2Za7iKWE8WTOC072qK2y4eF2x1rlhkHkVdSni
	kkm0Qg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u61fap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:30:42 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5caeeb345c7so57707e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793028642; x=1793633442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNEN/0vWce/15eUz14WckhE2l2ohDRpHNcQP7Q+mdfo=;
        b=YSQSmC1/aVZEr0mLJLTjKEGRXHvlRpLLlLDUzycoVCnchazAiHIYLdJvIjKX+D5PXh
         Tk+bFGdE5eNm3XbfmKLeE79hIPkPCKeSjhlG7Ikg1J4qI6k2fhCDYfNI/RDZV3WteawM
         hltETlPiaUmbQJvf0B6LT+y5p7XBzr5k3wckh4i8NduNfQqkLPGo46mrRbC6GuBD0YBG
         8Y4bOAa/nnb73w6CTSXM+s2hWlS71V2lM1l5q26lTqnMmzLGYR+6cd5+TPtlkhlLZcnI
         ErLAFpa+ine96EwdxNRRrQY3HEeT/68R29o54kDHuJ+t/iwng8YpIIFU/w+qEP4Ithie
         ITuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028642; x=1793633442;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNEN/0vWce/15eUz14WckhE2l2ohDRpHNcQP7Q+mdfo=;
        b=Cjb9u2EOfwpBxbPl+216yPmHf6s66jXzwxxKVNID6dxxYB38ZAa1iX61aJXB3MsgCT
         PsKpcVpMYtGYXnuEZFPKOVkwRf4s0q8mNTqWJDn8YeDdTka3DtmNaAiVeVOFUlgyiSHd
         AwoOIjvTZKA/zuZNIZx3nWHjJrafgS2+kFPN83VqiPL+ZChuQihJTNRDQNHu6O/CwO9p
         1s4uBCOpd3cWFNntl0YXuBK7ce+s4QymG2hMEnRbn4A6FsrANlZZbBQ1pCrnGXuGm6/F
         toEu+VUodjNMbO3+G77kvpGYX1z7iDyCtoW8JpkoFCVigL2A7TMlI77onpDyb52X5TW5
         9uRA==
X-Forwarded-Encrypted: i=1; AKwUvBxX46Z/STgt83U/D6UTI/9BgCGhB1Or9uLrkU6b7mR/tNQOx8YA9kaIRbJdNhugvZBlg5Dzh60LTFg1e+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKM7DKYNexaPIeTkyGvh2p5pwW55R0JT7EXOOzWVL98Wvesy9Om
	7k8X0kzGdvJCJ3qQp1vSgapM3vFRT8ihB1WyeVKmWatMjesIKsOEoDUAcL/8hWep/4smhdjOcpi
	bi2XpeGGgub1MfXUBlykdCFkoFrL6pijTkSDKYiVJwrvf10JUD27CUOeIzdLHOw7QBXs=
X-Gm-Gg: AYBFou1+PV1EEKdBFJ7Nb682nFPZ7SHNLrzwPzbCHvAdeVu9Tdt+1o/oGTDwT5cabPi
	V9+VPQ4EJVGM/H33Wqv+2Bbzz2q3RRZ8FJ4IoTneAfcZgTakpeeu+acY6mjvl3FwkWzW1j9DEsS
	kLdpbT2guxtAeH1YoJjZGyjYD+HhFMpN3AVv9sR3ZOc7k5VCPkOUUt+gKzYwzohKP22PnJbfeTB
	AfVx2GjKocSS8VoAoq9gP9WoB9Go2qxo7l5WoV4ZxLUTAbqoezSx+NvgntYQTdHjWsFd9JMOefA
	7f/AMsH2DqepgGlha94YHGVC9Q92ZPFJ+ZJ8sBkWIgadVRhUeatzz7YRTY+7VnRVRGwaKUhS0WS
	61ynQZIQ=
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr2249016e0c.5.1793028641676;
        Mon, 26 Oct 2026 08:30:41 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr2248969e0c.5.1793028641198;
        Mon, 26 Oct 2026 08:30:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd79eb05sm333500666b.79.2026.10.26.08.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:30:40 -0700 (PDT)
Message-ID: <a5667943-3c3a-4bcd-99f4-fe5e487cb6c5@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:30:36 +0100
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
To: rob.clark@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot
 <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        rust-for-linux@vger.kernel.org
References: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
 <CACSVV03M_MzamPN5X=+bmbqOkET2QOJk8O_vQyhnjDGbSTvN2g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV03M_MzamPN5X=+bmbqOkET2QOJk8O_vQyhnjDGbSTvN2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4hg4QXFUJxc79GyqZMeR2I41r6OhGv69
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX2k2a+AAKS7NU
 3N0HGwxPZ0cGLR5cAJx91Gobq+eKuPwTMaBc7YWWTLIRYcf1VmuIf5UOEDQ96yKoLnjn+ij9nz4
 L894RMMjIoVKBaUcK2p4GKEFp4L/rsIEC9fwN3OB1m5BpGWDMxS/EUqiBsqUe10ynNb8Pg/Ru/5
 pI9aSU/o6dYSOMVYfs9GmyyURX/44baNDkKC4WCvXrGSN+f9x2UmNf5B8YIDzi2o3+aJRf+HJbb
 Aro2sm9iRUtmQ6lWk65jVgmoRY7avhqOYPYb22Um0BxeC1g1PyjpShUIMydWdl1M6/RmSHratAU
 gRGdQ7mqRdaI4DsQfpcSCwnHhwvO6obTh6l+SWox5l58OlofGrNuoD+5CbjrWnhbfFvSOESTPJJ
 z0ngqpejLJ57TpWqXwCWYB/DeJc4KR17DXJVjtjVp8Hg/qTbJK/DSsj8T+lq+0kpVikoLZ1o4NS
 tH10a6n8CV432VjMEzg==
X-Proofpoint-ORIG-GUID: 4hg4QXFUJxc79GyqZMeR2I41r6OhGv69
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf7222 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=obMtVcPMbQgr-G-mzi0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX+XRiL3K02mlp
 te6jycK6izrGHkXpi7V1x04QupDB+W3qD/cd8ka+7B641+0WwVI0TrVlvJL05LlYJJCHCqUiPSb
 xMhx/sAUtUfK6uaOi5JuY/oUBNwI1xs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260061

On 10/26/26 4:26 PM, Rob Clark wrote:
> On Mon, Oct 26, 2026 at 4:40 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Much of the VM handling code is a headache to read and maintain.
>> There's a soup of mixed-signedness/size types which need to be compared
>> and added and getting that wrong in C is very easy.
>>
>> The "(range + obj_offset) > obj->size" check could wrap for a large
>> obj_offset, which let an out-of-range map be accepted and then mapped
>> as nothing. Oxidize it and use checked_add() to fix that.
>>
>> This commit is a "get the foot in the door" type change to make sure
>> that folks building kernels for Qualcomm SoCs have their Rust setup
>> ready. It may/should be extended to the wider mm code once the
>> appropriate abstractions are finalized.
>>
>> Worth noting, the C UERR() macro expands to dev_dbg() and the Rust
>> implementation for that currently doesn't support dynamic_debug.
>>
>> The DRM_BRIDGE dependency is dropped because including RUST exposed
>> some spaghetti dependencies ending at DEBUGFS and it's enabled anyway.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>> (if this is rejected we may just patch the C code).
>>
>> Notably, this will regress some ancient configurations:
>> -- arch/arm/Kconfig
>>     select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
> 
> Side note, I'm ok w/ drm/msm (or at least the gpu part) depending on
> CPU_LITTLE_ENDIAN.  The combination of BE CPU and LE GPU would be a
> mess.  I'll actively ignore bug reports, patches, etc related to BE.
> So please, no BE!

arm64 is free of it now!

134b0fbc5c24 ("arm64: Kbuild: Remove vestigial big-endian support")

Konrad
