Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BAE630205
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418729; cv=none; b=M0SrZWNrLTivLdmSnuwnHYwqkE6ZoS1n+DDHDh73mURGkCNtVr+AhWZg+HkmPCYfv5r03lqJxH8LRUwHFb0EMqvq12bqA4nJEBLvbK8ctoDBPpvCBNnjEy7YkDI9bOuqnYWsqT0zGWxxLRfXWXIKBbSsH5jNDxOf+1CzYo6b8jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418729; c=relaxed/simple;
	bh=oVNXc+V8bxFlM5/JuHb/37E1Y61LB6U6LpRJ9uktpms=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2IIOnWMksXuc5Ng45JFkgbS9f/QMRJ9YdNqa/6dX9967j21yAtlUqYU0B0DV0lgAJoztyW0NvsXEqPy0i6LqNTKHgl368ddfwz1q6yPkq5PWJu4aiIfBTODOYOEuLoyjE/Ik/Mxf3baUciiQGryZxPYJar+11PKC0P7xHt9qsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLhF0S9B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLhF0S9B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669FA1F000CE
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792418726;
	bh=zuzxYH3qxmAIs1H/pFDcltQGq6gg7ReWXBtwym7GJs0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TLhF0S9B/dCRPhcRGeeHYmK4Oc0LHYhcYRCYjU4SRDPpCn9epqaNQ3IfiRnthP661
	 t/EhQRt7V7p0bmbPdkTESsMiQbqhTAOQ0ebmyWEHpc1efcFKtAWJ/eBGO5RU/dw6W6
	 uSK/tccvurogadFUVsdWrAjXZg+znAMy7tuADv+n3vDI/D8U/fNezTxdKsmxEOHNhj
	 daT+13JdiNG+BDqJSJwczw3BWyyKQxYcvg6umUzVZKFlqEH4Q1jAWRghtChwgyLLhZ
	 GWNpmxtL2PBy0zuYvDrkJkXvHVT8PoI+ieZRWI3vkqxKqMEHyqjy49P1gltYfHnutq
	 9kYo/cRttSqQg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bce4e278baso971850e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:05:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzc5HxjyFiNND3h4vqbSoBGWj6/3L/rsqxaHcqUgPMVIYAt1VCw3DpxiuvsdJCvTNQJm06zOuRloBeZvQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPvLlAsvymhNJAATYiVIq5kob8twf6LQP+mB1yEagNhbC1CIm2
	dlT/6PF/h3hHYOgjLP6Uyf8CPyO/EzYW8WC6UWs/hms47r1sCtb/3FsUZO2pYM+mI+IHJNPh90r
	97RtjSbuUP6gdmFWHOFY9Aid0oUhQh5oCi+ceO6sBNQ==
X-Received: by 2002:a05:6512:2207:b0:5be:3607:3aa1 with SMTP id
 2adb3069b0e04-5be50a5cb7emr2280989e87.19.1792418724952; Mon, 19 Oct 2026
 07:05:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 16:05:21 +0200
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 16:05:21 +0200
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <709ddfbbc57ce8f666fc8ebd7fe48dafed39ef33.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011121246.162759-1-tzungbi@kernel.org>	 <20261011121246.162759-6-tzungbi@kernel.org>
	 <CAMRc=MeWy7UQrGEr7MG5KT1b_NeLeEc9cYb+sAWuzU3shw620A@mail.gmail.com>
	 <atYEwbTCcuYa5ShB@google.com> <709ddfbbc57ce8f666fc8ebd7fe48dafed39ef33.camel@pengutronix.de>
Date: Mon, 19 Oct 2026 16:05:21 +0200
X-Gmail-Original-Message-ID: <CAMRc=MePpaTMC2k8C3B5ue+QtYQQK9vX63n=v18J+fnaX4=0xQ@mail.gmail.com>
X-Gm-Features: AclHuK8_39mqVufTjX6G0hE3BUUJ6O7EhvypugyGmEUEHXU8w5r3dj164vWc5J0
Message-ID: <CAMRc=MePpaTMC2k8C3B5ue+QtYQQK9vX63n=v18J+fnaX4=0xQ@mail.gmail.com>
Subject: Re: [PATCH v14 5/5] reset: Leverage revocable for accessing struct reset_controller_dev
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Walleij <linusw@kernel.org>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 14:41:47 +0200, Philipp Zabel <p.zabel@pengutronix.de> said:
> On Mo, 2026-10-19 at 11:53 +0000, Tzung-Bi Shih wrote:
>> On Thu, Oct 15, 2026 at 05:49:11AM -0400, Bartosz Golaszewski wrote:
>> > > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
>> > > index 38e189d04d09..788a235c3965 100644
>> > > --- a/drivers/reset/core.c
>> > > +++ b/drivers/reset/core.c
>> > > @@ -24,8 +24,8 @@
>> > >  #include <linux/property.h>
>> > >  #include <linux/reset.h>
>> > >  #include <linux/reset-controller.h>
>> > > +#include <linux/revocable.h>
>> > >  #include <linux/slab.h>
>> > > -#include <linux/srcu.h>
>> > >
>> > >  static DEFINE_MUTEX(reset_list_mutex);
>> > >  static LIST_HEAD(reset_controller_list);
>> > > @@ -37,9 +37,7 @@ static DEFINE_IDA(reset_gpio_ida);
>> > >
>> > >  /**
>> > >   * struct reset_control - a reset control
>> > > - * @rcdev: a pointer to the reset controller device
>> > > - *         this reset control belongs to
>> > > - * @srcu: protects the rcdev pointer from removal during consumer access
>> > > + * @rev: revocable handle for accessing the reset controller device
>> >
>> > Please call it "revocable". The name "rev" does not indicate what it is at all.
>> > Same elsewhere if you call it the same.
>>
>> Ack, I initially used "rev" to keep the lines shorter with the revocable
>> APIs, but "rev" alone can indeed be confusing.  On the other hand, I feel
>> "revocable" is a bit verbose and doesn't indicate which target object it
>> protects.  How about calling it "rcdev_rev"?
>
> I strongly associate "rev" with "revision".
>
> I'd be fine with "rcdev_revocable" (in struct reset_control and
> "revocable" in struct reset_controller_device).
>

I think "revocable" in both cases is fine. After all: we know what type the
dereferenced variable is.

Bart
