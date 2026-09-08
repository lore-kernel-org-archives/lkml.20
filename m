Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1603E5437D4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872233; cv=none; b=SX/uMfjFw+1OMpgCNvJ+ZTbGE80RLB/ns3iiVjxWyS74m3hm/xdsJdJiIHni4ES+gtuhjbsZ/CFmpcVM1mYJmX4GdQfY6Gi53g77WjOTAlTpu0kURce8xVgJMJG3QVrYMHG54puAXUldtJHHhUjtdfk7pkZz2wcWeeesS7ajqlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872233; c=relaxed/simple;
	bh=gyHTh4NGguywImP87mr4XfIknTSrases36hyKFw66hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qi1dHzltsXfY4wh6pZJVeKelEgjiHhGbDqTFKmiJcz4HlD8Mp7cZso8iYgoC/PF75xuflLUMEUgbVXWl+pc7ZEIjUyidSUwK4IQVHD7iSN8LZeaa2MFKMZ8VlPROtx1fPZU4BVLGBeXG1Hjth7L9D5YpJE1tY2Feho7HxOaSB6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P4OPP6PY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MIq88W+K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P4OPP6PY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MIq88W+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788872229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xism0p7odqr7Sscph4oNHgGiSSlpH6A34QvGL/UHI+s=;
	b=P4OPP6PYLJeBgyV3Eze4a1Uk9R5QqxDs+Ubpr12Lgj6evJLft20MWkVnXYCloZqQVjUjU/
	yqdgbZ5XxAYjATF+7N1tl/+WMjC+xUI3DyGWFWio2j0FpW5HoUfVvZ3iYWtPbWmXKTD4Vw
	fHxbOzhkHsaRjjyOlCZIRagpmR3BX7M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-0nbsLunZPVan5ZJBFnoWFw-1; Tue, 08 Sep 2026 08:57:07 -0400
X-MC-Unique: 0nbsLunZPVan5ZJBFnoWFw-1
X-Mimecast-MFC-AGG-ID: 0nbsLunZPVan5ZJBFnoWFw_1788872227
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49cc954a3edso36826165e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788872227; x=1789477027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xism0p7odqr7Sscph4oNHgGiSSlpH6A34QvGL/UHI+s=;
        b=MIq88W+KiEKt8TTAJ9Q0fM7YXbon3PadavPSwDzyVMBjsSTdkY8I62jLW3IDvF2tso
         fSHH5nhiykfJdVZz0ztBOA9MZVCrx6af4QLR7VHBz/IaEnDNzVj96zmnl7LNRsfh4+A6
         J+9QlGrCRZYDNkczN/MNV5c0Yo+Dyp91p+beIrB8ydpcsbNB10TLWTAH51lufcGEcjT5
         XxJtfFkMQylp31BYIbOkPrGMzRiyl+MeimET4Y5RgyvLtqtjVZT/q2if/TMHRTnW06Jt
         zr5lt8bTBH7Bg3fL4B6C/fjuCj1raNgh/eAkgMMBx/H9jZwD/jQwa3k0d6XadFI6fKIf
         QmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872227; x=1789477027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xism0p7odqr7Sscph4oNHgGiSSlpH6A34QvGL/UHI+s=;
        b=jNxRa9HlHigW3M/NWAo3zVhuEUsYDiwCVo02zfJQf7MUhxIBKlRr9RmWd/YtlCZ846
         ybtKzgeZTOXzdhEyV2G9AcsllYBNQcSfibfwsrmd/IdqcViWqi1eFlsGxueKE9MdgM1F
         HnRP9Lx2dLYnvgGv+G2AmuJJvdUtcy5KIt9nwdY2qm/GVotLd78J5n2uEG4Yvq9swvTr
         5vpMK9jWwRBSrb29GFr5S+RfoxRPANYm6ptEVkUb3O2HWPiy/SgQAkbaRwTfuPtlvkHY
         gvCIpx5JyIokmsWuf8ogmbxpzkfzZNgfQwuPCPcbbqoJJUpV/gBNSDvMRs9NLRwPcV7C
         kPxg==
X-Forwarded-Encrypted: i=1; AKwUvByitCLkjMkNuauOFOonmGiSLAvOnhuspTm3b2d+mF2g61BG5OAUdyVV+vy9SggycV3CiB5/rOTj2P5GOQc=@vger.kernel.org
X-Gm-Message-State: AFuF++lrbP7Jq/Cqv3Ton0A1pQZ+0cg1eDsLNtD5uf4ZzsScQR2RUpSV
	XAXMOebb7Ga5CXz7tjp1nluNu8WafhAE6z6itddWiQYUCI1j/HnYHjN9lCBLgMR6V/Sl/4HvLfK
	2K2fjvhQynaaSaw8E0Gcz1YDLm7NZU8blsTqiYDeH7rXgZBvtTCfxHJdWozmmlS7XRg==
