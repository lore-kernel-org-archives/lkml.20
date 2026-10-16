Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA12473C76
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155475; cv=pass; b=AQ93tLJzz1LDmiL3y6fb8KWAHNEtYkETVU7g4vQrjHII3dWk9t2VftNsHsqYs5sEqB1BSbeqmX7xBVWRdD0ZjcdnUuk5JS1fSJXQTbBIaoIPM1Q2vLKLcvDp0kKdfrxchKzcyqcb1u8CA/H2yqlDi9r2XoaRZSpXqiWfildZnN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155475; c=relaxed/simple;
	bh=Vk2NoGSLSCA9UPGnxOMDImaZpOtM14n84Iu1QGHgieE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajHGedZ8aSrUoJQmJ4BuWAXqedlX+iyFRq+1HE25CQW358a5McgmQt80O/Mas6BlsqYBlbEBn6rwVxwuomFkYoKkCHhoHgNWecgxTXFLxEV8J3FvhZSgP7nsDE+ISmpmqHn33VZHyZe/PmPpwPBWGd33nidnw6diNGGKBerQnVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TsiQ1xth; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TsiQ1xth"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b8f5e2ce5eso5805535e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792155472; cv=none;
        d=google.com; s=arc-20260327;
        b=n5kF6yQ3X9+2gQNvGUKpmp1xM+gYIGTfcZRm+T37iBkwv3mWXtmZbpy3tYItj3UPvo
         m/g+we37LHaCbqMi+5bTMZqYa4JLvyt1rAbadcQehfuPB/r4t+mNTabkb6QO87NJdCzA
         KbGX9dE3DlT85qMYkFf/IhCE8f6vRH+ljk2ZBkQ8BQvTHHjY/nFOmTAA7Mh0VdTBgrBD
         GE3/s4+vEnIgLl3F/5k4ngdQcP6utNZ1wvVn0FvGzWpBlSTz861lCc2pGV7OSElOSt5c
         eBw1/MopqIUnZe8yDL0arKHNH0Iq4TNu0qoO+4xmhx5hI8F3Dwwhm1iOpyBsksUbNVku
         QFlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qJj4wHsvFd9H/gTh3VpPTgiKiCVFbxYwgg8ZVjBsmCs=;
        fh=rTegZYQw5WJ7WPjpno245A1anP+ThUmHnuc6MC2swWg=;
        b=XQq9WE7L3mvUtez9h1dtP33vrLn/WWl4i70Pu+/56a7wTWRZorg2QP6O+b+tCz/zJE
         yEm60WOkbLZOACw7JLzkXPKQ8E0D0lOUETCxyf5WXDlyTFLyiOW5BlPXGEC2CGu//owV
         CT4AU410CPM08wsEN/f+8JPvkezGp6UM4pMWOb0TS6kXBjmUXKlCXw3dJk2tdA0Ts67O
         Dh2vGeFOcpV7Q3lCprHbyffxohkxa4csMyVWOEmOvuRg+mhgQz4ydFBctcU9EJWEKqxD
         Y0LVruThcEWg0wnwlvwzoZQj8h5x+sGmr0jlrHBI+qtsgQ9zg+qaAWFHMriGMcyMa8wr
         7u+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792155472; x=1792760272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qJj4wHsvFd9H/gTh3VpPTgiKiCVFbxYwgg8ZVjBsmCs=;
        b=TsiQ1xthvuDm90Wa7OQnoDo40i2w0xx3Y8a5/HwpXcDxcmckZivvDHV2Y5doIQeagS
         l5z+sCcFwfGMPy4L49AqiispdWvrx/M1R57HtifNxyO+0WwJwtzLYoi4PbrjXsXzzJJN
         hWsctTBCjpsIuTWW1h85VAGLy4MWaOgZ2o1FL89GXJOo2AI9kVMwKPBiWuXbcmzteza9
         t5AEbXNKjzuwLRf7wAuID/FW4/S5G/3yA5fgYOx0fSXy8vqK78pVCPYIqVUqu8+TtFDr
         j3CcA8ajF6m4CEvGhObsYRJ24gOaAtskazAnQQ5TBmxvR9M3W6UVOoK4kIUlN3hDFA1r
         tgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155472; x=1792760272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qJj4wHsvFd9H/gTh3VpPTgiKiCVFbxYwgg8ZVjBsmCs=;
        b=O9j6qvLbqlLaGlh5eQLT28S6zUgdu7P584MSc/IdNEOCja1kbyNsrISwgqNnaZOGC2
         FqWEivHzLck6NlFiP2pVh3aUS8MIcipGBZ6OLoUktvPHWlsZe+2raHwoGRm2s6JwbksY
         q4VEkq5FCRQltLvkBVFiSROJUhVJLVWSACO58w3Fs+5uZt9XlOPO1BgTo35MSS65z4Pl
         51ynzjZIB9N/elN54FteppXAQZxaWcphdU65D5vLtsX6HDU5oo1+jBLJ3kF0o4LURNr1
         iDYsKZzGvfvJ7g/zmpxrANLFrB+o2E0SslkDpCb7Cy3bQfSo9aT+ef/EwLCPfjYhMxbC
         sG8g==
