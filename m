Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564359;
	b=UQQ/jlr9n0mh5PDVBgDY0mzeMUnIf3VH4Lx6UjMJcI41e2u2aJRKC4KSjkryDjG9ExSg
	 SngXi75Je+gNLsQ5qXuNGO4fy0zIGodFE/eG8pYnj+T+YV40JM3N4xRQPudwn6jFf706P
	 /cI7fAOOW3U/UM1tTcJ8sWmThDkW3zOQyolL8WA+doE1lLdLcqjbOeGLwfSiuP8kBJCUa
	 DKIAsvgh1z3eyX3ePPZt56Iur4hWeIuht63+CYvx9+q2VfUsq9vwOtYnFXJWs2VkPbnzA
	 vYi94UjBrqinXgRy2tiy9JAr1bV5mlbwCB5PhMKrv8V2BDlCP2mJ1tiKMNcrjyBiVBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564359;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=YHQ39+MUMIA6jV73YxFg+JUt1THz2pOGWLEHf/X1POU=;
	b=FkwAhy/DrBU4wcwsOM0bdStmNE5QQrgQ4UmXrqTobdDmhhKLcxbpxhECKtoAcPa5qo7Y
	 RkFBxxzmkuWIhjsT6CbsV7xxOopGfcDhp5zdmm4N1deyJmfEtQOnAGuGfPd8EBTZaHA2a
	 dakUrJJh6BBXCNQEM2YSjIbHwEh2JndUuRh/W3Qo1qN+3RVY/ogvV6Sh6A0ZjbjEeMGmF
	 lxa/bhhA0DDHv4ALP8EFT+j6QHDBQ1mXsYRxmvfn8d6kqvXIg29kG3QZhiV0AZEeFy+tK
	 4rSj64zObCngiFO6nrQzr3EbrahZlRFbsX70mam0OD/FlP3nI9XhBYb3Y+m1bTsnMPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Rq9zWNFm;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFE3606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCFE3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Rq9zWNFm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794564357;
	bh=P43MkHAOPRyb7oE/61ejrj/2m7wH0ZiP/q5aYWffMco=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Rq9zWNFm8PPHZVAxYcvxmC4Zv5KbP9FNqJK9dsCUYmRgN2jZQB7voEG22+pbCXctr
	 jDLZ9H9CDHnPkfkVN7BISlvZCNmwFE0MUDweh/MgNnD5XXWikqRosETec1PkD+VDPa
	 Bsfjn0GxfeV/2n23vs+DnV1Rqg7e6f01kqgFRa4pBSiCMeh5hnDY8moz1WJGdZAwvr
	 kswNch6ZElbuCDvIzB5BDmZFmsxoBT6ALyeCBw0iVGdabKEnhb3KGfsCMGydjwE4wU
	 Uvz1RzNdvXWw1q1Vghdatf2se4m7149SDcimNuULc/M6UgSUuthTBLJ5/Vprht6OSG
	 4smksaLWTwYlw==
Received: from fedora1.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A8CC017E0A27;
	Fri, 13 Nov 2026 11:05:56 +0100 (CET)
Date: Fri, 13 Nov 2026 11:05:52 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tuo Li <islituo@gmail.com>
Cc: steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Fix NULL pointer dereference in sync
 signal cleanup
Message-ID: <20261113110552.034cec24@fedora1.home>
In-Reply-To: <20261113094456.5000-1-islituo@gmail.com>
References: <20261113094456.5000-1-islituo@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
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

On Fri, 13 Nov 2026 17:44:56 +0800
Tuo Li <islituo@gmail.com> wrote:

> In panthor_submit_ctx_add_sync_signal(), drm_syncobj_find() may return
> NULL. The function then jumps to err_free_sig_sync, where
> panthor_sync_signal_free() unconditionally calls drm_syncobj_put() on
> the NULL pointer, causing a NULL pointer dereference.
> 
> Check sig_sync->syncobj before calling drm_syncobj_put() to avoid the
> NULL pointer dereference.

I really wish we had consistent behavior on those _put() helpers. Most
of them check for NULL before calling kref_put(), but some don't,
unfortunately...

> 
> Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
> Signed-off-by: Tuo Li <islituo@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index dc8d0191aef4..8d73956530a8 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -364,7 +364,9 @@ panthor_sync_signal_free(struct panthor_sync_signal *sig_sync)
>  	if (!sig_sync)
>  		return;
>  
> -	drm_syncobj_put(sig_sync->syncobj);
> +	if (sig_sync->syncobj)
> +		drm_syncobj_put(sig_sync->syncobj);
> +
>  	dma_fence_chain_free(sig_sync->chain);
>  	dma_fence_put(sig_sync->fence);
>  	kfree(sig_sync);

