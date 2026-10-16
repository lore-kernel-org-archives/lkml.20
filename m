Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A69C44723D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181854; cv=none; b=Pak/v+EHE7MD33sJiMPKll3StarcxrSDxp8IyV219rQYrPI6rpHuIEV2ge++0FETv+tPoer4//tY7Zc3syOKR/WBB87amcYkKzI+o1YH0VGkHLkZC1y+bnfp8BfrBDOA+cqq56y9AbWbz4SL+4mQwZ/tOe8ivANuTW9Cdzk4WGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181854; c=relaxed/simple;
	bh=/OHS7CbxIjBbPttwPMwIagfUH3hXetk1CB+uZa9XJMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuHbFSZT7y2RP+DVn95S2bd5fdOJvwq+0wkygPQrSdwGbAE6jAvZthhALADwikFzoW2zlBrqLFiapA9c41GoHxRMzO4OUBxb4WPDon52MXYYbt7XLE4Kv5N6lR0elZmk815QPh6H6/DbPL7dIIQb5RdsKxirK1feRmZkW8GGmmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cl7J11iJ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cl7J11iJ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8899a204034so177083b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792181844; x=1792786644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OsnszACXPTVDnPZfOqDQkfMfDgaLqJRUD8jA3813/H4=;
        b=cl7J11iJ3QKHzMi8S2V7wlsOS7RsGPKGYX3HE539xHUyZDKHMopuMs88Dmo71KQSTx
         nNKEjyYXzaYHEvu2hLdl/ax/BYOP7LpvbWUobSdnwmyzlUsxHE87ZXjTDSidB1wedbQu
         4UWbRd+011CD/Y21SDUjnW6I+ZS8BJAOr02vHqzy97mfyb/WaI1N3gYogwnFAN2gh+ZE
         TeacLRe8UeR/uQTH5llbrZ3akRd+rvTRQajlG6Xnok7iYZJQp2lYS8nPf/5eCoPIGmv7
         ePOn90ITA/i1USnnBSyCczdsEboTgYQZxDJs2zHSLCtvHBkD4XhdbaQeIbdmMBp/1TUS
         JcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792181844; x=1792786644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OsnszACXPTVDnPZfOqDQkfMfDgaLqJRUD8jA3813/H4=;
        b=jKjvrCltmRTEuIuyXlkCzJXbzC3R8YPDp2fWpkXrQGpuH5jlXpY5pf+hOmgdHzlkuu
         gZwo2mQuFTnCsjAAS6XUV/KZfxzSROXRjbrPzd3kt2M0oGPIXEJIB9PEC7Om/o2e3jGi
         ZaESGHV1nGSuWhExtkhJ6ajnD2doX99YxQna8S34EUHWzb+XirHDyfsQ8zajhvkbUZKp
         d8qMrdUXfwULFT0o8U0uIEgMZ7i4cwrwihrhQv/nllarSclY/Wy1qqptVFcPg8Oets3N
         treejnwaGcq/dSv4NHFvNX1tKdvreEWysFevY/4KxS1ZS0NVvEadbObQrZKUvu1KvcJI
         iOpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdfrPfjbHlbmCHq9sSyl2l816gbv0yGCSaH5dEo2GQRxXLGXurNGSPP0rTkLDkKXnO8BXGPBFLXraMiH4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhd8nKQ/DQJr4iw7bQsZUdsi8CwTVmORj5r46okPBLFSqKhGxr
	mUxGucrGRdZRmbXCoh06g9MbUzBHbSRVt+/H506zTSx6iKWRUzQpraeZJRV6kMVseQ==
X-Gm-Gg: AYBFou3jQBWDuPEAjqeH1w1+G2wFirAHdCA9o3k0x5Q4lq/3hiKB32fkARbpjH2NRWm
	LbDPStjr9N+/KlKnFuU80TaLhaZ/ZwQoZvDkgMSg5V6AhO3uSIoTsN32BYJ51zuEIdf6ce0zUyy
	qYinVn9+cgbjdelDCxzmPl9lTCGD9YQhSQT/KSk1P8ICZl9puCdlw8IavhaxYM+sIfj6dNGcYaG
	2IUFrKZfCKMDBpkOZedSGFVWUhLdoSGbFsRNWXUFhyOkQ3QZDGLaNXykaVmt6QR7htVPWXVq4/d
	CrCS96/KghC/H4PKHMEuakKHGEFOhxiYzbIMJlEdXeoc8gjXRqld7JCjiBWgERSWIRFEpIsGMaR
	JDA7wCQ2aMkToEBdmKhb0jkkd8x7o/CffJNB904pSHVcWWogFvcz+Wm9XOzcm1TVLaidXb1yKD/
	vVPoVq4jtJMbk7YkRtNBBcN/Xr58TNZ3OrW2wEypRUazqoip6k7IutSPkzz8BBI7QpyFfqLj3dG
	EPQKR7R89ExUR5jaYSEiM9ijF6nNFz5z04+JTAI8FVRrcFwAYOs+OjpFAQdbaraiqP0Zdsb25VN
	4csZIAod93K2wcjl
