Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793892672;
	b=ElkFPzlWkItUil6zDupsjrqw5Vl0dBBK3J3JesSwfxHcKGRdf7dSLHhkRRXpQ0vghRaT
	 nh2xNZrxh28lRwy9o4NwusjyOvCeKxfSmMF/LyDDcyRHSPsgzTgVzKUiDnxpEAIuHzRnS
	 6Ized52cLKEUaIg0nHIkYtV3R5flt4iY449XZksnlmyyysFZNo/K6Dqq2i/VgGtzwLs7a
	 MsdFwKfxWrt+Wpwi4RyD1S96Q2qUob1XKDaS1huLIyrrQCABUQOf8UL0Ex4Utr4nGsIEu
	 wStMq5mlhXJPnKWxdLMMAYmxLx9wB3KqIG07Oh+b4mo2kH0ti1WGK5z8XNXHfwJxTsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892672;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UFkEAJQmmDemZrU/BtfBaBHBeF42rbbxl6o22oiQ2UU=;
	b=3I+L7vOPP+iSYu4xVEVNLUpmgixjiWPcMHy+FOjJ+2M4ImLPoD0Ombhe8KdCWcGMonjV
	 Iv0pG4Ci3zwkrsO0KriiA+4VqT3Fsj5J4+XKvg7ok2tGfVBEJYYOdiSHdLfWFjpcTJRHq
	 v+DqFYBNeJtqFr2PqHYuO4YWHSJCEvtGoMHjdbZdl6dQOA0vLfdvH5w3p0/W43Zn3K+4q
	 xc2711TVqNYxcrJRMYZNRYw/cXTP7sgulaYwlVefSfDSxa6uQeSaxbDA/ptRW7SQUDI1G
	 ZjuSEcS2NcQ49VyCZFSJ2eZPh2eVBtNLQf0zz4FfjyqJybpRTyf6KRaTr1k1VOav2bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YpCZaSlC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZwvWvif;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B625606EE83
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B625606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YpCZaSlC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZwvWvif
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQRm43645462
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFkEAJQmmDemZrU/BtfBaBHBeF42rbbxl6o22oiQ2UU=; b=YpCZaSlC/SvbpXoj
	vaboNeLLY7SdEf4bOTRfvamRZuigFq3U+/Nxx1QeAIcAJThM2ZYkET5hrzc8pD1X
	oBfhAh28sQUJJ2LQOD6VpslRnfNbeGX6OojCu+RNYCyhd1EaFq40FG6NEfiVVgZ2
	I5C8epDQ31Mc4vFcAT2tPqpaiJIZoI8UO5mIR85e0Ww7BVILrWrQv4Kg/RXNrnTa
	iB+K7OEROkw9wzkZ+f2p2vhp/YObYBbP/5IQwpe8xqBIxbZjE/guDyGA3NfERPKc
	w72qhZ52W1j5muVx5ng9UqI6+qDwCOItEude4va0nyKepZ42K2Kht70wQUSWhpC5
	9YOWuA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkds4vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:31:10 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0f1c06332so27986097b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:31:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793892669; cv=none;
        d=google.com; s=arc-20260327;
        b=hGHQureGjvMo/zKr+5FDlG6XgdnlKuj/ak2nRpAvAUJSjvHJzPcTzXUpGTTDF/L/wN
         gaSnBG/15B1c+nnyRjxcEF8a/6VFH4/n+Y1mO1tyMocWUZg1atK6YgcmCr/BmF1QVq8s
         cXwYIWwOsaM70efQ1EbH3NEFzY3sL7QteKJXRoaE8/cH80vgPuL+7FqE5ksvmwP86rkk
         BW9l9NIKK2Jim2v4sodsCVaYYDDwhtdUczPLLpsb35qkNN8+B/TLdUbPoPwTYiBRMqGx
         ATvC6AzVv2ObGLZ7Do6d/gwubjIEe7Oj7ieGc3hM/PKBVP5bAnK7nGy40KLrh8RIh6qN
         c3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UFkEAJQmmDemZrU/BtfBaBHBeF42rbbxl6o22oiQ2UU=;
        fh=IrYGnvB7AiUO5fLRfQ8AH0Mozm9pHdUsrg8VbOM7Nqw=;
        b=PtsqM3VwO+KwolTQHPz2JyHequ0GgwBitXfq7/Bu+fe1V5Rs5fd6qw/uhkQkJT+rX2
         lGomiRNSFEJdm21YrwJlhAEg1cqn0cgdCebkM7pcWP84Qefu4bf8y3MfuJPTwUh1mdKL
         fQp17cY55YENP7oftC13m9On4aFBVGzRHqXbeWaKKSErwSo+NjtdGiuQTZhRbIqSjAoA
         DUb4Rhm9wj4gocWqCZu7QlTmVm6RGD4izmhSuIHGAoNxv9DgwEoolPYMBlmtEfLh4BjM
         HOy7QLj4UUSPtHrzCO6mLdJ+r6XE5NPuhOg+0o4/Ldg5x2aMcd5z/WFjaQNLrd/9jWPg
         BRNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793892669; x=1794497469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UFkEAJQmmDemZrU/BtfBaBHBeF42rbbxl6o22oiQ2UU=;
        b=bZwvWvifWrjOItBOf4C6MnUYBC/rGmogRk+8GLqk6k0Ua7XqNictgxXHHuhugIYSvm
         mYpVi6dAeZ9FpsNLTiVpZLoQ0jRGZLfdLlLErmTrlZmlN3V5QkqQWO0v6AKuOSLihG1v
         X9VpVyFr7xqNx8hELUnVa6djJbcZgn4dmxYZZifGfqyrOytWV9qfADofHtIi5SwSiIyW
         QbLvIMrpVL1j3Zwqd25B+yImTyXYwnCYr2f4Up1hT7QAeAW0N87ejeKzw2IjsHtngaGs
         q1aUHVfIDPJ0m5cGaPKdjpC2PJOT6QY0M7nFFUgMvfF9eh2Nrk4pltVQU6SJRBSaSk1Z
         9nXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892669; x=1794497469;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFkEAJQmmDemZrU/BtfBaBHBeF42rbbxl6o22oiQ2UU=;
        b=Y8KJybX/H7f/3649u4Mcl7702hsmLXko13Ce+2cQVAC010cMGuwSPaIF5fK14QpZXJ
         z3vjGHbbw6PrPmjupzPb86sDYeJMkqZYHshE/TC10vWWbQG4GR8/aToCmEDRxL+Pw53s
         TRtrB4rHpB9KzsrcH1tG+cwFjaAQwIL/8U5gS6T94J7VmV5xROd3zV6HTOX7lq5azEB/
         MTmZXX0rUlauE6SORm8b4YZlL6IIrg5pHaPy56QPIGhpLolu3St+1Z9TlLqntX/dmudJ
         +jKWLGFvBgZ64tlFE9jADUZKyXGE7LUvjPNJoPr8tN7b1Te7h+h6G12cqNgiLbUjUbU/
         W4hA==
