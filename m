Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3462250AC2B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777575; cv=none; b=Ohs2l9ukDvj3DlnisgvjvM9NK5fn7QLJEo94DvybDLcFt7C5BICI0OrZ/QVeH8KtIH0uM4SHxqFNIYRN3LXl6gkiZvJ/Z5zYly10bdkHivyGZkBApT0GfjsRI/lr4SJOQa/d6W1yooglCXxrqq+NpjT2L3LU+VpJUxe5HakkbBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777575; c=relaxed/simple;
	bh=6+XFhO3Qp73z2z2yEqj749ONIdCc8STL6SPnIAdhy28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSnihQ2fcJylCf82pjJUqb/n7bRXKQSJjicOiwbkV6kiP4O7vpc516VrSwqIyG4pl6mm5bHgmeSM7Sm9+jiqyTAfuK50dcQGm9aH3GTXhfRPIjI7Uuvn6SJxtZr8xvEm315XJhTwopdBaFCBuf5D1XIeykQ+Pec52pYf0ewhr4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YBEqbiPq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YBEqbiPq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07193497;
	Wed, 30 Sep 2026 07:12:35 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0076E3F85F;
	Wed, 30 Sep 2026 07:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790777558; bh=6+XFhO3Qp73z2z2yEqj749ONIdCc8STL6SPnIAdhy28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YBEqbiPqHIV3PjNK4fnmysbqZ0s3o2rjqRTpV+7ZOQrSy43ORf5HmdjAkvYSla0Rc
	 0P6nS3vDTzjvPw/pjriI4xZfLh26M5cqoKPy3lgyau3O5kGSQMD4dXIVH3fyjDPS/N
	 N/F+rhcINWuQ8dKR5pUwiv7v3ryTB180DvNl/dQQ=
Date: Wed, 30 Sep 2026 15:12:34 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Kohei Enju <enju.kohei@fujitsu.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 3/3] virt: arm-cca-guest: Add support for measurement
 registers
Message-ID: <ar0Y0vsOpu3WKTMM@e129823.arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
 <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
 <aryZnqqBAjKw5xaP@e129823.arm.com>
 <arygMte5C5lJDdoi@FCCLS0092175.localdomain>
 <aryuwukTRtmd2Lft@e129823.arm.com>
 <20260930135408.GP163130@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930135408.GP163130@ziepe.ca>

> On Wed, Sep 30, 2026 at 07:40:02AM +0100, Yeoreum Yun wrote:
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
> sysfs is a bad choice for this interface, it always was, this is one
> more example why.
> 
> We should have learned that from TPM's mistakes, not copied its bad
> ideas into tsm_mr.

This sounds you plan to make a dedicate fs (whatever via configfs or
other) for attestation subsystem which you mention in [0].

Link: [0] https://lore.kernel.org/all/arwNEWUEEk7jdGir@e129823.arm.com/

-- 
Sincerely,
Yeoreum Yun
