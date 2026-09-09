Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC75F5293F3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950340; cv=none; b=mq/KJFDf6nA8CyhWJsxZENW0KIS5mwUzYAfkzvcrm3tsqqJ51NR8GN92L+McZb6tNSaM5UYDhVTdFX00YOUA6KDWNj2Gh/BrJXywUnaFz3Ph7RUDt/Y1KkAKruOYOXDc3NpqgLawPajhKMwQCNf9YmhaPMYd6iMGwTIdd5j2ohc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950340; c=relaxed/simple;
	bh=YkloEnC0ZLgVBAr9ognXw8nBjhZnbuHMLQa1IYu83xI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Dmz28XP2jdUchn0jqrMWcH9xH97ORwTRPfKh6ezWGU+VL77qMlBGwJkLySNh7UMODk247fzfiHFeYLtwBd5Jb6a55FSuyF3e46gG7LqsMDRt0Mc/CokghYzuDSvE+nLTZZdiJDhFb6Q494TCEL8sP+tAFrohvd2Nkow6UI3Q+KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfOHhuTZ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfOHhuTZ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1677c91969so592340266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788950336; x=1789555136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acKyLSiBa5vUJd8dKJMdIgaytIHA9Ytzui4Ses8+1M4=;
        b=IfOHhuTZiRYEWXjzvqJCapBUZJDZtV/zjwE2dCxhbfI8n9lK9OB+a5RbXBC9Q5ZWTn
         Y6HR3KStigsLaES2gqa5ft+pt71vy6HcTprGwRlnanq3WNYWPLm9Rs2jZs5Ldt81untD
         vTiooe53IuqkchjzDVgVe7u6fGu8wr5oI6tSKJIHE5Z6TjbWTbAGdQmrQx6VjOR6INtH
         kKrtTpAbAKC3jKVwAwDm1ErjGGyK9xlR/0CD0LA9RQtH9h+2lhB7x+phCDhd+J8REv2w
         PmPHVkYw9pxtZKdc9YcNBOQpc8R6HSmQE5uPtLzjp4H5CIqENFmBUNjMBunWEjmrDQAT
         sXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950336; x=1789555136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=acKyLSiBa5vUJd8dKJMdIgaytIHA9Ytzui4Ses8+1M4=;
        b=jdHQOUNHsBf1xYVZQdlZBUOxsTDH4VYDhc7GMhuHJ1zM7eaP75Mlu1WehcTg6TB2xp
         2yTLqUfZDHy+UcfiEuPk6MgJE3qYbsnGoeR3/LeUGPaYRhk1y8G406/kR5gtcB/mCsNl
         EO+2VBisqquWCCEVxONuiAn/9uJ6CFis2UdhIg+D4lPtTO/DH9rhvxJQ1qu3Q7Zn/K3I
         C7tfQUs8mn1FqK/yHsG3GwX+QXN/lhKdZYxt6qkwwaLPeZ5ENoS7DuMj9p6xYaF6ABU7
         MhsdwTg0vAzHHNIju2KH+n2dudna+mtb6hWqq+kv1wPqJ7oO7YiF6Uy+wHr66Qx/H1Rv
         s+6g==
X-Forwarded-Encrypted: i=1; AKwUvByFBDeeq3s/i/Lxxr56njukoLIRcMDZagv/L6rpuzjw0wdEtBZpCB7uvQ2CL8OG8JGwVz1HfO+MJ5HBTvI=@vger.kernel.org
X-Gm-Message-State: AFuF++nI9pnGn8m6un3HR8z1LQQ8RbyI/O3+MfiuTB+aUxkRlF9wk6TQ
	8oK7snmO5zcdn7I4GfQ4elOR3Q6zyO8CmFctEmhn8BJMLuT3ZRyAYV8K
