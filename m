Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513767;
	b=LlkqCQ78fzDj71k+s+pyhN/vzV+SVWZxoHlh+8ZcKZQAFvPmUZStB1qBjtnge3rUZ98B
	 7Rfs4h2hGXkWVaPPGnWhQZZY4RxR0TDg09s9f7x1OrXEhjPQ36oVAwnwfpgkFx0GmPLk9
	 x2+jOewCOVxT8fX/mzjxgACT3QngukcOACFsOr1nqfUUsB+nwxGRL2yYpMZ7HIOH9dtTc
	 b/oAsvM3nYcS4sqKaXnx0GwvFuCy56TDnJ0pLQUfGXYDSIiJKKWoJlijouE+v2L68Lgl/
	 kbYDugymdKaru7jXhpZ9PRryhHJlyxsOLCQH8IzdrTVZY5Trtr29hbiylJXdapjBWiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513767;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=kRsJE9S/70yOGQSUq2MlgQujyTFrN9aLjM+eaSxSfek=;
	b=IWHhX+mCtDDtzaD5+baXWoH94VbZ81GNtO+nlosxW3X2M0HP/Vb3UoA0OeKrUYalq6zZ
	 +h6/mmZQZxIyKVItlko4ca5ecYmaIkn4PciQAkqcKDT9QJJZOKkm72L7uLIdJDzNIoY5z
	 ZEcVytGheLpnW+oi2FGSSwxeIbpICwtCdG1g0pwpycwtZo/MLcuumGnjD004UcuPGmd6G
	 4o5E6xr/dTNiFv8nb0EF+bk+VsY0uqUUZfl7v8OpqnRBU4hDj9IiTlzHHYrVl4kYYQR0k
	 oIn5dbcOaK8UubZwQBxrD56gwF43xc8FckqVouP1AhdxgWZgQ5bSPY7DK/EjpNrEqrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iXXCGePG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22510606A31C;
	Thu, 12 Nov 2026 20:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iXXCGePG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291CB1F000C4;
	Thu, 12 Nov 2026 20:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794513766;
	bh=kRsJE9S/70yOGQSUq2MlgQujyTFrN9aLjM+eaSxSfek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iXXCGePGQJ3YsqnugdvJXMJeGBJiscAo887Qwn5UOj9vmXdobRDyLCxWo3h9W9Fq4
	 94i19MI8QPzHukPl5h1iWi54+DLQqqT898RHQTKI6y7CZhH9zUEF9kLAuR9lyGfyWe
	 tKAx0FzHMGLnQvnQsKke6tQANKJiRlF49ClwlDCnTkvK2222ZhOBIhXDK/9z8+p4cQ
	 2qA/d1iB+ohHdfWQfI6QQr+18k6BJ7ET6iVb6rf5pEI45dfw/+xM6HOV2c5TZalwiM
	 GLeem4S6CP5EHu7MRNHVwtxl1bcHWzEGIv2pauBU8yj1aY+WEZ4/Hb/TveVAz4xHAg
	 TaLmZB+wbwghg==
Date: Thu, 12 Nov 2026 12:02:44 -0800
From: Drew Fustini <fustini@kernel.org>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	Tony Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v11 1/5] riscv_cbqri: Add capacity controller core
Message-ID: <avYbZMGiLU6iSTj7@thelio>
References: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
 <20261108-dfustini-atl-sc-cbqri-dt-v11-1-33a1bf0cf01c@kernel.org>
 <DMTD6WT2DU30.AX3QK44UUYB3@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DMTD6WT2DU30.AX3QK44UUYB3@oss.qualcomm.com>

On Thu, Nov 12, 2026 at 05:14:50PM +0100, Radim Krčmář wrote:

Hi Radim, thanks for the review.

