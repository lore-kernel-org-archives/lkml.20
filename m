Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7998D30566D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790568755; cv=none; b=bjlA3zhRkR3bHGe4rOdLSPdOHeeqUO7tNo5p5CFyYdpRFt2NiX9kF9of/bknpAJxVAbUiaS62kBnNA1811PlrikP7hX5NpNOoDUNIwzNxHuw3jikaOcdm6YPe7cY9Zbg17NSEYjhUOp3ncwczhxAs0WRfKK0N2xYgCziZ2jqHT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790568755; c=relaxed/simple;
	bh=/sOtv+Jy0VfC/zdAlOtrQTC1fDfCRtKdJKUcnFIpFsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+Vnfym3aMztj/Kq6KRPLIzS6dH9ZiRNuXU8tbep9PC8izyH4UamFd3h1cr45Rky33WAmPnsbIMoAjbqUU4zEYWO72qw3j3FoCzaUtHMBeGGGwc3ZqhhReIGwpKNUK3Ns4mgrBP5vG9sNAbjVhYhhZcnItfMw0IrF6cDYQqnyfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KEIR3m9W; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KEIR3m9W"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e22e123350so2407515ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790568753; x=1791173553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXDScwdKbt28kFhjEDV73RhbSo3l7UPBxj8GidcV6Ck=;
        b=KEIR3m9WIJGGxbDxu5WT7d1D8pdjysg2u6EOJPP2gwFE4OJjvQnJ287pxIflD0w4Cg
         3KRo1HxvqGoz0UssGc+2rSuTUyOtycuRzbtmoCDu1UD7mwkHfhAOWZum2XbziBA9oVWv
         jJBljzLhKQzGV32PJczj1FgBrq2QfJL1amKgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790568753; x=1791173553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXDScwdKbt28kFhjEDV73RhbSo3l7UPBxj8GidcV6Ck=;
        b=UQ6bw5C7ZEfiEj+hxICP5bfSiSeeGXqiN7Lq7Dx6yzVj1jikhEcj9ARLOnOBomutpy
         hHxb5zGIhH6aynTjmnZLBs3GiyM2AO8rUag9dHZGCxmA3BGJb03QMim432pgjKWNUhP3
         Y4SxTNruMTYJVpdmixA7fJ9wUrg0R7zi3r+hwfV3RP3q3hhpgSfQVkjFpmvDy7gL7xRV
         xYhN70ihUjS1mZb9LqhdUeQ5mngDdQd9Rg/uJMGVENXw/+0uGlKFJc1xMrHV4lbPvtSj
         eYrgplTn8gE2es/W641ua0fbacQXRbSrd7uct4AhOJRXlhYa1nnJgGnW/DgkM25R0RUB
         ed5Q==
X-Forwarded-Encrypted: i=1; AKwUvByKBPMDoNGEX1r+aqr/XTsKlQFfUqI0zoUvyz5FnC0rfPpeipkYEIIf1GBCHpDNbHWy3L2L+kpRmg3imfs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzuwrBJPdfiBR19u/6FasngKM0EQSv2zLJFvQYs0k1jwIbadRs
	aKjSnXF0GCo1ytYOlztd/Vksg2jw+F/o9FfaZnbXHVqGSEL5AUSDWSkn/2bPNSwI0Q==
X-Gm-Gg: AYBFou282xqKgy9OR784sVqKybn/CKOJWXKW4NafrzMswQlXNggyQODkcKcN16SkufV
	6CgU9VnCxylmUBmfBUxh4SIxVKU1XmM0Tjase50E3sKGuc/H7dfL1fMlPITunb4nfZ7t5qqsiaF
	bCcjGS/lwpjLE4GPU9QDvsBOoIJ9flXqAF0yy82vMcSXDU7Lmb2jPM8fHD7GlAv1XL60xnHVoZF
	b9m7FAwBPHg+/4aTwCX3AhBilV5w3QBtRBBPyc555cGZhWVzOdr9rHXzVXs3m8U1VCosxk46N2m
	O+4tM73ioZDVh8OJEoQwbCGGpf7joy7dOidWRtmmIaaVcFGA+LpI/gxHWtcAwACknNxC0oc53QQ
	K72PP0OYwrq3n+kHys5pElZxXwpgE6+SqE/f1YlqcPj8tafW02Acy/H6SyUvRC+YKxjppE/C3WE
	6GMGcdWkYzR1Qrop2FoWp/B96KVzHvxL6d4BP/PhQ02yBV+B4yoGgSmuj5HzKKV3f0ONDBlNiXU
	vTZ4sYKeuRRKK7Hoe2EO3ZUSbQVWx7zx0XHaEY=
X-Received: by 2002:a17:90b:1c82:b0:3a0:7d97:37c1 with SMTP id 98e67ed59e1d1-3a098aaba1dmr10891588a91.59.1790568752817;
        Sun, 27 Sep 2026 21:12:32 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:fdbe:318b:98fe:bd96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bec30aaasm17381254a91.15.2026.09.27.21.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:12:32 -0700 (PDT)
Date: Mon, 28 Sep 2026 13:12:24 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, 
	Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Sungguk <sungguk.na@samsung.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH RFC 1/9] lib/lz4: import upstream LZ4 sources verbatim
Message-ID: <arnosKlQYVIdmTR7@google.com>
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
 <CGME20260925113452eucas1p170bfdb34dfbf670a14a6f8f0c2f5094a@eucas1p1.samsung.com>
 <20260925-lz4-vendor-upstream-v1-1-1c7ffbe21c4b@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-lz4-vendor-upstream-v1-1-1c7ffbe21c4b@samsung.com>

On (26/09/25 13:27), Michal Wilczynski wrote:
[..]
> +#ifndef LZ4_FAST_DEC_LOOP
> +#  if defined __i386__ || defined _M_IX86 || defined __x86_64__ || defined _M_X64
> +#    define LZ4_FAST_DEC_LOOP 1
> +#  elif defined(__aarch64__) && defined(__APPLE__)
> +#    define LZ4_FAST_DEC_LOOP 1
> +#  elif defined(__aarch64__) && !defined(__clang__)
> +     /* On non-Apple aarch64, we disable this optimization for clang because
> +      * on certain mobile chipsets, performance is reduced with clang. For
> +      * more information refer to https://github.com/lz4/lz4/pull/707 */
> +#    define LZ4_FAST_DEC_LOOP 1
> +#  else
> +#    define LZ4_FAST_DEC_LOOP 0
> +#  endif
> +#endif

I just checked https://github.com/lz4/lz4/pull/707 and it seems that
LZ4_FAST_DEC_LOOP is enabled on aarch64 now, but we still disable it.
Am I missing something?