X-Forwarded-Encrypted: i=1; AKwUvBxv6oXLqqzVb9z0aMbg4XQWT0r/4Sy7nKT7LSJsMgx3DA1R7HyuY/tomhCjjnsP9CEUTlgaNIHOTe3xWxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TNk51CMLoLZtgB47hH+V2bwSJO0njfHErzeHrNMCarFm2Tdhu
	g0k5KV7DjWjpBYAPdAur/NhQtFWKl/SM5MH5dOkFgs2W1HxNRlv1TRD8Ted6kZDSKWJMQXUoelz
	0zTWliXk/6ZYm0HbrsWjcWN8vBFC0vnjYhk2yYN27zsD3lY03w7YqBaYpbT09Yc66JtGMbMf3EZ
	fyeQXDxWsmnzpJjxhWSNfbZe+YMWbCQkGFkMMhlNWzqQ==
X-Gm-Gg: AYBFou1pxL5cHfuGKlWrCZwNDIt3HNXAJ/HZoKVp7HYDABH9/ZygeCOa8gKjjyLXD75
	EXDZFnPHtCQB2yrg/CaFMxuowAG4LvsGsJsSHEC9jNMCb6obX+Q3Xmx0w97Ogabl8nofwtIcH1y
	oKDEXjRbhlgFfSGPMiB3En/KR/w/A8UIZcHl1xP4xTGzYc673xEYsoolvOYHbkryCzON20NWNFN
	1SXFJ3J6MIaVxqSutSGX/y1QsEuKToxsGlb6B1C
X-Received: by 2002:a05:690e:1207:b0:66d:112b:769 with SMTP id 956f58d0204a3-67ba4c87f73mr12304246d50.1.1793892668606;
        Thu, 05 Nov 2026 07:31:08 -0800 (PST)
X-Received: by 2002:a05:690e:1207:b0:66d:112b:769 with SMTP id
 956f58d0204a3-67ba4c87f73mr12304223d50.1.1793892667556; Thu, 05 Nov 2026
 07:31:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260730062219.2836938-1-sammiee5311@gmail.com>
 <CAGgiveUc+TkGyGDxuuCLpHO=i22-4fn1CqjqnnmWLdWWYOZfPA@mail.gmail.com> <6f2f8357-59ef-491b-95f2-d58feb362ba7@oss.qualcomm.com>
