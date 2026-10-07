Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800E838DC43
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386368; cv=none; b=dswDMLrk3QGtc0kIEIWm6BB4Uas3lcCn6t4Kx3fmdY3t5EjYUaTS8C2pxDCZ3ZIy8jxucB8LvKyUFDTCDQ9ycTuU2cV30wiVsmJVhOwrO89HMGFp4w1oCzppJXQOfrhhaTyPIBM9G4HwlLxQdrrWGdIMepV9gJqoTLqthYOBnVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386368; c=relaxed/simple;
	bh=u0kuFr8GZgVrxMy2uq+D0t8qRpztHKRJU2wGEM/rk34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e314gpw71hvLYXNvmXFUoEWCrTCY1sfGcB5dWPYfEvB6vIBRM1Dphn7lPmIB5vT0JfLYqdyIKWLL2m7avIAtcd7ZUho5kOSERXG/0YIDV3IoTA5FEnaHbzEoUk6pIn2omYUk0GlMzDY99k1pmA9l3Rp/M6Cke1wbZL+1YpzwF9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fb6Di+Ls; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fb6Di+Ls"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so1680519c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791386365; x=1791991165; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=96cxVunsuLpr5pVfosRg07KKEkNX5G2jAVACbngKLkk=;
        b=fb6Di+LsVLh0O5tc5L9QUs7ZY79HRt3G/xHvMPOcUrAk9jpCdUrQw1OA/S21Ngn5Ry
         d14xvGrCAGe+NKajdz5rQpQqdjL3Lh6w8iscJG9xUFgoBSU3T0QhjesPMlUI4RzvVVR/
         EQlymlZbPnGiIU5phxvnuC3Uw573BiYQOKuNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791386365; x=1791991165;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96cxVunsuLpr5pVfosRg07KKEkNX5G2jAVACbngKLkk=;
        b=QvhOJeWKRAehEEp9omS2txsrV8rADEuI0LEjU77qhupbnXn1/mnNlvE2EcybngmLAh
         6PyTrBNB33Wo6oJJN9fUzG1PxC/V0kuiBJl0buQFFuqCpKD/A2AB28EhH7AWUtuMMMBU
         fpClS26nlDGsFnLsPDL4+KNgA35Sr/AIcaZR4q/lwFcfp3K2eSJL5aRDvXlsTn7oWpEi
         iuPuDBcwUG0L6JvhsFeGGTdj5/6ueYGlP4pUa10S60GHQ5BeWNDwbMA6c67u6FyHBAzG
         ODGoDd2RsBANz0ssBiHgevv+N7NAZUr5ISz02ZSJoa/eBSRspksohdc+NrfjcRPve/wp
         PDGg==
X-Forwarded-Encrypted: i=1; AKwUvBxgzLmleLqH+J71Wh7sihyOIWSAxEHncDI+qJyAw9JlvTqF3UdqZ8vT/nTjjbO2LjTGkchRckyw/X3+W18=@vger.kernel.org
X-Gm-Message-State: AFuF++nowV7HoRgkgU6/6lDYLx0X6KKG97k/WU9H91Lj4o7C9kD8cQpa
	eEVcnrqm3Bouhpm39Rd/vfVwsM2IHLbI3/T5yyrNQgqm48HmeGqx4l1NZN5mKEqIIA==
X-Gm-Gg: AYBFou1m+fsKDrAUJSiYFl8MJxtcQThkjr6CQTyaR9QhrEbJmC+5cA7yecebdkB6+09
	qkQZY3tlVQNXFUv0kTT2Hjccy0B9rNgjZeqYY9qTzJRM5Fu00Itpm6L2PTg0cvy7fzllbJNRbt8
	tYMmLa6Ug/681kz1JjJt5NvPJzaj9/0aDHIhzUYmOKmiQWIYJUPsw+j/LbUCZkDxqSvMzRBxr2b
	omZS/Z0V42VHxGMH8pyLZ4WsgzpN/jC12mWaUTfoNKPb9zoTntlWnV1N9zG1Iys/Exd21Lyn680
	VtWfKyESW7LgMi5zeeudC5zUrEXqFuCv59+Cu6F865eaKWCPzh+oVxYpoKoQWHuaMP0/6+iqBMV
	dEJmwvxK0L6LpUrEhmP7Gqc0NZFahEDewH3bM+Bv/bdtJ5/9v46m/J65BdedB4ZxbK2Gqo5Eb/P
	K7SZ/0FelOn3sRnjrjGIrORo564F3x89cRRYqXxxHw1d3MAk32xE5q+ZR4HeqQMw+L1kw/O/jUw
	fQrREl1GDvI2p/hc0tnHOqB/0mhhDu7d+r8RA==
X-Received: by 2002:a05:701b:270f:b0:143:342a:3d3d with SMTP id a92af1059eb24-161f61365a3mr3134914c88.0.1791386357677;
        Wed, 07 Oct 2026 08:19:17 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:63eb:e7f9:1d47:7d47])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1616727976csm7679456c88.8.2026.10.07.08.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 08:19:17 -0700 (PDT)
Date: Wed, 7 Oct 2026 08:19:15 -0700
From: Brian Norris <briannorris@chromium.org>
To: Alex Elder <elder@ieee.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>, linux-kernel@vger.kernel.org,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 07/13] greybus: Discard pm_runtime_put_autosuspend()
 return value
