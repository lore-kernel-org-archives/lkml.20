Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4C557D22F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883479; cv=none; b=JyeXTj9zYpWJi1sOFWh8f/JqQbBmH4nE7xSMvKKVXCRVwKff37KgrMIW1T4QmbYIS2A6BMPPX3GTKOSyRFU+4UnfYwkBXXQox4mFQf1RXkthOuvzmYefjuDhjcPlC8S25ZCNGyyWi9a2C28g1iv3iy2KyQmmcF+VzUHgG8EVY0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883479; c=relaxed/simple;
	bh=gVHwDpb6HBHtyoUlDRtjlp7YtX5g9j3oG6AFmVF0QMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyng2TSjZq+8x6VRPtOORvQFG4uABQAMMHH/uVRAma7DdQE23MHDu4m4cgbsty4I1fdS2fU1GnsbVS5HGOq4eCszIx2KRmpu1WL4tRWHU9EH8xu2ZKwMjaKfZyJ0yjsFSoWvllsJntvUpwQvHW8vvo+cnk5TGOHoahaD5zKnbYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJ8Bws0G; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJ8Bws0G"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398b3d66515so4643182a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883477; x=1789488277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Tzx5UI34JujonmDJzMPjBkhAE6c2rwa6ggnBzBUQec=;
        b=LJ8Bws0GBV/ub3Kj5tG7v8iCXHMUT86wS+IPOEVoj30052ESJFIUHpiXmkA7sOT3hO
         NZvSOf3l5SoOeGWv/shV4FdvXYACJNfUhpGN6jDk4xEBwmDOqU0gnfF4b17IsS/boewd
         4asf7mZ4iQ0MNFmDBuncx4lR3MAR9VQyxM56/LaqOCYFoarZw/8o/+jG61zIEn1jmklu
         f5MlfQUfpKS92+vAet2OinbuiCgYwNs10Fe/1pMydBr7fMCvb7d/WGJJMKP6C59eKSw7
         gxsZpbFrlaPopZqX5qOTOVA0UEvrRJWVGiSMfUXGt6oCcLUX703lUrbahSlDObSG57GR
         lnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883477; x=1789488277;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Tzx5UI34JujonmDJzMPjBkhAE6c2rwa6ggnBzBUQec=;
        b=WGSt25IwQ5JYDFwUTekRxWdkP1k2Q5FkA0SxVGMw89clBQzzX//on8KcRyqIs3TAou
         Ytre5A0YSqx1sM/lbpQ55jpRrj7zsH7M3JXrYfiUtis41qWgrYjDUiIt5YV6V9E280Fc
         qk3T13yOl+nGOX2nXRCmWs1AN9+anmt4Su71ASOYakqFjpqIc7MRmrr5JedpW7Um2a9R
         CPD8DW7ouoevA75L21A3aURNlthgR1xHSb3cCHVU31tkfh6rKTWgpNcjvhSUXscBr4mh
         Bk36SuYyMe04EMPtKy1vi4oloKWlen19wZ2sjDejWeJYilVEBo6KE9bhBrPqnOk6TEgI
         osRg==
X-Forwarded-Encrypted: i=1; AKwUvBwkSaxCPM7IbJVxTTlbeRmi/NVMFh7IGdyAs9Z2M+Jubry8yCFT8mGF7ogDiOD0IKA4THGOaWHDqdrttss=@vger.kernel.org
X-Gm-Message-State: AFuF++nqeuQI5MUMutK6gbHXlnE8/NSX50g5biaa0F//k5GvyGL7Xoq8
	yzWfEWDOWjau317OnyE2i8HOBiek+QtgFFNX81M2mSqXfzkTjFGWqUVt
X-Gm-Gg: AYBFou2tI75GP8K/9g8dWKaUu8diErcnYbH1EgTMntRYsPt4pAPwt/8aOsDfrIkCoCY
	a2hpsqfv02vRTusNeN8uvXzvFezQjp+ZJos/cSPXkgdQf6/J04dkkYx6sytAIg5rxT7YpvCLAbz
	KbU0ROSBS5m3Z45b4LX0FiQHNXgYZO/XIm9ehZIJCtB5gla1GwnfT9qbdKNKu/ABJWVBdyTjNM+
	0xWTtARtFUnyCLYblpsa9URb+la9jpxZWW1d4Fp3UB195i/ubsVlcK4zaN0Uvb4oiEbdN25uGS5
	iL8UG+hy/JIcM/Qio5jNrRrkETXuqPevc/Vdb3jQjhBDd9XKUg7EZl+iT63peaB/x6Zq7iLeJhj
	ujoKKXjKp7zMoPtZEssl/FSfsjpuakMzkxpP6mjZVZVpJpNopsM/ydPlA3Ilwccw0+tcEzMvtM8
	ZC8i1uOUF4tlRFzo7HIc7m5yc2IJIfCQXNFgNUwsYckSnsJWMKCLAktKTgZEDGjcmnSDgdkbwbb
	wukWRY=
X-Received: by 2002:a17:90b:1d52:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-39b26242a20mr46112186a91.19.1788883476937;
        Tue, 08 Sep 2026 09:04:36 -0700 (PDT)
Received: from kernel ([45.251.35.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm37459495eec.26.2026.09.08.09.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:04:36 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:34:28 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: clabbe@baylibre.com, davem@davemloft.net, skhan@linuxfoundation.org,
	me@brighamcampbell.com, jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: amlogic: Fix IRQ handler return value and
 fallthrough logic
Message-ID: <aqAyDJq37-mCJL-2@kernel>
References: <20260821151243.8125-1-raizudeen.kerneldev@gmail.com>
 <apox0f2D6bYOYOnj@kernel>
 <ap_T2wCesl3whdJV@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_T2wCesl3whdJV@gondor.apana.org.au>

On Tue, Sep 08, 2026 at 07:22:35PM +1000, Herbert Xu wrote:
> On Fri, Sep 04, 2026 at 08:19:53AM +0530, Mohamad Raizudeen wrote:
> >
> > Just following up on this patch. Please let me know if you have any
> > feedback or if further changes are needed.
> 
> Please repost this patch by itself since it's not really part of a
> series.
> 
> Thanks,
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

Hi Herbert, 
I have reposted this patch by itself. 

Thanks,
Mohamad Raizudeen
