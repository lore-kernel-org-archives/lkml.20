Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2663DAABE;
	Fri,  9 Oct 2026 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540546; cv=none; b=Ys5NHs3s5iBdXCsRRbkt7GLKt1jaeHfR6JXhtU/x8JZH6VJV6LCfWF4AW8g5OaeUZLvF8OC8ZQoHca6XWQ5IAe8zabmAhgJmNTy427ig3B6T+YjAzj9w6jT1CEgm5w/HaMOgDyjPVnSvEJI2ptpvpdbrjG4xWOaIGSE2eCz4TFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540546; c=relaxed/simple;
	bh=C5nIS4a/9RI29LZzKYAyHnILJQkRS6aCWfMhWAQKmY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ryzu+A1Ww3G4BATHaPxOwutDkneq6pAJQeVjAKRqsk5CwtTJgs4clMzdUwkgoVjHD0F+JRl+3tdGlm9odhEH8vMQ5iXsVEAffmKBIW2YCEaqN0qmNZ4vzxFqjv7mSCcIY43L0iQ1FzK/b6FdAD5wNnisS3CEVeQMqm1Nhho9Yr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLPZP1/x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLPZP1/x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2A61F000FF;
	Fri,  9 Oct 2026 10:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540545;
	bh=4LZuJjMCZ/U5VB2s8tUC7MOstEljx0l7VDAINwd8w3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SLPZP1/xjg2nSzodVoUSaFkb22uWE8pf3MBWmwCJiMo50rveRrJ50gZU1Dqb4Y//C
	 5YJlLwiEmdT5kJQDTKRpI16ViHxvBXcghfcWZ6bqLP0X4GMDqrj84ZYiJLrMj2VVPW
	 piWtv8Lb/e9jiiR7wn7WcnteCDILI9EuYeNjrQGaDDpeAZbosQH/ks57ngbaDKnMbu
	 M/iqkl2UqpuAtdtoQZR/KkhEqIxlEiOEuqs/wWYYsc7iMtMZFtl6l8RvVMwENaL/0S
	 QkAw3MpekRiNlgWUHun3ewmKuN0oIj7Np+ZOpEqRlxzvhyC5gw8x4PD3TVKDuAnyWy
	 RukG02iDb6stw==
Date: Fri, 9 Oct 2026 06:09:02 -0400
From: Sasha Levin <sashal@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <asi9PhPrAv0StYEi@laps>
References: <20261009083137.3-1-sashal@kernel.org>
 <20261009093835.GA680229@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261009093835.GA680229@killaraus.ideasonboard.com>

On Fri, Oct 09, 2026 at 11:38:35AM +0200, Laurent Pinchart wrote:
>Hi Sasha,
>
>On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote:
>> The Maintainers Summit reached consensus to deprecate the Assisted-by
>> tag. Remove the documentation requiring it.
>
>Please explain the rationale in the commit message. I'm sure you know
>how sensitive this topic is for many people, the more opaque changes are
>the more questions and frustration they will generate.

Ack, sorry. Let me withdraw this patch until the LWN coverage is up too.

For context, this wasn't even on the schedule: I believe it was Jon who asked
if anyone still find it useful, no one really voiced a strong opinion in favor,
so we suggested that we should just send a patch.

-- 
Thanks,
Sasha
