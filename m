Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614730;
	b=42G5tIuo9MubtmLrP8exdlDbHbY6juzIKvwDYQxQdAqL+Iu6YbxLxfLMEgs6Thrnu6LH
	 HPCZjT75RW2QTBV5E49NMNT1Cp8eY3Z97fVlkbuV5+CV0/Dsa4dsD9Rn616MPb7UYL1Nv
	 QzPVm5tNtfmViBplKnXoCPXcDQ/4mpX9vV9ZUhxvyNAxdcFbEfs9/iAP88yMzvU/HdUhF
	 MvzDr+OPdZV+eNwQCcc3bwWoZ0gMFhtOS0d+ru+a6ruVp78ren5D4oF4V0MJRD6oSfSfD
	 uIjc3z330EQrijz6HuMbJcz6hbnEANfWqSGJt80T/ZpRxHc0qjakugWeaWUr2PlUDOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614730;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=wLYuXZLrkSF8tuj4uJ0Ku2nwORxJolw9wfJ5H0UQkaU=;
	b=kYFlAAQdI8aMpuA7QsGL1SRvBV36SYTzYNURyIQ259oGe/IPb9g2jsVa24Dqp1RLT4DD
	 hzMzFPUsBgw+8iRm+3Dyed+vOCj0lmbbJ0yBoke1uWBgmkJexI2EZ+/9egAgjnPfyBcwU
	 lYzLSOM/dhtNbPY9a6KkR33V0lLkfsX3tMnTLJMnzfDwc79H8wyUCc3f724eW4kGgcM/V
	 LpRoJ3McKJJlr4+XQLKYj4FKqiwMVXv1l7PV5H+eov706IYlUG0Bp2nebxcBvRJoWcjfa
	 uEC2ppPbMhNZEqXYIjIZHXb+t6qgj24/FxZujAdjK8ueyvPnjmC+5ZyFhibUaDagoSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hUQHE3Aq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A91C60A260E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hUQHE3Aq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F361F00A16;
	Mon,  2 Nov 2026 10:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614730;
	bh=wLYuXZLrkSF8tuj4uJ0Ku2nwORxJolw9wfJ5H0UQkaU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=hUQHE3AqaekfXEulWwApjfQHGl6K7JNL60I+JKjUuB4ENBybwwCcng1W5bnkCNnWG
	 Tf/DZQ0qyFE3onRG8472pjkQZ00j3+5gbsZxIDWRF4zwYmzxrg34LIQfiooGEFl+UP
	 n6MKukYQalENMdeszyGK7ZrWp5SFQgNXnRypSfc/let6ab1wg49TVWNNcAmLz4lYfu
	 OWOnASPV4i1IcWSn0SM7t8EOCqehOnG2TWxd69TV2d8JveSfiv2QOHjhno6rzaw/rc
	 W9eJDuk+LEzK+NNAc/j/vet5yikK2LPRPDVJMXd34WJ89t9vRzZJXMLACb3Ejo77Kh
	 u1jCybtLW3y3w==
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
Subject: Re: [PATCH v2 05/12] mm: hugetlb_vmemmap: unify writable vmemmap
 page preparation
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
 James Houghton <jthoughton@google.com>, 
 David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102032525.3597743-6-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-6-songmuchun@bytedance.com>
Date: Mon, 02 Nov 2026 12:18:31 +0200
Message-Id: <179361471104.1337633.15027622366207216056.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Mon, 02 Nov 2026 11:25:18 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> Installing a writable vmemmap page requires consuming a replacement page,
> copying the current contents into it and making the copy visible before
> publishing the new mapping.  HVO currently splits this sequence between
> the page-table walker and its caller depending on the remap path.
> 
> Centralize the sequence in the walker so all writable replacements follow
> the same copy-and-publish protocol.  This keeps page preparation with the
> mapping update and removes path-specific handling from higher-level HVO
> code.
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

