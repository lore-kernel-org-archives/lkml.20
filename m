Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995CEB67E;
	Mon,  7 Sep 2026 04:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788754224; cv=none; b=lqvyCWJzjcTk7fOeaXIy+u+4m8H+dBnCDTcRV8q0+u9LL+O7JWw4cuFPNSLxZkNWB1qq+UZpcfMsRM5uTcam9pXtaIy7kF4px5wnZwOTbPd8tJvbxs48y4TwHKF8nJmZysSCN4RmJLBCbLdv0xnleEgidncfRbm9Nc6fUkbjY48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788754224; c=relaxed/simple;
	bh=iP4mM2J6RG2aB1XUQ7Ikmkmaim9vKFMrPHCjTgcOxvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V478TSvKCbycX0YwBy2DFtabjGrxnH/XbWSHSwrfO7cNOiO+leLnjLgtfPaKvofQLqzGhlmYGL1cIfTOzrYWPlJ+ifNhtQykow6u4P9815y8XRKZQIv9xkel0vp7j9myfx5vLwy+CmRytJ+D+fvPkbZyEiUF88I1Dvg3HzwZ9dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AI0DVKpB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AI0DVKpB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBF31F00A3A;
	Mon,  7 Sep 2026 04:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788754223;
	bh=oawDi3cB8hNQAallMLaU5Y8TpOHafpMZGhAABxBsIu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AI0DVKpB5Iipteid2+7/C0ko1EGl3wsQYH/dY7gSqPgLwj53ilY9HTGVPuV1/rx8W
	 iLtI8JVF6P1gF2vggYGynaI8Qtbv+5dTZzgBA5aiSACPhkxe8kYp0iXCziE9vptHMA
	 xzY4ShrIoaa70IEXwnK4PVwQhVJ0IQrUgHVBaSIMGvloAnRyj0uXsgW/NU4smLZe5t
	 W0uhChJAKCNfBwLd3jBzoJUpDovrteUigFvlTW4K8wW4HoymOu5FCMcgrLHWlmCcf+
	 184WYjAjwILKWkjReCRWex1XzoE776gWaqr085ZnCJI1XLJe6FfIZOKjraOPcbkFwJ
	 MqqAmN6+CqmgA==
Date: Mon, 7 Sep 2026 04:10:19 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 1/2] platform/chrome: fix typos in comments
Message-ID: <ap45K0sYkr0OoxYe@google.com>
References: <20260904110900.20435-1-hemanth.selam@gmail.com>
 <20260904110900.20435-2-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904110900.20435-2-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 04:38:57PM +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/2] platform/chrome: fix typos in comments
      commit: 2d23d5e9cb468baf6e4fa78d0dd7e8555759385d

Thanks!
