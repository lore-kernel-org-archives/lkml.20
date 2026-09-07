Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D08449992;
	Mon,  7 Sep 2026 09:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772342; cv=none; b=sxeO2p7agkicq11UjOCtKSIQqgSNvsvykS0WpqwToHotRb7t3qu3emFu9v6ql8LU46yqag79ytP7+3YxYWKewvXQTqOp3FbbTxSO59C5+fUfLNZKNB8kMG63Xs7rdx4SgSPNJanBUr1LFvLpPRtaVW4XXoFvwjxromMhoNcmfHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772342; c=relaxed/simple;
	bh=S6FzEVfrlnSxpKJKpivSvkMiU7eztyobk10Z7fTCjL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khnA2/+QH9pgVvjAznLOM2f48qZaQNVQHbdbLz3mdfdS8/8QnxM98fkv1ASjzYiWyo1Kl1ET5TtTNdSogHk3N16aELeHmkush6KM9+k2PyGLqNFBYeKbghef5UoQFA/zelxcigbRKU2us1UrV0r+Hef847n1sz0vQxN1YwBTDHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0yX3DzJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0yX3DzJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15911F00A3E;
	Mon,  7 Sep 2026 09:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788772341;
	bh=P4r2NTYwFlUOQAeXw7wTPJh0e7BchedYqxJ3l093NQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R0yX3DzJCUd37hoMECuaNy+CE2l0nD1hQxASq561JtJHXT21pwmsK01hweDUiSOHE
	 90aZVkcTQZGfaF3U48KP9Sw9bxRyZ2ziM1ji3Q/Poh9TyH+gZVr5Zp8AxalkF5X30F
	 q6x/a15INQKg/PkJpba702DsgBtv+RvbtmSXLIYA3D2CQLhiL3NqQQeTYPs0cR/NqM
	 gXJSt8FDtk9okSmILFcmrdJJSsjJfwoBn/ATMDvg7owU2P8JquJsUmnz/mffeUXFCb
	 zJAsp2N3vn5mOxL45nCmhtGGpDm/tCEBlqv+rxOEAsPmMJ6HBnV9i7hwhx2TGImmjN
	 SeaMBHUYRmJ0w==
Date: Mon, 7 Sep 2026 02:12:19 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: fix typo "binded" in comments
Message-ID: <ap5_8910bncFfH3M@hu-petche-lv.qualcomm.com>
References: <20260907061652.38637-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907061652.38637-1-hemanth.selam@gmail.com>

On 26-09-07 11:46:52, Hemanth Selam wrote:
> Correct "binded" to "bound", reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/otg_fsm.c | 2 +-
>  drivers/usb/chipidea/udc.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/otg_fsm.c b/drivers/usb/chipidea/otg_fsm.c
> index 929536dc96ec..642729893cc2 100644
> --- a/drivers/usb/chipidea/otg_fsm.c
> +++ b/drivers/usb/chipidea/otg_fsm.c
> @@ -705,7 +705,7 @@ static void ci_otg_fsm_event(struct ci_hdrc *ci)
>  		if ((intr_sts & USBi_PCI) && !port_conn) {
>  			fsm->b_conn = 0;
>  
> -			/* if gadget driver is binded */
> +			/* if gadget driver is bound */
>  			if (ci->driver) {
>  				/* A device to be peripheral mode */
>  				ci->gadget.is_a_peripheral = 1;
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index d52f89489893..c29b2d0dcc7c 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1862,7 +1862,7 @@ static int ci_udc_get_frame(struct usb_gadget *_gadget)
>  }
>  
>  /*
> - * ci_hdrc_gadget_connect: caller makes sure gadget driver is binded
> + * ci_hdrc_gadget_connect: caller makes sure gadget driver is bound
>   */
>  static void ci_hdrc_gadget_connect(struct usb_gadget *_gadget, int is_active)
>  {
> -- 
> 2.48.1
> 

-- 

Thanks,
Peter Chen
