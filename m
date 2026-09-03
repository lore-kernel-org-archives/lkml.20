Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936AD4B3379
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444701; cv=none; b=ea1RBT48tlimNzOMsNLBwlp2FNSdmLQdvNKBl38HMddxb5C9CpzJeMzur9ypN9INUKO8f8M2cA2S7P9wlD/6ssbMUBxpHrHLqR4gNzi9qmNbglzbHuBhKNBiiraAyBG59XYrxZbocsZYBgPQ/EahuFMXjmzyc5IYoV9ClYH7HEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444701; c=relaxed/simple;
	bh=VPIQ9McsdCmFW0ky9DkUl1cuYHBnvVUK/3wd/D/dbMo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dUX6RRxruzmGbpGE9TVpiB+Fd10nQpbcQvG0OiRz84v5fgG6PUr8KCm23HZACfHHbCuoSdOLzhTHWOQ3ufi2iGyqFTGavoc1el9CCXT5E4jTZQViYMifd9PLy4+8pID6I4/bGi8fG3pK+hjODb+yNqJVKlDQ0NKSjUmnjDiUVsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzyPQzHu; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzyPQzHu"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso2051500b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788444690; x=1789049490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPIQ9McsdCmFW0ky9DkUl1cuYHBnvVUK/3wd/D/dbMo=;
        b=VzyPQzHuZhgiIr3RHb/PT1+8t3wH8p6taNHi/IZlM4zifyiLk1Nt7X+fPogYzVM+K5
         +3pX6C5Spj30cPNGPKKswW0tZb301CKWjgKDAJ2y+KHkUmRgbqhs7TxLFLuUlJub5Zi0
         J/d8bmtQ3ZF8+q7uvj99kfA2YmPgS6egBHc3dsdZ0aqXv7AKx5Hh62RbFSZXh4LmSVBW
         K7oD8jLZyPHlTk8Jvs86rcskaCwu0U/xyQIEdLP10K+s7+O1U1OtiriGPYOwkJV4umD1
         Mb7x+THn5Oii0hnM5abm2d0/GvvE7lHcsVIF85QaIvLR5z1ABEC+h9OBVMyEedrrgq+v
         2V1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788444690; x=1789049490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPIQ9McsdCmFW0ky9DkUl1cuYHBnvVUK/3wd/D/dbMo=;
        b=p936EZONRJ0LmOJYpFl0bqYuGrCiEVljZmKfLO3ffaQZg75RailSImZfNUEYycLv5D
         pTnJRcbxiOgTMds8rp0KkWJdUxkq7XxxZ24o98BVEAtGh2llU3d+wqIqBxAhx5zRE4Lb
         zBKupeflBnV/vXy3oJVL1NSXsfyIvA0iUlvBlGLinWmb06FnhuQmxaNAmmmPih6Tbsh/
         WMvctnKlC5riII00jZkigobekc7vkH4SD/U/sAbAcDjsGFqMgzxc+AP7UlMi1wm2GbN4
         W0STBULDE2BqpvdhZ+rPc6j6sr8XhmOcS0vi+j9KR7NTlZU6maLwdTu3Tmh3ZJghVWTB
         X45A==
X-Forwarded-Encrypted: i=1; AKwUvByGkYCe2agfzKfXOx9f3PcTLxo3SXS8Lv67EPwixTkoPg0xwti0l64B84i8UMYmBuD9sCxMT0FVB5NRJjY=@vger.kernel.org
X-Gm-Message-State: AFuF++k1zmHJBhPfXVplhtAGy8yJOBarrpTw8lPrmjANDsf+R946wXUs
	hLChLUV8ivp9zr9+e7ERbUYAmcvtwyXyTbcFOKcUDVugRrR7ZIMKHoMK
X-Gm-Gg: AYBFou3DdTkBU9bBdCh09KQ2i0ltndPp93Gr9/LhJf7S5UMiYdB+8knB6XE1sa2a6X7
	CFhmu7ZNtR+qYix090psBI0jKBoxJePCKbOolcsCO39BQV7k1/fXXTPJxyteR5tKufT13dUZLRx
	TWSeus+D5kJC+UC2lsZr10q7tkHUA0LfD01Ax1CCgFcprXW/pII3qLn2XL9F9rwxhlqVLC10I+F
	isAy8hSKO7/ub5GokDWpD/w1WfM5kYxyjGxeMKsDXpf/KMGBvdXCwDOdo5hExWbkQSXDU4nUeVI
	AqHl2GTDV+87w1tCharTMZIKsWZX9+DU75P/R8vNlTI3neF6nFdyuyHxtdjjtK3eUOl2T4ykZC9
	cdbRo65O1ycoPPUGzvu2wm396s1Ul1paCnmsKrCO1AU4HDqPaY/Kh4/wl4R7j03pKfKBDKOFq33
	6dOYyU6nI/7jtFl8p4XJVIM9aWB37wRnamQ47FXewBLhNP1q3gzSwaplxLf5mr75iV9AWkgZJeU
	aaPgA==
X-Received: by 2002:a05:6a21:339f:b0:3cc:c7cf:5a44 with SMTP id adf61e73a8af0-3da35d58a30mr280799637.2.1788444689934;
        Thu, 03 Sep 2026 07:11:29 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d240f21sm1049960a12.3.2026.09.03.07.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:11:29 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org
Cc: surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/4] mm: compaction: make proactive compaction mTHP-aware
Date: Thu,  3 Sep 2026 22:11:15 +0800
Message-Id: <20260903141115.4107677-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825043833.2659350-2-zhangbo56@xiaomi.com>
References: <20260825043833.2659350-2-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. Replying to the three points below.

1) Build breakage when CONFIG_TRANSPARENT_HUGEPAGE is disabled

Sashiko says

"Does this break the build when CONFIG_TRANSPARENT_HUGEPAGE is disabled?
In include/linux/huge_mm.h, the declaration of huge_anon_orders_always is
guarded by #ifdef CONFIG_TRANSPARENT_HUGEPAGE, but here it is referenced
unconditionally."

You're right (the kernel test robot reported the same on m68k). In v2 I'll
guard the access with #ifdef CONFIG_TRANSPARENT_HUGEPAGE and fall back to
COMPACTION_HPAGE_ORDER.

2) __ffs() singles out the lowest enabled mTHP order

Sashiko says

"If an administrator enables both order-2 and order-9 THPs, it seems this
will return order-2, and __compact_finished() will halt compaction early
once enough order-2 blocks are formed, potentially starving the system of
order-9 THPs."

Yes, this is a deliberate simplification, also raised as an open question
in the cover letter. I don't have a firm answer on the best policy for
multiple enabled orders yet and would welcome opinions.

3) Racing with concurrent sysfs updates

Sashiko says

"kcompactd() caches the target order ... However, __compact_finished()
dynamically re-reads it here. If the target order changes mid-compaction
... Could this mismatch falsely indicate a lack of progress and erroneously
defer proactive compaction?"

Good catch. The clean fix would be to read the order once and plumb it
through the compaction path. But during proactive compaction target_order
is -1, and I couldn't find a clean way to pass the mTHP order down - which
is why the code reads huge_anon_orders_always directly. This is the open
question I raised in the cover letter; suggestions welcome.

Bo
