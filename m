Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACB04399DB
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789907102; cv=none; b=pYERZjPa+2IZrhu8mVrqzBl2xejJGFebTnswxpohPk3lNhs+2qkuDQ1c/QRvQDv0s7joXpISnl/O9TYXWR86bvhu/GxodcRACeTlzaLnGepKyrfhGoy9Ew78LZbBrFD+XNo9+tKYT0eHDC0dtfhFx9908IFmAUCtaFDUVKAu64E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789907102; c=relaxed/simple;
	bh=m55ogdFoo0Jzv0GB82m+XB58M8rKI8owtLrio9jl438=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XM+lGoSx9Fp4mRxOyMzgN+zxT4rY8c8ELJDsJgZmWQlIN3Oc0P6dtjz4733uw4ilancf6rm9i1y8r0uMiHycl/xQDug4D9azu8sfxtPQ4+Y61vtCb9Fq8fJhh1EE95jtcB4YXjKsEHJjil0skhRydveUHt4/mh602uk+F3RoCFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eC/GCsGU; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eC/GCsGU"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb65437so1628360a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789907080; x=1790511880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InRkxGfoq1s0w/ybf166NOP+zAmO71hub0jrhGTfC6U=;
        b=eC/GCsGUrKsgqF4Ry+A8TQJzUjwRyw179B8P1cDqcWEYFeAe74et5KHHoR8uvKIncl
         P9s03uy30oreNEtDZn2E2Uydfx9bVYKm9NJ+lqkPICOx6DpLVDmrYm8Do+fTCy2YlqV9
         mRauJgXP3aF/7g0ER+Wp4T38gkUzDuxLebr7kI0GUC0x8xPSTc+zE3J1FY5iGwBcsNy9
         nEwxp4+Gx+a9DK4q5ptPw1dM3/rg85bO31qMPU5CTWJkf7bx9rz/tlUKG6KP3WOc5S6I
         AvLkGpvtgluw4UiKZVY4Q5/po0AhHJS2NNLf/lnTVufgZOgCPzk9kMo3NjKqfloOTICx
         Uvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789907080; x=1790511880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=InRkxGfoq1s0w/ybf166NOP+zAmO71hub0jrhGTfC6U=;
        b=n/piwdN1CPiAscIeZHI9GBPWAIhE2n3tV4M2SN8jxQU7aOlArYCUixI8AoMw5Xv6KX
         DNbLGBXPb0NQdl5oPjAuFTWxuA9fr1fYh0dpWhKHybIDbxiKrzNqiYDQeLnwa+I66Wb6
         xgICuuYDgnGk8CceM+r7/CBcuwTzxyl9yD0LFQ/k0g3uz1R0Xjr0x5C3zg+5+xiqy+Wm
         6XPClnq9TOc1J7heyXeFiJDfAmQTHnFPHY7B0ve6c3+8PhmMrmcB+BG0xJDs8zXLwfLl
         /gJGlDVyl5M3VU+k0bALva0HimQb2X+ZkDnV8NjirP/NeXJvkrpVJ0g/q0FoNwv8HrkH
         HS7Q==
X-Forwarded-Encrypted: i=1; AKwUvByc7LSWEl14VcYKB5OgXUikrnZuM+ObfjCZyvmXmY4WPmVXLYXuGuBuu3rNdOEHcxlZNVynyn4/CWuXe5g=@vger.kernel.org
X-Gm-Message-State: AFuF++nFoBKfv0DMpX2V5M+HQkePG3tqR2vqk0jvG0paT6vEOmPAN/+4
	YTydbBXxB+TObYnLzR8iolrxQUz62uihfxVUm5oRe+0GELbIZuYUpZk=
X-Gm-Gg: AYBFou2KalHsrGO4AgSW0MzHVUT1F6mkwtBP5uwBt8LH2xDTFuiOJkcGjvffmQoGLsB
	ihEFDalQuV14UNXddwxErYJe3tDoTy0Vou8lslYU2oPePhJ6j2ub4QMAFzCKrx60aAJZ2psmLE2
	fEJqzdi75UIWP2wVf1EQdWIMgfGJYqp9Ws0Vp7pKPLBSaQFozQlX5XHsYPkOIiWXNtfNtImwrp7
	HTwgMCsm+usMWGR2B8q7R1A8Pg1j9EGkC3dD2K/8eGXT7NCVsRJB8MRMwRRDrXfeCbM7Y4wCqth
	9D3bCgboTHHsDGwin7wVOkB2obc+U9Frj11zkGvPYDWCzR9Vao5/lTGIZu8x5WamMkacrNSXuK1
	p1iRFcBUr6d01DVfJVsxrlivTBJTht10fYeanwjiNu+qYG0RhSk++TSrfI1V+BPn9OjfoGi/lAq
	Uc+jKU48pFj+HayCqOK+Ci4h0COwJFxTZ5yzv3FOZIT+WpgqlgRb/fVPC/CI8913QYUqG9ejPTr
	7nTZbFfS1Ut1OwdccTmi8EDLkQq
X-Received: by 2002:a17:90b:1e42:b0:3a0:345a:3620 with SMTP id 98e67ed59e1d1-3a0345a48a4mr2499091a91.45.1789907080513;
        Sun, 20 Sep 2026 05:24:40 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:e0d6:4b87:c472:c9ae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5647c151sm4972754a91.4.2026.09.20.05.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 05:24:40 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH v2 2/3] mm/damon/tests/core-kunit: test the temporal tuner's size quota conversion
Date: Sun, 20 Sep 2026 21:24:36 +0900
Message-ID: <20260920122436.610279-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920104054.47877-1-sj@kernel.org>
References: <20260920023111.2466265-1-donggeunyoo.kernel@gmail.com> <20260920023111.2466265-3-donggeunyoo.kernel@gmail.com> <20260920104054.47877-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review.

On Sun, 20 Sep 2026 03:40:53 -0700 SJ Park <sj@kernel.org> wrote:
> Please wrap commit message lines with 72 columns limit.

Done in v3.

> Other than the above column limit,
>
> Reviewed-by: SJ Park <sj@kernel.org>

Thanks, added.  The code is unchanged in v3.

Thanks,
Donggeun
