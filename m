Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485543;
	b=WiRH5ozyQTEzWPILqEFVW4DBT0bPOI8YPiN0Il4nEf5wKxsx/6YThT7N6lrZ9en25g7Q
	 7AKUpjWpqtCKPtEVjOwKs2EFDyE9MxXgd4hBGYammnpI0I/2tqdv5ZjzW+fRlO8r8SGXK
	 OH9OiA6CWoPxLuC6RXcS+LhQn/UDC85loOShoqmqrjgTSzSmdxHBGg9H9XimXIodvSOMY
	 wFCxCbOGqUObu2xBb5We1PUoP0HGo07nMQCFMwJlKOr4JoTvNiJGmo3jsEQ8a50dPOS3t
	 vmx8hmz6sMWNvnD6B2s2XmZ3eERDgmNBctRar2ZDIaLsZUitK0N17dN4HBtQ20W7YmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bKu/a9idr8AalgLeaxKGctDwmMWZR2soVm/wfK6AECE=;
	b=rhE9e0NEFOMYtkTR8nhze210DbWxQUh51o6GTRe/9mtkhBABcDuxecRU+SU7i4y8ZdSz
	 9YZ4ryYA1kPIzgIghhiZdZVE+6vgAKG6iWJtqrtOKIiAOf7IwuG1CrAAUUnutyZCGffdE
	 +FBOYAYWa4P5Tb2I4X9Ic8ppVrXe/ov7apzZCVKe7Qn8KJTnK+qfklXUsfSR1w28W0bb3
	 d7O/+zWMGCtUSxPCWGXcABkLWVyU1VkYwbYgRMMiyI3OxrZX6DC/art++yl+zh4uaVjQW
	 EoZznf4xvV3O2gjC9tcRnkfHLdJvsHajjSFOs/eOmN6ZZGi1oV8rdYOmvIUyxAxkyrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BvmnVXRh;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F20606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F20606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BvmnVXRh
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4910b863b84so518707f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794485540; x=1795090340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKu/a9idr8AalgLeaxKGctDwmMWZR2soVm/wfK6AECE=;
        b=BvmnVXRh37jlQj5w+r+F+RhSfdu+OISPOeDGoNpq6xWDkIAMFJ1jNyoFPCELfxfZMW
         STQOokc+wrDCKo3qAa6Z6pKMOX978XaLqPJwLIzI/E0S7fIscdDTz2ebkRmp9Q/DY0eq
         ha02vVjulkCaMD7jjZAnXaXGxJzvsr0ChW5u4ugNgD98Y4PfSKLiQo1dJ/WdK1qPy6X6
         qWL2W7gzXfqrAL6QIxPxDFwWcIJhYGFqXKhifxWRDbWM3iNCfNQ2+yWCmqX0amdWYWAl
         L7MLUJyjSUWU6aeWGMLKAVLTj+UWg0KBBYpB9Y5jBgM7sJI7Q1I5JlaG94GNfR+Y2Xev
         Cy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485540; x=1795090340;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKu/a9idr8AalgLeaxKGctDwmMWZR2soVm/wfK6AECE=;
        b=loRbtMeryyqO+q5aFGFo6cBfIOxEIegqnNBR3jAUxy1loS9/iv3p+K4urFZPMwpZL+
         ftOuynazZ8GNbA619wClzRIZ64agMQ72xswwg8q2+fQxmWY1ZkTiq367/KXqgQHpXoob
         oYyYHf9BOAYWfce0maSBRdu7YNjUxdzDqC6h1UMOxwsE7cvAoaAXO4jmdxqK0mgH1OH2
         AMc5QBu4gZ/15f1g4J+VuDUc8UKLWmRUZRQrbtspXMEqxcFZBs+bvK/JXP399KpzHpmL
         JaZgcOExui7aUaiXx+afHUdHdl0Gjj/i5EVr6Z+4RCvV0832/LAeQ0XCnv5VbTFB33sY
         29Xg==
X-Forwarded-Encrypted: i=1; AL+hErHSBt17RezB2FeRskuXQvFGLqfW8bbchncuVZ6ZK6Y037CNAILjNVk4VmlUkwe9cxXwrtytQjIlSGZoNWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9254FBIvQGSFUgke+h2DRbBRiaSu/+/9kNFnnTOF4jkYrtmzp5
	BAu0Q7Dt21YfPClqP+iB9W/lq4ni3WRBFGq0V8F4ALnxrd5+fANQsCRaAFUgRn9MIas=
