Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13103DAADC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531042; cv=none; b=RVpfkpke3LRDDm6+sqXNSs7e4TuuqnMFLyYKWbS0xbv9RicFgjwNCGMwjFb+tv5Vw4/ZB49RzQCiGo9u+3ellYs81vdvj1nP6wN5+Lvae+iOnCA47JSTN/TwKtKrW9URLHIEa9TJcGv2VnaT6OYau6GKbDpF5m8JMB907hdKtpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531042; c=relaxed/simple;
	bh=m2sbDzTVz80zNixXWIi0WDat1SU37qeKuIL9ZzrWE0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8p32DxRoHY2hh6sZNi4lxkWx/4ZopRc94uddYZLVyrK9dJ1m+OcbHvHn6pnGWh+XTfFX4yPuf6JJg0eL9Gt215C07lJOGC6fhExq+UMWmICxSay9J2NHSZuaIDx8nUjmX8AEw86383+uo7OGTO6i7El33PFixlLTg9bIZFg6Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TisiumbA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TisiumbA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so69106645e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531039; x=1792135839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QhfdgCnusoug/g1d4W12Bzr39jd94gg5/ulsL7PdlMY=;
        b=TisiumbAcAGgBzjagMugUD4vnd5QOPbyuCPbgGXc2bY11YasM0iNwBx90vl1OnQhBW
         0lIUXSaGBcnnkD3lTHRIZN1F6t7n9FchBO+t5uHEJdUAM+H6nI1jMlnD0eZpm/ymMSUT
         oPdnbxWZmMT/YSC+wiRo2R7q5jVgeUwQcJj/L/54jTi/pvv2YdaQvODC8QbNgHuE6PWQ
         cYBAvtdXW8KG591U4nJWV3r8usAFp3pXPL95DgUB2lSTxTUPDsC8QU/wwr2YTQhJpIT3
         EW153KTI7R8y1OV7WeMZ4MD0uw+IUvjXzxZ2+AtyrweGBGERMBx0lx/mYx+gJaFTjL8w
         dlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531039; x=1792135839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhfdgCnusoug/g1d4W12Bzr39jd94gg5/ulsL7PdlMY=;
        b=YiRwZdzb72ntOledmdhISkWjsol0wqPtWod3N+1m6xVo+1FZJYZvOYj+ZEfAlu278i
         iA/qGIz4OG8qLwlgSVH7/LXzI3qpF1UXme2LieeRZBjBic1yOt/n9x2HHX9fFcMpFn04
         HG/frFWJWQRAFTFH44ioDggU0Ey7xYJRlA4JfXtWVGw59K4kAJFgmcPQvX6ukc6D7TAE
         ecrF+9GI9Hd/CeZVIguELukmRZPN4oWfzmH3Iyygk78Lp7irQLrs2I/ofhPnL5uiw2/W
         +CcOVlnKbpfscGBEjET7LiAGthRpChYTHdscmPXSXv1eDFKNsgy5vtQ5WkG3ghwQF+3p
         Rrfg==
X-Forwarded-Encrypted: i=1; AKwUvBytCYLVD/M+/aKOE4ZvgC49iN+LGCClz2sEzjHXKr+4V3anCcDUUYoJTbDDaeVp2aYrMG5Sx50v3jWwonc=@vger.kernel.org
X-Gm-Message-State: AFuF++nWsiUXDzUZnXe/ASF9fwEb0Phgr6MU4WUugT94gdUVKVv/6YcO
	GlZiYgt2sUBErsbAUlDPAZsrS8fm3RZAhqHVvsbNLK0S/KkETRDnNXwX
X-Gm-Gg: AYBFou0vWd/8T7vnxwJR/7ItbvN77xwZ+dNzorzU0wFe0t2uuea2yCqgPZgrZ1WdM+W
	AAp/uFeu69S0vcnfRTmKZa9MNxfvUxAJJqs8EPYOBgVwwsgLrjhyGNvjje5FhVx7qeENA0P0ygs
	/uJa02Zvha5qynUSml9BqFOTdQIsuTvOzt2rFZfPcW4ZchHwFK1hb1c2q+iO87BMNBV1hg5ZALc
	aN5pCLMiH+hW4W8MnFTqJzvfooWHk3k6nws4VFwW90c3VUOXV9m8Cweh4tmNMqEeSQkUB6wTi+U
	hZJYxquv/QiNNVY/4HYMc5hfhVXltjou6Deb+GT18AG2sjfVUO5r+FugFS1CtUyk1egPjp7pzgP
	1PtRZFuYYG8ZMD0vcyIeXOqFT/nm4LCKXr3bdUWmLmHAGEUi0MP9BJMDFHMANPX6A5m/MeIDEES
	kZP5+ks7bN5+SG/aRtQ8wPhn4zsfliVh8phMcfqp94oEPJX77Pe6bMlRX7a6JKl11bgT4emcPit
	hAwzZGTokm2k91t0aNb5GmUHTm+dAvoPXYhJJHZ9BBfUxG/KD1rJaSAg788YF6kxliZtnNZUw6h
	4b4HarKLec5LfKHu9Uj5KBO3hVFbU61IMZmboPwU7OGJj8I5DR6X3ybNJzY8e4y3GmIK+FemB1y
	T
X-Received: by 2002:a05:600d:82c6:b0:4a0:1fe2:d4c8 with SMTP id 5b1f17b1804b1-4a18e4a4c3emr19524635e9.5.1791531038809;
        Fri, 09 Oct 2026 00:30:38 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf31b83sm38426495e9.12.2026.10.09.00.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:30:38 -0700 (PDT)
Date: Fri, 9 Oct 2026 09:30:37 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: avoid sleeping tx locks in netpoll
 context
Message-ID: <asiX75kRueyFqWuO@gmail.com>
References: <20260930185417.61865-1-kmehltretter@gmail.com>
 <20261004122910.1392318-1-arend.vanspriel@broadcom.com>
 <asR1TaKQJlPFqEvR@gmail.com>
 <802a092a-314a-4f77-aa1d-134b3d020069@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <802a092a-314a-4f77-aa1d-134b3d020069@broadcom.com>

On Tue, Oct 06, 2026 at 10:27:27AM +0100, Arend van Spriel wrote:
> > 
> > Lockdep instrumentation in fcmode=1 and 2 confirmed that cleanup enters
> > without txq_lock.
> 
> This is an observation unrelated to the patch, right? You mentioned in the
> patch it only covers fcmode=0, right?
> 

Yes, the cleanup observation is unrelated to the fcmode=0 fix. I
mentioned it to explain why I kept brcmu_pktq_penq() for normal calls.

I'm looking at a separate brcmfmac FWS-path RT/netpoll fix for modes
1 and 2. The prototype defers IRQ-disabled transmit to the FWS worker.

Are modes 1 and 2 used or recommended on SDIO devices? That would
help me prioritise the follow-up.

Thanks,
Karl
