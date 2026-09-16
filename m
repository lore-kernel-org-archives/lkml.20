Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F056637106E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520901; cv=none; b=BFPIY9GPgRHe2zwrixbvjU/yOHcaEr4lwJAACdmh0Nb96TYku4vjFoMiY1YUjf1bVqQBpPZF3ZT3E0Y9R7wxIBdgMkmYRNPZkOVwin8os4HLeDID+Orv5Tr2iS2LZZB/8Eh7GMkLfm5RcQpjhMzQfqs2N64Myf9RDcLWc/pslCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520901; c=relaxed/simple;
	bh=1Aq1hf63Ge2q9pg3bz6genAImS7tL5NNZD81t10yWRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tINbNHctBIiWFPezkov8zJ7U0jouoaoL9sinFrKfwubMrW4qzRkWXq1MqvakPLeAIDNbsooHxfJ8LufAO3NVgFrIxMy4nkGPTlxvp3Kme8GFFdtZ1H5soP7req17dg6u7ZZYfSPbduP7xnEJbp4JxsrwkEpd0cEE28tza349HtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i70aeXIS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i70aeXIS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F821F000FF;
	Wed, 16 Sep 2026 01:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789520899;
	bh=d+aGD7aIOa+zzJYmZKe8hvODLP7Ng8RsJCihAMnlDYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i70aeXISLBRvXOCvYar/0XG5MN77z0h0IgHOjQyRiGlbaGHjTS8j8wzzQ5XXVl9lA
	 yowaL9/V9kzV26/FszQud20oWTyEmnTefoI4AY9Jwcf/kH3GaN3rvlRmDKBiM19C6a
	 a8X9yKYT/StG5srzGsxnxxUomHa/1g1KV6BbT3bt4IzM1od+aOSOjKxhYe+cPWzXyy
	 B2YxnuozLhs9FZc4x0DZkKOFh7YeGRwCn09uQmNpnP9xHqOwttu1F6omT922kdbVVd
	 KEH5cAlA7XMwketYySW6ht3aRIHu67VvY3mMkyZR7M2rEIcKo/EiyeuFVrXkBAKXrL
	 ITlpqZ42wAwUw==
From: SJ Park <sj@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Ge <hao.ge@linux.dev>,
	Abhishek Bapat <abhishekbapat@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alloc_tag: avoid implicit padding in uapi
Date: Tue, 15 Sep 2026 18:08:11 -0700
Message-ID: <20260916010812.102238-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915202404.3568029-1-arnd@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 15 Sep 2026 22:23:47 +0200 Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The impliied padding causes a harmless warning when testing the uapi

s/impliied/implied/

> headers with -Wpadded that could in theory indicate incompatibilies or

s/incompatibilies/incompatibilities/

> data leaks:
> 
> ./usr/include/linux/alloc_tag.h:41:1: error: padding struct size to alignment boundary with 7 bytes [-Werror=padded]
> 
> The code here is fine, but it's better to make the padding explicit
> and avoid the warning here.

Typos are trivial and the change makes sense to me.

> 
> Fixes: 1d581ab2348c ("alloc_tag: add ioctl to /proc/allocinfo")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
