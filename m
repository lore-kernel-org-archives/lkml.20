Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2637348DB50
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395286; cv=none; b=OZKTMZvn4HA98CJV0D7G4xfAPwIQ3Tb938ap7zAK75pRuKg13GVNqf/+exj3kc5uOsUf5A4mOh1IUXV5H5zRcJzM163b798JkOacZrXTfxqhobMBhBCcQwri0cFfQgMm+HKL/pqGDNkIw0vDv5xVKXlZwptAhsT6wNhzuIG1X7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395286; c=relaxed/simple;
	bh=7gaVL9tBLX4l9fAN3Lr+WQ0o9ncAIpOMIR67agIWONU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/9uljFJ3am2kGrHTpPOfTZtSy1CTWZzUoua1jtJvgPAJ4lSWWU2vNloFnJfTXfvG/GwTvIskahL2UUaa+nh5VFGzRjRy6VGk69tt6OuO6KHjLRLwSBSbEUKoFZ2ZSe06PoGsasOV5OfIeAy74QBQdTWbzynwDzwKcg/AlaDXbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kvvm3jOV; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kvvm3jOV"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06b44bd01so290072b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792395284; x=1793000084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gaVL9tBLX4l9fAN3Lr+WQ0o9ncAIpOMIR67agIWONU=;
        b=Kvvm3jOVh0QuSWD/0E5P9KXkp2wKcEPsxhPFdNv6Wazd75WFLvTJIVVRlqjlFzwSnC
         v6qZDkc4HSxa0H6/hPzaGq6Hi5EcAuNp9EQK5P+E04S6jsa783/UsoMmiwtR8beoN33W
         6TODThq5t4YDYwCmcrDGtfA1mw4HHzYqzOsQ7B6mYBm74QwLjIShEuvKaPzznQWpQ54O
         rJ5CRl1dUJN9r38w8EKypvnHgmZ6LZKjSXtAyrMpUVAAzJsB0cXFE1sDngegZ5HQlut1
         nIYle/06Q4tpIVG11CGpX8bMdOWV7gwjyIGSkTYeab+9UBb4kU39re3CF4dHzFxbECnz
         kCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395284; x=1793000084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7gaVL9tBLX4l9fAN3Lr+WQ0o9ncAIpOMIR67agIWONU=;
        b=DE/rYKW345L3rZh/AURLUWewvgEbuoZrmXgvfMYMc3Lr1Vu/L9WdaFHAXPp7TJG6lS
         wvIaXwag/peKy2ykJ4lIoUAyEjVuBtysa2RH2WFhVKJ2GEE9/xdK6+MZ0DASB7oL0In8
         mWUtlgHgWoL3K8/OG+UmB+X/gf2gMy9MJMnawftjPPd7GuepvE+E4YfJxccwhh44PmZX
         FOLQ8gcMutnwOS7FCfkbIP4tKpM6lzmwo4oMj+vimZVoc0xXKu/jyTzvFg7oRY84u+oe
         8jwBD9E31VOZZlrJhyM72ezEAt1UGVTEeoKtydSOBcOWUkzAyNdWjX4UIUSV+R2yts+A
         8Uqg==
X-Forwarded-Encrypted: i=1; AKwUvBxAmiwmlUz9GlUBtHBLZrSCqrw+QLvxhkk+DpYjVmk1H0wASCQT5QPi7fAHXNToq6WXwC/JPnKY5obN2q4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdJDxedM7Wi/VmmAZQCw7mWDcUW+luvA9oLmUiNCEQkAl+Stmn
	I+CB96f0Lb4KyBHCWjhulEcBf6d/s50ruU4h5+1rgOmnvpIPT80I4mH+
X-Gm-Gg: AYBFou04aDqDcWTBpeKHK/Sf33PA4EIrifSboxczZ8tvOQ5DU9IT8FvE93R+R2d658v
	BPwT5bnaljnlYLtBJNyPXF42xLbkHRoN6dOeewupMgJzZDkKL5tZbGMdFRBYAmGrz9KaUHteFa+
	1WZSYy9RI857bDvCemheqOQuxe5rhcWwWS3H/Q+l502aDNnFqMOE/aZHLF7Mk/w8NaDSFvFi9EM
	C+Cf3bBE3B+diN6gbwK2+llweONYvr02CVlp+xzd8saH4t/LX0qWErerlqe4J2sJNZyKVz6fwAA
	dNUB5UIB1rOCR+SIz8dcqY1bJu8EWrMkB6hb7DtcKRCzDtQQZn3fv2xsj107iOo32OQpcKsGB2K
	SmvImWe7bsfyVSFOXta2KS9p54Z01IZCIsY9zoL1YHcG4HF1mufkKwT7ORQzZ95PCfnaiED7OZJ
	jb0b5NFZbL5x9CRoTjSrpW2O45wo0bVztYqUWbkXweSfa0wF+JA60fy9YW3E+nt6dMAk4DCUVzX
	bAnBX4MS+TIhGjeuagKrw==
X-Received: by 2002:a05:6a00:4c93:b0:888:2b10:e26b with SMTP id d2e1a72fcca58-8a04be69ee1mr5551236b3a.18.1792395284387;
        Mon, 19 Oct 2026 00:34:44 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5820b344sm3526404b3a.53.2026.10.19.00.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:34:43 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Naman Jain <namjain@linux.microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Saurabh Sengar <ssengar@linux.microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mshv_vtl: reject poll files with multiple waitqueues
Date: Mon, 19 Oct 2026 16:34:32 +0900
Message-ID: <20261019073432.3912222-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019070438.3732624-1-4ncienth@gmail.com>
References: <20261019070438.3732624-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Naman,

I sent the standalone v2 before noticing your follow-up on the POLLFREE
patch asking that the two fixes be combined.

Please disregard this standalone v2. I will rebase both fixes onto the
latest tip and send them as a two-patch series, with the common waitqueue
removal helper shared as requested.

Sorry for the confusion.

Regards,
Daehyeon
