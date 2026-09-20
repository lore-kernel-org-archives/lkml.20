Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4863BBFD2
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789871863; cv=none; b=epLXyPyLoq4pTTTnN3WsMW14/kHtT+SQFOJlCU1ajQ8bJyJSGwayGZhmYSwg3OBMCzpXaecr8oUpRccpN7zz2HFMnKngWpHW6GnYvTXZMWUjNjydEUDAot+CzKFvw9v2bmKnK9J3iNJGwchuuIWl0eQ/3Is1To7eGJVk1R9Op9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789871863; c=relaxed/simple;
	bh=okXre6j00i1YDziNvr4xvCqzfIaczrmT+5Z9AqH70Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RiAq/Ebgv9Yyid8IXJL07W+OIj4GMDUaWReN/3v80UMWBg4sjZAQdykENNyzCSqqdJQuW0hijJ2pupm2B1gpAVWJeVvvRyUpmxPWyxcCDYNhKd4ZgxswTtZC9e0xpJ062Iwi6db0rSOfKDuzhayTfvPMnTGMvDtTRFgJsaWHej4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SU+dhkm/; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SU+dhkm/"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f0135fso18733665ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789871861; x=1790476661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMPCKFMy0q8dOtTAgKNYN+tQZo2X2/BEgITns70uQG8=;
        b=SU+dhkm/QB7HjJbF/XLn5nsOES/SljVsucABc8m6DzPokuYHVxDfNyZcgLJPkYUNQy
         gTdhDEyIBOS94k5mC+tKpcZRBtQzJ+84p1FQPy7aZI6dFQJoT8R+YLfUWrangzbxl0j1
         Z+nU8nMNh5FbbbYJ3WMHbig/jgrdlh7svp225FBuFhdjgFWz7R6n4TTcIxJ4M5hk+10z
         6qtknjFPPHe/9Edzs35yikLpiSj9fad8nunf0jHO+oqyFhIGEM/AzxawJgkuXVvHy1gu
         e63dOlM4QD0QvIqhBXMFkyOiAgBP/TxAtOoU0pRn3RXY7xJAp+Tvfg5zkfVqLjieia4H
         w3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789871861; x=1790476661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UMPCKFMy0q8dOtTAgKNYN+tQZo2X2/BEgITns70uQG8=;
        b=M3APBw3suePvPU9je+ETQbHY1ppLD9taVXZpdYihNLgdZs/Juvp7fsU1xmzLdicNxh
         UTy4B1Z5YAVhN1iUSlA/snB3vJL1dOo3+1VZtNNTh3tFPAnTNDu3nO26mrMf/GoOyC8A
         UXyAczTe8sBiz6qIBNaeOmwHu163nBFsobtH2xLRUmToiN83UP9ueg3VTfDM3US9B8LM
         LbLP4HIXDH0MUtAEtLy73Xo5RbaBbZ3IWW4JUjsblA6Ky9TzKdj/BFBkf25mNB4i3cAJ
         Y1HaqG/qvHTCn1L3eBRe6hg6d0QeMBObRyq+jXwWB9df1g4BBRQtRdS8Zck5JsHFl5q5
         dwww==
X-Forwarded-Encrypted: i=1; AKwUvBya0KzMyTo0xwL8/J/SLUUAJw94g88UsBySNttgtUFSeogNLaZ/vV0jsK5BDMb11L/ebDlCGC6LSXSkMWQ=@vger.kernel.org
X-Gm-Message-State: AFuF++llAlt4crhSl9Yur/goYnyz36QHvwcMFYHruAJFtSU8c8o6rzTd
	kleyCyWaTn3kfJ/ZlPtO0IIbTGAq+yqExsu8jjPTnFGncE4sXKYtvPA=
X-Gm-Gg: AYBFou1TXSxVvllMOQjHIGRwH1AfH6DVLUF5hPct+0tndIb7BVw8j74othE3SZ1lz9r
	XLVuqpHi3gaw0SUVY4YStQFI/RaCMNKuk9c8IHzN0WvfTy7NMz9m43M7aNZlKnJRljvlMdHz3A9
	h0uxtuj/CfrHX0aJAWOnyARdmE/GNN8Dz5gAp9vNBxpObtA1LwakOwLzOGZOR1BSOGFjrKKfXRW
	yXmHWNOpGKaXXiumdK2JC9NUVV4Rp0MmQKJY4rsVY7Us0FA5ICX/99arnQvpLtuyRqD2Db1fEAg
	ek7wFC801f/NmB/gr0gP8jXnk00rpwCHWH+OnTvg1SOzk2wVneNa0jjNFDQaHRORxGFp6eztaxb
	3zGudsekZMgoYrpv8SQPpYzRe0OjUE756zAFjoc5DG8ZcOh+aa/IU+RiPVeQ3uwq4GHnRsEll1/
	WiQLePzR2IpN2EY2XSifONq6hp9Oortd+gb9Yzx0VcwNy6Oo2W86jCUheQZebPDtqsNuiuq4m7c
	7PkPVjLwxehb7YvtG0Uhpf4JRcJV3s7E3iV
X-Received: by 2002:a17:90b:554b:b0:39e:6c6a:6572 with SMTP id 98e67ed59e1d1-39e6c6a673fmr5097657a91.53.1789871860837;
        Sat, 19 Sep 2026 19:37:40 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:36d8:54a:e0bc:3e5e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37c8e7sm6799764a91.9.2026.09.19.19.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 19:37:39 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] mm/damon/tests/core-kunit: test the temporal tuner's size quota conversion
Date: Sun, 20 Sep 2026 11:37:29 +0900
Message-ID: <20260920023730.2468388-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919170154.86842-1-sj@kernel.org>
References: <20260919071324.1583280-3-donggeunyoo.kernel@gmail.com> <20260919170154.86842-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi SJ,

Thank you.  All three applied in v2: damon_new_scheme() for the scheme,
damos_new_quota_goal() with damos_add_quota_goal() for the goal, and
ULONG_MAX / 10000 written out in place of max_sz -- the name really was
confusing.

  https://lore.kernel.org/damon/20260920023111.2466265-3-donggeunyoo.kernel@gmail.com/

Thanks,
Donggeun
