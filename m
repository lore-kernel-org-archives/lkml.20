Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907674;
	b=huEkDgs8hBmiCbcAQPQX4wGpEvz/kNPaE8slHN/lhDTy4GAyteibKZgf3Q22qlB4nToz
	 z2tLxalSZ1bPt/CVKcg0jbzmLvinjG2ixKma6WeWVB05k0lSzevyoLpQZ1J1BqiyZ19qc
	 yAOv0HdYcL4aSudhLR4M77zueisoiBTCI98oca3JEF31/RK4/hGLacp/Tf3yrTfaJC+WS
	 Os+GMXRd1BtoviwXxYbaL537nRAFZF/+aYWmaefeEAexUoUDnQ6OGS1Le+3cB41Fjly8v
	 UcIoe6sMUy/PkQzWeKDBklWiWPnKCEG2vsT31gHHQ5B6MZW1SmL8DF261ToA9KRatww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907674;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=M3vDB+5rl54xRwlu5umW2bDXJdtwD3HGmENV54NS6J0=;
	b=QOz1t3k+XFhx0ubwAuqh8Sn6UeeFWMZvpGH9imY1PSsS19Bs7D7lrjp0H8DZo2u+rcYm
	 eobUA5RkbaVMtSmSJPVrde1LYI/pWxDORPLeA0VyohDaqmq+7W7b4cssKX+o8zlJWNU04
	 qrz/h9RMO+B9ZTBONnrMqP0tnC3RM0dItNg3kbhf1hmvdvtNRB4Rh7Hw+khlaDhIVw0pZ
	 fIcCRCfj1RuMzBwJVkL2Iqgg2yIguqehOHpir/DGKx3Pjpvczd0c4K/qgO9EQTVH8ArVG
	 ZZrtVLr78O4VwJ+A9G5+LnawcdaKoJHXS1j6gREm9RPIygKk4yhgHzjSktGuIO/5kxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DMRWqqIj;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="boCp+FI/";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D53606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66D53606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DMRWqqIj;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=boCp+FI/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794907672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M3vDB+5rl54xRwlu5umW2bDXJdtwD3HGmENV54NS6J0=;
	b=DMRWqqIjr/v+tB4T0uPzDlXWOYI+7iNqiv2aP7GxhmovR3MCSPe3uVAu6P+95eGfLM4sET
	ddBXMICdVybZGoQh583ry5Lb8wtHOxPnirc/8iLJ4pgpcmMcxq/KxwC6R9p9DikVnm4Xia
	swLr3Sg1orsvllZd/dVE0bxMiCxRZ6s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-HaG97DplMwGsW1yXhMSIIQ-1; Tue, 17 Nov 2026 04:27:50 -0500
X-MC-Unique: HaG97DplMwGsW1yXhMSIIQ-1
X-Mimecast-MFC-AGG-ID: HaG97DplMwGsW1yXhMSIIQ_1794907669
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a359b714f8so22861875e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794907669; x=1795512469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3vDB+5rl54xRwlu5umW2bDXJdtwD3HGmENV54NS6J0=;
        b=boCp+FI/hDAZAkfjzO9KQ/m1kfZyxdknrunTG9o0PUuvqOF5eqrCLzZXvIYE79kqrJ
         hXxqP5w9TjeDEhwbk0u21UPsa9ztIHUo2xj2ZLKZK91LiEMQF812boTglOW4a9yjeoZH
         MZlQliXexnGRr4BwsUv0iC4rA/XLAyH4ou4p/WwYWJHjSkPAAW1ZMAngWrr6JPTo3AkU
         XGVs2nS2Ntmuu68CLdKIROJXJ3eyt8EhWL3oJLYFaf26gP2iWUsxkkZcVZOvnEVBvoQS
         Jb2AKzIAkIGtsw9zVmaOwy1Etez1sYS/YqGUpcj6rFqzR+sc+w6jBls9UKyuoKUxbFva
         PPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907669; x=1795512469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3vDB+5rl54xRwlu5umW2bDXJdtwD3HGmENV54NS6J0=;
        b=SMqtnC3xBh+ZKcH3zF0Zqn95N9QgG3kuqJKppuNVQg4j7265OjtaZq3ggHtPfNlr02
         KOEiAkLdbxPcDDeRQRKpn0aIYLyQA/tbWtdy848GAWzVfLfvQkbv2TfYgS7K1s18lB0v
         oNezeGo5sdjGOvKFC/L/zXlowUSU/B9QBKx76d9ugDiSZZreoT2fQozjbTyiBKW/b71j
         yrMjp9StG2EC3L/wN4FW8JnQfHWpISlPpPO7W3TcXuffzR9GaCU/HMrmlBXaWTTKZMOl
         rQW3cu1qnF1tOueXZ4gSI6lLatXEoCF2Erkzc21lSjRkUFhCNs7BPTxLBRa8jNAl8z/y
         MpMQ==
