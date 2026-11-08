Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794174317;
	b=w8AGucoRB6cnOsfUmFOuqIOU7QIlkgjmCVzG6xG086c8SWdCVCrA0+5dia1QcXsm4Oeq
	 Vb9Yu6i6RYtmlQZmJEv2PKbMqvEZGNTRBJqZGTU2Hil2IrYf3WC7M6MdHP23BSSbvbp8u
	 fed7F1GSgSzdV77/okfed5wzV6sFbD4h+6/2SZbnEGYsZEpVC/8LmhZmKJSPR0lfguzaJ
	 wcBXbsmvqRaDD8NUJXv9yCehqOZVJjk2FQFvk8HguOimKTO8bMhgY/ZyNJ/dK5WVf0QWo
	 UmIxY/KqCQAntpv3Tlt/Qqqmdaat3DlQ8AlflM0R+q5Pkh1tOUF6oZK6Q/GqWOeEQtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yP+R+yf5xY4dHL5c8agyL0IxXu0xVt/tENjfyE274v8=;
	b=c8UxZaJrOzq1L7KbzZONvTS5Me+IATq4PJ8tmMvh37ZhwDhyk0icPHkQO2055hgWmg4f
	 /mq0Pf4NWYUnWj/T8HQNuRKAvXlsiOUwPASDDalGEwIPkyyl4HoZk8UtjWrhbpC1TRYht
	 hcLyHxyefD+eGuPvWenQmUbbjsBdxO+YjkVV7mbHtAXAECd39FA9PdkLEw8to+IxU2Qx0
	 cMSPLRtG4Ar9UCf2clclIKL1qngHI9B7vK1fIlJS8tFUcHpOKiS0pWHd5uLXQSWCZ54i7
	 /9FDC0uDb3mRSniKkn2mvN9hRzUzQY4pFOYb0BN5DV8g22qvgtayrNfiDUC7gxJxOAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=I7bKQwoM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0F3606D80B
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F0F3606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=I7bKQwoM
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67c2c2ac1c3so392633d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794174315; cv=none;
        d=google.com; s=arc-20260327;
        b=MdMfN8iIdvR9ywK2yjIqvNXYWLMxvr+FGm7PamfrYc5/b/O3dXBPUczGEQWGeHM1kA
         GQf411SuPxjFXk6SToTPS52PsJ1XbTiMS7RYqDA6uHqMS7Dn4f/fgBgMlKi0/ibnUFcC
         +vGLXd1z20CY1lnMljEFtxKFtrBdnyrZTGb+pnGg0b3EYmMETtcOtr4e2cBFGIFdL8GN
         jKpaaOGLi6F15qd/PRlhRlU7nZuho5WvzVRaMI1OqmsVfweMxLKQnXV/rpMYcHvBae0p
         fLxcQuFo1C2Nq887uzV87A0aj7n2+KlHmGdEfu6Mdl24S3eV609fKC9esQg3/i20mSCS
         wHLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yP+R+yf5xY4dHL5c8agyL0IxXu0xVt/tENjfyE274v8=;
        fh=aHVAmCbUrfjYDO4y68q1oM/xU0s3Rd79okyXPUDLTGM=;
        b=ffz/4KFz7B8MZAn1wY35YhVY/qk6ysm5aZlDy5l+QF1FT4MmJ6CKgUv0NjinQMqu6d
         drcshfgD9TNteEQva/MKF6rFxYZG8aOlmK2BlW2mNm+N7PT90PAsnCLkKvvUc2u3cPHD
         lWfJGefAJiwZFuq1o4jgqTp5Y+VdceVcgmHhk6zqUXBq/xb2sdrJkRAJYPU/N7YITA9R
         wPAOkMmbqktptuXpYg6gmK7lGOYdRK1Elybp6RJOF7GWfBfms1sHGpujHh3P2o0Xsntp
         aNLUr+jcXchsna+b9EuHQAio0b3W/jyz5rxJ9os00qjLwZZCn3Kuj6DzrFq23KEf1xrF
         nqgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794174315; x=1794779115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yP+R+yf5xY4dHL5c8agyL0IxXu0xVt/tENjfyE274v8=;
        b=I7bKQwoM9NWBQhf/Z2M9xaKE9MTHjD5dWnIDH+Adr4H9RUTtmKRZOsxmHeKofyz7Ny
         5CvujknEZ2FdsKIfyVT1R/rHukzSbfqfbeZUoQ+mq5SSuAh7eETCg3UZ2Yzhcc390cJc
         Zt5++zvN/LBhhOI0WX2rUMsM3vl7LlqS8cWL0xnNAo3zoyfEoHzc6QOlQAADgd8Huoz9
         b9/JNUX5sv6svQjd9bfDrqaDY9Qwcig38CZz0q48zwybotVFcalNJBzlnbMyDvaoWmMd
         guEyM0VcxBpgZ4weamoFg+D7LcqcGJE0rbwmFiVSs7DrY6WzveUPYpQmqAAdKIwmNcub
         bL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174315; x=1794779115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yP+R+yf5xY4dHL5c8agyL0IxXu0xVt/tENjfyE274v8=;
        b=YwQmQYgIqLCIVpcYKvgGFXCYpR5VkokSajJslgiZexUHuj3hjB+VUB2f/PGCIaa2st
         SSZapI0wNm3zPAxwOin7qg7v1NZsNPBiDhpA9shbleFCgId5yqPeGfrUq0pagTnwM4xh
         wPJGNWMUeHgV24+5dM2RhU+R2Upf0Kp1XhThu62YQWj+9yoJdnBQ+3LdkALnAApDo45J
         ovlCs8T1J6gTgldgkkYLttf7PSgXU5e/6LEvrFUjtOtK5w1dbPyAiEDGD1oshM35IcRD
         Q0qRnUIE9rKA2jW+5dTi76UztZfazuz63xsNcpb3comvO+39CbIpd8ppgk3FlTUbXhQq
         xjag==
