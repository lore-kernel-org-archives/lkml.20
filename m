Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025197;
	b=3AHlQTAtvLfR/VfxyiHpyGPgqbcdur93Cr9HNKE3eWXTf5YEiMRPnxmV8GzgMATSqEGE
	 6C0UzgqeR1DoBaF0iAVlTiX/2baWRyt9t3QuyzAuD1pvZd3thDkaYd5JKA+n+jKAk5Pnn
	 npsxXde7IhXGG0a1ViEnp3rlw1/FNepwf5eCth80MxD3GiEwyCJl+mao7AQnt1Hw9rWc0
	 CPp3Y5kgXd8hd3c045nlz/xlRztCkNAMgPp0a1AUAO/Cl32hlAn9ET5EVhLtX4TNl//7L
	 20nhAxwIGmgVpdsmMJsLwSO57iP2QL8N9GAtpev4s9RDcm0LjSUIRG84kaz5yQ9WXGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025197;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bHO3v3v7T8iQI9MZzObVlxIsZ4DJL+6slgcy4jccotk=;
	b=lM8/p9rO58WqzV7fyHrckJRx+d9tKB11C7MWq9RmBLIm/hAYHvl0l+BHIzeyZ+V8y8j0
	 fnVMwtphIINRXD/EnFhjT4uLqRdYv02iskRHYiD5oSW3HVFdao6O9fPw8y33ViGVp6VY2
	 9ubgiXDoOEPoZ6B8M8B88WEdLOnpW7LZyuu8iMOxVtaJvIUYueQN1CikHpf4BN/fBWRAJ
	 jqbDehxwMMdxL0LCWLNKD/FK1cxJf4/JsLPfzeWndDDr46TIEwU5ErNnf6olor20XwlK8
	 BBzKo50bAYpy0Flks8UKx4zIHBPQPhjcPQxYG9wPlRvz19NjU22EkNU0v2YuwTIRQdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="s/S/oaUI";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64395606A31A;
	Mon, 26 Oct 2026 14:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=s/S/oaUI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907151F01825;
	Mon, 26 Oct 2026 14:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793025197;
	bh=bHO3v3v7T8iQI9MZzObVlxIsZ4DJL+6slgcy4jccotk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=s/S/oaUIuhTRLfEnqsZ2/DmPwh/scQplfv+/MQaBicN1PBc1BLZRClNIBTmAumKDX
	 hIQWrzO8RfFydsLI6OWbyqx4KOOlpHajj9lCeENdPCcAvkInJA8Sox+Z6ETf5mx4kp
	 MsGx2lp6AZ+ZF2NX88iMuLMoJ/LzQS1Xh45/MUVw=
Date: Mon, 26 Oct 2026 15:33:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: ZeroNinEX <zwq939681378@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: quirks: Skip device qualifier for BEITONG
 BTP-PG01A
Message-ID: <2026102603-diligence-handwoven-ecba@gregkh>
References: <20261026133448.10185-1-zwq939681378@gmail.com>
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
In-Reply-To: <20261026133448.10185-1-zwq939681378@gmail.com>

On Mon, Oct 26, 2026 at 09:34:48PM +0800, ZeroNinEX wrote:
> The BEITONG BTP-PG01A wireless controller dongle initially enumerates as
> 4131:800c. Device qualifier requests fail with -EPIPE, followed by
> failures to read the configuration descriptor. After port recovery,
> the dongle can enumerate as 045e:028e with only two interfaces, leaving
> the vendor configuration software unusable in a Windows guest.
> 
> Add USB_QUIRK_DEVICE_QUALIFIER for 4131:800c to skip device qualifier
> requests. The dongle then enumerates as 20bc:5162 with five interfaces,
> including three HID interfaces, and the vendor software works through
> USB passthrough to a Windows VM.
> 
> Tested both usbcore.quirks=4131:800c:i and the built-in entry on an xHCI
> host. The patched kernel was tested without a dynamic usbcore.quirks
> entry. The configuration-request size quirk alone did not resolve the
> enumeration failure.
> 
> Signed-off-by: ZeroNinEX <zwq939681378@gmail.com>


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
