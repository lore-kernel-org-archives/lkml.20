Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987811;
	b=R59hLTaOMIhL6bqAZ/iX0O4cRzVfpUueBSU/88JQmQ7FdoSsDX7VP7OFuyQZa7x6rfHk
	 52goG21pFbMJ3J96K1tiF4uCSK0hieM8RhKjQCOESZ3iF/tE8ZmfjRXn156fEY4lrTOPH
	 xrJXQDsmA0ylCWr5griFVsQ7v/VHorC9lRDObh9is+NOTCtIDUzsXq7gGjvkgEvk5P/qV
	 QFsdk/M/SxFOaCgjWkUFxRr0xf3ohQb1ExJz00WC7IshjKj/5nCBIN/jJnhZXNUMrv5Wi
	 vrNsPUCO82w5BtokiUK9nWRRqIcsmGe7Off0yKU+Ft1X0hxoAwWq2vYOHgG2Pf+ZubQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987811;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Aa5BkjJg/hfntAtJ2BAuJ5Nk1njK3b37uE1U4DFSydk=;
	b=3YXw3k6djafhYsl6qP/vEgiI0C31HYXagtRzSjb3PzhMg2O0la7xqXz24B1lZKrFYUd7
	 eFABXK11kFw3aFg9G4hrgfWwwUjVkY6mEoutTlSwvimf3La9BYLomMHtUh4ASujYIV/e4
	 XfENR49sbI9hvchsoq/3pdEqnR2xYUVrLxyYX74UvItAUVJvKRaWLNJigLSqajlp4eGok
	 qgCUOUgHch/8+86fWjg+Hz09nSr78kL/ashw/irIDMIA1/uiBy5npUWzLYPMBr38nHMnY
	 nk0h6IQOFXAAl2tEsxvNhOmgeOZPy9RMIdfQzxYsOboLSzDvqM1GiP5BkSxzlIfxndQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b="dB/UYR0L";
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79655606A326;
	Fri,  6 Nov 2026 17:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79655606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=dB/UYR0L
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 11A5540E0497;
	Fri,  6 Nov 2026 17:56:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FWg9ZAnfQoqd; Fri,  6 Nov 2026 17:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793987802; bh=Aa5BkjJg/hfntAtJ2BAuJ5Nk1njK3b37uE1U4DFSydk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dB/UYR0LJi5ni8QJ6L4PBsDOk0F6fuFc0uy34ke67R7l76QnQCKQGBdQFoj2dFglr
	 hSPNGVXzc7hLD7SXjaltkO/FrQMi++evGFU8DfE0Stb180Iz5wGuyYX/t4MBadZNvW
	 H/BWYqVNZV6u2b9MYfxhvi4M2o6bQ3gjioe4GxQSrtPGbicrv+21rRfVtRH/5RFf96
	 z+0l/GT5v57sNUgMJSKmemSce1FacVWs5UaBHCNlGEmqifYGXAZHsoXqIYkd80zEah
	 uUGVyqv4CB5pJC0z3XUSij1seQl0XZwjh99zYaYru1orlya0zUiFE2HJiJ0KptKz4H
	 ysh0vZdwau2lh2neLokpgj9Ygm+ofS9QJcjU9TgdolHAuFXT8NeKbWM+W//cW8q8+8
	 RFYmlDJ9IHJHKkg6mu7YTkzrWoVGSO12ffpwi2jufYa9m9jBEVaJSDhraYny645thn
	 UNiXWUeWGO6hcUvDpW7wW3Cfde06F/fTZ/xfGtHruuh5c2VeNC/3btFQRYgpn1smd7
	 SbSjmOw30EKWJC78E+askEDcJDluISyAqAQjOEXfd32K/tPNPmatH0ruczXbMy35Bv
	 Bmt70CFjk6k39xStm502cM5EqPdPYVBCWy3+UdjVZy4fMy27zHbYmcKiMvebtQNU0b
	 OXU9nyEXD8Y8Laz9nmATc9v8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 44C6140E02C2;
	Fri,  6 Nov 2026 17:56:39 +0000 (UTC)
Date: Fri, 6 Nov 2026 09:56:35 -0800
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/7] RAS/AMD/ATL: Add unified UMC address translation
 interface
Message-ID: <20261106175635.GAau4U08ECoVyMTEy1@fat_crate.local>
References: <20260922202318.4079080-1-yazen.ghannam@amd.com>
 <20260922202318.4079080-4-yazen.ghannam@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922202318.4079080-4-yazen.ghannam@amd.com>

