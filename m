Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09493BE15F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565148; cv=none; b=O9sJ7XohuzqZIPbUIed4AYwFqM0WqV1ZE/g5Dnb5iwTCzCGxGHdS9Ou92v9rnnFHZ0tQj/76OIOwAUZ98zqM842O5YVWR6N0vfoXt/Hrgk3ZeJsb52FHPdggdHZm5itjUegcMyAOsYoO7mHEXtteHBtNtg17094ZZiRMBrUJ3as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565148; c=relaxed/simple;
	bh=VsmwVWOVpvaJ+Q3nzqPlKtsId4STg45BTDnclVHfZ5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9xN9pHOBAhdZC6pkjUE92wK06LPKmrixizFzJsxU/n7g57VsrDeH9eKjIfoYgVKAK2Kuuc0qFTWCiqpbDe6GxEFf/7H8HRAFR9FgcZYHvHux+Wivo0fMu9W/s6WGrISbkK3tG1iLRbWuuwg3p0WsGmt1aL7PPt7C2PlwaqPTvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/PxoVih; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/PxoVih"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e61f017091so17120695ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791565146; x=1792169946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8x+7zuv7UzMaKL/3w5sC9AGLBUyDe21tWW+wJXFpe54=;
        b=H/PxoVihOdwF6MpTCjjRHDBKvMh+Wd1+CO48Rt58rN5hn9emLGLf42Rr4nDDr4Pbj0
         U/PYoe4eZeqY/aEOjRvtd6zEEUBZEMKalcSfIVVvgPABGDkGxsA0C1JUhYyI0jOaQRr8
         ARB29IMY5F6BbGeQ4YmvmXjNUg6oenUmGlt+jqydkXgE70ohKo8kAZRpzXQhppeSzbKa
         dqqOu2ICfnQFdaQmS2bfawRSE7Ftg9TKgRS6HGjU2SgLbkNzLWOs0epfgFHqUJES2usG
         jvQMolvQKfG7AEm4JYgQZjXtiuyuv+2sMC5EFP2UY+Z8zeOeZA8PU8bf8RnJT02vdtNt
         ikKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565146; x=1792169946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8x+7zuv7UzMaKL/3w5sC9AGLBUyDe21tWW+wJXFpe54=;
        b=1FC5jc8bW1yuplrdKBVjPKaJNuLW4smqE4czW/T3QsLV+UBTsvW8LVeKdn/IzfV4gp
         yRwzoUuHPfT0P62sGXwjDrPEAsYPRXD/BOLgaVNVLymhugewTELnZ5KuVkSraSqSCwgt
         uSSnpHpPQHWfvhlQ3DU+1hkCYKiebas8XhjHKbOTd37yyRlMUVenYPsD5WsFQmkC5+4j
         4I28GzVehAT4GIoBelZU+IKhGT1NWWp8t7yix0nB8VViOc7/jVYhBMDjBktp04ZHF0wA
         NdxzjQ1CY+7JW6b0WW4zpmJmdAb1qZPJWvf6crgKAkQm7z/cG2Xo1lmbHNLdMPm6TF7+
         5snA==
X-Forwarded-Encrypted: i=1; AKwUvBxuWkIs3TQSvkzmvYjGkMK9lLJIhV7qOvEAdwYqZv6fitF7Q7crWujbjrSxDruO5vjcVlTuTtbj5NYLPf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQE78wp1XLgIlDPF03PTljBXYakmSs6xVUZesdual9ARkSXhRI
	mS3Ub41HG29HIiktt+Y1G3qsgjzof+3wHP8ZUWbKO5rWP++Qwz8lq2WB
X-Gm-Gg: AYBFou1LEJJ58oLGrs4uQfY3blfjZCztINCkTLWv6VyVIT/WFEn3Zz6w/UCTaqMuNnW
	ZetbI8mkxaaBHLfM0e50Ts0oFB/lqtirbJwxayx344FCFHJ4L4TJ6TGy99oJaXJqtY/SMPcSmMZ
	q5wSUZupYH+Y87jfagkj1WwN3Kh5GHVwkHWFW9lZFtWjYugfVZaa7uwIUc+YhLN3uKMA1DlXic0
	4LrcQzt+0AV2lKIEyrPzEOJX/HpOPmxlr7Rs8fJXfoRvUJaZKiX+GKJLvR5jXJGa8OfqK3tT+vz
	alOAAB8eFpv7diLdcdwbLWe7aH3RoARcPlYbP1TlKiJHFr4XBGd4HOgvuLP4msuosHhE7/zkcIX
	wNOzZQvhOoyKcTB6ApZJWSb79XJb12uQbS64/DdYH2f1FXqS6Nvrndc/V9rLJup7h61ZEbqNeA4
	j7s4AEx+jNt3kIBhtnnNvC97Ntdlos8h3JUrZ7DgLwPOvs67Npa2F0gfqIyn5d0ENNh2MuwGWa2
	3AV7uOWdKrp7UfymTic7rJNRMvx4GrCqw==
X-Received: by 2002:a17:903:160c:b0:2e2:d9fe:51fb with SMTP id d9443c01a7336-2e84280aeecmr22910215ad.4.1791565146067;
        Fri, 09 Oct 2026 09:59:06 -0700 (PDT)
