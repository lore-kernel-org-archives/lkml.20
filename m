Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23FA49B208
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286849; cv=none; b=WcyR8+Fv+0FmcuEwKqReN0xy4V6p5z+j2+easQ9gf9ylrfuuSvg7O2BI37w/DkQlT89p3WExcH7GFqOgAoH+lsjr9VqSWp35TZdWiJM5fMWlgJ2gb4BdfdrIx0GEISIqNhFwJt36GYy4w644SXpGDbeH0L2gTgPS90PWhJHM3Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286849; c=relaxed/simple;
	bh=F1uDnLLt09jAu6uPxu4zjvyljq+6I6azGiNzLe8ARLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9fy4T2KFyq5S8c/h6MjFykORZUWZNQDaZfNdjNG9dCbigmPX6YKKArfxVRBts7IdXGqvjypdaPg2kWE02gjOKXIxO6SC+aGwBYFwWDv7qpy8oaA3iVvVUaLB3RViMW6t4yVLXc3TL6JAb8t0YEkOgeR+KROGGMYjaRd1ukzY/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjUr+uqe; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjUr+uqe"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d91ded8174so841605ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788286847; x=1788891647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3WURu6MV41ZKEyLd9Tvh5YJYuoHYtnnpkdX51W0dyxc=;
        b=WjUr+uqeLqs2kJ7kdybTOXpOwsWKQG2KXuUcy/NIAVDOGP8bDle6Pkq0yEYoI6tpP1
         YUJoOFKNL8/MvoL7GfU/4R/et9UAdazXcTbP2xy9uLXfiyH4wm2tZ7SjXezDAK4yG1/w
         VkQpQfHg8rGRb826B2pgCPiix3/m4GnV0W8H07W62tlHEiDEdVrAudbbhkuyJdzfZ8kM
         yHFtsh9Q3sgrUpLNWQhJFP2WYe//c0qy2vshyssjyXLl8MX+RmxQSQSK3HlmIvOCJX/t
         y2vPX8MpV/OkO0kVOXXk41jgwlHfCWRlZCztpKKmFwiJwfdvTLPTRshULODwZqfDP6Lj
         OqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788286847; x=1788891647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WURu6MV41ZKEyLd9Tvh5YJYuoHYtnnpkdX51W0dyxc=;
        b=ZVQgTUZt5NLTqDwTiL/PHr30JtOXOxpmMztaK0iByIWnF3FnPncqpqQF5ek9eNmQ+R
         wz0GQ8/Xtu7tJSxuf0hRdDCLF6YCyBV9b9hu2xra8iINbSPP8M5ftf+g6M/fRBWmA9My
         01J77SkS4/2zKjhayTkKgSInp125T+wqSIwHEgpHdwMCupj56n5qS+r2xAs7bRIvs0x4
         WLydckW9jsOnY5mCRmywlE0J5fEqvV0CVDMSuLxbZLJnbtiDFr3u69AhpNImc9vwIQ60
         By0Pl5C3vHszYlInrynGGQIj4ckCcLdAKJdFUSIeII5IZQHSuwFNNUKKydVyGMJqy1yj
         lMRA==
X-Forwarded-Encrypted: i=1; AKwUvBxL2zkU/Z8Ircz1KKWn+0sBL3YXJ++2s+vT0yuukpLqehHkKKfSNjzExeMG00nydU5yPV/mcUyQYjwQSd0=@vger.kernel.org
X-Gm-Message-State: AFuF++myXkBL8zwJkI8BgrOoqaLxywQn/uVT6lj6qfnOY46UF0LBf7fZ
	j3dqU5tIOdVHixg3W3MhgseuUg3TMC8z1XsRI/35aOdWru3NXgNrFWAl
X-Gm-Gg: AYBFou3l0YfNQd69kHrj+tXnLnYQ+63eATbbYFcJhiknNN1ZVW+aB1W4vUDtwpD1nmL
	W31XlYcYedgPinUJrx7ljIC/4HV/ZsfUx3pdGQHgpdeO/9Sutn4sv1vRca+mzazGvSTBbN226gx
	H83mkicIQe80VkajaavxCbs3UjUXvFsoIzMlEpbDCTsA6u4xdQfJ3oD6jrsv08s8k21Vnh5GJZ/
	HGBazpMPDIlzA67JT9cIAKDVOFULLhY6YSAeU+4b5mxZIzp4pUBDVgL3iVOE3iLNI1noZ3/dsl+
	hwiSSiFk2Em6grpba//ywSn6C44aaYfCF5V1RlxYZG0EJtMTuJpCkG1Z0xU6pDGIcdyQSVI5060
	YRNn2TZWoPRFiMyOqunFv49SxlNjEAhmuR88RoN6Poa1KERl6pSXz4idPdQYltLuW+2lAqeo51v
	Ul+5+XgcaGiiFVrQaLRZb/6SzuDQtwEYgkbawcmo/34gEOraVsxzQig4LLVdvXqGD7TohnnO6lz
	Q==
X-Received: by 2002:a17:903:388e:b0:2d7:44c5:1a13 with SMTP id d9443c01a7336-2d74df17b06mr563832395ad.8.1788286847002;
        Tue, 01 Sep 2026 11:20:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd4c4430sm2246455ad.78.2026.09.01.11.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:20:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 1 Sep 2026 11:20:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-pm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: tmp102: Document TMP113
Message-ID: <8b069d9c-1887-457d-a209-586eb4e05e88@roeck-us.net>
References: <20260901174847.97261-1-marex@nabladev.com>
 <20260901174847.97261-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901174847.97261-2-marex@nabladev.com>

On Tue, Sep 01, 2026 at 07:47:55PM +0200, Marek Vasut wrote:
> The TMP113 temperature sensor part is register compatible with TMP102,
> document it using a fallback compatible. Unlike TMP102 and TMP110, the
> TMP113 does have additional unique ID registers, it is up to the driver
> to handle those.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