In-Reply-To: <6f2f8357-59ef-491b-95f2-d58feb362ba7@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:30:55 +0100
X-Gm-Features: AclHuK9ffumAB6FDO6iM-oNWXrLUTKEfi4aPTOqEms-G-2LHrNHJadYMbOC2DNQ
Message-ID: <CAGgiveXBc55WKnKiZwPvxZqFe1uHh6dFwSPwMRbFhG9yEFHwbg@mail.gmail.com>
Subject: Re: [PATCH] tee: qcomtee: user: check the parameter count from the supplicant
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: HyeongJun An <sammiee5311@gmail.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aeca13e cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=RNNYRmto68J4RoQH_uQA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: jm94Vm4h2jb0scw-tO1uT-o6kFXf0uxc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX3d+jGGEdmD6C
 8p0MHRNrzKcyEs1LuQTP3qeGeyOaZe3o6jqNTh9XTEnfgwZASMp2KsL5reIJ1f3o88U/iWsbbAC
 4irhilG+cQ+eo3N81+XuB2LK89opiNU=
X-Proofpoint-GUID: jm94Vm4h2jb0scw-tO1uT-o6kFXf0uxc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MSBTYWx0ZWRfX1ELmSdBOlHlr
 6yBA0SxfobLJltaenBFUFf9un0FJtCmkUZOsEJknVTDyUPSSm+cXLS9QMpqOVBDSPHkpayMtkEz
 es0saDYPcpMQ8YWgzmbGrHZDrfLLh4J2xt6CbjODfg11etlXeyynMt/jE9WHSTqh2xydah44vDp
 hjMOLqXVi8GXDJ4wJwxvQ1N0CrqLfjvJkKYIkA6wnvHRYseCWoqgdG7ABRAVzdtNOWvzqIlosxY
 /RCccIKD9UEjaplgNTjDmdjgO/hbgEbypt1zXcNKqOvyfwJbQiz7k1sEtzuAeIJ/fnO0OvFbIlh
 rFbyHzjtWYFovo/b0Qojt0WjU4LrdxKNXgSlvgHwtEMi6w7rhcrdXDe0cV7A9O6p/ZEivaWMTEL
 oZLJn3IlIBgRcQSJGkB/SyixaFevyAKAhzWpRPt5my6eM4ytyPWkkOfZwght5Ynv1uz1mv+FnS7
 ETyVcyLYniPIWIWkRRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050061

On Wed, Nov 4, 2026 at 8:37=E2=80=AFPM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi Jens,
>
> On 11/4/2026 4:58 AM, Jens Wiklander wrote:
> > Hi,
> >
> > On Wed, Aug 5, 2026 at 11:23=E2=80=AFAM HyeongJun An <sammiee5311@gmail=
.com> wrote:
> >>
> >> The qcomtee_cb_params_to_args() walks the argument array QTEE asked fo=
r and
> >> indexes the parameter array the supplicant supplied, but it never look=
s at
> >> num_params. A supplicant that answers TEE_IOC_SUPPL_SEND with fewer
> >> parameters than the request needs makes that walk read past the end of=
 the
> >> allocation.
> >>
> >> To fix this, reject a response that is too short, the way ureq_select(=
)
> >> already does for the receive direction.
> >>
> >> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> >> Assisted-by: Claude:claude-opus-5
> >> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> >> ---
> >>  drivers/tee/qcomtee/user_obj.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/tee/qcomtee/user_obj.c b/drivers/tee/qcomtee/user=
_obj.c
> >> index 10452fcc7ccb..2a594ae299da 100644
> >> --- a/drivers/tee/qcomtee/user_obj.c
> >> +++ b/drivers/tee/qcomtee/user_obj.c
> >> @@ -507,6 +507,10 @@ static int qcomtee_cb_params_to_args(struct qcomt=
ee_arg *u,
> >>  {
> >>         int i;
> >>
> >> +       /* Supplicant can not send fewer parameters than requested. */
> >> +       if (num_params < qcomtee_args_len(u))
> >> +               return -EINVAL;
> >> +
> >>         qcomtee_arg_for_each(i, u) {
> >>                 switch (u[i].type) {
> >>                 case QCOMTEE_ARG_TYPE_IB:
> >> --
> >> 2.43.0
> >>
> >
> > Looks good. Amir, do you agree?
>
> Yes. It's correct. The check is missing.
>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

I'm picking this up and dropping the Assisted-by tag since we don't
use that anymore.

Cheers,
Jens
