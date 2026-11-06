Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989153;
	b=R9U8qNi2Eu27FIrka6qMHGKn+4XYDBk6hMWO2MMJgF7biqhNfNW25iB7yw1fwJX1Vsl3
	 g65nOjw4BCcKMQFDvsldcfuYncOHYqwkid7MRaSNXolA755behxGBoUbDfO8sQySKSeiQ
	 YUEpJg/Q99WK2FybyBzR2teMt+n8L5tEzN7+QniT6NkQqMwg5RTTBWMMbQ0gyXBqqF2PG
	 VqIUbqR8r64seO43CShPiCK2PDTJErD0EyU+UFKHBMUAIsGB7Z8rpGiVreuj2XZSeN7hF
	 rEVeiZHngGJQSB2afSYk0CuOyfT4SwosrURFsCQTxqV5wC61yxe5hkgkD7ld/DuXFvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CAF05veWd1mXwHgLUVPA/XS7GxgSXTHbtWBtdYeysgM=;
	b=TG7OAtvt2vCP4uI/3zcI4s7Benhcx+21+Pxa20uEeegKHwlWHNaWJekJeVx5gjOiGhg4
	 iEFGfHi/UyaVtS1iIJ4JQHEI0szyTD6hEUxD3RrRYPPKccgrd+JYFN11rwTxJBF1qUKgz
	 L7sAC+DmUCk2VQywE1aCfwRIHcniGsTKl4rzixfF6wnj6NNpGcS2mk31M2ggMd2h/8noA
	 n0YQKr+tdiPBuqWBXp/gGP6Duz2a6G1svhoD27A8F5mlXREFJLdygey5tAO0iFugu2Hje
	 shjOs8dBZJKnZPr458aC4fWfxat/c7kPeVPrXUAOhrLdVrQ24BevOxelGTrZ/PNe7dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=LVuBiX+j;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA41606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA41606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=LVuBiX+j
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53a448f86e0so502535b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793989152; x=1794593952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CAF05veWd1mXwHgLUVPA/XS7GxgSXTHbtWBtdYeysgM=;
        b=LVuBiX+joeb3pSJCi0epMSN/iLWHS48SKAnhhJR8pws4FBtgVL6RUoWpGdeeTdMq4I
         G6W7n2kTNnVElNS9HZevKmcgGkMQRXn7JWHfAtp38xR19DFlUlVVOh2xXr+DEFC3JRzv
         IEXTglSmZ2tTNW72/KX0p3676c0MA8s0MCsco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793989152; x=1794593952;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAF05veWd1mXwHgLUVPA/XS7GxgSXTHbtWBtdYeysgM=;
        b=A//9Mn6I4QechvwXkJ5p1RDSIOMeScdc1xWueaVQkgw7vYv+mB0sUJ+eQbj0zF/YVx
         eJam+j5umEIbs0KQXGr5fhtS8oBiocimItYpL8eJJIy1Sxftbqa7oZXUYT4klOM90Yn9
         FBybsv17y1zc0anYlJFM6XNPCH/J0qxi2UvKETSj5zZWHvCR4V2EoBFZPggJWbcNZk0+
         c3xr8pbVnRNnxqT91JU7tqfxWbNPX6q3PP1/ZsEnxRp7I7GGo5ppCHJHxXFCqsVIAPDh
         lXypnaf9tWYzJ4Pu4/MQiuWXjneoEJVN+95ZrXIZ6J4zd8Q4e/gXaeyx3/E6n+fC8Cp2
         p4Vw==
X-Forwarded-Encrypted: i=1; AKwUvBzt0Cxb4WThVsmP+z0WIHkIegr7bbY2cDQscJ0xLsng+nlEd7NgnDtt2vwjhvW7D9+FsPzrD7rXeRyAaPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q286iGEKhSEnmvCtuUZN11dZgvLcTVnFP1pnCWNgYaWNHHD5b
	HsX6ntZDqMmtNi64z1bKVChhEznvK0iHqtwGfixIrf9nKBC4yUQZbEFATiGzOJ6SqXQ=
