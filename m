Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0C741A8F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791605327; cv=none; b=o8Tkb9sduVur2tYiS5kVVb9yH221k/+5iIGRMIPoMAnM/pMdP/s8ARpydGjJxajEu5wNr0fxLRyMs4zYJF9zJQV4nqRYsA7zCKkL46SChMxpsWLRMqX/XrjJqSUKHmZA0/yWo39GzxSzrfwV2jbrMYTobwBEc3HhGLDO62VDIpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791605327; c=relaxed/simple;
	bh=UzcitmWhO3Wgacv008xCcbR7C/6Q7bGnAK8MQ9nka/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYsH+ky5/D+xzk93TemXflBXr9xsENYktHmD3FFFWNAg9tZUs9blpyfRzpuC5U3wfFlI+DtEJEcErdTsjVMIjEgAHgrIfkpW8HkPKMv987ojkdNjd5f4mN59G8kxpTzQHjy7pwQxMVVvO+77tqFhDwyGo0g4BGgOIVCCLMDzs10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eZCdDil9; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eZCdDil9"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso1989985ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 21:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791605325; x=1792210125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ZUQo/yqUTrPoo5foi8MoXEvjEyvx6Zd1hGuH8gY7vo=;
        b=eZCdDil9zpfm+dy9PocX52sjqsY5UnBzCQty6YKhFDNn/vg1De102HUk11HDscW8Io
         l7nBq0GD0PKiq/iyD/11Ie5seZK89tLD8bTKNSCuxgYHnWp4OUqwamglJeFuvFqJU5jp
         U4SjtPDqW02kf1oTN32FRd4usJSbg6UZ0uxDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791605325; x=1792210125;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ZUQo/yqUTrPoo5foi8MoXEvjEyvx6Zd1hGuH8gY7vo=;
        b=rdRm1d9RZbn1sLKwBH93U1x33aPc56GRn5iYWd99ANEtaAS9JVzPCqpBRX7pknDbKl
         lqaVxv5w+xH7N4FaSnFfNXI71QdPljaYTIboKA0yM1phWneSP7C+/NTswdYvo94Fojyy
         JbqJ1E6K3RVnyhcSWgE5psTkPBbQtfA+uTVsFM67hyHNHYF0mLb5waRuWmiquqD6WuyJ
         BcrEvWrOQIH2XbdoOmGQbqKRtyYcpGJQtj2+yBK/HyIQbq6bXgE3nRRlGmme+SLRRXLJ
         zfb0a6x2JzRENJd2tlE1kFPPrMhzW9uKLYkgL+CXLq2iechXjV/sPUoR01RlJhhNJIqp
         rOvQ==
X-Forwarded-Encrypted: i=1; AKwUvByAJdfsiJspM3gTHS0Brt+JMWiduEZgzza7NzlRdgJAJ1L4dGSI2f31t9+qLg7IPP1MUw+nibft2SZfHLI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtWTUA1PtmfJTR4eah8K/gV79Emim7MGErP4yHbwPv+bJ69Zi5
	YT48CvrEg6aZC9MzDF5+gBWs1evHK6ER35QLAEAEkVydL/zdHTuJx27qxt2L367h3A==
X-Gm-Gg: AYBFou2B5bawpvfUpXKyn8pg7dbpwVolY8rTst5cgJvRjtE6UswT/dLA34vtooYP9qa
	9kii1lCuFUhCgsHIEr/QnG0pDOpvttke4l5x4XO+U+I1DqQvvP9/hbxQ5wql06Qh4DdUP0AhgQY
	Cj8uPPIDjgOeDPKZQoFgwSEVUtMfNQB4D4ss8NM2LWP07xWtkKGB2iIA49NIrOh6wAOXeVTd0jE
	0w/yo35D5babNaJC5TT9p7rRDEATu2/i8cRY32xJybN2IUnoPnJYB9GAA9m4X5HlucuwYwVRhoC
	nI5KTsZ+DTYN4uaMnfZ2GfEyzStxUpGD1EKkIex/SsQGTGuvM0D6jH76n4XpmA8OwHZeZNQPYNt
	IEIKY14Kxr3m8gNKx1X4L6Pepd1ClpFZkJ02c0kFyJgrXpFasSeazy6Nh+hfRj5Xax9q+j11ma5
	uOumlC58kCScUbdATGY7KvZKrCz1me5kCYTRYYkPb00syfT+l88XC5jVaZEH46Oe4Wzi/VvJM8R
	sU5aG3aJWb5IzPSP9wRYUBF906HNADrNLrpEw==
X-Received: by 2002:a17:903:2f8b:b0:2e6:943:39de with SMTP id d9443c01a7336-2e842bcdb8amr31536795ad.30.1791605323624;
        Fri, 09 Oct 2026 21:08:43 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:540c:2d4a:7d35:ee3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16casm19275425ad.40.2026.10.09.21.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 21:08:43 -0700 (PDT)
Date: Sat, 10 Oct 2026 13:08:37 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, chengming.zhou@linux.dev, dsterba@suse.com, hannes@cmpxchg.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, nphamcs@gmail.com, terrelln@fb.com, 
	yosry@kernel.org, riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, 
	kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm: zswap: use separate compression and
 decompression requests
Message-ID: <asm55VCYoqzE80T7@google.com>
References: <20261006002307.2669023-1-usama.arif@linux.dev>
 <20261006002307.2669023-2-usama.arif@linux.dev>
 <asiUXpjrE61TLMxQ@google.com>
 <b11ab591-3839-4486-b4fe-77922addbc31@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b11ab591-3839-4486-b4fe-77922addbc31@linux.dev>

On (26/10/09 17:26), Usama Arif wrote:
> Thanks for the inital patches!

Thank you for working on this!

> > Catch me if you can ;P
> > 
> > [1] https://lore.kernel.org/all/20261009071157.3730698-12-senozhatsky@chromium.org
> 
> I think it wont help zstd, right? It would help stateless decompressors like
> lz4 I think.

Correct, zstd and deflate decomp contexts are mutable, cannot be shared.
