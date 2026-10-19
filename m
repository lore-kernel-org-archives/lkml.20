Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792446014;
	b=aOVZmQTWllazPoSpwacByqL18I0IpI1kdjy3K2NbbUKli7JpS6oMjPHWRyCtAtAXDqz/
	 kb09wze6qDFKTy9TZ8TvVEcgewkDHY3MKDd9GQLnUNBFE5f4I6mnSA1m2SDIppg1aBD5T
	 B7c2YoMp+7OxWul5Qzd1ulFmayv0Aszqj6dZ+zkARNP/0v8LxW/zXsKJ5b6Pnitj5ot/6
	 WQEKLqmRMcwn6v5O/GyyzNLbYUio2hGCwMlIQYtlhSqS6XlGPFnMrPKyqGt3AUpNMW773
	 IR0BMlyv6m0nIvjxVyey/u82Ib13H5N9Opug+oNFtTz+IjV1MTF0LU7ahtf8w/gOEOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792446014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=fbdkiBRqceNsAEo7WpDOWPS1EXWmU9r7NLF53sieob0=;
	b=4PHB5WM+SlAupxPifmOeqQdYQU7C6nhKw759ytCMMUHbiIzBok+p3QRffiGNQqjj56ir
	 0F3tHrenGwiiDQ+Y2TyocFZAzV7TnoBs3TnZnHWWiA7Y6uyV0fNc8Rn7vzCTT9fdyn+Xs
	 NaDKR+PjVODR124SwsVJ8h8PBoQWh8teSka52s81AfItxfCn0ewUn4mari6W2MKK5qGaV
	 WcXBMHa6wY5kKH9Gnv09RJpN6QtzIZyViFzynnEB0yW1amd5UMT4x0+EFd+E++lbzvsAE
	 fPiVOB5pyi+ANUqFpupg6B9OP5wWFXGzkICDHlRcitVuru3LI397/siEdxTlDFGbMug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b="D/n0/0Mp";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0CE606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB0CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=D/n0/0Mp
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso53534f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792446012; x=1793050812; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fbdkiBRqceNsAEo7WpDOWPS1EXWmU9r7NLF53sieob0=;
        b=D/n0/0Mp+g8eT01Flr7cS3DvgB/7WqEMp4jJWnop2FRFBeLFmGaSaL2LQTIDr6xMFY
         BM45uekHscpxMa1cdCQ7OzbgwllEzZBy//JVwTSKUJGtFyckIjuUbUcyZT5LGZjBl3vu
         hQd54YmOTh/piSQEuanmLVU7Ndxd8Ox9K6Q0ClV3LV9UX1Utur+rKJMSsx1vZIdl3NSN
         4quHEg+mggOgbZO2zeHBG6eilCmHrXMO0OCb3eyeajt2DY3JqAKDmGcSyf/uEML4WCOt
         Kghq/GjQaS8bzUm/+UJzfHV3y0sGrb+V8x6ib4HfrxiDjj1pyz9NAjlzYBV8AgI4k69V
         yIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792446012; x=1793050812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fbdkiBRqceNsAEo7WpDOWPS1EXWmU9r7NLF53sieob0=;
        b=cY2v4hUenpknGDxrJZQpp9zaDzQpRVkb+VqhsttALuDAPNEO/PveI6Ohng9Lz9VdVR
         eJwFovpnHuOqrAhgZ8rypti6hSv7d+iMVQHlsLLkwmqcB6pNXpx+duUXoauxSTqn3yMb
         g/e85m3jaEULgnaFyvo+6T9x6Wtny9F0sUiYE92gv7saezYHf2E9ixrg57FSFqCqKyd+
         gRXzg4xSas9au/eGOi2rZzKd+cGR0+DuHIrxDy3Av7D4WIWeP7GsUGs4+9L9NkSzNR+H
         egKYKqdCywLbyVwZ+1PlgQ831Gj2qeQjkF0zd6lK1s4CQ8UMY+ewRpfnMNGKuWKym5Lm
         YkTg==
X-Forwarded-Encrypted: i=1; AKwUvByvGvP4bZspxvZkaq+aeU3khbHNe6rFMFxPjAnrySPHdKFjTETSARKEXSHk1rZV0MIl12hDZk9ad1pOsSM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0dxkkpCrF8pT5ma4bcjJWK5Ico5aG6JVnYvG73qLanhFgjVgq
	wA/r977iBlkErzc8sjdFcu8+1cFpkIIQen9rJdsHaQgYHYuOtlmvIfGG9U0sY/Iya+xmIBcbb2g
	jr+lfLdM=
