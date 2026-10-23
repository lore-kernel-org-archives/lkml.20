Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773839;
	b=dMrczd2wdlnte66NJKuYtqEtpc5OcVpnz24dTvASFAq/ceyL1BKEbbEU0bgenEQMjcYV
	 w3s2UoHzHIB3jmm25T7k6hKStrzqjYQ8nqlLUGlE9L2AKdh2aV/WK/1KNlXtBZCD7V7rp
	 /lzNd+mqSx5+6Ll+KxR00f5kH53avzbwKcVplAb6jY10wQSfwHgglOW9HuDxQXjAD6I5a
	 UgjRwqHjWxiFr5m5q/423XOaOV22+mi0r0M4DUr49xHqjQ5+GESWyJQHJ4JUBeQpyeYcB
	 h+doe1Q9OBqWYfWSyBNZkCmFAn/OBAskEeun3HSYW86sh5Sv+j7V1wZN1SKgMyfrpWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IbU6AikASsymoWZcigm5KICcvIS1yLWM5oIUuCyGJFQ=;
	b=gR0qgjgotBLx8eOQpLvhCN9AYDfgqkwtchcqqHap0DHgZkIyusALyQlig+5oSl86QYqu
	 40Bo4mkQqc6uGX2rIxMQSQbFfAbjhscJS9qfqO5Ru6yauSfCJ9r1IWQXkg8HCqK6D15Y+
	 M7HNjR1WHS2U+62cZx+qJm5yZDCNztzwYCxnAJ+GkG36GayV0UpmTt4Kt/0NzqwPsDMO0
	 9O3oGWCdDRUudE368NqGYICgrYpn7vGJi3Pbu2XMI2N/Ysi2RFujR1Bd4+LwzGnQMy+oh
	 ftfJ6Da10WRQCnkEz/dpE4xAZnoFQa4ZlB1/UdDoH0f75/Z4Em6kDPy7D7o3pk1jLTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC73606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AC73606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1846bc43c28so1197211c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792773838; x=1793378638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IbU6AikASsymoWZcigm5KICcvIS1yLWM5oIUuCyGJFQ=;
        b=nzaU3ccMU77AvpQXNcTtuC5WXz9iJYbaVtZBMgTXyyG4nq33Axd+wqILM/gXW5zNET
         qhazQYIP+HzqzYrlRqkWv+5N7lcFCV8ZT0hWkw+zBCfWY5kfu0Ibr+gWyUi6uquiA3DQ
         tt34Rj7EivfG9r6KIQ4lluL4+suBwLC/k9IQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792773838; x=1793378638;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbU6AikASsymoWZcigm5KICcvIS1yLWM5oIUuCyGJFQ=;
        b=ej2oiE5ZuNG+rci2nUYeiEeWF4AxdemaavvPaQTZqBVzmoOFQRt1sessvvYmWFQXEG
         M0oHQAxUms4wVUIzVXFzS7g7UnWXJ8x4mME2cxgVQT0+LADwLPY/bGEomN5xVD5S8HAv
         3/jMLmqpggDXaXF/+w92mC7I4w91DW/JIsC3TLkRTg6u6kylXoTIerkuqpunfwcdcJvA
         aK7h9dZoX6Ql1T7xCC+Y2As4INpMfDwQqviq2hc/0lFNWuCRyeROZM6LDIfErMeqMKsu
         7QvGlQJUiw8xpGJMOGhg9F05lw76fFvzO+L1N31osS9nogpsYfnR/WkRBm+V9z7Z0inV
         zrbQ==
X-Forwarded-Encrypted: i=1; AKwUvBz707QuFhREe8H1Y9NUfFaNSo2lQ8omqgX2nQu9/iRcgi2Jjlmv4u0HaNJAdFz25cFpnjqHjjLS3nhwqbE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtNYY1SQGc4KZDDA2k8C28phzQ97M+/Kjq3oetsY5oxhdEfnvD
	a+oFroDGK0UruLHG3j/YqSLN4KPsPtUpzTUNR7ENVf+28ZGVDp4tzPrFPAkRaSZOGg==
