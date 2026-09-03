Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22959370D61
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464202; cv=none; b=LTnnjgV/p78/WOyPAzjd8V+sZbQ46TLglR2yFFwslyVh14TQeClOO9GrrV0W2Nj+xd4YHYLdxPD7DOqCExWWN1kD7sRvxdY7PxEa/83NYFWYdDSxGCDdH50+VJSQw1VKFyR1U01zsqDP0gFYVtnoJnFdvzWScGuoAKxeWWTLwwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464202; c=relaxed/simple;
	bh=zwe9FjlgKhgLsbgTZ5KD7tV0Va7wCEjGhd5pHgJKyts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMLjzntGm0j9r60zTRPxOEArNHRKPYgQ+UwFKLsadygwSvDVwDMuGcLkmg+/4j6o15+huk3SzTH8TZUt1YuZ3IIHYxAqK9oE7UcacXyTqFi/2DAS8fU7r9AmJvKtUXdWANrxNK9tuC4NhnsejBCwWYvsoLqAau5dLUR3NelhI2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbtT+Prk; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbtT+Prk"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-484392e3d33so150646f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788464188; x=1789068988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O5KqwQ8QeVoPOFqAteEdtspPaAzg6vItlz93/SfHCR4=;
        b=jbtT+PrkgmMD+zfP/77Hg3KGyIFBoX0mECwYfptj2Y1nwof6GiGPc+MXTWqEesexhi
         4YzuTe+QwAfC7HjJTHONS6qo5/owuhn5VY2Fuvj0BOefteMzwmYO6AjL6DO43HGGAFQj
         ngVVr2aAZGNL5gdcoiWZeCUEYiof/od1Hub7dLgO5cBFn10+lKGF1x6X8UPWa8BWl3Zq
         VkLo9R4C3KxbPwAect3UH+sc4ObsohAFHnOL1SzME9F5Pr4ICVwxQR85PGFZRJnXPoZW
         VGnk5NbSjVTWSRharBu8MQE4Up8nIKiI67UEuu+41uki0a3bJ/4MLXXYLqiHwk5Qw5I1
         74Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788464188; x=1789068988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O5KqwQ8QeVoPOFqAteEdtspPaAzg6vItlz93/SfHCR4=;
        b=jXRpAb4l0hKqfpmJEgsyzivjQBtXVoYZduZoP+pmgS6rEEWVxwbeYUiscw4/2Ql2ZR
         aHSqSozzK3vcBc43oqOtuARdn0zBSderCU4tCB7dvR1HWux29hGHcA6k2XLLjSFg8ZCe
         gO0LHZFlxgZC2AXp5E9VbSEV99iLED8482aUhpGGIhWGWQ6JgGokJ3sb1wETrpuun6LI
         V1/s8mikvmRuYODub12ST74hig0n9qQhZhPxOJDxRM5ge8ufVs9MIzV5OetC8UnXLIEj
         ZaasZBlk4j6bu2I/aXj50C7uknDngQUpuoLPV/pPYkl5w/l0MzJwyA54Ci4PgHxBKeMM
         aVrw==
X-Forwarded-Encrypted: i=1; AKwUvBxVMrSZYNEDLYL+E6zoWlj3klLXdw3lfn2KbSPczbTpxoVMpwERAv7qAZVLLphx7hOwuc92rgplP/XF7U8=@vger.kernel.org
X-Gm-Message-State: AFuF++kc8or43Rv8id9BjqQOqxIrQkd/vsCksrz/Xu3wL36CMuyFZtuY
	j/N5ohv5y3j9mPyQ/C1vwjINn07zsMDHy+2halN7U2szYSP4rcRbVAlr
X-Gm-Gg: AYBFou1a7DMPtz4Wn732NRYbZqVz69ZGuCii3DcZ1MZf7lT8iCzhsapV2dwgo+dBhNY
	YMQo1TmJ1Rbsn/eSQCijxLI9Xr51h+lBWez///mIJX/xYCzFWUDj3btu9tVN6sOKUEiNawSrlJI
	gO9FfIkSiKpYqGTvQAZEpEMxkr7X+ylKDaKUozlbIYskSCkRqUrKd39bC684REm+aJcPoZmcSVc
	zBMpEqfS/SgWTMg4PuhI1hAhs2udlQssD5ZWR84FkjywLdMjEkFWVx9gmv301zu2SM3Qn92yuI3
	hfUsXag+mdFM00mePXWDQe3FVNq11fYCC3Pr7gH5Nhv35LlFXROubEYwUyORd+kRNP7kYjGAz5C
	hUth54bw+1CuMyR6pls2ei3G/IUPM5ZiWlYxE4jB9lFDxdF3GuueOBjSmvO+RRug2lTc0nzwLJ+
	yXj0xOKYZ986C5C25AaHUsS7i5ZSChUJ/axHsElEqoOYqZV1WBkyTTr7Uqo4DcDYfSHoQEKEQhW
	+qL3xq978VZHhh4Uf4acOx98GOaC3VpNu3ciBKuHbbHJbE1lct9GSs3jc4FH1cb2WIKPzcILRXv
	gb05h4SNMidxHKyUCEw7H+SNi8NYwSbkFvtWFd52nFjIGceNs0SmGlx4BYRvPiFj
X-Received: by 2002:a05:600c:a0b:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49cf8262133mr3691965e9.16.1788464187671;
        Thu, 03 Sep 2026 12:36:27 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm768665f8f.7.2026.09.03.12.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:36:26 -0700 (PDT)
Date: Thu, 3 Sep 2026 21:36:24 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] super: remember whether freeze holds writer rwsems
Message-ID: <apnKz_3xD-zbw0dM@gmail.com>
References: <20260903060855.4610-1-kmehltretter@gmail.com>
 <aplro1ObQ5YNZT6R@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aplro1ObQ5YNZT6R@redhat.com>

On Thu, Sep 03, 2026 at 02:44:19PM +0100, Oleg Nesterov wrote:
> > Tested with a test-only KUnit case in x86_64 QEMU on linux-next
> > 32b6ef9a5d0e (next-20260902). It freezes a writable ramfs, sets SB_RDONLY,
> > thaws it, and calls sb_start_write_trylock(). The call fails without this
> > patch and succeeds with it.
> 
> But I am curious, how exactly did you test this?
> 
> ramfs_ops doesn't have ->freeze_fs or ->freeze_super, so
> ioctl_fsfreeze() should fail?
> 
> And how it is possible to remount with -ro, reconfigure_super() should
> see sb->s_writers.frozen != SB_UNFROZEN ?
> 
Hi Oleg,

Thank you for the review!

The original test called freeze_super() directly, changed SB_RDONLY,
and called thaw_super(). 
Ramfs only supplied an initialized superblock. 
It did not use FIFREEZE or a normal remount.

I have now tested real filesystem error paths in x86_64 QEMU:

Filesystem  Baseline                         this VFS patch
----------  -------------------------------  -------------------------------
ext2        write hangs after thaw,          write succeeds unmount is clean
            unmount gives three
            rcu_sync_dtor() warnings
NILFS2      unmount gives three              unmount is clean
            rcu_sync_dtor() warnings
JFS         write hangs in                   VFS rwsem is released then the
            percpu_rwsem_wait()              write hangs in JFS txBegin()

The ext2 and NILFS2 tests use real FIFREEZE and FITHAW and corrupted disk
metadata. 

The JFS result also shows the scope of the patch. It balances the VFS rwsems,
but JFS skips txResume() after seeing SB_RDONLY. Needs JFS fix.

Karl
