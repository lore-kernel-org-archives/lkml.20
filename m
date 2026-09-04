Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD023C0619
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538223; cv=none; b=u0j4Hfxn3dTBAqzmY0CRFEUYrfgWl42+7dvZBGMyvxTzwtTaBuZ8SZRn4hgPEQosxlD4yXwVhrCxf9YXK1xl3glxDyOwFjUWPY4nQQK+5oOcI8jKzpDRD4u/NxsZW8KqUseJ0kpbCZ0Ln2MiG7oCcDRSb+zSKdZRfGKQI+Vowwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538223; c=relaxed/simple;
	bh=vDfrPOwWEchegSl2fXTFH6NLC2+0Iy7qk1OaiikMJxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DgngUvzriUM/8hfzRq0LONjOskmDah7ZJ9hABQ/1PraYAzHWcI5a3SCiLrjMe0all7D5jroXCku6PuqMjaNLeO7BoN4mipn1kzaSRTsqHehgROt4EsSvNUfzcTrtHyY/2pyuY7B6ivhYM/G99FnoRLSp0/+FMH5s/llSGSnMOZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cDtCUJhk; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cDtCUJhk"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so1536737a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788538219; x=1789143019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1Eo3Xs09Cv3zHO+VFGveYQjtgcEc68O1MBEL+U3hM0=;
        b=cDtCUJhk/k0/HUjHFDUhAECM3lwqvVRejuZzX3ZCPL2YXReb6TMHgf/DpdP5bPeKCX
         c7tSmJwUNvm3Takfu67jXHghTWTFzNW0jheW7gcOJgiuJ1snm7ZCa/7mSsuiV5XTHw75
         PUq7590agvanyM6EkKUsb03pYwM6XLNVxsNdwWrkICmdOOhP8yrDUYFtaxgbyMQSpfrC
         3VDCYQCPCZ6tqgx9nGmAhF1qnoi8GNpody0rOKewWWvCrbyWKMn23lrFjOhqkZyntyjt
         ChJrre44Rkmp6nNjLwRMUjoVM6Oy6XzT/O5soX4QWEwimT3LpaE6an4pFx9MVoNxnG7b
         aC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788538219; x=1789143019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1Eo3Xs09Cv3zHO+VFGveYQjtgcEc68O1MBEL+U3hM0=;
        b=EBhTUeoxjuFWOWqKGvgCBsBWia0nBEO5lYa1U8sNZy7Pbr3gsDzl7t54AZm/in+pk/
         1NUrQwfKwD1j2fgAQPOYgcXgTl3mkXbWk/GaQtt8PLa4XoxPz7c+Q7xc3K5X52e2wMN2
         GnpJxFYbSy+N/AgHzEK/wzmnV067UD7f0CGMGts6JTZuOTorzjwd/7zUw9EfcimaNjuA
         Jh6q6jJtj/Se4I75kDKnArOIzNSDxGtxLhdvTOJcJM8rEWy9myERDDhTXsZFnl1nDUUE
         wyG9snSukrtem4YGCYaYCXqlQ71gAyA+OrFqd4nYJxfC3HKvbt4bSeiSrEQaFd4Ilc9t
         9p8g==
X-Forwarded-Encrypted: i=1; AKwUvBwOj7JkWtUScUfVa4xbmqDFlu1XTlW0KCFDMGLx6hxNF9kss2u+gyywrfzCwpJQMgcdN5zOSkDFjbIqNG4=@vger.kernel.org
X-Gm-Message-State: AFuF++mtGrcrzwDNjhMG3pytyShxosisETPlOnPQxKAk/nzD/SMF9FuV
	5GNjOVfWSDQL3VzmUliHGQBneObjhSXDeuPA1+VvVmdQ2LwtSR+bpVO/Jq9EbZRvCeg=
