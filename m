Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794588397;
	b=Mzb5mui76g/PXRGbQmV6+5J4Szz2MTvBaqiS7k8Nw1ul4tuTRHqM73vc7fVg7dPYJlGe
	 OOnZ3A0d/VU7sKvJb+PKMqW07DhccZOuKlo6Hd0h3VQAbR/+KkJIs8sU6HYHMN6sCCLJC
	 KZycFTuqt6RZT12QrFkpsNZz1sdlgnXcl2bOxKFyBlXbiGdEKxbo/JT73d0cLUUh7PZbD
	 f8/3vuSJRvwrH8TJpBOIZYw5BqNQoXKdhbJGWmrNz3Nv088qnutvSDL7Q6DK6RQlqotja
	 iSBlkeZ21E8vVA8ujOsoE3ZfTw5BIoejhKU76cTVqjW4bIVMYpeFwyAkSyNjdqaQqmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=;
	b=euomun0CuAQ6bvvZ6dWyQD4MfBR8gmZKX/hgSMM8gMB59xtGRyl3rDvz3sE6nHmEJDWx
	 ag63S10d1mMTkpsLdnOYk9uHNkaRuIjqww5QTittF4y1D/fGn+UeWs/g/recpZfwDcvCq
	 vEbgKLEsjt/IgWkh4gv0K0OqWZYsP69/V+UBnrtMk91JoF5UufjaaCEa5eUwFmQLacCCG
	 gJ2UvG28GG2UmEEfY5R4Ir4HaSAg9ru6qWsOZMwGU7GZlsG9/x24lYai7LLOHH8LlAntO
	 W7yGQlQzl+Tn7EdZspyXD5GEa2bjkKE6PFMUS8YbDpmdwvnWuQDKP3WFV67Jpz1RvSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iv+OQwbi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C4E606F5DA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C4E606F5DA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iv+OQwbi
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so2282959a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:46:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794588395; cv=none;
        d=google.com; s=arc-20260327;
        b=iY4prhzlgc6WDw27XE21eWh/5zHrdUhbfldmi/UrCN+YBMjdCvpQ221zDeFgoxP+20
         Z5da2h98Am3FpGJ5h7IlOOmxb5/LynWc5EBS6b6zZsdG+m06c6ha/B17A3CA4RJe8pOK
         YtboJkm211ZqLN+2A8z0Rqq7lQUoseimE9phi/4pk+50tBm96xQnal5fN1wtjQC8MryX
         hZbbhKXR5NElxV6sA/Ek/ue6Q833ZnzubVPbn3Uk7YBkiv1uGSbJdrt+adSzEemxWCWA
         yVhlOz5NKeQQNoG22gmxbryvvlTdpiSY8V7hRPrml+wj5RitideslaXrMWjNcVp2mCrc
         HoVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=;
        fh=RRo3T4TytY/H6zjNYpFLAMr/USOMnG5lE37Apfz8d58=;
        b=l9OnCmbHG9POiqUFASfdor7HIx00UBuDTHfNJ1vE863jeB1GufopENX74iOjD/Lrwr
         ju9TWvzv1e7x6gZgwx13lfiSDytgQ8+E1fGDWU8ckoZC1ICj8weJKBtb0gSbkVvxWcGR
         qS7cS67GG0You+BxdjcSwvLIxLwfhkAus+1szxfPC50LMfuUYGoDGcc+eU5plNf8cTbH
         KNW0Hrjkq470XES582FHxU2VOK0VdEP5os1OYRl+/upy3zKivTAH17l1M/O7MeOXBCiI
         moVdc+GEc5zgbS6m/PBBb3cs76Ykncjvl5KpmWEPIBpMptbb63/h3nnA50oJdEHky5nb
         WJHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794588395; x=1795193195; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=;
        b=iv+OQwbi4cghQpC0jKft/CSqfDiS1Ihc9bfUHcjUtiUmUBegPlwVr/Ul8v16P5x1Oa
         WJ2xfkXeIZqSRMcmRIzFnK1FCmeyxWVAIN2VXSDib1ZkUH3H2LU/Mip8ClkyAAhJIoT2
         uPY+i1hFWgOsylJs945u0z0AG0T/5ilAOzPbwa+bAykSn4GOP5UArt1jcWlNkZso2IzX
         CRiSokmPrLmTrrWNUe1r/OIJGNSh9i7KzU/GU1Dh6QEuNwGrKE3ZKB/sOkvKeqEk411k
         rndIDYoU9jL3kD+f7zNtbLiby6wstIJPZzPp+JZSwdoACWmvyFq1F6zTwoR/yjpV55pa
         jhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588395; x=1795193195;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=;
        b=jbG8cKvLO7Nd3p2jVjoMliRJITkDQ6YcHswTZfB56gelMoSH+Wan2KFqn1QDycKILh
         NyCaHudsV2ysxiRODczfeqtDAWvAwyg8vhqy5bwW0bflUP76DnUOX/vVo9AMRg0MQ6eD
         397ekMWMwjXd96iRimW8nFaVL1lreiGJqieHmiRwA5h+kIPu2t+XAQclXm2BnXhINMuH
         elDntdDWtPkaTpOV9B8C14cK+0tSKWrbG/rWPZx7jEHbm1PwGSvx9ZGyS9HL3UyLmqYA
         3mKDL3YPjTX+omEXLK0RFG/c5j28/lJnh8DaT5T55mocnbboSPuZnEIvZojq5FG1cmyb
         oU9A==
