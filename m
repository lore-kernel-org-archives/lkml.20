Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0C34A99C8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052055; cv=none; b=fP2NjQMODfvhsAOVg0/Zn4ZudHMjxD8KbV/tm12JM2G4cDtal6ShCD7cYKNFCKukhLXJs8UoqZ9u6Aa9kHx3ZfSKBGUx4/7zM8sHDIrEQljzEzelavkG9YsdDha/eUlSRkArFGLzSSsx8JRX4y6FYoIUblTft2C39Ws7JF1a8FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052055; c=relaxed/simple;
	bh=AW1voraFR+VCTHLGPTYMB1dx82/9seIqzpUGNvihkEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIdANYPBzXj7hy2FW8LGOC5nUEzx3sD8pKisbRtkaSkpVVCNU/2VN8VON5WhSKSHqvXTzjIslm6aJa7NE3KZWt9Pdx2hMlU1q2Rct1Y7+8+nfpK/6Alwhm2IRAMK2e1A/pKYD3KwF7I3hojR+609c5c8FmeyawW9+J645O1QMl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cKqq1R/G; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cKqq1R/G"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76543e1so13077841cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789052053; x=1789656853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9fpkkULHFsgtcssGIc+n8ftfpgEomFj1gRnKkIL/Qg=;
        b=cKqq1R/Gx5gJ+prr0aW8dFH0YVoAoTmlxJslM1lFOJ8mEVKvhuOh6JwriOU5LFmJeg
         joIBv2xx8cYWFOUryWxb3HcJBDZ+vtf2GY9W7CJmg+NvkuyitwCLP4rMPyfCJ7dCbnlN
         nCNOqvBAAm6CutULO0zOJGAfzycjw5roKpjfDFCAwjWOuODOtkO1LjqX3aMYV2gQ/f+n
         vuwit1wosLqK2HlSr6hiWHiUsb1BEWM7Hhx+qrFqKx8Lp7bQuaKZjMnTD6iQG+CWCGf+
         /prnpuxVOwn0tkdF46OipGWp6ODXVugdoNdkXUXhPDbZPCm4BfxMLi8uXOqMeEViaoJH
         iwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052053; x=1789656853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9fpkkULHFsgtcssGIc+n8ftfpgEomFj1gRnKkIL/Qg=;
        b=gA+zdomlwagPXQU3T6ryxqoIjAQrUQBDlehRxaGcDjWfrftNONDWGp9mrH9UM+5Mwc
         LZ+2EoSba7Hct+zGOHVWIbIStqHOhcp5DqE9RtyFDapB6PZYkOj5NihpsYZCXA0s0Erl
         qDmFnnp6/q7L/09pcnCyvyuEIxI+JlXCxlUR4zRyK2FdLO5M0tQeN1icyGqb1NklNxbN
         9lypT6yNVFDAPWcHDFQ1XPXY06yyelVb0RxTiAmJ32PbPAL+bSE6oPgeTsyJ+O43OWae
         78GifRBaPjt01uAE5a489jCQLgGFVB2QNfFnd9I5T7hCABpmh1yH9+XhJ6r9S0jIUsbo
         GzMg==
X-Forwarded-Encrypted: i=1; AKwUvBwiBvNF+6y+BmZLwkqllpbG5x+7PshVcjFqkoOLoQ2CSIyJfh8g0WMlmtHGz1T4hemqBfPGIqkeOgC5TEs=@vger.kernel.org
X-Gm-Message-State: AFuF++mqQd6lS/Z2GRcGanwJqkbOyxB/gRVAoAB1NSC+8TGYeNJ4lx7t
	fCjaG8V2Fn6wBxiq09xoTNi7vN8n1nHhwu8krDQaczFiWKhx1T5qM670Fc3PqWvkqw==
