Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634599;
	b=XscRFdJwmoyU84nLQFHcCLgppnjOim7j1qUzw6tKU4+DKp+AJFD3ytfNFgVaKOGI980K
	 kFVg1Vn8ROyW7fwPVAGuJy/5rxrUQnWRzEZxaPg9J22R64ZXJwKNoKK0UCU+/L87A/xWY
	 64/02MxL8WD2U+bUvU6cabNGK7udz7Wh18nctpl30u6gVk1/+JVoY1Uaeft1JkhFehcTz
	 lveC7vWfOjyiihJ6aDk/1kX9LNlZ7sCKzFePB5SVwFoPPTS+EO0ib7gCvE/oW8xmmm8iW
	 FfZSO2qT3dUZgNqyluaZNAkgyLPLNYLDvqz582WkSwxOpzoJbjtuLI/oeDeSrqw4zCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634599;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=GLvfRARAQyBH7Kfm/CaOgMcjzPQSYIC64TNGbeOaKII=;
	b=KMvELYKV1ay89aTHWqcqM3dQCoElsOs+tea5HDQy+8MENz/7DE84ZxoYuRUYtZYqaiTJ
	 L4BJn59V2c4wI9BrYgXA5zoIcD3hP93ZF8ROMaF6oadtq8kuYU0/5KgFzZipX2ysB3XQn
	 2bN9CteiwAe3tqGQw4rQjQlSy9RgR6GD70ZNzpIpPFmZhm7taMTpHBOrAmV98KeFLrc0q
	 t0yqRAKuXxhOlrAvggK2OHqnJq9lfi5ILr/vsdq6To1rmDmWvnomGAeNTwEZVRQRvTN+N
	 84l3DVtO686onN8rOC7WeM1C5kpZ0g8kD7nDPEoJz9ayCXaK0BW91PAVSePtjGMFb5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=gsLnwAIP;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC47A606E00B;
	Mon,  2 Nov 2026 15:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC47A606E00B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=gsLnwAIP
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D915840917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793634598; bh=GLvfRARAQyBH7Kfm/CaOgMcjzPQSYIC64TNGbeOaKII=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gsLnwAIPYx6TPVchIg7NTU4ezpMG5X9+xbfsKY+quZh36ja/szrkg8EWWPp54aIib
	 XCUgvXU+ubAOp1ZEeL0C63RpMH/jdDLgqyM/bh7+X3fYD9k+lXgwtLuc8EEZ2mBt7g
	 pXPdvcngpDCzhIEC5cxgQJnhr9HJa5KuJdzn4NyTToH4E7ShBbEg6DQ3V6lLp6O+BZ
	 oFxhwryNgoeCSgA5+UycL2Lz/OngYgXWuMvovK6hoXT7KxS0ZKxC5G/e1F8Ae9cRqX
	 PJbHCam1dKkg0HvztentBKe+DYIT/FzlyLSH6jhnS3eXCZYf0H9Z8HbDJnvZIUt86h
	 EjHRwwxZezVYw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D915840917;
	Mon,  2 Nov 2026 15:49:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, Maurizio Lombardi
 <mlombard@redhat.com>, Daniel Wagner <dwagner@suse.de>, Keith Busch
 <kbusch@kernel.org>
Subject: Re: [PATCH] docs: kernel-parameters: alphabetize NVME entry
In-Reply-To: <20261001213229.2399120-1-rdunlap@infradead.org>
References: <20261001213229.2399120-1-rdunlap@infradead.org>
Date: Mon, 02 Nov 2026 08:49:57 -0700
Message-ID: <87se1jdyhm.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> The list of kernel build options (or the legends or keys for them)
> should be kept in alphabetical order. Put the NVME entry in its place.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: Maurizio Lombardi <mlombard@redhat.com>
> Cc: Daniel Wagner <dwagner@suse.de>
> Cc: Keith Busch <kbusch@kernel.org>
>
>  Documentation/admin-guide/kernel-parameters.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20260930.orig/Documentation/admin-guide/kernel-parameters.txt
> +++ linux-next-20260930/Documentation/admin-guide/kernel-parameters.txt
> @@ -44,6 +44,7 @@
>  	NET	Appropriate network support is enabled.
>  	NFS	Appropriate NFS support is enabled.
>  	NUMA	NUMA support is enabled.
> +	NVME	NVMe support is enabled
>  	OF	Devicetree is enabled.
>  	PARISC	The PA-RISC architecture is enabled.
>  	PCI	PCI bus support is enabled.
> @@ -74,7 +75,6 @@
>  	TPM	TPM drivers are enabled.
>  	UMS	USB Mass Storage support is enabled.
>  	USB	USB support is enabled.
> -	NVME	NVMe support is enabled
>  	USBHID	USB Human Interface Device support is enabled.
>  	V4L	Video For Linux support is enabled.

Applied (finally), thanks.

jon
