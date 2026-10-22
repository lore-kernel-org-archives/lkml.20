Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700165;
	b=myvBal1mN/ffhn8JeVi2ZSxNjX7hx3i3bDoWiiVGY9+k5slnTJPiSqUbwol3fFdk9IQP
	 RcUHHyRc7clfgtraqPjzYoNNeU4Sz0QwkXsr1QNCLapkwosucCZvZwleANnQ+1hR7ADK1
	 1Ox91wUVpHsHtniA1hKtrE6nUAc8qF4OFEU+y5ter/yf7+cXd6wnQj7oStHAS372gqwpR
	 8qmenADJAlAhwDB7DyJT5B3khHA0HvejdwdBvQ3mjgJqgGXAMOL3qgCrlofVj/FxHVQUq
	 DyWhpeUy4v0mYPKNI3O9MD+yUcYI5kOSuw4p2Q0LERTvJP8jg8CB7rgH7iuOCJXAWWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=04uyNLgdlYA5nyi3rp36m8rV5w4iXYQ3w9Fx975SKe8=;
	b=24Mt9p7A9uX2vHeynETu4pp+yFj23tcqiQlqHFP5AgNZqv610XreB4SrAC/xyJKev0Fv
	 QDE+7S65UPKWvrt6zmKMlbzOJL34O/Bcvf9EJ06EoqHX6MK8qDYCYS3tGenseEv4v1r5T
	 a3Jf2r3PjKgJzutE33TT8VIcqg8lbZ+BBOpGjDgK/s6tg02KiHPYQUHG6F6p9Ebnu927V
	 rhc9nvPXI+H9/fQBq8MzkI19Fczp5T0GbASHBgXtKI7TrHYbyJ/5xzxoCGLdJN6hq8Jbv
	 EBvuUiGDQ/y+1KpmF6JG98LFhJN+Q7bLFshJiwVM0ymbqB879Fgb/d2/Ld87aderi2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="F/rV0WlQ";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3126E60A2638
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3126E60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F/rV0WlQ
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso939756f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792700163; x=1793304963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04uyNLgdlYA5nyi3rp36m8rV5w4iXYQ3w9Fx975SKe8=;
        b=F/rV0WlQQj8fQCzAxlkW9zuvYyu+Msp6R0RqoZeoHNVcd7qAkdgnqeRZgpVy2nUC/G
         NaEwsMMEOdZWwuiW1aCtpxmlLCg/j3A1qeudqYE5noUiWJxlyJfbIXQRhUnxSyrr8pon
         SOAeia6A/6uPRHAvoK89ai9YzsLw1ZLxZom5cRDWIQUyH36YFpHe4TGWSCHqZD/rLgdC
         ztjvIsnh0NKgDHbiqwB7bWV1HV9LHSls/x3EfNk3XK73cRl9uGPnma+xbvprclFh5D1L
         h1MUDs8GS7kuEwDt/+8yeRh9PvEgkn3o+O9nzEZ19A36zLLdDoaN4k3UBz83W9iXHHIO
         yAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700163; x=1793304963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04uyNLgdlYA5nyi3rp36m8rV5w4iXYQ3w9Fx975SKe8=;
        b=Ib+0CKNhYoFvt/4Tmq6qOxo38oWGTp2jqMY1O07LFSooUrUR8ifgyRIT70r3VkYcKq
         dFL2nu9TkkMWBBPyn17UIXdNEmoniy3kq3+Ax5oy2d5jt1uLmDHg9SorQRjQrOgN/zRL
         XXDTkNFs3BhXFSfI6+vArfvwARVf9Me5wG5qTIOV1hR/lqyAeGg2na2NirQAGMY2rnOh
         Ldy4WxDH4yGBjUudQ97V5jb6iqa2HGWwbiG3cXOXjDpVpOhMMKGjUE5AWQrbmOS+ILNG
         KPykPxGZ6fRYA4GPNL3rBxTjyofmvBUeJVBD2gJ+y8TW5rVzp4Xmv3I0P5guz40BxI5K
         97Lw==
