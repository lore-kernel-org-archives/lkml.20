Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793700196;
	b=I4jvL1iDfRv6fLIE7kloAIgOxjZA5POgGdlghm+GD+32pcfmQ3q0yVC6Ak4Z2KhrMr80
	 COdukhgFhLUO3lTHLhEvft+INEKILqajBfQf6ZnkNDi8OMTWhasEzk1mDiJ1zx5CDCE7h
	 4dGC1XF+SaGJTYZRoTCAwPe29P6eSLCRcOb/qfvWQLr/oMj+xy6jJwrD5m/MoUxc/IALD
	 5H8D/AxSwxQmHUW9YgqyvV+oDv19oiSKIFiusCiqvMpjvpje/BdYF24dA8RaAXBuLUDtm
	 OLg0KNHH//ZIbShsheS0G6XHbV22WQH7KfHHTy+t/zTw8NZpdOyZrZhvtJ24w8H7MBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LEg0SrmO/VhGhY9o8Sggz15O+9RUdwZIrLUomDbcYAw=;
	b=Z5QsFp7GqNJflGfLQsONJpjQA6BOXBZF8efYHwYAEWAvZboP1R50bsVzldGaFDrvgBRM
	 6EzOKSRLJ/9eH6SRALgt2AG/nYSXtZ/rhmB2ZCRl44Cb8WHZTRHMqRyK5z4nmNAr1c3NM
	 Nh/e3rknBaMjMgP0z20WQOmCCzH8PWKlf4r5t12quJMCzOaad1unNjjwYOAQJDpcUOSZa
	 WpqfguiUR/kjPtRK/k5ECiAb3seX6IRWmQNlRjBv0Bgkqgqgzu4ye2oYn2S9juILOlcbw
	 UV4mdED3vhwwTLSioNTuH7elSN9aClhH1NMUcRVtcixMdBuPK67iSTt94OH5xpYdiMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flashbots.net;
	spf=pass smtp.mailfrom=flashbots.net;
	dkim=pass header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b="Wc/5StHW";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC58606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EC58606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=flashbots.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flashbots.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=Wc/5StHW
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b1afdf5196so1313922eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:03:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793700195; cv=none;
        d=google.com; s=arc-20260327;
        b=HJONY64mQzRgEhmbfJmmu2dpftHredMYhEB77Fwj14FInGJaL/bX7ELOChezUz9pFB
         D8X18e0ZVmvZ7BSD/eTCYImlazjaxkT/Wyqj2f6V7RxrifnvgwgKfETTNAw3ODaeIR1k
         3l72pJ9+j63jSXM7L9IClgvlseJyJnoMtgbWAZfitTEcX32uVvJ3o/87ptWcgOpCcHxD
         LaNbKnI3nyLa5CtUBJ4367ZqBbq5XKrQe0v/gI+2g+ko9H8uEEAacIdNhGFpk8clLOXh
         2w1M2tOIolV2WQMf/J/b7zML4GFttzkRRnYFuMfEj/McFUh/yTKGTZTA00mSqM/2xPSx
         XFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LEg0SrmO/VhGhY9o8Sggz15O+9RUdwZIrLUomDbcYAw=;
        fh=XAr+yEHIhHhw/bnBiYHVQwT9TbvdIDF7vcAd4btKoEk=;
        b=IJsfGXyyJ5UXNo47pK5Rvp7szmDtf1NYi088Vf72rJY3uWxF2aHUG246iCOMKuoqtl
         bFCpFrmSY05JxUmCak4uTBXlZpc3oi5ZPO/SYskMOQUQu9vycQyN/fziTMrub/OfWT6B
         oezRFVcN3NYtkTbZvaJD2LdX6FzsNu5MXZb2cUyAvNjO8j7JF6LYVOKcjjyVV9OHLvIQ
         hF9lG8jl3yQiBqC0F1eaEQIJFgPSeQZDyA6RZmlB22xmbbRUhNUPEGBgklpCfKscANTL
         8YvWpdsLHPk08FvMFdeUALRbCLQmuMyjjCNs83nSabjR8g7EKzLS+JNk4oiwzDflGpLj
         fz9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flashbots.net; s=google; t=1793700195; x=1794304995; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEg0SrmO/VhGhY9o8Sggz15O+9RUdwZIrLUomDbcYAw=;
        b=Wc/5StHWz/UU9XkyUuuCGSsONbSwRWNH+t8cv7xyqKudZUFa4tlQC+w3SGxyO/Nq9T
         4do6QEKfbIeEypOeEAtv/sYQ0cGZqFy4OMkume/DWkFe2WHy9eB9biunFqQ/lnfQ40oc
         EhlFRme0I5PWYZFF2OegWlVsn9UVWa0WGI4FEaxPU23s/ko4XPGoo922QLfCpNXvig9F
         Yh/VIj0WNpSzd7YPRIjA+83AwUXndI8net6S3CpzRpyCfNC5rN+XHWpyjYfcxEEBJuR5
         h8ZcDCll2NtULcexdSKQLqYGuh89uRFZdLVAG3l6PIwUyHEX42vEqhORQeQitL73La3E
         +KFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700195; x=1794304995;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LEg0SrmO/VhGhY9o8Sggz15O+9RUdwZIrLUomDbcYAw=;
        b=Qm7xVpZfWyl+DrGbiYw4ZIQ9SiBsAvRBJDp2d47aQfNENYfTHKxynkQo77xmLZ+RhL
         4diCAF5dn40HZfB9tfEmmYgWSUsD1YYCZkDna2yB+LrypV7K3bUN+r0/6Xat2j3sMyDE
         le7gQCy8nnAFVjkhZLXGWhaLcIPpzNf32urb6HqCnGCdO6a2xzhcNPpKbqOFsltr+HPS
         h1zjIPtti+MoBZF961oXF+aE/YbUUM5t9vcZQdJBZbmeXHdx2C+bzhOSNyHtqJLIG7Kc
         zFk5jRfwUZPMhLtjvdzgiCLXqrdb1woPwojVvVXI6d6+FNEbUzH931iGTqMRSYsBo0Eg
         yIeA==
