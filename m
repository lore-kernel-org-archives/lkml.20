Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF99C2C326D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803617; cv=none; b=aAvExuenLmHGvWpi+gB8+atIeRRlAOBdrVkZeDu/D/y5wKixxxLqyji1gLYYIuh26D3aJAoEzNKdq0h5LDYeq8OH7PlO+AzgD5OnvsSatYi+s+GzXVKqiFgw/UF3EM3CmAZdkTUYzFLcIQhqU5EfU70VMBjtlOqMsVN7Ui+CuGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803617; c=relaxed/simple;
	bh=kEI9OvVbWJ7wq71P6L9MVOAfwamjGbck54SdcC+yBG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9d4wVtDJkdkjTfYHHGel0g8mnN35Us1e2jM/8drU3kYTQu9VdCPZOScyRPzqVOqhH7RgASbjms6+dulHGmM3vFXRpuXWrkfF/Db5hNaqxNK2bN87FWNdvnSg6kxSOUQEduYqd2TeUrKVRLyz+GHAEhK5QlRgF2sQHcHEKbCCH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeoU4gv1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeoU4gv1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso14388145e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803614; x=1788408414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=leRlXbqgKULRfa+v/5YQeWOCF+c2KyYlCCc0f3p+zUs=;
        b=GeoU4gv18qe+m5EXpyWtKQn+QXoF6dFXTcxTV3Gs67lZ1/jOX2N1Bvge6NQBbi8wIM
         gRUDBfgwvUFNoDCd0LvaxIr8pg3TRRPGDbyCcQ56EvqxtkKdPAi+k5RSCbLljGXeTwFz
         M4U7VXSJPbVJQfAzmanBK/aHR2+H8ROOK7TbKbDYYgDi/TWNFWT71i/2BRHHmxUWaZMt
         Laq7nGPqyZSgUrzucE5K+nm/yFEue3pGOkNr8tilykxfmFeTOfAYClG2p/1i2QEGf1xM
         RYOsL9UYOBdrhI6/7VzTE+FRW79Te3v64c2ERxNMMoL2u4oc2WtNox2g9A6OkCSnlp1h
         ZuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803614; x=1788408414;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=leRlXbqgKULRfa+v/5YQeWOCF+c2KyYlCCc0f3p+zUs=;
        b=ZTwxkQlrBfvNAB8BIFXzx3p6HWqWXEVPmbcK9CEvCgiM72sb9p+G0AP6p2ScBUKTV6
         pmBonVGs9uZxN0MhjWFHBpQEzdSQsC994Q1Un22jtx9vXjayFFq2TG2U1aiGh9GOAfJ8
         W3lqAIrQIodRH288Qmk4Ik4FugCj+1BhL43GuGnueSnrb8ffzZsksEQ+Plr9KcmhGdWQ
         CSgMC0TIMy5hNd7BXt4l7EN12wR0TTxiM6SF1kqkWlj02uUbXpqBoo3HOolEuO76lsQP
         rknA4PLlp8TWX7kpQRhDdxgkz3DeWlV42Y8gN+MQQicu0NVQsXbiPR/6VLyrZiAyd3zU
         Tv1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqCjvHdCeJbC1Le0zxtqTlvqnk8bazioQCq/LTL15RQ61+MqLmkWv6jQMwEEl50zwazCfY658OY5IincCQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kLQCJi1mPWdXPpQxYakFhkkl7IoRV7WWIL2ObiQMJPqHGE6Gx2
	Uwx5CwgYKVeA/0Nbz8YMpDiE+Ciktty8aIKVOX9jOttkAavIwlzW5sSq
X-Gm-Gg: AR+sD12KG/eTOucsESvJwLF99i4oXoLg4WFmaiZlW/PjChH7oU7rtV1Gtg0zh7YTDQ9
	fBvx7HkKGl0OvVnsMGZIO/kr3roKVlpGxP8cfaUDXgnZ6OCMiYGaEi9rqxVkWRriMTZhr8X/4Su
	DaMvUSiB0qUzTtzDtf4F+zNQwFt6GWNh6s9bD4h0bPJNAd/mQNU82yARj9gyOLu4oRRzXfBGbRp
	5zRSg1BmLcFKeZfUubIiQun3MLeAt4f4jIQk9L52oTwxNtxB0UKExdF08Fgn0IxT8QhFT/yxe75
	ha0JW+rALuCtp+UxFYCQrdylXLk0rUbNpXK+o2xEkIrNywwVzq6bpWzYEZReYWwZE0AEOAy/XSr
	0MW2TLsuH5p62A+B+21LfKlVvwvBfo+w6OVk9m7cDyEJwiqtcOfLpvT7jWCkTowq9VEYwPWwcmw
	5p8DfZx99alfjqXm3sitUUmN8X8RSmXvGbN3pStyjlEMIsdEYIYjXFr9VJdxntnjH9BAKRFwoqA
	6X4e1FfA/OPwGisU0hxC0wmdZ9jbPUQ3zXqq1ET/BChJyq4rOQL+nQEFyJIx+ZK2vC+Zwf8394h
	j7IovwnwtAOYBDAzlsJ4rvY=
X-Received: by 2002:a05:600c:c118:b0:49b:c8e:8e6 with SMTP id 5b1f17b1804b1-49b0c8e0911mr59314915e9.0.1787803614027;
        Wed, 26 Aug 2026 21:06:54 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-154-097.95.114.pool.telefonica.de. [95.114.154.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499fa55f458sm31127865e9.0.2026.08.26.21.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:06:53 -0700 (PDT)
Date: Thu, 27 Aug 2026 06:06:22 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] microblaze: Fix MB_MANAGER build with older binutils
Message-ID: <ao-3jrT0aP0_fSBA@gmail.com>
References: <20260813024026.5402-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813024026.5402-1-kmehltretter@gmail.com>

On Thu, Aug 13, 2026 at 04:40:26AM +0100, Karl Mehltretter wrote:
> The suspend mnemonic is an alias for mbar 24, and both encode as
> 0xbb020004. Use the underlying instruction, which GNU as 2.30 already
> supports.
> 
> Fixes: 88707ebe77e2 ("microblaze: Add custom break vector handler for mb manager")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310310151.UhB396Qs-lkp@intel.com/
> Suggested-by: Michal Simek <monstr@monstr.eu>
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Just a friendly ping in case this got missed.

Thanks,
Karl
