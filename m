Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B731D432D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790541031; cv=none; b=oCzhVH1DEBMaDn/t+pQcyEMent/xO1sya2Ovmj0cwARdeJWBimGGgn62FwGrOOuwfPN4X8EIEJMDhIxIkE0xO0N23AY5NeBqBU3Sau4f5Q4dtSDOc8EBCa0uyIo71baxqePFyU044AXCYcTMQGuP/rqFVO9OP+OPV7EG1VIyyQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790541031; c=relaxed/simple;
	bh=o6cflNN+5uNq6lgPY1cP17X/raP7e0k7d2gKzGJf18I=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DeFC6bS93UQyGLKOVs/IKtpRpIaT4x8ney02VZmXG0vOdVVjAj1RL2f3YccM+i8E9wEP2c6bMQCFkPebRyFl66y5GoUnT1JLsvanEPFI1TZLED8ZFnbJvmi7YyZ6xomR/ckHZQETZBozC98NZge+OBsljud0K4tc23NS4E5sRHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9ucReUc; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9ucReUc"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d942de6574so8593895ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790541029; x=1791145829; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o6cflNN+5uNq6lgPY1cP17X/raP7e0k7d2gKzGJf18I=;
        b=b9ucReUcDIya6bQw6V4oVEg6bRPhSeLInafTUD7xwvhYYNxmzhKY/nzih7TQDWiBPZ
         kODrJyOqsTFD7iPi/YfhUX1Yky1T5x/Sy/b8d6af8m63SRL3m5zEv+h88vVrUh86tUXS
         vevQ+RpBJyG10dHKoHBdHnOhGeXXMDAjfx5qR/vCL5WednhhiFlIZ2IjgHPSgScTAn1+
         /vqU5X+NBppFws+YNHotHhchtCqIzM6IFwsA8o6a5LE2YVdhCXCKo55lwjAYBiXimBbC
         iEZLZ7GHg37INfdr2qAnh80eKDGItcLSjL4C/1iuRaTEK+KR4InI/MRY0sm5xRLDDgze
         I+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790541029; x=1791145829;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6cflNN+5uNq6lgPY1cP17X/raP7e0k7d2gKzGJf18I=;
        b=vYFhZB5L9uHX9iujBWIxm72GcVxEcROI5J8XfZR4JU0vkUn44lSQnBJP0lcZ5eQ8Aw
         C57+JkQz7HtusrwlyxRkO8jQQPSTMikDSxg51CTGrPNwDHBC1pRi3HX4RUC/JhZPUrCJ
         XmBnO38T5WLEbuHOiT3x3XBwiDBeciNjYPHgdRstCoLV99zkMEW5RUxn7/K0mQenP7t+
         2J61LbSLfpXzuvRv2rjomUG+xo/xMzXDwCprkJv43AtcYQPFSoR9kaLcVcNQ03MdwZKJ
         /+OFv2ro+yHBcpydbd7JVX9iMJkJ/NX+PeClHAs4SN/6xCfdgLhyO9JREDJh6dadjdC+
         y/NA==
X-Forwarded-Encrypted: i=1; AKwUvBzau/SyHHQCpu3f2G9ulDgHQTn7UNEccWTIXNRS06SZBID+vdUts9edcQde1MLsH7E5um5ZntPA46wVqFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLM0w8khdmly44MIEzOTFk2fxFdrtRfehjDgQwj7wel5Mi/aQto
	2nDaH/nUpUeEKsIwJVL0z0pRAps7faX9hx1A9wqFH04hxzxBWjIGrtus
X-Gm-Gg: AYBFou1TqH8mTIMjvCsFzGAupj767Dco4xEG516aaqwuUtGGOWD8ABBqFSnZOR2V+LX
	67ld6lcLjr9g5N858KP1VhST6h1mtHyd5H14wKk3RgXqpf93RAaE+cN9OUuEQkc36RJc4SDez6Q
	8Yu7FG3HQ+wWXKy8Fib7XmJJkYh2Y1IlOUZEtWHP0VN8mS/HrHh04zcg3sAfAAr3UGUU4D8+UEw
	PuGbMhA36Pc12YvFeHSswv6VQJcUTpFdZqpYkkvJgdgIKLxTIw5l8MqIbEi12qko6WJeurP5/1l
	q7pLMlqqrsLJ+pSPieWBYu3Y3WwI3DTjFPmMO1CmmdWJaazEcgFbkMTWzVN6WcPDXREAKu8js1S
	qeU/0Pc5Keh3AiKnnVlTEVqQrq/7CrBLLGxbD79Rc4l8WDnl5R5mXz9wgILYB+6lPK9b1ruX6S1
	YVKcbiLhf4G8l5rwMcZJNURgzI3lay5n0KycdfehM3uEktFg==
X-Received: by 2002:a17:90b:384b:b0:3a0:c360:a562 with SMTP id 98e67ed59e1d1-3a0c360bd58mr5153407a91.14.1790541029308;
        Sun, 27 Sep 2026 13:30:29 -0700 (PDT)
Received: from [127.0.1.1] ([2401:1fe0:5::3b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b898cabesm16824473a91.0.2026.09.27.13.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:30:28 -0700 (PDT)
Message-ID: <6ab97ce4.a24da115.4bfe6.0f74@mx.google.com>
Date: Sun, 27 Sep 2026 13:30:28 -0700 (PDT)
From: Zhenyan Wang <maximwang110@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Christian Brauner <brauner@kernel.org>, ntfs3@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhenyan Wang <maximwang110@gmail.com>
Subject: Re: [PATCH 0/2] fs/ntfs3: fixes for directory permission and symlink
 consistency
In-Reply-To: <20260927180359.3867508-1-maximwang110@gmail.com>
References: <20260927180359.3867508-1-maximwang110@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

After analysis, I found that Patch 2 introduces a regression. The
readlink function treats backslashes in symlinks as literal characters
but they're path separators on Windows so symlinks created under
Windows cannot be traversed.

There is a partial way to fix. Since symlinks created under Windows
wouldn't contain '/', in the readlink function, we may only convert
symlinks without '/' to cover all Windows-created symlinks while
keeping some of Linux-created symlinks shaped like 'a\b/c' unchanged.
But the 'a\b' problem is back again - it isn't fixed because we cannot
distinguish it from Windows-created ones.

So I'm dropping Patch 2/2. Patch 1/2 is unaffected.
