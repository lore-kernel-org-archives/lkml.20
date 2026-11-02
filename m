Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614733;
	b=nBsb1yJS7u62WDFQpUCR05e5X2PS7MLMHElVrXxoM1t/UzuHYWuNG9atr3GmYS7clFi7
	 nNjdr/JfHoDmhk2sig4jPEpNsHGfmYQE7bBYoX5uebObqkWnYPwscGSCEGBGS5l//Y5Hy
	 W96Hw4M2UWjS6L1SGCBQNgFsPwCLHWPdqSzTOX+/rgmqaId7CqZYeAtIV2SNgRbabSWM5
	 W04/nXmLlze8YogoeaHI+jsF+ARNjojJ1wc9XmqO0ZOzXeJrc+HE+ftXWduUwht7lYQtm
	 YgYk+6rg3mAlSFMhSZa676uw8uW9r4khpOVsH1yyuvMh3ccVdv9zUbBc+3ojGmDExeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614733;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=cslvm6SXg+YQnopv/KqOEZKzVolYz1TO5/sQmHGDWzQ=;
	b=WT1sCSdCDm2OicmiUAaa8Zi3wjgSknq0OUm1UkHPjSvLFtYPS2TKtH0VLjSKBv4Yfazb
	 wFQY+EaIP0XVHQDxLgY0QlNQNpJkofGGZi3U+QDhkXMgfsuewCQlbrtV/edPYstlOGXwD
	 il+gmdZTZCT/r5RqBg33x23TOKPXDBkq0caVoJnOP6zAsrd6ixcy+qLFa/mgeVNzkcn+t
	 K8wL4jpIfosL0ARh/H+LheSICN4m2qBe358DfscVcdc6rBQlEwtCo3WZivNK3aQRuWOGV
	 5buvTF5L31Iqm5w4yOrUqIyE97rqv/RfkwGs2HQ2kIndyfZ3wMLZnPVdbRU/i8wEJOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gpdNj83U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5A860A260C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gpdNj83U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20E51F00A18;
	Mon,  2 Nov 2026 10:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614733;
	bh=cslvm6SXg+YQnopv/KqOEZKzVolYz1TO5/sQmHGDWzQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=gpdNj83UGE1Ukt50sUEwNY/N9tpD+iMDA2q0OJQtfZkapjZwoj+TwwGtKX5P0wzUv
	 0NkAbkmlZNeBgJqm30+NjkgU6y7WtrfJnUQ6NZ5r5sFneXOc/rBMU+syLr35LG/FSf
	 Ean0dHuO41RzzBRhfJwhD4eAiVnpBVDId72mecCUlE8FXGdIj0ywXErcOJbbRedmxj
	 GR4OPqfcxlyrWe6ZFBs7h33ec/ZLih7zwFWXRzC/6jtkwWYqAFXwgX7hDhqjxVIAOi
	 QBzcz3W3FAWeFsQYZFBfUDVjQv9LWZmYd2j0wT8RuxJuX29xwL/tQM+XU1vS4qFrge
	 zSpq0N8G2ULkg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 06/12] mm: hugetlb_vmemmap: rename
 vmemmap_remap_pte() to vmemmap_optimize_pte()
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
 James Houghton <jthoughton@google.com>, 
 David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102032525.3597743-7-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-7-songmuchun@bytedance.com>
Date: Mon, 02 Nov 2026 12:18:31 +0200
Message-Id: <179361471104.1337633.1040318147717529848.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Mon, 02 Nov 2026 11:25:19 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> Both optimization and restoration update vmemmap PTEs by remapping them,
> so "remap" does not identify the callback's role.  Use "optimize" for the
> optimization callback to match "restore" and make the two directions
> explicit and consistent.
> 
> No functional change intended.
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

