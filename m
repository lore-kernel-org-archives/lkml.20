Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B83C50B42A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778511; cv=none; b=Kax2vIysq0tbPIiMqYeEEZt/x3BoprqFKkR3qtg4OnCpJC+9KsZPmL3e/YENqIAAQbZKFVwLLBsqDts2Zxtci4xQ+aJ7P3/t7PSjY7fpVdKza5J7OIGTMvRLcPYec8TuvTG1vRH+ttZi+qf+fRAg9JbLzrC5nNZgHUII44FjlT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778511; c=relaxed/simple;
	bh=FV8I/dO57eVkHuIV6LTmsqycHhPtn1208/7F0F6Lebc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uABGkbzAJkTGLeZBbH9NHBOjWi+YHTsVaQk659l5m5fSkOvdUx4FfakEnU0pQAPVtvGX10eSHJ5cdQTTra12XsWlzAZj/dak1rs0nkG7boRtunqkiJ39C4RRUd/EtdPG7szLQmDqAOq61SOLWvbT9anhz+LoZoDhwN5mvg021DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ivjiqceD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ivjiqceD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68FE3497;
	Wed, 30 Sep 2026 07:28:15 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64CD03F85F;
	Wed, 30 Sep 2026 07:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790778498; bh=FV8I/dO57eVkHuIV6LTmsqycHhPtn1208/7F0F6Lebc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivjiqceDxB2SzDGrovUsYtnai9OlBdpj/MesfTrM//H/VSlGIF/qkIVOhgV0yGT0q
	 YoxBlmbZNQdc+dl9Qm5ympLo9DjRyivFoJjZCei8/cm0YCB+78YCd+oeHEuLYgDK+R
	 UZftOjsVhZup6GsllDBRNTVEyJ37ZsSRvJs7QrRw=
Date: Wed, 30 Sep 2026 15:28:15 +0100
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
Message-ID: <ar0cfxgUCtdYW-EX@e129823.arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
 <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
 <aryZnqqBAjKw5xaP@e129823.arm.com>
 <arygMte5C5lJDdoi@FCCLS0092175.localdomain>
 <aryuwukTRtmd2Lft@e129823.arm.com>
 <20260930135408.GP163130@ziepe.ca>
 <ar0Y0vsOpu3WKTMM@e129823.arm.com>
 <20260930141708.GQ163130@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930141708.GQ163130@ziepe.ca>

On Wed, Sep 30, 2026 at 11:17:08AM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 30, 2026 at 03:12:34PM +0100, Yeoreum Yun wrote:
> > > On Wed, Sep 30, 2026 at 07:40:02AM +0100, Yeoreum Yun wrote:
> > > > > My remaining concern is that since sysfs_kf_bin_write() truncates
> > > > > oversized writes to the binary attribute size before invoking the
> > > > > callback, tm_digest_write() sees an exact-sized write and extends the
> > > > > MR. The following validation is useless in this case.
> > > > > 
> > > > >   static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
> > > > >   			       const struct bin_attribute *attr, char *buffer,
> > > > >   			       loff_t off, size_t count)
> > > > >   {
> > > > >     [...]
> > > > >   	/* partial writes are not supported */
> > > > >   	if (off != 0 || count != attr->size)
> > > > >   		return -EINVAL;
> > > > > 
> > > > > IMO this is not specific to Arm CCA, but do you have any thoughts on
> > > > > this?
> > > > 
> > > > I think this is ultimately a limitation of sysfs. At this layer,
> > > > simply knowing that userspace supplied a larger buffer does not allow us to
> > > > determine whether all of the data in that buffer is valid.
> > > 
> > > sysfs is a bad choice for this interface, it always was, this is one
> > > more example why.
> > > 
> > > We should have learned that from TPM's mistakes, not copied its bad
> > > ideas into tsm_mr.
> > 
> > This sounds you plan to make a dedicate fs (whatever via configfs or
> > other) for attestation subsystem which you mention in [0].
> > 
> > Link: [0] https://lore.kernel.org/all/arwNEWUEEk7jdGir@e129823.arm.com/
> 
> Jiri's working proposal is to move it to a char dev, like the sane
> TPM interface ..

Ah. makes sense. Thanks.

-- 
Sincerely,
Yeoreum Yun
