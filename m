Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BECF3BED4A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789092025; cv=none; b=Ny58+JophfE3lP9pZdVqs92ZYyGMsidl3RPoCzMC6EqbcunBK93xYCYjOADw8DReXeeoYLQs+0JOYK2bbOcxfZIMp6SVZcwt4I4bieb+KJX5VuftrR0ZdXcqlRPtpO4+/PjdToOAPRQS38K95nWTsPRl8euz6oLaOJ3NwwzIuDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789092025; c=relaxed/simple;
	bh=eMcNxywo4P22GAl1/QRj+gOPAB3bl1kko11WHwQr9l0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=puXlxehSO+Xp0bwLj/0qkj6QBEwfF0jKq9Rj4mwJ+lVeDt0Nt00g1wahR0O8J7xUXswqduam6E5Xt0dzbIEaZDfyJ2jh5NH0gLvDYLuPmUZnrf2NJzTB8UtN84p6kQ4OnqySjy74qnd4uEqVyzyNVk6vlmlMQgQluIPLv0sk+uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hom0rAtR; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hom0rAtR"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so460682a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789092024; x=1789696824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2mR6Y35CkB0Sm25OWNIh+4C9SYin4d4S4zqnM9oCeA=;
        b=hom0rAtRtPuXRbRiIV21K8j98TaFHoAYZG+PeRew9GzIfWkUA9Qody0s5dE7pnVZwa
         AsUttavS1Dk0hn6I5Wo8bNQWqE5OH/aTwKt+LdsZ/DqPsmLgXrb+D/hnjQfeuYagI9/O
         /xgJtXSi1JmrrjydC6pv9IicsLLQPu8c7AfvB/6d9PYoekhO3NGypasge9hRdvmW9vWs
         BiAFVbVXB3H+og3RAA4MdNHYc7s7C4U4/9bsqfVtbpym9/nTqwsMX8MXl/Yq2scGyVWT
         1f32y/d2mG3v7dGOikGXPQno4tW068b1cMntwJ0Fw2M/pNi4pt0UfMltYIJVZ9k9KKjA
         cGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789092024; x=1789696824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2mR6Y35CkB0Sm25OWNIh+4C9SYin4d4S4zqnM9oCeA=;
        b=IZ+ojnvUBnv6oV65RppiPvoZzHUPR2rRoorlo3NuNXTNN7XFV6eaI/6teVZxbTyfmN
         i9rHZ9TM7mkuEX5KzMjtl6OX+TlzLWYaWB0N/ZQp86rvIRoyZ0QcuXNYJ3yxT6Vasvja
         /3dlkoJFXFqdXpoUBAXqWQuW08YpjqMsXijbqx+SdH6tcHt027EyJYiaEbkqtLbcGhFo
         VgrdhlngqZJeM/uyt6V+ztKfEyd8cFvRslUMrYdmkRg5H4pIgJavCTSwRE4EWlyFnSyQ
         iaLR+SRYWMwDWTEZ7rYzrxRZtnL9SW5rfxBdmrdVT1bMDHIcrslGE90C6kACH21eJxtz
         A4EA==
X-Forwarded-Encrypted: i=1; AKwUvBxOb5NcAglmtUXNvst60wEnAi4vo2CTuOxig2RWIhfPhC6ciTwdRxuZsiN77XNDjghtzjo7uNX7x0Rd6mY=@vger.kernel.org
X-Gm-Message-State: AFuF++nopxg5h4O3G+mYbagk+WwySMx0ruOZtFsns+mSJsGBXi+M7+A/
	n+uatrBys0XVZf0VRZuN2zXLaznpKCLO0OgpNZANZLC0r+oMmc7prZvE
X-Gm-Gg: AYBFou2Ni+JItq1c9kkcKEp5CHy4vBzXvI21rdJuEGxqFOb5rIxMjmyRWYApA2ANYO9
	9Wnr+u9+T1s22em+tg+5I4GrvB9hfRYrPEm9PXEedmXfJ7whM7Q6CnTOg9Qj8bwj3lQWSgf2ORm
	Oj0TrcC4zhptqdzdjXRNxZVHT6VIQ82H+mpZj/XeJZj52LpW1p2aVOyXFNcJ7hEzRf9SE+BiPT7
	Ed/GJGzj9SgcOtZsdWHIP3eJJZ8x6gTkYP4R8ou9uWceDGI12wwRXk9rDKMuDy5PzucWkeChz3h
	4K7PNpmFhbyKw8GXrBUrODL88tBHHlC1ruuCYOAiRCorjSp5THxXWEhinV5aJ879b2ePX80xPhs
	8+fnVoLejMffXaRsgnz8CXMXDnD7473uDs6WWpjR5IAuZIegCqSwkzFmWrCrmwHcfW/01p1LUnP
	rMdY8jXqCyNLjszqOLSQFNJiChDYgZJpme/e2DtaNLWfs3gIBsWZ+910cOTd193+bJroumlweeD
	V9MXTUpxsB1NXqgKWgDhv8JKtsWZlD3CRQc+MbV
X-Received: by 2002:a17:90b:384d:b0:398:c315:fa6f with SMTP id 98e67ed59e1d1-39d9c1db3c9mr2574336a91.14.1789092023699;
        Thu, 10 Sep 2026 19:00:23 -0700 (PDT)
Received: from localhost.localdomain (vmi2317697.contaboserver.net. [85.239.239.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bb0119sm2263927a91.2.2026.09.10.19.00.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 19:00:23 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH REPOST 2/5] mm/damon/paddr: move probe filter handling to ops-common
Date: Fri, 11 Sep 2026 10:00:01 +0800
Message-ID: <20260911020009.37475-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909140408.104699-3-sj@kernel.org>
References: <20260909140408.104699-1-sj@kernel.org> <20260909140408.104699-3-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 9 Sep 2026 07:04:04 -0700, SJ Park wrote:
> Probe filter matching logic for anon and memcg type filters in DAMON's
> physical address space operation set (paddr) can be reused by virtual
> address space operation set (vaddr) in future.  Prepare the future by
> moving the code to ops-common.c

Nice cleanup.  Moving the common anon and memcg matching to ops-common
preserves the existing paddr behavior and makes the logic reusable by
vaddr.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>

Thanks,
Lian
