Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38063DC857
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789710140; cv=none; b=je/o3JGzwqX6uRhxnKnleei00rxXWczAhQmOYTcmdiDnrfcIiVddi0IA0GzptxveJOHS2LSTI9b9uLyR/M1U1hajGALR3jhP07sFMtkTY+n3W9FyCPHJklmwfC7sOHAF6joMrGuJM2+fiFP6KbEckePgMFOwewUSm55enQmSACg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789710140; c=relaxed/simple;
	bh=yVWYCAES8eEILc/q59oilzjuq+NKlghMwE3gBcGq3ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mehjUlQSgmnZcVbQcxyH9RhVAmGprIXl5LIEMnkwd5OnnyjKVhTWdRskEe/yWVNpttrjXRM6lvGyTuSziuf9hk9Gf1LWN1SAvrMPcmXZOPwaClgrblsyASh2RkmAVq05MlN8Lgn2/I9CJtvxCUYd8kzpYnYYtIHlAWQOeu/+/fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8dp5hzM; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8dp5hzM"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba91so250021a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789710139; x=1790314939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ibODzx/cfdGUU+chUXT4raQ1MJ3/BzeHLiGxfxTtRwo=;
        b=n8dp5hzMdXe9U9Q+aPbu5kRbvFbDQNzeU8cZF/2Tce5SC6D+txmokekXwgCYf78aW9
         z5CLRMBLqJLGe0u9pmxYngJEStHX3sBkfBLtu2xbAgtGS/+7s0wSAi1O4QjGLl9W0P5Q
         mSzy1KELVaUFzAjlbaIqU1UHBxaTXoJ7H/XA8PJpvQ8Y/s+da+/BDiK5JuQwT5fOPHvZ
         M41dKoxX5x2Cvmi41FCGJd8crShgO48EvHBP/0Rr8sQn430fJWygxIcC7jQDtCeFzAWj
         m3UebNwapWRSUIN+ciyGlqaSN7xNQUGQKpw4AvnCNtS29gOWancHq01U9W/U+4bcU/8z
         qemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789710139; x=1790314939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibODzx/cfdGUU+chUXT4raQ1MJ3/BzeHLiGxfxTtRwo=;
        b=2GB3JdQslHgTNL5658jD1zGdbUtUyvdKWyIvBlKFjf/q4KAu1/xhlODTvJsWuUrVS2
         +kUHAtE/ALJY/BIwzn5P0Hc4oVgRqwtii8Iw3gDVhd2RRTRWYetLes2v9oqKOdRbLJr4
         JJvwDmnCPXS229KI/6Lqz/W00TonX0sSBEXh1p+G4O8Y2y+4gGjhf7xDI5il9AICcaLr
         iROufI6WV+clZE511ptS7W6ErRc6OAlgM+h5y8GfeD63yfdebPy7NMWPQxkTSjV4fqM2
         S1sPYt8xKfyLdCdZWfVR5PUz9RQWO+KyhOI+sz7JH1KS9uplnlg4azUlb843A9XviPDx
         Viug==
X-Forwarded-Encrypted: i=1; AKwUvBwcE6Nom3wPORa15yzM0VAAh886R4mwco9ZlOxNuWeFR7+CALZlE4h6Qt8j3B6wLSFcpA7DglluDCMAf4w=@vger.kernel.org
X-Gm-Message-State: AFuF++lOz7y42uyOKk6pHV6ogH7iV4VZR5+RYLsw/8sOPIyopjrw31Nl
	mymIYhOaCP+BQF37eGLAW3dforS2qlu3f/cb8ORwYaOpqN0AeHOj2q8Nny9UpEUw
X-Gm-Gg: AYBFou0nSiWQHu54qKKMa3Oq0TRjVGq4x1tboTBc2lNPfN5yIDZy1w53I5kF+y4WPwU
	l3jFxaIdMmQoRoNKJ+K/cFk5koqpKQ6CpD/ww1PtsffuTzRfuC9+edI28siM4l8O2d9rMslTRmM
	DhHUbAMtPw0GxHjEJERnbA2oFMEfbmcAba09FyYgV1V2EOD5OIgzT2WdyUWYb6ZCcxlMdMANwsW
	+4Ep8ohywDnnBPrKlHDHwkL9cYtsf7H4f1ZZntNU0okSSs4OHFoFm3oVBffdn+p0Rj4zmAvIbbQ
	B3WTPsYe7t6dC7PX3YmuHHMSfdAfvHsPDaFedlViRpwr1cmeps17eTA6F8lUDKaMlOIJ/oUJP1C
	7scEHNhVlYyqxuIYxDozIizBanvIMr9LCRCc0L3fJ9Uy4kSHQP0IpcduQfLySnXUFIDx8EBiOa0
	pvsXjJxN41whZPAPF/08FZJ4ZZsbPnjWOhkdgWotflXToYUQA2ts4QBSiSMav/nMdCMteDUB41k
	MMpRrTPfc6wevDEoJjNqotbt2Fn3ga3eU0Mh1w/Ywk=
X-Received: by 2002:a17:90a:e7c9:b0:39d:f615:725e with SMTP id 98e67ed59e1d1-39e54bc3a8emr3181270a91.13.1789710138647;
        Thu, 17 Sep 2026 22:42:18 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cddb4ca1sm1662621c88.2.2026.09.17.22.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 22:42:18 -0700 (PDT)
Date: Fri, 18 Sep 2026 11:12:13 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Link Mauve <linkmauve@linkmauve.fr>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: warning: unknown and unstable feature specified for
 `-Ctarget-feature`: `mma`
Message-ID: <aqzPCnhvogJ9XEJg@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <202609171549.xeqQabC6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609171549.xeqQabC6-lkp@intel.com>

On Thu, Sep 17, 2026 at 03:38:46PM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   238650ef6c7c7cca08e032527329424c9fbd70e5
> commit: bc87cbdb952e9223616b839d64bdb4723aa2ed1d powerpc: Enable Rust for ppc64le
> date:   7 weeks ago
> config: powerpc64-randconfig-r2201-20260917 (https://download.01.org/0day-ci/archive/20260917/202609171549.xeqQabC6-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> smatch: v0.5.0-9187-g5189e3fb
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171549.xeqQabC6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: bc87cbdb952e ("powerpc: Enable Rust for ppc64le")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609171549.xeqQabC6-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> warning: unknown and unstable feature specified for `-Ctarget-feature`: `mma`
>    |
>    = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
>    = help: consider filing a feature request
> --
> >> warning: unstable feature specified for `-Ctarget-feature`: `vsx`
>    |
>    = note: this feature is not stably supported; its behavior can change in the future
> --
> >> warning: unknown and unstable feature specified for `-Ctarget-feature`: `hard-float`
>    |
>    = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
>    = help: consider filing a feature request
> --
> >> warning: unstable feature specified for `-Ctarget-feature`: `altivec`
>    |
>    = note: this feature is not stably supported; its behavior can change in the future
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This is expected, the issue for the same is raised to rust-lang.

Regards,
Mukesh
