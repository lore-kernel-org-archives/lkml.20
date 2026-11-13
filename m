Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577758;
	b=aMa+xDHExRygBLRaTuEUCjd1fl5Gn7HFwgHMqYPmM6vvmRMFzNxGqA+NivxxWHsWZNSY
	 xM/T2LidXVnGzzY2e93fgGKIKyChVoEb/+zRnnG+GwR1GUxlKINN/VX1SVxEyD5czpIfc
	 mR/WPiIm8wO0LONCsMspoZ5rz8j5KoIGTYVLtrEgy823yGLhRW8urUtaJXPVxGVzXe8Ls
	 TZu4s63svZPKLm1dPv3bFuShSAD8DRXiyJgU77xe9XuUKk6de+OrxB1fRR49KT48xPeF5
	 YgiVe7rVugv1dKbvpanNBLDYj8PETuTJAG7kNgRlPnBYkjFJE58ug+02S+D0PCYUZRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Puay+wpYVMEbOLRsus5utO7vcdPRYNMhn4l2tkGm58A=;
	b=AKqlzYEFyk99L8DOP9w0tiAaLSuYcOfyk+RzefZYQpYPGyqmib1aFl1lLuI1KwYKkLp/
	 L6x3RAPrLWTtonysB7GMtOB9qoxYyXNj3sEDepJL0hXAvS9fgxGo+VqGRvTg6qXKxVWH5
	 ca9tEcuj743COpLhauQo+TptKUAy/raYAm5CtXSh3/YGA1WCY71cWaKfxHatMBUH2g0WG
	 BGFe887hl3qnxpbZjUsslffKhsWz4rL92bQ1iqcVMd6tcNw9lGUTCNU57V4idh8OTxRDa
	 qw4zTJG4ygyZRe/Nd5fw0J0pKcle2aOhtJVm7rPtPU8ggacJYfHhBPEm7J8vO0vI83A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j2WyAc65;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89958606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89958606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j2WyAc65
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so1198079c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794577758; x=1795182558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Puay+wpYVMEbOLRsus5utO7vcdPRYNMhn4l2tkGm58A=;
        b=j2WyAc65HHKXZAtTItIC5JMMjuCVCGvh24lyDPoCV3vQMwTi+DFmIwfD0//Z5d3bxy
         klc9Wq/T/2lESjNQtPg+ZoAnYZ2E4Jihj7aKgXVgYlxtBmmGZzID7ScasvwAUehBK6Ji
         Xmb60E0miUdAXJQ2fr1Dxl5E/twWeuVqr2lvw2K8A4T/sMuEkYQ4Wk8Lyw0oi2v4j5hD
         VKrpghB/FHbs0MZoXZ1D8jhPjb0ANbOn0SYehDI8ivVsxWXjDBTrJSkaMs1h3g9JI1PW
         i3q3kieyyBE9xQJFzORBSWc66R//jd6z6TkNVhspmEbEYuriYjGPHduoZrnvQDdmOokA
         LTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577758; x=1795182558;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Puay+wpYVMEbOLRsus5utO7vcdPRYNMhn4l2tkGm58A=;
        b=GoQ5qq14AufQm9oqLd2HKyWfmuegezma5WalM61ElBTRfoxb2m8xZXf3PVMoryKflz
         bkPXgpLgpf9WoIkguZqR/wpAu9qOklrSS17EbcCMEMQQk6r4Kc9Xsr9GkxvGDa4kKZwN
         xwmcmNSBx7RUpSW5SC0mTa2W7gO1xs/Lpe1U9lel2PMkQFWOmFrKM/FkpEkjI/eXcO+A
         1SqRMDGycfqSnj2XgNleRFoxY4s2Ei4wB+o1JezCs1Z9jJj5Yw853Rsrf38gfEAEREyV
         sNVX9mzVDV1BFYC+3L5nGVZlNRwM8VyA0YAONIbxK6VceFNri9kPFolRvrNec8d1UG8n
         ThkA==
X-Forwarded-Encrypted: i=1; AL+hErGxnh8xZHZuEn6ctH8/Vq61Np9qLdsPmqgEapUjNgwAR+VtrjyXdjd2rYrdWGcYbabhEEGXIa4I0+kXOXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z81jfLwE5tNyC84ZUpvzfBxzkQzx7xWKeNxA8PCjxuX7OHqah92
	UhX68nh93wYcObTUMIARGeZUOg7PEq/+kyxLDuprfD2X/z1WBrevp+8j
