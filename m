Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505F7339395
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965635; cv=none; b=rM0NQXje6oJHimaSa1yE5CIH3myOmtxswDNqYS4yodD+EjehhNvzuWBxxRctHpdLNKQvwNu6m5sR04uI+QRJidGZh7yTGHNWCvxW/NGyhuKUq0ZZaFzKpMjF5DJqaweGT+NGVPq7zxSOpO/2pCJ/QmYYQ6Mo2yaQqGK528/espo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965635; c=relaxed/simple;
	bh=pguejnL+A5o2WGc+BMCSg4ArHq3ngSz1/W9peL5ivCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qq/Arx+xhZ6+sxQli5jL698aoCKgezBudJLMN3Bq+MeaKdMnuZ8S5i1M4SenzmXkgT/QJGl+/8KL6H8bxLlz7A+khY+JF6C6rdO4+rh4sA6W21pqZej0FmBQTTPY2m7ltRurHS8kwZNeqy7ruQ9uwMJj4yynuPPtl9j9AuOB0QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnzt8wzW; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnzt8wzW"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so445902a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965632; x=1789570432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ILVFuBMzvh4BwWf3OUKzP/jCnh2cpNBkpAfMu20Dtes=;
        b=dnzt8wzWZassIOtc9l5vOyhuu3SZgeMyHDyJdHdwaVU7OaiByUmzaMaxRae/8QDUCJ
         TtT8GbZFBZPFjCvwtRv5WrCa2bVYeFyMfl3ckZkO0ohPj8X/QFr5RoQ3hw/q++DFz//y
         SZ/7JbWAE4rUlwv1uXPL/fSNLuZcL3KHTTc3/Yf8Am+QLUafpBSvLuKQymp8FAeMDDW7
         RT6Fs0ALRtIvzT9w8OO9B8+Idj/wZEflLLgqPAuVWY9o0SKckpNZrpXgCCb8Fm8/ZgxR
         P3gz6Jz9B29i1wpxjBPagsoIqUfbi6yPtQL3/9jXDjdGANlavB3oyG1A+zWnus5LZpk/
         g4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965632; x=1789570432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILVFuBMzvh4BwWf3OUKzP/jCnh2cpNBkpAfMu20Dtes=;
        b=Y5tPYY/Xw1XV9GH0y+IXY9CBj2MliI5X8tUZ23G6Ng/pfSJHHgP13xV3pOPCBIJUtD
         /Foljzwn/vj+cONXnj3eOqcXX1hEMuil/qynJqgBtZxGUlbpbBlQMW3N73Y1LdPxY3A8
         9BJaCuH49V2XvfvCVeDc0H0Xq+Sgo80nQo5myavDhhWlEs5O40fDGSfsoYJyD6ZCTwd8
         IUy5gZxnpToYETl6tEZtHXpava/d5Ki+MsQF3qhdHZAuRw/QsJ6eAZoEtZzEhz8B/j7E
         /XJzNStLG4Sx/UitlYt6pzQA81x475K/NCMNzWl16JRVsexoIJdKICZUCqFjaHkchBkb
         +eHg==
X-Forwarded-Encrypted: i=1; AKwUvByyw6ebOQeg3IbveeiXyHH4SJyJhVM4nfhiU2iHtxaM5MRz59ZYUu6uPKvjeRz3QV5sX1IxQFNeNGodqG8=@vger.kernel.org
X-Gm-Message-State: AFuF++mD2TeeFjgOVH2tHnkguhxpZZyp+80zgYE8KC0aMe9hN4cENpni
	0A8yae4ZNM2YhmxD1MpVHZjhP4zAVpMomaRyHkL2zEERSzEqHaB4ZyYC6ITsQEosOKyT8Q==
X-Gm-Gg: AYBFou1nFBTpPv9kvLSj2ATG5GNdC+5wEUJc0/eUnjWp+6X0zT6if4nFUTTBffJcR5/
	eKhhNVji7lLqOLoF5bkwDo3+Tr6qbJXeG9zuU/KnAaoaeza7LJkfI6NVsYFUbscBHCIUw9vV+Sd
	ArZMFnPpjaUs2fUBCzQGp00TyDbPTqqBq2gf5EhXXUHEULjuecdgg25sjDB+JWwiYRNsx3L6w/f
	9ZqjZayEA6BR2ZQNFEYvrM6Iyd3uaf7ydOPlJB/B/ekn4eEeGDiTbmPREbO7nYJLX8xNHM2H3dq
	gYXTiovtOXFLkCZ9zEp3HgZIi3hU7kdZ9wzPxBG7JZsXrbdHdUeLqMNje1SZVGjIgvsKiuWLPNX
	S5ySfWWvU3LoLqyaVP5S87kE5Yhl/mow+ofSRzoJzLqAyXZbxkQHWfM9CdgWMqa88hum+dfCgXI
	YEuKba149Xt19NNhXyhVJW60B2b1yourrBiOB0DnJLHqmEsUtic4DNrDCWBEAYbUZwcHQ=
X-Received: by 2002:a17:907:c60e:10b0:c29:4415:2ebb with SMTP id a640c23a62f3a-c2944153128mr14700666b.8.1788965219439;
        Wed, 09 Sep 2026 07:46:59 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26e956ea81sm582118266b.33.2026.09.09.07.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:46:58 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:46:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: contectforbusiness@proton.me
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"rmfrfs@gmail.com" <rmfrfs@gmail.com>,
	"johan@kernel.org" <johan@kernel.org>,
	"elder@kernel.org" <elder@kernel.org>,
	"greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] staging: greybus: light: add comments to mutex
 definitions
Message-ID: <aqFxXt8NJ8bMVUV3@stanley.mountain>
References: <PqjvDjNm1A3nH3BCu_rlHx6YLIzrr0r8McQL1Xbg5GX6VcF6GW49nKPhkTIcHashk4ktOEARq8_izQ6xyFqeWAliK0JqQ8MMPOrFIXSowcw=@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PqjvDjNm1A3nH3BCu_rlHx6YLIzrr0r8McQL1Xbg5GX6VcF6GW49nKPhkTIcHashk4ktOEARq8_izQ6xyFqeWAliK0JqQ8MMPOrFIXSowcw=@proton.me>

On Fri, Sep 04, 2026 at 05:56:25AM +0000, contectforbusiness@proton.me wrote:
> checkpatch complains about:
> 
>   CHECK: struct mutex definition without comment
> 
> Add short comments describing what each mutex protects.

Is this an AI patch?  Why write a short description?  That's the
opposite of what I want.  I want a complete analysis.

> The
> channel lock protects the channel state and lights_lock protects
> the lights array.
> 
> No functional change, just quiets checkpatch.
> 
> Signed-off-by: Vaibhav <contectforbusiness@proton.me>
> ---
>  drivers/staging/greybus/light.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index cab02b5da..a036fa2a0 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -37,7 +37,7 @@ struct gb_channel {
>  	bool				releasing;
>  	bool				strobe_state;
>  	bool				active;
> -	struct mutex			lock;
> +	struct mutex			lock; /* protects channel */

This comment is useless and wrong.

I hate this checkpatch warning...

regards,
dan carpenter

