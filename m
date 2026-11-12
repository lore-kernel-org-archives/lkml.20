Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508566;
	b=tI8aSi5yRtAF51UbNG1ovugy9AIe3K4UpMB8mbmLMdoUlF7AmTUZiSKpdQjgNHGhdSeY
	 kJ4u2VXzdMSgZm6rEUnju82H09CLDMw1AFnXlDUPZml6f2ras5MiMG+CLR+9Pr2l+pxw3
	 YphU2Ka8UgAfsV5QLnMP5TG8XYmBF/3J5RH1oKM7y7MCz6xlT+0QPdq+pAxT+b/5Xo2H2
	 flAKxCu/R8LzYtjTaNPnhpOmb1Hs+JUyua35KESCQbVr7HmFMUzvt4aKoReQFEBr0FlvX
	 9O35VRwW9tfpwp0rBNaOKVy+ZqTGMl1PxvHMHKyXVXCqF9MdUt4c9EWVAgnpB+J7f/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508566;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=k8SGY+qKI3G29ysW/VHEDqN1N8LX9SXadF3SAZMJ6sY=;
	b=euMyByX6LLzGYXkQXUBkDsN0/C35C7uEnsQObZI02zcTOBpFw1UQTb1xK57THbbBTucM
	 zNv0P6PWhcFtFoEWNCC7Bjzh014Npj8AkuTeI6nH54ueumNk/Cv7zzKMBEEizvDpIxduq
	 z/99JZo/nugxwMCXMTns/fVhfgVrqTd9NE8LshQuBYJ3rfl4gyMFDn+JsUuqbk/fgjzKk
	 YIQgtmknx6JU89dfH/eBulONfkJl4+yVMBwpZ732bOHDqCdMTqJpdGVQpIj2+0UaPJelg
	 Gp4WJrfAQQftiZ3+m/Jtys1nEfUBM2bTN2w3F3nHN1p02W2n2tIDNogrSEF1IDowl5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cPuUUHqd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A75606A31C;
	Thu, 12 Nov 2026 18:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cPuUUHqd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167DE1F000C4;
	Thu, 12 Nov 2026 18:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794508566;
	bh=k8SGY+qKI3G29ysW/VHEDqN1N8LX9SXadF3SAZMJ6sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cPuUUHqdFraID1EGOAmG4k+hbo4Ibs1Cun9n1C+8EQt/Vke4t/FrDFp5WzDnxoF0+
	 PV6CZNK8Iw37pEgyogsL40f6pJOhSZs8wCf3Gk+Ls2dFQHrf+uxPP8DKlSNGNASzcg
	 81pOKAifUBoKub1HUFq847hIy0vFze5HkL/DQ9LpGBND0h6QVxLB+U3tlEphhJuf9a
	 jY1SgmlOblJodQHnhBGEmU6ScQ7a3O6UQFf8mrdvURvzpGbtLOEEY8KTnxXGTlmmJF
	 05MU9RnncRmqMM3VciqoLLpFF+6piJX0RN38/kzp4nEMEEltR+HwaT1B2gbzlMWE17
	 HN2sKlnI5QBFA==
Date: Thu, 12 Nov 2026 10:36:05 -0800
From: Kees Cook <kees@kernel.org>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: arend.vanspriel@broadcom.com, linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org, morbo@google.com,
	justinstitt@google.com, codemender-patching+linux@google.com
Subject: Re: [PATCH] wifi: brcmfmac: Replace strlcat() with snprintf() in
 brcmf_fw_alloc_request()
Message-ID: <202611121030.966E3595EE@keescook>
References: <20261014005553.71803-1-nikitash.mariiaw@gmail.com>
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
In-Reply-To: <20261014005553.71803-1-nikitash.mariiaw@gmail.com>

On Tue, Oct 13, 2026 at 05:55:52PM -0700, Mariia Nikitash wrote:
> From: Bill Wendling <morbo@google.com>
> 
> brcmf_fw_alloc_request() constructs firmware file paths by chaining
> strscpy() and multiple strlcat() calls for the module parameter path,
> separator, base name, and extension.
> 
> In preparation for removing the deprecated strlcat() API[1], format the
> complete firmware path in a single snprintf() call.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM
> Signed-off-by: Bill Wendling <morbo@google.com>
> Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> ---
> 
> This patch was originally part of Bill Wendling's strlcat() removal
> series [2], and I am shepherding it individually to the subsystem
> maintainers.
> 
> No code changes from the original posting [3].
> 
> [2] https://lore.kernel.org/all/20260915081910.4142719-1-morbo@google.com/
> [3] https://lore.kernel.org/all/20260915081910.4142719-12-morbo@google.com/
> 
>  .../broadcom/brcm80211/brcmfmac/firmware.c    | 21 +++++++------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
> index 22ff326f1924..2f74a952599e 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
> @@ -845,22 +845,17 @@ brcmf_fw_alloc_request(u32 chip, u32 chiprev,
>  	fwreq->n_items = n_fwnames;
>  
>  	for (j = 0; j < n_fwnames; j++) {
> -		fwreq->items[j].path = fwnames[j].path;

yes, this is redundant to the final assignment.

> -		fwnames[j].path[0] = '\0';

this pre-truncation isn't needed either.

(Maybe this code used to have a fast-exit path that left stuff
unwritten?)

>  		/* check if firmware path is provided by module parameter */
>  		if (brcmf_mp_global.firmware_path[0] != '\0') {

This check is confusing, I would expect mp_path to be tested instead.

> -			strscpy(fwnames[j].path, mp_path,
> -				BRCMF_FW_NAME_LEN);
> -
> -			if (end != '/') {
> -				strlcat(fwnames[j].path, "/",
> -					BRCMF_FW_NAME_LEN);
> -			}
> +			snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s%s%s",
> +				 mp_path, (end == '/') ? "" : "/",
> +				 mapping_table[i].fw_base,
> +				 fwnames[j].extension);
> +		} else {
> +			snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s",
> +				 mapping_table[i].fw_base,
> +				 fwnames[j].extension);
>  		}

I don't see any reason not to fully collapse this, as the test is just
examining mp_path and doing end checking:

		snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s%s%s",
			 mp_path ?: "",
			 mp_path && end != '/' ? "/" : "",
			 mapping_table[i].fw_base,
			 fwnames[j].extension);


> -		strlcat(fwnames[j].path, mapping_table[i].fw_base,
> -			BRCMF_FW_NAME_LEN);
> -		strlcat(fwnames[j].path, fwnames[j].extension,
> -			BRCMF_FW_NAME_LEN);
>  		fwreq->items[j].path = fwnames[j].path;
>  	}
>  
> -- 
> 2.43.0
> 

-Kees

-- 
Kees Cook
