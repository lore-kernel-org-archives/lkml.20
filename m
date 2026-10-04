Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7534E46D080
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791133881; cv=none; b=uwx6wV+VqQmfx0U2yFCxEtL8mSRexZbrEfDwJGgFP/JsNig++toyKYhHofxErrh1rO6ig/os1KgXLHKo4k1InXSkE+r61VFqLnHr+B6zn0XUGttCg09G0Mfojrk1wo1nzI0opq1EtjbFdJRxA5T+2tZ/7PS6WFhlri8Qr0AXOxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791133881; c=relaxed/simple;
	bh=Q/M6XX4KBiw5Gp0PIn+bdhyMDmc7TA1EFOBsKB8qPWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwGZVOL78aOErefs9KdQsMTJFmgPR9UMZhavS1QCxj8/QFkAl6rrcBDpizHFZc7P3lmZQfavW49GCL01LMa7ZnfIyMJ8qdVqZjNrL8KsEK4k4Cbd7K+vhXxM55e+fbsetqh9FMKp31aEqXX0eKr/Wj6EQjTGS3tDDlPD8niyO8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VipTyKOv; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VipTyKOv"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-82656756187so106489a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791133876; x=1791738676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dH2iYe9KlNrdpHdH3g9sAh2tseccxYrK9JO9bJq1C0Y=;
        b=VipTyKOvvAJDW7A/Q4xDbOPmPjt3UxF8ytqPWDIiZc66dSXg+cvf28hffBTXg6IveZ
         7expOXAerdcIcbWjPQqBIhzM+RirzI3hGGmvCo2+s+8CmozSvWtB8Vfbym2o9XiZ3pbR
         VQaUxG+5RPgYVLCGLnh2vPPCjFxX0O2BzSTeLDkIj+ANr+kMNwT818Hhp9/Ma8E6q93p
         KFMFtzMS6OtGAc7dEbk2OgxeSHWVLh4bSlKULKR4IGv6Yg4QluKCSRo+Yz78Q2fcHGXZ
         heLQpeqnMCVd+Y9WYFHR8cyZncrBRlh5m+LQDiwVnAaTfbWyXfNKdG7sTSwaKSpuazXJ
         Nlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791133876; x=1791738676;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dH2iYe9KlNrdpHdH3g9sAh2tseccxYrK9JO9bJq1C0Y=;
        b=cJ0qC9CG5ajW+Nm75WlTMenKo1qJd8nVcsxgkFoddexIDFUVf+y1e6Scz3B+QX72hL
         sdoOX6jO41PxcyQeeXnvGqaHN8oLwhw+f2stgEI2jRLf9FWgYJ1em5th3impLQbHstAr
         Jc0sV6TcptkdQMH8/5+b40xck+y0c7cr+czqurdgQVMUyiG9Lh2my0yeWmEHqQtyG3Nc
         7VAzkJYI/tG0MHclGsdbPrFOEVV6B2Aujmpse4TaaeFk6MRQdcu0B7ZCENPOI8pyoIYm
         8VQadcEGG0VT7cc2iCD9Ln/4RbnKKj2mQx4UI2yAux2O15qTyO/q0tBoBKuJl8iqxAD9
         Pllw==
X-Forwarded-Encrypted: i=1; AKwUvBxWvDpvMEjzqWtF55Yyelf8kSWRy+pFbo7HI0B0TaTebiQJwVmu5cH0r2a7++o/v5lWJ74Aqnv1u3A20Ks=@vger.kernel.org
X-Gm-Message-State: AFuF++l2NzplXR9SvcEh1LUfG21RGeJ4tTnF1YjhRT10irpDHLWTev1Y
	z4vkRF2drtayGGgXaOO0PSpL1HJgfQL1DKzmKiOD/JxFf0EmVibFYpCh
