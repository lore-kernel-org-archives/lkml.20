Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555394C10DD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777845; cv=none; b=iLRUKzKN4a6sw+nrkTspLcThzDgepBprpYQ74qkhAapgLOSGM+kfBopPlZvRk0WGEq/VxmAyXA9M+cJIJBpzKLgHbp9DixVgPP+lP2hQlOwzjzm3nr2cTjBBtcTeAsg4fQr7Eo8GQyOGt0iKVbktAHO+9dwA9iHs5LZLNTllI4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777845; c=relaxed/simple;
	bh=poUm7NmW7lvFmle7iWagZOPVd6wH5XZtoyMZVff0cJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NT/0Tps6UGlV42LPbAxPSd+9VH0B5co6FD7ergSookrErNaOhJApe8mwxlpQV/svgqbraj7y9KdK0F1FsDlvSZZ1+6LNjFzd6GuEBg5u9AS+yLRjOEo8GCn5F2KlVk8Ltn2X9HsnlpG9R5qnzhnhY12Ibf4IXOIVnPseBDHkty0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=l3nS54yv; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="l3nS54yv"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso5342879eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790777831; x=1791382631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ozxf4hkMU0FzrOoywk+aG5wesIujz7GRFSweCKb4aDU=;
        b=l3nS54yvurH4yWGbo+2p5lsjKbIiAdEkxNhDXt5pCVoOxUA6uWWyVCNFCbFYNmslES
         mZ3AD6D5CyP6XoeWHBuEMbFdW/H+N53zqa0gmnJflo+S2uEY12nHBBasBHxGhC4xUeJ9
         tPoO6+dpwUDNnXMTqfAO5FiOF/8bz1N8wxsb+NtSZbog8zMVXM6j0Zj7bLsU/xzoddeZ
         pZO/Vb4ygCovzmt3nmBzLMtMf1a/2Xw4zysS0BFFDiis8UhYjOy41kcFp3p416JwJTup
         uK+4N0NmGwQ0L+Olr9rsXPNb2LAT0eN5qL0nIrIs+H4cVvYHBT46u00EaV9if1B5Qx+U
         aB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777831; x=1791382631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozxf4hkMU0FzrOoywk+aG5wesIujz7GRFSweCKb4aDU=;
        b=02Z/TRiL/jI4gw9Dui4TUQi0ePxaLkqoAHP8lno0k51+Sb3riWKPE+cXhP2OYcj7Ck
         TsC1X2hTBbDHiIBH3qrya6dACoaMSYOI39R89e3IaQ+xlEMnJjsg2pyEmLu4kDUdcMjl
         xJYH/jDZ6TWgU3R/oUtAOywXgoRsZLIiCybrwKRgFuL3ElzQWWdImoMVU/WCm0mR6kyp
         u2403Khqh5IXq5WwhKiyklACcDYQNsgYzmMRfz05UfMMQnawxUWXulTSzBaEPkqARg0Q
         jS0ASG0IhCRnaqAji0U+ykIMvSbkLOMBg84N4tdpfXUj9FtPcWkvJLFTDDDL6TucvZTv
         I9rw==
X-Forwarded-Encrypted: i=1; AKwUvBw07EAaFOrtYxZO0cM6KG5lwpjHM6gA4i7ofuFyw+zma9QvzPNs83geJMAZDJCj1QHqEvuMbT2QzsWCRf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBKsQL319F0RUY/Q0hXeqn/FpUrMI1VGcipsi1sr4gAkpCsDXw
	U6FUBNIfkg5G6z0yTUFbCvvQoup//j5N7WcjV/WqxclJ9UAu1eV2y0Qa0erNS1h6574=
X-Gm-Gg: AYBFou0+moUx1j91duT+a+szoAdCWO76cuodU3s2M2B72S/VdkqMvP+ANMX9CVCHYh+
	jv/ZljNcy2OCim0wQ60HeH436A59rmgx8TmH+9oaSd731T7M0gVN7jUoC5V0NS9fFXRnw51HWfo
	r/SfwXV1VJHeui0rTCD2LWfb0XR1JQ+pAMkQHG+abIsQd3ESaKBWBdS2UwYJD8FxZMy6B0TXt2r
	wD0BBcAzL5Osq2gW6/GHfH5k7HYC3IIrbYvRnRdNCd255JFc0l3KixGJA6POuWaS/ZdKsaPqBaf
	npIn86ACAOVY8cvN2DzX1/9t5R+xoOYT9uue0gNqYaSHUxsW2B8+X59UD1IWJc0cQbNOoqLs8yn
	BRhK8OEc004YrSWb+K3S/WNDoy0Qxlx/H6ssof2R0B7P/bul9xKcXFx2isUvvsuM2R+Yz2J2qO1
	3HCplwIlg+aVdj57en0o96DIjlkVpUFPoPEMit+lRSH4uubEv913NlZnQ=
X-Received: by 2002:a05:693c:66d2:10b0:33c:e74:4624 with SMTP id 5a478bee46e88-34cdcab2d98mr1997715eec.27.1790777830424;
        Wed, 30 Sep 2026 07:17:10 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf22fd4bfsm5602501eec.4.2026.09.30.07.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:17:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBv7M-0000000BpQe-2j5f;
	Wed, 30 Sep 2026 11:17:08 -0300
Date: Wed, 30 Sep 2026 11:17:08 -0300
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
Message-ID: <20260930141708.GQ163130@ziepe.ca>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar0Y0vsOpu3WKTMM@e129823.arm.com>

On Wed, Sep 30, 2026 at 03:12:34PM +0100, Yeoreum Yun wrote:
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

Jiri's working proposal is to move it to a char dev, like the sane
TPM interface ..

I'm skeptical about any fs being a good idea for this kind of stuff..

Jason