X-Gm-Gg: AYBFou2SFpFXNz499VNVsainBonrsc9cXtLpJFz93yKyXdGoDjNbusLjSjeD9G6ca4n
	bB4DcZsTxFuJfWbvjm5PUbeVx2/vK/+qMbtNbOZ8i3KCNT9l/bfF8c6TKO8Nt3vqV31QgJuJ+TW
	i8UXXRuoJewFfxNfQhYDm7QtS5Uy9BJkOpJeCIL9HBtB3+HJaLxDOthbWfAq/3bPTgR9oamxAgb
	0k03d7dWbEBehiqXbNFRA3PnFPepXIdO3G7h+ToRq+x8OgHTGUQMYTOXnSzv7GzM/bFGeixgWGm
	phIFEKnc7arYYtIA9EDVlfkkh9POLGSwoIj7FYuwiQro7XYTx6EHH7BBePRU2pvd1RkB7frtxVp
	YEMhDY8ncs0e++VXnyqWhzvq7T783Wn0wIZfukEPGHBO5B6PhExg4FlJBie4+3mG3ZqzF+NiyDw
	==
X-Received: by 2002:a05:600c:3b07:b0:49c:fa20:cbfb with SMTP id 5b1f17b1804b1-49cfa20cd04mr266648325e9.18.1788872226578;
        Tue, 08 Sep 2026 05:57:06 -0700 (PDT)
X-Received: by 2002:a05:600c:3b07:b0:49c:fa20:cbfb with SMTP id 5b1f17b1804b1-49cfa20cd04mr266647645e9.18.1788872226004;
        Tue, 08 Sep 2026 05:57:06 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm35101103f8f.23.2026.09.08.05.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:57:05 -0700 (PDT)
Message-ID: <ee4a593f-93b3-4d89-885c-bdf101212411@redhat.com>
Date: Tue, 8 Sep 2026 14:57:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 00/15] dpll: add SiTime SiT9531x DPLL clock
 driver
To: Ali Rouhi <arouhi@sitime.com>
Cc: "vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
 "arkadiusz.kubalewski@intel.com" <arkadiusz.kubalewski@intel.com>,
 "ivecera@redhat.com" <ivecera@redhat.com>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "cjubran@nvidia.com" <cjubran@nvidia.com>,
 "Oleg.Zadorozhnyi@devoxsoftware.com" <Oleg.Zadorozhnyi@devoxsoftware.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jiri@resnulli.us" <jiri@resnulli.us>