X-Gm-Gg: AYBFou3JFRf+ChKPjKzf70vPS2WeWS/2TL6mKM8uLN20/MHAfe4r/HjSfJix+qRTYxA
	kPjXfOPl4q/k5jW2JhvMmtMXwAiQ4V3cfXCTShxwrH8E+NDqkHq5To+PD61b/ih3+JU5bVaRP0Q
	F52XWl7KtblH+3r5ZJXbSnvtaqmMnfE7fb2MMJWn8+J4nymI8q1c6o5TrWpSiCnGayeIVOQXm37
	AuMD/vd9DLMsLbRzrDheC0BNxEirRnTZXktfWFNVCszLM9LXItQ2VSn/lvzUifnpk+ohecaJIKI
	29/PlrtGE5FmiJCFjdxqGyS9V3uTHJ4Xb07MmvXdVvxvMp4pUJqONTL9ExReEfoigQABHxxVvvW
	htYKQa0NJN0G4MOS6sNCF26F7BZn9miSphR3SuLxdf5reo1zRY792phnnPejRB/3DGZExZSYsF8
	QzamJcj1+LIuYner6JyBvxFamBU3wSSYdXc+R3yrtS4JdkhGgGo/gZjiaC3gLZVcR5UukOTIdxs
	+DyWi6YWdOTlq2TzLbqW/0D6hZIv2OrHmYXkBpNEBZTftC3S/q+Pf/5rFo7YtvzwfuQLLwdND17
	IBTFEop765RPAp06Qx41dBaK0eWMiwXH4+NF07+Ja5lu0aDK5DxATMmSeMfyztv3
X-Received: by 2002:a05:6830:6c0c:b0:81b:ac9a:5681 with SMTP id 46e09a7af769-82283677064mr8579641a34.29.1791133875700;
        Sun, 04 Oct 2026 10:11:15 -0700 (PDT)