X-Forwarded-Encrypted: i=1; AL+hErEK8LXrc5ZXZogzbpCOGI7s1NPw2WxHYPRj6DWLdrv6SDqIjNEg4fyDR1c0iV/nFPmqQcPsYsjp1zKmOsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+843AZGkMnRwGtXCS19Ob9wptcOUObKGHIl0KhD0bijLKvbE/7
	FZFtlekisU+Yn0NLIyqfWRjK9+yc4gSNgj3dc8+7TwphE39FL58D/LQPY0BxyJ7xpw61xeSUUyM
	zjNX9hYlu3Msz397/g70dwDd5P3gkFCwAkaC/SRtOkQZX2I9tdXhx+lnpCuvpwX0SGw==
X-Gm-Gg: AYBFou3Rhdc4b1ZXKMykpF0oM1mad/zai7t7NVL4X6i6stGMUpMULwQxdMa4x7RetgL
	wwa6+Whytepn4IfcmYr0IWP4yy1BiUoS7nAtUT+GHdVRPWqwN0oNwp3mBxBNPDK6tUmIjELLeTA
	jT257Bv7i41Hz/ch+QViMm4Ix+kc7akJZNqI6SW1AJORwWRD25aFDKaZjJU0nHSH2gY6+wD1LTf
	KqjHuD36pjSuG713xe1UwoiVtvgl/h0RVc/BySUUVL4eVnOYpx4CV2Nz1ypydmp09TbZBWzrnUh
	1DCFqLnye5r/pFAgoaQ7969SV+9ictqRiO+/cVGQtKXDpOShNjbLzhopqFAqPW7pccz/A0nlKx/
	Gkp1EtEgXV4G3t5kypW1rxdHfs4Rvnq+3psI6czwlvPOVm8c93FDxbXubP5YyAI1s9TifVecWE5
	VroPZRxID3pQWPod3b7XOjmvtDdMVg/dL4ptkcFJgt816O
X-Received: by 2002:a05:600c:6092:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb55a44be7mr262648895e9.8.1794907669335;
        Tue, 17 Nov 2026 01:27:49 -0800 (PST)
X-Received: by 2002:a05:600c:6092:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb55a44be7mr262648315e9.8.1794907668849;
        Tue, 17 Nov 2026 01:27:48 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm190909215e9.3.2026.11.17.01.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:27:48 -0800 (PST)
Message-ID: <1fdde915-0e1f-4ffe-bd62-61897fca958e@redhat.com>
Date: Tue, 17 Nov 2026 10:27:46 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v15 00/13] dpll: add SiTime SiT9531x DPLL clock
 driver
To: Ali Rouhi <arouhi@sitime.com>
Cc: "vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
 "arkadiusz.kubalewski@intel.com" <arkadiusz.kubalewski@intel.com>,
 "ivecera@redhat.com" <ivecera@redhat.com>, "kuba@kernel.org"
 <kuba@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "cjubran@nvidia.com" <cjubran@nvidia.com>,
 "Oleg.Zadorozhnyi@devoxsoftware.com" <Oleg.Zadorozhnyi@devoxsoftware.com>,
 "prabhakar.mahadev-lad.rj@bp.renesas.com"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jiri@resnulli.us" <jiri@resnulli.us>
