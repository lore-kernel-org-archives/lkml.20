Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5555A374E5A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791865350; cv=none; b=lRuJlRvVcKUFeVeGn4YGgAGdCbJGPs8zTpJAN5zpmQqHprc8GvXd9O2S6FF4ZhcUB7x8e/Tn4wSp7MH3lIDSWr0ex7wr8we+GVH9FT2egzJdgjO5wBELEVv3XB8vCLkuyFHO/v+UHJsk5sdLvBE2OmyHKfI/9S0eWUycQav2pOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791865350; c=relaxed/simple;
	bh=+K4HZZsUyx+BZ/jVUFt5QSnww12hfGtHUXInz1C3T8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2oLDMq94VlEJKBt52m5uSu5PbUMsWeKWO6hizRQvcBJWitine4M3lUHwKNZS0m9SA7tyn82ZdZPAPD06yAHb1JB8dJyktKX0OxSZz0u8XCYNvJ0YLH1pn0jSW79l0RatHGnecruON5VlHyUnKvVvnrz0PPUoK2lsj6xB8m4vUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AeKdo/IK; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AeKdo/IK"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso1521633a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791865349; x=1792470149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=moe1szgBS8qfOMQ+dx39iq+IYSEcWmwG3cQfQWaqcvA=;
        b=AeKdo/IKd/Md+Sf/OL2oNjaEijynaXekhX+r/J0FGKDhOIss/7IUw9XynWO2CyD1HT
         LOfyggL9vIlq7KMg7afdFFs5moLsw6ukA/ts2aiY6j769/VGYVSS135VnVpA+MxGLYwL
         x9UxDKfwpyV4nCUTTaJzsNQeFeR+fgi130aiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791865349; x=1792470149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=moe1szgBS8qfOMQ+dx39iq+IYSEcWmwG3cQfQWaqcvA=;
        b=kivCPpyVitubjP9jHl5aarx/IsGD+CFNLWhiG4p34PM1Lgm42/hCv0HWmKKx9+3kdQ
         ZBAI6L/XnqPfc95R0a0CuleRjKeoIIQRbkX+Kof56DgGd3HnDP68rsR2al+1A0N9ThoP
         mZFM795/nN4Mqm6SjT8TyUEkRzpgVcwEvGtvkRilpashCnHy2XRAc7ks43Rpd7s8Izy7
         1douSoqYxSp0aUAArw37NshZnZu5lfx/RJqlgEnOHIGD2m+gx7e6qy1f1g/TAMBhSNY3
         KybDeMNVCHFOVci7oOGWgKE6Ej5wQ6y57CofuiSZYRxJz10vQjTujn78JycuJ67VFusD
         zxhg==
X-Forwarded-Encrypted: i=1; AKwUvBy0DC2gmAc4di4tMOhrsNN2hNMfnxuR0FI90mQhfUPLLMc9A7RUhlpLyRYhFwg2nUljmuGXcjpJDdtSyv8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiogzWiwB4FkWi49qI+PoWT+xr8p1ntU/X9ugrJMwVe8aQkSnn
	9Y3c6jnbKtuzPOV5qdBSLBY5UXaG9J7wIdk0/EVJsf9bVypjZdanWIbEpyIiiNVODw==
X-Gm-Gg: AYBFou3ES9+GWTru5zRDtRut4SDgBC6uvLjM6HZz0z2HWvnAwmBhE2VcpIZ/IQzAZQB
	i+o0L6DF1y43ut6bJEBf2JlNspc2T5ER4ob3oao3w09Smfwn7x7/HNBbIreKFXVBFPv6K0ssEar
	IDPMKr17406mpMe1ggpzGONf6tYvkmeZv+H2O9Ad/KyLGSqV0Coly/gf+2DGr1xxOjrVG2eAI8E
	UT5XZaTQHNOduOq57W8QYb9k0Hgzgc0ZemHh0lSS1LIrE69NdeE9P3IvDJgdRVoMEzQN50Ggkey
	Uf64vfmKK+Df/ppY1rGIKkh4lEs6Om7Kny/pa2SOFHp2iXr3VLUC+E/UIadUDQHaHlsWqOoHipf
	KUcL0Z/RLXnJF116WoObYSAe2qs6GjF4eFnOSF1Z0f8ayjP1uNT8aiEIZZ+hMz4IKrfV9X9g9Z8
	5VS2+LRCKPwBFg0b5fBer+6icUp+dThh7kExcZSWxq8ixdIP0nmw7FX1/KB7VKblxCM2Cl8HtL6
	jsoBCwTzkOESNcdnUVsh9vER5FHUKQ+B9FgGQ==
X-Received: by 2002:a17:90a:b90:b0:3ab:be66:ddb7 with SMTP id 98e67ed59e1d1-3abbe66df61mr3465361a91.47.1791865348806;
        Mon, 12 Oct 2026 21:22:28 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:476:d384:7c2e:1579])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39533ee7sm11566916a91.4.2026.10.12.21.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:22:28 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:22:22 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org, konradybcio@kernel.org, 
	abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	minchan@kernel.org, axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	djakov@kernel.org
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
Message-ID: <as2xrbm55Sjq3T1M@google.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <20261001-dramatic-hasty-pug-68ebfd@quoll>
 <ar4070oH8lRCJMRw@google.com>
 <6713512a-d879-4fdb-9138-12e125c21ed6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6713512a-d879-4fdb-9138-12e125c21ed6@oss.qualcomm.com>

On (26/10/10 02:54), Georgi Djakov wrote:
> >> So entire qpace should go here, no? Why did you create this entire layer
> >> of indirection, singleton management under drivers/soc?
> > 
> > qpace seems to be standalone/independent arch/soc specific, and can gain
> > users outside of zram (fs compression, zswap, etc.).  zram's backends
> > potentially can disappear all together, if we switch to acomp crypto API.
> 
> Are there any plans for switching back to the acomp crypto API? We moved away
> from it some time ago and dropped all the crypto dependency in favor of the
> custom comp backends, right?

We moved from deprecated scomp API and switched to our own comp API.
There is a possibility of switching to acomp API in the future.
