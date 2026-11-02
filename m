Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614718;
	b=TOhdQDRQYs0xTwg1B9zjBRmaL6m5BQiv/yoTeNzGXLI/35C0Nfxk5lR9oNB7M4l5Kchu
	 qxvag1jVvJzAEzmKbnrUsuQSMdxEla5ERSmZvR++zgx20gYwLb6fRgO+5P7ECR+Iegw0I
	 YWBS0dG0zKIrHBoCQZYh1u3ggDCeakCAw7/Q93fbymZZ0WSOmXnmcjum7yLIwNuQT/M62
	 a+P6IMCoal/9hoEF9rZEsvjgjlgve1uzmsxtlfePmcoPmmoiwoRNSMwkynrL1MSxVOwHY
	 rhi2ji2BIBpMwItILDCERXr9WYwPsXqAoNUNWqNF+1f9vVRPDiqltdjRGitRZAi+ACQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614718;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=t7IUJhNhxhhzwfLlR3ygV5Jof/W3+MUpoySHAqOWKyA=;
	b=OTiivVKqrZborUpYmrAJ4HXjhaMQOFeCpsrh44w9WGxrXh8aHWjeUNGamGJ482sFPpmU
	 zQ88isaMK5XTDJfkUeXpC/NiTllVeXHUB7vAXn3jlENWH1qToDP5+Hn7NqF8KU0aTdknj
	 gJpau71qChy34N81XdJcGuC8AM5YfW5HgQJb8a82Pi5QS0YIPu6ZEa+HhrSQYmPUeI87C
	 7zCJGivDw0vaAHpQBuAgeBbkG1/+TAULYLs8R58C7778o6vxznxpeDGFdQgs4d+gbBQpa
	 mLUEjGlmTydXaR529PGaAbXoaIc0fKCW4/+rhcRARW3GoEs7Db2nl3YJWfL3W8C6VAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IRknnUZY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1C606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IRknnUZY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5651F000C1;
	Mon,  2 Nov 2026 10:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614718;
	bh=t7IUJhNhxhhzwfLlR3ygV5Jof/W3+MUpoySHAqOWKyA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=IRknnUZYiFYPxfe79PW1lclwilUSf2HndJ+nFLmOsfKXjYmxDdKlwxHtuiqKteqDu
	 doWDqgILUEAiH8UOh5zQ8lIq5AcpVZXUogkZmtR048UqpaCJwyzHRtHm9EGSPf6Ar/
	 xVUfKPG/boaqSO0UNeIYC1pbm/m2j4/Sc/cwtXHj9XwZBYIo1TKIeR770RuKToas7a
	 2FdY1irPaY9EA8t2MTqZuxAD/mTUdQ6Cwqduen/c/s+DcWma+jreGgS2Jt8KiPlAZ2
	 rBfMIQhU9Ou9yS7t07qbst+VPM5+kSRW4Cs2OcwyyoyrBEnLaCbPB8fSm3PEkPoEJW
	 +8B8Ej+ENaHGA==
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
Subject: Re: [PATCH v2 01/12] mm: hugetlb_vmemmap: remove HugeTLB-specific
 vmemmap optimization macros
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
 James Houghton <jthoughton@google.com>, 
 David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102032525.3597743-2-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-2-songmuchun@bytedance.com>
Date: Mon, 02 Nov 2026 12:18:31 +0200
Message-Id: <179361471103.1337633.7688636981103619415.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Mon, 02 Nov 2026 11:25:14 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> Vmemmap optimization is no longer HugeTLB-specific, so the remaining
> HugeTLB-local reserve macros are redundant.
> 
> Replace them with the generic definitions to remove duplication and keep
> the HugeTLB vmemmap code aligned with the common optimization macros.
> 
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

