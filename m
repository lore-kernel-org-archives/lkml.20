Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF18C3546D3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792117600; cv=none; b=O3klBLgvqBcaxDSze+jKgSHQ0gwD//Z6uJ9bpTcifUdG+J+lijLmZN2pMcVoE+d0SjVNbf7k07mHijg1AkEEkEGoRzD3/EM2Dm6GQAvt7UIdyinD8A4fKipiypQ/fr22uMDyq6CJkbC3rF3zh2rxpHheC3CwzMun4erB4WZL6vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792117600; c=relaxed/simple;
	bh=OSxEYFJNp1rnoU/dlmKyuTHFZzDjOW9xv88L7AJilZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAfq01VSIN+J1bKEHBe/rCnF4tliiQ222H4STng7s6Py1EbfcCmUWwYQU4nKvQfwetk6EEQmOHAhV9SG0uRjDk4t09TKciCG1b6jhTN5THTBa1h6mP3BnEtHbEUx5TMca0MYsr+dYia/YA2o9E6TpIYwwKqWXIcPrZI9f3U63I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjSvuJhM; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjSvuJhM"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-16079d54c17so41906c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792117599; x=1792722399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ebMt1DK9lztKBpw1BhAsTvvwM6Q4iMNpgorgR7TB5+U=;
        b=hjSvuJhMwsv4R5+u4iIJVuUZjlpKC2vlm9FY1q4mQ/E75H4QpEaxQRsUaKVgQSQkDP
         yFc7E8W9q6fDGFIrtE7JsjjehL99u/BDM5DtHx0rh8DQPEel/09M7wElrmlFTubbeQ3/
         L4jHc2aykgoYIdgPxdP9l6QjarMn7Dspp9mfxMsgh35CS0yyBtuuM03tLUtP8VA9qM5S
         2a1we7hvsOlOgJuZgUFCOmB54biZubSr9WMOtQ2dogZJD9x3z7tWmA2htJAQu7mE1Fh0
         nwcBc25R12WI9f9O5hHmwWgso0kOHMdcWqwafdrOm99rKm//3s9bsToedGzekHCjlEuA
         5TPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792117599; x=1792722399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebMt1DK9lztKBpw1BhAsTvvwM6Q4iMNpgorgR7TB5+U=;
        b=TSZ5AldsRNuVls6sgA2w90Y7GdBmR70GV0RpyQvZPCFRn1LtqJiivMLQlI7Bx6vLEZ
         z2tvo3yO1s5VNivfizff6dMFchDrwvcHDfkQUIM+BH3iys7gSM0tv+BrbiDVzbW1F5pA
         mtdaoHLd2dIFGtV+krYZyArOY0eo5DzJaEtg4tgB6WsXXuOr/298Ghy3KPomNx1COeEa
         NtX34okGXmc5sf1bD0D5Sh9zJdfUOwEPZ1S1NzJAFz3ol24SM8+mwfgs8Si5a+StzLWL
         5MudU2e7PuKnhV5A/M5INDyzLxGepOI0c+yVwPQjcGjgaf/MYhkELxmEUIFVDXv6e23M
         1Nhg==
X-Forwarded-Encrypted: i=1; AKwUvBzOQQj5QJsUiN7EgDHCO8mkLBcRLSXmAiFju/J7EO6A+v15YhGmw4g3ypA/RxSgP1cPSlyMEL9gKOPaGVo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnMbFDyyGnKC3CX0nx1ZKQVHTq4UWS6/0yeRVzWsHy+k4S91m2
	ueunlWN84EQEKLfWBe+MvFjo8DZlbJ9RWvHLicwkn6VA9TBvz6u68NtN
X-Gm-Gg: AYBFou2T3aRTZPmQjVG0zLBxEssreFcJQx99XtPg98luf1QyF7XLApHDYdY1fEbcwx/
	qmtdhY7c5A2X0tWWyN34l29bzHDPppS3wELAIAjzXsFpkLAz9oTXrnXk4z5N+ptfIW6jmRok6wG
	YNj3F6+1HmrzViNC7XYO5oQ+BpPxQLfP0oXN2mEmLejOrezFATqbLRoPxu1mnKf5/CPO16y8Gye
	cxDo+NgqsQFnNrJnQFGIdmjBGAhwySMEzKFhZ6t4LiU34WcOgbma0p7PNC//rDbGy3huktPhXIT
	4hiZuH5Gyp1X/txQ8RLr7jQeu5len9kbf9YRzcY0N6LUQ6MgoU/X1nujrjRNf1BGBNqFMDJiQVw
	JIHBelYiBYEdWdpnER8YIPBLeU+syGaF4g62q31FwNoKbtYSJFUlH3f3Dbiz6Uxj3YQJVMCcyiQ
	Ckd/JCkhdlijxUJ/HVFnZpEGySeXDiVH7cEJebcwNZ7m0R7RxIpfdXOEhDTRN4x8qZ+OlEu64Cb
	zEjgPdh1U7GCBc=
X-Received: by 2002:a05:701b:2305:b0:14f:505d:813 with SMTP id a92af1059eb24-16a60811423mr29115022c88.41.1792117598697;
        Thu, 15 Oct 2026 19:26:38 -0700 (PDT)
Received: from kernel ([45.251.35.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm1746391c88.13.2026.10.15.19.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:26:38 -0700 (PDT)
Date: Fri, 16 Oct 2026 07:56:31 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: herbert@gondor.apana.org.au, ardb@kernel.org, Jason@zx2c4.com,
	skhan@linuxfoundation.org, me@brighamcampbell.com,
	jkoolstra@xs4all.nl, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/crypto: md5: remove unused header
Message-ID: <atGLVxfnna9yZR11@kernel>
References: <20261015060806.5377-1-raizudeen.kerneldev@gmail.com>
 <20261015175655.GA2170687@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015175655.GA2170687@google.com>

On Thu, Oct 15, 2026 at 05:56:55PM +0000, Eric Biggers wrote:
> On Thu, Oct 15, 2026 at 11:38:06AM +0530, Mohamad Raizudeen wrote:
> > The code handles memory accesses using direct pointer casts and
> > functions like 'cpu_to_le64()' instead of the unaligned helpers.
> 
> This should say "using memcpy() instead of the unaligned helpers".  The
> actual unaligned accesses in lib/crypto/md5.c are the following:
>     
>         memcpy(in, data, MD5_BLOCK_SIZE);
>         le32_to_cpu_array(in, ARRAY_SIZE(in));
> 
>     and:
> 
>         cpu_to_le32_array(ctx->state.h, ARRAY_SIZE(ctx->state.h));
>         memcpy(out, ctx->state.h, MD5_DIGEST_SIZE);
> 
> - Eric

You are right, the main data block accesses use memcpy().

The reason I mentioned "direct pointer access" because of the 
`*(__le64 *)` cast used for the bitcount padding in __md5_final() and
hmac_md5_final(). But I agree that mentioning memcpy() is more accurate
for the whole file.

I will update the commit message and send a v3 soon.

Thanks,
Mohamad Raizudeen