X-Forwarded-Encrypted: i=1; AKwUvBzeyP+GMmipbJM3YHSRo0nHq8id91Y0nBeXcvr+SvJYEIWIjfKc1UJ9ojkZ26uHTScvSU1pY8G6HX2jppU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/M2ffH0N52sOCV3n99wMSOJAG3Sq/O6eHynlEw3Kii8VGGG0qj
	hOd2YhiznbTPiFfUutVxV/ZL9ewxxISr8FlL05cRiGoQF7M8BL23+/pyKdBjM/5HseS3Dz5PUfA
	fz+SdGVLZjIHqEFhCo7PF6ed5tfrfHVG/Qy0wPoROLA==
X-Gm-Gg: AYBFou1uut5d5AiNZuAUXJIQKr+shdxIIvXSb3CFId8MGasO97AuhTUEeMSUf2R2Crg
	+KOd43LPdvj/ft3VH6Q3/QY1V52GyRMqSCMa9mj1LBW2EEOZRYFNslm2vhOp2Go5kC/1aSNiWNe
	j1YfdHhY4/hfCOzug9ru4oCQvSn8+tnCpPExvNvgUxlB/WrjGVVjd5LP0vJt+e2yaQCo2/IbDJs
	J2ZyzoMuaDc5zEuQ/3E5Shz17dJi+LfLgAttJeabZdHG/Pn8es+6kT3Wc6oYEp3JkMw6qvSNT+x
	FMZGs5fvgc94pDAFAdEIqCtyA7bFgpl46TzvD0sngJd9Ur2KV+Y/blNMLxFRESv1EV9eUBQZi+W
	2ZzxRqaP+8EWIva3u0xNXmB6HktFgxy5z/AURtrLK0nTj3wVg55Z9Txk9mBQpxYLM9po3UhQiiM
	5aHvzKbpGf/x1L1KW+BUJ9dRnZBJztv0Y3rxLZ1onh3GbP8XI10+WkFFb1FQ==
X-Received: by 2002:a05:6820:340e:20b0:703:10f3:89f1 with SMTP id
 006d021491bc7-714f2965e33mr4202725eaf.40.1793700195111; Tue, 03 Nov 2026
 02:03:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-tdx-guest-quote-poll-v3-0-6a83bb767314@flashbots.net>
 <20261024-tdx-guest-quote-poll-v3-2-6a83bb767314@flashbots.net> <7a832e5c-eaff-426f-adff-7935be265bbd@intel.com>
In-Reply-To: <7a832e5c-eaff-426f-adff-7935be265bbd@intel.com>
From: Moe Mahhouk <moe@flashbots.net>
Date: Tue, 3 Nov 2026 10:03:03 +0000
X-Gm-Features: AclHuK8r2SlXD9z5feGLL3zqeEwt_maaNYZRrrX02gKnp7mXSTM9MjCJhTQJcWI
Message-ID: <CAKV3HMNEi6aU8GhLuszn8Tmn4aOZBb9i0Ueq_-xre6KUBYssGA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5B=F0=9F=9A=A8ext=5D_Re=3A_=5BPATCH_v3_2=2F2=5D_virt=3A_tdx=2Dguest=3A_Po?=
	=?UTF-8?Q?ll_Quote_status_with_exponential_backoff?=
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dan Williams <djbw@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Jun Miao <jun.miao@intel.com>, 
	x86@kernel.org, linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 10/27/2026 10:08 PM, Xiaoyao Li wrote:
> I think it's possible that the host VMM completes the GetQuote request
> before the first check in wait_for_quote_completion()

Right, the loop checks the status before it first sleeps. I'll reword
the first paragraph in v4 to:
"...checks the status of a GetQuote request and, while it is still in
flight, sleeps a full second before checking again. Unless the VMM
completes the request before the first check, every Quote request
therefore takes at least one second, however quickly the host answers."

I'll send v4 once the discussion with Rick on the cover letter settles
how patch 2 should go forward.

Thanks for the review.