X-Gm-Message-State: AFq9FYIkfd8xq5B/S+Ldq3ueXHNaoCcQ0s4mfKVmbjC9VIlccZGS+g+E
	URU5P7BVlNJKX3BDBBW8QqqVhK3okAmF3VG9hsfIvIIDw/8KCq5ST7HwgIvR1P0eVaU2xuN4Ddr
	VrBOBozOumojljN9BH8sSFV4pL4pM0137Caal9jPANA==
X-Gm-Gg: AYBFou0XN8RZJswk25YAQ4iipT/ztfO1hC5N+J+PMgfN60wjGs0dvNTx2cAv4c0IXSs
	gBpujcoYD5yUmHystt5+iJaY/rK/0gteYgDnbLTJZFm/LLQ0R61Hag9T2vP8AX6UQ165jmLdUgd
	qqvk5q4fWqqxsPMXSejgzH3Njg/AYRhem7B2Es/fmzBjc0QmCG8bqW7xuOoyXEw81N9/GgN1AvS
	FyRRS1i4s0i7/n8enrMyGpltwPvTkorh1tWesrXm43cer/j79j+PcvMczJJAaYVt191SWs3838u
	pZq0EwaJoSmdPUP08YqXy43MTb3Z+xlfc3xPjJvX7x+KVz0b0P7jgTtUbwzu4/1uAidyw7c+G0N
	LrXnCNg0SlY3G
X-Received: by 2002:a05:6512:3d09:b0:5b8:eb82:4642 with SMTP id
 2adb3069b0e04-5bcde8e3174mr8601950e87.66.1792155471693; Fri, 16 Oct 2026
 05:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015140148.231126-1-marco.crivellari@suse.com>
 <20261015140148.231126-2-marco.crivellari@suse.com> <atICTHEvXbR2S-5v@gmail.com>
In-Reply-To: <atICTHEvXbR2S-5v@gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 16 Oct 2026 14:57:40 +0200
X-Gm-Features: AclHuK9yUHnaw77aSC5XHUwP5_7cScwa3V8Krs7LUEb-wbsT1HG75mZVmfj_haY
Message-ID: <CAAofZF7GL8pr+wVxvzTakX2vy32Ci-dLFKp-SUWt02_irdzs=Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] workqueue: Make alloc_workqueue() unbound by default
To: Breno Leitao <leitao@debian.org>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 1:45=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> On Thu, Oct 15, 2026 at 04:01:47PM +0200, Marco Crivellari wrote:
> > +     if (unlikely(wq_unbound_by_default))
> > +             pr_warn_once("workqueue: %s is using neither WQ_PERCPU or=
 WQ_UNBOUND. "
> > +                          "Setting WQ_UNBOUND.\n", wq->name);
>
> Why do we need to warn here? With this new approach, shouldn't users be
> able to rely on WQ_UNBOUND being the default and leave it out?

Yes, it was mostly to ensure users notice the change in behavior when
flags are not specified.

But I can remove it for the next version.

Thanks!

--=20

Marco Crivellari

SUSE Labs
