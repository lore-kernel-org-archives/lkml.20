Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738049;
	b=t0qa3KlzJR28UPa/8fyMapkkib53LoeYzdnwfL2GjPmCWFoe2+VKiWB0UaC0ny5yhCqT
	 Z52Flhm9jkcTIWM2xhHlkdfrkXRL8nYIJvSsevWmaCmiJUKDIFh9vVeAlfVTju8YkbTyd
	 CJkD+zSUjPrX9Q5AWWBU4sJ3W4UJgSP9QWrpRCiNwj17GgnUeCQvLoaJUBM4pXBPHP1ay
	 YQ7m/I98meePiTw15LtvBwuEiVQ448ehxwAeb9ahfh/h31Hcpn8m16Iin7BX4MHKF6NRD
	 7F6iluM+ubdz11+Og062HMgODTOZ5fq60f20ZmycNgRf52mFzu8zR4MCYv5Nced1pIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=dNjq2OxDVtbu8F9xl0nqlhF7Q6giPt5SRyE2tzpRWmQ=;
	b=QLyN/frMbBd2pIA1ln/Ty6JlulsRylI7/YjZVzPmN96iVH/OuEd2Z2p0lc8nSVN0W3UJ
	 yWH1e76rg1nUAVrHtSZaZjxHXVv6digA1ezNg1yn7cddvwo6+OwyfHLfYMVa5JTQcnwyL
	 1d62etxzMLXm+XT6xxWCHTaLoiZwJEt6RVVV9jUhWWL1AGPbyvQQi3UpbBnbZVQPjA7r/
	 K9JNyTpb+BVLdgglN2K51dTIzQ87ckISpYGEnOf1jQ/Lf4r5XgbG/LtMBckvJvFb529+1
	 ZDk8BuDUpqWgROkRg46nljVeP7tR+7LzXfr9qK6g/dK8ZkGJtj7sRiey3681Ie2EOAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UWXAKpab;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24900606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24900606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UWXAKpab
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so47665225e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738047; x=1794342847; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNjq2OxDVtbu8F9xl0nqlhF7Q6giPt5SRyE2tzpRWmQ=;
        b=UWXAKpabW7n4FQOPPPF0svuPcfJ1+lbF/6LldmOQX8FUE3AwCxbl4EQ2MD/7z3T0LG
         kyfXvLfhChBscW4Kg0gq9jXN/BcVcD8RGQ9RNsnZTAVvEns0JPRgzD96cPSBT4mAV60x
         xTYsry0bqdfVVSL4DK5PhIvfcIyJKAQaIkX2zLbgzZ3/vrpFH2Y9hsEaECR0cxCqLmc2
         04XY/1XM97cVRyPPxGlvWFbEcRNi0DEAH5uie568rx5C16IQwYXiPaVQT/AmYXg/oE8C
         6QrhtCYf6CqL6zTK3B7msS7WRpUMJeOoqmI/GbQ3XtqZkQbRQ+NUZI7Jn6FYAkOtzO1X
         TnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738047; x=1794342847;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dNjq2OxDVtbu8F9xl0nqlhF7Q6giPt5SRyE2tzpRWmQ=;
        b=NYBJ06RVOqXSbtKRf23j0oTz5gulfLD2l42C+8pC5k8gpfRk81KIfr3QYTR7+Nohls
         eIEgY3zEMEhC8BZUKYgRLivwWZVbgrM00zNho4i9RNsl6urN70jAXNWAxY9CDh9NTJzR
         EsRZrFgb8IyyMX6QrsjCKaEuGjmA/36mjGGjny78taD2IovjgwpvbscvefpnZjB3whtj
         fW3BJ62bGAvVE7zs/N11zHG60zgRQKOPVjYBT/MlUnmZiWD9GJDDc43Q4F5PkPWNTb3N
         99fgOHaPglAuxk4YjKgxaGGKIOIsd5WjsJUAi5yCQ6i49iZqaN5nsncuU4fmBgRqDt2w
         YYPA==
