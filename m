Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C09B2BE656
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789848989; cv=none; b=fco0VUwqzwV0w+KKpUhDJtQPZhDnvZeQqzDoRZ7veEYRyoCymOb6QddVWnrKwzVSQhGIm8fpN6HupVkKfjteKzU4zEJeTOjvc8XAPqLaVpt0kVvCT5hLphtA1iwsL2S/z9MZuXx4LnGNfUxQ5LasLgRgqaQwPl6DbT4he9HVnXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789848989; c=relaxed/simple;
	bh=IdanZeYleOkUoAUXIuNd6iAWuJHu5ubAeUiqTGzSQWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E4QmtYIEf68U5wqDvzngQ6MR7WT1VGur6hkUfRGot5tPLtS2BT8wed9Dblf7VySAYNVlxNZwuAtOGUTG5XtoF6nbxtqNodEn+OlEAMZ/6KCIasEuML3AnmtwBtJVX2XsMa6oBXdOWwDSVj8K2HOOL7Zkg4XtCFkhDGsXguV/PfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SU+VN3tT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SU+VN3tT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8481F000FF;
	Sat, 19 Sep 2026 20:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789848987;
	bh=tW8vBAHwxwtxJeHMsSnCySRPT4zVEQwFq00zoQu2nR8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SU+VN3tTeoH7EWi8Cani1Ea2Bbsf5ZakAGoL6b06c817iYymfM1KIYEcJSq0nbued
	 llEjaLBL1rUh9yNfqvLjRFAT6YRXFqXdW3SZAc2eJaDybRtf/CRuWp09GsFA8u0WOj
	 MVFljGlRTehNwupUjCb1SNyO6O1laDpcoVsUZ2/LCnSjAYdHCwPfs/O1S0U3h0Tkfc
	 T6ZEAtW3anFtW8OTKhNhqF1vN9do8oyyNId+f5P+zhXNOHQeWI7F6QbULE5cbEVUFh
	 iuknLKavjbpf8HTqKM27c996Vrg4ly6S5ZaGD56nWvOBphKuY3zq8iuV0PdRRpgofa
	 Q23JnRiU6HZhw==
From: David Hildenbrand <david@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260915102524.125758-1-sarthak.sharma@arm.com>
References: <20260915102524.125758-1-sarthak.sharma@arm.com>
Subject: Re: [PATCH v5] mm/gup_test: safely calculate GUP batch size
Message-Id: <178984898740.1919879.11324251625191252500.b4-ty@b4>
Date: Sat, 19 Sep 2026 20:16:27 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Tue, 15 Sep 2026 15:55:24 +0530, Sarthak Sharma wrote:
> __gup_test_ioctl() calculates the end of a GUP batch using:
> 
> next = addr + nr * PAGE_SIZE;
> 
> If nr is too large, it can cause next to overflow and wrap around.
> If it wraps, the next > end check is bypassed and a large value
> of nr is passed to the GUP call, even though the pages array was
> allocated according to gup->size. This can lead to out of bounds writes.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: gup-7.4.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/gup_test: safely calculate GUP batch size
      https://git.kernel.org/mm/core/c/44817a53

-- 
Cheers,

David

