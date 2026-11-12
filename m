Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794469613;
	b=4nVv9cLnddA70Ktjw7Lk3mkgB4U2D7rArs81xnZMQNaqmIhNplsd1Xw2VAycwIgIS9Us
	 lDBnhCA+KM3lL5rmt3vdzvZgZFoVm5Ffxvd47m54PSbktp3uFJLVIjw9BWkM4FJ+LxKVQ
	 wBL9D8lcRx0ymMdW5zNKfL98syX+kp0WyGkU01D5z4YmCJvAA810hiebqs1KGnsBkSuTp
	 a7KH1tzbqfoHW2vmOocFnCEkfcru1TAUEQUGvwYzma3PpUiT8SDVAhumwATh5JOboVRNc
	 NrFEBPdvGEFd/U6sRSGyXp4ET6/l5hMRlHdnp7p8omIt8wSDtHeDbaNYM5SADVEmUhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469613;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pbiziMzLWlhNcgA6NM8EG4IF2g0QkYqVqXptOHlh2dY=;
	b=KeGjXlVUnXdbT0e2m0OC0NanZL3EdTiuf4hjj6/bmnvamLf1aI5+whIXXW5y2qwH1Ljv
	 veEKweKTCoikWUS8KSptL9fV9bYrRUHWHGP5dq66u6UzvbPL1Ff/2Wt3rNTATjzV7UbdV
	 iAYs2ZBagoyu4tLPce2fu6CxN8YsZlK9GEdM/LoW9H4UfEW5RNigpY6uEKO/gruS8JjC4
	 T3d+64SZDPg219+cHv+jG7BUdmNL3jYrzBuAq3ZGSiTNp/0NFdYyOnN3KSIddpZUR9Ypo
	 OShXojh55Pr+D2+7xiI8VhhJviVwVk9IyvR1B95VJTX/Znc83A9GfvgWdykSha6ZOyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cCentTSm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344F8606A31C;
	Thu, 12 Nov 2026 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cCentTSm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=90.182.112.124
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794469612;
	b=JOefiyqa9wUUT+tu6lrbMDCmULuGydKTVBL1mN3KLW6mFUfohsQN4JefufyLIfyF25Fc
	 AnAEDcr4vN6QNhw9lOAmcGD6Ixjv6asA4noWMNVH0jE5M2LiqyUwTZT1wSGC+gZ4zKJoh
	 0/gclzQzOzUuiV6BxjvNQwSZjLJM0mHn3v5SPQWa1Q8f6W7mDyVfRKljn0/LGc/RVZ4/p
	 yBJhBsPzfOxn9G9nJ6OiaoPREXgolkLbiWx3TlwkhSh97xwYnYsAMcekR+DEA2kjMtbth
	 +2+5iETR+AvGiahlXj/HXquOYoJZ2AtS0JY0iJ5//BYY/1bioa5wZ2hH1vQvuGtM7Og==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794469612;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pbiziMzLWlhNcgA6NM8EG4IF2g0QkYqVqXptOHlh2dY=;
	b=jHfRUipEtFFfMKACfao3VZoUMFIBNpalG1Md2AovvFFkFJ9Zb1+ACOtfhwGRX8bhF8Oy
	 mE7Y7rnGk/pkeRMHTTmODPpZF3HK22joGwtz1jq8DO0D03pd/SdCRFFstaGbhUhp+7yfZ
	 a1OfDG3oDJBnchM9uXoKavWNhJAKPzy5IJca5JvcvE9zPI9UB8RBJyE/YICPQdZaEHPt1
	 oomrPZM94hIw785oeIF5cdneD58N/M84mVT3qQ06gOT/SHEkFDbHusCxFXy0RoxvmvW90
	 XBsh4KgDSvxU8/Zc/kjFwWao96P2xHhuCLZh6vBiFNUhsWZuSuLY3Il4SXsncG5Rj0w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=90.182.112.124