X-Forwarded-Encrypted: i=1; AL+hErG8JDda7kZGhYq3Z3XXmgNE5iNQi9EHLEj7iIKCnBNss9h/3xD+zAkaOfk3jMHBOJMqiWivHu3Jm0pRuK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w4H2HwiQfaWp6sSHAFsFe3ggygGQdGpyfMNLflyksgaCbFLlp
	UGMEpHlf2ZN7crDnhwNdSnYomiplFcXU1tXI3KDG7ZI811/XOEPINATiWFX3Q4Jg5UkSdHXw51N
	7Bv9DSUQ8dKn0R1NkL2lqVGmzB8oGGV0=
X-Gm-Gg: AYBFou2d7n+ibOMDLJlhKrOVYrQrFDU6diXmMQVajVKS/r/aDJbPO7bfNpv0TG5ruuF
	F/F3iUXltfxKRkwFLJwh16yMjVrufppjm8wbf8rzIaNDxFyH5ApPUjiHa+CNPDvGHyE+OTj0WSo
	zzJOoYhS8450rBPgsn/n+SuxqwwGoCD/x2ZQriOrK5d2gO2f0Aq+CkcT9jnq1VEX8VjC4+m2vQw
	h7VDn2IgRlLAJdJlV74ffM+2YwS7NtqEd1D6verB5GKABvaBWvPvhYi/coELd9ffd1Gsf+jBeoK
	J1I5NAXp3otnZHBi3G+CFR0HQ5gRSP56EL0dlEyPwUcqctrk4I2YxG4wkcrjnCVtlGBDCk1yZuu
	nC5m+W9nh/D9igzAWTRaTFbpaIj+XF0VnuHGm4wD0sofYVLKgoa9jHikFPvlUUiZpjnuqXQ==
X-Received: by 2002:a05:690e:bca:b0:67c:1dca:7f9 with SMTP id
 956f58d0204a3-67c3d9bb63cmr1402384d50.48.1794174315509; Sun, 08 Nov 2026
 13:45:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H> <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H> <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com> <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com> <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
