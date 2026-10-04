Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88943F9F28
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141037; cv=pass; b=lQYaDYTYicB8OZfskPF1psb12gW0ufECIDqBQNC7x+wqPo7zIjYLFnJDnp/OS9/S1RX9LEMcWTbhQrAylaDv8tHOFuD9i4CWh2yidlRrwv/Pb64PxOcD3Sv8RLKES21WYZUMKI2HSxJcxAbsGfbf/G2Msst2NrjWK9FmX4KncyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141037; c=relaxed/simple;
	bh=z4KDwGSCeUl6OO60pOlQkNnNe+e6ge5EX8bgo8KStA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kf/bL8ldlOMIs14w2A9uV67TSrFIcZvaifZQ/PEs7d1+vHuzpba4YRyoAP7+zrpWQJRxi7KclO3W7ZxXTBA7KXZ8axiZrMJqerrbvWoPfJKwtNHlKy8B+UkZ/F/xMLncjb0Bczn2lcrqJ0CV1KLXKl70gOix+M9FRcmksFm5iLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azmJ86dj; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azmJ86dj"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-980b6159d30so92420241.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 12:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791141034; cv=none;
        d=google.com; s=arc-20260327;
        b=T01q3m1kMev8y+7BmOX7ga+EChAMuMXonFnd94JoUBm3XH2c5wEeCrtgbufFcVMTq0
         pW7uWFdlsoe4k/jgQOIQM8rqwZiUiPROloltPbfBHc6ewn+7rPLdJzVUtygmyS1WYpvV
         qlVb1rbgWfRDAum3ljJJ+fCJMFfoP45xYgDPX3zkso5aNh5Uo6Tpg+ZEJieox7KVQD4w
         V8wQsoaf7ppH3NmYOlw3VlupZ+dRGzJKjwSsmeD0dtGRMz2l1hsMCzrADeSxEMMdaCDC
         KeorB6IuYWG+3zTUcCQcNVMnr9Ym9dAKo91grZbH1hGqCvHtjv4EJFVP6cyLe/Lfhi/I
         FAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xkZNnkM2zHQpEZqhgoebCPzMrZI5v2FZv8Rlnaa+Lhw=;
        fh=DogMwU8UE7SQBdxorJitvCGyAnAi1bCzFiKigyJNJGk=;
        b=jbwGqf1hbDvVtwQIPZzM4Puo9SinGkEMXnXZb55Q9aaCvUd1K34JMtI+maoidhAsf/
         dOVOK7yqMMs0TI10HM3tXvp8TqsLYsMxi4rxhzPnKPrTTiKQLGi07aVgPr4mP1wraqGN
         BqWG+aa/aa7Q5r5lc1L7dQ9+o0HxuMF4rOUVaqBkHRj50IYCVBVye8I7zJXE2TyKYCVv
         aOGfq83M7LuCKe+CVQJBiZyKs3zLfTxfYmUF0SiKefXtmbsrllEzdYdIUmQ++eVI0Gck
         zhcfddvHms+s18TK4IDlHPcUI+6mIEes9AgcD832ozPHFpIUEPgvaeHxkdXLWVRXxQOZ
         EFZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791141034; x=1791745834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xkZNnkM2zHQpEZqhgoebCPzMrZI5v2FZv8Rlnaa+Lhw=;
        b=azmJ86djbSt3sBvvtqyEcjmK39zF85f4M9bUnxi9mUUeM/hr0dDPefKZiljTxy19xk
         HwynE6c+zk4Yhhh9btgLRgV9/Xvn4zKg0L0Y8SkS/853a5SAnttxlXr+VCsURtx1oUFt
         eVhdW+ViZA1DrlqD7TZjs069rbiprVMflyvUr9Qf5T+65w/s0RkWxhUTKcco/PwnrE/n
         aSicfbvGHuXa08nd3g2ELzE27r6tptaUFEFbpKNHCvmhDsm0/qzRNL96ef5k7JoO7kad
         vMQRWDacHdWByEActGgEpbDdPogJcjzKYkFB1p4+06zMLKQ7IQrJ/g94IvigrLIMXoxL
         SdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791141034; x=1791745834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkZNnkM2zHQpEZqhgoebCPzMrZI5v2FZv8Rlnaa+Lhw=;
        b=KafJ7XkBqZfzGgVVLHVYCBfvyLTrsv3gqwWVyxmYV2tsauseR+RR9yoP3I7AbwXBUp
         YFc40GLz/IXn5K1hMpav12lAkRb/C/HL66hKROE4UkDWv38EbZtnkSwbDaco2Ku7IFx2
         4x0yKnm7koIwXvMdts4gSG012wbmuXrRQSVPlyhVtrBt5dG/Rvvy3I9x5j284Y1qarWx
         1eWvW7fv7WxoIL7V7P5VzOKGbmJordECIPqqeZs363DVTCNaYcGCjOLk7aPuR49259o1
         u+p1dLTB482QWrgECjEg7GhI24HxGnpXJQbO556v76mBCUPlawAUfgymTt2nA0AJYjOQ
         n94Q==
