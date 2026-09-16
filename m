Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE00D378D8A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571577; cv=none; b=e0kAk6mH9OlfaVREpSE24Ia5zZW4bcGlG8LWrmmr66VlmCtyIEmMiT5550hny4L/vTZRjFlfQFCFw8Hr4RF/jwTYoJAMWqEo2uSwmzfFJ3z1FWYKM9Y+Y17D+HHqZqRlku99lF78gTB2LjXe2KRJfi6e8aFG7gtt90lkxx6B1RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571577; c=relaxed/simple;
	bh=NiyXCBgsYQLbIjno9HOYcORcmeh+vcq7qFmr7RtjHrY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=AFRqqrPxkoDGGNEPcbRS4obVmUYFGRHkS1LBP9b7sOA7xAdg0OsyRe+VPNyTF/p76aUdJEUIC31qIJzLfHzU9zMPLpHbD6hLy3xBV6Ds4Ro35ByOzb6STwKH+R2kxn48fooY0H/cgFGs3MDRKm+6Jstq8oOolaJwqp+DDuJSuJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3qa5dIG; arc=none smtp.client-ip=74.125.225.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3qa5dIG"
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-482dd2e92ebso1279096f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789571574; x=1790176374; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NiyXCBgsYQLbIjno9HOYcORcmeh+vcq7qFmr7RtjHrY=;
        b=f3qa5dIGbc8xMB3VXAzEUz3vGgsHzYmavGab7N0JDWcSFTiel2BuBhFinS4lwqwNXO
         IbR/MpM/hRtAnexWlUfuXd//TVi4ZdXuVJxz1vxqq0g3GBWPikTc3qoK3fqO+8GkuSDf
         jDIBZH07zVvdtYcRi4ECzAlJz97/mNnLbspg2kqSSl+dGwUH/sDvaKZqjMxiu1bPpdyT
         v9RmH76ZorERdlx0TU0icekJt/67mw7QsnuV0pmv1ejA0e/niHHCEurG/t+TDDp7MGd0
         EKXEEXcMXghVZsWUBI28g6nORtZ+y6S3LfHCKzr4OcZet3Wtl8UgljEFXW1Tr+Zjs0Ul
         FW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571574; x=1790176374;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiyXCBgsYQLbIjno9HOYcORcmeh+vcq7qFmr7RtjHrY=;
        b=asGNjMSzpuV3chDCzpvFAGpb6eQ7yu8B2wud0XDPd6p8xqXqkSKSO9JpQP4uTShLp3
         Vaqi+/48iiRCBqkLqB7+/YehwEj/ePcqo3hZsnIsmfTSljiVTUO+gFLuO82PsRlJcW2f
         GgWml46bbDWXqX2bb68xjzpKGq2ACs5Pavm/p+zVmSNKEwSKmKSO4768xethwRW+ROQH
         UDKwn1xvfsfNH5EjyBx5bEwqmC0QP2/07ZfeRUyMxVCFpWeeRKbv4DGCxOWWs0F8VmU1
         8VGh7GF7G1YA7Wb73HheT0jG+4vJQgQO0WW2A4Rzneq6Z+AuFfq+vQUlu5fuXy6X8R/p
         XkLw==
X-Forwarded-Encrypted: i=1; AKwUvBzPsrQCzFeeWjP4peE7kqOTngzCuwXR2AamDHnX96UN93CZUo4V24fvk5dSQKaY7E2G5R4aht3S9xAvQZc=@vger.kernel.org
X-Gm-Message-State: AFuF++kNz1QTw+um6UoCiJGsJOHlVCmlCk/9e4IGYrFll/n/s1HbyMCb
	WD0ZXZ7ggK/76ELFLDpBWINpxT1XwPHuPd4CLEMmF3g9cqiXXLSJnUPA
