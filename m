Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14734A3866
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636500; cv=none; b=ZXDyIEqBbiiOsQDQsBgF3akunRCGc3xmjCZQxWN9x6LrYViF6TwQto/EokEaWyMhHBRDyrB23bl+2KYuyPZSVhJl2MtTXuT2tehh31Xtnt8IvIlOPqdLl+Eqfz+oetWYFA6RVY81UNLwVF3wLxqPphlmW6L27x4ndPLnu+F9T8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636500; c=relaxed/simple;
	bh=XUDC1HxwPmam1Qjo85tVg1CWvgjsvr2XAz89uv0st7I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KOaaSCYWSx1HrZf0aU8beVH93u8orpysuk9HGv9cUW7p0mXdZTk1zauTbP7ZivFbvn6XYlL6+/hHAGwWEzEfHMqF66H0i2/Qki/8XidBv9f3BMObPkxKsWKVyIPpNCzlWffg5fao6VDbPM3/QxeI6jVviH2ORfSpPb9gEQiW6b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBUDRDfU; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBUDRDfU"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso537272f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789636497; x=1790241297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rd6RO2crHw1PBE+XJrO3BxeE7S5k0arp+bS2hkTKLEw=;
        b=SBUDRDfUpP4Hn9BLCpOpTz71Zq7jAoQsMshg/Vyl3eckC0eDq6MTX00TnyLM8W2NO5
         d67dw/IUxGNvHKqHXQTJ36walnckZ4TKt2KGLLfreoVGcFGYENLH7PAsqGo5CZTIQJSv
         F6TMHdiTLzdYKYFcBNLZbxyZQKqkfaogZEdSI0av2ULuErUSwHHK98Dg1OL/7JZoLLv8
         Xz//veN68vmgirenHK/4nTUW7+3QFVV+hOZdV5h1rAfEE3oYQjMFZ2uYfdmQ9+dF921T
         7yXZWnIsMVQrRg2srSB6WRczSCJFrjgJrPFEpMOq9E7OqlyYk5+ErHq8XHiWC986oC3S
         RtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789636497; x=1790241297;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rd6RO2crHw1PBE+XJrO3BxeE7S5k0arp+bS2hkTKLEw=;
        b=yC2TQm+JYuUi1uT04FrKK09wWNSokevWg8IR7f1mHTJoP+bbfajsX4AnYUrmw3FaCn
         UBAqn59sHfZmzulw1Ildu/9UFrP9qRgsczc5eymRNxzwhfvQh3v0QOp4Yd9K/Xmaa3Du
         RiqAk0ig0GgjnWBSpETCOolytH9pRPWfCjnPd7ll67d6jyMDiUvIRoaV3cHajwkNzDjy
         0SxwnI9pcoEEDAjhy5DlqN8sZ3SWEm3ZHvYR3S5+tRN1JjsHyrlpsNd/udbvO8DJgDFN
         cmFXax0jpF8zYMcwJE24Tr44FxqroDoNOWrpFAf7lIvLjRrz4yj6xrQmDbQUXSzIyll/
         +f9w==
X-Gm-Message-State: AFuF++lCrOWatJIBOw6kGL1Us1YsQ9wl4Lslfpfvga8xJ2g+aj3+lcY+
	YBnyTMD3Q5fbZq/bgtfyGZp3sHzT6gSQAfgsWNb9avdm3x3f3zS6QZ+m
X-Gm-Gg: AYBFou2HNeMv7BfhI8G7ps3RkEtmOl/8eP8V3cj4H0T9kuY+QZIfxuuFw51Xn14VI7j
	TEpYIvLc39I3eL5STcNAYopkY+YXZkmt1T09duF5I/OwqI9cdxhucM0/UCOUw4O4Q4QsYXqb0xl
	sf/WExEeVDiu/RGNy3Mwd+GgiXa0+Q5RxH6+g3fgXkd7IeJQAeMvgGJkotLnnvSanqSx5hqhmVC
	6I0wwCZmusrhhMMGlFA7Yhvk0rCywHG0SLd0dD6E4Dsfr39O+QtT/qJjFZxCI+5MBfqxpCcPHaZ
	bq8FjL9sRYs55nDioyK/exl2Vs6f3itlRsG4w91qVsEOcx7tyuMXtwxnb898eTvsYep0N7PWbfa
	ZAbFYnVePOhXQ0HL3GD1hhWhBbx2lmcU8QGzuzTPMas3xuET0XW8aM5eSsjHeVK/h0as1u87s7P
	h/AD5B3M8sFeVKIs269Z2QWlugDvFBKjeKh5JtQAqrJPSjhCT4rlAYRyafEHg9OVUGFPjcqjOKp
	HlatJ4KS+e9QXAVkIKFnRPllyUt2zELF7dv