X-Gm-Gg: AYBFou1m0PGCseBobfuQiuDyHqZKvHeaQWBg+Ooda0PeNUde9UvxCqYMUdVcdCOUgZN
	4s71plvjE0yehBKkWxvdpIonrpcfbmESYTZIsjz/2YDsrri4LFM1FooRJesiOeP6KxG14ls2aiK
	ZrxYC6L4FaYL5BO+56M+QmTGaCu2U/dfPT1tvL2dHRHJcAXzy7TLy6yCNUN0JIGWCcNIWs7RTGS
	NZ2/AjDNZC+lc8Vig5jOlB7aKsCD9oWgQbzQRkNpuYceq5j2GtTV+J/HouyE63cS4JYrAYbu5Ey
	lTDsX8AVZx1VxSx9t1TjX5Qzun4Zm6bFStM9+m8Y+v0PbkdY+XumDVpePiYFneRX6MjDNM8zfUs
	lapHPiO3MJMXmy//akNAH5TnR+b87nnbqx++caaaLAGl+sgUk98welfTb6TBwpKoQ/i7ujQ+Spz
	uNrLqyGVJW/QXZzjBZTkK7yvBNUmUtwgmreOEPMichch0ii46u3aLbSQ4t7bG048QLgIAyrSDqz
	Zd1d+mi+w+P8EpXQxjEWCzRKvtaHq8tfW6xdxK/3ikiS9lv1rEmFmKGY8odungrRxsQlcPKQvF8
	BIbHPIeZ68Mdlof2J8a7X6nP3uHdON8i7kSaWeUC
X-Received: by 2002:a05:7022:4182:b0:144:fc5b:2121 with SMTP id a92af1059eb24-195c56ffe47mr4928192c88.17.1792773838113;
        Fri, 23 Oct 2026 09:43:58 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4a1d:784c:3fc4:37a2])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-197e666f0d8sm1435609c88.1.2026.10.23.09.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 09:43:57 -0700 (PDT)
Date: Fri, 23 Oct 2026 09:43:54 -0700
From: Brian Norris <briannorris@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/17] iio: Stop looking at
 pm_runtime_put_autosuspend() return codes
Message-ID: <atuOysdhmPRA7Waf@google.com>
References: <20261021235818.3059519-1-briannorris@chromium.org>
 <atm0umwtxZlQSAhy@ashevche-desk.local>
 <atpMNk6ymCpC5BL_@google.com>
 <atsEql7X20hGytXv@ashevche-desk.local>
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
In-Reply-To: <atsEql7X20hGytXv@ashevche-desk.local>

On Fri, Oct 23, 2026 at 09:54:34AM +0300, Andy Shevchenko wrote:
> On Thu, Oct 22, 2026 at 10:47:34AM -0700, Brian Norris wrote:
> > On Thu, Oct 22, 2026 at 10:01:14AM +0300, Andy Shevchenko wrote:
> > > After three patches I stopped because it seems more works needs in each of
> > > the individual drivers. Yes, the series can be applied as is in exchange for
> > > a bigger additional churn in the future. My preference is to see everything
> > > settled down in a single step.
> > 
> > There are limits in how much work I'm willing to do on a bunch of
> > drivers I don't use, can't test, and frankly have no actual interest in.
> > I'm sure if I spent a few more minutes on each driver, I could find
> > another dozen things to try to improve.
> > 
> > I can go back to the v1 approach (fix only what I came to do) if you'd
> > prefer.
> > 
> > Or, I'd prefer to stick with the sentiment Jonathan expressed in
> > optionally requesting additional refactoring:
> > https://lore.kernel.org/all/20261018211807.66bfea0d@jic23-hlaptop/
> > that most of these changes are optional, and that fixing 1 thing is not
> > a subscription to fixing everything.
> 
> Right, but my concerns is that in (some) cases you can do one step further and
> use PM_RUNTIME_ACQUIRE*() instead of putting first the explicit calls in this
> series and makes someone to basically do the same again.

I'm not making anyone do anything except stop looking at the return code
for pm_runtime_put_autosuspend(). Those cleanup-based helpers are
totally optional, and are not always all that helpful. In fact,
sometimes they introduce more problems than they're worth.

> To me it sounds like
> a double effort. Yes, that is_active thing perhaps to much to follow, but even
> there it can be refactored to something like
> 
> 	if (is_active) {
> 		ret = regmap...
> 	} else {
> 		PM_RUNTIME_ACQUIRE*();
> 		...
> 		ret = regmap...
> 	}
> 
> without changing the driver logic.

Well, IMO, this is adding more trickiness about the scoping, precisely
because all these drivers have strange logic. Here, it may or may not be
obvious to someone that the runtime PM acquisition goes out of scope at
the end of the 'else' and so drops the refcount. Then you have to reason
about, "what does the rest of the function do?" -- hopefully nothing
relevant, but that may not always be the case.

Don't get me wrong, I think the cleanup helpers are great for many
things, and especially for well-structured code. But they're optional,
and have their own downsides and risks, especially for unfamiliar
people.

Anyway, I disagree with piling your personal desires on a submitter to
"fix" when they're unrelated, unnecessary, and may cause more work and
problems of their own (or any combination of those 3).

Brian

> Whatever, I am not a maintainer here, so if Jonathan is okay with this churn,
> then it's fine.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