X-Received: by 2002:a05:6a00:189a:b0:882:94ab:20ea with SMTP id d2e1a72fcca58-8a04be37e89mr491979b3a.39.1792181843202;
        Fri, 16 Oct 2026 13:17:23 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58017c70sm1663372b3a.48.2026.10.16.13.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:17:22 -0700 (PDT)
Date: Fri, 16 Oct 2026 20:17:18 +0000
From: David Matlack <dmatlack@google.com>
To: Michal Clapinski <mclapinski@google.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>, linux-kernel@vger.kernel.org,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: Re: [PATCH RESEND] PCI/DOE: Poll briefly for a response before
 sleeping
Message-ID: <atKGTn7PqaDaednD@google.com>
References: <20261012114213.1757207-1-mclapinski@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012114213.1757207-1-mclapinski@google.com>

On 2026-10-12 01:42 PM, Michal Clapinski wrote:
> doe_statemachine_work() waits for a response by sleeping
> PCI_DOE_POLL_INTERVAL (PCI_DOE_TIMEOUT / 128) between status reads,
> which is 7 ms at HZ=1000 and 4 ms at HZ=250. Exchanges are served from
> the device's local mailbox logic and typically complete within tens of
> microseconds, so nearly all of that sleep is wasted. Every DOE-capable
> endpoint pays it once per supported feature during enumeration.
> 
> Poll with usleep_range(20, 50) for the first ~2 ms before falling back
> to the jiffies-based wait. On an Intel Emerald Rapids system, time spent
> in pci_device_add() for a DOE-capable endpoint drops from 41.8 ms to
> 14.0 ms.

Does any of this remaining time come from pci_doe_abort()? I see that is
also called during mailbox creation and has the same call to
pci_doe_wait(). If so, maybe the poll logic can be shared.

> 
> Signed-off-by: Michal Clapinski <mclapinski@google.com>
> ---
> I was asked if I can do this with interrupts instead. I don't see a way
> to do that during device enumeration that won't collide with the
> drivers.
> ---
>  drivers/pci/doe.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/doe.c b/drivers/pci/doe.c
> index 6b5d9ba8e969..5e93d78a1a97 100644
> --- a/drivers/pci/doe.c
> +++ b/drivers/pci/doe.c
> @@ -27,6 +27,9 @@
>  /* Timeout of 1 second from 6.30.2 Operation, PCI Spec r6.0 */
>  #define PCI_DOE_TIMEOUT HZ
>  #define PCI_DOE_POLL_INTERVAL	(PCI_DOE_TIMEOUT / 128)

It would be nice to also fix the HZ=100 issue, in a separate patch
within the same series, since you are updating this code.

> +#define PCI_DOE_POLL_FAST_MIN_US	20
> +#define PCI_DOE_POLL_FAST_MAX_US	50
> +#define PCI_DOE_POLL_FAST_TRIES		40
>  
>  #define PCI_DOE_FLAG_CANCEL	0
>  #define PCI_DOE_FLAG_DEAD	1
> @@ -487,7 +490,7 @@ static void doe_statemachine_work(struct work_struct *work)
>  	int offset = doe_mb->cap_offset;
>  	unsigned long timeout_jiffies;
>  	u32 val;
> -	int rc;
> +	int rc, tries = 0;
>  
>  	if (test_bit(PCI_DOE_FLAG_DEAD, &doe_mb->flags)) {
>  		signal_task_complete(task, -EIO);
> @@ -525,10 +528,25 @@ static void doe_statemachine_work(struct work_struct *work)
>  			signal_task_abort(task, -EIO);
>  			return;
>  		}
> -		rc = pci_doe_wait(doe_mb, PCI_DOE_POLL_INTERVAL);
> -		if (rc) {
> -			signal_task_abort(task, rc);
> -			return;
> +		/*
> +		 * Exchanges are served from the device's local mailbox
> +		 * logic and usually complete in tens of microseconds, far
> +		 * below the jiffies granularity of PCI_DOE_POLL_INTERVAL.
> +		 * Poll for up to ~2 ms before falling back to it.
> +		 */

If tens of microsecond is the norm then is polling for up to 2ms
overkill?

> +		if (tries++ < PCI_DOE_POLL_FAST_TRIES) {
> +			if (test_bit(PCI_DOE_FLAG_CANCEL, &doe_mb->flags)) {
> +				signal_task_abort(task, -EIO);
> +				return;
> +			}
> +			usleep_range(PCI_DOE_POLL_FAST_MIN_US,
> +				     PCI_DOE_POLL_FAST_MAX_US);
> +		} else {
> +			rc = pci_doe_wait(doe_mb, PCI_DOE_POLL_INTERVAL);
> +			if (rc) {
> +				signal_task_abort(task, rc);
> +				return;
> +			}
>  		}
>  		goto retry_resp;
>  	}
> -- 
> 2.56.0.385.gd3acb90ef8-goog
> 
