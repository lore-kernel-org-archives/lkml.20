Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB36139D6DA;
	Mon, 31 Aug 2026 21:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788212581; cv=none; b=svOe1+TcOHA75jWN/jKDYMVI50Lv2JWD26UYrdHDm1CU014mQk9nBf/2sZcyKNYvIvKF8mmg3NKN/sKgNcID+xViD9KHqowRl66zObZmkpRyPUGSjxdapb/QxBMmaGfPHXYO18VjkXIQyyQjkzoe4p0FvYYxNDipoyF6b69tCOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788212581; c=relaxed/simple;
	bh=junU1NXa65WYgAd0yhVrFqA2wEWWdwszY/WGgB/unLs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y7H2hDog9dcAs+fsNOJVt5KW6VGQG6AXt9VKfGXW3BK2XfMlMDQ7b2Rt+z4UKFA2RrW18wH2wkXdspNEANbhLFE1Kewb5DHCToMI1KLwOJULVnOYihQtV8rFtZNjW45t3aksdHM+AQKtfhnerOm5Xj98rGDrCkNB5KLoJg1j8j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Mv8E17vu; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Mv8E17vu"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DDEDC408DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788212579; bh=S+yL+5uqwMnCZKuz4QGgRrFXlTFKve9EFRhcn0UbdvU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Mv8E17vuSG81IwIF6bHbU2oL4w1RcEeM1g8BXCBjiUOVndMLlWryc79WNDr7uMu1d
	 Me3waFnxk7893xaaTHQ9te+nCUis1SAbRCWYJB2ZTf/Ybn69rIIDLvbZx/Gf7xpFHZ
	 hDBTXz4fbY85Ynyn2wPT9u6wSGE0I7OBZqaIk8/gKiIDTaHowjRL2lBl9qm03/hoJ8
	 TvOcbI0xV4Khtj8h8U/8dwmSVqnbImGj6k4lW1Rj8czBy3lRzzO8bRBd72qAQShr5D
	 R0ugNZEdzHwsIyDE8TR0a2YQer01GZo0g2QwjrGJ5E+v2ruF7/Xf6D5DG1aoc+6+HB
	 nan0Q78e1JHAw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DDEDC408DB;
	Mon, 31 Aug 2026 21:42:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Nguyen Duc Thinh <ducthinh100812@gmail.com>
Cc: Weijie Yuan <wy@wyuan.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Nguyen Duc Thinh
 <ducthinh100812@gmail.com>
Subject: Re: [PATCH v3] Documentation: process: Capitalize Git, Quilt, and
 Mercurial consistently
In-Reply-To: <20260824133826.13934-1-ducthinh100812@gmail.com>
References: <20260824133826.13934-1-ducthinh100812@gmail.com>
Date: Mon, 31 Aug 2026 15:42:58 -0600
Message-ID: <871pbege59.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Nguyen Duc Thinh <ducthinh100812@gmail.com> writes:

> Update various process documentation files to properly capitalize "Git",
> "Quilt", and "Mercurial" as proper nouns when referring to the source
> management tools themselves.
>
> Instances explicitly referring to literal command-line invocations
> (such as "git log" or "git bisect") have been left lowercase.
>
> Signed-off-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
> ---
> v3:
>   - Fixed the un-staged git commit state; the 'git switch' changes are now officially gone from the diff.
>   - Disclosure regarding tools: I DID NOT USE ANY KIND OF AI AS AN ASSISTANT IN THIS CONTRIBUTION, the mistake occured because I don't frequently use Git to send patches, I use it to open pull requests so sometimes it feels unfamiliar to migrate.
>   - Is there any mistakes that I'm still having in this patch because everyone make mistakes.
>
>  Documentation/process/1.Intro.rst             |  2 +-
>  Documentation/process/2.Process.rst           | 18 ++++-----
>  Documentation/process/3.Early-stage.rst       |  2 +-
>  Documentation/process/5.Posting.rst           | 10 ++---
>  Documentation/process/7.AdvancedTopics.rst    | 36 +++++++++---------
>  Documentation/process/backporting.rst         | 18 ++++-----
>  .../process/embargoed-hardware-issues.rst     |  2 +-
>  .../process/maintainer-pgp-guide.rst          | 38 +++++++++----------
>  8 files changed, 63 insertions(+), 63 deletions(-)

Applied, thanks.

jon
