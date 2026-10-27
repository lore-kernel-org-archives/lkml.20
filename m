Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.155.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793129226;
	b=5J3h7vPnweQDP3w7mU8XRhoWuNmiCLLzwnTTWtYj0LdpMie7lZvNVg+D2S2d0tJW2X3/
	 GvRIWLN7BSdS0fb3l95A6Eo6R8W3sgU7jB2patjXk6m2/nhI6FS1v4YbE1+tjcKCJwZfE
	 0fkthYLkz7ku9ogUFcRQJg6LAnlwOgJatDG2uNKMNxH6iVKQ+600MPgsFAcQ8HCTioxiM
	 P7QuN3jnt6pTG9wnXgwy8YgO+KuFmv7Gu4WdFO+v3mL14IvN1Kan7TiAB/GQ5ta5a74JD
	 448XcxfoT2sR2qcbwrXoarcXvVLGg3HW5S+gLqvFdXaKSiohmBs2kAPAYHddRwRERkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129226;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=3OeRqug9an4f9JeH+7A+ciKWBCrOmqQOxohMWMpsR54=;
	b=U5xoiVjXhG4cvWdTHJfTlzDcmKIxu2c2OhkWPmAKKVdMHJ0MUrTONfbioaiDixlEQIHE
	 73KyyFsWOpvGmsjPNsaUE6vBHrtRsn+AIUfLqwaES2AaVpin1aJc9o1hLvdvyC/AX/+Rc
	 dMkralhkCkkVmhTaw9tYlQ5IX0xUaUUV+okOMzapab3YsoOJWxMNDPBG3FRYn4XPtNXpV
	 /Cbdp3RBZEwJU2IRI/IvEgvkMF4NEg1AK6oJhLiXGRE+S1ZCeVa/tHukTxhXP09Uyrkta
	 0MHqNCy0tbCopCQHS0A/wNZViZcSwq+b0ofytXJz2ovEVqLwk6CavLWVYKKMKuh/4KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b="l/WieYsh";
	arc=none smtp.remote-ip=62.149.155.149
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F17E606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F17E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=l/WieYsh
Received: from fedora ([94.34.125.0])
	by Aruba SMTP with ESMTPSA
	id Lmp4xaNNib24ZLmp4xQRCY; Tue, 27 Oct 2026 20:27:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1793129223; bh=ydd4JzHCHSW/D/rNq55GJ+0dNek5/zgfZP8r+ktQeAA=;
	h=Date:From:To:Subject:MIME-Version:Content-Type;
	b=l/WieYshVQrGL+tueTQL/5Cg4xBoeu+WavhbhwySXTQfGZezCqAJp9VbEI6damWh1
	 z+KjKqKZD4Ryo9SAFD1mjaeC2iYJgrIjM0S3Dhv8hOa7pMHoLoYPQTnrUZOtx5x0x6
	 ki7aKCHhsesQ6kTBr6QyHwmWPls31b/cEmzezxqmG9Yqf+kqBEeGN2InWngXt0B02N
	 NFR5Ogb0ZeeVoj6bTQXCW2MdXjYPzghyu9McWa9/so36oxf+gsCpavd2odMD/EDzYo
	 ils1J09FDEimCkhsJQGB7cRcdSwnZYTQhTbAx+T4B7W3ag/fkW2jPKvyxjP4cwnmVY
	 CuAL1RvXUO3bQ==
Date: Tue, 27 Oct 2026 20:27:02 +0100
From: Alessio Ferri <alessio.ferri@mythread.it>
To: Andreas Wendleder <gonsolo@gmail.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg
 <johannes@sipsolutions.net>, b43-dev@lists.infradead.org, Michael Buesch
 <m@bues.ch>, kvalo@kernel.org, julian.calaby@gmail.com,
 jpeisach@ubuntu.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next 1/2] wifi: b43: reprogram the MAC filter
 after an interface restart
Message-ID: <20261027202702.1c6902d8@fedora>
In-Reply-To: <20261014143225.82149-2-gonsolo@gmail.com>
References: <20261014143225.82149-1-gonsolo@gmail.com>
	<20261014143225.82149-2-gonsolo@gmail.com>
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
X-CMAE-Envelope: MS4xfBRL4N5AHK0FLusPkHBO9Nt1tEejrk7JIJ6QhI+1QP7K/1U14BgCaPrdTIkBbNLTqptQ0j05oYkFEKhifbuvdv3huPNZ8bJjzqqGUxaQSxna4CsNoP0A
 kYCJpujPBTORLdKPxU9McjsztjhJTY4/ruL/p4VY1SJtZ37YTFyAJMf/QDmPkoJUoTQKagXPJX62lnKZoNNL6eY9RMYsr8T7+c+8Jb/dDobisDtyS+76Y/Nk
 r1116KIo90Qa7Qg3ntaicT87S4FboyX7OdOMmT9UUFyGtJ9qDevGar+lc7UqlKNtw9Y8hCF02rfDapIlnEsBGzhYL7ZAMwYF/gjUHXQlokJ26k8Ni4F7qXfe
 PNVFPZW8JteqN1ds2tPln6tZHvfuiH8gh79VcV9VZCi2kl7Vg1JZ5bphzclUKHxbm9Tu5eLDInBnFxU1r2vsOsSjNHuc4/rlevLOm3qvc8DBwexg5wQ=

Il giorno Wed, 14 Oct 2026 16:32:24 +0200
Andreas Wendleder <gonsolo@gmail.com> ha scritto:

> b43_op_start() clears wl->filter_flags, but mac80211 computes @changed
> for b43_op_configure_filter() against the flags it cached from the
> previous run. After a down/up it can report no change, so
> b43_adjust_opmode() is not called and MACCTL keeps the cleared filter.
> 
> Compare the requested flags with what the hardware was programmed with
> and add the difference to @changed.
> 
> Signed-off-by: Andreas Wendleder <gonsolo@gmail.com>
> ---
>  drivers/net/wireless/broadcom/b43/main.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/net/wireless/broadcom/b43/main.c
> b/drivers/net/wireless/broadcom/b43/main.c index 8f4aff3..57a5935
> 100644 --- a/drivers/net/wireless/broadcom/b43/main.c
> +++ b/drivers/net/wireless/broadcom/b43/main.c
> @@ -4318,6 +4318,14 @@ static void b43_op_configure_filter(struct
> ieee80211_hw *hw, FIF_OTHER_BSS |
>  		   FIF_BCN_PRBRESP_PROMISC;
>  
> +	/*
> +	 * b43_op_start() zeroes wl->filter_flags, but mac80211
> computes
> +	 * @changed against its own cached flags, so after an
> interface
> +	 * restart it reports no change and MACCTL kept the zeroed
> filter.
> +	 * Compare against what the hardware was actually programmed
> with.
> +	 */
> +	if (wl->filter_flags != *fflags)
> +		changed |= wl->filter_flags ^ *fflags;
>  	wl->filter_flags = *fflags;
>  
>  	if (changed && b43_status(dev) >= B43_STAT_INITIALIZED)

Tested on my DSL 3580L with a 4352 5Ghz, the chip transmit ok.

Tested-by: Alessio Ferri <alessio.ferri@mythread.it>
