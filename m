Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADB244F557
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754860; cv=none; b=e3XWDMrzDmY1HlqE/SdP5nruXHDNufZlgea5QWixHd4y5/vGYo11BwN7fO8efSJb2tTFqNRzJumeQ0Vvw5uLyNiLXKo9GYpoHV6L2xZ+iH1eHhQXiwfOS78+cVSbnPWG2KLjeMks3Kbn7YqOStxAVDGczqu4nBZ7LEj//IFtULg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754860; c=relaxed/simple;
	bh=lbkClFzLLe0ivYseX839w/IMZ7BURDCVxHQdQZ6nU68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Miv0m+M2ip04bG6J1fKu62VVmFqOQDZnxyFzHdlKMACIiKZe9BgMqoN59xqO+LQnwAFdPSIdcwqnIiDXFu8a0cdd/DuFU4VeIOshXRv59fY4KEIAZI00ttpR4F0nflPWVbdb9JuL+VdC5rBDI5KT9DE1ifchGEdf3BKqqLoa6pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=c1EAOKIU; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="c1EAOKIU"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA9B61477;
	Wed, 30 Sep 2026 00:54:12 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB75C3F86F;
	Wed, 30 Sep 2026 00:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790754856; bh=lbkClFzLLe0ivYseX839w/IMZ7BURDCVxHQdQZ6nU68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1EAOKIUjCvotcFM2AizcOeeILl/6SYLkrt4Jt05C56SFmVNmQPpP3Opi5Uv1d9Wm
	 tJ0vhWkIWtcAYLpaK+0WivpxW0erTf+2Jnso1dQgHtmsN43pP/7yozLNiPmRFKwzIx
	 32+UvXvLtdU9i5Ox51b5mh2lRYgcWq/Htklg+ZYs=
Date: Wed, 30 Sep 2026 08:54:12 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 3/3] virt: arm-cca-guest: Add support for measurement
 registers
Message-ID: <arzAJJ7glyD4rEeM@e129823.arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
 <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
 <aryZnqqBAjKw5xaP@e129823.arm.com>
 <arygMte5C5lJDdoi@FCCLS0092175.localdomain>
 <aryuwukTRtmd2Lft@e129823.arm.com>
 <arywufbCohZ-U3lN@FCCLS0092175.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arywufbCohZ-U3lN@FCCLS0092175.localdomain>

