Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793261715;
	b=hG4UQ38TiEEIWF8RcOvNWxdALCdwgo+N1V2RRUGykcJbz1ugGI8OuUfw5hUmRRj8SFD3
	 3DHmB/F8oqQWkziFo9LgaNgdjpwDPioQ85hVEoY/3hE5bi7dcV6NfxwKyutf/ZzT/Jwt3
	 cr+PiXGFT+MY/8rITJx8mIbpHOjGknN86WhPef8+h6OkElbveoOMKz89bCKZzt6xzS2i9
	 QB1eiy+jJvVhlOff8bh8LF4fqNkQorC2AZmmysqfhvIS31h5rd5zVudF2e5EgKiypclvS
	 Wi5iTLmJgPBjHvLhRuTFqLlZnhvOfaDAFELnhlaRxsTioQfOnBpL/2qlItsaoOG+B6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:User-Agent:X-Original-From:References:Mime-Version:
	 In-Reply-To:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=msFGCktevQa+phvCxwZ5TloB/VJ6CyygSDWLYKumkSA=;
	b=DcIj6OhruoA4wv8PkSkpHW22yYI4a8xLVXiCYAYJ1aRDAezzBZG/A81Qo41CW+lLIwO4
	 3BNM+f+VOKVEPsPPNVzp4SagiEi7+zvd+yqo0rvttFtCm8JR7nUBCfyWgSfMF+nJpesLH
	 HmEd1zyGSj3GxT1/eYPo4rUWeBug4QqHrf7AF3Yrto0iTTjxaedRg2mJLoM6W2Fb4IKyX
	 NXUaHE7YhaE5xTTauHsMAmv9wZv3yCxRg2caFSsws179Dis9dtz1zH/8QbCFzyoRQRs+S
	 nJrNLWQpgyjo1iqqoxIsA+AgkEZqhbqkxBcmhBpEJ+RvMkP4LdN3GCPi++2edfRD8Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RFI4zuaC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AE0606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01AE0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RFI4zuaC
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e60f9af6e6so15185935ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793261714; cv=none;
        d=google.com; s=arc-20260327;
        b=K80Pjco2ETtURnc2b8aeLmRxN8TOMk7R6Q108pxEMxxFnRxizCNIHVfiBc+fiYMvdw
         iMy1jgCOTIT6+LRH2c09jFLobw/8Z+uo4QGFJ3r96fcspGX9YXxD0ysh4rCgYygVvUQl
         pIDTqX2K7KP7ekshUeE0wB164i+q57F4r+RLH3IRuDmNCMZrkaHkUECYMuEDHP51A7V5
         ijHT5vXi0F3ODp8c2lew/Dmb5tTklEizxvPj0acE/uwVSHNHkpPwxn0RAQQxChm0sYLr
         ++y76NqPkl+NkFhGDY4ycwC2Z2if8O4pLoF/CzMrjt9YG6zgceOWrHJy4wGb5PfN2Ddo
         ZWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :user-agent:from:dkim-signature;
        bh=msFGCktevQa+phvCxwZ5TloB/VJ6CyygSDWLYKumkSA=;
        fh=xX42Ke1C/n0esexO62u4fVfz1iWnxJw+3TDxhKnLoBs=;
        b=GxYxjANpAS70ufToPvrh1ynHMLUKr8aHo2MGKuTBPICHsIjz4tgsijyaBq2CoTkAi+
         tMkM4+khs77KYw2cvzPPwXOBbu8hH0G1AlUmrI0cU54ziIxqXeKFDZiHcdwnioYqrlzy
         Z1ZYICyI9vlL2zZPPyaqdjgNiL0xFZVg9naB5PzL6vy6xZ3xYMr06r36YspXdA291F27
         k7lePda2k12yGn9LmwbXJdRTZIOM+UNS2FRDJsKmfu2qr6tOUoyVbpDWvIVM3pybxIPS
         GaqpOGsgOEUpxN8bt8Hx5e1w3EaTIp9eK1HaGuCjL1bkqEfNn1YozAryAxYYU5ICUmq5
         nMjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793261714; x=1793866514; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :references:user-agent:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=msFGCktevQa+phvCxwZ5TloB/VJ6CyygSDWLYKumkSA=;
        b=RFI4zuaCnjf0fN5tmtBIH0lhUxmF5UpTQqI0bfI2MJ62zdrjSQoUtfKJemeQNxuLMT
         NN9a/1T+6gwPT42Q2S0zE5NokPyuA/PXaghdfrs2kAawogxGcm3jZekQYMkRO4pA4gq/
         DUPJb+yu+jrfBPnSQlr19DYYvE73xW5bleANLI/WN25oQzFOCPbkJURptYuxPecPkOgb
         9+XQUwYi6ZOwVgPgHs26aeQSPy2FvOkwQdVoAzd7U7w5BU9vTnox/GApfw1Ube3nSUJt
         kTBY7z68hwvB8/OV2Thb8A4WM7AVMQCFW7CL+jJRC42ITMx78QZ2rRMGEy4uF6S35MZm
         7rAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261714; x=1793866514;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :references:user-agent:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=msFGCktevQa+phvCxwZ5TloB/VJ6CyygSDWLYKumkSA=;
        b=LlwWjcs9K/RrMtcet5cfXXKgqIGNRAw7e6nGGZzvmvqKH0qvFk/YUScjFs97ryfaH8
         xHrRc3LYr+7zhrPanVCLGMS5ogTicvV0IUrGsloFd/zHKp0M5kKjCqHslxzbxuYZTw/V
         tgXa9qjnmtI0b4Pi/1wKBBWJzapGjnGyXW/7vg1Y1o3CCYFrvH1NvwtF4aAn+/u6oaDP
         R0EpKtTjeynC0AZlOMNhSVlCu9VXEeYzSU33394oMVTzl0o2KK9fbvvVgCcRX1QdSnXZ
         s26yUmcT/PyjugOg0OEn6D4JhulnzKHvRhSOYUukGqLHsTLZgrEluaYTgUPYsAvWM2FX
         J2Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxfWMWXKUkWbINsY5w82t5gqhW6UBR4kLolahG46GMVBVvCY/gjzgcjgJdTyL/XJ8PPbYX/68d916hPfMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9bTeCUI1uTO0sbJFW8rdFOqxUD03u7MxUHcbzni9I56TMNeVX
	4NC8aRTGH8Wi1+yqypyGQe8D3loeKLxKchrSnapmvMM8csnIWY3BFoWEeipIeXnqE0Tonzu3vwx
	RgqEHzYKK8C5pcHSKICE6k/6jT1du1dMb28Id9wJzAQ==
