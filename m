Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E766439890A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523346; cv=none; b=GLTsGwXbqZOfhWpBaQFhRfnIDvKGpmjkQ5J10pJtKrezN6OF8CtWtiFJEHr79Kqa2AJiLt01cPZFZw4GdOwkUkhfR9e8/ckcJsntP/4knsv8w9OaILNOwfbxemy34lObQizWwixCCxtwWx9YrPG0/vYatH5Wwydxu/u1baWRAXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523346; c=relaxed/simple;
	bh=cljt56npTkW7GuXOtH41oqLarj2iVtJJdz/cZ0wpCMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYt13KMI0qGcnop+TXNZr+Q+DO8gh+GUjGU/hGL67ORc1mDt7LvIJMGvfM0JMlJpyvVLjZzao/ySbcd5ARcPFH7TgQE5atBEP2wuzZnw+6i+MAAXBRT2rs+TFxglTxV1r4++I/9c+LQxNGGSNdczFftIjGSjq71wwA/QqB5KMZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQvrwkBA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQvrwkBA"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48436216a98so584724f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523343; x=1789128143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+qgxqWEXAb9q775gpw7sG7cGIPG1UapQc2itwhgTTQ=;
        b=fQvrwkBALDUCNYK+k3gd7HUEVRQ+T+vqVJI6aoSzmw9+Vg0DNMT85VC6uf9ch0zyuO
         Lowv2d/zisEa/IBftrZSYMTUBL98tz9vXBuCQ9UxgC7PTT15UDBp8jM62oDXxAXVyQkf
         35vUZBD5vEIfJrfmUPWND4+Oh5/9SN7j6RYiCBsVWjvr9B8vuvnXgoomN5w57wG/z/8T
         X9k0NDw5seaTRr2TljhgpKZh2BfjxNwB6CF4ClVdzxDYyMZ8sLecFsTWlYo74pr4rY7t
         kzmOGxFcSl+ORTeX8QHteM/KMwHU4HIQcDrl1nOXDlE66cuu6U3j8ujU/FZpG0N8u+wc
         zy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523343; x=1789128143;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+qgxqWEXAb9q775gpw7sG7cGIPG1UapQc2itwhgTTQ=;
        b=NLX90RYzscbLvtW0FcUccr8sWGD+FhpORYlywvrk9CBru5dfAC9Bak5LISMHfBn6tX
         2PozPi2NUfI5DoP5MIY6SxRIwRFUHKLI9Jh855GJeB0PoZ7BWD3aWb6L/JFH9V32W22A
         BY2yP5m1qlQzQleH1VPbfBqEVTIeViX5k/fXfiov+7BMGSCG6fNdrxuMxFlivE0jaIRY
         qxkwZBNr7XKCuYS6wtVQo3yGOUhH454U/0zOSSwX3YMv0BXsMKzzcQns8GFMCbJy03v3
         Hp0LjjLF52oqNfm2OPjz3N/5JjvB3u4/fsBuYIu7ZQwltVPzKgX7YRO8zAf11oI+qCt4
         NDlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHQYWTYlqD4zl8OEmOq/KOCblpS6HkgZrm3rfLrUQ+juQ0hdR/z2LmfakjUE+sn9UUlkW+3lvRX+Yw/kM=@vger.kernel.org
X-Gm-Message-State: AFuF++nof0AjVt9OPFCsSveoTFtVFLlhQhG344zdAJt+VKiLTgEm8J4W
	ptcJjlyGw09Fji6o7w1iu336C7AXpQ+VtCUNP0eM5CsOXyb9G25la9Ak
X-Gm-Gg: AYBFou2XFHKyvShO7e2Br15koYcfyiLZBoCrgeyrWhoN/BcibtnbzzodgTSwJr4kl3i
	aApEWRLTGOevcwPLPUsxBq3mB/Gy+SZH0YtMpia3ktBOlaM7DiG2DYklEW11rBlFwsjQEHGBYUx
	J1gx7Hu5b6Iye4YN2sy7og8CfxIkzN+nnkpCE9DPZffUZjZgBeuZcanZC4KXGQMZ/kyZ/+lixCB
	Vv5lYo+scZER/FoIk3p0zgrnPaOu1OYTCsWXJATjJEitM1ZwLoEKr3gPRH0NGLhxYHDY6EjKyLq
	XSk2vN9M2j6ql+Sdc7/8kPazLdjmtKY0JA8bh7luehZHZZb+yPWpk1jbO75rPcWGMFB7gb4ycGU
	KZSYNHjWdA33RnUdHyK85+AyCYRBpNP7XidiRmQi5GptxyZAi3axlF4VvH65K64oACZ37CoE/gC
	jPRJq90kCnUjOm53hpzkyyTGWDYEphXNwaFjaaO66obRgWtapJ+2IwG4hjmri8P6GcqMdjxSZ27
	vvY3lL10CeADHwY4ON4z/HNH2Z7ZcGAcPwfs+ZfFBF/SuNdaelkn5d3EOU3AddoFnVXyR6jEw==
X-Received: by 2002:a5d:5f94:0:b0:485:8c17:975b with SMTP id ffacd0b85a97d-4858c1798cfmr2792947f8f.29.1788523342687;
        Fri, 04 Sep 2026 05:02:22 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm5726091f8f.21.2026.09.04.05.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:02:22 -0700 (PDT)
