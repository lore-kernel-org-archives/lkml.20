Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA252EEE91
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790569026; cv=none; b=UFPb7wIPb7CzGsXKBt9fHGlVsJIsymU5643T+ji7eKNwZI2C7+o9cwxyhTYpapE9snlvBKm2RN4BEyfgSvBA/RZLCsVWBvh5iaDb/7RLw6bSr1EDiWflQmTJ5ivCkh7UprzCJlkzErKT9+obbn+E8VDsdgGGkCwwVaGCwyp+hg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790569026; c=relaxed/simple;
	bh=YTfotWDlml5UR/GBD1wY4ze1xpdJN2PButuZynaIwOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7YfG7Th97X+heI4ZE578GwFHeg7XWB3R8j0Sja4jtBzeSH9GdKaxEJ3R1OO5QNQ0p75t1M5mP2Fkfp9gkHsUlvDhHkjxsHBpEHcnp1hk1XArAhUWmsiT4lqeVtoBD/OwVwx8DRFdzGE5glq8/pJFPTgeNMC8NRzW5hGwf7SuJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vl6hKHEa; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vl6hKHEa"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f38so10817025ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790569024; x=1791173824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j3LIx4OT6RdJGRg4qDatJ4q0rZ8i4sT2AGqSbaU6cDI=;
        b=Vl6hKHEaXEdcAzoKtczHGRU/G2h/ayHxmm+e+tQu7a8exJeSf0V0VTZUZvFfDEC+qr
         uaS5ykicmMjcPG2F300+GWSGIgoHFryctlqLrq4RX5UIzgXGZOpwYKUq7PSsIJnoA/cu
         Qm/6IBIB0JW+vCRkKg39ZOQq4CH+G65dtOCTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790569024; x=1791173824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3LIx4OT6RdJGRg4qDatJ4q0rZ8i4sT2AGqSbaU6cDI=;
        b=Mp+im3HapoCh3fxAYVttVjKzwC397qeIZfAHGXNPXkSmXbOx6fBWbiAx+B3Zua3K19
         WMhxefdTz06IV3f162LWY9usYzaXlbgp3tg19zxc9QE1c6QwwQWdMx1KN7EPjxA0wDxF
         iDByrIIsHlzlu6RKz6tfvNzETseMoCB1W96ttZMG9pVsrN67xbIIti4lMFalZHPC/7DB
         EiJnlUFoqZ4bXhehjRuvypzJ8X1+8L00yOGKxv3phwwtnDxHibUYy7NXz0y9Iak8AdOr
         5PwPo1Qtx5b7Vd98ntFrnHYgepy2yuxP+H2lCgJ9UI/b9xfHJ4GF0+aFASEboKaBg1pc
         fAzA==
X-Forwarded-Encrypted: i=1; AKwUvBxr141pGZaFu4zBgFzKfhtqYoQegqVNeWpoBtx19+n/X2k8uYSD0NAmb5UJr/qUOPZdCgJj8gR8Vjj6LQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4n32dcXRKw0jSmn65KMfam3e6z3ow6C2gjaU2JH6s47wgNpJl
	0gacv3F6ykLAk9iG08Ahd40MmTWVKAt38pkVQWw/0jZFO9g8AzJ5imOBiiakA2lXrQ==
X-Gm-Gg: AYBFou2DhOfyXh1dJXdqWqRpVRa2T1UMQyoB3T+3itt/9VC06JB+5B0Y2Sh2fEGapdN
	T0lSvqb/O0JKnYG4IQLNUV8/DU8ILeqvitgDrFpmLFqlwQ4ULnCZdxWOfWQOjAEbWGGtKv6ngDe
	H7qub0T7M1n7thFz7/njkWWq//qwn94k78kMj9/6QpAsrw/VBVUXsQUnzFH4KjrPBc1WRkqqtU7
	p0MlRnXiQ1LYBbjkcGhUcZlKNQue/NKFSlAfxk1pMMad3fcNhSHP9G7RKHGYBLrY84TOBt5tmGE
	CGWPC3VMvfZ+FghBGVUbSg0dU210Qy/wNx0AMkaZXXhipROXmG9orxHnFTNau7EoOBOh6HJ/kgn
	VIk+BnBMYkWK+dFvRNHQ9SpqECAxfwrZ6u44gvBv9nwpPPk8Nj+TVarUr9iaBUOu2nqdfF90/Dq
	7PcFTBBANOKX8+faxG09cwWN60V/yDtqJlY6EDPIEUWagvKYMOorINcOCl31gYoBQISZoqndkar
	OBSIvmCsE2UF5OQfRoKOXV9Ctovil4B1gsbvs0=
X-Received: by 2002:a17:902:d98d:b0:2dd:c100:7cc3 with SMTP id d9443c01a7336-2df7dd72aa3mr103163935ad.63.1790569024011;
        Sun, 27 Sep 2026 21:17:04 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:fdbe:318b:98fe:bd96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e23ecsm35034075ad.18.2026.09.27.21.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:17:03 -0700 (PDT)
Date: Mon, 28 Sep 2026 13:16:54 +0900
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
Subject: Re: [PATCH RFC 7/9] lib/lz4: switch the decompressor to the vendored
 sources
Message-ID: <arnpj53cgDErAQEz@google.com>
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
 <CGME20260925113504eucas1p25e50de59c02681fc1385220be8acd184@eucas1p2.samsung.com>
 <20260925-lz4-vendor-upstream-v1-7-1c7ffbe21c4b@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-lz4-vendor-upstream-v1-7-1c7ffbe21c4b@samsung.com>

On (26/09/25 13:27), Michal Wilczynski wrote:
[..]
> -static FORCE_INLINE int LZ4_decompress_generic(
[..]
> -			/* Necessarily EOF when !partialDecoding.
> -			 * When partialDecoding, it is EOF if we've either
> -			 * filled the output buffer or
> -			 * can't proceed with reading an offset for following match.
> -			 */
> -			if (!partialDecoding || (cpy == oend) || (ip >= (iend - 2)))
> -				break;

Worth noting, these lines are downstream commit eafc0a02391b
(lz4: fix LZ4_decompress_safe_partial read out of bound).

Is this intended or are we "loosing" some of the downstream fixes?