References: <20261110202607.55744-1-arouhi@sitime.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261110202607.55744-1-arouhi@sitime.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/26 21:26, Ali Rouhi wrote:
> This series adds a DPLL subsystem driver for the SiTime SiT95316 and
> SiT95317 I2C clock generators. Each device integrates four PLLs with
> automatic reference selection and on-chip TDC phase-offset measurement,
> and is used for synchronization in telecom, networking, and data-center
> timing.
> 
> Patch 1 changes the DPLL core: phase_offset_get and phase_adjust_get
> may return -ENODATA, and the core then leaves the attribute out of the
> pin message instead of failing the dump. Patches 11 and 12 use it. The
> rest is the device-tree binding, the driver under
> drivers/dpll/sit9531x/, and the MAINTAINERS entry.
> 
> v1: https://lore.kernel.org/netdev/20260511211143.19792-1-arouhi@sitime.com/
> v2: https://lore.kernel.org/netdev/20260520191943.73938-1-arouhi@sitime.com/
> v3: https://lore.kernel.org/netdev/20260731180951.65725-1-arouhi@sitime.com/
> v4: https://lore.kernel.org/netdev/20260806232439.27551-1-arouhi@sitime.com/
> v5: https://lore.kernel.org/netdev/20260810230439.22866-1-arouhi@sitime.com/
> v6: https://lore.kernel.org/netdev/20260812175337.18155-1-arouhi@sitime.com/
> v7: https://lore.kernel.org/netdev/20260815221919.64226-1-arouhi@sitime.com/
> v8: https://lore.kernel.org/netdev/20260902214030.20955-1-arouhi@sitime.com/
> v9: https://lore.kernel.org/netdev/20260915000015.80480-1-arouhi@sitime.com/
> v10: https://lore.kernel.org/netdev/20260921201108.42676-1-arouhi@sitime.com/
> v11: https://lore.kernel.org/netdev/20260930233714.87679-1-arouhi@sitime.com/
> v12: https://lore.kernel.org/netdev/20261009183151.78497-1-arouhi@sitime.com/
> v13: https://lore.kernel.org/netdev/20261013224131.27149-1-arouhi@sitime.com/
> v14: https://lore.kernel.org/netdev/20261016005823.13690-1-arouhi@sitime.com/
> 
> Most of the changes in v15 answer the netdev AI reviewer's findings on
> v14 and further runs of the same reviewer on drafts of this revision.
> Each fix is folded into the patch that introduces the code. The design
> section below states once the decisions those findings kept returning
> to. One v14 finding doesn't hold: the DIVN fraction read is not
> byte-reversed, because the part stores the fraction least significant
> byte first, and the kernel-doc of sit9531x_divn_static() now says so.
> 
> Rob Herring's Reviewed-by on the binding is carried on patch 3. One
> sentence of its description changed since v14: it now lists the die
> outputs the SiT95317 bonds out and the names its datasheet gives them.
> Ivan Vecera's Reviewed-by on v14 patches 4, 6, 7, 9 and 11 is not
> carried, since each of those patches changed.
> 
> Oleg and I used LLM coding assistants to write parts of the driver code
> and of the commit messages, and reviewed and revised what they
> produced. v14 marked each such patch with Assisted-by: LLM; v15 drops
> the tag following commit 1e035297ffda ("docs: remove Assisted-by
> references").
> 
>    1     dpll core: omit phase attributes a driver has no value for
>    2     bindings: vendor prefix
>    3     bindings: the device schema
>    4     basic support: paged regmap, variant detection, probe
>    5     DPLL types and pin properties from system firmware
>    6     register the DPLL devices and pins, and keep their state
>    7     input pin state and operational state on a DPLL
>    8     input pin priority
>    9     pin frequency, both directions
>    10    output pin state (mute)
>    11    output phase adjust
>    12    phase offset through the TDC
>    13    the inter-PLL sync line as a pair of pins
> 
> The two bindings patches come before the driver, so the driver never
> matches on a compatible string before the schema that describes it is
> in the tree.
> 
> Every patch builds with only the earlier patches applied: no patch
> calls something a later patch introduces. This was re-checked for this
> posting patch by patch with W=1 and with sparse, and kernel-doc -Wall
> is clean on every driver patch. checkpatch --strict at 80 columns is
> clean except for the "does MAINTAINERS need updating?" hint on patches
> 5 and 6, which add files under drivers/dpll/sit9531x/; patch 4 already
> covers that directory with an F: entry.
> 
> Design decisions and hardware assumptions
> =========================================
> 
> Configuration ownership. The part runs a configuration it loaded before
> the driver binds, from efuse or from a blob the board applies. The
> driver reads that configuration and never resets the part, rewrites
> loop-filter coefficients or touches a register the configurator sets.
> What it changes at runtime is what the DPLL API asks it to change:
> input selection and priorities, output enables, rates and delays, the
> inter-PLL sync source. Where the loaded configuration puts a PLL
> outside what the API can express, the driver reports what the part
> does and withholds the control rather than reconfiguring the part:
> a PLL in manual input select is reported in MANUAL mode with no
> selection or priority setters; a half-armed fast lock registers without
> the attribute. The driver does not write the part at probe or resume,
> with one exception below.
> 
> Automatic selection. A PLL whose profile arbitrates by priority is
> reported AUTOMATIC: the part picks among the listed inputs by the
> priorities it is given, and the driver keeps the table and the active
> selection register in step with the priorities it was asked for. When
> a PLL that lost every input sits in holdover and an input returns, the
> driver doesn't wait for the part: it re-selects the PLL when an input
> edge is sampled, and once on the first sample after probe or resume,
> where no edge could have been seen. Whether a PLL returns to a
> higher-priority input that recovers is the profile's REVERT_EN; the
> DPLL API has no attribute for revertive selection and no driver
> exposes its setting.
> 
> Qualification. The driver selects on loss of signal and reports ACTIVE
> from it. The frequency-drift monitors are reported as a qualification
> failure on an input the PLL is not on; an input the part keeps tracking
> while its drift flag is set is reported as the part reports it.
> 
> Register access. The part shows one 256-byte page at a time, selected
> through the register at offset 0xFF of every page and latched on the
> STOP of that write. The regmap is that flat window; the driver selects
> the page itself under its own lock, remembers the page it selected,
> forgets it on any failed transfer and on resume, and re-selects on the
> next access. No other regmap user, debugfs included, can move the
> page. The I2C_SLAVE_FORCE path of i2c-dev is the
> documented debugging override and is not defended against.
> 
> Clocks and supplies. The XO is taken through
> devm_clk_get_optional_enabled() for its rate and to hold a reference,
> so clk_disable_unused() cannot gate an XO the loaded configuration runs
> from; the enable is not what starts the XO, and the reference goes back
> to the provider on unbind or a failed probe. A clock or a rail the part
> must keep without a driver bound is the provider's property
> (CLK_IS_CRITICAL, regulator-always-on), as for any part that is
> configured before Linux runs.
> 
> VCO rate. The VCO rate is derived as Fref * DIVN, the XO rate (with the
> doubler) times the PLL page's static divider, which is how the register
> map defines the inner loop; the binding describes the XO and no other
> reference. The estimate is bounded: a product outside the PLL's VCO
> band is reported once and refuses every frequency request, and inside
> the band a rate is programmed only when the estimated Fvco is a whole
> multiple of it.
> 
> Output pads. The driver reads the pad-enable bits only to tell a CMOS
> output from a differential one, and mutes a CMOS output by forcing both
> pads off. It reports an output muted when both pads are forced off, the
> only state its own mute produces; a profile that forces one pad is
> reported as driven. The debug key gates the Force registers only; the
> directive registers that commit a programming sequence are written
> without it, as the configurator's scripts do.
> 
> Phase offset. The measurement compares the selected input against a
> physical output the PLL drives, as the documented procedure does, so a
> PLL with no routed, enabled output reports no phase offset (the
> attribute is omitted). A sample taken while the input disappears is
> rejected when the monitor reports the loss afterwards.
> 
> Notifications. The driver sends again a change notification it could
> not build for a change it made itself (a failed request that moved
> hardware, a read-through that moved a value, the sync-line source). It
> does not retry the notifications the core sends after a successful
> request: dpll_pin_prio_set() and dpll_pin_state_set() discard that
> result for every driver, and a retry in the driver would notify the
> change twice.
> 
> Recovery after a failed write. A sequence that fails part-way leaves
> the part in a state the driver records as pending: a priority table
> not latched, a forced holdover to release, a delay to re-time, an
> output realignment, a debug window to close, a sync-line page half
> written. The poll retries each until the write succeeds; unbind retries
> once more and warns about what is left; resume drops the pending delay
> and realignment, since the registers it re-reads describe the part
> after a suspend that may have reloaded it, and keeps the sync-line
> ownership records until a retry resolves them.
AFAICS none of the AI comments look critical, but the sheer volume of
them is asking for a new revision.

Please note that you should respond to AI reviews: comments should be
acknowledged or disputed. Addressing minor or medium issues could be
postponed, with proper reasoning.

Thanks,

Paolo