X-Gm-Gg: AYBFou2JGH2AgSV2qx1n9NQI2Ho+aiSm8MPrY0PzjZS5CMmJBYFSd2y8jA2AZFUL65i
	19AG4xLpC4AOQ4lgHjzAQORs0AKAdS4fkA6/HUgBeM4VagjwWGY2AyWguDElEbjFJz3R9GRrSWH
	6VKC6AooOt5ceBQHVcvcc1aIRWoWkHbB5Qfs/xiiVXKBFC9TAZ4Vba3bqwdZ8gA9K8r8mJm3OkV
	jUActqX/OKhdP1pn6VMTuiECohYHaGBwPuLYKWDANTarCHU+UK9QTB7+uq+lHEN5UIr6jaQk7Vs
	sYlsR3Ydw95Jr4ne6zkdt62E2+L/fN3ySdLor/SrsERe9/6yLKrw9/Ly+ghJLWw2Nu9vdYC96w9
	eYhWKGPsmGQ+1gMLyHUh81qVZgx6IfIygsaaA5byHwVM/7hqbMl99IxeoRKTjzVpP1fVofa/pNP
	yr6pyoKvSTedK9nAChgs5rfW+i+CS2HaeS+GwSvzvHehMUbvQsWeVlzakDczI6JdgLlimPsxXN
X-Received: by 2002:ac8:5f47:0:b0:530:b2e3:f774 with SMTP id d75a77b69052e-530b3638587mr59852731cf.29.1789052052689;
        Thu, 10 Sep 2026 07:54:12 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ac575c32sm39327271cf.5.2026.09.10.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:54:12 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:54:09 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Adriano Cordova <adrianox@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sarah Sharp <sarah.a.sharp@linux.intel.com>
Subject: Re: [PATCH] xhci: ring: use get_unaligned_le32() for setup packet
Message-ID: <2c57827f-261f-4b10-b5f5-71bf49ceeeca@rowland.harvard.edu>
References: <20260910123629.345114-1-adrianox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910123629.345114-1-adrianox@gmail.com>

On Thu, Sep 10, 2026 at 09:36:29AM -0300, Adriano Cordova wrote:
> The setup packet maps directly onto the two little-endian data words,
> so read it with get_unaligned_le32() instead of manipulating
> bRequestType/bRequest/wValue/wIndex/wLength by hand. No functional
> change.
> 
> Signed-off-by: Adriano Cordova <adrianox@gmail.com>
> ---

Nobody asked my opinion, but I'll give it anyway.

The original code was fine as it was, regardless of the FIXME comment.  
Using get_unaligned_32() relies on details of the layout of the setup 
packet and is harder for a reader to follow.  I would not do it unless 
it provided a measurable improvement in speed -- which it doesn't.

Alan Stern

>  drivers/usb/host/xhci-ring.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index ec278a9f9540..e428d3794717 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -58,6 +58,7 @@
>  #include <linux/string_choices.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/bitfield.h>
> +#include <linux/unaligned.h>
>  
>  #include "xhci.h"
>  #include "xhci-trace.h"
> @@ -3837,7 +3838,6 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  	start_cycle = ep_ring->cycle_state;
>  
>  	/* Queue setup TRB - see section 6.4.1.2.1 */
> -	/* FIXME better way to translate setup_packet into two u32 fields? */
>  	setup = (struct usb_ctrlrequest *) urb->setup_packet;
>  	field = 0;
>  	field |= TRB_IDT | TRB_TYPE(TRB_SETUP);
> @@ -3855,8 +3855,8 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  	}
>  
>  	queue_trb(xhci, ep_ring, true,
> -		  setup->bRequestType | setup->bRequest << 8 | le16_to_cpu(setup->wValue) << 16,
> -		  le16_to_cpu(setup->wIndex) | le16_to_cpu(setup->wLength) << 16,
> +		  get_unaligned_le32(setup),
> +		  get_unaligned_le32((u8 *)setup + sizeof(u32)),
>  		  TRB_LEN(8) | TRB_INTR_TARGET(0),
>  		  /* Immediate data in pointer */
>  		  field);
> -- 
> 2.51.0
> 
> 
