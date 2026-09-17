Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BCC311958
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789607430; cv=none; b=GfMXIkqnji79omSg6FJWQNS7YiXoQ0vtMsI3AU5xCBChYHMXC3x6gKsxlUOuAhGWISmQxk423d56s8yfOi8OOfM+OrCiiJyleisTcUmyc0EoAM8twdLeVyu5Xfr68ce14J1QY5EtWroDgMKsT56bUeGvi8zrK4UkH6aSA0z3HfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789607430; c=relaxed/simple;
	bh=d89DZbU6qSxHVFReirp4z+F8nAR1vhudlk9+d6a3WxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUNqM9cM2IMvQQachPiY7u8mKGe5QcZll/vwNXNHZfaUjZntLOaLXcwl0S6lbFV+Hxz0PlwUHyrTHvxvzycOMi2tQI6qDB6kaaRQSRb2xmbDi/u1IEbpfFGpTHMT8iwYhzsADPVFEW7TLfs58YTZ1vZ1ZpcwyOM/ARa0B3lJvaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYwxpOdN; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYwxpOdN"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc50b9e8a45so157125a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789607428; x=1790212228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dq2fKZpF2ZHXoWdO/QCS/aYMwaYmBqIaG3WsHfdgCQk=;
        b=dYwxpOdNsllifx6zKm9MJTKYrX8DCV3QiSvcQp2dm9zavIWqYWfkAJtITq5Cd6BW1R
         yqVXjWWgZi4mOdnBnF38XhgY2Awia7PhuLfR/a7C1FYSDOKAoErp1sh7k+HWJ8hgPq+H
         PuPETgVS/4HiBtoWZBtzCKeCya8UuKRXDqFKIiZEBgBJPF6GfjzFzMTLcMLD7MY3wBUO
         jmB2WdezzRTrs8JEdbx80VAw39Sn/8REm18oGZqsVhai12QgMjfxX0LnrhdfERqeqHR3
         HYfmU3VIUqR/2KxaJfLv2fz74BXmcugYto4SQgwVpN62IMdgMdLzNgKN1zKCRJwOBlmC
         0GZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607428; x=1790212228;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dq2fKZpF2ZHXoWdO/QCS/aYMwaYmBqIaG3WsHfdgCQk=;
        b=yS0p70O84yf9Ehi64C8wMnqlVxvizihEILQ/qui/tfLHQuSQp2GdWzfS8mN2hpx4cT
         b1k9g2RRtTpRss9FuwSaP6PdSbPr9fCUezmrZnsz/Y9aKU3LPIJifWrI/JHouxg6W907
         GTTZokeLloRxO9TAq5NaBhUWhuKVYwlMTAEd8TpoiXJrG3sjx3OXRM3BuN1e4UVJzOe0
         7e3/dOJ9DtcvCNSyAahKcbk3V0caoOSAArEYrQawNnrxFqOIelc5VIVvvQX+vBjjTvjt
         tAA8i95EfA6YPIEvAhslUJs4HLsg2jdNpokd5okZGM4+TKPchOGFZH/tYZPlYYqZ4aYP
         dBfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzznQm/EhANbw0zSOmNs4sn5YcByIYcI/G0kZ2czT4DVRrCLUQYIFKPCX1Zatul/DirJp4DImBlvYd5qSk=@vger.kernel.org
X-Gm-Message-State: AFuF++llHpBD8ZQSOsm39vVs6iMYALnZgskZUpRinYyqSe2AzIWNEh9l
	7iDAqmPViKzxprWBD9EzntFUcJhi0wVBpONyx3sIZ2q8UAfUJcqhi67A
X-Gm-Gg: AYBFou02CixRo31sLqbhjeuCQ1H5eCsbdF1DPtk8JGau7S/n+BrzLIUtgojQ7koLRLg
	nXzZl5+a689hzBGSYA4EiodMKghYZYE1iO+iztxDuADx2SSIlt7vN6rNfVPxF4dkHzFGmjbubLO
	D7tOFIIg9C6uKlf/sYDtoHhnbv7AxSx872Ii0MufHCMyy4IgvHoFqMVJZGr+BEvkIP+4NJYqJCk
	qt8kUkAZI/XOX2AyHhOtSKuzAcmzRnd6EK0bWgOPt1aiymq9dwp1+ugC06tn9/N2Kab59TTVROv
	5de5FsSnmcku+Oy2hA/3kGbfIhCmAhyqbStCufKRShe8nQ2cKqNBpcW7EOg/g3sfUbNCm7z5/C/
	vOxChw+lKEJAJpOPqV2H6ugdUpvhCn/TEqisf7mniih+2HoPKYVrP70ViargzgsSym4OFBtNO55
	idyQLatsFV23k40xW20DIBzgiB6eUotU6rMR+3YQ/T6yU/ePCWN7K20XEyrszyu7ZapfZNOUGZV
	pbl4wuFGxq9
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr14917254a91.20.1789607428438;
        Wed, 16 Sep 2026 18:10:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3909d02asm353486a91.0.2026.09.16.18.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:10:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 18:10:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/8] watchdog: mediatek: Add support for mt8167
 toprgu/watchdog
Message-ID: <befea2ce-e4a5-4bc0-ba01-d18c4a236667@roeck-us.net>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
 <20260908174259.9009-5-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908174259.9009-5-l.scorcia@gmail.com>

On Tue, Sep 08, 2026 at 07:38:31PM +0200, Luca Leonardo Scorcia wrote:
> Add support for the Top Reset Generation Unit/Watchdog Timer found on
> mt8167.
> 
> Since according to its data sheet mt8167 toprgu reset bits are not
> contiguous, add support for a reset table to the driver. This lets us
> define reset identifiers as contiguous indexes in the binding headers.
> 
> Also address a preexisting Sashiko finding that noticed that the
> has_swsysrst_en configuration was set after the reset controller
> registration.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Applied.

Thanks,
Guenter
