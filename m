Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A36A264612
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 03:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791342927; cv=none; b=u2ii8JlNRew+xvF8ts9WzRxJYQFDBmhhmKwITYu6NKRG7L9sed5lLtUpnf/sGeuywTsW6m2LNf0Q4Ha1lqZHxGKKPo4nxeBAg56HRPF/zgTjuutVSogRHClmY/dKwZtxml+TtR0UqKWfHnaqmEm5P57MtTfkMhqYrR5BCQeeeBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791342927; c=relaxed/simple;
	bh=8KrDMNZ3lLoSq8KiV6wo0+UcYegtNQ3QGnSy6WjiYgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rufojGOLVTIwrTSr1ivUi8xO8mB72YHLa3cOPslMmh8d0+oN6xWyLs0e4SM0WztOSXjzp2+kT9kz2QxuOyPD8+tbLEQkwzWrdddRXEQ+x0qLSiF+DgLj9U5uBCTZiw4ZvGzdWCiLTfYA0VAvnaOvTkmzNwysBc1b3qNyF6dLTQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com; spf=pass smtp.mailfrom=morsemicro.com; dkim=pass (2048-bit key) header.d=morsemicro-com.20251104.gappssmtp.com header.i=@morsemicro-com.20251104.gappssmtp.com header.b=sM6vsbf2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20251104.gappssmtp.com header.i=@morsemicro-com.20251104.gappssmtp.com header.b="sM6vsbf2"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e6038cebefso2983225ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 20:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20251104.gappssmtp.com; s=20251104; t=1791342925; x=1791947725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=70ZhN2CxNGLiDnPBlxtAiGoFZYkaEoZZZjA+drHf5ns=;
        b=sM6vsbf2YWSY7oJHdszojc3HalFHc3Onl1DCIWv3kB7nIKpm0B6yBcA4f1XPu2fkW1
         tqYOCtpAOg9M86uPNoa5ARKYCtu+7sO23U44CooxJg2ieyDblSLHEZnVVpzADRqSLOs4
         F+w9t9S1p54P4EexO+yVFu/vUGTTIQ47ptU6mITKTP/opymo+7FVlksZJvz+aGJKTuyl
         vnB6Zs3IEGYtUS+fQ7AjwLUeeKt1I0Go4bjqypdrJc5lhjdlmhK94BbN5fRFZqbl5gB1
         Tem5rKnkgJNVB5XKDzH1+bDLq3/kCAVPD2ez9Qqtc0HDEhXv1o0S0nHH1Z/dqUa9SYVJ
         LEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791342925; x=1791947725;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70ZhN2CxNGLiDnPBlxtAiGoFZYkaEoZZZjA+drHf5ns=;
        b=hdHoWyTX41GFVVG1W6Gc+ayKPq6pwwnmUoNOGCPYi/1u0vSolKpjKa2JtSe+GZ+Pay
         PAFxb9TP0WhD4Bm/zQux1WB3tbtTNxm/w6cW39BcbUIGsICaAGVvPuJmHdTB+Ysti4cs
         7vYXIv+8bVANhLCC+PpHeUXBj1wE31sds/fpovKzlP9HxvOisDPKRPPKlrNN/4ZfqshJ
         bX8epztTJXuo7hEBYYjcSb9woqBDmniM4j63pKBbEcz6K9xG73Eq7x5TS9DM+dP2ZADq
         NmAzdeDZPNeEZiCdJ59d7cb+pAfeo1q/814CjGwkqXE8+YlxL36oQS93mcxXUBYzxdX/
         qJ6w==
X-Forwarded-Encrypted: i=1; AKwUvBy48RA3Di3Hoy+PK57CDm+tlCsbwKWAUV3nABBYgf8lbimdbaqJfU923nk3tYt/tpaGc91MWyvelIQPNhQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXXcbzK/3FdSqTprLhL8w7UHUuwbTKCv2db7HECNI7kA1wEIwS
	vn+tbSSvx8/ibPACPwHCU168DqRvwZiE67bZlavIchWMgblLZQUgThNZEjKMeg2uGsTnBewODf2
	a3Gla4do=
X-Gm-Gg: AYBFou1xJueKGUZdqU1Y+fjxBfq3PCIUP1UaWJaa86X4BW87Qwtq6cv9OaL1wNHKmPI
	vYw9dYTi0iY4ldepSGONpTVw6Xyfwiv+chQ8TLKNKYdM+Q4ciw8UbPB0ScyRh697VnzHUnl6xeY
	ofvqC5EnzLQVCaHpoIaqNJ8hQXc+HtOO8msCG7Fe8CbZRYeJvIWbKagejVtSvKoHI/cqGAU68Pl
	FPu3PP7C+jtC48ZugDKlH3P7AOqxnX9uDF/vNTCWW5odfg8W8qs9nZ49ChOtZVJOsOhVlmmDGc6
	lS+prpdwKgfYKbDiaTBLA5uR7cKscegz6yPXCqCaw18SWR1jprCu6oajxmjPz8LrnVPGneFnehl
	dzJ6HLBICdFwHQbqMuyNtmJVOO/n+OgIM/VV7oUPkUaoIf3c3FWOIk19PH14BWvIOqsy3VQ0HP+
	K1/Xn2rZj9tVWkAYz+QGRxpAOiObm3zn8UL84oVuccLVyIB3o02U2U6JTQh91UwI8TGf+kERZlD
	kN7JD3JN1DdotDrkwV1WeaDiGMFPla2kJVcJ5OIcYJ9tyMayNbgObjZgooblqG2DvyplYE=
X-Received: by 2002:a17:902:f642:b0:2df:ab36:f15f with SMTP id d9443c01a7336-2e6005392b7mr9855325ad.43.1791342925500;
        Tue, 06 Oct 2026 20:15:25 -0700 (PDT)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe224sm3753765ad.19.2026.10.06.20.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 20:15:25 -0700 (PDT)
Date: Wed, 7 Oct 2026 14:15:22 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: Felix Hoffmann <f3lix.dev@gmx.de>
Cc: linux-wireless@vger.kernel.org, 
	Dan Callaghan <dan.callaghan@morsemicro.com>, Arien Judge <arien.judge@morsemicro.com>, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless] wifi: mm81x: validate YAPS receive framing
Message-ID: <lrsghye5vfzs5o4pljrbm2ubfcxgc3mkcpyc2sbutsq6td6qug@36liwxdx6j5i>
References: <20260910201030.85862-1-f3lix.dev@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910201030.85862-1-f3lix.dev@gmx.de>

> -	if (pkt_size == 0)
> +	if (pkt_size <= YAPS_RESERVED_PAGE_SIZE)
>  		return false;

Can we not use YAPS_DELIM_GET_PKT_SIZE instead which already accounts
for delimiter length so it's a bit easier to read?

lachlan
