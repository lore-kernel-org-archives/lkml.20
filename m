Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697473B95FA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789092060; cv=none; b=LxMjSuH5hsiJo34wJHpUk0oLNmrqF30Fgc6yoUzsOr4qF2hT4q+5S13CABsiExGb0bBD56RBXU0JvyD4Q9V121TVjeucKEZ4dL7aNAYqs09Z0l8qgujfdVJpT03PpeYCewHrSwJysUy4BeEfYQFRC4fdHZV874KUnrs354Nwq68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789092060; c=relaxed/simple;
	bh=wp0r7AgCRJS+78I9gN02wWq64Qe+gJJTd7gRl1+NHX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lysWhxnqkWsIQ/B0sOi3kkh+Ca2D6OWtLPCVq++F5Hrs/qp2Hs5qR245D4/gcNVwKp1qYcs1Z/lGQk5Fn4BeyFJegWP70ayKESwac47pi7/lq12Hy7dXn6IqT2s1BJxoUcOkf8+tzD90+0LlnfJkh76CJRfxzY9cYwyEaT96x/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbzRcZqE; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbzRcZqE"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4be0e5469so382337a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789092059; x=1789696859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9aokmFcZIJ0AXOYQkqpTsd2jezFgj/8e1f52oVYV64=;
        b=hbzRcZqEQBH4Lrz9Zipj/lJD0sP3CJ0avpyjtFNrawttgKxCnNijlVJBDMx2MyuuGA
         ptcRPutFRhCsn0KiNxRXBHJN0AzU/v6F+RrrSXdwq5dAgx5ToADYUqSb0y6Z1z8NpMWL
         eX3jAcvc/XniNdGpLcIct59n9CB/Z3dK2B4yZcwh+WmSxUDltkAqlXBfm7/ul12ePkB7
         6+NM5ihsL40GeM0s1Z1I2OcO8xeQmylmZ1Nq1bTm0/IQc6C+iU5hT7y/exAL1psC+YsJ
         vIv522DkjNAoGzr8LDEx3FMicQAwFxc6bGvdhn9og3nBorsWvGnn5WTGtKZTdMCFTY99
         UTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789092059; x=1789696859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i9aokmFcZIJ0AXOYQkqpTsd2jezFgj/8e1f52oVYV64=;
        b=K+wjhNcVjrmqPOvNwcK/1hS1pz0uWzMGxP2HmBs9L6k7AU0Sa/8gKDkXBof4WpqnOe
         HGgEXIX9HtmZZxjeW/SMnu+vY3VdBhsrHMpUqbGfdw6gvKSiBW80/ssDNFSiqNVBgKpo
         xWEEW/W3Fmp31UBeaNQkdua/6ra5e+TxLRhj0JHASLdIy9TekMcptNlsquvae2beQd4L
         m6hs4ZbBGklEVzA+XcZQ0rcaXEchqfavagjQLnZg3qf9soT5RChZf9ExsBZSDYG54xwd
         nVily6F0sNj7qg1b0sg+mMigH4mq/oIenxw5ced9kwu6WKvJ9EI+tv2Jx94y+ceXIuS4
         2l/A==
X-Forwarded-Encrypted: i=1; AKwUvBwXEZc+E4CZjiID5PXrFVAA4hIuw8TMZmCvM1xV9u5qT/VS5ESDO1PqJcLjfJQfJTWdEsQ4X6uzGc4zx1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nTilBppixvFLHQE2wVVr3nd5t/2OCSrcaCzHR85UYtvx1yOdgM
	u69UtcPfv/pzNY+d9C/tCQvP009oQwOql5mn56BRgGOI2TVwqfCUWzKa
X-Gm-Gg: AYBFou32QMkfbjoiSVr16NtAMpNWNQACfN7e2jyYYCSNWz0VUj5sR8ZzdYKqhf/U89c
	BWpJDtax1gBWZMP8qVNmuHo8/L1ANaqgPl0DoGCT8DBT5Cx4ZEfa+1Y6k9isB/+ylqjITtMYgQ1
	Pl6sjtWhlQ5iZQDba3xiIy6aK06k5DDjWWXrtzDHG6ZQzgfvbiAco0Ykx1k+BKoBqd6E0vfwFjP
	24SglzmZ0Ed+tszfbsVz4wFLiFOpbXz1in5CjLrTDJ8EEEixeBdOPcJv3FzKFt29arNXRjRwY8o
	rEnOAimsA3dSMqGOHbokND0mJeqWgft2RxhvUS6fWmlg8kOgCtYqPAn4+N64nURnG8FHd1g2Xh6
	41j5w/L1kJFqbSPD3ZIWM83l6SdKAEXYrN1/AnVUnYYQvL01leQYrKns5LYY3lj/Jd9Hz3IRq5t
	ittm3K9+wLJVXO+jkyNe/V0sbzwdK9Gi2Ukrrskms77WHsfDcV9NcTM9BhfqT0WsLzoKK2vT69c
	QL6wEzQAMDZGRBVo1Z0iD92y14GFHiM+XDe3wHe
X-Received: by 2002:a17:90b:54cb:b0:39b:51cc:4586 with SMTP id 98e67ed59e1d1-39d9c21bba2mr2583345a91.19.1789092058595;
        Thu, 10 Sep 2026 19:00:58 -0700 (PDT)
Received: from localhost.localdomain (vmi2317697.contaboserver.net. [85.239.239.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfce707sm3587205ad.55.2026.09.10.19.00.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 19:00:58 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH REPOST 4/5] mm/damon/vaddr: extend apply_probes() for hugetlb
Date: Fri, 11 Sep 2026 10:00:36 +0800
Message-ID: <20260911020044.37520-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909140408.104699-5-sj@kernel.org>
References: <20260909140408.104699-1-sj@kernel.org> <20260909140408.104699-5-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 9 Sep 2026 07:04:06 -0700, SJ Park wrote:
> DAMON virtual address space operation set(vaddr) does not support
> hugetlb pages in apply_probes.  Extend it for hugetlb pages.

This looks good to me.  The new callback follows the existing vaddr
hugetlb walk, takes the huge PTE lock, and keeps a folio reference while
the probes inspect it.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>

Thanks,
Lian
