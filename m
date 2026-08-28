Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86161313E1B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787877787; cv=none; b=idgV5N2xE4kvQ+zz9ggwUlAEX0pMNmpajI+bIMjd1lQTQDqjwsKGVoL5uanPri8aptYSvqgkXobRxLQ2+sqWD70Inl/xdLGhfUFGWbQVK6xl5wKe+Fq3kLetvvRuEJ38Nd8y3zB1lHmzoTM184SjUWTJjcdbnkkJmSA2BF1iQjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787877787; c=relaxed/simple;
	bh=92vgz+uiC1QyxtPK22i0GotNlkQyiDUt/Wo1hGR1MHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UzP6EKY3fuKd7lbgY1dSaQvXSfhx6ocnOmOlMoke3nYaKuDqjQzvj3DiXoRaaXRXjU3HsymF+ozbcpZNC7qiKjxIBdiRkaO0OYNgXoDM/h4r8DXyXVeOKuwOTmx67g3Foz04QGmU+vgRx8jpCOue7lFsMra5R9ZV+pg2hNvIfnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c847cadk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c847cadk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816F91F000E9;
	Fri, 28 Aug 2026 00:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787877786;
	bh=T87Xp/BR5t2O3uUoAmc/qvDQWvI26lbsg+l1hA9mgNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c847cadkHTV4MMsUMsYvKJ1Q3pvvHqq8bxvLQL6ZBlWldtiC8iar510tDnnTPy27o
	 eMmsok90bzuluPAW9KlCUqSPQd7AWzOl6hU0UtHWRRoXhiX4xi+W94K46SOZfOSAdu
	 4nXdJv+qJPNS5hpvDTUEC7Lvmq+GSuBmfMs3YUl7Dqe4B2+x+zR437zpCCTC3x/VP4
	 z1mrNV26IE5KDnyKyzMEJ46CsBpzeT7cwlQNsOMnyZSR/pBm6uX4/VPfSku2zSuFyK
	 SzSkuzNkRGEcaG0416o6P+KQZNDydxm8bc/EWjUf9+D6GmLLgp63Zofq07xe45V7It
	 CzZZoJxHJKwCQ==
From: SJ Park <sj@kernel.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add myself as a THP reviewer
Date: Thu, 27 Aug 2026 17:42:57 -0700
Message-ID: <20260828004258.62906-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827103435.1371882-1-kas@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 11:34:35 +0100 "Kiryl Shutsemau (Meta)" <kas@kernel.org> wrote:

> I have been working on transparent hugepages since 2012, starting with
> the huge zero page and file-backed THP.  A lot of the code that causes
> pain now traces back to me.  It is only fair if I share the review load
> for THP.
> 
> Add myself to the reviewer list so get_maintainer.pl puts me on Cc: as
> well.  It is also my commitment to be more active in reviewing this
> code.

Thank you for stepping up, Kiryl!

> 
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Acked-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