In-Reply-To: <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:45:04 +0100
X-Gm-Features: AclHuK-tzL5nxnrCwLMP_029tOJZYuTko3n3lDgTKGXJ3pWmAcdiBipcjDbfc6k
Message-ID: <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, christian.koever-draxl@student.uibk.ac.at, 
	neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	khilman@baylibre.com, rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:46=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com> w=
rote:
>
> Hi Martin,
>      Thank you for joining this discussion. :)
>
> I have re-examined the capabilities provided by pm_opp and cpufreq-dt,
> and it seems that we may also be able to adapt A9 fairly well based on
> the amlogic-cpufreq.c here. So we have no objections to the driver
> implementation in amlogic-cpufreq.c here.
>
> I was most worried about before was that cpufreq-dt might not fully
> handle the complicated clock and supply adjustment logic between
> multiple clusters, which would have required adding a separate
> cpufreq_driver. But it now looks like this can be solved by adding the
> corresponding config_clks() and config_regulators() callbacks in
> dev_pm_opp_set_config().
That's great news, indeed!

[...]
> > - Meson8/8b/8m2 (32-bit ARM Cortex-A5/A9) where we need to reparent
> > the CPU clock to XTAL for stable operating during clock changes (which
> > should go into a cpufreq driver that implements target_intermediate).
> > There's no secure monitor or firmware involved for CPU clocks.
>
> BTW, could we put the CPU clock handling logic in the clock driver like
> G12A does (though, of course, handling it in the cpufreq driver might
> minimize the coupling between the clock and cpufreq drivers)? That way
> we could fully reuse the existing cpufreq-dt?
Common clock framework maintainers don't want muxes to be programmed
magically in clock notifiers (which is what G12A and Meson8* do).
So there's a chance that for new drivers they would just NACK that approach=
.
I don't recall the exact reason anymore - but from my perspective
using a cpufreq driver for this is the cleanest approach (although a
few lines of code extra).

Additionally: I believe the udelay(100) in the G12A and Meson8*
implementation is not even clock related but a delay to wait for the
regulator to become stable.

> > - GXBB/GXL/GXM use SCPI firmware CPU clock control so to my knowledge
> > we're good with what we have (meaning: no custom cpufreq driver
> > needed)
> > - G12A single cluster, no DSU: needs a cpufreq driver that implements
> > target_intermediate (currently it's managed on clock driver side in
> > kernel space, no firmware involved)
> > - G12B multi cluster, no DSU: needs a cpufreq driver that implements
> > target_intermediate (currently it's managed on clock driver side in
> > kernel space, no firmware involved)
>
> The cpufreq-related resources on the SoCs mentioned above are relatively
> clean: each cluster has only one independent clock and supply of its
> own, and these SoCs also do not support voltage selection based on chip
> binning.
That makes things simple, indeed: each cluster follows the same logic
using it's own resources.

> > - SM1 single cluster and DSU: needs a cpufreq driver that implements
> > target_intermediate (currently it's managed on clock driver side in
> > kernel space, no firmware involved)
>
> Compared with the SoCs above, the difference for SM1 is that it needs to
> additionally manage a DSU clock. In this case, the clock-related
> handling can be added in dev_pm_opp_set_config() in amlogic-cpufreq.c
> (by implementing clk_names and config_clks in struct dev_pm_opp_config).
I think so far mainline is not touching the DSU clock at all.

[...]
> All in all, it looks like we can currently support all Amlogic SoCs in a
> single amlogic-cpufreq.c? Then, for the specific characteristics of
> different SoCs, we can differentiate them through the "compatible"
> property and add the corresponding drvdata for each.
>
> I'll also try to support S7/A9 with representative differences based on
> this patch.
Great, let's look at some code rather than discussing theory on how to
write code :-)

There's one last detail that we have to manage in case we also want to
include the Meson8* code into the same file:
config MESON_SM depends on ARM64_4K_PAGES
32-bit kernel builds can't satisfy this (meaning: we end up with
linker errors). I think a simple way to get around this is to add stub
functions to include/linux/firmware/meson/meson_sm.h.
I'll take care of that once I can submit Meson8 support patches for
your upcoming amlogic-cpufreq.c!


Best regards,
Martin
