Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BFC3CB571
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269017; cv=none; b=N5PZRL0MSGCWxSQD5HpkiWsFYV9Crc0sKwBDLiUpAR2TtZoQvbpo0S1pwRBs+vpHFvpftwoBLyzZgxvnbHpbIVLp+kSNO/S+HIrhKYe7k03re9BT7bl6uedu4bV4RvXuIi91fxu38UGgG8okOrtvKCnCKABrCE9XQ/I+CgbQHWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269017; c=relaxed/simple;
	bh=WYqlHO/zHt3Xutv1rUCfQfMjfWFxGbA6/KjnOWjFWrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nU3kZ638kXDmz19qMQJoHZaC0PYfAdMikHOePAUfi/m7wxuOSCOmFp2lkWih8EaahGtoo85F+ZuF+MIIIqQb/vIKVB0pgfla3ty9qg5xn3qUzcrdpbZU68SBlhVi1FOH71HYFDk3oSFzPznlc08UEB9rH2Sqi+YcUDvePHXhifE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a1xQSuLj; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a1xQSuLj"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso83609a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790269015; x=1790873815; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=guLOIkoVPSN8vWBIel9PXHqx3VExrGAEcv83cGNA/Jo=;
        b=a1xQSuLjoOkO2ZAEZH0MOvWI/GDdI3xIPFdyQolWJku5WeZ0NR6OsSYE33kyEsWAda
         ABS+PpnD9vk6scQUj8PAqUoYhreuZ+5XvuakClTpfyRSt5FYjmnXUegK/rFOSKevkmUh
         A7cSm1x6gjQ78uOtkyWXid6hu9ze5A9UEP9pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269015; x=1790873815;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=guLOIkoVPSN8vWBIel9PXHqx3VExrGAEcv83cGNA/Jo=;
        b=Oo0fjz8wqD4nVnZZhNBd5dq00zQwT/Kg+UMVVmI6ZChDUxc0fvYUe0oFiALy3nBorX
         MRUtCtFvykHx1ucSm49E8OIh5D8EjNVPyV+zHZqCTIP3smpfPaEEYfjPyUvf5QI2NsnI
         CFs8htDCgjACop058J3LRFZsWrW9Saba8HFfIWdwLDrCzeeLZOViZ+WgiXJIf3WIkezG
         GamHgHJeND+FUy2COBw8lw5H6BdbuVp5Sec8VpAowySSpFFUQOENxf14FEAnmyusYDxT
         CUfkoQYVCd6Wh4jdGfxqRRe6pW2WxXHtcvLOSdvmKJskizsyddYQutXFi4maMNLglWna
         /RGg==
X-Forwarded-Encrypted: i=1; AKwUvByq8CWipY1YE/Z+fecTi3E6FhFmAkfSoKAAkd1YieeU6hs6N2VkzO60AXyZ+LB2rvHgqiFGVuyFRZV3Sok=@vger.kernel.org
X-Gm-Message-State: AFuF++l38OBJXHPqPq12v5FXM1HYuybRwdN6zNo6pSFZucNNZITyZjdE
	Yz+w/rNv45yQ02arYjStfGdiYfukLGNxWYz/o438AvZdtMPf5OjldAkhsWRSEsKugg==
X-Gm-Gg: AYBFou3fkFaBQ8JNqp51jWWiDQ6qV+W/Z05heiw5I9LYLEF07U1x9H3khQoIymuaRBh
	+OW3p/2qStd0iebh77aKn0MdRdXXsGy9zbaIUKj9cZfHN55/Ci4HDBQSruW5HmxKL1pmSaHUW4t
	iov8UwliOUKlngFUG4BBkicesL+lqu2Iu5ytPaSNIj9+0uFDLRuKJZUNvv5mE9zf2MvsTlOEJBf
	oWPTLu2E7au1yC5GZL8CR7WeghsEYTTTAAnQZ//pBKb9NaznXgB9KDykLOpf6anoyjqTZ4Z2HWb
	YNdD1HCxn7Q0nwDVdb+e0KrDA9j+lGNwn3UumSpXghz76GfoW8oUNHNXce7oz3lrl0/RDJ+bWPx
	T+WU6AyAnE7TzhSvh8tFv8fv7Sl4VVl4UtynqDd6c7838+DmDEtuuAR5B5WFkl6+oQjBBrIJYMs
	uufB6+ly//6w5Sm/NZUhRP81oid670xltqGHb1Zi+WgQTiyyGhi2Ee1iq5/HipE5IzAcyhsW3Dl
	xltfIodAj/KDptG5uV+M+S/ytk8iFEqj6tSlw==