X-Gm-Gg: AYBFou0nADLvCKxCResMYTEgYqRdbyqi/3WOKFA55sz/o0kJmIX2dRbX9+P3nlmivrm
	iuLZcwG/bYcQ4voRlZshZvLxbTHMo5FlXcfmx2wbUxyCYwB7sPqrFkKya8GW7/7MS/WZDpRGefN
	kryLg/Xm4Sm2pgqHeG+xw+mC7J/Ich5qyO97sVya8HZ2tTsdNHIf1seW10x5ohA3Dsqw/XcBWSu
	Jl/WB2K9lPLBDljymEb5M38rxkQIevo0O9EJpPEm21mqZpWMWsDxKtJItfNMVKWPT70T1RYHwSY
	cydfDs7EWz15bB0z1ySO6PHuiviml7dITJfAHILPi2qH2FYUo3iqX3x9RUPYVvYD34Xdou23M4U
	2/LH1b17s+zwRCExlX2+Ahp8kkn/y6q/pCWTTHJ+J5oMQQtUPICSvh1C7gAgNmalrdQpKKs4JFL
	07BNYA5+X9H+n9+6+8HVfx12NM/pGmXX8Ar+fkyIvJ3vIleLxl1nYGP07e/sj0I30SIcw2MJgrO
	/D0p7/ss2h2f844pczrnPx/cMIiZ4EchQFIRIZ1jn2lGgvPcMsnXbMx7KxrhJug/sm2SxtEji/E
	A11ahqJw6PW8kJAHJyIDdox8gf/Y0sB6WJ5Row==
X-Received: by 2002:a05:6000:468b:b0:487:afe:c154 with SMTP id ffacd0b85a97d-4870d03e721mr2779653f8f.40.1789571573885;
        Wed, 16 Sep 2026 08:12:53 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27a41sm7320342f8f.18.2026.09.16.08.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:12:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 17:12:52 +0200
Message-Id: <DLGU6EUUD8HP.3SFNWRU1728IJ@gmail.com>
Cc: "Roman Gushchin" <roman.gushchin@linux.dev>, "JP Kobryn"
 <inwardvessel@gmail.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 "Barry Song" <baohua@kernel.org>, "Geliang Tang" <geliang@kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>, "Hui Zhu"
 <zhuhui@kylinos.cn>, "David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH bpf-next v11 1/2] mm/bpf: Add bpf_proactive_reclaim
 kfunc
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Shakeel Butt" <shakeel.butt@linux.dev>, "Hui Zhu" <hui.zhu@linux.dev>
X-Mailer: aerc 0.21.0
References: <cover.1789475073.git.zhuhui@kylinos.cn>
 <ee6bcf945910babab2200f05040975492aed21b3.1789475073.git.zhuhui@kylinos.cn>
 <aql_rkQMtlLmMstC@linux.dev>
In-Reply-To: <aql_rkQMtlLmMstC@linux.dev>

On Tue Sep 15, 2026 at 7:26 PM CEST, Shakeel Butt wrote:
> On Tue, Sep 15, 2026 at 08:29:35PM +0800, Hui Zhu wrote:
>> From: Hui Zhu <zhuhui@kylinos.cn>
>>
>> BPF programs can observe memory pressure on a cgroup, e.g. refault
>> stats via bpf_mem_cgroup_page_state(), but cannot act on it:
>> triggering reclaim requires writing to memory.reclaim, which BPF
>> cannot do.
>>
>> Add bpf_proactive_reclaim(), a sleepable kfunc performing one
>> proactive reclaim pass on a memcg, like a write to memory.reclaim
>> but without retrying until the target is reached, so that when and
>> how hard to reclaim is BPF policy rather than hard-coded thresholds.
>> The reclaim target of a single call is capped at MEMCG_CHARGE_BATCH,
>> as high_work_func() does for memory.high; reclaiming more is left to
>> the program, which can call the kfunc once per bpf_wq callback and
>> stop at any point. It is limited to BPF_PROG_TYPE_SYSCALL, because
>> other sleepable programs may run with filesystem locks held, on
>> which the reclaim path could deadlock via filesystem shrinkers.
>>
>> Convert MIN_SWAPPINESS, MAX_SWAPPINESS and SWAPPINESS_ANON_ONLY from
>> macros to an enum so that they are emitted into BTF and usable from
>> BPF programs via vmlinux.h.
>>
>> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
>
> Acked-by: Shakeel Butt <shakeel.butt@linux.dev>

Hi Andrew and David,

This looks good to me (from BPF side) and Shakeel, Hui might respin once mo=
re to
address some of the selftest concerns.

After that, any objections to taking this through bpf-next?

Thanks