References: <20260902214030.20955-1-arouhi@sitime.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260902214030.20955-1-arouhi@sitime.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 11:40 PM, Ali Rouhi wrote:
> This series adds a DPLL subsystem driver for the SiTime SiT95316 and
> SiT95317 I2C clock generators. Each device integrates four PLLs with
> automatic reference selection and on-chip TDC phase-offset measurement,
> and is used for synchronization in telecom, networking, and data-center
> timing.
> 
> The series contains the device-tree binding, the driver under
> drivers/dpll/sit9531x/, and the MAINTAINERS entry.
> 
> v1: https://lore.kernel.org/netdev/20260511211143.19792-1-arouhi@sitime.com/
> v2: https://lore.kernel.org/netdev/20260520191943.73938-1-arouhi@sitime.com/
> v3: https://lore.kernel.org/netdev/20260731180951.65725-1-arouhi@sitime.com/
> v4: https://lore.kernel.org/netdev/20260806232439.27551-1-arouhi@sitime.com/
> v5: https://lore.kernel.org/netdev/20260810230439.22866-1-arouhi@sitime.com/
> v6: https://lore.kernel.org/netdev/20260812175337.18155-1-arouhi@sitime.com/
> v7: https://lore.kernel.org/netdev/20260815221919.64226-1-arouhi@sitime.com/
> 
> The driver was a single 5.6k-line patch through v7. Vadim and Ivan asked
> for it to be split into logical parts, with the first zl3073x series as
> the model, so v8 introduces it feature by feature instead:
> 
>   1-2   bindings: vendor prefix, then the device schema
>   3     basic support: paged regmap, variant detection, probe
>   4     DPLL types and pin properties from system firmware
>   5     register the DPLL devices and pins, and keep their state
>   6     input pin state on a DPLL, with the pin-state contract
>   7     input pin priority
>   8     pin frequency, both directions
>   9     output pin state (mute)
>   10    output phase adjust
>   11    esync on outputs
>   12    phase offset through the TDC
>   13    fractional frequency offset of the selected reference
>   14    the inter-PLL sync net as a pair of pins
>   15    optional device-tree overrides for two board facts
> 
> The two bindings patches come first, so the driver never matches on a
> compatible string before the schema that describes it is in the tree.
> 
> Each of the thirteen driver patches was built on its own, with W=1 on
> x86_64 and i386, and is sparse clean. Each one also links: no patch
> calls something that a later patch introduces, so the module builds at
> every step of the series and a bisect cannot land on a tree that fails
> to compile.
> 
> The split makes no functional change of its own. The tree this series
> ends at compiles to objects byte-identical to the tree the single patch
> produced once the fixes below are applied to it.
> 
> Changes in v8:
> 
>   - Split the driver patch into the thirteen patches listed above.
> 
>   - Advertise automatic mode only. v7 mapped DPLL_MODE_MANUAL onto the
>     chip's free-run bit and then refused DPLL_PIN_STATE_CONNECTED on
>     input pins, so it offered the mode whose one purpose is manual
>     selection and refused the only request that mode exists for.
>     Free-run selects no input at all, so on this device it is a lock
>     state, not a selection mode. v8 advertises AUTOMATIC only and
>     refuses anything else from .mode_set(), which now clears the outer
>     loop disable bit so a PLL left free-running by the loaded
>     configuration returns to selecting from the priority table.
>     Free-run is reported through lock status as UNLOCKED.
> 
>     The device can also pin one reference while the loop keeps running,
>     so real MANUAL support is possible later. It is left out here
>     because the mode mapping becomes ABI once merged, and it belongs in
>     the same series as the userspace that needs it rather than being
>     approximated now.
> 
>   - State the pin-state contract once, above the pin ops, and let the
>     two selection-role pins share one implementation of it. The driver
>     had five ops tables and five hand-written encodings of the same
>     state machine, and every review round has found another place where
>     two of them disagreed. This closes several findings at once:
>     CONNECTED reported while the outer loop was disabled, membership
>     taken from the shared-receiver refcount rather than from the
>     priority table, SELECTABLE on an INTSYNC destination userspace had
>     disconnected, .prio_set() inserting a source that was never in the
>     table, and .prio_remove() returning 0 when the disconnect would
>     have emptied it. The last two are now -EINVAL and -EBUSY.
> 
>   - Report LOCKED_HO_ACQ only once the holdover estimate is valid. It
>     was asserted whenever the loop was locked, without reading the bit
>     that says the device has accumulated a frequency estimate good
>     enough to fall back on. That bit is distinct from the one that says
>     the PLL has already switched over to holdover.
> 
>   - Fix the 32-bit build. The output phase adjust reduced a negative
>     request modulo the output period with % on two u64 values, leaving
>     the module with an undefined __umoddi3; it now uses div64_u64_rem(),
>     which the rest of the arithmetic there already uses. Reported by
>     Jakub Kicinski.
> 
>   - Correct the register model comment: the page selector is at 0xFF and
>     a page holds 256 registers, as the definitions right below the
>     comment already said. Reported by Ivan Vecera.
> 
>   - Type ordinary clock outputs as DPLL_PIN_TYPE_EXT instead of
>     DPLL_PIN_TYPE_GNSS, which claimed a GNSS-disciplined timing port.
>     Advertise a phase-adjust range on outputs only, and drop the input
>     pins' .phase_adjust_get with it: inputs have no .phase_adjust_set,
>     so a non-zero range promised something every set would refuse.
> 
>   - Always issue the loop lock in the programming commit, so a transient
>     I2C error cannot leave the chip in PRG_CMD with its loops open. Undo
>     the global enable when the INTSYNC enable fails partway. Take
>     multiop_lock before testing the selected reference in the frequency
>     offset getter, as the sibling phase-offset getter already does.
> 
>   - Latch every read of the chip's debug block the way the phase read
>     does. That block returns a sample of an internal measurement tap,
>     selected by a read code and latched by reading a trigger register.
>     The generic helper read the trigger once where the phase path reads
>     it three times, and a single read returns the previous latch. On
>     hardware this showed as a frequency offset that would not move while
>     a phase measurement of the same PLL tracked a temperature step
>     cleanly.
> 
>   - Report which PLLs came up and which EEPROM profile was loaded, and
>     warn when a PLL drives outputs without having reached its active
>     state, or when the profile's stored and computed CRCs disagree. In
>     both cases every register still reads back a plausible value, so
>     nothing about the failure is visible until the measurements come out
>     wrong.
> 
>   - Say what the phase offset getter measures, next to the callback: the
>     loop's residual error sampled with the loop closed, which is the
>     quantity the ABI asks for -- not the vendor's open-loop
>     phase-difference procedure, which would need the digital loop filter
>     frozen and would leave the PLL undisciplined until something
>     released it. A netlink read must not do that.
> 
>   - Drop fifteen register definitions that have never had a caller.
>     Eleven describe that open-loop sequence and the PLL restart path,
>     neither of which the driver performs. The other four -- the PLL page
>     macro and the three DIVN2 fields -- had no user in any patch of the
>     split, so there was no honest patch to introduce them in. Each will
>     come back with its first user.
> 
>   - Binding: put the example VCO frequency inside a band. 6251500000 sat
>     in the gap between the device's two bands, which the property's own
>     description rules out; it is now 6900000000, which a shipping
>     profile on our SiT95316 board runs. This is the only change to the
>     binding since v6 -- the property and its description are unchanged
>     -- so Krzysztof's Reviewed-by is carried across it.
> 
> The AI review's use-after-free report on the pin properties remains a
> false positive: dpll_pin_alloc() calls dpll_pin_prop_dup(), which copies
> freq_supported with kmemdup() and the labels with kstrdup(), so the core
> owns its copies and the driver has to free its own.
Clashiko had several comments, and some of them definitely look real.
Please note that you are supposed to handle such comments proactively,
see commit c82ff94592fb68f529afe63ca7f5ddb7dae4ba83

/P

