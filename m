Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=140.77.166.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793128360;
	b=pREXkBltFscy7wYIxD6qE2PUNHDPNL1e28Rcfi6Apa+e/qaAEG97S2Kkct9F5mrGVeoa
	 EzvLcVeMMiST2jHpob4Cqhd5ZLYhJlTM08Uy7I9XmJri2iGG4XSYI55sJtd4iJLzbNg0q
	 fWAfu2zOlJVvbdrp3nQrRV9pLJB0hhEG/9jlhp7ZynRkBuKz1eJj4JA3Jj2n03JVMX5gn
	 ocJ/n+B1QRqI/urWJko9STcEsxazmxbfXArWNJaMxvXbMRiSuy4jYzRBXXbD99Q3IkoVB
	 LXzEXSORE+ubcwip6MKMz1RWiFa0xBVOan6+/Z0jzHMOTwzQShwqnEoBoM2tj9/WGWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=CFbDFTziMkoWQN1n95DRV8U+aJfbQhWA0mJpuSrmHLI=;
	b=4bJ3QI/Rv2V1XhVaZw3ReDHeWdZCmzrXvsL7iKhngp0WeVIpSPMkq5FLjAsGJezFZ0r0
	 o1M+SWsgDZ2XtFCZXNKE3f0KJsbMwKKoJp7KOf/lWow2F9wAQOKcRbPNfx9YC6z5K3tXF
	 oM3PGRMRxBcWDoFk83Y7ph7HQojoPg0A/XBTgZjt5bI0IKIgxCk+WTBmliveRKge1rFhz
	 /ig0+eNGBLOqE9O+KHnyw92B2hP4RIW3LdIB8EbQVt/YzEnqBIdySAHHl/lKDeT8y7Z5q
	 jtr+vd30ga5waX9UHDaWWE+GsSf0pwtddLLfqoVKeiuuR9SR5zkcl/yX9otrmoCdslA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ens-lyon.org;
	spf=pass smtp.mailfrom=bounce.ens-lyon.org;
	dkim=pass header.d=ens-lyon.org header.i=@ens-lyon.org header.a=rsa-sha256 header.s=dkim header.b=I4QQio9v;
	dkim=pass header.d=ens-lyon.org header.i=@ens-lyon.org header.a=rsa-sha256 header.s=dkim header.b=mzbfizRF;
	arc=none smtp.remote-ip=140.77.166.138
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E699C606A327
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E699C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ens-lyon.org header.i=@ens-lyon.org header.a=rsa-sha256 header.s=dkim header.b=I4QQio9v;
	dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.a=rsa-sha256 header.s=dkim header.b=mzbfizRF
