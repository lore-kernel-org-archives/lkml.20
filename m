Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AEC4DA9C4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776467; cv=none; b=iuCsC6vZhHbuZlxzV1xXRDyfBMAS4aQmSukKApHCgcNH0s5S0rY2IGPzK9n4qr8mFO1dXJhri7hmnHLBdgGnW8T1rgb9h+piGArR0FNUiNvopK/mXx5uLvUymAjBKNamZtGPYF2jwQR4g8x+Ecu6ldG3vHsUBeerxLkcAL/wcVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776467; c=relaxed/simple;
	bh=LV2s+XprEelfhT+x+lz4a954xEPmdnvvcc6lrgV9z9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBLu4lzcZ9eIvjrnHpSc5Az8K0AphzCoylSWXATPKtvdOioGEoOxoOWUZ2H3cyb8+7W2BGe8u7HnBOfx6MTWIA+GsrRd1EGsofmK2IQcNedCeVKEWaPfmCL99N7Up5lTBQmOMXNxit0IfZODJ94FwZHKbukjjF5u/EYmiWaFHF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=nxrLVWhJ; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="nxrLVWhJ"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c11ef641aso5650429eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790776452; x=1791381252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kSNUtQVp5d6e8feP+/xEzUsoy/t/hdu097Eyzo7g4ug=;
        b=nxrLVWhJSz72Ha1gH0NmZoCcW4k8qB6cbIRbB2sriTh2W4GrHB6dPWsozsxssP0BoL
         NrlZRaX11rTOVGieEUMSMtrP0iXuVi+nDHErUEmBbIzMJGfWhsNQ7kz3tF5P6bt7FpHw
         hG5SP+tfhvf47GoX9irTQgRU7dxiKC+uePD31rZiWmWfVIywUVkNB3VgHENkXqBNaaID
         nHpV2AP25lXu36jpwk2xSTZRZiLzhO6+OhexWwEB/Yo4BkjQKGNl6IH7spKbS5gMxXdh
         O+xVLPlN4qI5aHAiol9SrBDKzcPfiTvIswVyhh/xXTfzB7jpuRG6Kb3wiFA92sQk9Vxm
         syhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776452; x=1791381252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSNUtQVp5d6e8feP+/xEzUsoy/t/hdu097Eyzo7g4ug=;
        b=bWARz7D6zEfan+mz/4Zhq/o3DqqB8qCpqtPxgNWFY7ShnczNwd5h3Yti7JJQYgX6kE
         832dUraTTKWzhRU7mMj1RRNVCgktZtKKSjN095x3PuRgtDRwNJ79EwYs4Kz/anCHpNv5
         tAaWW8aNiiI/kGp1cWJsUX9/mi65n7J6nleG+G2ZuvoEeMHRzhtmMGXyAIVbcBO3zttf
         iURd2MXlwZ+B8fc2jLpi5aSxJxbLG4ntUhRJR/GRQ8zB+auJUH1KcZPS+PV4kLwyXG2q
         5dPlx/7r6lq0Z2WMNIMFmLDSzhVlbybnZv3raE3AU3e881Inrrw7NOrBAJeeJD7a2on1
         4Qmg==
X-Forwarded-Encrypted: i=1; AKwUvBwGS2d2U8s9K0wbSQQjDDJlQkrLy3Sk8ReV3QKrYQREDpHBkwAb2eJYBk/Si685ifK/UFhZ//Dfco1/suI=@vger.kernel.org
X-Gm-Message-State: AFq9FYInJelV0L6WKxAQUaV6ogY6VeduVIEdVWVxfBr55BtyP9R6KKLB
	/JElcCNdF55xOhKqRx3oZExoU0rY1ijpZS61U0oBL8Jx97HzoOJuoIJqnGVZgubYxCotCNsDizA
	EIw5E
X-Gm-Gg: AYBFou1jx0AX99cIgnKvceYP0aNttddgJc38Obw8/0zFwW0Vp2BxywrDN+r0Axo9JVo
	pta9cIDhIUUZBe8pdDYwO/SWVTA00wajYKgmal8iQ7lDAjeguV2+SZnQA3hANL6+BnHTrIgj1ix
	5S8vOoyMDi1RKHwsGmSWWFSJhqJyGFGs8C056ZjYNilo/HylvGrQcNEFggBaLFgcpjaefN6oNTI
	AVE9Tvfl7+rx0Ar3rp8FKM6Epw22KZq0QZ5Sw6RSqbYF8V4xAriZiQlLyjo+qU3HfyRUHAvRz5f
	seNPgqWcilY+1DaMZdsDy+RtiIYuXWI1kJvX4J8gqfbNxmS0OQYapg18oELW0XRdmrFcVcIQrxf
	wTp3pQUhQ0WJeSN3ujeaAjtmuThl4x4a9Bd3lUU0NF3g21FZHaDuAWbcOu5kWE4jpLGyqelh8Ww
	msRd83MLlyg1VSEs3lIDId84IG0NdPbtg8C4no0S9S6601lQ==
X-Received: by 2002:a05:7300:2143:b0:340:e422:fd3d with SMTP id 5a478bee46e88-34cdbad6906mr2918204eec.17.1790776451659;
        Wed, 30 Sep 2026 06:54:11 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf514b783sm4165034eec.13.2026.09.30.06.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:54:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBul6-0000000Bmsz-2FAs;
	Wed, 30 Sep 2026 10:54:08 -0300
Date: Wed, 30 Sep 2026 10:54:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Kohei Enju <enju.kohei@fujitsu.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 3/3] virt: arm-cca-guest: Add support for measurement
 registers
Message-ID: <20260930135408.GP163130@ziepe.ca>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
 <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
 <aryZnqqBAjKw5xaP@e129823.arm.com>
 <arygMte5C5lJDdoi@FCCLS0092175.localdomain>
 <aryuwukTRtmd2Lft@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aryuwukTRtmd2Lft@e129823.arm.com>

On Wed, Sep 30, 2026 at 07:40:02AM +0100, Yeoreum Yun wrote:
> > My remaining concern is that since sysfs_kf_bin_write() truncates
> > oversized writes to the binary attribute size before invoking the
> > callback, tm_digest_write() sees an exact-sized write and extends the
> > MR. The following validation is useless in this case.
> > 
> >   static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
> >   			       const struct bin_attribute *attr, char *buffer,
> >   			       loff_t off, size_t count)
> >   {
> >     [...]
> >   	/* partial writes are not supported */
> >   	if (off != 0 || count != attr->size)
> >   		return -EINVAL;
> > 
> > IMO this is not specific to Arm CCA, but do you have any thoughts on
> > this?
> 
> I think this is ultimately a limitation of sysfs. At this layer,
> simply knowing that userspace supplied a larger buffer does not allow us to
> determine whether all of the data in that buffer is valid.

sysfs is a bad choice for this interface, it always was, this is one
more example why.

We should have learned that from TPM's mistakes, not copied its bad
ideas into tsm_mr.

Jason
