Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE6F3B9D96
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894939; cv=none; b=QJ5jC+9BaD+09z8v75Z5x/rbGF1mYbK5dKJgJIo3tBimLxUEa+EOsw5OWSro6/HC/fL7LaG6l5LSfVUooBB6ZkRt4WCpXaJPyTtqIdWvbs7MnIsww2U2/QaM/AYDs+cwVXi7xZ8LmcEfIKoj4lx411LXPy6yjRHgaphLHNfadf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894939; c=relaxed/simple;
	bh=qL8bPsC0Bxb6J/ZsIWsNrLSKD39Bdrje+tlXzQLxk3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6KZLxsGbP7IpRm2eV0s1fXfG/1XEJm+PIDYXAi6A5fwVK1JBPivVv63i2dsaJHEW/caYEPsL5ylC0duKHR2lbYEZTbo6vj5A61f3T2mpKe7KillGPqzKxGF/ez5VpU16ZDr8Y3oYe0d18XsH46BEDGKukCtNTBTHY20pws51Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wv5Y2nSL; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wv5Y2nSL"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-39652a6e963so1677183a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787894937; x=1788499737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qL8bPsC0Bxb6J/ZsIWsNrLSKD39Bdrje+tlXzQLxk3M=;
        b=Wv5Y2nSL47pLSZbE8sbvRP9xuy6tfs/SjjsXYrFrqCXzyc7ntN7DmxaxjmdlLQUwhr
         UavosEWA0ZIAdVB7TL4kCSzspOUbCr8GxnyfcMyDMj+u5Kk8TwkTZrsX2LLjdODx5XCb
         D/DFoTVJm/EJKvQYalKfVjtBVTeiXiwFPu9nN9o2IZt4hPTiuO0wBF2qoaXmAJCVA36o
         j3K+k0V9iIG2iGQiSe0akDUQYwGTfd8xqBxeJ8GWwNVXks3rGrdAnpSiERIMDeCyvWMG
         l84KtQcKDU/VFqSFWd2n1xgHaDtehtz0OW3EXY68LC+6q5hBksKJz03yS5q3ceuNRIlg
         NiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894937; x=1788499737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qL8bPsC0Bxb6J/ZsIWsNrLSKD39Bdrje+tlXzQLxk3M=;
        b=O8EYVhGaswE6Tz8+gVkOje0kj4FCs67FYKoC7PHHtNb/BkVfaORp21rLozEMgHo1wx
         QO7vUTw31t3+jTGK4JCFZA/lfxye3rfkGIT5rJb4c9gGwIh5ItdF6NzYJJYM7gAsLW6b
         CaQin3hC7a6ixk7tT1qQusVntIARAHVbWAJZCB65wfF/9D/6OiyvS8iPwttNWxSmre/e
         O0WxlRB1R5MYTYOyRSMW5Ex3prkNk3M42PD5y4w9tOFwphRqzfrP8aUaUljoX72fV0Y7
         cnG577DziJvhfXqkQOJnrEDnjPAoUEi21Jjw3rp6rj8bN9BxQNL69MfUV2+dQg9ltLmd
         QPVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZfMb8FBjNXTrLeJHlewScMqfn4KO5ZAnUMCPnSfkVQib8bKNsQ81yfAwk3FFC+JAsSCjlqmDeigu0oVI=@vger.kernel.org
X-Gm-Message-State: AFuF++ko10Lls8Lf7hL65FYeFaaKki6PKokBTy1qP6mY4U+XZi+jRJIZ
	wYzNEXgtKnc8hDPpf3J3XVo3ZUZ1RmQoL0bd17wXAR9Kt3dzHmSls/Tn
X-Gm-Gg: AR+sD12/jjysf2OOTmAjdPWqArbLrbN3TQghpy686bNNINAqKIbEfTsQWU0hOc/0Kiu
	Sf5uqRe2DTiyi90B9JlvhRNiUT23uXnfIPWFES8vwA10tYSPfP98rVu7JIkas7oVP3uHUbc1j8o
	wuOu9hXgN+pjJTJ49hmQz6KDxWRW6kELtUnH5tSZNw+GbIKTXEPI3ZwpeeVzGvRrXHOM7l4NA/g
	Io3GJ/ZgflFW9ALlA6NVfH31LxYQqnpsSY8/Ib1dmXJWTDArbLtp3G9rIN+kAXlU7LP97hqxwPV
	0hLZA5iKStj6SjnPdklHFWLwlavoxl6O0uQ4+ClwWAk4+nwMMek4AmVmCTTySMzHbejZlc7GXcI
	Z8SKKhN4+M8rEWjaMlEl2LS9I6viNsFD4p73qtbfrj4c5Z6AymYXZbcDZXZGHcmu+8FAHbQyocJ
	lj7lAE0JZfk4PfIN3WFxee13CnkL3+v+snSG2bd3V7zs4EJbI5pqlz5SKRFgGygdaVjchnRQkL7
	DN94oOBRlSrTm0zsDQZSM/UOGwF
X-Received: by 2002:a17:90b:1a92:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-396d0d35e02mr4591519a91.1.1787894937355;
        Thu, 27 Aug 2026 22:28:57 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7eb6bsm1070263a91.8.2026.08.27.22.28.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Aug 2026 22:28:57 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Cc: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Chris Li <chrisl@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Yu Zhao <yuzhao@google.com>,
	Zi Yan <ziy@nvidia.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kairui Song <ryncsn@gmail.com>,
	Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH v3 4/6] mm/mglru: move max_seq read into walk_update_folio
Date: Fri, 28 Aug 2026 13:28:12 +0800
Message-ID: <20260828052834.52775-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826-mglru-flags-cleanup-v3-4-d9f1c75549c8@tencent.com>
References: <20260826-mglru-flags-cleanup-v3-0-d9f1c75549c8@tencent.com> <20260826-mglru-flags-cleanup-v3-4-d9f1c75549c8@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> The max_seq read now happens once per folio update rather than once
> per walk range, so folios always get promoted to the current youngest
> generation.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