X-Forwarded-Encrypted: i=1; AL+hErE/Rytb3gcXmGFcvpEUrPpQ1kFIs6dZLrje+nMH5qitYiOpcjF+Af0Nqf8xBYku+1Fm97/w25iocFcgc1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NJxpaAOiCbXVF92MCTVL//RAEXh+nT5tcidp2znf8OeusU/b/
	qQBgBLEc8En65AFolSMK71WWBkY3gUpasVlXfrM9YwOWVSXZrSwhD6+mpVkrMMwjrFUQ/Khr4Dn
	hp/RNrM4LwtpxDcOFtN+lUhnbVwYYiQtCeZeHbKgAcQ==
X-Gm-Gg: AYBFou29LfowEMKTxyGmMaonkE+H/xOI5QWCsLXJjWDWxmOGyEaKvqPkMCNdhH3CGS1
	rMYA6PkQtWHoZF3e/FwCBea6sO8Unhj2hdQ8QS9x5t1PGg66dvPJV9awHupz6O1Df11eUEhJIpY
	f3Gd06d/G5Id+voctAKEbp5w5VPu2ipOy6elwaVRgB8pDE6LFfCcf7nbu1HAru8IaSvobXBwBJq
	upTC92LDu7o1y5GWPemG1WWfogdn2VKgRUd8YbadlNOP9a7q7Tx0WC8xNGqyqSv5/v8ahLC3rnw
	0tqVLvv7jXgWfBH9r2BbZvSW2dGuPFuUvSQ6jJJs934SfQC3mHZ4ERXNkySkYRDHpwDii33ivnG
	zVeLwU40wz9saxo3g8betS033ScMNmJodDd60t66TcWfqce9rckWn7fhaEIUyqd9vDHXZVg==
X-Received: by 2002:a05:6402:a6c4:10b0:6b4:7b28:858b with SMTP id
 4fb4d7f45d1cf-6b7c0be1709mr2033159a12.19.1794588394028; Fri, 13 Nov 2026
 08:46:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
 <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
 <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org> <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org>
 <8e305a3a-c30d-4862-9da4-8c763b9f88a0@linaro.org> <DMS1ELJMVBTB.2I2J926XE5V3S@linaro.org>
In-Reply-To: <DMS1ELJMVBTB.2I2J926XE5V3S@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 16:46:21 +0000
X-Gm-Features: AclHuK_ez23rl1EP1_wg4tzOti-KVedDElMJmYIu226TUJ8WPAQv2T8gyYll0Ws
Message-ID: <CADrjBPq79Dn5pv-2wdcG5b9rNb4NHatzGGZMrfAkF1L0ZD1mHQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Turner <tturner@lineageos.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Juan Yescas <jyescas@google.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