X-Received: by 2002:a17:90b:4487:b0:39e:6c69:9b95 with SMTP id 98e67ed59e1d1-3a09928d05fmr2500373a91.58.1790269015076;
        Thu, 24 Sep 2026 09:56:55 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b9bb:8d53:6635:9f5f])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cc78794331fsm42561a12.20.2026.09.24.09.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 09:56:54 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:56:52 -0700
From: Brian Norris <briannorris@chromium.org>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/8] PM: runtime: Misc improvements to runtime_pm.rst
Message-ID: <arVWVA3lks7SopQH@google.com>
References: <20260923174711.1283986-1-briannorris@chromium.org>
 <20260923104031.v2.3.I383681b22c12d7caee976cb91aa90d1a94d4a591@changeid>
 <CAPx+jO_1qYnN37diVN1=PA0xGa0iSBfXD_uqgSdFpTn4t0zJiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO_1qYnN37diVN1=PA0xGa0iSBfXD_uqgSdFpTn4t0zJiw@mail.gmail.com>

On Thu, Sep 24, 2026 at 04:01:00PM +0200, Ulf Hansson wrote:
> On Wed, Sep 23, 2026 at 7:47 PM Brian Norris <briannorris@chromium.org> wrote:
> > diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
> > index 39fdeeda7a1e..352cdaf0650d 100644
> > --- a/Documentation/power/runtime_pm.rst
> > +++ b/Documentation/power/runtime_pm.rst

> > @@ -315,7 +319,10 @@ removal of their drivers.
> >
> >  Drivers in ->remove() callback should undo the runtime PM changes done
> >  in ->probe(). Usually this means calling pm_runtime_disable(),
> > -pm_runtime_dont_use_autosuspend() etc.
> > +pm_runtime_dont_use_autosuspend() etc. Alternatively, drivers can use
> > +devm_pm_runtime_enable() during probe, which automatically takes care of
> > +calling pm_runtime_disable() and pm_runtime_dont_use_autosuspend() upon driver
> > +detachment.
> 
> As I have stated in earlier discussions at LKML, the
> devm_pm_runtime_enable() API is not entirely easy to use correctly by
> drivers. It means that pm_runtime_disable() gets called at some point
> *after* the ->remove() callback has been invoked, which can cause
> problems, unless the driver's ->remove() callback has managed things
> correctly.

Yeah. And I think it's rare for drivers to have done a thorough job. A
rare exception: I found commit 2d90ecdfa326 ("ASoC: rockchip: i2s: Use
managed hclk and runtime PM cleanup") an interesting outlier -- it adds
an additional devres teardown to power things off afterward.

OTOH, between v1 and v2, I chose to tweak one of the Examples to avoid
devm, precisely because it was committing (or hinting at) these kinds of
mistakes.

> My point is, the above makes it sounds like it's easy to switch to the
> devm managed version, while it certainly isn't that straight forward.

Right, I said as much in the cover letter too:

(possible future work)
<quote>
 * Adjust the way devm_pm_runtime_enable() works, specifically for
   remove()/teardown. Currently, this is very hard to use correctly --
   some common driver patterns may assume that a device will tear down
   while RPM_SUSPENDED; but that's not actually guaranteed. Notably,
   this makes some of the "Examples" section fairly tricky/subtle.
</quote>

Would this be a good moment to pass this possibility by you? What if we
taught the teardown to force a device back to RPM_SUSPENDED? Something
like:

    static void pm_runtime_disable_action(void *data)
    {
            pm_runtime_dont_use_autosuspend(data);
            pm_runtime_disable(data);

            // New code:
            if (pm_runtime_status_suspended(data)) {
                    int (*callback)(struct device *);
                    int ret;

                    callback = GET_CALLBACK(data, runtime_suspend);
                    ret = callback ? callback(data) : 0;
                    if (ret)
                            return;

                    pm_runtime_set_suspended(data);
            }
    }

> Not sure what that means for the documentation though. :-)

Well, I don't feel like the part you quoted is a problem. IMO, it's
totally fair to mention relevant APIs even if they're hard to use --
there is no part of the runtime PM that is easy to use!

But I'm definitely trying to make things easier too. Ideally, we can do
something like the above to make it easier to use. But if we
can't...well, I guess I can try to document pitfalls better -- possibly
in the Examples section, or maybe an extra note in the above quoted
area.

Thanks for looking,
Brian
