Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868591;
	b=i8cDPSGKMSUjcoJM/HVPoNnhkjaDMZ4rd30POjEK5ZTpUIKYLKH8gWiogVLK5B3RqPvE
	 9bOKd2/k5aLyiv+TPaBJXW5VD9jfFSbgfXwp9N+54HstMFF9kPsJ/ghzwGQswuc8YXxJi
	 Z9LTHHFSnD4wuQYU7/DmIK7/JJQ2QU+8IwdVh4hr8IMaPUpQW3yMe+PS2EGBky5litQ5O
	 eBP8ZJScnFYHHVxIeOsgzKoiG51uqx5JZcjTK5c0MQKQe5aypPNwbLneLUI79egVX2U36
	 YeI6aHh1m+1pWtbkeU2m+w9K5gkfnPZ8b4zrCC04m0WxAtsCOAi50JjsqMm34Ev+Pmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7eskyEXW2WJu1OAVnH2Z/C+gXSpaGa/nzLhd+PYAulk=;
	b=X65xrqBgL702HK7w8ZQGv7lKHstptkyvUVYJIwOrjOWRPpSPb2rdwgBkoc9pFv9rKo3V
	 SjoXe16WVI55ai7+wEpyDvvcHxIyrI6QQL4agJTIeZLTScIRyIV3rVgUKaRYF4XFXjEgB
	 Hnexb5LLjff6/D1uMJXaXyOtB5Sq5IG4D++kG2H/YcHvtmUzFVBoNM+6kyG8WUk+R9+XE
	 1pTS6W/3VjHERgX4mhtarMhbJG+n3spHEZM+50qDCNTfKHlPlluOAzT8MjrnJ1MrE1h+1
	 oWobWRoZ/0wk76lDtMWgLMnyG8G0x7AbFjorRncarO6t1K8jOlGt/Wq6YronWSeGDxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ho2RKx3r;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837BB606A880
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 837BB606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ho2RKx3r
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49134c8509fso3866950f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794868590; x=1795473390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7eskyEXW2WJu1OAVnH2Z/C+gXSpaGa/nzLhd+PYAulk=;
        b=Ho2RKx3rEO2FcF7PE8ocDweY86W0zoAnenCU/35zG2WC3UmxIGinYrRzcyNY4fMZzP
         pmOTim/ajW0oE2Vc6v9ZiaDR3xtyFg3UUlPkbkByU24SB+naN8aPsMvG6mrB4gUU4o3a
         aT7dP4DcGLpPpvw/L0q7i/jRpmzSGrbj90bmB4Yu66QdxwujUFcz+AL/ysjpT4RL8PUR
         SmAKBxEVfocPjFzODut4/n4szJF4GoebMhd81kh1HCWD00plY+Z865Jduv6t0A9h7wT8
         p8BrpHQ5YzCQS6euDyTLMjjV9SdeVVXkVYkABCBy3eTrnUzDFguCiHMIA/vVukhjp6vU
         KzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868590; x=1795473390;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7eskyEXW2WJu1OAVnH2Z/C+gXSpaGa/nzLhd+PYAulk=;
        b=emymgPiOVdZSfeopLXB2eAVuksX1oX6a7XDQW8twVXdjMzglvJTAx5JwCvRtTcGrYk
         836fU8OhoOsfPROo5SW6VNP5+4JeZBfYfAHgi1Vc222pgUsVWfUJpX75ToNfATsRVNsy
         T9zq1+gaRSv46xrq1xFqlXIw566XtZh6dQ/K96Y1z0RF9XbPpPsn0cu3vzIp0bOGKI4O
         nRRbpHLSS6+tnItwGINevE/vwUstFfaGDbjhu9xdpJ7pZ7wLbUmVu2PLRfuhNj5xZR2a
         wetgxl5xspPwHGKHdgsORleBP32XRJEAQbfmuW8OtxuSsyAMdwvVHIdmb3rJM8Ih+jS4
         WcmA==
X-Forwarded-Encrypted: i=1; AL+hErFGDY/qTOub/pRIGZYouE01BRSvhPWycqMe8FUk56w+cYBwJtiaY1dk0Qc3a68RZXsIDYbkLyYek3eRHbA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Nz7gme52oH1IkrMOJcN1EDeHoJAczD/xqZYfBdZyGff5kxH3t
	GTBdbuA8o6NhYxOGa6mm5b9qOVITJ5bA896cRKDKckTgb22iUsogiEmwW17PWhOU