Received: from localhost (90-182-112-124.rcp.o2.cz [90.182.112.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPSA id 992561F00A05;
	Thu, 12 Nov 2026 07:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794469612;
	bh=pbiziMzLWlhNcgA6NM8EG4IF2g0QkYqVqXptOHlh2dY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cCentTSm35p4Px4dduKJcUSzzxsBOpl+DPx65f2aMj4tPHrlhZYLTGmxFPhNpLJsl
	 4/BrHKY9W5qRFLAkD2KoMAIgbAKp5aqMbTo2NwJq2+JWXLsPakXcQHT+zRGz8Ih/Gg
	 ZbRJY2SXD1EMN+a4AZCOgCRjDWC3X5S2rtxmorkoR/5cfQT36elTlhsGb4moCWq0Wa
	 R49FzE8sKADnD+KRSfUgqCoEXYIcI4OvhX3FXNbhFa4DSoZDVrRTWjyT1c6rP3fJH2
	 LDeXaEh2GtPtPrOgetf7svvM+2aCD9iRbI4D/XBv/kE/fgvRWVQkCEv/B5dMCVBS+Y
	 b6mp7eO4xhRcQ==
Date: Thu, 12 Nov 2026 08:46:47 +0100
From: Joshua Crofts <crofts@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
Subject: Re: [PATCH 2/2] i3c: master: svc: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <20261112084647.000063d7@kernel.org>
In-Reply-To: <avTFZYWpaVd6Nm6K@lizhi-Precision-Tower-5810>
References: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
	<20261107-dont-use-autosuspend-i3c-v1-2-80a1546354ce@kernel.org>
	<20261107133008.7d8f0bb0@systembl0wer>
	<avTFZYWpaVd6Nm6K@lizhi-Precision-Tower-5810>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
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

On Wed, 11 Nov 2026 14:43:33 -0500
Frank Li <Frank.li@oss.nxp.com> wrote:

> On Sat, Nov 07, 2026 at 01:30:08PM +0100, Joshua Crofts wrote:
> > On Sat, 07 Nov 2026 12:06:24 +0100
> > Joshua Crofts <crofts@kernel.org> wrote:
> >  
> > > Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> > > driver core is now responsible for undoing any
> > > pm_runtime_use_autosuspend() calls on driver exit.
> > >
> > > Remove the redundant function calls.
> > >
> > > Signed-off-by: Joshua Crofts <crofts@kernel.org>
> > > ---
> > >  drivers/i3c/master/svc-i3c-master.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > >
> > > diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> > > index e700392f0801..9b845b2955be 100644
> > > --- a/drivers/i3c/master/svc-i3c-master.c
> > > +++ b/drivers/i3c/master/svc-i3c-master.c
> > > @@ -2084,7 +2084,6 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
> > >  	return 0;
> > >
> > >  rpm_disable:
> > > -	pm_runtime_dont_use_autosuspend(&pdev->dev);
> > >  	pm_runtime_put_noidle(&pdev->dev);
> > >  	pm_runtime_disable(&pdev->dev);
> > >  	pm_runtime_set_suspended(&pdev->dev);
> > > @@ -2101,7 +2100,6 @@ static void svc_i3c_master_remove(struct platform_device *pdev)
> > >
> > >  	i3c_master_unregister(&master->base);
> > >
> > > -	pm_runtime_dont_use_autosuspend(&pdev->dev);
> > >  	pm_runtime_disable(&pdev->dev);
> > >  }
> > >
> > >  
> >
> > Okay, after reading Sashiko's review it seems that this patch won't
> > be as straight forward as I thought. I'm thinking of manually
> > suspending the device in the remove() function or just removing
> > dont_use_autosuspend() from the probe error path. Any thoughts?  
> 
> Just leave it as it now. I will fix it later.

Cool. Thanks Frank!

-- 
Kind regards,
Joshua Crofts
