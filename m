Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793129158;
	b=Mq7VmvBDlH4icYEYVW+kok+V5a7hpvy7gZLXt6wyn3CUzbPSO+YjXTu9xMmD13eWn1qr
	 kXpr/Xp3qc6fVUY3CgcSsQ5HYXnQRoGagXzhZ8+LCiZl0xshXSFwf8lsepSSiz7EIgDA+
	 H+mj83pZGjqCDjsYRu5Xv5Qa8YV5XNI3vlGEzttArgIr5/IRNCd/WV7CKvBZeyuAfPh2J
	 olXLpByjf3X8s+fe8YTg2yLSOAUVkJpZU8e09Ip3FfSZNIDp+vGl0q5i6c/gET5K7yHRf
	 eA2DN0uD6Gz7D1AAtXhpqXgZxo7e45FNS4XDeTER5X4W4TgbV/kOJ/JUqlOdvba38VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129158;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=tEogqM6cDAZusNLmJc5Pb9iz70oEFEFrHnh7w79Hiwk=;
	b=tu/ksZoubKVL8uh7aPC/5QmDtB+1Mxm1q+6MS0nYEjgs98N39dTjgomMuAneF0sdmaFh
	 OIud3Wc9hvXXOg5OXwY2RK4JvthGovTK9xkYo+mgnaN49X9gSB9uUgamRh9oji+GZ3VZ5
	 37P+7kmZaGQfuk3ophod9VLjv9WUDrO50RPCO11TFvAlXytuzWx3eopcJe/5SA85F1IXa
	 efMhTK1zGYRHzL/1VLGsCJz8DSJY23PAVqT3fyqxgpAKLqQOz8lZ0K/5qDVIeweCEwjrh
	 5k8nYAB1hloiYdV/vYIW59Kuc2S8fIfaWwhH2Qn3sbNVVz/FYUyZnhqvhXmZrlNOOgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=PX017VZB;
	arc=none smtp.remote-ip=62.149.156.102
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578F7606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 578F7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=PX017VZB
Received: from fedora ([94.34.125.0])
	by Aruba SMTP with ESMTPSA
	id Lmntx3q1VW41bLmntxqI5u; Tue, 27 Oct 2026 20:25:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1793129149; bh=GDOI0xW3OjzJgooa36QpDQuuemC8QFwMBSGIM4ayZdI=;
	h=Date:From:To:Subject:MIME-Version:Content-Type;
	b=PX017VZBdHtuwgydU+pi0Jb/DqzK+cj1xCHoxJ69yoHDnjbuXSu7cQ3uu5BPfwVZ6
	 DDgQLLVzvDrkFfpw1dY73AoEnOmcQDrzQx4RuFt7AGleERiy9ssdsV80hKQu/DCgJ9
	 dWP2OZgW9jFSZ4u7ocDb5bjlg63aYWoOyyyJPggF/lc6ZJcyEbE8HYOnXV5s+Sbw7k
	 mHvKB4M9Q7K4FlRWy0xDeA9K7N5tTYfo6y+zkD9jFEYrNfoRo4MXcohcJWyirry7sc
	 ygJhEsqi71dXemfmzh+OERef/Z0C52Pz1H2M0mqU45PHKRb9yg0DYZcFdOiNd8vtjC
	 cJ/T90Yuu1YHw==
Date: Tue, 27 Oct 2026 20:25:48 +0100
From: Alessio Ferri <alessio.ferri@mythread.it>
To: Andreas Wendleder <gonsolo@gmail.com>
Cc: julian.calaby@gmail.com, kvalo@kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 b43-dev@lists.infradead.org, Michael Buesch <m@bues.ch>, Johannes Berg
 <johannes@sipsolutions.net>
Subject: Re: [PATCH wireless-next 1/2] wifi: b43: reprogram the MAC filter
 after an interface restart
