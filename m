Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C623E39CCF5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790748489; cv=none; b=XPZKain5uqZy6RLWgxsyzBCeCfrpaZX5aqhdujwaa0eRKQDu0h3r6WEe6Pls44iXqD9rk6+t5hmViuCsszRPgqBMzgtdSdIFs18gu/10QIbeM8t7p0u6YR/ATknWMC2MT1VzvdgexosR8k+teimuLhp9ypYnCRM6xVrIGDlDMh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790748489; c=relaxed/simple;
	bh=FQT7C9mEtUI9zyQeAiy/rz7mwvm/L9IqR2P4MCxmtag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJKDZcnzH+2jAyESJOMvJIV1HdvjF1agxe5SafmTeM9n0q/8vSTUX+88Eua4APy0+qFZRjitunv+YBUJOF5DxENddmyN7D4LljRjSudi+ZNbHNJfGh6Ma1ZU9C+Xe/tABGs1wI1JM78/MJYD9oVRjThIv0fEOdqpKPjpDiDzf0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GpLOQ885; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GpLOQ885"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b355ffso2125345b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790748487; x=1791353287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CgFmFj2igJGpmbRflOSd7wans++uMlq7r70gUY54Vy0=;
        b=GpLOQ885YueQnMRr7aYksbM090881sDEr8Fe1usp/q0pr6fKEwx2Cglw8wGIeuqXfo
         z9+qdro7WLQlY5O7IK5f2JeUGmrO0obUFcd+Na/uUiQIuolwIOhoYcdmwDhyJuUCflos
         uNc3Zr3tAz8ZSh0r82sTNNcJOP6oSeRIpn2Zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790748487; x=1791353287;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgFmFj2igJGpmbRflOSd7wans++uMlq7r70gUY54Vy0=;
        b=yXflfAuFDLTP83fVrgfgm6VMIijyDXcYqZPF28zvtprityW95BThCg9Xe0GMvfB7uz
         BTLUut9j9fNIzIFLvMjGHABetwYQCNfvTruxk3DCgtN8EW5EZ4AZch5yKztxeW5k3Erg
         8gt4l/PQs9fNKouhly6fO7KOfxpTICB1KWv86CAxza2aFUV43ZAyGeRl5odRYBS9G9wV
         xmNqbOxslvkYDaIQ6O8L9GIvdpUhUmHcCoGULarnqHQ4U9HuToV454U/a9uOUAspOpj4
         4Y6iqJnKdI+79e/zhKWXb0wZ+cJkU8xPh2gboOSsR9gY48u/99vYa9akQPr5Gobip4gX
         c5nw==
X-Forwarded-Encrypted: i=1; AKwUvBxmeC/z51PoxnAdVLOEI4R7AFaAn5RA76oadt8nx8Q+ipZlJQetPSeOB63+Rxjli1LxM/KnXqPrbz2pqwI=@vger.kernel.org
X-Gm-Message-State: AFuF++l6YDs/JKOEM7Z7gXywewb59as2o8kp3CHpUFOE+GUhQXULKwdI
	SQVYP4ugS07zYkX4ElMBTyEfKN2h131RpO+JYYcxxlssatVUZC9Mksx58Syrgqyi4g==
X-Gm-Gg: AYBFou1hHe7VCfjVq1iNYYMpQMb9ZBRCl8G2JCKTh9Avy1xZlgd2bY8uunRJNMlS0oS
	+NFxobXOVKTxCIndKAwstzZ6T71HwWHepKrNhRQm7IaVTP6waXD7TpnzsnyETGHov/RfK6Mu+Md
	3hO4cYV+fJExbIU1dKqbBUNnOx9JMLrPrEERzfAuK7IPSwR/d3AVECHgit4iWYptCVI+K13hChP
	biA3pdBhdCpsR8SBL5Cyb1YyR1UJbI+b0R7uvNGF987cj2bSKvfftxwxD6+7XEcKzJtioequ7Pk
	ccwRnCcBwKb7PH1qZeV79YueIYbELKggjtusOSwumeUtZV4WLTLkkd66fITBsg+PqcdYsZp0KPS
	jdmUCcNk6QDFOi3SC5bNrOIrrEqCn4nT6l5c7mqvj2xIPGNy2ryPGCfs4ipsLso+Qm7zw1DMGyW
	OZsHirJS8F1D4a6SnOd0FceHE15kiTczC+M4cz1lHVqCV1baGslQlblKMSrSXULXkbHaN6oq0GY
	/XA/+EJpfTNF96vkDO6Yot0MPKfrNbKkTy9sh7zlImAMM6+sA==
X-Received: by 2002:a05:6a21:492:b0:3de:3bd5:604c with SMTP id adf61e73a8af0-3de9e87f358mr387844637.41.1790748487167;
        Tue, 29 Sep 2026 23:08:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:31b3:f8c3:893a:d0bb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88725d68389sm247895b3a.39.2026.09.29.23.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:08:06 -0700 (PDT)
Date: Wed, 30 Sep 2026 15:07:56 +0900
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
Message-ID: <aryehUJml8fTy0o-@google.com>
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

> +void LZ4_resetStream_fast(LZ4_stream_t* ctx) {
> +    LZ4_prepareTable(&(ctx->internal_donotuse), 0, byU32);
> +}

[..]

> +void LZ4_attach_dictionary(LZ4_stream_t* workingStream, const LZ4_stream_t* dictionaryStream)
> +{
> +    const LZ4_stream_t_internal* dictCtx = (dictionaryStream == NULL) ? NULL :
> +        &(dictionaryStream->internal_donotuse);
> +
> +    DEBUGLOG(4, "LZ4_attach_dictionary (%p, %p, size %u)",
> +             workingStream, dictionaryStream,
> +             dictCtx != NULL ? dictCtx->dictSize : 0);
> +
> +    if (dictCtx != NULL) {
> +        /* If the current offset is zero, we will never look in the
> +         * external dictionary context, since there is no value a table
> +         * entry can take that indicate a miss. In that case, we need
> +         * to bump the offset to something non-zero.
> +         */
> +        if (workingStream->internal_donotuse.currentOffset == 0) {
> +            workingStream->internal_donotuse.currentOffset = 64 KB;
> +        }
> +
> +        /* Don't actually attach an empty dictionary.
> +         */
> +        if (dictCtx->dictSize == 0) {
> +            dictCtx = NULL;
> +        }
> +    }
> +    workingStream->internal_donotuse.dictCtx = dictCtx;
> +}

Just a side note,
there is a bunch of new helpful API added in this release.  Currently,
we do some memcpy hacks to avoid re-init of lz4 C/D-dict in zram, but
once this series lands I'll be happy to send some trivial EXPORT_SYMBOL
patches so that zram (and other lz4 users) can use standard lz4 dict
API instead of hacks.