X-Gm-Gg: AYBFou3YZ1ss6TVLgIvBDS59zj6UdGLUb0RhPzyHh75B1GKt9UgYGngva5yCDFfxOnh
	fk3OesYArU3LWktRKAhmNwfZ2r1YBbgI4lRY+3Kk5WxCI8tMSP4T0aYnvl2dyjDyfcFAsA0JcsW
	BrwkXG00Z/+vVS4XSiuxTXowzPhKH4vq0jVWQ8ZRPeN8we5gSilVJSL1/wpwDVWm01EZqWBpVDd
	hT3APVAMDvQ4f+l+egVpEe3tDfSo5jmxDezCObeVau321Zxu1OTOyNcMGOzIJDv1GzPZqphDuwa
	4y85ORVqidzBVpzzYrUybNDEc1nPDMtJfAQDVXbyq8c3gHuKT5s1FZNZLVvChC1BWTAIJSjls2m
	8wgKtOw9ujLuFa4cnnp5treqA8NmHXXTQX4Yq2KWDonmCfoSZ9/VHPBYcBw==
X-Received: by 2002:a17:90b:1644:b0:3ac:bc3d:6fe5 with SMTP id
 98e67ed59e1d1-3ae57df3d9cmr3792452a91.7.1793261714053; Thu, 29 Oct 2026
 01:15:14 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 01:15:09 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 01:15:09 -0700
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
 <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
 <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
 <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
 <CAAhSdy3WVmzEkG4fgTuXENcys_cWX8h6Hag_fYSkyOdu++iBBQ@mail.gmail.com> <auLxHK4g-_MvFyrp@hu-himchau-blr.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <auLxHK4g-_MvFyrp@hu-himchau-blr.qualcomm.com>
Date: Thu, 29 Oct 2026 01:15:09 -0700
X-Gm-Features: AclHuK_f9UmrKyQEn9kevLn5RZ0DxR6jXXwQ6CxrknwZt6gPcFhXWT1BqyQH4Dk
Message-ID: <CACnXVndTuZd8jyVG0=KEq1WicQ4iCA22_TkOnSMyrtbTD+ybWA@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Paul Walmsley <pjw@kernel.org>, Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Yuanzhu <yuanzhu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"

Hi Himanshu, Paul,

On 10/29/26 3:09 PM, Himanshu Chauhan wrote:
> On Thu, Oct 29, 2026 at 11:32:36AM +0530, Anup Patel wrote:
>>>>> [...]
>>>>> Paul, please hold off on taking this version into for-next until
>>>>> these fixes are included. The rebase and PMU testing are useful, but
>>>>> there are still outstanding correctness issues.
>>>>>
>>>>> I will consolidate the changes and post v12 against riscv/for-next,
>>>>> with an updated changelog and validation results. Let's coordinate
>>>>> the next posting to keep everything together.
>>>>>
>>>>> Thanks,
>>>>> Zhanpeng
>>>>>
>>>>> [1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/
>>>>
>>>> Regards,
>>>> Anup
>>>
>>> I'll post a focused v12 before this weekend with the immediate
>>> correctness fixes. Further improvements can follow separately.
>>
>> Linux-7.4 merge window closes end-of this week so your v12
>> will be too late for it hence I suggest sending incremental fixes
>> separately.
>>
>
> Hi Zhanpeng,
>
> I agree with Anup. IMO, SSE as a feature is ready. It will be easier
> for you and for me if the patches are merged. It has become a pain to
> send revised RAS patches because of the dependency.The issue that I
> identified can be sent incrementally in coming weeks.
>
> I would request Paul to pick up the SSE patches now.
>
> Regards
> Himanshu

SSE v12[1] is ready with the correctness fixes discussed on the v10 threads.

Himanshu, I checked your posted RAS v5 series against v12: all nine
patches apply cleanly without modification. V12 uses the same
riscv/for-next base as v11, so switching the dependency requires no
changes to your patches.

Paul, please pick up v12 rather than v11 so these fixes are included
from the start.

Thanks,
Zhanpeng

[1]
https://lore.kernel.org/linux-riscv/20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com/
