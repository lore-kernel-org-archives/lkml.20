Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305B13E8660
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788463038; cv=none; b=apcQqzEXn/4wGtOxiiO/T+k4rtntUrGh9rrnrro6+bT1eofHv2j+Ff/9rw8bWNnWPAkGBagTqGGgwPB0xEKR6R8UHuGlzNj8wNUgbHmJJmbfjS1bWR/h1lu7toQve1UVgAj4RcOfT/2AJtddbH9m3GfLIzS86B5Ybtv9bUQVmL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788463038; c=relaxed/simple;
	bh=44N1xPv98QJXFEr0fJ04R4g+ctX2PmuRF5M9Tn5FVCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyqHvkzzj8zJmfCekczfdzT7lfd0s75eN6ErcK7x+h5wr0NYwqEdRFpdy7DhfvC7ht0EEGu//0KBeQNgyDTi5o1sM4RQSfK3BiUKUtv0/2KQjRtz2/j5dYpcvrk0WBqUegfuF/5mD/Bm0S4rexsSXvh28cv7MVg+RgIui+vj1w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChS/OEt6; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChS/OEt6"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf452def93so13265305ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788463025; x=1789067825; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=znvjDv9tdm5LByLeJAxSVDbi04XmkGblSgbOPl30sYg=;
        b=ChS/OEt6qzydSoJvhbTCSLP7IHh2VC251ROs/lSC6vjlAc5KjCu9xeGNsJ2jfwX7SN
         C9RUwo16aJvMA+ivadSNHqHtINuuBT6dUxezrCyaUgqEtNt63KO+qEsfyV3YTglUmL6n
         xUdEPDrW2LTZBSGQfdiFYwRqCxge6LQ3TLoHALVWWUNZGM0jrHGliM0CLTyEFcE1GODd
         gPkxZ7fFNBJ/28I3k6HfhcYp44ykpgKaJC6NT4SosW307YCyYu/1EOResSX7PYb0MmYJ
         0wFL7Fc/CLVOCWrvwiKj8m9KqeC/TlFh6HzjYzD+1jOmkSy/tK6/SOaamZbK/ul9s1wh
         f68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788463025; x=1789067825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=znvjDv9tdm5LByLeJAxSVDbi04XmkGblSgbOPl30sYg=;
        b=HgJ+0MZw/rkp6Az+yynKfg2Prmn11lgzKi1cZiLZ4k0NqzR13ABK/KKoUNl9rpFUo0
         u87oJb0g4CiwGfpANCWMS5sdIJdzZrYpOqepXrr70C7e/LIQjVwZtTNAE/W0BMQ2Eu2x
         DmOXHWxB/EShlk5uSWsSLX/kk5S+tewLL2xE7MWTMRIQ5GqpInZcHCigCl43V4a3/i8+
         U+5XyG+1kAbEgkoMSp38YWjz/a/lSUnYHlSori+vgwMFrX93tYGyiI3HNcShv7cMa9Ed
         h+An8rFWwMH3uzCB+zfCXf0IAQlwcI8Y1DG1AyOj03qLJ8W+DTUuFFc6HSjDZHhSKHhB
         ur8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxmQeqchsMKP6WJKNwU86xt9eqGKLkrhQtF7rODs+967EqVDXV4bffT2Ku6pFLPMLw80KeB+SpwCcOi/d0=@vger.kernel.org
X-Gm-Message-State: AFuF++nBnb7YRQhCKClE4KTmATGwQ3Qteq5zfFtWFIycud36Aq/LBdg9
	nRMh1jKYvdHk2mwHfGPETeaKeAXl4c0YwwMMxf/1ap+hJCIiLr+mCkTm
