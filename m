Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691507;
	b=XPmhKG9C8sO5n+EsH1GtEPUMlDYRi+eiwPfPf5GsyJWME+1h3apFqr3/8ZvvqjbDu8zZ
	 mNTXT+o5Tr9YmY5KGBS0ChSIA7kF+RDp8TMNA8qBnAuGVZonnD+Hm6VMrz9Fhj5Pslkhq
	 JQR7U5iiGJR+MiRfTDgw6l5XBDNpWtbAAeuf2SEM/i6MdpwlAuxUN8bekDDzLRwjhC7Dp
	 7ubbVkRx+a+GFrSmzYkiy2XbYoN53+dNBt7Py7oQScvuImxADER3rG4ki7eUllrWXroE0
	 pIkNq/ZNftHXwI0k16FMoK0nFCdEshIrDEfO/IYN12zrM4xopSMYlFzqvsknpo0fLDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=r2q+iyvuVlDeIlWZJGrX+HSjqNXjGEe/i8h2neh/mWE=;
	b=j0wYSmOuXJXDpU0lzJDKWJlAKEvvz7PAZVkAEVcqfqXBGczMlMddNBx30HgFseBakDdA
	 K18Trvc+ZSIZtZAxouvF4rw+kr3KWT5Hru3FRfG2S9b4cR2BHaZsUqTXidCS4+AkLGS9J
	 pB583QvjoaFXRrTVIUBGhYLEV+eFXdVgO86WwMKpUwZm0qtqFxRlUrsj6MYXVApuvR3ob
	 LDVjkzIR/Tv7Iei4mlnADcaIOQ7yI/ZJ7yuzVS8P1HnYaYr7VrVITI5FYpsa4vNr/iiOj
	 dyRiutbYewkc2H16GAkT3m2xJ3GMDvmIaTWLhv8cfwVm8BQ8sV55dgTTOr8HSxjOq6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Mpa/3iSh";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E882606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E882606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Mpa/3iSh
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535a54bed9so117186eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792691506; x=1793296306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r2q+iyvuVlDeIlWZJGrX+HSjqNXjGEe/i8h2neh/mWE=;
        b=Mpa/3iShcpdplVyV4AD4tedhbLcu8Y/44+UFs5RAQEPeTPcdHzGpgxVv18u/t2KG0k
         Gf0lN3PdVbnKUaTU/Z4O5TdUtlDHJ8QEmhbsLGXYNQLMdOi3i2sPvBsPveMlI6ymkIsT
         lYQy7sfpWTPaE8CyKu8k0AJ9Lew3Zrv4KvxtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691506; x=1793296306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2q+iyvuVlDeIlWZJGrX+HSjqNXjGEe/i8h2neh/mWE=;
        b=jdtrlMVd3EI+fqcOL2OCIjDZEz8VzD7FQ4EC0Uq1nn1l3OEqj1QbOrOZJsXNEwYvJp
         dwG3rLXPVHZPH292CPHCXOt8ACFVzCFmsy5EV+SQ7yEZQ6QACBA0kyw8PiF2zMW7EM8p
         Y2sNILGgJFEppOhsMLfm4Cz67CYTmsUp2KzpKIVmfPpSlDc2dMZt0OgjH3WB49zVS2QI
         KeHVkB/kN96PD4UtwzCMZ3RUb4Fqz3c+ufxJQrs1YTf8NQZ65G2hII4+Cc5a35xiWIS0
         WlH9eeTt6J26hmgpqH5WOg4ltOhVXrPTkOy4niiHZV2Sfwq8kR4FItFCsSVaHxUSqmLz
         /fwA==
X-Forwarded-Encrypted: i=1; AKwUvBxfAY1YV507joOdCPDZ8x05YxbQCbRFJRTPbN3IktsUqkf+JETEEmTU7bxX9WDgbKHJ48Mu9qYz8SQOJ8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNbBl89rCHOseGM1mauSljpu8fLNBHHFt0342uKTZd702KrdYy
	zokm3gTSK4NXJd3g5xO9b6OfLPJyo0U4Go+J5KlGqBq/hbZaEuupHJ7/TwUkM4/++A==
