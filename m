Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EA5271A94
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041525; cv=none; b=JmW4yTBh9b6OSFvsWKsD6GYC99Ca75Iyj8JofxnPewHMplEotQs81aT8lpDwr7GuE5ggNaFsdTNdaNmyZa1hmY4jCfgZ3bumWi3hYYnVXbXK/yYp0IRRtN8VIIuMUqs7q6jhP3WXuWBdeIaeldnTUaDKcOPD0P39KNfWiZrVG2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041525; c=relaxed/simple;
	bh=9t/6UgUaM3zu5+pSU9RyHJtRpDhvkOn4SysHGOLElHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSYSJb51TqGTmp9rX4MpwhjvnELqz7nT4bpgCJ1da0ZBJkadaj68s7G0zDEuDa1aqCJhMY0CXQM8uLr6cExPjgmjv0GzAaJuHLqGImReBUUa8GxgIHJOjaMRMxA2nBvqpYsYedH583MCVLy1uciKOKZI4iUKT4uo8wdC8btVbm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oABBbyg3; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oABBbyg3"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso5307319eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792041523; x=1792646323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z6Pw1hNQK2+gggiLI8jmYSYl4DMnm2i3W0kXD2qU3oc=;
        b=oABBbyg382nTBY3G9XYPQvOftXbe66048x3GkypJAHfRVM50eI1kduAgC6RYMbu2eI
         mEGEyt/SFsmUTCrBvg3uoiXhUuKeMjBlDU/c17xHB+jfp4/SygZVjzeN1AXKzPdffvob
         WjOmPefi7TkCxP9gQs9/NDBVeVXB1tYxrnF7dmd2Ri1VJaNAmEa6VkNpNRyuUrYdfAYY
         5M4LhhTMEBIM09VPHB8yNY8KZmv0ZyplByMqiyVEpbq2cYfu9rVtX/Z1b1IT7/uE6nwQ
         14S5GniOr5b8a4pj7hwvl4mPXbUcPH40fecYuQL82NT0RWlrtQir39krfs1ly+qKUH/T
         A1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041523; x=1792646323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6Pw1hNQK2+gggiLI8jmYSYl4DMnm2i3W0kXD2qU3oc=;
        b=q8iemk2QCwBowuE+XSajvpre2oQvyxNv0pUXszt2bB6pYI38/QkLwlvlCEUFD72Eq4
         uJOda+f9KkamNIhAnM7gKP99OUjQXrLpoBvHCKebXiOc+wHof8uxdBcuYrpdwhdV+160
         3FrQrFBl3m7D/t6/CjkUJAT8FUtj9ijHjFXKSgUR0hJ+UhfLMjArB51evltQnSSXGiBa
         r+K27c9iuc4SpDTCncJ7whbt9+0NSl1mnGjlDruCGB4Kwgmd7gHOCeTQMbyLaeYyHx5q
         L3UdAxbr9iuyNhUZ3oVYmR5ZdiGfVZZSDd+GxwnrarrvhvALabg4IaP8JUuMy2T3UiqR
         Qwtw==
X-Forwarded-Encrypted: i=1; AKwUvBzIH6Zacx7KbQdKhfGawoQCjJREPz7/83OqVOADiioLkWGISBicpf7eeSMiXnln1A5wQwyF8jZfjneLOic=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJXqqVranKqmrDwwpXjEbIxZpCwn7O81sS9NMI5ZLMZT2tmQYP
	VrdTJGnRk8lROO+5R+wfzXtxKYrXsyz0J8nRu/33YlskLI+sdjpE2L9+
X-Gm-Gg: AYBFou0YSaoFmy+bdldV8V5HZg0ENWK4jZmsDyVZlpwFTSw2draBfSob9PvcO0TqxtK
	mXdkiNrCej5W/0aVPsjR+TICuXz509kmhFtjuTLXY4jjKgbD40yGHvg/gHVDO1bLiBUG4qOCla+
	qRl/DPvpRO4urQu9svpOffWakUbtvbenP92+h36lOEFbSXCJ9ciZIfsdvVSlXX2YxHJE76qnJmK
	gATsN7Vzp2hk92tZGii4vrVTWgj/vwD/Ux72x0wgPCivCUA8J4DPQVD8c4ByXPDNn+Xyr7EAn2T
	gEVVakGlq6xFnKts+lW3nT2lgeJyOIKS7pMhokUGFgbIEmnZfjlfZv4HImwsbhp9vhW8J7IgACb
	l4wlB8n1bNUo8gqZ5wC18ULqhdFlddG0u8Ehd172Q0X1ryRP8+JC9Y8Qo3CdgLvNZQIwoRBjLwP
	12XakjXXSOR0LeA7+uMwVkGvhBiS3TXZ2HSCbnnBWa62tyhf5yLsskbJ93y9hV5TFpMAuOb4ZdJ
	PR5qoqOq3QPEK8=
X-Received: by 2002:a05:693c:2a12:b0:35d:2c2b:215a with SMTP id 5a478bee46e88-35d2c2b2220mr7701428eec.35.1792041522634;
        Wed, 14 Oct 2026 22:18:42 -0700 (PDT)
Received: from kernel ([45.251.35.75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm42929176eec.11.2026.10.14.22.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:18:42 -0700 (PDT)
Date: Thu, 15 Oct 2026 10:48:35 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: ebiggers@kernel.org, ardb@kernel.org, Jason@zx2c4.com,
	skhan@linuxfoundation.org, me@brighamcampbell.com,
	jkoolstra@xs4all.nl, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: md5: correct header inclusions
Message-ID: <atBiK2z2MKCeg-YA@kernel>
References: <20261015033843.6056-1-raizudeen.kerneldev@gmail.com>
 <atBa776tU-O1Qg-T@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atBa776tU-O1Qg-T@gondor.apana.org.au>

On Thu, Oct 15, 2026 at 03:47:43PM +1100, Herbert Xu wrote:
> Mohamad Raizudeen <raizudeen.kerneldev@gmail.com> wrote:
> > The file uses 'rol32()' inline function (inside the MD5STEP macro) but
> > does not explicitly include `<linux/bitops.h>`, currently relying on
> > indirect includes.
> > 
> > Also, `<linux/unaligned.h>` is included but never used, as the code
> > relies on direct pointer casts.
> > 
> > Add the missing `<linux/bitops.h>` and remove the unused
> > `<linux/unaligned.h>`.
> > 
> > Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> > ---
> > lib/crypto/md5.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/lib/crypto/md5.c b/lib/crypto/md5.c
> > index 3d2b017a0525..a838bb90103f 100644
> > --- a/lib/crypto/md5.c
> > +++ b/lib/crypto/md5.c
> > @@ -13,10 +13,10 @@
> > #include <crypto/hmac.h>
> > #include <crypto/md5.h>
> > #include <linux/export.h>
> > +#include <linux/bitops.h>
> > #include <linux/kernel.h>
> 
> bitops.h is redundant because kernel.h already includes it.
> 
> Cheers,
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

Understood. I will drop the bitops.h addition. I will send a v2
that only removes the unused `<linux/unaligned.h>` include.

Thanks,
Mohamad Raizudeen
