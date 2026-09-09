Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD355377A8B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994845; cv=pass; b=jqnwA3baPWRQzyZE0YC+MEWpJw2c2GOu2D+8N7TQrRgjz+xPLXX213KgPqft5TUfPx2yp+4607NQKInjUcrewA/EZeu7gNKn8KJwNg8eGSs9zCIKIO0r39h4rKsxysYxLL+IxvRpCyMBby3626b/id9L77098+0U6rc/clArzvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994845; c=relaxed/simple;
	bh=NXBFaKbrMXgpNZSE0VvaGOO+KxvWK2WriYgkvV9RiI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G2roPIZknAXDav+Zyn7P03i2YGcW70pFMH+ED9tkLSUblZbB50wjxrknUMqxl/FwMHGu0B4Ia6RoBG9fQpgfHx6UZXouy4dcO0/3Nr9UU1SZbEpqoY0WHR/nCsaxUoYG/wqw+9tMX5Y+3n7AULOEIF9dtUy2fAmStfTtrOKcofc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vKSO7GuV; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vKSO7GuV"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7ee4399c3abso6345071a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788994839; cv=none;
        d=google.com; s=arc-20260327;
        b=R3IiDkbpPILOjVJE7fZCG7DDoxfENSordIwbc8DcygmgoixRtvl1K4B6NrgWB3ADbW
         JciYzOkpwaINer+7mGq2/2R8/PnxvZhlHG7Y+HT9FiDIMqXynbwRnq2m4pfe8sX02NlE
         nSMyb+j6vrfxWFroALRHMTJfmoMeYI91pzx3YBRQGDnzS6xfDHui2dW+VlVpIl3aK5QT
         CEFmOFjRkNeRFQzsSZMdbMAodWMxjR5w1C3brjKvZfBzqXkMONC80gxDxoc/I0aTR0nu
         4zQobZcHpttnArhIUTWcS8+ToIx+Eiru4wkw0AIjoueAd73Q979YqvvH1ysng69ncmAm
         38Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lAmP6gCex2m0d1z+kgD25ttLxjG8ayMhj2asunqw1YY=;
        fh=jcdJ0lWZVZ4OBDlDKHyImLcvNUN0dsHFEFIyHzeHTJc=;
        b=oFWvslS9n211D3w1eiP0nsI7lHj6buSVNYxmLHN61TKzeyruus4s2kt4Wz6Pj4iWmL
         T2XLao6EYrE1HGrA3osKCYGKzE9h9xr4ShcK9z9wXKmJ1cBZcpjef0pGUKTNLFqBxzfZ
         ICk6XrpG0qPKJ2JgMTn9hDQCyUHGUl2sc36N8AAuDrhI4NfzW3Z1RKYnAlkrGPQ79C9i
         t7mb3s2ygC8gU6YvQS+lDftYeDLsSPCbicpVE0+Q02PuEuj1ZQmaByyD65ZFq5DItZp9
         edO8F1iGVMhYNdiudtzaNJa31wUUGH+UI1iAwelz6oKdql+t//iiu2Dkv6BypK+05CZ0
         71NQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788994839; x=1789599639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lAmP6gCex2m0d1z+kgD25ttLxjG8ayMhj2asunqw1YY=;
        b=vKSO7GuVqvsPI6c+H+TCteHWCcZbZ01iNJESqb4t/z96PG80U1iNHZ54ltdHmGmJ+m
         i4gwUwoDb0F1caW3kIh/otsirHAYMompZ6SxUIoJwnfo1/X6GdLq7zsil0VsxL4uB/6T
         IK/+ktqfQHsS1h3sTvxhVr0pCdQOrh+UnFUZDkxxbx7Lo+ruXDQi2IA88tmSD/LkMEAf
         yEhqWzywwLyVY+9ImwPg2tCiivNFHddwdbFW4qUko3KlbDaaVrr7ddZsvkAhXvNRFNvT
         3YSbNFr7XcC7jJbYJnhLE6zG0lTCBsmvjjTeGmKn0qx6vuk6XSXIfHxXBkl7DnFIb4Sq
         G0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788994839; x=1789599639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lAmP6gCex2m0d1z+kgD25ttLxjG8ayMhj2asunqw1YY=;
        b=hPbiFzkTOjLglGC31gW+m+FK5nolxKwRNzM5CVsZLmdD8SdNZV+uVUoyH36DYtmPPa
         LUWJ8cRJUyNFsA0EMjPqyKSMmnOxSaBf2I8BCHmhDPHMQoIc4biezxqvJkZ4dtX81TDk
         kHfgBusC3XCwy2wyjLaFwBHTFugeP+XxtzKetWqxDg5VRLJK+JOf4MFj61KVAeK2+AD9
         w6jLWxBvtrlGcz2dxDoupoGzFFE8dUucAI2oRVSKb3p1n/QFX+bI+4rt1UEi2jdVmqXh
         Tl7oRQc97tC0CU9GNJEDu9tdFWoJgBkmJpCjxqCTBCvRSPqwAv5kPpnP7pAgzrgS6uSI
         nfuw==