X-Gm-Gg: AYBFou3g25ujB3pErWJcxJrIUpKdIyEVHocGuMiQqHCp9iUE5M72gAE5DqJdIXEl5KI
	iLHq84+g1bvmwXPueT4UzlhwdFoc6eXM5dMd3nnibmd9dvqiNRBsO7EDyGayr1lH05IfFHwRvKV
	n7xOycUGQO4agcwixxvXciiWlRQ7DFmLz4plOwqXOuC/kafaG1QXdQS9yHJbSShk4T/S2AX3C2E
	pY2u55UiYgY3bFJ14MkiO+FkPCb/XW0fY6mLHKrbDkEAbn4rO/VJOX4tDjS/tz1hHXIdZ2xu82g
	CycgTYTLp1rUjt6P4VDdCi8atSQZfkOfXwb4RDi4536n/n7evM57b0Rt6STgmo4vYAXkezxlGlN
	0yoU7hNmP4z+Yj7g3R5br7PVAo0yNe0q5b16MvIm1SwSCje+ilNftcwl7oYFUZpIuGTYCSeB8h+
	uQqatOMElSNW/lTVGqFGR+/AsqdJiv1+6ckIn+tJWOQTwYGnngiyjpe2lzDo7w9MjlJ9u/YnRn9
	l6+YSDvtDFS4to6xYlkjEAtTAAJN4U6GQT531fmtxjDaMBddgfbcNRUWxS/ns2OcL5MCfUGkjl+
	T5y2cGWfdAzXZGrIg+M=
X-Received: by 2002:a05:7300:fb83:b0:359:8492:2107 with SMTP id 5a478bee46e88-3674c43c286mr11658686eec.10.1792691506190;
        Thu, 22 Oct 2026 10:51:46 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4a1d:784c:3fc4:37a2])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-367405ed295sm19625095eec.9.2026.10.22.10.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:51:45 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:51:43 -0700
From: Brian Norris <briannorris@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/17] iio: accel: fxls8962af: Discard
 pm_runtime_put_autosuspend() return values
Message-ID: <atpNLy6Tb46hroHf@google.com>
References: <20261021235818.3059519-1-briannorris@chromium.org>
 <20261021165858.v2.1.If2263e6ae9eaa4493881b72922dcde031ce9d81d@changeid>
 <atmy2Db_DlLUuOeC@ashevche-desk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atmy2Db_DlLUuOeC@ashevche-desk.local>

On Thu, Oct 22, 2026 at 09:53:12AM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 04:57:02PM -0700, Brian Norris wrote:
> > This driver propagates the return value of pm_runtime_put_autosuspend(),
> > which is not particularly useful.
> > 
> > Returning an error code from pm_runtime_put_autosuspend() merely means
> > that it has not queued up a timer or work item to check whether or not
> > the device can be suspended and there are many perfectly valid
> > situations in which that can happen, like after writing "on" to the
> > device's runtime PM "control" attribute in sysfs for one example.
> > 
> > For this reason, modify this driver to simply discard the
> > pm_runtime_put_autosuspend() return value, and inline the
> > fxls8962af_power_off/on() helpers to their callsites, as they're even
> > more trivial now.
> > 
> > This will facilitate a planned change of the
> > pm_runtime_put_autosuspend() return type to void in the future, similar
> > to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
> > type to void").
> 
> ...
> 
> > static int fxls8962af_get_out(struct fxls8962af_data *data,
> 
> >  
> >  	is_active = fxls8962af_is_active(data);
> 
> >  	if (!is_active) {
> 
> Why do we have this check at all?

Frankly, I don't know. It seems logically wrong; you shouldn't even be
reading device registers without first grabbing a runtime PM reference.

But I'm also loathe to go tweak a bunch of driver-specific details I'm
completely unfamiliar with, when my main purpose is extremely simple --
to stop checking one return code.

All in all, I think this is beside the point, and I'd rather not try to
address it in this series. For one, even if I try to address it, there's
more chance of regressions that will distract from my purpose.

> > -		ret = fxls8962af_power_on(data);
> > -		if (ret)
> > +		ret = pm_runtime_resume_and_get(dev);
> > +		if (ret) {
> > +			dev_err(dev, "failed to power on: %d\n", ret);
> >  			return ret;
> > +		}
> >  	}
> >  
> >  	ret = regmap_bulk_read(data->regmap, chan->address,
> >  			       &raw_val, sizeof(data->lower_thres));
> >  
> >  	if (!is_active)
> > -		fxls8962af_power_off(data);
> > +		pm_runtime_put_autosuspend(dev);
> 
> If it's active my understanding that runtime PM keeps device already resumed,
> so these two will be just a reference counting calls, no?

Right. I don't really see the point.

Brian