X-Gm-Gg: AYBFou38r3HcHZVrrslj5NHm3AOQowGnsvfEqN6iw7VG5APOus00cq93dXR1LD+XhX1
	395WSxSuxHQTHIXNicb2PBO1inP5oFEQRFhC+4m1klyx/pw86hfWPRoc48hnCWoJuH29erT5NX/
	1BA2wCjkZJXPYiLZxJOEayGaKxmsLFaS2E+i7qLSYIyMmrDc2G/XVSmllo+J9hBfkYUARl5qF1X
	vNaRFB5JkkkxG+skAIAAn905CYA/pf8tUCsznkLXCZY6tDM/IY0ioAWzG0XgKASQWzdLCjZ8Spk
	qFIRzmkh0TmWewEYKx3W9pWC0+IIaTy2sAk18+VePT+Ftam2BwkcM0RoqXSvgxDrAbMlmNi3dKX
	CU8JcubL7TYN7nl63Zx5mvPUDG2SnLqVzo27D4W6kl50TdlqRW0wN0wp8eYZueXge3pct0dp4On
	XRWmQwLnAEcK+FGBgUX8ieCQT27KKiNxqkuRRDL159tXC4qJGTMpzJqjVLcjn1KfD8J8laSHM6Y
	RZHLNTmQPB6CrQM/Ms=
X-Received: by 2002:a17:902:b217:b0:2ce:b3cd:7539 with SMTP id d9443c01a7336-2db159b5996mr491625ad.6.1788463025067;
        Thu, 03 Sep 2026 12:17:05 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497fbf8sm335185ad.43.2026.09.03.12.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:17:04 -0700 (PDT)
Date: Fri, 4 Sep 2026 04:16:58 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: davem@davemloft.net, ncardwell@google.com, dsahern@kernel.org,
	idosch@nvidia.com, kuniyu@google.com, horms@kernel.org,
	willemb@google.com, andrew+netdev@lunn.ch, kees@kernel.org,
	jiayuan.chen@linux.dev, kerneljasonxing@gmail.com, ij@kernel.org,
	martin.lau@kernel.org, shakeel.butt@linux.dev, matttbe@kernel.org,
	martineau@kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	imv4bel@gmail.com
Subject: Re: [PATCH net v2 6/8] tcp: fix use-after-free in the lockless
 listener path
Message-ID: <apnHqmYZQ4yzOP4N@v4bel>
References: <20260824033331.1084971-1-imv4bel@gmail.com>
 <20260824033331.1084971-7-imv4bel@gmail.com>
 <apaAskNL-IvdcR7h@v4bel>
 <e121d343-9a4a-4f93-86c1-c96dd37f1ae1@redhat.com>
 <20260901085102.5c58a5b0@kernel.org>
 <CANn89i+px52TtJy3S9=uHxGj3s-WueguRo1Z_4FxO=02KLmwmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89i+px52TtJy3S9=uHxGj3s-WueguRo1Z_4FxO=02KLmwmQ@mail.gmail.com>

On Tue, Sep 01, 2026 at 05:57:04PM +0200, Eric Dumazet wrote:
> On Tue, Sep 1, 2026 at 5:51 PM Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > On Tue, 1 Sep 2026 10:03:51 +0200 Paolo Abeni wrote:
> > > > Looking at this further, unhashing the listener and then calling
> > > > synchronize_net() lets the disconnect path handle it. MPTCP needs a fix
> > > > too, though, because it closes and reuses the first subflow directly
> > > > without going through tcp_disconnect().
> > >
> > > This looks like a more palatable approach: this patch in the current
> > > format looked way too invasive to me.
> >
> > I likely lack context on this, but I was wondering whether we should
> > potentially disallow the transitions between listening and data sockets
> > instead of fixing these endless bugs?
> 
> +2 I think I mentioned this at some point.
> 
> Same for IPV6_ADDRFORM : we should not allow transformed socket to
> even use tcp_disconnect().

So.. do you have a plan for this work?

Or should I send the v3 series first? I am still looking into related
problems, and it looks like this series covers most of the "important"
ones that have to be handled right away. What is left seems to be the
UDP side and other minor problems.


Best regards,
Hyuwnoo Kim