Received: from google.com (61-230-52-229.dynamic-ip.hinet.net. [61.230.52.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e2570sm14453055ad.79.2026.10.09.09.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:59:05 -0700 (PDT)
Date: Sat, 10 Oct 2026 00:59:01 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Guan-Chun Wu <409411716@gms.tku.edu.tw>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] lib/base64: Silence clang-24 -Wconstant-conversion with
 diag pragmas
Message-ID: <askdVfevxztHMyGN@google.com>
References: <20261008-base64-silence-clang-24-constant-conversion-v1-1-0858b60b23c8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-base64-silence-clang-24-constant-conversion-v1-1-0858b60b23c8@kernel.org>

On Thu, Oct 08, 2026 at 01:08:49PM +0200, Nathan Chancellor wrote:
> After a recent change in clang to warn on signed char conversions within
> array initializers [1], there are several instances of this warning from
> base64_rev_maps in lib/base64.c, which can break the build with W=e or
> CONFIG_WERROR=y:
> 
>   lib/base64.c:58:18: error: implicit conversion from 'int' to 's8' (aka 'signed char') changes value from 131 to -125 [-Werror,-Wconstant-conversion]
>      58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   lib/base64.c:52:2: note: expanded from macro 'BASE64_REV_INIT'
>      48 | #define BASE64_REV_INIT(ch_62, ch_63) { \
>         |                                       ~
>      49 |         [0 ... 0x1f] = -1, \
>      50 |         INIT_32(0x20, ch_62, ch_63), \
>      51 |         INIT_32(0x40, ch_62, ch_63), \
>      52 |         INIT_32(0x60, ch_62, ch_63), \
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>   ...
>   lib/base64.c:34:42: note: expanded from macro 'INIT_1'
>      34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
>         |                                              ~~~~~~~~~~^~~~
>   lib/base64.c:58:18: error: implicit conversion from 'int' to 's8' (aka 'signed char') changes value from 130 to -126 [-Werror,-Wconstant-conversion]
>      58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   lib/base64.c:52:2: note: expanded from macro 'BASE64_REV_INIT'
>      48 | #define BASE64_REV_INIT(ch_62, ch_63) { \
>         |                                       ~
>      49 |         [0 ... 0x1f] = -1, \
>      50 |         INIT_32(0x20, ch_62, ch_63), \
>      51 |         INIT_32(0x40, ch_62, ch_63), \
>      52 |         INIT_32(0x60, ch_62, ch_63), \
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>   ...
>   lib/base64.c:34:42: note: expanded from macro 'INIT_1'
>      34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
>         |                                              ~~~~~~~~~~^~~~
>   ...
> 
> These are false positives, as the branch where the wraparound could
> happen is unreachable with the values that clang reports. This is not
> considered a bug by some clang folks [2][3], so silence the warnings
> using the __diag macros the kernel has to workaround compiler warnings
> when necessary.
> 
> Cc: stable@vger.kernel.org
> Fixes: c4eb7ad32eab ("lib/base64: optimize base64_decode() with reverse lookup tables")
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2181
> Link: https://github.com/llvm/llvm-project/commit/a5ef934a8d295dc03be3960f2b3744ec2e53238e [1]
> Link: https://github.com/llvm/llvm-project/issues/223923#issuecomment-6056856245 [2]
> Link: https://github.com/llvm/llvm-project/pull/226775#pullrequestreview-5454407389 [3]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Reading the issue comment in the link, it seems somewhat subjective and
controversial whether the compiler should emit a warning in this
scenario. I'm not a compiler expert, but from a user's perspective,
it's a bit disappointing when we have to deal with this. When we are
confident that the code is correct and have provided the compiler with
enough context to determine that there is no runtime issue, suddenly
getting a new warning after an upgrade is a bit frustrating. But
anyway, let's go with this workaround to keep the compiler happy.

Regards,
Kuan-Wei

> ---
>  lib/base64.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/base64.c b/lib/base64.c
> index 325c7332b049..e46be3a55585 100644
> --- a/lib/base64.c
> +++ b/lib/base64.c
> @@ -52,11 +52,14 @@ static const char base64_tables[][65] = {
>  	INIT_32(0x60, ch_62, ch_63), \
>  	[0x80 ... 0xff] = -1 }
>  
> +__diag_push();
> +__diag_ignore(clang, all, "-Wconstant-conversion", "https://github.com/llvm/llvm-project/issues/223923");
>  static const s8 base64_rev_maps[][256] = {
>  	[BASE64_STD] = BASE64_REV_INIT('+', '/'),
>  	[BASE64_URLSAFE] = BASE64_REV_INIT('-', '_'),
>  	[BASE64_IMAP] = BASE64_REV_INIT('+', ',')
>  };
> +__diag_pop();
>  
>  #undef BASE64_REV_INIT
>  #undef INIT_32
> 
> ---
> base-commit: 0c2669a9f4a1d607e7591ae50ccf3c432a0aff08
> change-id: 20261008-base64-silence-clang-24-constant-conversion-b682c6bbf563
> 
> Best regards,
> --  
> Cheers,
> Nathan
> 
