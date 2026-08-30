Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE22E632
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788059891; cv=none; b=RstcnIPBCgog3kgunJNeFR0SQiv5ke590GU2AFqPfwL/sP8VVvAW6WxLwLCRGxkjJfqvrB6kNMoDhI1MNdHHOvxcXlOEyRQRyGEAcfXdPmjSVr81jfAAOxKodj9bXJCcRpFqKlrDJlP/SzZlZjGXTwNe0R/u8gOeDGKfvFc4WE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788059891; c=relaxed/simple;
	bh=N+sTI0sykdlfkcj4hGqryYWaOtTxc/ZLIhxc5jB6NeA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=M7w5FlwhU8hx2HEE+hiwRBISQsxx5qh19dmwdGm0/pALqcM4xpMi5/0pLuJyBTxp61UG0C50fI0moVrrrqL8RJ/n7xoxs8Hq9BTOjnDpPUFEwtQW/B6UuJgnHuVfprxSlL0pzBSbsJJmvAzmYCWTzv43Yr0GPvMqEvZVipgnaTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Bb+SgGBx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Bb+SgGBx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086651F000E9;
	Sun, 30 Aug 2026 03:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788059890;
	bh=3Rmogpoo8KWdLKv3l3rEZX6LosNLicNjBA0iv6MuuZE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Bb+SgGBxOKzxMJ2kJ6B2tmna/h77lEJq+TVY7/5deiw0BvqpCeKG+jjrcRVjxtoVF
	 F2wddFdkB7QonU3Pc9ZBUjf3os4mZQsztwgZTSToGpjPo4gijc6VZG5K9jmG6bJsdT
	 szXBpJXopgU5Ajx0cOT4avtZeT6eH/jHDGqkETac=
Date: Sat, 29 Aug 2026 20:18:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: mawupeng <mawupeng1@huawei.com>
Cc: <liuye@kylinos.cn>, <hannes@cmpxchg.org>, <mhocko@kernel.org>,
 <david@kernel.org>, <ljs@kernel.org>, <hughd@google.com>,
 <mgorman@techsingularity.net>, <yang@os.amperecomputing.com>,
 <zhangqiuhao@huawei.com>, <wangkefeng.wang@huawei.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] mm: vmscan: fix scan overshoot and ineligible folio
 scanning
Message-Id: <20260829201809.99fe79c4725413bf80510fed@linux-foundation.org>
In-Reply-To: <f53b5d3a-9f16-460c-a7d7-a0f518c2f21d@huawei.com>
References: <20260811070849.1332165-1-mawupeng1@huawei.com>
	<20260811184241.e423b81c8a50d5f212af1c3b@linux-foundation.org>
	<ef7a72dc-fc5f-4b08-833c-05c4ab416605@huawei.com>
	<f53b5d3a-9f16-460c-a7d7-a0f518c2f21d@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Aug 2026 08:59:54 +0800 mawupeng <mawupeng1@huawei.com> wrote:

> Hi, maintainers
>   Kindly ping.

It's been quite a while.  It would be helpful to refresh/retest/resend,
please.

While doing this, please update the changelogging to help reviewers
understand the end-user impact of the issue.

Please also give some though to whether we should backport these fixes
into earlier kernels, with a cc:stable.  Given the unusual
circumstances which are required to hit this, I'm thinking "no", but
feel free to disagree!

