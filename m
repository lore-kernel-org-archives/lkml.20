Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912446;
	b=eBlIYjkFbTamwPlANaQRYKCzRN5DHY527SMi3RhfhbqNnHSTGnbAr4sn8zwCKE764m53
	 aPhIV3FDIMVZkesrrIySWtV5QObXu0t12Qj2Nrog/aP7WNnk7yteCEzDNM9GtByVTthvQ
	 08MeWyFGu5QyvKbQQuglYJ4Bhpo6UWU3iIfgsoGStSOZ3SE8tL3AK1FqGVrHh1t7mNIHW
	 84uYzJ1ihc6505DsHBEeVTCfwzk2ScAxjFHMFMXVCy9r55ThuiWy3hgoK2pUat0jQdiMt
	 1m4mJq1s3JTPaRG03+5y6GoETQ8HN/wo96zm0AeWOJR9kElhh0f7X5sqEWZ1hLbCSXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912446;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9ihjrGk3q905v6fd32tqxVXlQ5X59DKw3EgepRM6MSs=;
	b=b40m/lHk3xHujeqDGyCmfZ0U6/J0076Mi6l3k3ic1LxtqK2wCq9AnewyY+80fzILGQzC
	 HbeUmJOzxicFGLSfdDXgkDeLlYt+64ByOXufujI2y0fMO47qWe7Mg/wZ9a/uOuCP2NfS7
	 ajzbIOo/CAjoHk3Pg7UEux9OBQO/yHsu14YOdxIRyS7rA2i0weYJ7E7br70TK0cRVyajW
	 84lNUQCA632Vudnee8P2SFHa6+ulUeK/e07tNPqaNTYpTKZwrf8hBuFJgkfS9OwABWQi7
	 SQyC8eEh28DrL7jVaz9+5sEFY3kGAjPGepnGJv4vNjKRyxjWdryq2rp7Pjx2B8Il26g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lsnf5+Go;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EC6606A323;
	Tue, 17 Nov 2026 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lsnf5+Go
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353671F000C4;
	Tue, 17 Nov 2026 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794912446;
	bh=9ihjrGk3q905v6fd32tqxVXlQ5X59DKw3EgepRM6MSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lsnf5+GoN8lr7SfGSFHjh4TxQKlmqxqxS6ANxQ1KLMLrJ8mBPG7XC/K1OnbSZ/NoE
	 XGtqhaXWl+c430JCrRdY9mVkyvStwNGzP85EVSmmUYyKB6tejX+hhY6Kz88Z9sHJaI
	 7vCDwcQNCYKQUZuXef4q1iB63YFchYOqxgRDMKI3JtUE7fQQC2cG5+L+Vg7G0n/WUJ
	 RdPVbCgsenGgyGHSNSF8sax+EEjT8sfUGRy6aoo40Mh6rnpTLdABHolS5kMQI6Dpg/
	 0A+f8Z65XCZ90VjGJVyQSLd29IgGcq5XqCuZdoyU53qplzMKlsD09jhMpKC73zfr+e
	 5shb+rQBJFR3g==
Date: Tue, 17 Nov 2026 10:47:22 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the mfd tree with the origin tree
Message-ID: <20261117104722.GB64850@joneslee-macbookpro.roam.internal>
References: <avtYstt11GO7g85R@sirena.org.uk>
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
In-Reply-To: <avtYstt11GO7g85R@sirena.org.uk>

Kees, et al.,

> Today's linux-next merge of the mfd tree got a conflict in:
> 
>   drivers/mfd/nct6694.c
> 
> between commit:
> 
>   4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")

Is there a branch / tag that I can pull this in from?

> from the origin tree and commit:
> 
>   962b44ae8126d ("mfd: nct6694: Allocate USB DMA buffers with kzalloc_obj()")
> 
> from the mfd tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --combined drivers/mfd/nct6694.c
> index dabd83b9d455c,40a29f8e0ff61..0000000000000
> --- a/drivers/mfd/nct6694.c
> +++ b/drivers/mfd/nct6694.c
> @@@ -201,6 -201,7 +201,7 @@@ static void usb_int_callback(struct ur
>   		break;
>   	case -ECONNRESET:
>   	case -ENOENT:
> + 	case -EPIPE:
>   	case -ESHUTDOWN:
>   		return;
>   	default:
> @@@ -280,21 -281,25 +281,25 @@@ static int nct6694_usb_probe(struct usb
>   	struct nct6694 *nct6694;
>   	int ret;
>   
>  -	nct6694 = devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
>  +	nct6694 = devm_kzalloc_obj(dev, *nct6694);
>   	if (!nct6694)
>   		return -ENOMEM;
>   
> - 	nct6694->usb_msg = devm_kzalloc_obj(dev, union nct6694_usb_msg);
> + 	nct6694->usb_msg = kzalloc_obj(*nct6694->usb_msg);
>   	if (!nct6694->usb_msg)
>   		return -ENOMEM;
>   
> - 	nct6694->int_buffer = devm_kzalloc_obj(dev, *nct6694->int_buffer);
> - 	if (!nct6694->int_buffer)
> - 		return -ENOMEM;
> + 	nct6694->int_buffer = kzalloc_obj(*nct6694->int_buffer);
> + 	if (!nct6694->int_buffer) {
> + 		ret = -ENOMEM;
> + 		goto err_usb_msg;
> + 	}
>   
>   	nct6694->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
> - 	if (!nct6694->int_in_urb)
> - 		return -ENOMEM;
> + 	if (!nct6694->int_in_urb) {
> + 		ret = -ENOMEM;
> + 		goto err_int_buffer;
> + 	}
>   
>   	nct6694->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
>   						   &nct6694_irq_domain_ops,
> @@@ -352,6 -357,10 +357,10 @@@ err_ida
>   	irq_domain_remove(nct6694->domain);
>   err_urb:
>   	usb_free_urb(nct6694->int_in_urb);
> + err_int_buffer:
> + 	kfree(nct6694->int_buffer);
> + err_usb_msg:
> + 	kfree(nct6694->usb_msg);
>   	return ret;
>   }
>   
> @@@ -367,6 -376,8 +376,8 @@@ static void nct6694_usb_disconnect(stru
>   	ida_destroy(&nct6694->gpio_ida);
>   	irq_domain_remove(nct6694->domain);
>   	usb_free_urb(nct6694->int_in_urb);
> + 	kfree(nct6694->int_buffer);
> + 	kfree(nct6694->usb_msg);
>   }
>   
>   static const struct usb_device_id nct6694_ids[] = {



-- 
Lee Jones