X-Gm-Gg: AYBFou2hPfDZdp6NCqPVSphaEE+zNz+5GB1reeNJz2y1LaNGBmw0DfA3kFGnkOQuDlV
	D2aLzIbZCjFz8j/rqx6l0O6PEz6IEJNu8EMuLTVVIkAWvvAJo2JZHTgAkOYVMoX9fhuX4yPTuOh
	A/yZXv2uV3KQ49hUAFIkXQaBKrqAuyxEnxwNR0lGnetx4y5jQPcuCYYQUj8lFUUUkqa/1oIQM3n
	FOfhqYpAqaTaKw24xbPo7GnMKJz2gKJGeYABUK9lAeGhs+cbsukBofZa2OY5SScFpeKKv+5yvMh
	it4aab2+CoNnT/GWFmktp5DYW1bLDMNNf3PbnHeprK86/w0HsoKmjKhD8VDlX0t/p/9JaCH+goA
	KeDbQg6Hj5hQN8CBUo0uZHLLBN33RR0zL3xBkhg3shaxyW/VCfglcLw3r0qO05uurwleUqmm6kh
	9e3Fk4DjB1QVEPK5layqpjX5g1IUCJPBob34FFRpRDFz4iy4UnknxwukRMsGjGYgtzeGIOqkTPb
	p2nfGHZurYTqg0mREdVyU47gcfcug==
X-Received: by 2002:a05:600c:2256:b0:4a1:e478:7878 with SMTP id 5b1f17b1804b1-4a1f53dce01mr4437525e9.18.1792446011568;
        Mon, 19 Oct 2026 14:40:11 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e1d83a338sm1464721f8f.59.2026.10.19.14.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:40:10 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:40:07 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 07/18] nvme: Introduce FENCING and FENCED controller
 states
Message-ID: <20261019214007.GO2931-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-8-mkhalfella@purestorage.com>
 <179242929827.3619480.8550407233438315193.b4-review@b4>
 <ebc2064d-70d8-44c9-8230-5ba4b24cf5d9@flourine.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebc2064d-70d8-44c9-8230-5ba4b24cf5d9@flourine.local>

On Mon 2026-10-19 19:18:32 +0200, Daniel Wagner wrote:
> On Mon, Oct 19, 2026 at 07:01:38PM +0200, Daniel Wagner wrote:
> > > --- a/drivers/nvme/host/sysfs.c
> > > +++ b/drivers/nvme/host/sysfs.c
> > > @@ -542,6 +542,8 @@ static ssize_t nvme_sysfs_show_state(struct device *dev,
> > >  	static const char *const state_name[] = {
> > >  		[NVME_CTRL_NEW]		= "new",
> > >  		[NVME_CTRL_LIVE]	= "live",
> > > +		[NVME_CTRL_FENCING]	= "fencing",
> > > +		[NVME_CTRL_FENCED]	= "fenced",
> > >  		[NVME_CTRL_RESETTING]	= "resetting",
> > >  		[NVME_CTRL_CONNECTING]	= "connecting",
> > >  		[NVME_CTRL_DELETING]	= "deleting",
> > 
> > The ABI documentation needs to be updated.
> 
> And while you’re at it, what’s the impact on blktests? I can’t quite
> recall what you presented during ALPSS regarding blktests. Is this
> covered?

Both [1] and [2] trigger "fencing" state. [1] focuses on not seeing
corruption while [2] also inspects kernel logs to make sure that CCR and
CQT are triggered when they should. There is no explict check of the
controller state in these tests. We know that CCR/CQT will happen in
"fencing" state though.

> 
> Keith, Christoph, and I are mostly concerned about this patch.
> Experience tells us that anyone touching the state machine will
> introduce regressions. Because of that, I’d really like to make sure the
> upstream testing side is covered. I know you’ve run tests in your lab,
> but we need test cases that everyone can execute in their own
> environments, and blktests is the right vehicle for that.
> 

I documented part of the testing I did in lab in my ALPSS slides [3].

I addition to [1] and [2], what kind of blktest you would like to see?
If you describe the blktest in detail I will implement it and put it for
review.

1- https://lore.kernel.org/all/20260917020752.1672578-1-mkhalfella@purestorage.com/
2- https://lore.kernel.org/all/20260921205951.3023714-1-mkhalfella@purestorage.com/
3- https://drive.google.com/file/d/17lt_H3FxeoDSWD8q32diO7e03JYJaimn/view?usp=drive_link
