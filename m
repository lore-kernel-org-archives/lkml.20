Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3BC4F4CF1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975614; cv=none; b=gPgxDf86DDCJVKYacvB34WnuzMyEnlUiOPcZ1g8mZSLRj5Fzd5SnatQqLgorz9pucrulxIB/gWkKocEeaPLMMfZCiAUE/6tAwozk8/ryh6uaGA2maygx4bzKhdNbtSWdvhsUSkm7cqkQXe5qnRC5O/uyA0R4NrQhUNIO5B6EHo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975614; c=relaxed/simple;
	bh=BADH0jT0PzhvlqoDO1uOHMvxOGhAfrHuyiLn5aLPv5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N1O+SDy02+Xh4/HkVgSsbm9c29z2xKHqzHXaFfiDQiUPqB//bZBKD8lcw5LzA/4AMut76x15ui8mFLWXiPJ4eUgM7SWQhCN2jBDgRobxyGAHcBDdAitIl9Z2zHbyAK6sKSdhhpD29XQeyX8Ja4PUF28Qt7013Ce2Vh11R6HqXL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTQT8irM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTQT8irM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1ad2e2391so12554235e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975611; x=1792580411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfU5sQaIGa+Ipl8RzCjqbbGQxUibRyyrfdkFZLGRo10=;
        b=LTQT8irMn8QgeWt2t8OE2Pg15yTMfeyvoUesZBVMR1bYMBZmU0DrUYNnLxcoBUaplO
         20Z8rkvtRaz6FZHA52dVyy0LGx8qLr2dQczmSvPHsilPPp9VmsgCTC/UpWQdX7DW/D7E
         gj4+auB7jljRR3JYrIdEGiUcxGH5qIg5YOfeVLC8NywNb4eyZxr7W2WGndYyD/9RXVrb
         ltTbnFmCfCFf37fgXmFkgT+pUyZ4h8GC8oVHD4CjLZch8RWNvL0LR1XWlGBOoYLHjh2O
         7r/9xrsu0lbYvuOhNpkmePZQIyhUjAHJOEKxFHBf55zLdcbIiQQm4U9eAK7ESC8lBxOD
         WF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975611; x=1792580411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mfU5sQaIGa+Ipl8RzCjqbbGQxUibRyyrfdkFZLGRo10=;
        b=InW24md7mS3vyScTSTNekzg6Bbr75nrz4WKm/agiK5BMvCf8Xj11YUQhsrzBXnYEco
         9APoDv/9xsbuPhYTvS28DaA74Fzr1xgcETEniTjqm4+oZPXcnt5QLN/F4N+9mmkqWdzQ
         rncUgmTvLuMkvP6yqZXd430AbohJdypEq7LAE3qRESzIKwS55NeMig5vt8wNh0DsU52c
         8FSutVST0hRKeCCVxjWkXsk3jI4REEkmOH3XolVfT7AJ60sM0Yql0KVvMgK93lydinZ5
         jji5TRigX0Pg0rTJFD1gdXN8x0BEana9L8P/+JRHdirjxzCOTxnyPH30ZtXn2ohlRo4i
         6ecA==
X-Forwarded-Encrypted: i=1; AKwUvBwf+UROJghgF7Fx+cP8+5i95IeTcAb8l8FszYylQMRTEvQqr5p3GQl1ibYB0xUsfzHQb2FW/5T8Sankl0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtuwMUq2ZqZWm8F9ZUYIWIoBZB3gJ5TsRbACObYc/hDkbBderR
	HuR3OstdKK6cF1ImgP8EsWnItHCnL96+ZB0qPt+6z/G/Ea4ynOPklSFH
X-Gm-Gg: AYBFou3IO/t41vyO2GEYOd/xQSQ1Szi9XGvI1wozcNlpMscA4uA/PFqNgYQrVLy1fRT
	pJNCdVhLAHzjqsbE0hLENOh9ka4/ml91jiphnf1mGYfZaC8oE4Nudonqek9IUSts7243rsjZYAM
	odZPK047zMcsLdjr6r2Q+rA9FjgqjdRYaCDsEFnBeWdQnK3lVjIHjysTIckSpClB482uClJfm/i
	7Kq69ELX/XX9rvK3jDRBD44NP9dOLpU/gyiT37k3tt6AeMYmvqS1nyELLvNdmHdVbAiM3sgafvZ
	dHyTBafEMMIyUTohP2rwpikQKG7Da5Vvkf/fMgAgmDrbvmte3/OR+XEC/Vj8CpjiaPRKFAvFpJ9
	RRkGiu0BK8tauqTy4eyVbUXUZgL0VMnwRT4W7lwuE7jhjSApWcZu6bzKN5ARS63fkc1ogncvDuK
	8MLfDwgK9KwFnUikigRXfmZloDkwq5dPz9OduG4ewp/BbtnAQZnuMveMgB+npA6svCfaNfdFPL5
	xW1p6CZ63lRdrGQhjg0mDTEECVkYXXlqE1FyF4h75N9ujBLi3ShqYk/
X-Received: by 2002:a05:600c:8718:b0:4a1:7259:349e with SMTP id 5b1f17b1804b1-4a18e4e0a33mr298140065e9.27.1791975609638;
        Wed, 14 Oct 2026 04:00:09 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.109.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm518169825e9.1.2026.10.14.04.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:00:08 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/5] nvmet: zns: don't leak stale memory in zone management receive
Date: Wed, 14 Oct 2026 13:00:00 +0200
Message-ID: <20261014110001.95212-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013142554.GC14759@lst.de>
References: <20261012141239.156408-1-parri.andrea@gmail.com> <20261012141239.156408-3-parri.andrea@gmail.com> <20261013142554.GC14759@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 13, 2026 at 04:25:54PM +0200, Christoph Hellwig wrote:
> On Mon, Oct 12, 2026 at 04:12:29PM +0200, Andrea Parri wrote:
> > Tested over the loop, tcp, rdma and fc transports with a zoned
> > null_blk namespace: before this patch, zone reports carried stale bytes
> > and a data length larger than NUMD was accepted; with it, reports are
> > fully initialized and such a length fails with Data SGL Length Invalid.
> 
> Can you wire up the reproduce in blktests?

Sure.  Following Documentation/process/security-bugs.rst I had only
offered the reproducers on request; since you'd like them in blktests,
I'll post them to linux-block shortly, unless you'd rather have them
off-list until the fixes are merged.  One test covers this patch, and
two more cover the fc and NUMD patches of this series.

Thanks for the review,
Andrea
