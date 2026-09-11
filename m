Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27DE19D074
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789092094; cv=none; b=A99Kbrtb5pBDAJWlz9p2nT0+yatPkezISmA/foquVVTCFMNfYZCgO8gNYzUjOswNsL3/JYVRPJKQowUHfDOb7zT43ZrOyaaylq4xLhCUo1mijdOn3SkwhweFA0TH9opkwyLFF2rF7ZfoPE9Bi+C9svNVe+RjnfCc2UGFNOQ4TRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789092094; c=relaxed/simple;
	bh=lyKgnl1EihW2JrbG0ea9cQy8KQxBT0XDsfs/3jQTTME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/vu84twAUpXeLiMkUTSijLwEGLHHoFxjeUvLcTSo7c+VasBqx+uR6bFFYEnjIM2pVFYMynTbry3C/ZSaKpfo+UjQ+jxKlSqv5ag2LfNkWOBkLbEqtZDVwCNEWIr/nWHZWhZBQsZgKhmyjsW03XvGnQNZUwirfA7Bw8PhKcyT3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qiBY/wv6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qiBY/wv6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2dd020a2e44so3586605ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789092092; x=1789696892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2lwngQ9rxT1ESSfCU2zsMXvsP+GFu2zW1k7zlPAhs8E=;
        b=qiBY/wv6p6E1WLUGWTmvx5LRd0NvbYT8uqebYSppmrsQlwgQsQeGnAleRHRnY/oO3w
         U7V+QxUa5ANdorMMUJt7lZq+ucVa3W6GAQr4gN1tPZydUqZS2IgRaIxzord72MVAbrKT
         zSrXJ+wkzAU0xJe7C5uQgxY8rP/nmWiKu4g3r4ANH9ybYZeZLbdhJm3TdUC4RHBSAfQs
         3w9ut1Ql/gWjvZhF5CT/LIfKpIxz4kAF6nz+9G7GMCyfM7UYVKLeWrnMwmfRwWHhtP4r
         INJixs/WHMd0fBhtpgnmJrn3W5JfuOPXyE8vakCvSojOCVroK6xNQtRpYMD8oouNrWZr
         nUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789092092; x=1789696892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2lwngQ9rxT1ESSfCU2zsMXvsP+GFu2zW1k7zlPAhs8E=;
        b=TEkHfUrmhl3VOEcN+XCqJC5qQty5FTEfB/SB6zm1KMzmHtHzaK9myEgYIb9rFX1BMU
         /aJOG2xFQFVtAuALSAmdj8mqMNClE9CwLvmYE9ENdamOGzCl5troG/33phxEahkO66G7
         iQqm7dvHWnpxtRJSomtb8ljGwK9psErEcMBJzC458rcBPCz4KfYPDZM8EvW3xeEfvlnp
         n3X+LgisZOfxzJREZraC6l1Qtu97JEiIX5QmpAYAoz7LHITnoeYmfXMxSkfg96CNX7xZ
         VSt92ziX11aPpauZO9MpXwzo4hRLnQU2n2d2xOBdM1U4QC3PicA3kMwMlI4j+plOwiRb
         /2fA==
X-Forwarded-Encrypted: i=1; AKwUvBxkNPeR+heNIf9BqIaLpuSlPUO7jBshsew+MMZWmvoTMnfn6o/YybRq/nrm3+8bzohVOp63pnH0Es1Tgxg=@vger.kernel.org
X-Gm-Message-State: AFuF++mpZvGc+5sz4lEJ7A/YYwZxjHfxt/fjvjJINDMpvozhZB3fg5OW
	uf7MA0+QcdTJWqCeHbIsvTdbYVUulBQZ0kegVldI645yYByIW4f/GuY/
X-Gm-Gg: AYBFou04v91wzwirHkMTX8unjlWGE90LeJzlZCfaB9XOzmRfned2f7MA5RY9FzRSFWz
	jz/oE0sz+rKgWEF0DaBunVoyABD6uPYEhwmuNxNjVvZYSBpmmuXxVlva9rz6gOPHvEUQDWodNnI
	I5fUBtuXRhHsreNIHRQOQm3zdgF9zcDn9/sMpjdc2OVTPS+r4aIBP/zmbwbvnSg5v5+JNcGaBmP
	4gymRsls1jj3wuZy00+d3VCEjJswQ6k3AN+oKwOeyuIoSADwzmVsZFPhjThAg58h+LwNoiXg+PJ
	3QxtLC9MJDILWBz4jAs30Okp9IBWL8qtRaKnIlErAwpR2MPAAZTK+BVEWvdjuezAoSohXbnOtjs
	jZVNbWMv3BSbu5vtPkVXPIJ4vGccbIJB3owybZ0mwlrafgYkY8ufWy2pGBL2sY4dmWL1ebj/QKG
	GjkWSI9T40MA7xsdGXCCuFMpvXJLWmFWv019/EacrWGD9h3diDqJgabP46S+3qOcW4pCh1D+QLv
	eIbosOqXfapjy2JYe3+GXJPYoIM+/NFrrvjtDn0pN5VHebg1eU=
X-Received: by 2002:a17:903:1b04:b0:2d8:d4ce:9f37 with SMTP id d9443c01a7336-2dd2a470a45mr40913365ad.21.1789092092187;
        Thu, 10 Sep 2026 19:01:32 -0700 (PDT)
Received: from localhost.localdomain (vmi2317697.contaboserver.net. [85.239.239.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2dbb900asm3052615ad.74.2026.09.10.19.01.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 19:01:31 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH REPOST 5/5] mm/damon/vaddr: support pgidle_unset probe filter type
Date: Fri, 11 Sep 2026 10:01:10 +0800
Message-ID: <20260911020118.37585-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909140408.104699-6-sj@kernel.org>
References: <20260909140408.104699-1-sj@kernel.org> <20260909140408.104699-6-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 9 Sep 2026 07:04:07 -0700, SJ Park wrote:
> DAMON virtual address space operation set (vaddr) does not support
> pgidle_unset probe filter type.  Add the support.

This looks good to me.  Checking the PTE or PMD young state together
with the folio idle flag and MMU notifier state follows the existing
vaddr access-checking model while making it available to probes.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>

Thanks,
Lian
