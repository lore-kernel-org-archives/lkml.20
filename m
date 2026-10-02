Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095E9415F32
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973612; cv=none; b=Esu+vzJxgD0UMu1Lvulx1bbOTmzHFAaG6zFD+3R0r0pjewMNyrORmVaUFzkClKQH7faztiPrigmu26sYnFVP3OxhJA4o6p11UbhO7Ouc6S50DWU+D2EgHdM1p07iWOXcvx7Z58idjLz510aS8Ad91Tu+jSrtjgb5swQ+lhaK4Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973612; c=relaxed/simple;
	bh=NavU9oD7boZye7A4i5QSk8+AfXIDy/22rXB6+09Jnyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onBW8RghJKQg4LDoschg5qe9J7KXAAurMrNyv9u5k8irwK/IeKDLmubJpvtava3E9WKz49agitQuZsW5yGpJwGQU9E/6Om1cd64v8YsDnF43oX/E5cbOROJK59YYXoRWX2tWO6TiXY8ciRrYkFQ7ezIbzkffrhC0iGZhjAIwV8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=rRyFqmQh; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="rRyFqmQh"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc02279so261667a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790973604; x=1791578404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBk5NF+csDO854jJyGJ+AcXtXH9ziwL4Hlvi0Ps7aIY=;
        b=rRyFqmQhlt+bfWV9H75Tc2409iwlcAaJ6OSqzrChT59BS+iUl0zlanQ6S/A6Wc9FJ0
         1XAdalZEY5tAtdkzoU3ZkcPiqmswNhInbgNGpK445GX9Ipf9L0clH1j0xq4tMzVdhmfm
         XuReTN264z5U/bkXHDc0+oprioB/X69gI2HiOX8exNAndWXaiH5201ycwjw5fRBp0ndq
         QL0jRUGMuxSSc5oWiEsBYcsaCLAYafp/VowTDw4L4P+Fz4UjnoIJCDiYZV1FixjbUVYn
         C9gqzo03rXPfYJFC5o1cDSv7HNnZQ6Pxclu7MiapaYWWzNq0aDG4+DMpx+RT3VDXsaWb
         5k6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790973604; x=1791578404;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GBk5NF+csDO854jJyGJ+AcXtXH9ziwL4Hlvi0Ps7aIY=;
        b=jg46SzGobe1nKb+2aBwRVbt2odrqATW4IHsUF89urVRCEtscGRnQAj3ZII95LLXPyv
         CVeCmYI0RDpsZXI7KosBu9jlt0i3QUYD85wITQKRy9/cEePj30o3SjJb3zuG5c26XO3M
         rVfxuijY7WqRmOfyV2jYOuROA+xyLBJSMuS4wfFpxW+u866eb7TuphJKPIehzN/fObGW
         X1iVjxFm+t8cfPLRk8AIcilu0aM0VrMAa9FtaqQHlJpHvG4yzbDMrHFF3CJVSc4L4uQH
         nszhcC3ZgHRY/RGRk4WGHEy3k00vn/AxnO3B6W9VzQGQ/f1R10UkPMfQ9dijmg5YiyUU
         jMlw==
X-Forwarded-Encrypted: i=1; AKwUvBy7G925cCQkpHIvhMv8Z/V9UvwYT2cC8e1rDPzeWypd6dBwUN0gq8Xkz7zlcnr0MfTniClDIl4eSvIAWas=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgvEJ2JnVNdzgUUzhUzf8LQBvwRRdwbAsdeQBXRKrIFacpc/la
	/dutA7jsPryGtDEq2g98Q3zlxxQ3K2r5fGzLEZdqJ5giz+saFg8T+7WVyf5+VhITL8M=
X-Gm-Gg: AYBFou0AcCZGprsIblCEZ6jo3cRc7vDEEJyZnfgxxwUKOFxTU8TonIqjsEvEYHghfMH
	X5QaYzefLj9WgpTnC6ldrUAm5v0SKoB8hJnbdisQVjQEr1Eyi8XuXeq2vSJumLXu2P9JeCZVzWy
	76/dYcaANsS3TVm3Vggjj414aiWJfpBp5dWpJmNFCVqfe5gIlmDgBMMgXny1aBKuuejcQN15TVA
	ksoeyk9nulRmHhEJRlXOcIIZonG12wSwKwAM4nCXdT2ZA/bWCQiML46Mj9r47//VjFYxPh8ZgdF
	eYk3AjDDZ7TzX4dlBG5SOLnZpXcwuxJ/uDVqxbfQ6WtVSqdjTg0TYEfEmFKPbFpLcRPUcCXwowI
	AvCywhtL0UCop/nzUO7Vj1YVBJi5t9z1DjA0f13+z40HvteGsW6DDz+T5LY4utFmxLsQM+wJOXJ
	0ODWWH4o1EZrITFvP1LmgXCyWP1/ehChBO51sSjMl5HVOGi+lWz8bXCN1hY+xtGc7UeSWWHh4AW
	Tx7O3sGhofqWg==
X-Received: by 2002:a17:90b:2f45:b0:3a4:f146:5440 with SMTP id 98e67ed59e1d1-3a6ce98e12emr4072581a91.60.1790973604642;
        Fri, 02 Oct 2026 13:40:04 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:57::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd135d8asm2467823a91.3.2026.10.02.13.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:40:04 -0700 (PDT)
Date: Fri, 2 Oct 2026 13:40:03 -0700
From: Joe Damato <joe@dama.to>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Wen Gu <guwen@linux.alibaba.com>,
	Philo Lu <lulie@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 4/5] eea: unify return code variable name
Message-ID: <asAWox4qWre236ie@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Wen Gu <guwen@linux.alibaba.com>,
	Philo Lu <lulie@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20261002100035.863275-1-andriy.shevchenko@linux.intel.com>
 <20261002100035.863275-5-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002100035.863275-5-andriy.shevchenko@linux.intel.com>

On Fri, Oct 02, 2026 at 11:59:22AM +0200, Andy Shevchenko wrote:
> In one case 'rc' is used in the other 'ret', the most use 'err'.
> Make the latter use the former, id est 'err'.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/net/ethernet/alibaba/eea/eea_adminq.c | 34 +++++++++----------
>  1 file changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
