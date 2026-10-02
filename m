Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAA73F1077
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 22:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790979777; cv=none; b=rxxnNA0+C6EelUkDEqVG9Tg+iPxjruaRAQbdcVmtYl7Qzbh4gyKt68VBi871etPeQ4ni/LKFX193uuX0Lt6waxZwl2WBPddjFONQgdivXAvSV31+tpgxtUMv43c2Xi/5Mkagg4zq90qqCk4uAo9x1znZntLvTy4QzM7QTqLhGOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790979777; c=relaxed/simple;
	bh=5vTFUaf2NIF01bV+6E13V6T76luHNrmd0VKJ2np5RUA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FNYJBBR1ghGwNPJSJiuFrO74EucOHqR/pJ3Tfd8ceTNxnNB2tYE5wsSWMUJMZ6H3JuPnA7FUfAp1xFoIBj5XPMLIszTnhwERff0lFQ9YVgGN5BZWQUB/hkkd3374F3Ci7c7huChmgAbLwrFti7TzCirfz8XzBr6TdrHzpX7g4Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=juasQ0CV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="juasQ0CV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D201F000FF;
	Fri,  2 Oct 2026 22:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790979775;
	bh=zk7cugLAEFJjFq3rPPGJkw7dExSjXd4htLlQq4tp5QE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=juasQ0CV/C1Fq6mM8f/t0rCW6ehuW4kqBV+nxYg74ZBZp95IPmrB6+T58t1BlG/vU
	 0r2KkXGiyr8wOZmXpBd6eqiLYcSGsIREXRp/fevXmMIZJaaqyZ0yKMWcgY42fGBio0
	 ftYl5NY40xMTMWIbYRVj4TvgsFP+KmjKb2JNZCI8=
Date: Fri, 2 Oct 2026 15:22:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Andy Yan <andyshrk@163.com>, alex@sverdlin.org, cel@kernel.org,
 kuba@kernel.org, martink@posteo.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailmap: update entry for Andy Yan
Message-Id: <20261002152254.fae144133d90a63c28128c05@linux-foundation.org>
In-Reply-To: <0c542580-7da3-4cf8-ab0e-9e513842a556@rock-chips.com>
References: <20260924105052.768760-1-andyshrk@163.com>
	<0c542580-7da3-4cf8-ab0e-9e513842a556@rock-chips.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 2 Oct 2026 18:09:11 +0800 Shawn Lin <shawn.lin@rock-chips.com> wrote:

> Hi Andy
> 
> 在 2026/09/24 星期四 18:50, Andy Yan 写道:
> > I will use andyshrk@163.com for future review and discussion.
> > 
> 
> Since your rockchip work email is not receiving emails properly, I would
> appreciate it if this patch could be merged as soon as possible.

Thanks, I rescheduled my copy of this for 7.3-rcX.