Received: from XPS-17-9720-nixos (174-16-208-129.hlrn.qwest.net. [174.16.208.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8227aa72075sm9917953a34.27.2026.10.04.10.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:11:15 -0700 (PDT)
Date: Sun, 4 Oct 2026 11:11:07 -0600
From: Jonathan Gopel <jgopel@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Do not RPM complete unrelated subtrees on
 unplug
Message-ID: <asJo_FxaGjk78GfS@XPS-17-9720-nixos>
References: <20261004022604.359663-1-jgopel@gmail.com>
 <20261004120255.GI176164@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004120255.GI176164@black.igk.intel.com>

Hi Mika,

Thank you for the prompt response, it's much appreciated. I've left a
few questions inline.

On Sun, Oct 04, 2026 at 02:02:55PM +0200, Mika Westerberg wrote:
> Hi,
> 
> On Sat, Oct 03, 2026 at 08:26:04PM -0600, Jonathan Gopel wrote:
> > When a Thunderbolt device is unplugged, that switch and every switch
> > subsequent to it on the bus device list is `complete()`d, not just its
> > child devices. In the case of multiple domains, it may cause, eg, an
> > attempt to `complete()` the uninitialized domain 1 root switch RPM
> > completion on unplug of a switch from domain 0 (though ordering is not
> > guaranteed numerically sorted).
> 
> Good catch!
> 
> > I initially noticed this issue on a Dell XPS9720 when the system would
> > seem to sporadically not wake after unplugging a Thunderbolt dock. I
> > tried multiple kernel versions including v7.2.7 and v7.3-rc4 to see if
> > that resolved the issue, but the issue persisted. Eventually I found
> > that I could consistently generate a kernel Oops reporting a page fault
> > at 0xffff_ffff_ffff_fff8 on unplug from one side of the laptop and went
> > bug hunting. I became suspicious of the `bus_for_each_dev()` walk that I
> > ultimately ended up changing. To confirm this issue, I did an eBPF trace
> > of `bus_for_each_dev()`, `complete_rpm()`, and `complete()` while
> > unplugging in a variety of situations and found that an unplug from
> > domain 0 tries to `complete_rpm()` domain 1's switch, whose RPM
> > completion is not initialized and thus is holding a null wait-list
> > pointer, triggering the page fault.
> > 
> > Here are the key sections of that eBPF trace. Note that HEAD denotes the
> > completion's own wait-list HEAD:
> > 
> > ```
> > RESCAN_ENTER domain=0
> > 
> > COMPLETE rescan_domain=0 target=0-1 target_domain=0
> >          route=0x1 parent=0-0 unplugged=1
> > COMPLETION done=0 head=HEAD next=HEAD prev=HEAD
> > 
> > BUS_WALK domain=0 start=0-1 callback=complete_rpm
> > CALLBACK_ENTER rescan_domain=0 dev=1-0 parent=domain1 is_switch=1
> > 
> > COMPLETE rescan_domain=0 target=1-0 target_domain=1
> >          route=0x0 parent=domain1 unplugged=0
> > COMPLETION done=0 head=HEAD next=0 prev=0
> > 
> >         complete+5
> >         complete_rpm+43
> >         bus_for_each_dev+133
> >         icm_free_unplugged_children+250
> >         icm_rescan_work+42
> > ```
> > 
> > To fix this, I have reused some of the adjacent logic to recursively
> > walk and `complete()` only the unplugged switch and its descendants.
> > 
> > I only have a single system with multiple Thunderbolt domains - the Dell
> > XPS9720. I am consistently able to reproduce the Oops on that system.
> > Since running with this patch, I have not seen the Oops reoccur. I have
> > also tested it on a Thinkpad X1-Gen12, and that system boots and runs
> > well with it, but it only has a single Thunderbolt domain, so it does
> > not exercise the multi-domain failure case.
> 
> This looks like LLM was involved and if that's the case then please add
> Assisted-by: LLM.
> 

I'm happy to add an annotation here, but I was unclear on what the
policy was. I have a few other issues with this system since adding a
TB5 dock to my setup that I may also pursue patching, so if it's ok with
you I'd love to understand the expectation a bit better be expected.
I've read the policy, but I didn't come away with a clear understanding
of what exactly counts as assistance.

I had an LLM do the initial portion of the investigation here, basically
going from symptoms to identifying the Oops, which pointed at the
Thunderbolt unplug code. From there, I wanted to make sure I delivered a
high quality fix, so I did the remainder by hand. Does this warrant the
annotation?

> > 
> > Signed-off-by: Jonathan Gopel <jgopel@gmail.com>
> > ---
> >  drivers/thunderbolt/icm.c | 16 +++++++++-------
> >  1 file changed, 9 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
> > index 669807f0eaf8..d6801d8b669b 100644
> > --- a/drivers/thunderbolt/icm.c
> > +++ b/drivers/thunderbolt/icm.c
> > @@ -2068,13 +2068,16 @@ static void icm_unplug_children(struct tb_switch *sw)
> >  	}
> >  }
> >  
> > -static int complete_rpm(struct device *dev, void *data)
> > +static void complete_rpm(struct tb_switch *sw)
> >  {
> > -	struct tb_switch *sw = tb_to_switch(dev);
> > +	struct tb_port *port;}
> 
> So instead of this, just check that sw->tb matches what you pass in..
> 
> >  
> > -	if (sw)
> > -		complete(&sw->rpm_complete);
> > -	return 0;
> > +	complete(&sw->rpm_complete);
> > +
> > +	tb_switch_for_each_port(sw, port) {
> > +		if (tb_port_has_remote(port))
> > +			complete_rpm(port->remote->sw);
> > +	}
> >  }
> >  
> >  static void remove_unplugged_switch(struct tb_switch *sw)
> > @@ -2088,8 +2091,7 @@ static void remove_unplugged_switch(struct tb_switch *sw)
> >  	 * tb_switch_remove() calls pm_runtime_get_sync() that then waits
> >  	 * for it.
> >  	 */
> > -	complete_rpm(&sw->dev, NULL);
> > -	bus_for_each_dev(&tb_bus_type, &sw->dev, NULL, complete_rpm);
> 
> .. here pass sw->tb 

I'm submitting a v2 patch with this revision. If you have time, I would
love to understand the reasoning for preferring one over the other - to
my eye they look equivalent.