X-Gm-Gg: AYBFou1J1x/JbUIS72UIstmoQvDrLbqcVtB11D+ND25kYMM/Pq3OE2HvGfjXt25kOHt
	U4LredgsmGB7qhXpjgRWLUuk+HfqZLuF1XuYW8tlG6MeHZpnOMvXm8d2qE5hJcBvlP2p+s9fyDh
	qDb5qN/ul/EpEI0GzE/1GvwuXrn0cwKGOgSCh7U1NLtFJSwTIA60HNcVxiI7CPJjtCvlgEpyA6h
	jzxzMzPbVrhsIMuAqBv2LTfhLxbBvduBR869awJkPppbzoyEs+GOQHYHGD2KUMcM2KbcFv3Y1QX
	3DccIwRm7jDQnmuG8VggEY3Qk9+Ub5PBQ+Ds+1vDG+rXQuFb3tY26iQg0uCnYBFKvMZdbD9mv8l
	HQkNNnjA2WbMSPJa58lsHL50xP2nthqm6HmX50FYmpRSPene9uZp2GKkGlVwgHfzpVdzIlhEAzB
	uwV12eFKzptoLdFElkxSehx+h4lOKvl7lhNLS8lnDnNOA6IRQXCYmhrQjpKEB12+92jAHzBrKKZ
	QEZK34/7ZU6GtZkR7QQj+AQWwafTd7VRY7+i92aXHycANX1G8JSeO90HPtXpjyOTkmy0Wdqo9Z9
	yfHOlJB0LfYYIo12PuAQM71ESRVx
X-Received: by 2002:a05:6000:491c:b0:491:e477:6820 with SMTP id ffacd0b85a97d-49aff96ab56mr4685821f8f.20.1794485540040;
        Thu, 12 Nov 2026 04:12:20 -0800 (PST)
