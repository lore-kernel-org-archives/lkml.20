Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037B834D93C
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049400; cv=none; b=llZbjZ52jyoEhe/NceZXvC2/tfhmB636xDl6S1vFhgq9KRw41S0pX/K0mKh5NG4DnzbpRsJdDlO8YnzLkT22i9PEbmT23qkdHXs+gGEIt/U30rt15190ejW7LCqBqK2i6c5q6dS0w4MCih0WicNFaZAKCwM5cvRDWRsEsQ531y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049400; c=relaxed/simple;
	bh=Z3t6tOyEeec6YW7iLLQsKxc/wJKnrvvxvQKI2TXUAxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LvCeKWTz3lLEWNJL1uI7cEVmPYJaxlkbfYprtK4uF004UnJXxN9CHG7bepUVI/KPHxTFs0oriLcn96iIKHtE7iR7APtBZAsvJWIIiy0YodKxdgOueTXlt0wZ4trjpfXMMXdCgSAlsLy9pvH1vF/PinqbRzaFyXfYGJlj4YSJV0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZU8EOjK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZU8EOjK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B24E1F0089B;
	Sat,  3 Oct 2026 17:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791049398;
	bh=5i9V/0tMLP2xvI63Csg1dE0fJbtEKQ3vrLYSHswiMsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jZU8EOjKU+MYLZs9eQDZdg4YA56eBHRuQQT5UH/NVxVYtYn58+xxIXgribTe/fJn6
	 0q218POxlTo94NtpcOnJzbNtmZtHHQn9/BGdIg3NP4a1near0NIwDCLHQQ1NReSXh1
	 kmwNWyXNME7PwqmoTm9BkOJdbOaFsOGSFwvEsnYmT6Ls9W2V46qeGOp4CcfdK2iFXy
	 x6EkIwpkNbVNO3JDbnxp4nyaJpfeHLmYoqyFVw03jWqEgRQCo9WNrboRG6OsO/xJr6
	 QIMs83fE36fjspk+OemRnS27dvdZLB/WDD+YyKJbkxC6TMgtpQqHwt8u9Nxml6hKQk
	 KEtZSOIEY1WRw==
From: SJ Park <sj@kernel.org>
To: Enze Li <lienze@kylinos.cn>
Cc: SJ Park <sj@kernel.org>,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	enze.li@gmx.com,
	Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 1/2] MAINTAINERS: cover all hugetlb headers under HUGETLB SUBSYSTEM
Date: Sat,  3 Oct 2026 10:43:12 -0700
Message-ID: <20261003174313.34495-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003060029.2152489-1-lienze@kylinos.cn>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat,  3 Oct 2026 14:00:28 +0800 Enze Li <lienze@kylinos.cn> wrote:

> The HUGETLB SUBSYSTEM F: entries list include/linux/hugetlb.h
> explicitly, but other hugetlb headers are not covered, so
> get_maintainer.pl does not attribute them to the hugetlb maintainers.
> 
> Enumerating headers by hand is also fragile: any header not listed (such
> as hugetlb_cgroup.h) falls outside the subsystem.  Joe Perches suggested
> using a glob F: entry, which covers all current and future hugetlb
> headers in one line and avoids the gap.

Looks good to me.

> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Enze Li <lienze@kylinos.cn>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