X-Forwarded-Encrypted: i=1; AKwUvBxZok1w7hhKTus0vAzHLrgw7I1X1DMl9VF5SrP+7UBGHjd13mAYRqqwzVr/v7+OKz0ZYpkzX2BaXm26o2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4TS4UHhEGKUcPeU2yPC90okzc/Z2kZj6ieBCimd/0cOSWXJ9F
	ohRwpUx2NaUsVkajO/xzfuDmaSAoLx966ePy99QHX/X5CG3DIT6Dcvwv
X-Gm-Gg: AYBFou2WjRM3kzN4ToePkPN2EAE4tV5ZFQHuTjY1TQL/A9d5XyheNT73jaUNdBoCmPh
	LosZwpzUJNSJTFSD6BREjZFwkcFbW8XkIx2Jb3KucuCnoyurTLO4auZDskMg2chHnwT27Bb9TL3
	g9PV48svRTuUQHVvNDr9BAQby2k9CM3YcGWbWpm7WCWAZQdioSS3F+1SXcE/1ngTZvw9TphxCzm
	K9NChKOcEhberqixiAuJlcz5k7bNET6Izo+EI+TDt1+RctMPihuGKvVoBBQVu63EGBjkoog6aZl
	WoKDqpFslsn3PBd4xsmDFioC6MGX5xsDnEkDSc9Szc4P3Jd8+jlmVhYTONuwxH4gqauFMsFFxk9
	MuGwY1to5Xsin0ZQuF9M1eZ/enAimDVMiNJzLGK8AUb/cyT6Du8y8Q86/VtV+dWtvXj1kqtMjse
	im+OVSPocizEa5vXfwOZXC/Ot9wdEAsf6EYGRrxd74s7z1uYuhgjMNxvAmIT2/Ey7lk/9UNFR5A
	a3r91I0fFuzswm4i1YsVITNxbZz4ASONP9S1pr11mU1F60RiWttNV84BY1hcroPB6qJR9Z2
X-Received: by 2002:a05:600c:a010:b0:4a2:317:d0ed with SMTP id 5b1f17b1804b1-4a211bef3d4mr3013315e9.1.1792700163341;
        Thu, 22 Oct 2026 13:16:03 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm320905e9.1.2026.10.22.13.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 13:16:02 -0700 (PDT)
Message-ID: <32dd1f28-db55-4674-99bc-74d9d3ab25db@gmail.com>
Date: Thu, 22 Oct 2026 22:16:01 +0200
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
Subject: Re: [RFC PATCH 0/2] memblock: keep reserve_mem regions out of KHO
 bootmem
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>,
 Alexander Graf <graf@amazon.com>, Changyuan Lyu <changyuanl@google.com>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Pasha Tatashin <pasha.tatashin@soleen.com>, kexec@lists.infradead.org
References: <20261021211058.83483-1-azpijr@gmail.com>
 <2vxzqzhhg8l3.fsf@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <2vxzqzhhg8l3.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/26 3:37 PM, Pratyush Yadav wrote:
> On Wed, Oct 21 2026, Jose A. Perez de Azpillaga wrote:
> 
>> On a KHO boot, a reserve_mem= region that can't be revived (new name,
>> size or alignment) can be allocated from KHO bootmem, which the next
>> kernel boots out of. With CONFIG_KEXEC_HANDOVER_DEBUG preserving it
>> fails; without it, the next kernel's memmap ends up on top of it.
> What's your use-case? Why are you adding new reserve_mem regions after
> cold boot? I'd rather avoid making purely theoretical fixes.

I don't have one, I found it through the TODO. a different reserve_mem=
in the cmdline passed to kexec is enough to hit it.

if it isn't meant to work across a live update, would you rather have
reserve_mem() fail on KHO boot when it can't revive the region?

-- 
cheers,
jose a. p-a