> On 09/30 07:40, Yeoreum Yun wrote:
> > > > > > +/**
> > > > > > + * arm_cca_measurements - ARM CCA measurement configuration instance.
> > > > > > + *
> > > > > > + * This defines the measurement set and behavior for the ARM
> > > > > > + * Confidential Compute Architecture, enabling measurements
> > > > > > + * for attestation and runtime validation.
> > > > > > + */
> > > > > > +static struct tsm_measurements arm_cca_measurements = {
> > > > > > +	.mrs = arm_cca_mrs,
> > > > > > +	.nr_mrs = ARRAY_SIZE(arm_cca_mrs),
> > > > > > +	.refresh = arm_cca_mr_refresh,
> > > > > > +	.write = arm_cca_mr_extend,
> > > > > 
> > > > > From the RMM specification and the commit message, I understand that a
> > > > > REM can be extended with a measurement value of up to 64 bytes,
> > > > > regardless of the selected hash algorithm (for example, SHA-256 or
> > > > > SHA-512).
> > > > > 
> > > > > However, when SHA-256 is selected, this interface does not allow a REM
> > > > > to be extended with a 64-byte value. The write partially succeeds: the
> > > > > REM is extended with the first 32 bytes, and then the write of the
> > > > > remaining 32 bytes fails with -EFBIG.
> > > > > 
> > > > > As far as I can tell, the write is truncated to the sysfs binary
> > > > > attribute size, which is set to the SHA-256 digest size (32 bytes). The
> > > > > subsequent write at offset 32 is then rejected by sysfs_kf_bin_write()
> > > > > with -EFBIG.
> > > > > 
> > > > > I do not see a straightforward fix because the TSM measurement register
> > > > > interface currently uses mr_size both as the readable digest size and as
> > > > > the required write size.
> > > > > 
> > > > > [Realm VM]
> > > > >   ~ # export REM3=/sys/devices/virtual/misc/arm_cca_guest/measurements/rem3:sha256
> > > > >   ~ # dd if=/dev/urandom bs=64 count=1 of=$REM3
> > > > >   dd: error writing '/sys/devices/virtual/misc/arm_cca_guest/measurements/rem3:sha256': File too large
> > > > >   1+0 records in
> > > > >   0+0 records out
> > > > > 
> > > > > [RMM]
> > > > >   SMC_RSI_MEASUREMENT_EXTEND        4 20 3cfcaa635bca042d c148121346b6e1b5 7342800b438d20d7 3dc7a25048cbbad8 0 0 0 0 > RSI_SUCCESS
> > > > > 
> > > > > Do you have any thoughts on how the TSM interface should represent the
> > > > > maximum extend input size separately from the digest size?
> > > > 
> > > > I don't think we need to represent the maximum extend input size separately.
> > > > 
> > > > The TSM measurement register interface is intended to expose PCR-like
> > > > semantics, where the value being extended is a measurement digest whose size
> > > > is determined by the selected hash algorithm.
> > > > 
> > > > In other words, the extend operation is conceptually:
> > > > 
> > > > new_digest = Hash(old_digest || measurement_digest)
> > > > 
> > > > Therefore, for a SHA-256 measurement register, the extend value should be
> > > > 32 bytes, and rejecting a value larger than 32 bytes with -EFBIG seems
> > > > correct to me and intended. A 64-byte extend value would only be valid for
> > > > a register using a 64-byte digest, such as SHA-512.
> > > > 
> > > > Although the RMM interface may allow a measurement value of up to 64 bytes
> > > > independently of the REM hash algorithm, I don't think that capability
> > > > needs to be exposed through the generic TSM measurement register interface
> > > > in point of viewt to preserve PCR-like semantics.
> > > 
> > > Thanks for the clarification. That makes sense to me.
> > > 
> > > In that case, could the ABI documentation be updated? It currently
> > > states:
> > >   All writes must start at offset 0 and be maximum 64 bytes in size.
> > >   Attempting to write more than 64 bytes will result in EINVAL returned
> > >   by the write() syscall.
> > 
> > Yeap. I'll update accordingly. Thanks.
> > 
> > > 
> > > However, the TSM interface requires the write size to exactly match
> > > mr_size. Therefore, this would be 32 bytes for SHA-256, 48 bytes for
> > > SHA-384, and 64 bytes for SHA-512.
> > > 
> > > My remaining concern is that since sysfs_kf_bin_write() truncates
> > > oversized writes to the binary attribute size before invoking the
> > > callback, tm_digest_write() sees an exact-sized write and extends the
> > > MR. The following validation is useless in this case.
> > > 
> > >   static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
> > >   			       const struct bin_attribute *attr, char *buffer,
> > >   			       loff_t off, size_t count)
> > >   {
> > >     [...]
> > >   	/* partial writes are not supported */
> > >   	if (off != 0 || count != attr->size)
> > >   		return -EINVAL;
> > > 
> > > IMO this is not specific to Arm CCA, but do you have any thoughts on
> > > this?
> > 
> > I think this is ultimately a limitation of sysfs. At this layer,
> > simply knowing that userspace supplied a larger buffer does not allow us to
> > determine whether all of the data in that buffer is valid.
> 
> I agree that this is a common sysfs/TSM issue rather than something
> that needs to be addressed in this series.
> 
> > 
> > For example, a userspace program could allocate a 64-byte buffer,
> > place only a 32-byte SHA-256 digest in it, and still pass the full buffer
> > size to write(). From the kernel's point of view, there is no reliable way
> > to distinguish that from a valid 64-byte input.
> > 
> > Therefore, I think userspace needs to check the size of the binary attribute,
> > e.g. remX256 in this case, and write exactly that amount of valid data.
> 
> Agreed. Userspace should normally inspect the attribute size and write
> exactly that mount.
> 
> > 
> > Given the current sysfs interface, I think requiring userspace to check
> > the bin_attr size and provide valid data of exactly that size is the best
> > we can do.
> > 
> > IOW, above sanity check is to catch-up what you worried about as comment
> > say, Its purpose to prohibit the *partial write*.
> 
> Right, but my concern is that this check cannot detect an oversized
> write, since sysfs_kf_bin_write() truncates it before invoking
> tm_digest_write(). Consequently, the check passes and the MR is
> extended, even though userspace observes a short write.
> 
> I think this could be handled by adding an opt-in option that prevents
> sysfs from truncating writes. I did a basic test with the prototype
> patch below and confirmed that an oversized digest was rejected with
> -EFBIG before the MR was extended.
> 
> Anyway, I will look into addressing this separately through the common
> TSM/sysfs code. 
> 
> Thanks for the clarification, Yeoreum.
> 
> ---8<---
> diff --git a/drivers/virt/coco/guest/tsm-mr.c b/drivers/virt/coco/guest/tsm-mr.c
> index 657b9c5739d0..5880b12e1f55 100644
> --- a/drivers/virt/coco/guest/tsm-mr.c
> +++ b/drivers/virt/coco/guest/tsm-mr.c
> @@ -215,6 +215,7 @@ tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
>                 if (tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) {
>                         bap->attr.mode |= 0200;
>                         bap->write = tm_digest_write;
> +                       bap->no_write_truncate = true;
>                 }
> 
>                 bap->size = tm->mrs[i].mr_size;
> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index cd5bb0f9fee6..1d6a0bf8109e 100644
> --- a/fs/sysfs/file.c
> +++ b/fs/sysfs/file.c
> @@ -156,6 +156,8 @@ static ssize_t sysfs_kf_bin_write(struct kernfs_open_file *of, char *buf,
>         if (size) {
>                 if (size <= pos)
>                         return -EFBIG;
> +               if (battr->no_write_truncate && count > size - pos)
> +                       return -EFBIG;
>                 count = min_t(ssize_t, count, size - pos);
>         }
>         if (!count)
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index b1a3a1e6ad09..31a4c3cf5d51 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -312,6 +312,7 @@ struct bin_attribute {
>         struct attribute        attr;
>         size_t                  size;
>         void                    *private;
> +       bool                    no_write_truncate;
>         struct address_space *(*f_mapping)(void);
>         ssize_t (*read)(struct file *, struct kobject *, const struct bin_attribute *,
>                         char *, loff_t, size_t);
> 

Yeap. I agree this and valid for me, but delay decision to sysfs
maintainer whether it's valid for overall usage of sysfs.

-- 
Sincerely,
Yeoreum Yun
