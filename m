Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE974BFE64
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281935; cv=none; b=LDubOO1m1iCjdFP30/unytqVPIhApbKFi8a/YG+zT1iJv2WCxRizHwtPKIFRpg66I9he8CRJOpQl7DnKDx1N3bzfQt3vNim2KuNyJyGoxLSWAJb8UrVs4aW+s9MNiZV38Ap7JnZ9GDkEWw8nzUw/ZlT8icl1IIJ+opc1JNbcKF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281935; c=relaxed/simple;
	bh=v3fnB7xz+w9vdQgoBzGCx0rltywWs4k7dX0JJ8+/yM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yq/MN0297IV4EPJ1vIhQJjqvpyptkDxcJpkbl7jtkEZFyjhYQd5GAQRna+5a3KNg1+MTZKG53vY5puuetuH6wI/IPIfOfVt4fmr3jgsHnMGgTbo/ad32veOccQCLECpAqOqgEZpK8YyR8rQm1FUVN2zcW5nA2t4DLB+mEjtyVz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N/JI4o5I; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N/JI4o5I"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso101028eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790281931; x=1790886731; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZvGsLC6n0EXaAgGju5mJ8B3bsonAIhyXpY3nurvIZ6Y=;
        b=N/JI4o5IR9f6ZEfB5gFtUA+nqKBxB4AsvxhEJ0Zg3BwkleI4ZL3jzVUf1S5J/fnxUC
         nh/smWHq0r4/Q1ZzMalynCXjCSN8/1OVIQxvRzu8OciX6ip/7E1Dbu0dTovgb4jqYbVQ
         8SiNfOcXTN2iX+4tL7l1KARWkeWkzb9F/XPFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281931; x=1790886731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZvGsLC6n0EXaAgGju5mJ8B3bsonAIhyXpY3nurvIZ6Y=;
        b=BHX9sx7iIjtbOzO48F7+tRgyzDIJGcVyDiY/7o2KI/yW/9RytYL+QQtQV/mJvedULF
         A7JEEEEjDTZFcaqFJUt+7Xpu4dvNSmsQCVakvd1ZT7ZzcpsdmD55EeRoByivebyBGjcH
         0/PnJX7rJZpTLw8uCI7nH/OFBVc8NL7M4Tnd5jKeMyiBxipELybQXZnvtlAqd5nQwIf2
         ydaBhyu880v+qIyHaUrjfxW5GjKPvi0vyU5+1/e7GlxWwsXsw5VYQJEkOVYN8eoyQrud
         2yp11Dz5JqbmkBHehbuFwnSCe4iyBQzo5e9XScPRcnaR8wFb3EMkwnaZr6dycvu51AIJ
         oqRw==
X-Forwarded-Encrypted: i=1; AKwUvBysFVAyQvuwR0kWec1Hb+2YtkAP+zsetP3mba7oFM9TjiyaktpjPuz8HG8xU0cQklKG2PLae1H21MO+VE8=@vger.kernel.org
X-Gm-Message-State: AFuF++mb3Jm0r8L2DJVkSfPrj0LY/R0cHcbB4ap4sndKfVgXaZZ6ygJk
	g83XRG0Upms5pJAV/0dZA1OvoxmHfghQcryjAex9yq2vChvwyyy7BcR/6WIVABoUUA==
X-Gm-Gg: AYBFou1i16QSlaK7qNASBH9vz1Hkh8d4tLsUBh5jFVyWUHxpjQAzum0/W2UdE/gcRtF
	fpvm649PrBi7N2iKpy/WUplZBOCq2A88yPhmUGjJHZfAM+kz+eY/S3d5Dk4xuQd0q6zwOAmnanI
	qiXcWhiJLnfDrCWBXxUyCA2lQecbpuBG/DJnVGzF06e5Klt6gNoQ0mgYI4f8uC0TdBd25qvXfAg
	ljpwW5pqxcOvw/nTYFjNKkm2wwffutapJmhvUZWDBTz7rUiwyVYgOPqxvqBX349G/z2KLONFhtW
	dVhhnMIRj/x7dEcYlF/JHlDbzghL3NPq6EzXErspjbCVH2xCt/XarrmWG0kdVFkCmsWuSGESKLn
	eI/AKw+Jk+PmQ9xEX/J5cZ/DpmYUlG+gYus9MwpZwGGS9XzknYLOHl0cF25AA3UW6V3gigtNPPU
	+evYpWXCYgDzR+6dqB5oV9eJz8C214i0SuACbhtkSqSTQJVHDN+f+crvn3mFfQhID/TdtJVzNny
	fTdlPJ7Kwr/Ankr/S4DSHNGVW5RHCx1N+ZwUZkz62zE3xtx