> 2026-11-08T15:20:50-08:00, Drew Fustini <fustini@kernel.org>:
> > Add the core for RISC-V CBQRI capacity controllers: the register
> > layout, the capability probe, and the allocation operations that
> > program a capacity block mask for an RCID and read it back.
> >
> > A discovery layer maps the register block and describes the controller
> > in a cbqri_controller_info descriptor. riscv_cbqri_register_cc() probes
> > the controller from that descriptor and adds it to the controller list,
> > which stays private to the core. The core owns the controller state
> > after registration, so nothing in it depends on how the controller was
> > discovered. The caller keeps the register mapping alive.
> >
> > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > ---
> > diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devices.c
> > +static u64 cbqri_readq(void __iomem *addr)
> > +{
> > +	return lo_hi_readq(addr);
> > +}
> > +
> > +static void cbqri_clear_cunits(struct cbqri_controller *ctrl)
> > +{
> > +	if (ctrl->cc.cunits) {
> > +		writel(0, ctrl->base + CBQRI_CC_CUNITS_OFF);
> > +		writel(0, ctrl->base + CBQRI_CC_CUNITS_OFF + 4);
> 
> nit: lo_hi_writeq?

Good idea, I'll switch to that.

> > +int cbqri_apply_cache_config(struct cbqri_controller *ctrl, u32 closid,
> > +			     const struct cbqri_cc_config *cfg)
> > +{
> > [...]
> > +	mutex_lock(&ctrl->lock);
> > [...]
> > +out:
> > +	mutex_unlock(&ctrl->lock);
> > +	return err;
> 
> nit: guard the mutex?

Also a good idea, I'll switch for this function and also
cbqri_read_cache_config().

> 
> > +static int cbqri_probe_feature(struct cbqri_controller *ctrl, int reg_offset,
> > +			       int operation, int *status, bool *access_type_supported)
> > +{
> > +	const u64 active_mask = CBQRI_CONTROL_REGISTERS_OP_MASK |
> > +				CBQRI_CONTROL_REGISTERS_AT_MASK |
> > +				CBQRI_CONTROL_REGISTERS_RCID_MASK;
> > +	u64 reg, saved_reg;
> > +	int at;
> > +
> > +	/*
> > +	 * Default the output to false so the status==0 (feature not
> > +	 * implemented) path returns a deterministic value to the caller
> > +	 * rather than leaving an uninitialized bool.
> > +	 */
> > +	*access_type_supported = false;
> > +
> > +	/* Keep the initial register value to preserve the WPRI fields */
> > +	reg = cbqri_readq(ctrl->base + reg_offset);
> > +	saved_reg = reg;
> > +
> > +	/* Drain any in-flight firmware op before issuing our own write. */
> > +	if (cbqri_wait_busy_flag(ctrl, reg_offset, &saved_reg) < 0) {
> > +		pr_err("BUSY timeout before probe operation\n");
> > +		return -EIO;
> > +	}
> > +
> > +	/*
> > +	 * Execute the requested operation with all active fields
> > +	 * (OP/AT/RCID) zeroed except OP itself. Every bit not in
> > +	 * active_mask is WPRI and gets carried over from saved_reg.
> > +	 */
> > +	reg = (saved_reg & ~active_mask) |
> > +	      FIELD_PREP(CBQRI_CONTROL_REGISTERS_OP_MASK, operation);
> > +	writel(lower_32_bits(reg), ctrl->base + reg_offset);
> > +	if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
> > +		pr_err_ratelimited("BUSY timeout during operation\n");
> > +		return -EIO;
> > +	}
> > +
> > +	/* Get the operation status */
> > +	*status = FIELD_GET(CBQRI_CONTROL_REGISTERS_STATUS_MASK, reg);
> > +
> > +	/*
> > +	 * Check for AT support if the register is implemented
> > +	 * (if not, the status value will remain 0)
> > +	 */
> > +	if (*status != 0) {
> > +		/*
> > +		 * Re-issue operation with AT=CODE so the controller
> > +		 * latches AT=CODE on supported hardware (or resets it to 0
> > +		 * on hardware that doesn't). OP must be a defined CBQRI op
> > +		 * here. OP=0 is a no-op and would silently disable CDP.
> 
> OP=0 is a reserved for future standard use.
> (Hopefully just fails, but it could be worse if it gets implemented as
>  something other than no-op.)

I'll reword and drop the incorrect statement that OP=0 is a no-op.

> 
> > +		 */
> > +		reg = (saved_reg & ~active_mask) |
> > +		      FIELD_PREP(CBQRI_CONTROL_REGISTERS_OP_MASK, operation) |
> > +		      FIELD_PREP(CBQRI_CONTROL_REGISTERS_AT_MASK,
> > +				 CBQRI_CONTROL_REGISTERS_AT_CODE);
> > +		writel(lower_32_bits(reg), ctrl->base + reg_offset);
> > +		if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
> > +			pr_err("BUSY timeout setting AT field\n");
> > +			return -EIO;
> > +		}
> > +
> > +		/*
> > +		 * If the AT field value has been reset to zero,
> > +		 * then AT support is not present
> > +		 */
> > +		at = FIELD_GET(CBQRI_CONTROL_REGISTERS_AT_MASK, reg);
> 
> I think it would be safer to also check the status field.
> 
> I'm not too clear whether the spec actually allows returning 5 (invalid
> AT) when the AT is invalid, but an implementation that does that
> wouldn't surprise me.
> 
> (For example when an implementation supports data AT and a custom AT, so
> code AT isn't supported, but AT in general is -- it could keep the
> failing code AT and just report the error.)

That seems reasonable. I will change it to only report AT support when
the AT field reads back as code with status = success.

> > +		if (at == CBQRI_CONTROL_REGISTERS_AT_CODE)
> > +			*access_type_supported = true;
> > +	}
> > +
> > +	/*
> > +	 * Restore the original register value.
> > +	 * Clear OP to avoid re-triggering the probe op.
> > +	 */
> > +	saved_reg &= ~CBQRI_CONTROL_REGISTERS_OP_MASK;
> > +	writel(lower_32_bits(saved_reg), ctrl->base + reg_offset);
> 
> It would be better to do nothing than trigger an illegal OP.
> All our writes should modify the non-WPRI bits anyway, so restoring them
> does nothing.

I agree. I'll drop the restore write.

> > +	if (cbqri_wait_busy_flag(ctrl, reg_offset, NULL) < 0) {
> > +		pr_err("BUSY timeout restoring register value\n");
> > +		return -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int cbqri_probe_cc(struct cbqri_controller *ctrl)
> > +{
> > [...]
> > +
> > +	/*
> > +	 * The driver programs the v1.0 register layout. Controllers that
> > +	 * report 0.x differ only in capability bits that read as zero, so
> > +	 * they are accepted. Anything newer than 1.0 may move fields.
> > +	 */
> > +	if (ver_major > 1 || (ver_major == 1 && ver_minor > 0)) {
> 
> I think we could accept ver_major == 1 even with ver_minor > 0 since the
> minor specifications shouldn't be doing backward-incompatible changes.
> 
> (If we fix the OP=0, we shouldn't be invoking any other behavior that
>  might change.)

Good point. I'll skip the ver_minor check and reject ver_major > 1.

> I'd be more careful about accepting anything pre-1.0, since I would
> expect there was a breaking change in the spec somewhere, and we could
> program it incorrectly...  Do we even care about pre-1.0 hardware?

I went through the tagged drafts in the riscv-cbqri repo, v0.9.1 through
v1.0-rc3. The registers and encodings that this driver uses are the same
in all of them. RPFX/P were added in bits that had been reserved.

If I add that information to the comment, then would that be acceptable
to you?

Thanks,
Drew