X-Gm-Gg: AYBFou3zle174f8vP/1ZbtOGuFU+NPfWF8yOHKR14ZKZdKW56TMMIQ+aUYjQwEgcInM
	Eomu506QModjyrMakeLoK0cEHGpd8vlLHwx5+1SSRH0Wvk5rdZk43z+Am0lp29RakkpZVh2IakS
	asgELs13tTmejhi2Njdh53f1qnW62TQsdud/Kgj7pnR9lNJ06na2pCVCGOTLPauQBQUEc07RRNO
	x4A8/p5EEbMz0QbTwXlXHPRm8iQOuBcduI1e5KaI3CJdREaY7Ets1xpEgqWYeQA0d28gHakbWxY
	PdCYy07HTBi53i4K8zqB9JYy4Zif96ZKIWeF8LKj/zGzRuZ+MWBJHnkeX2sy/phQgqHK4Ins/0z
	z/WfYoLKgsaBwZxn3Tt1/LwZylXEO62r5Q3FRA1rzz5mIDsJwlEeWUMVg3Odf1amQEneKZs0B+U
	zvi7UZgZYi6CdxeGxpOmr8hQmRDugVH7t6tZ7IW2WiP12f0S8vwF87xXrcXKN2H+0cknos8V4dx
	pD7ociu9u7z104ZcMM7XL5/
X-Received: by 2002:a17:907:c00e:b0:c25:254:292e with SMTP id a640c23a62f3a-c260c401012mr368173466b.0.1788538218984;
        Fri, 04 Sep 2026 09:10:18 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d53e0b1sm126030366b.33.2026.09.04.09.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 09:10:18 -0700 (PDT)
Message-ID: <d2159a62-d64b-4e47-9e5b-9c409ae4de9b@suse.com>
Date: Fri, 4 Sep 2026 18:10:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] module: introduce SH_ENTSIZE_STANDALONE for
 separately allocated sections
To: Hao Ge <hao.ge@linux.dev>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20260902081802.146145-1-hao.ge@linux.dev>
 <20260902081802.146145-3-hao.ge@linux.dev>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260902081802.146145-3-hao.ge@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 10:18 AM, Hao Ge wrote:
> SHF_ALLOC means, per the ELF spec, that a section occupies memory
> during process execution. Some module sections occupy memory
> outside the regular module layout, for example the percpu section
> with its per-CPU allocations. The loader currently excludes such
> a section from the layout by clearing its SHF_ALLOC, which
> overloads the flag with a loader-internal meaning.
> apply_relocations() needs a special case for the section, and
> find_sec(".data..percpu") returns different results before and
> after layout_and_allocate().
> 
> Introduce SH_ENTSIZE_STANDALONE to mark sections with a separate
> allocation. The percpu section is its first user. layout_sections()
> and move_module() skip marked sections, and apply_relocations() goes
> back to testing only SHF_ALLOC.
> 
> No functional change intended.
> 
> Fixes: 4835f747d3ed ("alloc_tag: support for page allocation tag compression")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Based-on-a-patch-by: Petr Pavlu <petr.pavlu@suse.com>
> Link: https://lore.kernel.org/all/499bb60c-c6e3-43a3-bd92-95a0567ece5e@suse.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
> [...]
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index c32f1d370b73..078dae188aba 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1618,14 +1618,8 @@ static int apply_relocations(struct module *mod, const struct load_info *info)
>  		if (infosec >= info->hdr->e_shnum)
>  			continue;
>  
> -		/*
> -		 * Don't bother with non-allocated sections.
> -		 * An exception is the percpu section, which has separate allocations
> -		 * for individual CPUs. We relocate the percpu section in the initial
> -		 * ELF template and subsequently copy it to the per-CPU destinations.
> -		 */
> -		if (!(info->sechdrs[infosec].sh_flags & SHF_ALLOC) &&
> -		    (!infosec || infosec != info->index.pcpu))
> +		/* Don't bother with non-allocated sections. */
> +		if (!(info->sechdrs[infosec].sh_flags & SHF_ALLOC))
>  			continue;
>  
>  		if (info->sechdrs[i].sh_flags & SHF_RELA_LIVEPATCH)

Please keep a comment about how .data..percpu is handled. This is not
obvious and should be described explicitly.

Something like the following:

		/*
		 * Don't bother with non-allocated sections.
		 *
		 * Note that .data..percpu has separate allocations for
		 * individual CPUs. We relocate the section in the
		 * initial ELF template and subsequently copy it to the
		 * per-CPU destinations.
		 */

-- 
Thanks,
Petr
