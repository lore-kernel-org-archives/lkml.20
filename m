Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793274912;
	b=xq2Flv+08qmb5IF5XBaBhJTCMvT6XbaHIQbNNZ+BQW6WpMvkuI5mLRtiSAbaHxFmSrQM
	 wALJzS4mwTVKUgHYhwI8exCCq9kvYpA0/RpNjDBCiPCpGjfSIV9Npe/4hXB9V/UZDEyhZ
	 Dp/1NUwYut4MIYg6T/TDYawPc4fQEBrlaApk8AGazJKttd8y4n3RVVa4rU0+Vah61wENx
	 LAc8NDUzKESlgH/y6Kcz1tGnTIbki6Aau4ZugQ+rTkAM45X1CitnXK5LfRKNQxRojC6+s
	 XPmz9DY1x7pCMhO/OG/gJVQOc97seS2/NWTBr2Xxi6Qj82s7+IDb3ZN5k3XY6kZhOXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Original-From:References:In-Reply-To:From:Mime-Version:
	 User-Agent:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=3VY7aUW6rjKEecWzoHgMRcesnfYCNorLy5OBPK7xTbg=;
	b=0Xz1jYUfog7RKzVuFJpu1ju88GB9yTiMwwo3Z0SyKM3RfXYkXXSNYfNa9j3KxbKFv9U0
	 wkC4SFMZubHMDjgskWYFoC0F3X1xohSRNj5MUCjanVN/CqhHYkaOdfD6OY1UV7VF6teGY
	 xoHQrr+cQoY0trKS1TXMxRqetK8mRK6vsLUNzKjypxS3n5O3g2SUarUH02odENNMH9igu
	 n4pEa/M4NjePb6RoMcHzTrvVGLC0vrKBxp0ESUj0DiWJ70jRcfeRFddh2Mmpel5tjCbYC
	 r/e63Ou2b7n5iQedw+ZKUxgeXMaN3pB6Kr7J+3L9WI2sNafvxCVt0tcX6gQM5WP1BwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CuuMj9g2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36E1606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A36E1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CuuMj9g2
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso2514715e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793274910; cv=none;
        d=google.com; s=arc-20260327;
        b=dTCqFWZGQ4T+/P9gcXAj1iX+cN/iyJW2zH2IsDkFaUMXy8i9PVrV3s18A7LltwAF0t
         DsMVueoegH3fy8HZjqyhbvIPZTq5b0Eu2aNGhLzTGUiMk89CUIhnV8+OIm6Z+CFFtEfI
         4+0kxJetQnT5QUAalyO5GlgJm6qRBrysneeUuaGvjYs/1zt8q8dhD4qc5ojNOqD5bFKS
         nHFmNEx2enda0AjITQRTqlWaw5+2UsQduzR/jFS5rgyCO4BSJZHALg65mWyxkNGZJMlp
         Vic/I73WrffzMmfuK+OZFsZVrWqBwNqZ4K4PrRNiJz+h+b3tARQ+jnf7KxuiwUyv85vb
         eIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:mime-version:from
         :in-reply-to:references:dkim-signature;
        bh=3VY7aUW6rjKEecWzoHgMRcesnfYCNorLy5OBPK7xTbg=;
        fh=cfDr2Fi2OFczueWkiG932931SlrIeevY2gfAP8pqOSw=;
        b=mOoOWKigvqdlXKkIwNm9LqeasKN7gLryI+owBwlz1awZFS8lKwuc1rYwS4zL9gn4vo
         5zPj20Q52j2ub0Sg0aFVKBxzIDWxGD12gbq9tIVRcMAcy+a/HppmEkce29a8lI8/rnCg
         9GlKRBp/iLL3i5RFMYx9Pcn40RLLELRSJAXMynx8KFT4+/B6ogIB3Dncf5gm0RvELHKg
         Y/gFcC4JJtvsGtPfBqQzWmMlRBhEuOtvW5lQfEy925HGKa1qhB/oL54Hyc3u4PEHfICl
         3IUL/KhMt8P8zIh2lzCHLod7Qx6mFGnecufi3YoPCSd9+XlhkzTWuvNA5o2pVmzjIk/I
         9g2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793274910; x=1793879710; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:in-reply-to:references:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3VY7aUW6rjKEecWzoHgMRcesnfYCNorLy5OBPK7xTbg=;
        b=CuuMj9g2Ph+v1MKWI7x/Ma1dHL0Yr4KokjmTvuzJuVaafCQww2WgpuyLSHPlgWCcD/
         +Gk+X8VA79TI3jaY6nC6/lgeOAgqapOhP0c8xZPuPpkSYomeOdNEBwQni95Grcwd84fk
         0zgQpy67pQE35kAeiaEWruBgLx52yWqsp3rGJqwcEiJRwTDz4zDYRzRbxk9SEsvxX5lS
         7m8CGcZU0pOzrhooYnyOmP3atBJQ+M78Uk59VVZtrrTUdGOndQtrAHVOH2KcLXppmQaf
         8uTqekRKs9XNH/7t1+8VISE0bfe3CZPTREigA+N8q68VSTgdF5IN3ggNxT9g9ztZTP0H
         pojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274910; x=1793879710;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:in-reply-to:references:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3VY7aUW6rjKEecWzoHgMRcesnfYCNorLy5OBPK7xTbg=;
        b=ESDqLlbQoFdq43ROMImR5zYa+IKVMfc0eaD1oOVbIw9LmhZgVnxDV4Lig8lO5evf1W
         9l++CvYqbWS+izf601Ap7KBpEyRoQk28bnr2qRNqUv7ZuQ6X8pMPJrJisNZ5O185r81S
         MICcCHHxUGvvR7iP46j6KGSdRxUgQdncovdx1eB2WQR/fJt1bS6+7X91cZFbsX8kINt/
         rADraVk5yZJWCCBnJodqpKA3WhNB0P1m8YzdR55gv1MauIYGGjEpETrNB0F6HoxT8HRu
         ugZb4vqL4injBnUqAJJWwP9lPAcQS8CSRdVrQq7pMmS7kBL32Pxh71WXL1fKwrW22htp
         vi7w==