X-Gm-Gg: AYBFou3KwZdYtlkEmUcsVqqCyiYEstksmmUe/Ou9HrsZmt+ANFANjYSYgEUOezWpyWM
	GILA83CIxVwkbmbnTEpnaBvo+GYGRehBHtwC4eVVhij+8WL0R8XvpYMUYZ7emMPGor/W0RngWFH
	IutA0eFG9kcW3sX2KGwYGSMcUMdAn06uLylgNeHRMTyfw0vOR5axrqYBq59B32NvxXW8OP8G1nv
	npGYJmVL8sPVOGgQjvLdT0WMOlX0ZScUKoQ0CudYnbrWJiwfFW09ePVYbVRp2ODmy4KNAcqhbF9
	0Ag+fobLSM1evMbrydws/gUSFOjxtlTtnJP+UjWGoj2YySYqDx7imqb2pJcoiJVtSo/3p1u9GNj
	MY+i7fgN44vLl1vvH/shRoV/VC2b9uE4wQTZLl+Ve1vERrmsVYlQBQafWQbDRR41NO13BYpvSay
	smpaMBlhSYJHEwG2iryj99Zuwu28VyYdHO+ZeXEF6G1YROGk5ILs8IjXWwJInVxtEsrbd2U8XY6
	OdX8g==
X-Received: by 2002:a17:907:9485:b0:c25:541:fd3a with SMTP id a640c23a62f3a-c260c7b5cfemr1361234266b.7.1788950335902;
        Wed, 09 Sep 2026 03:38:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm744470666b.63.2026.09.09.03.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:38:55 -0700 (PDT)
Date: Wed, 9 Sep 2026 13:38:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Priyank Rathod <rathodpriyank@google.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v6] PCI/pcie: Add PCIe Lane Margining at Receiver (LMR)
 support
Message-ID: <202608260405.gHL6gOJf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-pcie-lmt-v6-1-bab4ce233fa5@google.com>

