Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2F5352C4F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764200; cv=none; b=ebIF8yeLCS7h1+8Y6WuWOBvqFkbwn+VMcmwhrNDpfoCGj7uNsXP8nCOMWoN/UCxjECqcBpyLB7OjgX4faDsJ769POkmqmYDUx8aZVzVMIcQ3c63AFSnI0VRnqfyQaXPqMT25DI+AKBnTQxKSIpcWqmDysGam+nOyb9e5lXNZBWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764200; c=relaxed/simple;
	bh=HryDV6+5qMbLhZY2KERuGiFp2ZKXAOvyWcXmP57Eq3E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jtIr1MXwAIZhvcAxpnu/y/PCpyJQXiqa2dBnewwpBAuzg2lzBhON4Anf1RcGn06ksZ0f5WVIh4X9/65+DxAXwPFkNw4jbD4sJim/Wfw0w1T5KeKqT8XQHFBDWgGVOApFwifhqw4yNpQHymbfPc96yvoYRGFtyUgjoJhjB67hGOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDZeQKGj; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDZeQKGj"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a5e866bca0so1505327a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787764179; x=1788368979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TJATd1QCK8mzBoL2c8+JxSkXmq9RldTbZrwKcwNjBmk=;
        b=kDZeQKGjuHP6Ge59bPmUk6WLTc+NcJVo2XZ1RnDwli+aHKDJAUteHSksxGVCdR8du1
         bAlX3fA2NcX3AnXBJU7KEwF8QJ82o0afYQ1yoEks10qxCmhjvFJyMRhxUyWrzvpO6Sj4
         e56n85zapKxQLnEDpayB4Oo7O6hkMgnqLhzRvOI04G80GgjzotdM7u+jrApjqOUiDekE
         Sw2qaevbutXor/bcuUNh6UvAQfGa0s64DntC/iy122R2E8qD+Bri8AsE9m8N9GCtjPlL
         X93R02CxR8/3bjmcG4FiYQ3CDYiqIG5ZYYxovOiOxNEKcoITwgL6IdaAjbpsaqtLPPzt
         JmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764179; x=1788368979;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJATd1QCK8mzBoL2c8+JxSkXmq9RldTbZrwKcwNjBmk=;
        b=f+3Q++qfh9jWKSooZQTYgdnx7ETQannBidBVIHckghXKUv7n5PuGs93BxhsPezi7lc
         UH503ULyVsQGzjLlgzotNlwv+95WQlaFK8YyiyDjRlG08ePZLqYX3fwTlJgvS37EiLrd
         JPASC25yHO1hxBys+NHv/FQdpbWN6IkxQmDs3fy/sDF3kJTehYrXcJ/g+4gPFGZK6rhV
         LUfZhQm8jWPefUAAExWvogB3sMc+XXr3hIx+wdnlHHiXtKj8Cryt0OcCM7zvkYRcWasv
         Kiakw5smgJEcLG/IE0b4r9CiNdyA/4m1RSogEGbGwbrBr+z9mS9oxUa9Ynf1qEe9BHEP
         v5Mw==
X-Forwarded-Encrypted: i=1; AHgh+RpUCsMsyaR1dHQuY+9IcIkcxH2QI4xvREI3eW6P6lF+1sGBS33+MbIUHeAKVe1SOoSTsXqs1qhSn4402zs=@vger.kernel.org
X-Gm-Message-State: AFuF++mZKLeSiV6gQI+QaZucyTxfZzt1xMQ+vkhG60YuW0Pf0nhUumPL
	vfulJvZh/HjvI4KcmRaLojq4K+gIZYmJqVINZ84Xur4MQBiqwi7KvFsu
X-Gm-Gg: AR+sD10Vhkiy4smIuvqArw1mKjXT8fWmiGvDU4QtFs/EoFKAC7gfgVWzpE06iHvLzl5
	d+IZ0o4N1rhQic7ezgyzJRYZyoOqk5tpMaO0sNWsyjYwS5nfVcmCyX/q/sUKnWVUG0KWBy3K0iy
	dBYqvRGJgEWKyJGy8AmavGYrcURvq6BXBExmWaBSFNXYS697r6MOkWBAA7v5H9DhIRsb/kbp94P
	U4CmDnFrZTRo7gZvMYYjA80q9MBZFmy5MMZ/iwGTw//RAOwT8sdmBIss16uBHuvKy8ONQsZV3b6
	bApvJ0QKmKL0NjUXy5oAeNNYuh68X4dyyPFcWmQjV35Pct73A3ifp7VbWfItHWSVK+XULHRcS+l
	swVQjTnMfYEYHiLk8hd6ZLt2B+/3cakeJvkkQ+yKOto3zal00Fzh6II5G4gyt0HC3jC/D6YaMhM
	bKtlCe6m35Qly6fhfUfzCzKSOIWS+nc4oinoyWisAaJFTnX4b6n3e1/NhgPWlyAn/OAMo=
X-Received: by 2002:a05:6402:a0d9:b0:6a1:f092:3c1e with SMTP id 4fb4d7f45d1cf-6a5df6410cemr9897163a12.13.1787764179194;
        Wed, 26 Aug 2026 10:09:39 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5edef3c26sm2563163a12.17.2026.08.26.10.09.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 26 Aug 2026 10:09:38 -0700 (PDT)
Date: Wed, 26 Aug 2026 19:09:34 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20260826190934.5042b344.michal.pecio@gmail.com>
In-Reply-To: <2026082634-cloak-ambush-3861@gregkh>
References: <20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org>
	<20260826153311.6340efcd.michal.pecio@gmail.com>
	<2026082658-statue-census-dc39@gregkh>
	<20260826173549.18c8a89c.michal.pecio@gmail.com>
	<2026082634-cloak-ambush-3861@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 17:44:06 +0200, Greg Kroah-Hartman wrote:
> On Wed, Aug 26, 2026 at 05:35:49PM +0200, Michal Pecio wrote:
> > You can't bind random drivers to random devices out of the box,
> > you need ID overrides. And then you don't need to bind manually,
> > the kernel will happily select the wrong driver by default.
> > 
> > Authors of the recent xhci and thunderbolt patches admitted that
> > 'driver_override' was involved in both cases.  
> 
> I'll be glad to taint if driver_override is also written to, but it's
> bind() that triggers the actual action happening.  Or so the traces
> show.

Well, I suppose probe() is the first victim to crash in such cases.

But if Syzbot is binding random drivers to random devices, the obvious
solution is to ban 'driver_override'. Using that is just cheating.

If it still manages to crash drivers by binding them to appropriate
devices then I would say it will finally be doing its job right :)

> > Meanwhile, Syzbot also found a stupid write to freed memory in USB
> > core when HCs are unbound. You may say it doesn't matter, but:
> > 
> > * USB HCs are hotpluggable thunderbolt "gadgets" these days  
> 
> We support PCI devices being removed, but that falls under the PCI
> hotplug rules/requirements, right?  Anyway, sure, we can fix those bugs
> when found, but that's not the majority of what we are seeing at the
> moment.  Look at all of the dumb platform drivers that are getting hit
> with this on the syzbot reports...
> 
> > * there were plans to alter this code so that UAF is triggered by
> >   hot removal of the USB device, not its parent HC  
> 
> I don't understand what you mean by this.

There are ideas to change some code to use per-device data instead of
per-HCD data. Coincidentally, Syzbot found that this use races with
freeing the HCD and it would also race with freeing the device, making
the UAF easier to trigger after proposed changes.

I gave it as an example of Syzbot doing something useful with 'unbind'
when it isn't wasting time on driver overrides.

Regards,
Michal