X-Gm-Gg: AZFdTZdZlvo3HuqPSfpLtphuwKR5WQIaXQzhMBs3AiaULxte8PJoxlUr7WaijhXRRoX
	FwtPdkPCqA7AbEpUU5AmcnA0JRHxsDeDnW2rcFwHbuOTFcoIilhtloCP5rgpSDVU5C8p9CJD1kz
	r6eUw4G6QtraCD2ZBq07tlYtb6WM8lRJDXeRZutftS4Zv5dfpwHxRBoCmUKSPzs+5EF8gU9TfAk
	bVnbmfAHmLVjnZQRmMc6FASaXpM9KN7ORJXGAKScTz/paX56+RjvYJU+ayRfFHj0/lVepmx3pm7
	NZjLRVJjOXAyJjWezzakWLDmx9ttNEIOBcFljoM8KlNDBWgpfjo4/NN+wBIWeY6w7QCEMuZE/UA
	RnPoZlrUKBj3DNYQLx7xRkli6HgfuSjo7GnVqln53mPJETVZKumg/e6j8X+EmxwW2Ztb1c2bbr0
	3urCCC5CcoSLUViSZFuYSuNjazAgTGND4NUPHgq5qiVz+iUKStPuJImmaWG9wUdBsSDLFK3acNR
	T0sDMw4RLqMWdHMkL1KZFxfW6PM6GbnZhrgnNAeyNPTQQf2J2j7975nl3FcRBzYsMtbQo8900QF
	8ivY1hH/RDpiZf93kFDFFiFYg19u0w5xMP9DTKRYgvK2QEr+GSoFeIAAsTEOnmDvV1c=
X-Received: by 2002:a05:6000:2402:b0:48e:5550:c64c with SMTP id ffacd0b85a97d-49c70ed7fe9mr26111904f8f.14.1794868589842;
        Mon, 16 Nov 2026 14:36:29 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1797sm27428709f8f.11.2026.11.16.14.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:36:29 -0800 (PST)
Date: Mon, 16 Nov 2026 22:36:28 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org, "Borislav
 Petkov (AMD)" <bp@alien8.de>, stable@vger.kernel.org, x86@kernel.org
Subject: Re: [tip: x86/urgent] x86/build: Do not allow X86_NATIVE_CPU to be
 enabled when compile testing
Message-ID: <20261116223628.5a6139a7@pumpkin>
In-Reply-To: <CAHk-=wgmkoWHWwaQ6nsGoCiBp0hrpJuiwmoVbQ=Efun8JyUNKw@mail.gmail.com>
References: <179480914308.3191731.6125228756396043444.tip-bot2@tip-bot2>
	<avrPcQ4sOkgJPbkZ@gmail.com>
	<20261116130159.GA1327949@ax162>
	<CAHk-=wgmkoWHWwaQ6nsGoCiBp0hrpJuiwmoVbQ=Efun8JyUNKw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 07:48:34 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 16 Nov 2026 at 05:02, Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Mon, Nov 16, 2026 at 10:40:01AM +0100, Ingo Molnar wrote:  
> > > Can we just limit the feature to when host == target, ie. to not
> > > work it around in such a crude fashion?  
> >
> > That was my v1 but Boris didn't like it:
> >
> >   https://lore.kernel.org/20261113-x86-no-march-native-on-non-x86_64-v1-1-cbc8b096d1c4@kernel.org  
> 
> Well, that is admittedly very crude and hacky.
> 
> Maybe we should have some config variables that depend on HOSTCC, and
> detect it *that* way. It does appear that we don't have any model for
> cross-compiling in the Kconfig setup, but maybe  we should..
> 
> I'd actually love to have support for making the compiler itself part
> of Kconfig, so that the gcc-vs-clang could be *in* the .config file
> rather than being an external thing to it.
> 
> I've mentioned that before, and the problem has typically been that we
> end up depending on 'CC' outside of the Kconfig scripts and
> independently of the current config.

I don't even remember a check that the compiler is right for the architecture.
I'm sure I've got strange errors when I've forgotten I need to specify the
compiler for a cross build - and then forgotten where I'd put the compiler,
Oh and forgotten all the things you need to set to get clang to do a
cross compile.

David 

> 
> The recent work to move the compiler flags into Kconfig itself may
> have lessened some of those dependencies, but there's probably still
> lots of small details.
> 
> But for the whole "cross-compile", maybe we can just say that
> X86_NATIVE_CPU depends on '$CC' being the same as '$HOSTCC'.
> 
> Or even do '$(CC) -v" and '$(HOSTCC) -v' and check for 'Target' being
> the same, and having a CONFIG_CROSSCOMPILE thing for that?
> 
>                Linus
> 