Received: from localhost ([195.94.151.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c9b1sm15040172f8f.6.2026.11.12.04.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:12:19 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 12 Nov 2026 13:16:16 +0100
To: Wang Xiaolei <wangxiaolei01@kaihong.com>
Cc: linusw@kernel.org, florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com, iivanov@suse.de, andrea.porta@suse.com,
	phil@raspberrypi.com, linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>
Subject: Re: [PATCH 1/3] pinctrl: bcm: Fix off-by-one and out-of-bounds
 access in fsel_get()
Message-ID: <avWuED_RGlEdGH-9@apocalypse>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-2-wangxiaolei01@kaihong.com>
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
In-Reply-To: <20261106070628.1428691-2-wangxiaolei01@kaihong.com>

Hi Wang,

On 07:06 Fri 06 Nov     , Wang Xiaolei wrote:
> brcmstb_pinctrl_fsel_get() takes the value read from the pin's FSEL
> register and uses it directly as an index into
> pc->pin_funcs[pin].funcs[]:
> 
>         fsel = (val >> BIT_TO_SHIFT(bit)) & pc->pin_funcs[pin].func_mask;
>         func = pc->pin_funcs[pin].funcs[fsel];
> 
> That is not how the register field is encoded. The setter,
> brcmstb_pinctrl_fsel_set(), treats 0 as GPIO, 1..n_funcs as
> funcs[0..n_funcs - 1], rejects n_funcs + 1 and above, and n_funcs is
> always BRCMSTB_FSEL_COUNT (8). The field is therefore a 1-based function
> number, while funcs[] is a 0-based array of eight entries.
> 
> Every readback is consequently shifted by one slot, and a field value of
> 8 -- which the setter accepts, being the eighth and last alternate
> function -- indexes funcs[8], one element past the end of the array.
> 
> This is reachable from userspace without supplying any invalid input:
> 
>         # echo "gpio45 alt8" > .../pinmux-select
>         # cat .../pins
> 
> The write is an ordinary mux request that fsel_set() accepts; the read
> that follows goes through pinctrl_pins_show() ->
> brcmstb_pctl_pin_dbg_show() -> fsel_get() and triggers KASAN on
> Raspberry Pi 5:
> 
>         BUG: KASAN: global-out-of-bounds in brcmstb_pctl_pin_dbg_show
>         Read of size 1 at addr ffffa07c577ab2e8 by task cat/839
>         The buggy address belongs to the variable:
>          __compound_literal.62+0x8/0x40
> 
> A field value of 0 has the same root cause in a milder form: it is
> reported as funcs[0] instead of GPIO. The mux itself is programmed
> correctly in both cases, so this affects the debugfs readback and KASAN
> rather than the hardware configuration.
> 
> Handle 0 and out-of-range values explicitly, and index funcs[] with
> fsel - 1, so that the getter uses the same numbering as the setter and
> the index can no longer go past funcs[n_funcs - 1]. The existing
> fallback for func__ placeholder entries is kept:
> 
>         if (!fsel)
>                 return pc->func_gpio;
> 
>         if (fsel > pc->pin_funcs[pin].n_funcs) {
>                 dev_warn(pc->dev,
> 			 "invalid fsel %d for pin %u\n", fsel, pin);
>                 return pc->func_gpio;
>         }
> 
>         func = pc->pin_funcs[pin].funcs[fsel - 1];

Non-blocking nit-pick: I think that pasting the code in the comment is
too verbose, especially when the same code consists in the entire patch
body here below. A succint explanation by words would be more than enough.

> 
> Tested on Raspberry Pi 5 with KASAN enabled. Before the fix, writing
> "gpio45 alt8" to .../pinmux-select and then reading .../pins triggers
> the splat above. After the fix the same sequence reports
> "function spi_m" with no warning and no splat, and a register field
> value of 0 reports "gpio". The register is restored to 0 afterwards.

Since you're at it, would you mind fixing the SGPIO AON related OOB access too?
Please take a look at bcm2712_[cd]0_aon_gpio_pin_regs struct: they both have
a bunch of AON_SGPIO_REGS macro describing pins at the end of the struct. That
macro puts them at [(n) + 32] in the struct so there's a hole between 'normal'
gpios and SGPIO ones.
Accessing bcm2712_[cd]0_aon_gpio_pin_funcs struct via this +32 offset as the
'pin' index in pc->pin_funcs[pin].funcs[] will result in OOB access. KASAN should
report that if you 'cat pins' in aon pin controller.

One way would be to refactor the code in order to avoid this hole, but I
won't pretend this.
The other way is just add the missing SGPIO entries in bcm2712_[cd]0_aon_gpio_pin_funcs
(mind the +32 offset, a new macro is probably needed).
You can find the functions for SGPIO pins declared in downstream driver, see file
drivers/pinctrl/bcm/pinctrl-bcm2712.c from rpi-6.12.y branch (later branches
already have the upstream driver which is missing the SGPIO functions entirely).
I've posted here the relevant data copied from downstream for your convenience,
please rearrange accordingly:

static const struct bcm2712_pin_funcs bcm2712_c0_aon_sgpio_pin_funcs[] = {
        PIN(0, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
        PIN(1, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
        PIN(2, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c4, ctl_hdmi_5v, _, _, _),
        PIN(3, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c4, _, _, _, _),
        PIN(4, avs_pmu_bsc, bsc_m2, vc_i2c5, ctl_hdmi_5v, _, _, _, _),
        PIN(5, avs_pmu_bsc, bsc_m2, vc_i2c5, _, _, _, _, _),
};

static const struct bcm2712_pin_funcs bcm2712_d0_aon_sgpio_pin_funcs[] = {
        PIN(0, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
        PIN(1, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
        PIN(2, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c0, ctl_hdmi_5v, _, _, _),
        PIN(3, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c0, _, _, _, _),
        PIN(4, avs_pmu_bsc, bsc_m2, vc_i2c3, ctl_hdmi_5v, _, _, _, _),
        PIN(5, avs_pmu_bsc, bsc_m2, vc_i2c3, _, _, _, _, _),
};

In case you don't want to fix this, you will still have a Reviewed-by from me,
and I'll take care of uploading the fix in a subsequent patch.

Many thanks,
Andrea

> 
> Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>
> ---
>  drivers/pinctrl/bcm/pinctrl-brcmstb.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb.c b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> index f46b27155c3c..2b942ca7196b 100644
> --- a/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> +++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> @@ -66,7 +66,16 @@ static unsigned int brcmstb_pinctrl_fsel_get(struct brcmstb_pinctrl *pc,
>  
>  	val = readl(pc->base + BIT_TO_REG(bit));
>  	fsel = (val >> BIT_TO_SHIFT(bit)) & pc->pin_funcs[pin].func_mask;
> -	func = pc->pin_funcs[pin].funcs[fsel];
> +
> +	if (!fsel)
> +		return pc->func_gpio;
> +
> +	if (fsel > pc->pin_funcs[pin].n_funcs) {
> +		dev_warn(pc->dev, "invalid fsel %d for pin %u\n", fsel, pin);
> +		return pc->func_gpio;
> +	}
> +
> +	func = pc->pin_funcs[pin].funcs[fsel - 1];
>  
>  	if (func >= pc->func_count)
>  		func = fsel;
> -- 
> 2.34.1
> 
