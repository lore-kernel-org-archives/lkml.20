Received: from mta0.migadu.com (out-32.mta0.migadu.com [91.218.175.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D03F4A8FCD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486097; cv=none; b=fScRK17CLKMC/2zY0Nmv1NMxdKu/0XYLhoYogHqgJsN9Jl1rCbpyeaoCm6+ocGDyPFeQfTcECmdeacRoCb2Xgh1M+v0s2las6EvHRdI8sdlBELq1lSIdj5jqucoNVBVdZySJ5GZuZ64lzvQFZw+a6xyphsDG1GVj0uqs59JeGq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486097; c=relaxed/simple;
	bh=seZKkNZqkA1n+JFBn6WE809ZUioCrb4l3ZQsXTwS4L0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cuwmifLRoASHc54ZgyjAEAU+ZRbC9+oTyEPRaGwAAOANhQZyvrDXnGeyJpQ7ufd3eglzyfWjo7bSYK8kd1JZjp1+obFGNALXdmMYMjb1j97HbrwBYdI4PoC4C5i+L4zyj61tY5oXbha6MldpYZfAzX33MH8KgRm8B0mZidGaWxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=agLNacPa; arc=none smtp.client-ip=91.218.175.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="agLNacPa"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=seZKkNZqkA1n+JFBn6WE809ZUioCrb4l3ZQsXTwS4L0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789486092; v=1; x=1790090892;
 b=agLNacPaUNnZ9IWLNmEKnMLGrl9OyKJ0RPt+OtAPpXsKYcYIX8sZXZM7mVVb9GXnl+N2CU/Y
 9rs0uEwfvCwSS33szGaaNEBY3RyQbjXLpXs3FvppHrVbjicv3pcTZlYDdi2XHmmj7GFvrWGa8aK
 zmdNyPJf8UvSKVyvLaegPT+M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2cb6b7be7d3e88a8;
	Tue, 15 Sep 2026 15:28:12 +0000
X-Mizu-Trace-ID: 2cb6b7be7d3e88a8
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so1284e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:28:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAGoOqgxKr0FESC4GGY0crAbL/Gn9L94e45WGqadvdk5D+MQgM8KHcb/L4y5BAsRhZYqlrW+U5uMGej20=@vger.kernel.org
X-Gm-Message-State: AFuF++lrb0Jnwc849JenLwD/Fj46FDwA4ubcoHlvWa5hXGXvO9IdKjyz
	sU+vksjta0RHD2UaUXfWzpWGLUcLVEqie4DlfQx/SeG/2DobUjDbcaa9C5bj/oJ97pyvigyNNhF
	2vDE5PU7SL/au2+i5wJ+2B03m7qJhGIl3FVMHALvu
X-Received: by 2002:a05:6512:2341:b0:5b4:9dba:7403 with SMTP id
 2adb3069b0e04-5b8b3201e59mr131289e87.13.1789486087447; Tue, 15 Sep 2026
 08:28:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com> <20260807164322.2970811-10-sebastianene@google.com>
In-Reply-To: <20260807164322.2970811-10-sebastianene@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 16:27:31 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzeCib1J2fyKM42GW5rgKQEE9_Dox_tGA5YJux0YoY5rg@mail.gmail.com>
X-Gm-Features: AcwNN1WkkAN_-WeQ6aFBf7fnAFZAi-s925Hdj_6AYFNinV0IdRsiozOwPKsbvOA
Message-ID: <CA+EHjTzeCib1J2fyKM42GW5rgKQEE9_Dox_tGA5YJux0YoY5rg@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] KVM: arm64: Trap & emulate the ITS MAPD command
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com, 
	maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org, 
	kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, seiden@linux.ibm.com, 
	smostafa@google.com, tglx@kernel.org, vdonnefort@google.com, 
	vladimir.murzin@arm.com, yuzenghui@huawei.com, zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Sebastian,

The MAPD emulation is the right idea, but there's a fair bit to fix.
The main ones:

On Fri, Aug 07, 2026 at 04:43:18PM +0000, Sebastian Ene wrote:

[...]

> +static int get_num_itt_pages(struct its_priv_state *its, u8 num_bits)
> +{
[...]
> +        return PAGE_ALIGN(sz) >> PAGE_SHIFT;
> +}

This needs the ITT's intra-page offset. itt_addr is only 256-byte
aligned (GENMASK(51, 8)), so PAGE_ALIGN(sz) undercounts by a page when
the ITT starts mid-page, and track_pfn() then leaves the tail page
unpinned for the host to repurpose before a MAPTI.
PAGE_ALIGN((itt_addr & ~PAGE_MASK) + sz) >> PAGE_SHIFT. (Sashiko)

> +        new_entry = snapshot_table[new_entry_index];
> +        prev_entry = original_table[new_entry_index];
> +        if (!((new_entry ^ prev_entry) & GITS_BASER_VALID))
> +                return 0;
> +
> +        if (rollback)
> +                new_entry = new_entry ^ GITS_BASER_VALID;
[...]
> +        original_table[new_entry_index] = new_entry;

The rollback here never runs. The forward pass ends with
original_table[idx] = new_entry, so on rollback the guard above sees
snapshot and original with the same valid bit and returns before the
flip. A failed MAPD then never gives the L2 back, and original stays
mapped. (Sashiko)

> +        if (new_entry & GITS_BASER_VALID)
> +                ret = __pkvm_host_donate_hyp(hyp_phys_to_pfn(new_entry & PHYS_MASK), table->psz >> PAGE_SHIFT);

Could the L2 address be checked psz-aligned first?
hyp_phys_to_pfn(new_entry & PHYS_MASK) rounds down to a page, but the
ITS uses the full address copied into original, so an unaligned entry
runs the ITS into the next, undonated page. (Sashiko)

> +                        } else {
> +                                return hyp_pin_shared_mem(virt, virt + PAGE_SIZE);
> +                        }

A duplicate MAPD for the same device and pfn pins again here, so the
refcount climbs with no new slot and track_pfn_remove()'s single unpin
can't free the page. (Sashiko)

> +                        if (ret == -EBUSY)
> +                                return 0;
[...]
> +        return -EINVAL;

Two things in track_pfn_remove(). The -EBUSY return skips the memset
that frees the dte_entry slot, so the slot leaks. And the trailing
-EINVAL, for a V=0 unmap of an ITT that isn't tracked, propagates up
and stalls the queue, where a legal unmap shouldn't. (Sashiko)

> +        ret = check_table_update(its, device_id, GITS_BASER_TYPE_DEVICE, rollback);
> +        if (ret)
> +                return ret;
> +
> +        return track_pfn(its, device_id, itt_pfn, num_pages, remove);

If track_pfn() fails after check_table_update() donated the L2,
nothing undoes the donation: process_cmd()'s forward-failure path in
cwriter_write() just returns, with no rollback. (Sashiko)

The snapshot-L1 TOCTOU during rollback (another host CPU can rewrite
it while this one holds its_lock in EL2) and the old-ITT leak on a
re-MAPD are real too. (Sashiko)

Cheers,
/fuad
