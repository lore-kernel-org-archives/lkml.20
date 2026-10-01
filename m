Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29474263F5D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.61.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790818479; cv=none; b=gXN0/goahycseweyuuafQKTiADb4fOLWCKioyJpiPMMdfv3PbUhDzhlSr0Wj2jwGJiR2t3aFPHKCsZ3zvTOlwgkEziuF9NKdPM0C8VwZPXcqPJfDO9kmf2oMqy7kZKHF0/37BLLuTMuMoO7z9Nl6OYDBfBgHhXEWax/mnE19vjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790818479; c=relaxed/simple;
	bh=HutbBCZxS976JcvsbprlXH4c2wa61HyhSHROQf0yIBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTkypI8CrEy9VMDQTJckPFQvTaPD6NJ0+4ONpaxrZ9dFRHSYubOM55bKXRYyUchINupZ66+YnUaDe24QNOOnX4sHCqpZ9fULi7aKFICyFH6Td/SacBOFxMZif0NmktqujgqoAUwSKTTsuSZBSSEiy9C01QnxnEWzMP+kS+aMbXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=C+HAj5pH; arc=none smtp.client-ip=139.138.61.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="C+HAj5pH"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1790818477; x=1822354477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HutbBCZxS976JcvsbprlXH4c2wa61HyhSHROQf0yIBc=;
  b=C+HAj5pHyJ49fQ44lh7gM96QkgjW2x9IxXrhquo2Yxz9/1Qiw3Brslth
   +PQii2Xgrwp/cprG2T1wmi3DCnkXt2rsbP2NxxJkWWelqPse4PREZTiqx
   BZF5if6gVtkou8CQrSzo4bO7TIIr0FjmZiQEZtdQ0a0HkE9uRiKKo4Hh8
   Ef0jLL9ab+r9/uUgyaslFHHO/Oa3ebeuivbagK3w3E7Amo8rgS6p1kb3Q
   g6NqiLRHhJ/Wcz+4sfcp8ZtCjWDMK5cQmT8zSUJmc6hx6kurtOs3cslyh
   NOvva2pnndvo0AznYUh4rLV6GiLw3+qHyqcIhf3z838ork2JqXJ9OOTEp
   A==;
X-CSE-ConnectionGUID: l4HYh6LDSyujiX7FaESdPA==
X-CSE-MsgGUID: SHEN38OaRKOeoXuhVXAX1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="244704437"
X-IronPort-AV: E=Sophos;i="6.27,133,1786978800"; 
   d="scan'208";a="244704437"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 10:33:25 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A7A671002BA1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:33:25 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 59B1AC011B8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:33:25 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.107.230])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with SMTP id BD83D1800BB2;
	Thu,  1 Oct 2026 01:33:20 +0000 (UTC)
Date: Thu, 1 Oct 2026 10:33:19 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Suzuki Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 3/3] virt: arm-cca-guest: Add support for measurement
 registers
Message-ID: <ar24JzI4QvVqTL7Y@FCCLS0092175.localdomain>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
 <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
 <aryZnqqBAjKw5xaP@e129823.arm.com>
 <arygMte5C5lJDdoi@FCCLS0092175.localdomain>
 <aryuwukTRtmd2Lft@e129823.arm.com>
 <20260930135408.GP163130@ziepe.ca>
 <ar0Y0vsOpu3WKTMM@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ar0Y0vsOpu3WKTMM@e129823.arm.com>

On 09/30 15:12, Yeoreum Yun wrote:
> > On Wed, Sep 30, 2026 at 07:40:02AM +0100, Yeoreum Yun wrote:
> > > > My remaining concern is that since sysfs_kf_bin_write() truncates
> > > > oversized writes to the binary attribute size before invoking the
> > > > callback, tm_digest_write() sees an exact-sized write and extends the
> > > > MR. The following validation is useless in this case.
> > > > 
> > > >   static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
> > > >   			       const struct bin_attribute *attr, char *buffer,
> > > >   			       loff_t off, size_t count)
> > > >   {
> > > >     [...]
> > > >   	/* partial writes are not supported */
> > > >   	if (off != 0 || count != attr->size)
> > > >   		return -EINVAL;
> > > > 
> > > > IMO this is not specific to Arm CCA, but do you have any thoughts on
> > > > this?
> > > 
> > > I think this is ultimately a limitation of sysfs. At this layer,
> > > simply knowing that userspace supplied a larger buffer does not allow us to
> > > determine whether all of the data in that buffer is valid.
> > 
> > sysfs is a bad choice for this interface, it always was, this is one
> > more example why.
> > 
> > We should have learned that from TPM's mistakes, not copied its bad
> > ideas into tsm_mr.
> 
> This sounds you plan to make a dedicate fs (whatever via configfs or
> other) for attestation subsystem which you mention in [0].
> 
> Link: [0] https://lore.kernel.org/all/arwNEWUEEk7jdGir@e129823.arm.com/

I wasn't aware of this thread. Thanks for letting me know that.

Thanks,
Kohei

> 
> -- 
> Sincerely,
> Yeoreum Yun
