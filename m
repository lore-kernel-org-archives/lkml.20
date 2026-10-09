Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B892D3D1A82
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791567273; cv=none; b=WhmSXmHa38IWDHA1lDTvjwfEjFp8VG5VoOvsTU2EfNvc+8tjjRgcOaXJTqs4W7MuTQOCP/1wPa3zA6IpaLxwAQYPqiNVsq/ZTTM9PhzIFwu+Evj5IzwkEeI0PaXXZmeA93BVm0P0Uewr/qPK4jVsv7u795/NaycS4vC/0i0DWlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791567273; c=relaxed/simple;
	bh=UpiJrSWhkErhXPxV3FL2/OySz2v2wxDssZMQIaO18jM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rpd3w37lX08PZHAqCle+N4H/wy9gKZcbDrGejus1s+p5X2nLmj1adE3MAYRhCdIp1GC0URAnOI3H3yFreKd/3ik4TmCDyzcur7NGrE4ZIfoAu5XeSGIYQ72vERCHgXLo7UMZfFC7y9Sz9BdDQwhEyW8v/nSrWQYwth5AAUPiOdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KpenERko; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpenERko"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so763225e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791567270; x=1792172070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rk8GIteAzDc4zWM/lV0RC8+n9X75M+8oRwDQaNES2gw=;
        b=KpenERkoJ1882vHqUzH/VGitmJwBlz5eXpXL69/V/gYEioHyousMh+gSP8LZ29tZAt
         GSu1UIjgRE6LI5fNrLk419oJOBzFWGGuMg6gsC3+iElD3p+06TJC6fva90UcL5V8IrWY
         /zMxP4Ceue57QR3URlbyQw3BRGJNsYGHegmzGDIuGrtYvkquFC4swfWZYqHM2LBwjcOP
         2XDbqgGGhZXQowuAEcnVt1DswjMLN/4HyTkZUDapRXKWbhLZyzfhfTWItIR3thtbgELA
         yTccsrGD/JXgAoqV0gYRFZYM5Pac78VpvnrXOqM1D0tmniuqQrU2mQyYtmFeTAxdSJ4T
         AKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791567270; x=1792172070;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rk8GIteAzDc4zWM/lV0RC8+n9X75M+8oRwDQaNES2gw=;
        b=gCEJynZZBPNh8fEpTakrP+tEVMjtt6wLX/dvG0gNN9qeVUpzUCfHKzXPcxmm2yi9+a
         apRzodxvxUDMPAYOk1RfZ8k15MNz/88BRK70rrUEZRglOleru/P4a+DpEOJNEOgWk2Wj
         sQxjJIteLco5q3S20cGtFkv5GmfYjjdlwYbWHbAKlLpc4DWiv6R7keOYJ5NM2idHs115
         bAgr7TD/Kq0nGh6PlhdsKS4j+oLUbQ0BP0MsYRRJzF5dWeeKxGEfgEM5MjCv+1Xdr8AS
         6TEc9xN6kuyfPPobodppUH66bRVqBq4pDxrsKsqVrbDUlrGmCCE9xWfQ2amg3t+yaVoV
         gitQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmXsV6BzctRtABaOof0imgeDquJGMs4agEsyVMjbo3GSmHeBoLLgHSI0WrMu2sgjtoExXZMoVAgt80vU8=@vger.kernel.org
X-Gm-Message-State: AFuF++meY/ytpQDR78rtvz1Q0kFcCRVXLOZERGJKsJjAKBM4I/UkCcKB
	yUiOKS9Ekwckz/b+fdUB3ArxWMoMxpHPQph/jsZAVdftGNo0Aa1mxH3f
X-Gm-Gg: AYBFou3ksFbycyfcS59YoaIjhgEcXuZ8b6Il4mO9D6lKMNlO+6WMYWQ3s1hdiy1fbN7
	RHjBS9tNJ985THSSXLbcOtt775sdOXJ0zDwFTSAJNstrjDit9g4+uwOwgJsP28l2KO+EvHtMfLq
	4G0BYgGHfULsEEW3xtBgQCy4ivVcDDKIlYBj/6OjjixO/sY8WnOlB+mnp9kxpNxD5Iji9SJZSW/
	tl1bQZtpURRnPRZnySg8dOTddeVfn/L2Adae9iew/VPKPXsrBttNekgHilLLFqqx/srK0af1Icz
	u6zu9d+ri48uhTsP61ezgvJ83JMKgozCjgU1hbxdEBp2hlhiDGz76cvhS8t6wIbYIEN576je/5z
	05qPpHDucoBqF8cahu3o/ES6ku1jD5E9A8Mkc432jE5gA3swbae51zZQ1HxF+/8TTtqyisy4BTr
	yjEEMCPcBVZaSVVJ0orJwv8r2byw9zjuo9IlXjiuz+wyxmrynf/tC4BgM/qnh8y3XmedJ/kJjMr
	MsHOxVBgwhDmpgyJk+an+O1Q6vMjqvncfo=
X-Received: by 2002:a05:600c:3146:b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-4a18e4af3a8mr54413095e9.19.1791567269816;
        Fri, 09 Oct 2026 10:34:29 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac94c6sm5003011f8f.42.2026.10.09.10.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:34:29 -0700 (PDT)
Date: Fri, 9 Oct 2026 18:34:27 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Petr Mladek <pmladek@suse.com>, helpdesk@kernel.org, Steven Rostedt
 <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: Create printk@lists.linux.dev
Message-ID: <20261009183427.7a7d71ba@pumpkin>
In-Reply-To: <askBpT-dk59MzcTP@1wt.eu>
References: <asjrq9g8EoUGepcH@pathway.suse.cz>
	<20261009152627.285d814b@pumpkin>
	<askBpT-dk59MzcTP@1wt.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 Oct 2026 17:00:53 +0200
Willy Tarreau <w@1wt.eu> wrote:

> On Fri, Oct 09, 2026 at 03:26:27PM +0100, David Laight wrote:
> > On Fri, 9 Oct 2026 15:27:07 +0200
> > Petr Mladek <pmladek@suse.com> wrote:
> >   
> > > Address    : printk@lists.linux.dev
> > > Description: Linux printk and kernel string formatting development
> > > Owners     : pmladek@suse.com, john.ogness@linutronix.de, andriy.shevchenko@linux.intel.com, rostedt@goodmis.org
> > > Allow HTML : N
> > > Archives   : Y
> > > 
> > > Reasons for the list and additional info:
> > > 
> > > Honestly, the main motivation is to allow sending Sashiko review
> > > for changes in PRINTK and VSPRINTF subsystems as a reply to
> > > the mailing list.  
> > 
> > There is also the smaller/faster printf code in 'nolibc'.
> > Might be worth mentioning that as well.  
> 
> Better not mix the two, nolibc is purely user land code and doesn't
> have the same constraints.

The kernel version is actually horrid, rewriting based (loosely) on the nolibc
version might be an improvement.
But I'm not sure how I could do it without it mostly being 'one big patch'.
The nolibc version is much more of an embedded system version and a usual libc one.
Things like not calling a function to add every character to the output help!

David

> 
> Willy

