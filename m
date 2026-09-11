Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A060F3D25D2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120456; cv=none; b=IYZPCIH9ppfN5z1rm/WbmXbwnKICfEnzYYrVD/zFGGoz9S5Xn24Y8lIBniGoZdCZLyejp2+obDUVwPS2WKBFtCtHD/bKZpDr3oleJ0Csx62wA+Y7TlCEMiLRzf7YjGeUSDzF8ebperNxbFNAyl5aSZvBgKKoFAlGMp36CnGmheA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120456; c=relaxed/simple;
	bh=+bJcP3hgZKncl50ol86uNSzjg8GhtHkhKyT01/iVVxE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iiP86uBBL8msQS4uvGx+tfxG2Ud+Yut5fngg/yN6uAVQxmC7RBrOCp4+3IALNkit+VSnoJkEGkUOBePTFjjOQusv5F/7XivFde4Fr20o6o24nPGCxRU/cpFs+v+8l5Wk6ok63i/AoYw5kQXkaRcHvTFRn//xl2F6VHem1r+tU6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aJL0a3De; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aJL0a3De"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789120452;
	bh=+bJcP3hgZKncl50ol86uNSzjg8GhtHkhKyT01/iVVxE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aJL0a3DeMKgi7ul0Z9H6t09PYjjGFDedS6yCc1pcRb1HWMKUZiK6olr4TnJ+toy43
	 oD3nRc+6KHeV6J4tHmYrC8widsgFKJobzIi324Z23h3iH3/6Mh8MvsFdHmFb2JUm+Q
	 gQ4Yl00CWCobnb4xN/Zc1+y16yfG3W7fnZOTNo1NOqfxCL2QgeY6RMYHMYyT60UxBx
	 sNMY/qyd1ikLp2x/vmEKNd2jaiVeFvAOT8GKNXC5nXxQVnuvllFGnnl3hSxWsf2qWl
	 RN50cXeTCtgeGJXfEIM5fkanbMqeuzVL9qcdnSPxNfCMe33Nehh9qg4r+4yZ7ZS1hX
	 KTriq5oA7FBZg==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5434917E0785;
	Fri, 11 Sep 2026 11:54:12 +0200 (CEST)
Date: Fri, 11 Sep 2026 11:54:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Adrian Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/18] drm/panthor: Complain if the SOFT_RESET fails
Message-ID: <20260911115406.1758b0eb@fedora-21.home>
In-Reply-To: <aqNsLgZRLw_el4h4@sobremesa>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
	<20260826-panthor-unplug-fixes-v4-13-982cc8f4234b@collabora.com>
	<aqNsLgZRLw_el4h4@sobremesa>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 04:40:01 +0100
Adrian Larumbe <adrian.larumbe@collabora.com> wrote:

> On 26.08.2026 16:56, Boris Brezillon wrote:
> > We rely on a functioning SOFT_RESET to avoid HW UAFs when the GPU was
> > in a state where AS commands were no longer accepted. If we silently
> > ignore RESET failures, we're just pretending to be safe while exposing
> > ourselves to the very UAFs we were trying to avoid. On the other hand,
> > there's basically nothing we can do if both the SOFT_RESET and the
> > AS_COMMAND(UNMAPPED) fail, so do what we do best: complain loudly and
> > taint the kernel with a WARN_ON().
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_hw.h | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> > index 4531c1239cb6..f13fd7b335c1 100644
> > --- a/drivers/gpu/drm/panthor/panthor_hw.h
> > +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> > @@ -41,9 +41,17 @@ int panthor_hw_init(struct panthor_device *ptdev);
> >  int panthor_hw_power_status_register(void);
> >  void panthor_hw_power_status_unregister(void);
> >  
> > -static inline int panthor_hw_soft_reset(struct panthor_device *ptdev)
> > +static inline void
> > +panthor_hw_soft_reset(struct panthor_device *ptdev)
> >  {
> > -	return ptdev->hw->ops.soft_reset(ptdev);
> > +	/* We're relying on the SOFT_RESET to reset the MMU block if some AS
> > +	 * were stuck for some reason. Failing to reset the MMU/L2 means we're
> > +	 * exposing ourselves to HW UAFs. On the other hand, there's basically
> > +	 * nothing we can do if both the SOFT_RESET and
> > +	 * the AS_COMMAND(UNMAPPED) fail, so do what we do best: complain loudly
> > +	 * and taint the kernel.
> > +	 */
> > +	drm_WARN_ON(&ptdev->base, ptdev->hw->ops.soft_reset(ptdev));  
> 
> I think you forgot to include drm/drm_print.h, although Sashiko probably picked up on this.
> 
> On top of that, I wonder if failure to soft reset should be carried up the call stack and
> eventually lead to an early unplug, just like you do when panthor_fw_post_reset() fails.

That's what I had in earlier versions of this patchset, and I decided
to get rid of it after discussing it with Liviu and Steve: if a
SOFT_RESET can fail and there's nothing above it to guarantee that the
HW is off and can't do any access to the memory it knew about, we're
just screwed, because then we have to leak resources at unplug time. I
tried it, and it's nasty, so in v4 (or v3, I don't remember) I got back
to something simpler, with the assumption that SOFT_RESET will never
fail (which seems to be the case in practice by the way).