> >> Eventually to have some sensible/working ->recalc_rate() for ACPM
> >> cpucl{0,1} clocks.
> >>
> >> Which is needed, for instance, for cpufreq_dt because it registers with:
> >>
> >> static struct cpufreq_driver dt_cpufreq_driver = {
> >>         .flags = CPUFREQ_NEED_INITIAL_FREQ_CHECK |
> >>                  CPUFREQ_IS_COOLING_DEV,
> >>
> >> Don't know if it answers the question (if I understood it correctly)?
> >>
> >
> > Thanks, Alexey. I see now that clk-acpm.c uses pdata.fw_name on the
> > parent (acpm_ipc) DT node to link the ACPM clocks to the CMU PLLs for
> > ->recalc_rate(). Could you please clarify a few things in the commit
> > message (and below):
>
> Thanks for the good questions. You hit the exact pain points we have been
> debugging on hardware with cpufreq-dt and Panfrost devfreq.
>
> > 1. Physically, CLK_FOUT_CPUCL{0,1}_PLL are not input clocks feeding the
> >    APM hardware, they are the PLLs that ACPM reconfigures behind the
> >    scenes. Meanwhile, acpm_clk_register() sets num_parents = 1 and
> >    pdata.fw_name = name for all 9 clocks in exynos850_acpm_clks[].
> >    Since the DT node only lists "cpucl0" and "cpucl1", won't the other
> >    7 ACPM clocks (mif, int, g3d, aud, cam, disp, cp) remain permanently
> >    orphaned in CCF with rate = 0?
>
> Correct. Is it a problem now since there are no "clients" or consumers or
> users of these clocks?
>
> Or do you suggest to link them all to parents clocks to have a sensible
> rate?

Since your implementation relies on CCF to get the clock rates I think
you have two options:
1) Only register ACPM clocks that have a corresponding CCF implementation.
2) Add the missing CCF clocks for the ACPM clocks you are registerring

Should CCF's ability to set the rate for these ACPM-managed clocks
also be restricted? It seems undesirable to have two entities (Linux
and ACPM) able to set the clock rate, with the possible exception of
it being useful for debugging. These limitations should also be
clearly mentioned in the commit message or cover letter.

>
> > 2. Does bypass_acpm_exynos850_get_rate() actually return the updated rate
> >    after clk_set_rate()? When ACPM changes the PLL frequency via IPC,
> >    CCF is unaware that the parent clock (fout_cpucl0_pll) changed in
> >    hardware. Even with CLK_GET_RATE_NOCACHE on the ACPM clock,
> >    __clk_recalc_rates() only reads the cached core->parent->rate without
> >    calling ->recalc_rate() on the parent itself. Won't parent_rate remain
> >    stuck at the initial boot frequency?
>
> This was already asked and seems there are no answers. The problem with
> stale rate is present.
> https://lore.kernel.org/linux-samsung-soc/DLAZXSNZK6QC.1VFAX37XCXBOV@linaro.org/

The question was sent on September 9th, but the series adding support
into ACPM was sent on September 15th
(https://lore.kernel.org/lkml/20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org/).
The limitation about get_rate returning stale values should have been
clearly stated in the cover letter or commit messages.

>
> Any suggestions?

For the benefit of the ML, we discussed this topic off list. The
consensus was to try and make CCF walk the clock tree, recalculating
clock rates from the SFRs without using any cached values (as ACPM
could have changed the SFRs of PLLs, dividers, etc., behind Linux's
back).

That should in theory mean that clk_summary will always report the
correct clock rates for everything in the clock tree and we won't
report (or make decisions) based on stale values.

> > 3. In drivers/clk/samsung/clk-exynos850.c, cpucl0_cmu_info and
> >    cpucl1_cmu_info still set `.manual_plls = true`.
> >    Does that conflict with ACPM firmware managing the CPU PLLs?
>
> I don't know yet what to do with that. I didn't encounter any problems
> yet because of this. Is it related to early initialisation only?
> I thought that exynos CMU driver doesn't touch PLL clocks after init.

You should check this with downstream sources and the TRM.

regards,

Peter
