Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196360;
	b=aPy5c6s/HQOKmPZez64Sx3g00bVnodImgOBpoyVX7wZTZxQ38XeicOlIA88myMc5FcyY
	 3BLiggVV9YYjUFtdEKDJDS+sNrhPTBCCjd/RdxUi/9apHwrMVmri8Jv9fuKB7w9Cvy3KM
	 DvWQ2ERjACzwk578Lml7f/blDNnc+hKghe+TOtOwwuCpl3bP+mO/z2r5GHHU/4+GVSa17
	 ZBotApGzpxcFOmW9YJCJDT6TZ6zdiUJmw1y3cMfU3OzZgi7xnxemC3dCmIkqu7hgg4p9e
	 HHCuGY/BGKBLHk/f2bEzV7aj/s6O0yqsHKimbsKJg/+F2af/n+IrliasCfibdOJ08aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ktV8g6OCQOTn0mseEcBxpeYs+06mrhZCNdJ8EGJJjMs=;
	b=H8f1hzNAbRZLZmS5vsY148HxCLmtb5gngwjqzuumYA3rdbdG8AC2VnPRAmnwDGLWoUym
	 IVYwULK+nKTo6o2O0TggnSf7BTeBuy2o5XtBA52JXWzoqO1hyuISOIyxI5Ew4LK8PsdwE
	 IFo9KaVgK0kSlRWE5bheArjU8NYGUyniSBC43E7eMEeGN0OINxUkR74gibUt+xJeLxKyX
	 dmbvmuZ5/g+1POTqhc+0FS7BzBAFnY2xIk0bw75zAfoYe1Sd0xKkc3n2qnoISaFBdlncX
	 aeB5UZrJQCRVwO7WtUW0rMJFF2ElaNg3BfSaQAHsjZXbIz3SlS99/XoxctxWj10desA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="AS1/F5xF";
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1029606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1029606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AS1/F5xF
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso753228a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793196359; x=1793801159; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktV8g6OCQOTn0mseEcBxpeYs+06mrhZCNdJ8EGJJjMs=;
        b=AS1/F5xFkp3DHHog6LmWOsKtrkikN9qW5dUW5mhIWXDT1xEzC3+QuVXEsX/RJEa6lF
         74oI9jf0ky8xeStn+0qcad2h7IRay7K7oNZiwwoy/FffvCgL10nLbPlZLK96K/sTe94R
         gDoderA9PSqWdLXsohqSO7wky5zLcZESoeuySAzBXO8H8+SI+Cm6k7dAnzRAh5RMVze6
         lzHtXfcz3GkYgrTTsDCv2utcCaRVMRW4YVEzUBMZgQe9NXqa+VpY0rKnbT2ZCvpt531k
         oIlIKCursBFSUe8LEkVXChvkGuhKxt7WpE2ptsO6VbaKmgKdhhkE50S75hJ/YTydttzk
         +ejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196359; x=1793801159;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ktV8g6OCQOTn0mseEcBxpeYs+06mrhZCNdJ8EGJJjMs=;
        b=cqYOre1uRk+qEq878oHI0o5ktuBdf1bchC0kFAs0k5RYT/mRoV2zCHT9Tm6KlNZPvO
         jaCYui6VEBXvwr+2fT4D+mGdyTSpl3jwI/q4nLBORAP2JHuZWQq48xvrYRF0Qgs1ux7o
         fB3vGk1pHHR/0lc9KftigmHyIQX+waJFRWZgcyQJu0ZC7WOMvcuv8/SjGkzTBkab48ge
         fqo4POvuonIJ3uCnynM+YQDjscJLcNiW/K+9ZYCA0yZBJq0E4LxYTGyzYbxh9IYkUEjS
         4Ad0YgQcnruX/AzQw7UhSBe8RIB7YnjjwY4RpFF9IBkXi290iDEvMyecyqZBJHjsKFas
         56Uw==
X-Forwarded-Encrypted: i=1; AKwUvByWdlczEAvKxav74tmDu6AKv3v8ugFpYGjMgCqVcen+uv7cV5NyY8ABDP0VmlpCyFxOkIZ1ZYq/1sEWySA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9I0xhkfuXfF2JfMBx3Rv8U+cgJ/OBhmWjnXhNq5X773jQodoK
	eIYiUlr8iKUrkLzLnzS4Hp5u3jU5CO/MrwGm/cUDLbUt6y44Uj50r4trO2lk5oIcq/ONGLeP7t+
	HatKzZg==
X-Received: from pjblr1.prod.google.com ([2002:a17:90b:4b81:b0:3ad:49c6:fc96])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3841:b0:3ac:9259:1234
 with SMTP id 98e67ed59e1d1-3ae58176ce3mr1743369a91.39.1793196358849; Wed, 28
 Oct 2026 07:05:58 -0700 (PDT)
Date: Wed, 28 Oct 2026 07:05:58 -0700
In-Reply-To: <20261028044653.GBauF-PdTS6gsOOozC@fat_crate.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022040047.GDatmKb9L_fwqBGQ0_@fat_crate.local>
 <auDBUQQ9Ympsobkh@google.com> <20261028044653.GBauF-PdTS6gsOOozC@fat_crate.local>
Message-ID: <auIBRhu4Zs3UgsQ7@google.com>
Subject: Re: [RFC PATCH] x86/cpu: Change AMD uarch detection
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: x86-ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 27, 2026, Borislav Petkov wrote:
> On Tue, Oct 27, 2026 at 08:20:49AM -0700, Sean Christopherson wrote:
> > This is better than X86_FEATURE_ZENx, as I always found the lack of inclusivity,
> > e.g. ZEN4 not lighting up ZEN3, to be confusing/surprising.
> 
> Yeah, I didn't think of this simple scheme back then.
> 
> > But why invent another scheme?  What stops AMD from implementing precise macros
> > as arch/x86/include/asm/intel-family.h does?  Providing range-based checks would
> > "just" require more macros, no?
> 
> That's exactly the reason - moar macros. I wanna keep it simple and instead of
> having at least 5 OR_LATER macros, I wanna simply do:
> 
> 	if x86_uarch >= AMD_UARCH...
> 
> And who knows, if in the future the scheme becomes even simpler, like it was
> before, we won't need those either.
> 
> But I might keep the uarch checks even then because this is a lot more telling
> - we want the microarchitecture version, not some family, model or stepping.
> 
> And mapping f/m/s to uarch we already do.

I don't particularly care what the interface is, but as a "downstream" user, it
would be helpful if Intel and AMD used the same scheme(s).

And FWIW, providing the human-friendly codenames is very helpful even if they're
almost never used in code.  E.g. effectively documenting that Turin is Zen5, Genoa
is Zen4, Milan is Zen3, and so on is helpful, because even with search+AI, it's
hard to find information you don't realize you're missing.  Though that's probably
orthogonal to the interface.