X-Gm-Gg: AYBFou2ABuyr0olfknqh2Ykk0PXEJAN4rDNP6upI90JEHSJ+mS6LtgmVn37fCj8Y2OQ
	jPVy/FYXVon5vZlCczHB1VLpJo57IkqwflgfU2xhOZlfPwhn6+OhS4/73WqVUWRTSxr+uPLi9DJ
	J5cmCa0aiWAT6reB6f+I93R6XrQ7HuNRc5JkHkm0OOg665+5dONSWURMDEX7C4EJAiI5/NQiNxQ
	/kgGfqAAktnLmeX1Pau7VAxiOVmRRuSRY4MxGvGxph0RQvITEc6UEAPIey8/9kbX/mom7KJFtMe
	I2X8IHLywL5fHW1e+dis/r0l55loMAFbjYZJG2Fho+72hx5t6eTV+gZNW19vV5kDrHg+5IaHxUG
	Te3QzaJvJPve2oP+Y2cWYUvcaykAIenmYW8PvBsnUwzL9UkuZqjqhanW5IupMmAr9yKMFH3xYaZ
	Bdx1dA6FbQKJXf74kYYfLpJiFGLtL8lB4T2LGskBWr+dsRabR/Gql2/lYtbwAt7OjUQQAZI388f
	yKoHeWXMM2V90Y/EazHXNUoe6xkM6ikgVKkZWvzytd86+nHU6lAPZlbrneVCoau9ft2ygDIcRgA
	EQ08jrmlNNnSiVclB5Gg0iZjcV3PgA==
X-Received: by 2002:a05:693c:88db:20b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-379684ae78cmr2170730eec.38.1794577757517;
        Fri, 13 Nov 2026 05:49:17 -0800 (PST)
Received: from duge-G3-3500 ([183.192.220.187])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm8381252eec.7.2026.11.13.05.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:49:17 -0800 (PST)
Date: Fri, 13 Nov 2026 21:49:04 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <7xzpzkw5qmt3xb3ezo2sii6tnfraetwooh2l6dl4svclvbn43o@uvm7uyhz4bck>
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-3-duge1256@gmail.com>
 <DMO4CP89Q1AA.17HKYA50DLY8L@linux.spacemit.com>
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
In-Reply-To: <DMO4CP89Q1AA.17HKYA50DLY8L@linux.spacemit.com>

On Fri, Nov 06, 2026 at 12:15:54PM +0000, Troy Mitchell wrote:
> On Fri, 6 Nov 2026 14:05:24 +0800, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3
> > eFuse controller. These banks contain temperature calibration
> > parameters and other configuration data.
> The rest of the window holds the root key and the SSK, which is why
> only these two banks are exposed. Please say so here and in a comment
> above k3_efuse_keepouts.

I will add this explanation to the commit message and above
k3_efuse_keepouts.

> 
> > Snapshot the shadow registers with aligned 32-bit reads and expose the
> > data in little-endian order at controller-relative offsets. Serve
> > reads from the snapshot and use keepouts for the remaining register
> > ranges. Keep the AES_WTM clock enabled and its shared reset deasserted
> > while the provider is registered.
> Why keep the clock on? Reads are served from the snapshot and nothing
> touches the hardware after probe.
> 
> Tested on CoM260:
> - clock on only around the snapshot: probe and unbind/bind work, the
>   clock stays off (AES_CLK_RES_CTRL 0x00c30050), same bank 0/7 data.
> - this patch: unbind gates the clock and asserts the reset
>   (0x00c30070 -> 0x00c30040), rebind reads the same data.
> - this patch: 3s of WTM_RST or of clock gating leaves the shadow
>   values and FUSE_READY unchanged.

I will disable the clock after taking the snapshot, before registering
NVMEM. It only needs to be enabled while accessing the hardware in probe.

> 
> [...]
> >
> > +	depends on COMMON_CLK && RESET_CONTROLLER
> Not needed, both APIs have stubs.

I will remove these dependencies.

> 
> [...]
> >
> > +#define K3_EFUSE_REG_SIZE		0x400
> > +#define K3_EFUSE_BANK_SIZE		0x20
> > +#define K3_EFUSE_BANK0_OFFSET	0x104
> > +#define K3_EFUSE_BANK7_OFFSET	0x190
> Nit: the last two are not aligned with the others.

I will align them with the other definitions.

> 
> [...]
> >
> > +	if (resource_size(res) != K3_EFUSE_REG_SIZE ||
> > +	    res->start % sizeof(u32))
> No need to validate DT here. Drop it and use
> devm_platform_ioremap_resource().

I will drop the resource checks and use devm_platform_ioremap_resource().

> 
> [...]
> >
> > +	reset = devm_reset_control_get_shared_deasserted(dev, NULL);
> This asserts the reset on unbind, rmmod and probe failure. The fuse
> data survives, but WTM_RST resets the whole GEU (FUSE_SCLK_DIV_CNTR
> went back to its boot value). The driver does not need the block after
> the snapshot, so use devm_reset_control_get_shared() and only
> deassert it.

I will use devm_reset_control_get_shared() followed by an explicit
reset_control_deassert(), leaving the shared reset deasserted on teardown.

> 
> [...]
> >
> > +		for (i = 0; i < K3_EFUSE_BANK_SIZE; i += sizeof(u32)) {
> [...]
> > +			put_unaligned_le32(val, efuse->data[bank] + i);
> Please poll FUSE_READY (GEU_FUSE_STATUS bit 1, offset 0x184) before
> taking the snapshot, and fail the probe if it never sets.

As you clarified, the automatic shadow load at power-on does not set
FUSE_READY; it is only set after a software-triggered reload. I will
trigger a reload through GEU_CONFIG bit 22 before polling READY, and
fail probe if the poll times out.

I tested this sequence on my COM260 Kit: probe succeeds and both banks
match the data read with v1.

Thanks,
Jiayu Du