X-Received: by 2002:a05:600c:3e15:b0:49c:ff3c:973f with SMTP id 5b1f17b1804b1-49eb7329ce0mr59255905e9.24.1789636496900;
        Thu, 17 Sep 2026 02:14:56 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbf415058sm34707795e9.0.2026.09.17.02.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:14:56 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:14:55 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 andrew.cooper3@citrix.com, arjan.van.de.ven@intel.com,
 sohil.mehta@intel.com, stable@vger.kernel.org
Subject: Re: [PATCH v3] x86/microcode/intel: Reject problematic loading on
 Granite Rapids systems
Message-ID: <20260917101455.3e1ac9a5@pumpkin>
In-Reply-To: <20260916225939.1144524-1-chang.seok.bae@intel.com>
References: <20260908223209.916758-1-chang.seok.bae@intel.com>
	<20260916225939.1144524-1-chang.seok.bae@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 22:59:39 +0000
"Chang S. Bae" <chang.seok.bae@intel.com> wrote:

> Microcode updates can usually jump revisions. However, there is an
> erratum on Granite Rapids systems. If they "jump over" revision
> 0x1000405, they result in #MC. Avoid it.

A probably silly question.
Is it valid to downgrade microcode?

David

> 
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: <stable@vger.kernel.org>
> ---
> V2 -> V3:
> * Shorten the changelog and rename the function (Boris)
> * Reduce the code comment (Dave)
> * Allow 0x1000405 loading. Thanks to Andrew, this fix got attention.
> * Collect Dave review tag. Thanks, Dave!
> 
> Note:
> * GNR98 currently describes loading 0x1000405 itself is unsafe, but it
>   will be updated to say okay with that. I will watch out the GNR98
>   changes.
> * Jumping from < 0x1000380 to 0x1000405 was identified as an issue, but
>   0x1000380 is the first revision as GNR products. So loading 0x1000405
>   in production systems should be okay.
> ---
>  arch/x86/kernel/cpu/microcode/intel.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
> index 1142183c950c..30a22388d4b1 100644
> --- a/arch/x86/kernel/cpu/microcode/intel.c
> +++ b/arch/x86/kernel/cpu/microcode/intel.c
> @@ -309,6 +309,26 @@ static void save_microcode_patch(struct microcode_intel *patch)
>  		pr_err("Unable to allocate microcode memory size: %u\n", size);
>  }
>  
> +static bool revision_is_safe(struct cpu_signature *sig, u32 rev)
> +{
> +	u32 vfm = IFM(x86_family(sig->sig), x86_model(sig->sig));
> +
> +	/*
> +	 * Erratum GNR98 can cause #MC's if "jumping over" revision 0x1000405.
> +	 * Avoid the jumps.
> +	 */
> +	if (vfm == INTEL_GRANITERAPIDS_X &&
> +	    x86_stepping(sig->sig) == 1 &&
> +	    sig->pf & 0x95 &&
> +	    sig->rev < 0x1000405 &&
> +	    rev > 0x1000405) {
> +		pr_err_once("Erratum GNR98: skipping revision 0x%x.\n", rev);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  /* Scan blob for microcode matching the boot CPUs family, model, stepping */
>  static __init struct microcode_intel *scan_microcode(void *data, size_t size,
>  						     struct ucode_cpu_info *uci,
> @@ -330,6 +350,9 @@ static __init struct microcode_intel *scan_microcode(void *data, size_t size,
>  		if (!intel_find_matching_signature(data, &uci->cpu_sig))
>  			continue;
>  
> +		if (!revision_is_safe(&uci->cpu_sig, mc_header->rev))
> +			continue;
> +
>  		/*
>  		 * For saving the early microcode, find the matching revision which
>  		 * was loaded on the BSP.
> @@ -878,6 +901,9 @@ static enum ucode_state parse_microcode_blobs(int cpu, struct iov_iter *iter)
>  		if (!intel_find_matching_signature(mc, &uci->cpu_sig))
>  			continue;
>  
> +		if (!revision_is_safe(&uci->cpu_sig, mc_header.rev))
> +			continue;
> +
>  		is_safe = ucode_validate_minrev(&mc_header);
>  		if (force_minrev && !is_safe)
>  			continue;

