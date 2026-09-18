Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40074F55C7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755400; cv=none; b=UJPqSiuJqGOvz9BUji5fulaRGREGpDh0C94ECUZvq5lRUSEWxmTumXYkvpDVts+59ljD7ZIm4qTYyJzIQXzasVCM1TAJJ5JhHMCWVLQGakeTmVMcKKmLNljXMVuvuoAeQ0xxRjsBYIcDdooJF0ojZdMeX6Ow91ANlIqTD6sRBc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755400; c=relaxed/simple;
	bh=tg9tfHtU3Y2rbgCIvo3dOVQd2aWqbnvlICMkNRds/9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R23XyoLJt7ALOXIFbTjNm2MNDSKI0uKjYIVk8CBT7JtqHdxcZuzBpYmDpT06zHACaxHii0nH3CaBLlCNnwAYYVo450B9nVSQgLJsS/46k+tZ5JRhrVC8iO49o+p20siI9yHe8alOYoVFtdafnv/XsWk7Um41y779qC5W6pUtlBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+Q2i7Hf; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+Q2i7Hf"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4923c9429so541691b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789755397; x=1790360197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CoHLip16Ywr/lC9AnwYxCTtODZgmreI05p0Tb8d9mg=;
        b=B+Q2i7HfOlNRmmy9fs7j5v3H9nlP7w4ZjOKWhuLIG0ndgybnK58BlYsb6UwsSQN/J5
         XD6n2lyTZXPz8pzy8NzP1xhihiA3ZV8LCIAgDwN6NflGcX6C1DbmM/QLwIjPHvwjAg7x
         sqB0eEsW29jyvhUZ+gUTGpX50xh0mPNU1gPEhs+iSJHoCsDH/Elq++WHwGCTrepx9jzF
         9dWKb3r7SZb2b7J5YozUEQ2Ht2yw41E6QzxY9+vXzY7R+oJmvBRUdC96EWz6NtvfD4uI
         aqpQ/oQ21RLUh0iYLD1kbRAKWYeyCYBGiGJJoo0GFB5muZhnwv+iyfU38bnkQHdqAe4T
         wr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755397; x=1790360197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1CoHLip16Ywr/lC9AnwYxCTtODZgmreI05p0Tb8d9mg=;
        b=EiqZ9mVfYFgrrGeY38vxY+WPg8wMM/mxtYeJyNFSw7B0C1B8f8y3/JjA/GG7+fClf1
         FCf7Fak9nLLdXsgw4qiNyn66FYN/IDJckU2sN5NDke4aLqD+ZE7A2P5368LBv7Ux+FGX
         qmovIUxV9T/tSi3q1bTZMBZcyOiiKJLXzhTO3ziqrZzIYq9/LSrVqkQyKVzPKNiDbGxt
         tsjA24ctWYsa+THBe6TF4m63TIkWsLLKkSv/qwwMLVhVW6EfAOGg9iU5C4lPk4flrKVn
         Ut0UZ30hSA3mdhIntu1cjvw0z7WcockTJfo7st2nsT8RbB4pSPp8eCvoFO5gu59AgDch
         mBlQ==
X-Gm-Message-State: AFuF++mxY5TfE3ZTaMSGTLiKp0+XU77wpFnAwC7LVWcrkXWBcZXi5xG9
	61FGsOaKvc/FqT7W5MSG075hsg5gt3/s931bGLsG5rf8BqEle73zDiPx
X-Gm-Gg: AYBFou2NvwOX2EIc/tLmjszrNrU0jsKYgw643CTuDWPHlf+vqr4bMBCCuaAzaXWtoww
	B4dSo+iStpN0c/KVHMPHbpAtI/vlJKNHL/K6jt9hWjT3w7Z4s6ZpScyl+NPA/QFNXiLmmHcCL1Z
	gyDXq0p5OcO5efljaDBsHZbrUm6uzwAHsYny34OhZlN7lMRVBio2RBVpSba7tBdjB0BKatM17V0
	amVHZCOCvosdRPWBesGfNY5474Hm9UJZElanmDMHWuuXEniMsWLIkI5vXYLryb/nak5xcD28mvf
	MdNmyHJe6mY7RSsF7a9DyvKmYXWScS3LZGNWeIXgFMpNmXRpv8+rARg/qnlgVP7ELpguUWqkfP4
	rdCJI78sE6nJH4gaZtObscszMYIGvcWkj1OPQM/gFqgwnSTsTJeeU1XDgUXvnVovFSuLN1lVTJp
	Cxdfvh12ylnT5ao6Lm6X5XHQxf1WVNd9o5kuP1pWX1Zb9069z1257NteTas+uHCfz6LFZ8j70qu
	S+/3BITd7LDwrtKHSFOUU17oPVu8A==
X-Received: by 2002:a05:6808:1a1a:b0:4b9:e65b:8c2f with SMTP id 5614622812f47-4ccf7efa991mr4138923b6e.29.1789755397623;
        Fri, 18 Sep 2026 11:16:37 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:b::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cf3f77781csm47b6e.18.2026.09.18.11.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:16:37 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 0/3] MAINTAINERS: rework MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
Date: Fri, 18 Sep 2026 11:16:34 -0700
Message-ID: <20260918181635.3251639-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918-maintainers-mempolicy-v1-0-9a94cac6d135@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 18:34:23 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> Let's rework MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION.
> 
> As I can use some maintenance help in that area, add Gregory as
> a new co-maintainer for the split out MEMORY MANAGEMENT - NUMA PLACEMENT
> section.

All of this looks good and makes sense to me. Thank you David,
and congrats Gregory! : -D

Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