On Tue, Sep 22, 2026 at 03:23:13PM -0500, Yazen Ghannam wrote:
> The library exposes a single function for UMC address translation. Adding a
> new translation would mean adding and plumbing another export. Callers also
> have no way to request more than one representation of an address in a
> single call.
> 
> Add a single entry point, amd_translate_umc_mca_addr(), that operates
> entirely through struct atl_err. Expand the struct with a pair of
> operation bitmaps and the per-operation output fields.
> 
> The caller provides the error inputs and requests one or more operations.
> Each operation is attempted independently. The library sets a validation
> bit and fills the matching output for each operation that succeeds. The
> caller must check the validation bit before consuming an output value.
> 
> Group the error identifiers (normalized address, socket, and UMC bank ID)
> into struct atl_umc_addr. Lay it out to match the PRM parameter buffer
> inputs that every handler shares, and embed it in the buffer. A caller can
> then build the buffer straight from its own struct atl_err. Move the buffer
> definition to internal.h so callers outside prm.c can do so.
> 
> Route the interface through the always-built RAS core so the library
> remains optional. The core provides the entry point and a
> register/unregister pair. The library registers its implementation on load.
> The entry point does nothing (no validation bits set) when the library is
> absent.
> 
> Start with a single operation, ATL_OP_SPA, that produces the System
> Physical Address. Try the PRM handler first. Fall back to the native Data
> Fabric translation if PRM is unavailable and the Data Fabric revision
> supports it.
> 
> Leave the existing amd_convert_umc_mca_addr_to_sys_addr() interface in
> place for now.

Please remove text explaining the code.

> Assisted-by: LLM

Those tags are not needed anymore. Yeah, that was quick:

  1e035297ffda ("docs: remove Assisted-by references")

...

> diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
> index befc616d5e8a..91c02ef5dc11 100644
> --- a/drivers/ras/amd/atl/umc.c
> +++ b/drivers/ras/amd/atl/umc.c
> @@ -416,3 +416,45 @@ unsigned long convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
>  
>  	return norm_to_sys_addr(socket_id, die_id, coh_st_inst_id, addr);
>  }
> +
> +/*
> + * Translate a UMC MCA error address into one or more representations as
> + * requested by the caller.
> + *
> + * The caller sets the input values and requests one or more operations
> + * through @err->requested. @err->valid is cleared on entry. Each operation
> + * is attempted independently. The corresponding bit in @err->valid is set
> + * and the related output field is filled for each operation that succeeds.
> + * The caller must check @err->valid before consuming an output value.
> + *
> + * The PRM handlers consume @err->umc_addr directly. Only MI300 needs its
> + * MCA_ADDR value converted to a normalized address first; see get_addr().
> + * MI300 platforms provide no PRM handlers, so the conversion is left to the
> + * native fallback path.

Hm, ok. Sounds like a whole protocol. Lemme get to the end of this and see
whether this is not too overengineered for no good reason...


> + * Registered with the RAS core as the UMC address translator; see
> + * amd_translate_umc_mca_addr().

Unnecessary text.

> + */
> +void amd_atl_umc_translate_addr(struct atl_err *err)
> +{
> +	err->socket_id = topology_physical_package_id(err->cpu);
> +	err->valid     = 0;
> +
> +	if (err->requested & ATL_OP_SPA) {

You can make those operations a number and this then can become a switch-case.

Should be easier, like a dispatch table.

> +		struct param_buf p_buf = {
> +			.addr		= err->umc_addr,
> +			.out_buf	= &err->spa,
> +		};
> +
> +		if (!prm_umc_norm_to_addr(norm_to_sys_guid, &p_buf)) {
> +			err->valid |= ATL_OP_SPA;
> +		} else if (!df_cfg.flags.prm_only) {
> +			unsigned long spa = convert_umc_mca_addr_to_sys_addr(err);
> +
> +			if (!IS_ERR_VALUE(spa)) {
> +				err->spa = spa;
> +				err->valid |= ATL_OP_SPA;
> +			}
> +		}
> +	}
> +}

...

> diff --git a/include/linux/ras.h b/include/linux/ras.h
> index 468941bfe855..eac8cf39ddd5 100644
> --- a/include/linux/ras.h
> +++ b/include/linux/ras.h
> @@ -3,6 +3,8 @@
>  #define __RAS_H__
>  
>  #include <asm/errno.h>
> +#include <linux/bits.h>
> +#include <linux/stddef.h>
>  #include <linux/uuid.h>
>  #include <linux/cper.h>
>  
> @@ -35,10 +37,26 @@ static inline void
>  log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev) { return; }
>  #endif
>  
> +/* Operations requested and completed through amd_translate_umc_mca_addr(). */
> +#define ATL_OP_SPA		BIT(0)	/* System Physical Address */

verify_comment_style: WARNING: No tail comments please.

Please audit your whole set.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