X-Forwarded-Encrypted: i=1; AKwUvBxDNsz3CCJyMxRaR7seYH6BGCE33vBbRRJc8Nts0F5j09OWtFqvMvJn1UovdChKzX2sK3YfqD+8QzaHF/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o2gLH+pBMhfJCvvIR6duZTGZM0EhWltGGOM+plQlbaLS+fY+h
	uM53AmxaYg8TVzy9YG2njRn1Io6HqeyS9Zf+XSUZJsIwKwSyADs995a0
X-Gm-Gg: AYBFou1W1JIgyuSUbgilkMSf8XEakf3JIJDn5KalopUvMfWHZcerU345BwHi3mG89LR
	y+GZC0JlAgGYDyfynDkr+1TzGmq+Uhx226PBfqgciwcYABQKluUqu+2r0i3KMgYLYDg0NJhkqDR
	rIfA6UQmuN+P++LDsb0rjvzy/4jDeYEfitROMzm9Xwn2IMYXgMGhJBiMTURkAkEAEXPoz/saBCP
	veaERa2eShHqsxpsY3ybEDM9i7gNFM6+poRBdcEfPfZCBkvRcQyV+tozaTBOSdaW+Rbug1a/+aL
	Edqt5xy0C9vDaj2kIipmS8w4B8XsNKgKbvBfoZZVH96+o/lU7CXdrEoZ66PyEmPnL+X6A2DaIQa
	ZmKlytexcd5SHcELTSlTp2T5u7VxnTPgq5TpVd/vcE0SzWkX6+XTYGzq5KuHJ9vJTqcGruuQf3j
	oQNyDtFdjawok4cUFZoICw7mc5uhujgeSMeofGnLoFyrzfALodYapyxQnokV519CkuLtnnN+YTZ
	a2HFkUd1c3tdweZSfjTJF7VJDyJgleGr0qP419JM+rSiIspvLX4DIiFJOy0+4fVyTHOSAm3AGNu
	YJkTZt3vxj/V6bQ2VrkbyythKui0wAQ42TcV74y3vN/rDRW1dPvqQA==
X-Received: by 2002:a05:600c:6099:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4ac180f2ac5mr302267155e9.16.1793738047466;
        Tue, 03 Nov 2026 12:34:07 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm479666f8f.44.2026.11.03.12.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:34:07 -0800 (PST)
Date: Tue, 3 Nov 2026 21:34:05 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/landlock: print st_ino as unsigned long long
Message-ID: <20261103.96f7e09c16ae@gnoack.org>
References: <20261103155512.535137-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261103155512.535137-1-sashal@kernel.org>

On Tue, Nov 03, 2026 at 10:55:12AM -0500, Sasha Levin wrote:
> On 32-bit architectures with a 64-bit ino_t, st_ino is an unsigned long
> long, and printing it with %lu warns:
> 
>   fs_test.c:10511:57: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__ino64_t' {aka 'long long unsigned int'} [-Wformat=]
> 
> Cast it to unsigned long long and print it with %llu.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with a 32-bit build of the selftests with a 64-bit time_t (gcc 16
> and clang 21 with -m32 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without format warnings there now, and the x86_64 builds don't
> change. The other selftests get the same kind of fix in separate
> patches.
> 
>  tools/testing/selftests/landlock/fs_test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
> index f725882fa4a78..a2dc9a7f0481a 100644
> --- a/tools/testing/selftests/landlock/fs_test.c
> +++ b/tools/testing/selftests/landlock/fs_test.c
> @@ -10508,7 +10508,8 @@ TEST_F(trace_layout1, check_rule_fs_fields)
>  	ASSERT_EQ(0, stat(dir_s1d1, &dir_stat));
>  	snprintf(expected_dev, sizeof(expected_dev), "%u:%u",
>  		 major(dir_stat.st_dev), minor(dir_stat.st_dev));
> -	snprintf(expected_ino, sizeof(expected_ino), "%lu", dir_stat.st_ino);
> +	snprintf(expected_ino, sizeof(expected_ino), "%llu",
> +		 (unsigned long long)dir_stat.st_ino);
>  
>  	set_cap(_metadata, CAP_DAC_OVERRIDE);
>  	ASSERT_EQ(0, tracefs_clear());
> -- 
> 2.53.0
> 

Reviewed-by: Günther Noack <gnoack3000@gmail.com>

Thank you!
–Günther
