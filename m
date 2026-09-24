Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57497426429;
	Thu, 24 Sep 2026 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238158; cv=none; b=CnPv0eU8F5AjEzCZYD8PGS3u7OA+uZS63afjI6sjrY+fZiSwggRlEMOhBoBBr9U0OGOBWPmnutUhQHUGVNH0LbUsDzqRAsUBqTvopKsiLnZrzcGcCtZeroRXfW22Fu9NdX5v3Kgn/nAY+l7s0sMBW20YVy5aqAvc3nSD9A+rwYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238158; c=relaxed/simple;
	bh=8mS0WnmDPjvJRLmaLeMur/dAi99exVtiFFE6AqDBa8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X+tY9Ph5sWzIBAZ0DC9k/WzUmTUd+j+x1kQ9BSOAIkq40w5EXp74k9miy3cL4Smc9vz7mp3Nqb5/GItVnStRPSvpeqL5gX6GFmEmMfC2ZllYI4RqUNbMxl/mk3eGxIgz2FbXRQRnDNnzkwgCwBGNUVNoArpcTyb82NGvGvj3sUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNMAN4kr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNMAN4kr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3AA1F000FF;
	Thu, 24 Sep 2026 08:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238156;
	bh=zjnvdX4OTyAwJHkUGs5en/XjY3eVG8NVFw9/eGuVK9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LNMAN4krt28cole0f7wMCUz0H0YeKVnZtuqU3CczpnWiAzfANlCgkpBXdBzqqwhii
	 Vfx2tg2s/DJaqlo4vgVuks63zNln7nRCcrX8CW202Eakk93z2xDouav9PZ5EqLm8Xe
	 BGhAEkLKqkFsgTkqu+C1GDW5X6IPSmHqqt+76adXFicTXJQ7kVrbLxmVa8Ad3MBRDd
	 z5c8kfO4xTpArHPtdUyDUe+BiwL2gsXYkEd6Jgwrio8O6ezrrEV0oVo/SmJamDPyp+
	 3wrq1NSHC5vc7OZa9if+agjikqDSX7ezg7+gW5124YMOJmMKor+kBzJMeuiXYdocna
	 fZq+yWTVk9xgA==
Message-ID: <2c05bf39-7e04-4cc7-9926-3cbf673865b5@kernel.org>
Date: Thu, 24 Sep 2026 10:22:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] MAINTAINERS: document the branch in git T: entries
To: Matthias Goergens <matthias.goergens@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Theodore Ts'o <tytso@mit.edu>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <64b0be79c535bb9545f9f81a5044146a8726c761.1790220653.git.matthias.goergens@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <64b0be79c535bb9545f9f81a5044146a8726c761.1790220653.git.matthias.goergens@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2026 05:35, Matthias Goergens wrote:
> T: entries have named a branch after the repository URL since commit
> a1aa5a770dc3 ("MAINTAINERS: update hwmon subsystem git trees"), and
> 109 of the 846 git T: lines do so today.  Commit 083bf9c56d06
> ("get_maintainer: add more --self-test options") taught
> get_maintainer.pl to parse that optional branch and check it with git
> ls-remote.  The preamble, however, still describes T: as it did after
> commit 50306fb5398f ("[PATCH] Clarify T: field in MAINTAINERS"), as
> "tree type and location", and does not mention the branch.
> 
> Documentation/process/submitting-patches.rst sends contributors to the
> T: entry to find the tree to prepare patches against.  When
> development happens on a branch other than the repository's HEAD, a
> branch-less entry points them at the wrong tree; on 2026-09-24, 173 of
> the 273 repositories named without a branch had a HEAD that mainline
> already contained.
> 
> Document the existing practice and say when to name a branch.
> 
> Suggested-by: Theodore Ts'o <tytso@mit.edu>
> Link: https://lore.kernel.org/all/arSMwd1bGO1vrif-@mit.edu/
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
> Ted, as I said in my reply on the ext4 patch
> (https://lore.kernel.org/all/20260924033200.3615554-1-matthias.goergens@gmail.com/),
> I'm sending only a few of the per-tree T: patches for now, and would
> value your view before sending the rest.
> 
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc3cae2e378b..6edc17d66b44 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -30,6 +30,8 @@ Descriptions of section entries and preferred order
>         See Documentation/maintainer/maintainer-entry-profile.rst for details.
>  	T: *SCM* tree type and location.
>  	   Type is one of: git, hg, quilt, stgit, topgit
> +	   A git entry may name a branch after the URL; name one when
> +	   development does not happen on the repository's HEAD.

What is repository's HEAD? The one ref in remotes/origin/HEAD? Pointing
almost always to the master branch? I think no one works on master
branch, because that mirrors origin/master. So basically this would
expect EVERY tree entry to be renamed... and then - which branch - since
almost all of us have more than one (at least fixes and for-next).
Basically the DEFAULT is that you do not work on master.

If you disagree, please point me where is the HEAD:
https://web.git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/
(and all branches are active, meaning nothing is stalled or some wip-dev
work)

I don't think this change in that form and naming is useful for developers.

What contributors need is the branch feeding next, because this is the
base for them.

Best regards,
Krzysztof