Message-ID: <20261027202548.704378e9@fedora>
In-Reply-To: <20261027202151.7dcdfe4e@fedora>
References: <20261014143225.82149-1-gonsolo@gmail.com>
	<20261014143225.82149-2-gonsolo@gmail.com>
	<20261027202151.7dcdfe4e@fedora>
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
X-CMAE-Envelope: MS4xfPlu6URVniRZ4SPGlOnRS2FmnTO9SM12PPiq9x5/EKVvirC3WRbMvkUS4PHV3wSmPIyyiOflRoYooILKKBXuLQedXOkpTK8pOwLO+obzca1VSoMRrc4s
 mQ74Sfl2VWhVpMUpCqXjna8Yj439uNznjJk9GafkxMNJzDtwmdIeMO4srNgjVYzzZRQ34IghwfQr/inkALn9LMrWMcV0DHYsvIkold8QfkToPwZDVzTjZDHh
 OnsrXLjQruPtesXyx/w5Jjab+tdLbA8RPLuC10PWAdh2Xysu4WRO473bWSWPMiBsMcNhnncwCjEtzdkD4ukNUfKVu6dppZIMtP/49ZEKEITIkusi3GYf0/JS
 IGU5ZxZSJI2iAYPllaWgWe7HgxiE7FEtwgQPlD3LH1SNll3AVamE5l/DNHrleELgG8tdPxhI

Il giorno Tue, 27 Oct 2026 20:21:51 +0100
Alessio Ferri <alessio.ferri@mythread.it> ha scritto:

> Il giorno Wed, 14 Oct 2026 16:32:24 +0200
> Andreas Wendleder <gonsolo@gmail.com> ha scritto:
> 
> > b43_op_start() clears wl->filter_flags, but mac80211 computes
> > @changed for b43_op_configure_filter() against the flags it cached
> > from the previous run. After a down/up it can report no change, so
> > b43_adjust_opmode() is not called and MACCTL keeps the cleared
> > filter.
> > 
> > Compare the requested flags with what the hardware was programmed
> > with and add the difference to @changed.
> > 
> > Signed-off-by: Andreas Wendleder <gonsolo@gmail.com>
> > ---
> >  drivers/net/wireless/broadcom/b43/main.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/net/wireless/broadcom/b43/main.c
> > b/drivers/net/wireless/broadcom/b43/main.c index 8f4aff3..57a5935
> > 100644 --- a/drivers/net/wireless/broadcom/b43/main.c
> > +++ b/drivers/net/wireless/broadcom/b43/main.c
> > @@ -4318,6 +4318,14 @@ static void b43_op_configure_filter(struct
> > ieee80211_hw *hw, FIF_OTHER_BSS |
> >  		   FIF_BCN_PRBRESP_PROMISC;
> >  
> > +	/*
> > +	 * b43_op_start() zeroes wl->filter_flags, but mac80211
> > computes
> > +	 * @changed against its own cached flags, so after an
> > interface
> > +	 * restart it reports no change and MACCTL kept the zeroed
> > filter.
> > +	 * Compare against what the hardware was actually
> > programmed with.
> > +	 */
> > +	if (wl->filter_flags != *fflags)
> > +		changed |= wl->filter_flags ^ *fflags;
> >  	wl->filter_flags = *fflags;
> >  
> >  	if (changed && b43_status(dev) >= B43_STAT_INITIALIZED)  
> 
> Tested on DSL 3580L, with 4352 chip on 5Ghz, the chip transmit and no
> dma error arise. Without the patch the dma engine report an error on
> the descriptor. Earlier in June i wrongly asserted that the DMA on AC
> chips was needing 64 Kb segments, it was a wrong conclusion: going
> 64kb did stop the error, but for the wrong reason.
> 
> Tested-by: Alessio Ferri <alessio.ferri@mythread.it>
> 
> _______________________________________________
> b43-dev mailing list
> b43-dev@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/b43-dev

Ops, i meant to send it for PATCH 2/2, sorry to all

Sorry again
Alessio