Hi Priyank,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Priyank-Rathod/PCI-pcie-Add-PCIe-Lane-Margining-at-Receiver-LMR-support/20260824-223812
base:   0f23d56f17fdfc7db69d51f64c8b91bbab947aa9
patch link:    https://lore.kernel.org/r/20260824-pcie-lmt-v6-1-bab4ce233fa5%40google.com
patch subject: [PATCH v6] PCI/pcie: Add PCIe Lane Margining at Receiver (LMR) support
config: powerpc64-randconfig-r073-20260826 (https://download.01.org/0day-ci/archive/20260826/202608260405.gHL6gOJf-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608260405.gHL6gOJf-lkp@intel.com/

smatch warnings:
drivers/pci/pcie/margin.c:1005 pci_lmr_exit() warn: variable dereferenced before check 'dev' (see line 1003)
drivers/pci/pcie/margin.c:1020 pci_suspend_lmr() warn: variable dereferenced before check 'dev' (see line 1018)
drivers/pci/pcie/margin.c:1056 pci_reset_lmr() warn: variable dereferenced before check 'dev' (see line 1054)

vim +/dev +1005 drivers/pci/pcie/margin.c

ecb76f560cf217 Priyank Rathod 2026-08-24  1001  void pci_lmr_exit(struct pci_dev *dev)
ecb76f560cf217 Priyank Rathod 2026-08-24  1002  {
ecb76f560cf217 Priyank Rathod 2026-08-24 @1003  	struct pci_margin_dev *mdev = dev->lmr;
                                                                                      ^^^^^
Dereference

ecb76f560cf217 Priyank Rathod 2026-08-24  1004  
ecb76f560cf217 Priyank Rathod 2026-08-24 @1005  	if (!dev || !mdev)
                                                            ^^^^
This check is too late.  It can likely be removed.  The other warnings
are the same.

ecb76f560cf217 Priyank Rathod 2026-08-24  1006  		return;
ecb76f560cf217 Priyank Rathod 2026-08-24  1007  
ecb76f560cf217 Priyank Rathod 2026-08-24  1008  	pci_suspend_lmr(dev);
ecb76f560cf217 Priyank Rathod 2026-08-24  1009  
ecb76f560cf217 Priyank Rathod 2026-08-24  1010  	pci_margin_debugfs_remove(mdev);
ecb76f560cf217 Priyank Rathod 2026-08-24  1011  	mutex_destroy(&mdev->lock);
ecb76f560cf217 Priyank Rathod 2026-08-24  1012  	kfree(mdev);
ecb76f560cf217 Priyank Rathod 2026-08-24  1013  	dev->lmr = NULL;
ecb76f560cf217 Priyank Rathod 2026-08-24  1014  }
ecb76f560cf217 Priyank Rathod 2026-08-24  1015  
ecb76f560cf217 Priyank Rathod 2026-08-24  1016  void pci_suspend_lmr(struct pci_dev *dev)
ecb76f560cf217 Priyank Rathod 2026-08-24  1017  {
ecb76f560cf217 Priyank Rathod 2026-08-24 @1018  	struct pci_margin_dev *mdev = dev->lmr;
ecb76f560cf217 Priyank Rathod 2026-08-24  1019  
ecb76f560cf217 Priyank Rathod 2026-08-24 @1020  	if (!dev || !mdev)
ecb76f560cf217 Priyank Rathod 2026-08-24  1021  		return;
ecb76f560cf217 Priyank Rathod 2026-08-24  1022  
ecb76f560cf217 Priyank Rathod 2026-08-24  1023  	guard(mutex)(&mdev->lock);
ecb76f560cf217 Priyank Rathod 2026-08-24  1024  	pci_lmr_disable_locked(mdev);
ecb76f560cf217 Priyank Rathod 2026-08-24  1025  }
ecb76f560cf217 Priyank Rathod 2026-08-24  1026  
ecb76f560cf217 Priyank Rathod 2026-08-24  1027  static void pci_lmr_reset_software_state_locked(struct pci_margin_dev *mdev)
ecb76f560cf217 Priyank Rathod 2026-08-24  1028  {
ecb76f560cf217 Priyank Rathod 2026-08-24  1029  	struct pci_dev *dev;
ecb76f560cf217 Priyank Rathod 2026-08-24  1030  	int i;
ecb76f560cf217 Priyank Rathod 2026-08-24  1031  
ecb76f560cf217 Priyank Rathod 2026-08-24  1032  	if (!mdev)
ecb76f560cf217 Priyank Rathod 2026-08-24  1033  		return;
ecb76f560cf217 Priyank Rathod 2026-08-24  1034  
ecb76f560cf217 Priyank Rathod 2026-08-24  1035  	lockdep_assert_held(&mdev->lock);
ecb76f560cf217 Priyank Rathod 2026-08-24  1036  
ecb76f560cf217 Priyank Rathod 2026-08-24  1037  	if (!mdev->enabled)
ecb76f560cf217 Priyank Rathod 2026-08-24  1038  		return;
ecb76f560cf217 Priyank Rathod 2026-08-24  1039  
ecb76f560cf217 Priyank Rathod 2026-08-24  1040  	dev = mdev->dev;
ecb76f560cf217 Priyank Rathod 2026-08-24  1041  
ecb76f560cf217 Priyank Rathod 2026-08-24  1042  	for (i = 0; i < mdev->num_lanes; i++) {
ecb76f560cf217 Priyank Rathod 2026-08-24  1043  		mdev->lanes[i].timing_val = 0;
ecb76f560cf217 Priyank Rathod 2026-08-24  1044  		mdev->lanes[i].voltage_val = 0;
ecb76f560cf217 Priyank Rathod 2026-08-24  1045  	}
ecb76f560cf217 Priyank Rathod 2026-08-24  1046  
ecb76f560cf217 Priyank Rathod 2026-08-24  1047  	pci_lmr_restore_aspm(mdev);
ecb76f560cf217 Priyank Rathod 2026-08-24  1048  	pm_runtime_put_sync(&dev->dev);
ecb76f560cf217 Priyank Rathod 2026-08-24  1049  	mdev->enabled = false;
ecb76f560cf217 Priyank Rathod 2026-08-24  1050  }
ecb76f560cf217 Priyank Rathod 2026-08-24  1051  
ecb76f560cf217 Priyank Rathod 2026-08-24  1052  void pci_reset_lmr(struct pci_dev *dev)
ecb76f560cf217 Priyank Rathod 2026-08-24  1053  {
ecb76f560cf217 Priyank Rathod 2026-08-24 @1054  	struct pci_margin_dev *mdev = dev->lmr;
ecb76f560cf217 Priyank Rathod 2026-08-24  1055  
ecb76f560cf217 Priyank Rathod 2026-08-24 @1056  	if (!dev || !mdev)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

