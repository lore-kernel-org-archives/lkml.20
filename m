Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F933A2E39
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724162; cv=none; b=dowR38zwFo0J+gwOlNPgOMB76jPA9Geq9GBg5BB7YW/Uaz3a0Aplnq5AydUD9KNPSX5LHQhfCGgd8Fx9Xbn98//PX+pPgr5TI7SyRUQOG6s579GtdHT4ZsEj9dpDV2ok4nrXeQu86ETAx4JW2utUJ2jLex47u6T2MjwVhHQBwo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724162; c=relaxed/simple;
	bh=0SiqnGEHfV8QnYsdfobUysNm1KMhEbaxP7IVdhYF+nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lodjJLm08u1/vi7E7mNVMw8Z0FhwGaJ7NU+e1G3OSkVtydpvCg6MzvqeBiWsMQQ2hP4nU7WudGsRanLU2e+WDHJNkkrrdnHTEt1pNRLIFnAJV7JCHXHlL0m7KR3lJCCM+fO6fFaW6LqocB4QkU6ILY/wEjvhSjY6WEZFwvSOMGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUlM7AyS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUlM7AyS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d8239so3908965e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789724159; x=1790328959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qmipB2sS5GuYStzHQ237S1oca/1nec0HMtyjA0gSIjU=;
        b=kUlM7AyScERlny/ui07b5Q1DPcQBnVk9Rp/FUY6BqUnaXW8CpWu5I2m9iWFoQrrtxq
         RqTjxhpMExFqAMNrE3OOrae5Sk0LDfYKLcI9afjv7TbcFpPJvGmJj6LSyyiSKk7xVxN1
         Hbl8zsJA/8+zD7hrXPkVpRglz1rw40l5LrsyeHBq28gQ6Gw1E6oOA+eal4MFhPywYuZf
         stsjA37QG7BJxdTrC7TNXf0vHPms5ZXmog1rNk0R3pid4NoqJXpEXJHfSpQU2XP5Rz4S
         qcCYvq2ayRChEqKxHeBLr/7if2Bpr5zetSKvsFbX11Ncg3O8FYFIoSSM7lfCUMrYwMlR
         NH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789724159; x=1790328959;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmipB2sS5GuYStzHQ237S1oca/1nec0HMtyjA0gSIjU=;
        b=LAWjSCjjD9ney/tgthDwR803YJ+V+uTc45KT3fg/+yWTZlHCkY/AtqEQrG5/sA2M/c
         HcFbw6XozfXTEve14eZ8doPiqcczpME+e4qH4XPf7xafzuuSJoLEs3rOQmIr5CuCs2aG
         KBU8Kj8DZ78ZiX/1UhbHZx0aOy4kG5CsjIzIOT5hPJZa9OacwyshUfIJsowB4RF6QEPR
         W1rnPbytLmGx3GOCJ8x8FwE9G7PkKQlZkZvImixJWJfND+mSj1sTLRMXlEBDvsGCvA42
         mCmxDneqVmzlfdXNtPY+x5hVoi23n/Olx6RN7f5T3mjo0GnocWEcWs4M4l+2/e4dDFSe
         pxFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKskhFtBS/6kagAlZCqwVQLCaPWglBAwm9CkCBUZKxCZI5j95uUxLh7ZIZ7nakf+VQoI3Wb2WVJPBE6Us=@vger.kernel.org
X-Gm-Message-State: AFuF++mLfCyGFeIDeAEiPwYhMJAmh6/zUxJfoEQPNAwn1lDwz79RHRfj
	n2cITxP6P7/vnHbwkFd108ilX+aIUt3qYek+GHSB0TIsYg706ZKHm3Dy
X-Gm-Gg: AYBFou1sANBVzfufHsiyf2hsTUBeYLBsKtESZo+TMoCXFFhP64bEeBrZzb303r8Qsyg
	ZaqUT8zPdbkZ7345umJDDz1vddGg+8iN81nuQACUDXaKtq5WakINhlRXmXIiQ8Un82Az73wY2MN
	d/jbGSiimw7J+C4hVpyim8+flvpJhpl0xcqSfV/f25A9TokEWKH3lt3rBxaYjOUUEq36+nDcOSQ
	aGhuvhL4qMJmF58Tg4qw+lBO4QLg64t0oHSrRWpvvQ7r0VEhELQn2GGyZqog+JPdK/Lmtcf7gL3
	YUUde53x81akcSV3nqR8Kla6Yl8i6ceD/W4Htm0SJIIcHf0zF/6fpnvwhQM4MiLjeS1h4mBSCuJ
	p6KBci8LjWa7jbYx+pycA0Hmj8bSNhPSn1AiVaEdua8WZ97TkxEzLajhXOTMTgaqnnMqasxEJqG
	Dk9dAoS3Hc9WXasM5U7y2ZRu6oEJDeu0S+agCAJGQG5dLt7PbbpR9Yu0lj98lSotBKlXEr8sQJp
	wtWjDKC6MLlBcZ2btBrjJ/fIVLc41cbBPVM
X-Received: by 2002:a05:600c:4695:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49fc55ac96emr25375345e9.0.1789724159291;
        Fri, 18 Sep 2026 02:35:59 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7ce03dcsm41256665e9.5.2026.09.18.02.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:35:58 -0700 (PDT)
Date: Fri, 18 Sep 2026 11:35:56 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jiayuan Chen <jiayuan.chen@linux.dev>
Subject: Re: net/core/bpf_ksock.c:221:18: sparse: sparse: symbol
 'bpf_ksock_release_dtor' was not declared. Should it be static?
Message-ID: <aq0F_C4nRM6glHI-@gmail.com>
References: <202609180339.0L7nLqNo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609180339.0L7nLqNo-lkp@intel.com>

On Fri, Sep 18, 2026 at 01:34:41AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
> commit: 7ae4eb14c5f9d9bf0e0feabeab206151b1280512 bpf: Add ksock kfuncs
> date:   5 weeks ago
> config: i386-randconfig-1302-20260917 (https://download.01.org/0day-ci/archive/20260918/202609180339.0L7nLqNo-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180339.0L7nLqNo-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 7ae4eb14c5f9 ("bpf: Add ksock kfuncs")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609180339.0L7nLqNo-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> net/core/bpf_ksock.c:221:18: sparse: sparse: symbol 'bpf_ksock_release_dtor' was not declared. Should it be static?

This looks like a duplicate notification of:
https://lore.kernel.org/oe-kbuild-all/202608171256.McaD8rfl-lkp@intel.com/

And we concluded in the other thread that this should not be fixed and
is as intended.

> 
> vim +/bpf_ksock_release_dtor +221 net/core/bpf_ksock.c
> 
>    220	
>  > 221	__bpf_kfunc void bpf_ksock_release_dtor(void *ks)
>    222	{
>    223		bpf_ksock_release(ks);
>    224	}
>    225	CFI_NOSEAL(bpf_ksock_release_dtor);
>    226	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
