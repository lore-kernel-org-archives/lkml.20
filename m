Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3D837E5EC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789008897; cv=none; b=NFgm/Xzq0eT6dTpbZ+nimLk4yaPInXoQHyNloB7Jo61XQOFb2KB8WHZOlvIfwjVdz4hu9m3XGxOEf8iL6+rrjBKHJ/zJBMc3/3K7RCmNTbUOkE+NN6vCtJMS7ilGJvMQvh0pTQe2GKzBd820REZDy6t1Fmt3iC0xX0SmLa8tOng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789008897; c=relaxed/simple;
	bh=0CsmXKkzESsxC+tRouCw17YPGjua4+WpOUOTalus1XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDw9PJHT4bmn5RS0wsahHwrbxvggBE9fjA/zd2bhP61X7m/gRhB2YiH/N1Ue+xbVmE55i2JobcGZuW9OccjBWLXn0SiL5GPIsRbrba6Rd60qzBYADPSzBGOZEK3c9IBk+ey1rNAsdTX8JXhh4ZvNv+uc9qoKyuiaojIHNfAQ5pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JP/iz75t; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JP/iz75t"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso7060585e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 19:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789008894; x=1789613694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bkqSDqoSS4X+8RqIhO4osWZcJjlcPnaK6w17Spzl4k=;
        b=JP/iz75t+dXd4pMAV06KTUHZY9xBd54UFwRwHgh5EawWWXu6jpb6GaXJChtm6vHAoo
         j2n0s07RWBavrTiD0zjiuXyPI75FnAvQACuRoqm4wXoKdccI76XMj30Wzzn/PrLHkUyn
         NvEW4tS7brBXbiS4Bf7TXDKSU9fH8iTfJOURJG9ZXIGK5+va6QybhWtDdG7c+i4qQdcU
         r7sg6z5zd4T+L/9P4kGr4GpwKU667yLzoyq748KQ/A4XitcnLYJFzq/V8yaCxPYyqh+z
         5UOnDjpyq5ZibHamQnYsF3JzvBkD9RUWDSTw/tbmZcsPR4mmrQxJwPXc30eNoA05y/TJ
         Q6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789008894; x=1789613694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bkqSDqoSS4X+8RqIhO4osWZcJjlcPnaK6w17Spzl4k=;
        b=Im5mmp5u9E1qAq03c41eiejyS4NM9oo254c7c0L798CqGEIyBLd3zinw22gIYL3hh3
         jeUECqONIlmeuMuRANXMr/mqQdot2mSoRyzA+/iKYBHomcAa4jWHCAxLuxfbc9KBBkyD
         lST6oN194AoBZaQF1idlsosFz8WMLa6YJeOltWOjelHfwFVlK9YL+kysr9+z0LaXQtlh
         0fod8+QU9xZcpGcKEpJ/84IE3iCUyYRZpwg+RVUpvVs3dYQp7gv+0Y0WFGktEbRTxgTJ
         jJ04hFLx4fZMNbdlX/00ECmEpwVqTslXFoXDZPkmJ9fsvD3ucdYjB5OMc4om7ZyUJv7H
         V7Qg==
X-Forwarded-Encrypted: i=1; AKwUvBxe+aDiO/J1X2NmSu5oZ9wE3SY52ZL1uBKZIIyTJQ09ZaYrALIS90w7l/ncVUIIUFSUl4uzaNAMG452A+k=@vger.kernel.org
X-Gm-Message-State: AFuF++mlVZ92Y6TuKVQGy/hWBeHOBDuYPy0PQosyqQfyC+qKZcaLPcbt
	T6IQcTkYmkKZyQcwdybwt1XqEnyR9T+k87LOiro/vsvAs6xqUqywvLJB
X-Gm-Gg: AYBFou0+D6jBPgfkAX0iF2E1g+ikGonzNOMzZf7bnuDBsU8NdVhWJCSSvoqM+w+MMtg
	4uLlWUMHxrTJcPS8pIaA+Njt+i91ecZk5S1JFaRdBLnqe7HMpJYBhn3fnGOlqsw66QexNysZriz
	YsPJcwZQJd6/uzcY/RH/y5fU58FswOU0jtT96hGbx2oH+ml2Z9iGF/fRaO9HzfaAT6ti8mk1q33
	alP4jUzgcDpiWcCuS1dKzIWPeZmSzBmwwBFdY+hZBlbxxpTtMKbQUeErC7LbnJH9d+xhuU8bPlg
	6RxwUQMkWJXb0AY4p2lKaQS2vVtu4Wxk9rqggKG05fUOkLMEerPuRq2UZdx0uiU97Y+3EOPjuai
	GNn91J8gndGBxHpetN/q0XrcJIcITUn267LF5qNrJ5gF1znSkgIDKlMzZtFdpre6peVNYwEw/YE
	sW8Y7WjyzSafBsrBh7o8pwh03j123wWqVkHj/hNQBqTO7GviOUG/rAveA64N9kheWMdJolu/m7A
	MJD/4YN/gLQDIJQP312j5TAityq+FliAAm+GHiriVQ33IcXq/FP+E57c1HXO2Jgur0MRBsd6xDB
	qy3DhU9GeN67afuBcgOKulLAKBS552ahGjBYS0T6W9ohbHCH72x0SiP0sP6m7ND2wMsI5Zck
X-Received: by 2002:a05:600c:630a:b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49d2592c540mr85347385e9.12.1789008893739;
        Wed, 09 Sep 2026 19:54:53 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c46b64sm33036055e9.13.2026.09.09.19.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 19:54:53 -0700 (PDT)
Date: Thu, 10 Sep 2026 04:54:52 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Quentin Perret <qperret@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix kvm_get_vtcr() kernel-doc
Message-ID: <aqIbvOvIe89_RYHT@gmail.com>
References: <20260909063156.89636-1-kmehltretter@gmail.com>
 <CA+EHjTx3fmj_fkD_ybPANyTrEApMUyBscfP4JtP-F_MRL-L=2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTx3fmj_fkD_ybPANyTrEApMUyBscfP4JtP-F_MRL-L=2w@mail.gmail.com>

On Wed, Sep 09, 2026 at 08:36:40AM +0100, Fuad Tabba wrote:
> Hi Karl,
> While you're on that line, the description is also inaccurate, so you
> could fix both in one go and save a follow-up touching the same line:
> 
> > - * @phys_shfit:        Value to set in VTCR_EL2.T0SZ.
> > + * @phys_shift:        Value to set in VTCR_EL2.T0SZ.
> 
> kvm_get_vtcr() sets T0SZ to 64 - phys_shift, so phys_shift isn't the
> value written to the field, it's the IPA size in bits. Something like:
> 
>      * @phys_shift:    IPA size, in bits.
> 

Hi Fuad. 

well spotted. A typo seldom comes alone :)

I'll fix that.

Thanks,
Karl