Received: from localhost (localhost [127.0.0.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id 0BF44A022A;
	Tue, 27 Oct 2026 20:12:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1793128352; bh=XDBUGzZ/fPY4CeZlsfTNnWDc5XbnLxokJ67PRa/zDaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4QQio9v8BO/Cb24/9tTxdE7Sz3QH7FMmDvUOKPFO/kWw2kh5KzRTIs8H4zTrNGi+
	 DOFSYWopKdvusZB2EIIG2k80lfH8tSA+Hg6WPEK9Aen1R9YswaMOc8NkXxBbrHpBvh
	 R1GsuR2p8ZSk/ObfRv6J67lTwb3nmGAsOamyqq07UgKsDNCT5bLybGEyIFELgzPpOr
	 SvqyVNcRRhwMIjbOrzeluUIy5+vkOraPgctw02WYBh0lOQ+IqfGtSXz5leUysTyoL9
	 ewsIpB8rsxJcUEPXyRVpmqQQu9143uzYX/B+blJvsGbWVkjO19wwETCwC/kK5pPhrj
	 QeINIMKihsCEg==
Received: from sonata.ens-lyon.org ([127.0.0.1])
	by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B0vS2ddTYePz; Tue, 27 Oct 2026 20:12:31 +0100 (CET)
Received: from end (lfbn-bor-1-980-210.w90-120.abo.wanadoo.fr [90.120.173.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by sonata.ens-lyon.org (Postfix) with ESMTPSA id 73D69A0216;
	Tue, 27 Oct 2026 20:12:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1793128351; bh=XDBUGzZ/fPY4CeZlsfTNnWDc5XbnLxokJ67PRa/zDaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzbfizRF7O8GN+vMr/bVNkE7Sqh8sLBbt5zmoY8g+/oymiRlu2XSgledEy451jgLR
	 dGzf3bm8XltPGoFhgy22069Quwqup5pO568WaRboiGhRPby97YZ5bfDieVcS1BFscj
	 0xj6uae/uWXJINuFtJ03cTEJgQbvwXYIi3JkEynXPIHnpKEH+cNvVbHQC4yLWsmB0B
	 Kb4+41soREYKrmYQ+xfMStWJclu1OivUPaJFHVpLMYbvP4lNwKdoGF/snyioBqBtFu
	 asss5nXYvzM3WHganOqcgvjN7KrYKXRrHp6O06safqCGobLhg/TjLRN8OY75kqKpW/
	 f5kOLiU1bPsPQ==
Received: from samy by end with local (Exim 4.100.1)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1xLmb1-000000029Mg-0Dpw;
	Tue, 27 Oct 2026 20:12:31 +0100
Date: Tue, 27 Oct 2026 20:12:31 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: w.d.hubbs@gmail.com, chris@the-brannons.com, kirk@reisers.ca,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>
Subject: Re: [PATCH] speakup: don't use the ldisc data after a hangup
Message-ID: <auD3nyhvHAlKCsXr@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	w.d.hubbs@gmail.com, chris@the-brannons.com, kirk@reisers.ca,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>
References: <2026102720-shakable-voter-f08f@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026102720-shakable-voter-f08f@gregkh>
Organization: I am not organized

Greg KH, le mar. 27 oct. 2026 17:31:21 +0100, a ecrit:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> ttyio_in() takes the struct spk_ldisc_data from tty->disc_data and waits
> for its completion. The structure belongs to the line discipline:
> spk_ttyio_ldisc_close() frees it, and leaves the pointer in place.
> 
> speakup holds the tty until the synthesizer is released, but the line
> discipline can be closed before that. A hangup of the port does it:
> __tty_hangup() calls tty_ldisc_hangup(), and as no file is open for the
> tty, this one calls tty_ldisc_kill(). The port is hung up when a USB
> serial adapter is pulled out, and when a serial port for which CLOCAL was
> switched off loses the carrier.
> 
> After that every call of ttyio_in() takes the lock of a completion in
> freed memory and may write to it. The LiteTalk and Speakout drivers call
> it through spk_synth_get_index() whenever "read all" is used. If the
> hangup comes while ttyio_in() sleeps, the completion is freed under it.
> 
> Take a reference to the line discipline for the time the data is used,
> and report that there is no input if there is none any more.
> tty_ldisc_ref() does not sleep, so it can be used by the callers in
> atomic context, too. Also clear the pointer when the data is freed.
> 
> Fixes: 6b9ad1c742bf ("staging: speakup: add send_xchar, tiocmset and input functionality for tty")
> Cc: stable <stable@kernel.org>
> Cc: William Hubbs <w.d.hubbs@gmail.com>
> Cc: Chris Brannon <chris@the-brannons.com>
> Cc: Kirk Reiser <kirk@reisers.ca>
> Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

Samuel

> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/accessibility/speakup/spk_ttyio.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accessibility/speakup/spk_ttyio.c b/drivers/accessibility/speakup/spk_ttyio.c
> index 6bff78e3d872..44139d870ac4 100644
> --- a/drivers/accessibility/speakup/spk_ttyio.c
> +++ b/drivers/accessibility/speakup/spk_ttyio.c
> @@ -69,6 +69,7 @@ static int spk_ttyio_ldisc_open(struct tty_struct *tty)
>  static void spk_ttyio_ldisc_close(struct tty_struct *tty)
>  {
>  	kfree(tty->disc_data);
> +	tty->disc_data = NULL;
>  }
>  
>  static size_t spk_ttyio_receive_buf2(struct tty_struct *tty, const u8 *cp,
> @@ -291,17 +292,24 @@ static int spk_ttyio_wait_for_xmitr(struct spk_synth *in_synth)
>  static unsigned char ttyio_in(struct spk_synth *in_synth, int timeout)
>  {
>  	struct tty_struct *tty = in_synth->dev;
> -	struct spk_ldisc_data *ldisc_data = tty->disc_data;
> -	char rv;
> +	struct spk_ldisc_data *ldisc_data;
> +	struct tty_ldisc *ld;
> +	char rv = 0xff;
> +
> +	/* A hangup of the port closes the line discipline, which frees its data. */
> +	ld = tty_ldisc_ref(tty);
> +	if (!ld)
> +		return 0xff;
> +	ldisc_data = tty->disc_data;
>  
>  	if (!timeout) {
>  		if (!try_wait_for_completion(&ldisc_data->completion))
> -			return 0xff;
> +			goto out;
>  	} else if (wait_for_completion_timeout(&ldisc_data->completion,
>  					usecs_to_jiffies(timeout)) == 0) {
>  		pr_warn("spk_ttyio: timeout (%d)  while waiting for input\n",
>  			timeout);
> -		return 0xff;
> +		goto out;
>  	}
>  
>  	rv = ldisc_data->buf;
> @@ -312,6 +320,8 @@ static unsigned char ttyio_in(struct spk_synth *in_synth, int timeout)
>  	ldisc_data->buf_free = true;
>  	/* Let TTY push more characters */
>  	tty_flip_buffer_push(tty->port);
> +out:
> +	tty_ldisc_deref(ld);
>  
>  	return rv;
>  }
> -- 
> 2.56.0
> 

-- 
Samuel
c> [ ] morning [ ] afternoon [ ] evening [ ] night , everyone (choose as applicable)
