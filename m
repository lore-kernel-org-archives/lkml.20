Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DEF2D1911
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788303753; cv=none; b=ihbFGZYF7BRUiDozRwqux1HXoekwuq8nZdrzOQpXhEUyAuh67viPJsn2hOtkSfHdtpfYkAbZ8fSUIZPYFtt2JjEu09bWpBrt/e94y9fYdY3drOLJfpEIlpXsFsLlZ9UdqJTwQagiYgXKQGC8h7I+FoGsGFpnxF/MxFlkFUfPK8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788303753; c=relaxed/simple;
	bh=+gQNNbFnTumXT0iR+hM/RV71lEvWRVZyc2oX0tZOSvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZjKBJk+AyGBAnVd5g/NogCKDEI3zH0fcJGMa4lnmW6TUq2ISDOkN0gWfW7ZOWN46ZMyGVXo/GjXPHN0CbYpCNX3XnZVJ7PpsC0yv2GtvbHzH5XeUVktIrjGf/m3/MiHJV/eYlOaDHKMSdQABa0vae80dgIZ8ytvvz9pQy2G2vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7ftEzpO; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7ftEzpO"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so399852a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 16:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788303751; x=1788908551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5lRubRw4r4a1yQYYdGqmoQ15QOh3yiGEv0tXtGD7fyY=;
        b=J7ftEzpOPG1HgpevbZNLDEqyoCOUWbIxUnBT+8jlgepqe19I3HTfPFb/ibyekrzvbR
         Vbx96CCkKBMjXtSy6/bDzYLjtge4pkTp1JDZoLnhpnfJ+Awcso8q39dZUzjDBAQAo/fq
         3eu8KrfHy0xNgMROd9cpjJsVL2lX+IfcqSOlqjElkJoUZup9BETgT+zwpadCuvcGFB3x
         OcH4GJU8idrUyB4thB2AUt9lGU4PK3ZIZTKCF0vdoL9AbfcotJatayN6ONCfTyMkKvfA
         PMcfA6hF9kdzmowsCD1rGskQSxtQFIKdd37oQbPaCMRrSlWBRsPiDqpiOC4K8D+6V1Ud
         604Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788303751; x=1788908551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lRubRw4r4a1yQYYdGqmoQ15QOh3yiGEv0tXtGD7fyY=;
        b=nWsnXXtznK2d1A08rd2wMpIFVbXyh1D1n5Y8JcnG41bzcBqHJ15qYGY/Vg/tCbnp9S
         NL/pNasESkT490ojE0yQTK9zrdmJFxZP+Sa8621fuZ5dW8nRr47Jf+9l+S0fnRg4PbVQ
         dy0vfgUuCijDUmFdEorTjnDuDOKUP0FzEgETCsdsv9Y6v7ghLPkXXXv8/By+x2HA47+d
         HdTX9zw/qjUnXpaEJv5UCvTgqEvDZaNWfwitxG2oGa0bWe88f1STBGjmO4p24gwqNZlr
         2qIO5BtBE5HGoppFsK92m8ikQvc0luRvvydMk4m71at6ELuGNBrSYOEdZZM83cyITYK/
         42Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxovkPn68Qnk6H/23NoNMzN4zCGClfvJtpEvBnilJOfp5hsWdFe+IX0lZ8lkOdDeyJa5IPkJiPUiYP1+iQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kR54q27ZHciD1YMBudVrmd9Q5CJgaJ78/NNZFt7i+UIdN7enT5
	Uhfq/cPK2dnut/QJp3xYKx+H79FGNwhRimlsY1tPmQp0f/KeyuYyHRoq
X-Gm-Gg: AYBFou0JvBor66kZ8Nf6DV8P/90rJZKX8L2iHV//UdZOt4eAbu7Q1roJkA5K6TRsiHb
	I2K2RIdIa9bwr29n6T9XZ41YcsdcsCq12fJEx/EFvcdsyszdE24BiCTdRtbI9CteB9pAxTdDtIM
	lLLVcWF5nusGt9seRm47ppHzR3iJNckMGqCVikdcQHfOPYKHbGiUgNIg21VwBDzedJ0gGL6Ifg8
	Oj4+mM0v0IKZfXbceITD4eHQ2/W2xh+zAZVnFZjTMtDMmmUV9EqiapIK89FnJGyNKhuKXBdqE2c
	N7UdzCYtUL4uqRiI+qghJfk6j20u20Au2oD+2vpP83TVUCR75F7ZWULSUb5R8Va/MG8e67oH3LX
	94RqjQCwv5OLeSiRkuvorQJPobu4QrVrzQgwepjgsIQE8ZM6cNIPG0S7gewUSSt2ebXHNFs+JuI
	fUc49O6y20Zg9HFFhT5jJjQuKDVW6BsMkLPPQHxzmBe8abjGOdmAOqg+GScAmzDrQKDBkkqvdEs
	p/CxyHcORAQ
X-Received: by 2002:a17:90b:384f:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-39aee0e6a17mr422028a91.17.1788303751072;
        Tue, 01 Sep 2026 16:02:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b7bd00sm1050895eec.14.2026.09.01.16.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 16:02:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 1 Sep 2026 16:02:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Charles Haithcock <chaithco@redhat.com>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: Differentiate scenarios when watchdog is closed
Message-ID: <1c15e728-cafc-43c3-87d8-981a2682d441@roeck-us.net>
References: <20260901214251.760184-1-chaithco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901214251.760184-1-chaithco@redhat.com>

On Tue, Sep 01, 2026 at 03:42:49PM -0600, Charles Haithcock wrote:
> Presently, when a watchdog device is closed, we print "watchdog did not
> stop" in a few different scenarios;
> 
> 1. When nowayout is set
> 2. When the watchdog is able to close, has received the magic character
>    to stop, but fails to close in device-specific code paths
> 3. When userspace deliberately closes it without stopping it
> 
> For 1, we explicitly print we can not close because of nowayout. Nothing
> differentiates the other two however.
> 
> This change adds a print to indicate the watchdog was closed while still
> running.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Charles Haithcock <chaithco@redhat.com>

Applied, but please version your patches in the future.

Thanks,
Guenter

> ---
> 
> v1. Introduce change and modify logic to differentiate
> v2. Simplify but still differentiate
> 
>  drivers/watchdog/watchdog_dev.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index d7895009a2..937bdd4c92 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -305,6 +305,10 @@ static int watchdog_stop(struct watchdog_device *wdd)
>  	if (wdd->ops->stop) {
>  		clear_bit(WDOG_HW_RUNNING, &wdd->status);
>  		err = wdd->ops->stop(wdd);
> +		if (err < 0) {
> +			pr_err("watchdog%d: Failed to stop watchdog: %pe\n", wdd->id,
> +				ERR_PTR(err));
> +		}
>  		trace_watchdog_stop(wdd, err);
>  	} else {
>  		set_bit(WDOG_HW_RUNNING, &wdd->status);
