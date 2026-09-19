Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9E1332614
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789779481; cv=none; b=An6zCGKhS8lGcV8IkxiHaL2Q6vaKLODVKE/DjJlVvPOn2KErezfwXzjMmoN8t2JiWET8qI29eCoPG/9h1YY2cAicOSehbHN2eZjAv95gD+v9xbSX8e84mb6/jt/l9+YsBrUCnK7wysVGcTn7O2eUgYyAMD1H2DVqwazJAWJXKEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789779481; c=relaxed/simple;
	bh=WMMHFPRide+FycpKHjie4QB5rVPBNcqRFSh4HlX7ZwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DIF+GyG1+KVzb5FUdZ6gmzaqVTdOw2DPDG3+mZwqHVRKcdNANEJ61trHL2y9loa6I5AhQDM5lanFWT/22y2GoYBE5y6qlWfvc1jJ9pQoKcn+fMdYta+X+tUTtDZiMttm6/fxHu7nahrGafSueOpt7uTT+fYwrKH8I/Q/qKuRHk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h87AVbGm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h87AVbGm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24841F000FF;
	Sat, 19 Sep 2026 00:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789779468;
	bh=Ou5Coji7GvP7rg1t+gMtICHH8GO2v2T+xA+Md9mjovQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h87AVbGmoFOfBWO7pFDu1hE8BqkQpNxItv7YaHnYPOp/FWH4Q7teRITPVCo/yVWD8
	 BAttH12CmgD2YP2nAuFF9KGBc6bhWXhrdSqmUhWfg3QleUcT5I2/S/ENOnx0PODy1D
	 Pif0hMae4HEOQeNBgNW71ZpPwgAw6kE0q1F1lucjS0Qt4HmNnVSTpLNysob/l/DiBR
	 9vAoiwv/R0JQQH31kfzcuxzD8jj5Z6ncYg8nG8BXGVJJu2m02PgLzNV9OFxXZpqAs6
	 L+ikMO8MHaIrcV1RACLbWq+a0darZ4e7fQ7iV/93Zl19cHHDpn9HxRIuJ4bZRbNYPg
	 f0teyhE9IL/ew==
From: SJ Park <sj@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Nhat Pham <nphamcs@gmail.com>,
	Youngjun Park <youngjun.park@lge.com>
Subject: Re: [PATCH] mm/swapops: remove unused is_hwpoison_entry()
Date: Fri, 18 Sep 2026 17:57:35 -0700
Message-ID: <20260919005735.87860-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918165642.1014988-1-ekffu200098@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 19 Sep 2026 01:56:40 +0900 Sang-Heon Jeon <ekffu200098@gmail.com> wrote:

> Since commit 93976a20345b ("mm: eliminate further swapops predicates"),
> is_hwpoison_entry() has no callers.
> 
> So remove it.
> 
> No functional change.

Looks correct cleanup to me.

> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