Message-ID: <asZi8-2TJsIWVD_b@google.com>
References: <20261006231900.3230373-1-briannorris@chromium.org>
 <20261006161337.7.Ib0925681ca623093ddf812cc4de848e10ec07c73@changeid>
 <5b4a1156-d05b-470e-952c-1958982f5ae3@ieee.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b4a1156-d05b-470e-952c-1958982f5ae3@ieee.org>

Hi Alex,

On Wed, Oct 07, 2026 at 09:28:45AM -0500, Alex Elder wrote:
> On 10/6/26 6:13 PM, Brian Norris wrote:
> > Returning an error code from pm_runtime_put_autosuspend() merely means
> > that it has not queued up a timer or work item to check whether or not
> > the device can be suspended and there are many perfectly valid
> > situations in which that can happen, like after writing "on" to the
> > device's runtime PM "control" attribute in sysfs for one example.
> 
> If I understand this right, "put autosuspend" is basically an
> unconditional "put" with the assumption that auto-suspend will
> ensure the eventual suspend occurs sometime after the reference
> count reaches zero.

Yes. Similar pattern for any other pm_runtime_put... variant -- they
always decrement the reference counter, even if they otherwise return
non-zero/error.

It definitely can be confusing, and it's one reason for $subject series
-- to remove confusing API surface when it doesn't help. (Similar story
for pm_runtime_get_sync() -- it increments the reference count, even on
error. That's why pm_runtime_resume_and_get() was invented.)

> > Modify gb_pm_runtime_put_autosuspend() to discard the
> > pm_runtime_put_autosuspend() return value, change its return type to
> > void, and update its caller in the Greybus power supply driver
> > accordingly.  Also drop the redundant pm_runtime_mark_last_busy() call
> > from gb_pm_runtime_put_autosuspend() while we're here, as this is
> > already part of pm_runtime_put_autosuspend().
> 
> I support including this fix in this patch.
> 
> > Note that this resolves a bug in the power_supply driver: in tracking
> > 'gbpsy->pm_acquired', it erroneously assumed that
> > pm_runtime_put_autosuspend() would not release a refcount when it
> > returned a non-zero value. That's a false assumption.
> 
> So is it safe for this code to assume the reference count has
> been decremented in this case?

Correct.

> The comments say we're trying
> to ensure there's exactly one get/put pair.  (I don't know the
> reasoning behind that though.)

I didn't look too far into this, but on first glance, it looks like
gb_power_supply_state_change() can receieve a number of different
properties, several of which mean "off". We only want the first "off" to
drop a reference count.

That seems like a fairly typical sort of pattern, and the right answer
is to ignore the return code, because the reference count was
decremented unconditionally.

> > This will facilitate a planned change of the
> > pm_runtime_put_autosuspend() return type to void in the future, similar
> > to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
> > type to void").
> > 
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> 
> Despite my questions/comments I think this looks good.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>

Thanks,
Brian

> > ---
> > This patch is independent of the rest of the series, except for the end
> > (changing the return type). I expect it can be applied by individual
> > maintainers, and we pick up the end once the dust is settled.
> > 
> >   drivers/staging/greybus/power_supply.c |  8 ++------
> >   include/linux/greybus/bundle.h         | 12 +++---------
> >   2 files changed, 5 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/greybus/power_supply.c
> > index 44bd8a72fa50..beefcbaf3681 100644
> > --- a/drivers/staging/greybus/power_supply.c
> > +++ b/drivers/staging/greybus/power_supply.c
> > @@ -377,12 +377,8 @@ static void gb_power_supply_state_change(struct gb_power_supply *gbpsy,
> >   			gbpsy->pm_acquired = true;
> >   	} else {
> >   		if (gbpsy->pm_acquired) {
> > -			ret = gb_pm_runtime_put_autosuspend(connection->bundle);
> > -			if (ret)
> > -				dev_err(&connection->bundle->dev,
> > -					"Fail to set wake unlock for none charging\n");
> > -			else
> > -				gbpsy->pm_acquired = false;
> > +			gb_pm_runtime_put_autosuspend(connection->bundle);
> > +			gbpsy->pm_acquired = false;
> >   		}
> >   	}
> > diff --git a/include/linux/greybus/bundle.h b/include/linux/greybus/bundle.h
> > index df8d88424cb7..361a94d3499b 100644
> > --- a/include/linux/greybus/bundle.h
> > +++ b/include/linux/greybus/bundle.h
> > @@ -59,14 +59,9 @@ static inline int gb_pm_runtime_get_sync(struct gb_bundle *bundle)
> >   	return 0;
> >   }
> > -static inline int gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle)
> > +static inline void gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle)
> >   {
> > -	int retval;
> > -
> > -	pm_runtime_mark_last_busy(&bundle->dev);
> > -	retval = pm_runtime_put_autosuspend(&bundle->dev);
> > -
> > -	return retval;
> > +	pm_runtime_put_autosuspend(&bundle->dev);
> >   }
> >   static inline void gb_pm_runtime_get_noresume(struct gb_bundle *bundle)
> > @@ -82,8 +77,7 @@ static inline void gb_pm_runtime_put_noidle(struct gb_bundle *bundle)
> >   #else
> >   static inline int gb_pm_runtime_get_sync(struct gb_bundle *bundle)
> >   { return 0; }
> > -static inline int gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle)
> > -{ return 0; }
> > +static inline void gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle) {}
> >   static inline void gb_pm_runtime_get_noresume(struct gb_bundle *bundle) {}
> >   static inline void gb_pm_runtime_put_noidle(struct gb_bundle *bundle) {}
> 