X-Forwarded-Encrypted: i=1; AKwUvBzwjeyjlnT4ARKXFWo9gMan5/+hOma/EZtbkG7p8xNk00NxHZWglIsnHcMDLjOq6av2qNrWoKoyBOMlKmE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIDIGXzPTzJdjSEMl7UHFJHfXl4idKMYJdUmDgAr8lfmGQnpOE
	aH5PO3JuyL7ogp6n0FX3qQhqCQv1NV0nl1DcInirF4l8XX8RpUFYvX8VAL1XEmfkSeoAj7Bur1h
	KC1hM4QfGjACLG/XzC21w6nCqNeynotqiIlfE1WKvKg==
X-Gm-Gg: AYBFou0SRjwyMgdarcycvBwcXXZE7pjjwWjs0Vjb3goS1FBUb1Sw22Lj0CQ+JLa1TJU
	k3tg2hgivnwHPgBdjqDG1grFkmklsW776WKuRbZniBlftv7RGb/NqtIQJv4dGpFQnRSb7Aaz09m
	1DwhYNYAszvxoxAKPVdrn2Hc3luJQSzAJo3Kp4wijgRaLZJ/v6ELMQugekqkmTUa04L1OmvYVJP
	pnxLtedjXMHnhKiKd4RzQTXfAhHyjImU8HrmDXoWcAKNOjfb+9n5Gx8LKaY2OQeIaOtybqoqaU9
	QBd4eSAR3Dx8kC+R2smqojnHLos6esohVGJl543H0EnRCjVMgDzaZ/gw7JxNVYTGWj+IteGaCh2
	Mv0Sx+5azbNN4PMb47YGrDBJzfd3+UdBaUp6P4g==
X-Received: by 2002:a05:6512:1592:b0:5bf:a209:f81f with SMTP id
 2adb3069b0e04-5bfcad27d03mr1811204e87.37.1793274909843; Thu, 29 Oct 2026
 04:55:09 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 06:55:08 -0500
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 06:55:08 -0500
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com> <CA+Ht8=YtrKJxr7YLO2z1389NPDnws8hSppAzVnYYJp5K1duvOw@mail.gmail.com>
In-Reply-To: <CA+Ht8=YtrKJxr7YLO2z1389NPDnws8hSppAzVnYYJp5K1duvOw@mail.gmail.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Date: Thu, 29 Oct 2026 06:55:08 -0500
X-Gm-Features: AclHuK9_AGd24eF3VOAo28szXNgJA0RFlLmIywua3jpx-rZ6jgflVyqTuZQeovM
Message-ID: <CACnXVncN5yT7Dmqom6m1SaFO0_MjXeoScTRfGUZ4RVdZKhAnHw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v12 00/11] riscv: add SBI Supervisor
 Software Events support
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
	Anup Patel <anup.patel@oss.qualcomm.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, yuanzhu@bytedance.com, yang.yicong@picoheart.com, 
	yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Himanshu,

On 10/29/26 7:38 PM, Himanshu Chauhan wrote:
> Hi Zhanpeng,
>
>> [PATCH v12 00/11] riscv: add SBI Supervisor Software Events support
>
> I See only 8 patches out of 11.
Oops, I ran into a Gmail smtp system error. I've resent the last 3 patches.

Thanks,
Zhanpeng