Date: Fri, 4 Sep 2026 14:02:20 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: tessolveupstream@gmail.com, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	marex@denx.de, valentin@compulab.co.il, philippe.schenker@toradex.com, 
	alexander.stein@ew.tq-group.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] drm: bridge: ti-sn65dsi83: Fix DSI mode flags for
 stable LVDS output
Message-ID: <3hfae2i2i2toxbo7hg2if6pztaswgnfj65xfm2c4ofljc6jhua@slaqoewn4mxq>
References: <20260412053811.662461-2-tessolveupstream@gmail.com>
 <DHTJJRKD65L4.1P7X5O20V1W2Q@bootlin.com>
 <c4c33f14-0da0-447a-ab82-2e2f65c09c07@gmail.com>
 <7056b23b-ed81-4d79-b782-5cfcb0102ef7@gmail.com>
 <60a24977-b181-40e4-bcf6-38b65af293e2@gmail.com>
 <DI18PL73UQKR.2YZVZ21V69H7O@bootlin.com>
 <e88af0b7-388d-4b0a-8eb2-a367e24e84fb@gmail.com>
 <DIMMKNT9RHYM.1BRF1S1V5SIKI@bootlin.com>
 <1716be56-ac43-440b-a5df-58cbf571ba95@gmail.com>
 <DINH3J2SM26P.3KE6GE9VPB1OC@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DINH3J2SM26P.3KE6GE9VPB1OC@bootlin.com>

Hi Luca,
Hi Sudarshan,

On Wed, May 20, 2026 at 01:38:36PM +0200, Luca Ceresoli wrote:
> Hello,
> 
> On Wed May 20, 2026 at 11:04 AM CEST, tessolveupstream wrote:
> 
> [...]
> 
> >>> We have not received any further updates from TI regarding this issue, and
> >>> at this point, we are not sure if we will get additional feedback from them.
> >>> As you had mentioned earlier that the patch could be considered after
> >>> waiting for some time, could you please let us know how we can proceed
> >>> further from here?
> >>
> >> I am getting some feedback from TI, but it is taking some time.
> >>
> >> For the time being I think it is clear that HBP and HFP are required, and
> >> so removing the MIPI_DSI_MODE_VIDEO_NO_HFP and MIPI_DSI_MODE_VIDEO_NO_HBP
> >> in your patch seems to be fully correct, even though this had no effect on
> >> the panel I tested.
> >>
> >> I'm still trying to get some better info to ensure that switching from
> >> burst mode to non-burst mode is not expected to have side effects.
> >>
> >> For thi reason, I think it would be great if you could send a new version
> >> with two separate patches: the first one enabling HFP and HBP and which can
> >> be applied right away, the second to disable burst mode for which I'd wait
> >> a bit longer for TI feedback. You can keep the Tested-by lines.
> >>
> >
> > Thanks for the clarification. I just wanted to confirm my understanding
> > regarding the patch split you suggested.
> >
> > From your comments, my understanding is that the first patch would only
> > enable HFP and HBP by removing MIPI_DSI_MODE_VIDEO_NO_HFP and
> > MIPI_DSI_MODE_VIDEO_NO_HBP, while keeping burst mode enabled, so the mode
> > flags would become:
> >
> > dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> >           MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET;
> >
> > Then, the second patch would only disable burst mode, resulting in:
> >
> > dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_NO_HSA |
> >           MIPI_DSI_MODE_NO_EOT_PACKET;
> >
> > Could you please confirm whether my understanding is correct?
> 
> Yes, correct.
> 
> > Also, from our testing, when using:
> >
> > dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> >           MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET;
> >
> > we are not able to get display output.
> 
> This is the case for the panel I worked on as well. In the practice we both
> observe that non-burst mode is what fixes the panel, but there is no clear
> explanation of the reason in the docs (that's what I hope to discover from
> TI).
>
I am testing a DSI panel on our Verdin iMX8MP module, and noticed that
this caused a regression.

In v4 of this series only the change removing NO_HFP and NO_HBP was
applied. [1]

For us, the display worked before that change. So with
MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_NO_HBP |
MIPI_DSI_MODE_VIDEO_NO_HFP: things are fine.

But with only MIPI_DSI_MODE_VIDEO_NO_HBP | MIPI_DSI_MODE_VIDEO_NO_HFP
removed, it no longer works. I can verify that if I also remove
MIPI_DSI_MODE_VIDEO_BURST, things work fine again.

How can we proceed, will we be applying the removal of
MIPI_DSI_MODE_VIDEO_BURST soon?

I think we'll need to either revert this and later apply both together
when ready, or apply the second patch now as well. Right now, it broke
the DSI panel behind a TI sn65dsi83 bridge on v7.3-rc1.

[1] https://lore.kernel.org/all/178164296717.254857.3522055507948798930.b4-ty@b4/

Thanks,
Ernest
> 
> On the other hand the HBP and HFP are clearly required by the docs, so it
> should be fine to enable those without waiting for further info from
> TI. This is not fixing your and my panel, but it's a fix, no doubt.
> 
> > I just wanted to mention this
> > observation in case it is relevant to the patch split discussion.
> >
> > Additionally, regarding the Tested-by tags you mentioned earlier,
> > should I carry them forward to both patches, or would you prefer them
> > only on the applicable patch?
> 
> I'd say yes. People who sent these tags have tested a patch that is the sum
> of the two future patches, so I'd say it's OK to keep the R-by on both
> patches.
> 
> Thanks for your patience. We'll get to the bottom of this issue! :)
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
