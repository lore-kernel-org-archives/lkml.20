Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487ED2874F8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904465; cv=none; b=IrawQU6OKPNNd/j/BCxyRaYtMCXuk0MuPirNBrUOnEQ8/7q3X3OUEkRXb67KIYb2GUfgZjTg7ijSwCISFgNuMj5ww05WaRWyGOcjlJa5Ka/NkdLJlNX5jOVDVqFDyjR/oKMvXLTN+y/jGfcRwFTe8vu5Vj7v9W10HJwuys3mfkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904465; c=relaxed/simple;
	bh=Ksjhne5ILq5t6550JHIS9mm2cRFKSFPGN2x/YHNX7A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lR5gJ07XT6lqE89ibSwot85E0/CyopuPkUVV0u+LgugN8MkDAnIYDBMlFNxH2Mu9SX2fTBFZtyk+xbKf+Hbr66vUs7JSBl8bPa2O01Wacjqc3rCSxTUtKnKgOf6ruKSZycqvAcyCfcQZ9Mys2KTMws0HiJCkj3uwM0bG52NyIQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjey+xUm; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjey+xUm"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34ea0b83f8fso661522eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790904463; x=1791509263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y1LgAfbPm7WCVCr/kTVFseOyGOKs9AYLzlq2Y3Kfm6E=;
        b=mjey+xUm/PFBKTWXCUaFt4+nJEWG/6uGl6EBiXpoUza1nPV6rBER/WtJzZkSh1t7wt
         s+GjIHPHwzdbykB77jgYoo9sNgczwA++uynQcNHL+AwAp+dPT8Ydhf4pEH80UsZrTYM4
         kR/QROvl1VTYza4YzloyPwROUIxtg1CZ+HQ3rHfhpaqo+pkwY+OQHH48ifEfF/RaeEoO
         aCy4cPhlAuCZgQYUwmw3srdVfWEu/N2hhAy7NbpN7sRSVo2jFprQT6HaTEDnL+qWAG1I
         JWL3DSJN4l3F0i19dJGW9Eytj4BajttSVLSlCFDrH98JAB+IZenr+vwacjiqeTTG/8vT
         /JSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790904463; x=1791509263;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1LgAfbPm7WCVCr/kTVFseOyGOKs9AYLzlq2Y3Kfm6E=;
        b=NpRnmuLFxrEskExNzg8JfXS8uwZykIsWfonffOnQjPyTJRBfuKnF+/pEMMNlxzbMc0
         7SghFbFk5yIJ0b/4GgIaQl+18EeTPjKbM87J+9am6akfhEalQ2w+7qwngwpcDpGI1xgT
         90I79eIgXWrBdSyE3oBAKeET4NFgnvUSw0yoZfrYP9BDIdQ9aMmSKeX2V2e/1N3JB4qK
         VHnF6TQwLlrPbqsT2TLZ0j9362y0uaJ5bksyppJAD07FU3XixQPA/4fyr7NZQvx+IcvF
         Oli7W9XoBDSgtE2VYG7c8ckgXXJN1rmLCVxInLl9vXjsWzKaBkZ0qpJXlZ9++gxYCnBL
         6wbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIvQgVxZ7NVde+lZwfdp02a4cT5OhiK80Y1/MBMm63GzemIKvOWE+deuJxPSK9mTFGfefJPy8nHhWLhWk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0GPtQHI8PIKu/vVDB2KcwtJAR/JCANuRqc8Q9Xlu8hWUF6hhD
	/rXA+uKOyh4SQLj7qhIirxFHo6S2MI6uc+uqBXuaTCuAWbiQUt58h4AX
X-Gm-Gg: AYBFou1EwRsmKg/pR4GsSeQs6rBBBKINanaxP5KT9Z1Up0MYqgau8Ve16Ni4k6+/vlL
	bMfEDw9mgHaY3Ow0fVEdGOC0JkRWM5Hi5OIVS9V95O/fPiQXd35qyKBKkNAzbMuf5MjfnoO4988
	i2cyVhssaRuakn0Lnj39XrAKX6TWAlfabl16ZKChpdbTlBIYGJP/zIN1j30XpylbJM5xFYPD3dC
	x90+IEAsXJoc8T2SMW7Vg9ZCX099PBSSN3LR06GYfHzJV4SHgA/GYVw5IbEhRWKWmIy3VkMA7xA
	CEXGyygk9eAs1ubeYDACvkIc3HTFJgQkXiNUjmmSyb1lY+tnfX3GNgzlpyMS6XFX53V2Gwz6TRG
	v/IDE+plr3jgT5XDhsR6Ro4zarbVjaUa5x1/JmpmnFHmFsRo6/WT5OgJQM4j0GGrlvJFzZV2EEV
	EaiT0eJR5sZji5cy0k6lI4r9v30zoRW/hFW/UoU2kZoKMql1IALsfx5TTMnOUtog==
X-Received: by 2002:a05:7300:3a97:b0:34d:755b:d60b with SMTP id 5a478bee46e88-34f2199dfaamr1174327eec.34.1790904463269;
        Thu, 01 Oct 2026 18:27:43 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f2dfbbsm1942238eec.10.2026.10.01.18.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 18:27:42 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/migrate: look up consecutive pages together in do_pages_stat_array()
Date: Fri,  2 Oct 2026 09:27:37 +0800
Message-ID: <20261002012737.149491-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4CCA725B-9CFE-4ADF-AE8A-59D6ECA4321F@nvidia.com>
References: <20261001-bug-mm-move-pages-stat-batch-v1-1-255b7e915744@gmail.com> <4CCA725B-9CFE-4ADF-AE8A-59D6ECA4321F@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1 Oct 2026, at 11:37, Zi Yan wrote:
> Instead of adding customized batched walk code, it might be better to use
> walk_page_range() + pmd_entry callback. See mincore_pte_range() for
> reference.

Thanks, v2 does that, with pud_entry and hugetlb_entry callbacks so the
walk doesn't split PUD or hugetlb leaves.

> BTW, DO_PAGES_STAT_CHUNK_NR is limited at 16, so the batching benefit
> comes from 16 pages instead of 512 pages in one PMD? I wonder if that
> limit could be raised and how much more benefit we will see.

Yes. With runs walked in one go, the walk setup paid every 16 pages
dominates. Per page, querying a populated 4 GiB buffer:

                16        64        256       512       1024
  4K pages      31.9 ns   15.0 ns   11.8 ns   11.2 ns   10.9 ns
  THP           23.1 ns   6.6 ns    2.5 ns    1.8 ns    1.6 ns

v2 raises the chunk to 512 in a separate patch, which also allocates
the arrays instead of keeping 6 KiB on the stack:

https://lore.kernel.org/r/20261002-bug-mm-move-pages-stat-batch-v2-0-f73b5d20519f@gmail.com

Qiliang
