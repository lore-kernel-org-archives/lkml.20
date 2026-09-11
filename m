Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1142215161
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088238; cv=none; b=lSeN4ZpzQ0ypooYstseDSdA/dio1nYhYZ8hu+Ay3ntKXR4Osdv8x36JSU6ydK6o26bdluJghlxeCXWFEcI2ZIbBxNaqLNnbl5zc9nl8HcGTreXsgXwYXGCWAs59kzw5YUjHj7aZbryzbNhijd9ECnwxy9/5jCOXiAIPGGxDZMHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088238; c=relaxed/simple;
	bh=JUap5E1DZl/YpLqiDruLb48iQ9UveYL5LspTg9y09LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9be0bU2H9EAkcAWtroZaPbbWq5JxU+YFMVXLPelbR+QfRi52oGaHGqZAGbg/F66ECd/gSBUVH3lEXe+LVZTSw5XuVptyzh5x4KYPKLsgNJ87iN9sXG8FjrHMRzsUXJKk68iQaaLrNvEvpJkWg5IGE9BhlI9iIx11nhN6mlXib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSKf/ZXf; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSKf/ZXf"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381b831d535so649769a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088237; x=1789693037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cBCSAfSzWr7/938AC/KnuRa92ipR1b0xd/LyHiEtjPw=;
        b=FSKf/ZXfqheJSTCn1GFfRM5IrYuikHGr2lFr0V9bN636wS0mQeDfUsLT1akfiFMTww
         YTp+rmZLxAk5y2CfDsmYqxmAU9St/fZtwWvBfMLQE8JiO2EcwpKu8fAi1bJVa8KXvIxe
         5sEMLSh7u3AGtmmmoVEI8tvkd3l3ReYx7w1etPUrMy0XfcsQXkCscXRoLsGz6Q5PGeCu
         r6eAYvZZU8X4KpFXXt6qUOZNCiVFH/oxP9UC24Qy6xOcqJGyCysGfK1CzJ/KBPqKhmvv
         rFPoZcyEIfMyuEDlxqXa/b/Uhvu4QkRCmB05Jw18PvrMIxTG1F6SQVs3mRSBAr3O2/u7
         lFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088237; x=1789693037;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBCSAfSzWr7/938AC/KnuRa92ipR1b0xd/LyHiEtjPw=;
        b=rq8nLP05zncrzSuma2zL1MilDm+gA7LBiVh1pmuq5lDaJDg77d01dK0OB70zoxDeVx
         Dhi6A38LW7DmMfoHQ5zwn6hXbuy5WOodtJyIuNo8KmiUK74XnqZc7g8AIHIv/TnC770u
         s5py1hc6AHnhsBbeIArlKbJAy0dVS5l55mf5CCtkJkVfMXTUC2kLSM09PMP9eidGm4hY
         krShre9tjP4od9WCEFq7ciHt/Rkf4bxhPoiodF9CAqg5GZoejRYnihkt8zJ+ViK5lytZ
         7axfG0P5+3l6I7RHvLBCf6/rJR6aJ4buGI0xCVZNQCu5wrGlHPgxAcZs9Zh8xJOknc7o
         GUWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTv3e/8gbrYFphJp2CDaJvAiaXk33eh7P9AUldl12Q3n8oliP8FXzLLm91DybynXHDygtP6XUxduGQS08=@vger.kernel.org
X-Gm-Message-State: AFuF++mJQaYJPkaHZZIS3cYXb8vktEPG0Kvuv7PguKP9mXyGSo2YTCLk
	Eev/qsm2IBpkJwvtsv6MLfAJpwl0oX5yIcz6mFWqBnHvUO6HNoeuVHhR
X-Gm-Gg: AYBFou29zMbcQoCv2BB1lL0f8/+tvHGIe91aSYbGT29jDTvOchJ2LFUeUujNdeoMY0W
	ChY8UHug0G911w6Y26/7XdvBixX5j8dv1hf5JEFqpeStSpQTRkTUcBF7GjqWDFXVhwQDuBYtF72
	/2wG2LVNRaQfYr/hwFFWvm7MvNnG3ZXaQOzo4rEgZBvhsSuFnbRd+rF4cSnEdibdgnr0BCRdSZa
	DOYraKzrjTW8Cnbk4hJbQpEhK7mKUbq+bVWk2sqzigtsTZSMtLvnHH2freicfpQxxYrw9tw28Qn
	t6odjLKvXXNXutSozt/YKLjQD02pWY8Xgf2BKgZGhNmh9iX+MeHYHmi+MHG7CbtF1a4NBusDmf9
	JaiosaRZEOoVZk21HWtGYvKmEXWrk6Ddjz/G9DosFcx+I62RW4bzOGYaYpfgHVIc1HhkfKXvjRZ
	vipxIYyuqUGA61UOehv9DNUKVYg6Tei8Ob7PJ/8RCm3mJ9JF40QvNTCVinK30NoJlOjLqr4sUbD
	dILhQvrVjoV
X-Received: by 2002:a17:90b:280e:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-39d9beb7248mr2122288a91.11.1789088236998;
        Thu, 10 Sep 2026 17:57:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e5193dsm1685575eec.10.2026.09.10.17.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:57:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:57:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org, linux@weissschuh.net,
	arctic.it.hk@arctic.de, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: arctic_fan_controller: use shared maintainer
 address
Message-ID: <60123bbf-6611-407f-8f7d-89eb99f29a0e@roeck-us.net>
References: <20260910050401.279868-1-aureo.serrano@arctic.de>
 <20260910050401.279868-4-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910050401.279868-4-aureo.serrano@arctic.de>

On Thu, Sep 10, 2026 at 01:04:01PM +0800, Aureo Serrano de Souza wrote:
> Route driver maintenance mail to the shared ARCTIC (HK) alias instead
> of a personal mailbox.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

Applied.

Thanks,
Guenter
