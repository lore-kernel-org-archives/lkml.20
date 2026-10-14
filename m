Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1204FC8C7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977403; cv=none; b=QM2iJ32UPwEPSpmtNvH5h3i8R275KyedlN5T336vAcG89V8cCbV41s7wtEnia035Zvh6Gq6XMkQB0HatzPfrBeM1dTjF//aQmQGjc7Y7NzFU0Szg1DHte5UZI3xQJbeD4J3ki0PSKppMw47nZgKyh+SSWHt5+FBnLGkNzAdisso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977403; c=relaxed/simple;
	bh=tp12H4FHIZfWnZPromNL24YnUDGyfMN/fPAFnWcPmVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P84tKXbfZBpxHDJ2cQ4qnUsK9Uq7/2W3OdNObeuGF/qpDbGS82XeiKQgq0zhkIHiBUPB3ecaiGjGwTHjru8BeDQpm0Ctu5KuBlohAHKZvFUjqKjzcAUghY2pfpuDHh19U+JLO1+g/K9/HIELc3/wcXkH+/age2/UAH4yFkZ+zwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPjaXAkB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPjaXAkB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1681F00893;
	Wed, 14 Oct 2026 11:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791977401;
	bh=xZAOGqD0V9asvlFQFz61mG7hWqFSRvGUK+v/BohrL8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LPjaXAkB+nmSt2Am5UyGuKwwg7cy7uNdN7hMG2xRfrV69aWICyUYwbV/Z3mwTsxGA
	 lPKr7hSpadwDMU9FhWLiiuSlsJgufxn7liA7vv5XPG/lXTl/gmExs8JZcq+X5N4xax
	 DLw5hcVCgXT7mTXfNtnnrDglRvKjycDN2Di1ZcYHw4N6D7JY8BE+jzfLsEa+6fmr65
	 BcmzHNEyEzT/Ws2h1tENxDqtDnwkCTpcS64fzvEH0IZHkxK2NM0OqFUoFqwM0+7sZJ
	 zMNRZQqLzE2evQcnAOxhO8iDG1fhGwHPtcvbu5aLVgubdb8zq3uhRILJd7fm6E8GkO
	 NJ9qaSlmDzKXw==
Date: Wed, 14 Oct 2026 13:29:56 +0200
From: Gao Xiang <xiang@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: xiang@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: erofs: add dev branch to git tree entry
Message-ID: <as9ntKiOFsEN96z4@MacBookPro>
Mail-Followup-To: Chao Yu <chao@kernel.org>, xiang@kernel.org,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20261010070623.1766952-1-chao@kernel.org>
 <asqt-vM6LOPyqz_p@XiangdeMacBook-Pro.local>
 <24e13ed7-d1d3-4c3c-ae3e-8734c519b87e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24e13ed7-d1d3-4c3c-ae3e-8734c519b87e@kernel.org>

Hi Chao,

On Wed, Oct 14, 2026 at 02:30:55PM +0800, Chao Yu wrote:
> On 10/11/26 05:28, Gao Xiang wrote:
> > BTW, could we request sashiko folks adding erofs mailing list
> > to their review list as well?
> Done, FYI, it mutes by default, so we need to check review comment in
> UI(sashiko.dev) by ourself, let me know if you want receiving review
> emails whenever there is result.
> 
> https://sashiko.dev/#/?list=org.ozlabs.lists.linux-erofs

It's much helpful and sorry about the late reply.

Thanks,
Gao Xiang

> 
> Thanks,
> 