X-Received: by 2002:a05:7300:7312:b0:33b:dd45:716c with SMTP id 5a478bee46e88-340cc11f887mr2475296eec.13.1790281930898;
        Thu, 24 Sep 2026 13:32:10 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b9bb:8d53:6635:9f5f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-34144757f31sm1220938eec.14.2026.09.24.13.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 13:32:10 -0700 (PDT)
Date: Thu, 24 Sep 2026 13:32:08 -0700
From: Brian Norris <briannorris@chromium.org>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] PM: runtime: Add Example Driver Patterns section
Message-ID: <arWIyLcKuyFvp2Ko@google.com>
References: <20260923174711.1283986-1-briannorris@chromium.org>
 <20260923104031.v2.8.I75ceea7b1afd016e08922e47b82e6eb36de144fe@changeid>
 <CAPx+jO843h9bOeWNATHm8D2afbniQsX7WECJzCxmfi9ZcH9+5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO843h9bOeWNATHm8D2afbniQsX7WECJzCxmfi9ZcH9+5w@mail.gmail.com>

On Thu, Sep 24, 2026 at 04:13:30PM +0200, Ulf Hansson wrote:
> On Wed, Sep 23, 2026 at 7:48 PM Brian Norris <briannorris@chromium.org> wrote:

> > +Basic Probe
> > +~~~~~~~~~~~
> > +
> > +A driver that powers on its hardware during probe and does not use autosuspend
> > +can initialize runtime PM using device-managed helpers:
> > +
> > +.. code-block:: c
> > +
> > +       static int foo_probe(struct platform_device *pdev)
> > +       {
> > +               struct device *dev = &pdev->dev;
> > +               struct foo_priv *priv;
> > +               int ret;
> > +
> > +               priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +               if (!priv)
> > +                       return -ENOMEM;
> > +
> > +               /* Power on and initialize hardware registers... */
> > +
> > +               /*
> > +                * The code above left hardware powered on and operational, so
> > +                * tell the PM core that the device is active before enabling
> > +                * runtime PM.
> > +                */
> > +               pm_runtime_set_active(dev);
> > +
> > +               ret = devm_pm_runtime_enable(dev);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               /*
> > +                * Alternatively, the above two calls can be combined into:
> > +                * ret = devm_pm_runtime_set_active_enabled(dev);
> > +                * if (ret)
> > +                *     return ret;
> > +                */
> > +
> > +               /*
> > +                * Upon successful return from ->probe(), the driver core
> > +                * automatically executes pm_request_idle(dev), allowing the
> > +                * device to suspend asynchronously if its usage counter is zero.
> > +                */
> > +               return 0;
> 
> The above looks nice and simple, but what happens in the error path is
> equally important.
> 
> In principle, nothing prevents the runtime PM callbacks to be invoked
> until pm_runtime_disable() has been called at some point *after* the
> probe callback has returned. This needs to be taken care of correctly.
> 
> Likewise, as it's great with an example for ->probe(), it would be
> nice with a corresponding example for ->remove().

Good points. I've rewritten much of the Examples to now:

(a) largely *not* use devm_*;

(b) include a more interesting set of error handling and remove(); and

(c) only after doing (a) and (b), show an example that uses devm_*() to
    replace the appropriate error handling and remove() teardown.

I hope that will also partially address your other comment about
devm_pm_runtime_enable(), and how it's difficult to use correctly.

> I will have to defer reviewing the remaining parts in the $subject
> patch, a bit limited bandwidth at the moment.

Thanks for the time you spent on it!

I'll wait a bit more in case Rafael had other feedback, before sending a
v3 that (I think) addresses your feedback.

Brian