X-Gm-Gg: AYBFou3brcDgu0kOZyAzVSKlSOvsiaTYXjzhgMow+Vvu7CWcjIPn/+faVHo9qX4lyIo
	UNpzZ7z3aA8JlBerLcl/GOUJ9tQhg6LRUPPjv9/4pDD3MdUNvtycnpKMCOFQEYNvgxX9XH7x63L
	cp2jSJ8X8KUUCiVo5hMYogH5c9sVN/3+IY2RkbUayIare78XMix6wlD3yenSwcLX9pTyaz9dJuJ
	NiIjFbnpHR+/KyShDysmZerblDz3S5bzwJ2maUcTa6sSbMp5o96cUTrnVWqBoxDbyz7Q7ORS9ea
	A6oRloXE4XGMxz6owiLyGfGnB79HFZZqHN9uECYBcsEWrIzNGv+T9m6Paz/hMB2qrdF6FjTTRFp
	cqhxEtKzwhMxZOrQg6NY890LpAocx1cJ/40x4MHa3fEF0hVQ/3vVsa9wL6RBbkVvaF4GIPb9Yf9
	SIQNz9vnQCapnW2wXwF9VnnQlhGsinQ9KGpctOOWaXoWRSrwNLoRIpyY67IX7MmmxEyD3wYPlz9
	iy8qaE0yE42AIJ4C0qANlN2lpVM0VkfTKb4M7cxdu7Iw+0OnVTHk9qGInxAFJKlPPKXlXFzA1Pd
	rjs6xy81f6lo2i7o1+th9c4lylS7wcklw5BUqI36lyhkkUvNgjGTbTOMb2/BY7bn6Kp4TZ3YQby
	+iDSp4HqwwIO1AknpI9Ww83a5KoyC
X-Received: by 2002:a05:6808:1a21:b0:561:fa43:1b2f with SMTP id 5614622812f47-567e0fc17c3mr2329340b6e.20.1793989151828;
        Fri, 06 Nov 2026 10:19:11 -0800 (PST)
Received: from com-75606 ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7e5f6e2sm2027411b6e.11.2026.11.06.10.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:19:11 -0800 (PST)
Date: Fri, 6 Nov 2026 10:19:08 -0800
From: Kyle Zeng <kylebot@openai.com>
To: kernel test robot <yi1.lai@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Lukas Maar <lukas.maar@tugraz.at>, linux-kernel@vger.kernel.org,
	tglx@kernel.org, mingo@redhat.com, outbounddisclosures@openai.com
Subject: Re: [PATCH v2] futex: Use a keyed hash for global futex buckets
Message-ID: <au4aHJEyPVADFf7L@com-75606>
References: <20261019183334.29433-1-kylebot@openai.com>
 <202611050816.9e42490c-lkp@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202611050816.9e42490c-lkp@intel.com>

On Thu, Nov 05, 2026 at 09:04:47AM +0800, kernel test robot wrote:
> 
> Hello,
> 
> kernel test robot noticed a -6.0% regression of will-it-scale.per_thread_ops on:
> 
> 
> commit: c44a057178cbedbc04c63404258524975e87a64f ("[PATCH v2] futex: Use a keyed hash for global futex buckets")
> url: https://github.com/intel-lab-lkp/linux/commits/Kyle-Zeng/futex-Use-a-keyed-hash-for-global-futex-buckets/20261019-113334
> patch link: https://lore.kernel.org/all/20261019183334.29433-1-kylebot@openai.com/
> patch subject: [PATCH v2] futex: Use a keyed hash for global futex buckets
> 
> testcase: will-it-scale
> config: x86_64-rhel-9.4
> compiler: gcc-14
> test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
> parameters:
> 
>   nr_task: 100%
>   mode: thread
>   test: futex2
>   cpufreq_governor: performance
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202611050816.9e42490c-lkp@intel.com
> 
> 
> Details are as below:
> -------------------------------------------------------------------------------------------------->
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20261105/202611050816.9e42490c-lkp@intel.com
> 
> =========================================================================================
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
>   gcc-14/performance/x86_64-rhel-9.4/thread/100%/debian-13-x86_64-20250902.cgz/lkp-spr-2sp5/futex2/will-it-scale
> 
> commit: 
>   0fcb05b723 ("Merge tag 'libcrypto-fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux")
>   c44a057178 ("[PATCH v2] futex: Use a keyed hash for global futex buckets")
> 
> 0fcb05b72344f408 c44a057178cbedbc04c63404258
> ---------------- --------------------------- 
>          %stddev     %change         %stddev
>              \          |                \  
>  7.026e+08            -6.0%  6.607e+08        will-it-scale.224.threads
>    3136755            -6.0%    2949754        will-it-scale.per_thread_ops
>  7.026e+08            -6.0%  6.607e+08        will-it-scale.workload
> 
> 
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are provided
> for informational purposes only. Any difference in system hardware or software
> design or configuration may affect actual performance.
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
> 

I wonder what is the best way to run this above regression test and what
will be an acceptable threshold for the patch to be merged.
I'd like to iterate on the patch, fixing the issue while avoiding the
the performance regression.

Best,
Kyle
