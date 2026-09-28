Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3185F49D5AC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594022; cv=none; b=Er75cuynUQCU/d1u85v2YGrfu+KLttGDC2wTtSqy1hq33RTv34PWfJ7sVR1E3EsmfhnuinFyTBXkSy+eWCIwZtDu6jfCv/EdB6SBF4ZGHcS7OAXIJQsRoJoBw+t3CJGUKpeBSUs5/XLUU4jFzazxcjRm9Z25fEyaEwlQpM3QWEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594022; c=relaxed/simple;
	bh=aJZPQ4edWA3lYZncuoWmG0yMYspHWYwYNv20v/qP7HY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3vK+svUP40Mm4ZfMEkEBjpDFq91AJm0fkw+N0JTwf9HwgFFEicBORBfc36wb7Ei5bSKubrhyi0kZm6rGwCRrab5wkc77zAJYVpbXLh/GybXgsNm0ZtgWcUb0zryEEqxpClPtI/Q8lsG/2x0U9vAFcK6/Aq8/3/mj5mFhTSDgGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XbvN6hWt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbvN6hWt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7C11F000FF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790594020;
	bh=MIHe+XRPNgxt21DF1Wo59grNY4bnd1tV2cyDv5alb7M=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XbvN6hWtq7Gc6Z2nSfExIXRWIJEuNkPnluPptsPt5vYaMsb1PibVuweoNDB0fdm+L
	 KEfRU/D0PcGyf1jpkgKWvzbtBBoNNe1LkO55cPEe9Hr3sKjAPIeMqoOwxGjjZbW+FW
	 1TCRBnUFPJkw2NmzEIKRADFH27TV9vZnQNu5mteGsD5pCH0Hi/BOWa0/WEddp/NLU4
	 wGAjNIkXxYaDcXWRDeX6Jlx4lRbJw+843iQNseVFVS7vjUV2iwmuj58IK6jlnpv1tn
	 LdhXPX5hJq9707rwynKcK7D9Cveb7c7USTK57gkJCmPTclMCo5nVNn2JdQoy0hhvBF
	 7UPsospz9ejSA==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a612404718so25593841fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:13:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzKoSJEhOFJbeBqq8GG7VMOwfxhC1my3F5WdipC07Jpc4QrBG04YpZODeBxUuR80rtK305uj9ginNEMVzs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfZxoMHYzxAYhkgpSfI6mJ0uMElBH2cNrdfdQLwcedrD4vu4dR
	TVbODDdfB14wB2tuh7X4wpau4EJSS7Gi7f+UjtZZPxGfnC5sByMau5CoP6A5SXO+VOdxl8h+7Wg
	2hjrLEbg7Lw1bk8rvY/aa4m8jFObAwYRpGtqPrDz5xA==
X-Received: by 2002:a05:651c:211d:b0:3a6:687e:9cfa with SMTP id
 38308e7fff4ca-3a6687eaa09mr10595471fa.18.1790594019511; Mon, 28 Sep 2026
 04:13:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 07:13:37 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 07:13:37 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260926100727.GB106095@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local> <20260926100727.GB106095@black.igk.intel.com>
Date: Mon, 28 Sep 2026 07:13:37 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
X-Gm-Features: AclHuK_fRLM3I6TJlNKsPiv5TMy0l8-w-ThsibnU-y4aZY0oE73nB9SQryOtCsU
Message-ID: <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	Lixu Zhang <lixu.zhang@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
<mika.westerberg@linux.intel.com> said:
> Hi,
>
> On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
>> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
>> > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
>> > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrote:
>> > > > In order to avoid maintainer mistakes on patch ownership: move all the
>> > > > Intel drivers into their own dedicated directory under
>> > > > drivers/gpio/intel. Don't touch Kconfig options as we historically sort
>> > > > GPIO drivers by type, not by vendor.
>>
>> ...
>>
>> > > >  drivers/gpio/{ => intel}/gpio-graniterapids.c   |  0
>> > > >  drivers/gpio/{ => intel}/gpio-novalake-events.c |  0
>> > >
>> > > These are interesting drivers, not sure where to put them
>> >
>> > IMHO they should be there too. We are maintaining them both.
>>
>> Do you send PRs to Bart or you just rely on him to take the patches?
>
> I don't expect these two drives to get too much attention, and they could
> be contained nicely inside intel folder and that would help Bart to
> identify that these are Intel drivers. So your bandwidth would not suffer
> even if these two are added there. Your call.
>

I'd like to avoid a situation where we have Andy's Intel drivers under
drivers/gpio/intel/ and other Intel drivers under drivers/gpio/. I'd prefer
to move all of intel GPIO drivers into drivers/gpio/intel/ and have Andy
gather changes to them if he agrees.

Bart
