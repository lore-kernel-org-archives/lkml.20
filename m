Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4AD34CFA1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894847; cv=none; b=FNxT0UQuLtcG+ieX8Eik6TUZ4KnWgeUwveCQLYBHGidRSOfh9LUL6t2wuvV3gw7rmjHSQG0Fsg/uvAqzyZsXNBTSmBc6lPEEjU8GJwjMrQQ1SoxsBXzF/u3Tdew6qibWfHT98FPp/z6OCKHky+wmGGdhatitWhpX1RKhWMMk9U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894847; c=relaxed/simple;
	bh=GkKJcJJo80VBzccp6OY4nXGqipd1Y9XAJQzIr04BHjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KGsX74lx060LPjRy+Fe+yaG9c3JDEXbwhX2CU+sWPrCkt1e3QnHFO6L/VfFnv0jJ/YsxaRrqXSSLc0v0q4Xrc8kLex9Yu9hteK1nFR7fH3FIBCmOUr2lpPOtk17Z0ca3H2QJz0qBAvlVaCFBP1pMfYsiNXXVgLI7BFm5k8iudZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ooJVkiFD; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ooJVkiFD"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3968e063f84so571783a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787894846; x=1788499646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkKJcJJo80VBzccp6OY4nXGqipd1Y9XAJQzIr04BHjs=;
        b=ooJVkiFD0p4spP2v7Rgje0xm5FLjijn3aMEPYgO9ofBXEcuPJ8SI/9DGvRs/2tiZkc
         ehoQU//fmzD6d/XUym1RoguUOgyk9OWhjVL8MxofrQcYO6c0OxWZBi7zZPTVvLKspBSg
         3QVwtQSB13NvXwBZuFCVQGO6mkofM4JB3mSJcEIzdez+uOdgjZKNtba6n9nWzPtbqdot
         TZhRaAO4S/z1gnFhUCWKMbVVe66sCxD3aecFfItquXAjszLk9/DVa79k8SBaTVNdbkHd
         zYU9UQNYb24rkbYv+Y9CKgUPLOja34O1e25kYz9imUEaNIjkPVbb1tHefaibKmHYykkl
         zOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894846; x=1788499646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GkKJcJJo80VBzccp6OY4nXGqipd1Y9XAJQzIr04BHjs=;
        b=qI/0/XYNuL3t4FxErhzAWk24Ic/lhFd+RBtynho2QKWtCQfzeOHHMmkwzNdvQQAFfU
         3Rr37qxMyXVyOKz78iNt1OSV3UaOei8uqbhQmhCWb4oxscDnmGcqg47K/qsdB31KEV5P
         isY0qaXrhJcC7NfPsxmZt3B8V+bjCyZgyXyUv58vkrI5Sif6ZxsroLj7gf2IYI3T+qlR
         YxllkCySbiSm2eErHHXVb0j05BWdU+hKx7e/rEH76i/9pEOQPnitDSNUHXGGVYLp+etR
         ax8QUGXL9qxxB8q1SlCCh9n8P4pnqOy4fAoiEG8pPRSifvDaCRpFVuzRc0m4g+hcyJbC
         YRiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMqO6KqFR9+8Q/Xjs8b73Jfm/JVVX0exLQIcQTMG3F3ag84K5kaTaXq/0RUgZd+dnxv1Hj8CuXHRTRWuA=@vger.kernel.org
X-Gm-Message-State: AFuF++lhrAcbiqH9nxArlK7Ahtb7TMHP2iAmVj5pky6x4GS/ZPFDS2ZX
	Z6L4iWMBmEgIeSyNADeCkPCyxWU2VEj66zorufFbk96OISoENPXCsP1W
X-Gm-Gg: AR+sD11d+P4en7Mzqe+SSKlcbAPXEHU0TJDeUgvazZOZDALmWShkIBHILfJoOyCo5tm
	aTa4vlkGULg16qaFj0eyUvzs3v0qzdWj30qtdglJglbVOQOfzHXk8VJukWPF4rYNAkbPEwiPLP8
	S4Lj+TMUewMdQHBlHZ682ZGhkiVqnGyYU9HqIgGiy4AuXPSGSRgE9rrJdS0j5xqywheKyOt8V0X
	VQe2rnUmRR2p7JymHcY/8iB+owg0qERttzfMjbeXlVDSaFCgm+jV2a0Fykm52lHz9dTT0ij+q+I
	5AoY8fpGvKSv/if37ywRHsEZtCXd01QLZkjfbUMvMPpTot6g46xVxwXfaOY7Z+1nYs5ggqAxHVy
	e+TMm9djLnizsVPYdXk0uRarIp+4g+Yn1SEQReAlNLbUhZHovV7RiF5Xrz8YflvogSaWDIeB6XK
	j2NjJiypdzvfS+WgUbnWHL2CyrmA8EkD/hkziz+SAgJDSj8Eq1zdPmTdx+xxiUS9YjF5P3lRgio
	e5GyI4IkGp9l19X8I0Qy5s3FpSafDov8YJluyI=
X-Received: by 2002:a17:90b:3ec1:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-396d0f2dcd8mr6758572a91.10.1787894845803;
        Thu, 27 Aug 2026 22:27:25 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc555b0sm977985a91.13.2026.08.27.22.27.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Aug 2026 22:27:25 -0700 (PDT)
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
Subject: Re: [PATCH v3 3/6] mm/migrate: copy all referenced state via folio_migrate_lru_refs
Date: Fri, 28 Aug 2026 13:26:32 +0800
Message-ID: <20260828052702.52673-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826-mglru-flags-cleanup-v3-3-d9f1c75549c8@tencent.com>
References: <20260826-mglru-flags-cleanup-v3-0-d9f1c75549c8@tencent.com> <20260826-mglru-flags-cleanup-v3-3-d9f1c75549c8@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Transfer the reference state first, before the destination folio is
> marked uptodate, so a concurrent lockless reader cannot have its
> reference update overwritten by the copy.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