X-Forwarded-Encrypted: i=1; AKwUvBxDa++BkOZZqDhM0eocvpDRB5ANoIDllGxVlRRfzPe9CUJPKjndDGtctQ5ags071/ZsLoErIU5gm/XzzXw=@vger.kernel.org
X-Gm-Message-State: AFuF++nTl9oNJDEEa/5SJtjEMuVBQ9TeDeK8YqAADbaCHLQtDyXYrkm8
	NgKpDzSehfonBFSml18N2fbOCrW2qOO/hgw+vN/2nL5G7E0Dild0+PZKW7qyEcssT7lQK7S4mii
	v2J8ZK3wd+eu9tcGpXr6H1wNPZGtA7FX2dhSauY97
X-Gm-Gg: AYBFou3sTbbu8h9t6QTtgJdYtA5Cx6hbkscGy/9kf+lWPqINtQk6Q98jYbPH8ktYfoz
	PvbYh6QF9R7ElN03CyqNgnB7VuqzFZv3RQlgIWZ6Uw/JzV+N/QIVz8jA76l8Mr5nNI/FSllu23Z
	qFUg+0sYBoy5G/s/HgBiQk+ok8gS39CJc1csePj4fV5Boo0x0P1Yhbe7v68H0yS9vMADeNNHOLz
	rVJDjMkIEJ0mzG7+xmNHdPXoqP++GLQRsgnB2l7gN85ycTQs1soLP1X5kr//SLrlVHirnVnkajD
	cISN8GOcTbXZ6Jx2zlWHSyg4ZeLhwzly0qGWBVW/n3RR4IyXgQbUbezRJROey2jef5GoJLSpcLB
	bO2B54xUc3Q==
X-Received: by 2002:a05:6830:2702:b0:7f4:effa:a5c4 with SMTP id
 46e09a7af769-7fa1dd9705fmr26393425a34.1.1788994838309; Wed, 09 Sep 2026
 16:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821170648.3097673-1-mrungta@google.com> <CAD=FV=UDw4WEGAjr4eY2qoPVbs9h9J1SJU88OjHgTnqXUSwotw@mail.gmail.com>
 <CAD=FV=WqPTXKB2NgPS2hS5_9tdQbUyfXHFOARrX3rjzFra1Z1w@mail.gmail.com>
In-Reply-To: <CAD=FV=WqPTXKB2NgPS2hS5_9tdQbUyfXHFOARrX3rjzFra1Z1w@mail.gmail.com>
From: Mayank Rungta <mrungta@google.com>
Date: Wed, 9 Sep 2026 16:00:26 -0700
X-Gm-Features: AcwNN1WuSbYGIO1o0g3lgIz8ZkkgMbP6sKFaSFThY6hnOo5VMDykb4EDJC3AP-w
Message-ID: <CABz7rdAzp3g=auu=2Fj96B_q2tq3A1vEps3CJv6EsnXgbrJLcQ@mail.gmail.com>
Subject: Re: [PATCH] PM: sleep: Add DPM watchdog to late/early/noirq phases
To: Doug Anderson <dianders@chromium.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 2:15=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Fri, Aug 21, 2026 at 3:37=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Fri, Aug 21, 2026 at 10:06=E2=80=AFAM Mayank Rungta <mrungta@google.=
com> wrote:
> > >
> > > Extend the DPM watchdog to wrap device_suspend_late, device_suspend_n=
oirq,
> > > device_resume_early, and device_resume_noirq callbacks. If a driver h=
angs
> > > during these transitions, the watchdog will fire and dump a stack tra=
ce
> > > to help identify the offending driver.
> > >
> > > To prevent false-positive timeouts, the watchdog is set only after
> > > waiting for subordinate (during suspend) and superior (during resume)
> > > devices.
> > >
> > > Signed-off-by: Mayank Rungta <mrungta@google.com>
> > > ---
> > > Testing:
> > > - Tested on an ARM64 SoC (Pixel platform running a 6.18-based kernel =
with
> > >   DPM watchdog enabled; Android 6.18 kernel has latest DPM changes
> > >   backported).
> > >
> > >  drivers/base/power/main.c | 25 ++++++++++++++++++++++---
> > >  1 file changed, 22 insertions(+), 3 deletions(-)
> >
> > I reviewed this patch for Mayank before he sent it. It seems correct /
> > useful to me, so I'm happy with:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Since I reviewed this patch, someone pointed out to me that we should
> probably also add the DPM watchdog to the "prepare" / "complete"
> stages too. I know those stages are used less-often, but it still
> seems like the DPM watchdog would be relevant there. Unless Rafael
> chimes in and says he disagrees or that he dislikes this patch in
> general, maybe you could post a v2 patch that adds that?
>
> Thanks!
>
> -Doug

Thanks Doug. I have posted v2 with prepare and complete support here:
https://lore.kernel.org/r/20260909224818.2177311-1-mrungta@google.com
