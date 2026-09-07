Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51B219B5A3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 22:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818663; cv=none; b=qUARAJ2/HWQk+yLBRJkpNl6ezbqpzB6h6Dvlav7D7TzMeGRST1AZIBxWH2iFigZoEb9KinPBDS7ZGiG7bEqaadqB5JwGj40zq4sQRjhFWtiorqAGdFivkwpVhztPPfMoi7mtVbcM4Si5yuJyxV0EFXMd1+sE6MagPD0Mcx9W8f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818663; c=relaxed/simple;
	bh=QSZ3iM+QNDphE80q7BeYQCbaLX2aBbUmojDFGteaQFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktRAuOqi1q1coZLyqPYfs5KcnZFXBDz9qCDIXv4/uIPvDWgdVnabSdt0f6Y85S2TzqBh8Qi3i21sbipTVQXCW9ZlRgOvQJC6fLRbuB/GbWPEHKlCHK99uS7WJdE1+H67Jo6rzJZVIcdWk6rdbewWJ6ybcDHJkvbF5zt8eORAQ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nc5PARS1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nc5PARS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20AF1F00A3A;
	Mon,  7 Sep 2026 22:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788818661;
	bh=l+WJThc+89xsf7gmckVEw7glfJg5iEGwGLi5Ff+8t/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Nc5PARS1EjkluXLbShdqsC6SVqdVMZHPM9kaeoLuh5m3CjWmRVkHxfHdLpVaKDxNN
	 UCu4W0hyGTAyZCCBff5ZQ9zIeFHxCeo12h5of2dThu0uDoHA304cTIgTL2My6h+XXx
	 aj7KD51Gprs9d3ZTYyyl2qg+f5NQBNdf/k8+I+pW6+LAkl64Zuvu3A87javb/8DHJB
	 V6HgK0A5FPQyNvk2d7+1PXH0FK/mo69urZDHDW1TwQjNSlvlkT2Abj+kXV1tI9sFEi
	 0o4+fCoD/BmNZFHsFQcdeNyg9Om7HNw00pA4pI3CzLeJzA1YLJBEd/LHBuqdb8KYq7
	 6WnlRKDoR+0zQ==
From: SJ Park <sj@kernel.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Matthew Wilcox <willy@infradead.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: remove PageWriteback
Date: Mon,  7 Sep 2026 15:04:13 -0700
Message-ID: <20260907220414.89196-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905-remove-pagewriteback-v1-1-06f41c00db03@columbia.edu>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 05 Sep 2026 15:08:30 -0400 Tal Zussman <tz2294@columbia.edu> wrote:

> The last caller of PageWriteback() was removed in commit f75987e543c2
> ("libceph: remove pinning assertion in ceph_msg_data_iter_next()").
> This flag is now only used on folios, so we can remove all the page
> accessors. folio_test_clear_writeback() is not used, so don't add
> FOLIO_TEST_CLEAR_FLAG() for it.

Looks good to me.

> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