X-Forwarded-Encrypted: i=1; AKwUvByNZfjgvFbnw5m6e/PTVMUnWstVgJ1SkeyjBs68joGGKLIEOI3xyRKsagt0CVWrloFb47uebP5zfxBUog0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPv41piSZFtndRkNRuTpm5IHFp9010ZJXIPhOBU5H/7dLJEyzR
	XRt4zD6wygYEieW7VJWDk+zKPDbrLz4R/N1QsHizhv5un/WuNKgQIgQogWr03uQBPWXyMuRcE54
	71eQFRyzJooGcGmgG2Wo8ZTbskQJXO1kpcSB8
X-Gm-Gg: AYBFou2OGISweoOxGqGsiDYuxVUgItdeC8KdSpt06x73LUcCJ7HMSfDoVUeaRTLUkMn
	8+CkI4ccoNi0Lqd/YDv3ia4eRKDUvcxyl/EpklOUbKsE3LDBraTLzV1Wpry4GizHKuSeN4MDfMf
	HkHxboGeAdHszd+5uRvfJ9I224IHJqzDiGRuYpjIyE5RIpibrBM3Adn+I6j7OOuONmrWvlLNjjy
	EDP0vjfFkY61wR3+3exyOoVXkpx4lSqfcfhc/Y7fa5jEX7jteAsKTHWFVeoPnlmtt8oETH5CIcI
	DKzHGiINBaVQ/UjBYIQANBEtr4ZsppwsWqnwl2Lr9ypxQbsVIV85xrSr912+VVD8qwsckeYsej8
	sG4DzmgdKwF+uRPLPUvCS7mfAMfnnlzg/7VOkDqz+3fx2yUiWkaUa4sg58X9UjYKs4ebMKSckWM
	UIyP4VDuKfxjLse+FmXl260hNYzUXfErvEl4XEQOvxQ+wt
X-Received: by 2002:a05:6102:ac7:b0:7c1:b55d:373c with SMTP id
 ada2fe7eead31-7c1b55d5b1amr1023105137.31.1791141034613; Sun, 04 Oct 2026
 12:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-submit-phylink-suspended-stop-v1-v1-1-0669fdb4a93b@gmail.com>
 <04e29fa0-3ff9-4248-bfe1-87dfe8ce3ec3@lunn.ch>
In-Reply-To: <04e29fa0-3ff9-4248-bfe1-87dfe8ce3ec3@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 4 Oct 2026 13:10:23 -0600
X-Gm-Features: AclHuK_y06FW1116Mu5hZ1KX5sWXMaJ-6Dz8hI1d53uu8GYrxhRaXRuilJzrS9U
Message-ID: <CADvTj4rm0h0iy7vHsdxc4zQGuybjUvGFqVqrHOn7r2O1z+OWoQ@mail.gmail.com>
Subject: Re: [PATCH net] net: phylink: allow stopping a suspended instance
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 7:54=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Oct 01, 2026 at 01:24:53AM -0600, James Hilliard wrote:
> > After a failed MAC resume, a driver must be able to stop phylink withou=
t
> > resuming it and reconfiguring the failed MAC.
>
> This is adding a lot of complexity, for an edge case, which i don't
> particularly like.
>
> In your case, why is resume failing?

This is a prerequisite for the stmmac recovery fixes, rather than a
fix for the underlying cause of a particular resume failure.

stmmac_resume() already returns an error if stmmac_hw_setup() fails,
for example when the DMA reset does not complete. That return is
before phylink_resume(), leaving phylink suspended.

The stmmac recovery work preserves the interface's administrative
state after that failure, but leaves the datapath detached and
quiescent. An ordinary down/up must then be able to release the
retained resources and attempt a fresh open. Closing the interface
therefore needs to terminate the suspended phylink instance.

Calling phylink_resume() merely to make phylink_stop() usable would
reconfigure the MAC and restart link resolution, even though MAC
setup has just failed.

The additional bookkeeping handles the two different suspend paths:
with MAC WoL, stop must finish the deferred link-down and clear the
WoL disable state; without MAC WoL, suspend has already stopped the
instance, so stop must avoid repeating that shutdown. Suspend-owned
PHY speed changes also need unwinding so the next start does not
retain the reduced advertisement.

Those are phylink-owned transitions which stmmac cannot complete
itself. The driver still owns the recovery policy and any fix for
the underlying resume failure; this supplies the cleanup transition
needed when restoration fails.

>
>    Andrew
