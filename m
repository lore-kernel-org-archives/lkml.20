Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE1F357D07
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789315303; cv=none; b=M0hHsGFMQsp2Jexotu/gEDV8qZe/XfS+IGI0ur0Tj8fVnRQ0jWjJRDFddRgpQ68QGeopuUHFyEDgalWsvJBCGJTgtW2cdumdl8seleG0r2CW5GY37kiHbOMc467tWVFRmYaMMZ7otspmhrTSgNi6UkSbD7L222dQWowfvMYNcf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789315303; c=relaxed/simple;
	bh=NNQeuhpt16gnwarL64jMLT4xxthD458iYttblALwYQI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=aiAOcdqloT+i0SibLgqYUT+w+hQ0wLELnpUUH64zBN+FakygY8lcxFEayJ3DYJwEL6vNN1NMIbV1nce3KXTWFQDYyp3gHg7NhFbKaphkI1qvvoaHE75iqYV+MqLbmC4aLnexlE3oYYI4AA8fzaqFk0EPvtR+rYYaNA2wU2v9M6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8FOKW/w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8FOKW/w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6F81F000FF;
	Sun, 13 Sep 2026 16:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789315301;
	bh=CQS6QXQY64MjQbGcDaeA5R62Ip3LOMp4tVshvoog/D0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=R8FOKW/wwIHcmF+I2hgpVwWG/lakKed2d5Gp+/X6d/Lrbwd9hB+JDNYJyyNVNTgmy
	 EjgjBzLWsmzErSlwKpaVTie2W8hSOtyHAPeJiKw/3zrqBJN1yfXXTPlBTIHotbv6tP
	 rKG1HDYUSLgQbxVKZcEX4UhdBTxBk7O2yESLfZUJSI8QBmvnL/FmSWyTwAhT2lPLWA
	 yQD8lX393JG0peC/KIPekHF/jDzFd9Y1hzVX+aMKntVGrdp5S1KTdhyASDXrhmxA/l
	 IzNldrbCh8XYdz28TUNpucwmZvWIIz8PrPqFwx6r7zxe3Vp+DDDrSsVSfAsfJ8bgeg
	 kbsuPVdR73SEw==
Date: Sun, 13 Sep 2026 06:01:41 -1000
Message-ID: <22e5b93e20119d75440a731054e2845a@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: tj@kernel.org, leitao@debian.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tools/workqueue/wq_dump.py: Add busy worker inspection
 and BH pool states
In-Reply-To: <20260911210625.535285-1-atomlin@atomlin.com>
References: <20260911210625.535285-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello, Aaron.

On Fri, Sep 11, 2026 at 05:06:25PM -0400, Aaron Tomlin wrote:
> +        for bkt in pool.busy_hash:
> +            for worker in hlist_for_each_entry('struct worker', bkt.address_of_(), 'hentry'):

worker->hentry shares storage with the idle-list entry, so a worker going
idle can send this iterator into the circular idle list. Leaving idle can
leave a self-link with WORKER_IDLE clear. The per-worker retries do not
bound either case.

Could you break out of the bucket on an idle worker, a repeated address, or
a traversal read fault? Warn that the pool's busy-worker output is
incomplete and ask the user to retry, then continue with the other pools.
The exception handler needs to cover iterator advancement too.

Thanks.

-- 
tejun
