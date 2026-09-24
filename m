Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE4D3DF01A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790224309; cv=none; b=OJdWgO3/sZU3oNg1r/caG95V0F7tpgU5OH6E1NTAFSAp+KFOWXsuDNusP+OMcRQcGonLU3tPmCBRW9zjMhDxD8TfyoippXJcYKBqQ7ziK6ECOQYzlEOfwLMqLqDqCPC8nRJtcZfq2q05Ct9dq2XBpJH/b21/dj9NfLKHUbDZFeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790224309; c=relaxed/simple;
	bh=3JAG6Ij9c36PXq4bgsIh1K7CQfbf0z/ay7gB5qrwte4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FPKqAx0FQiS5MjNIIWakL5BfOL0GjRPS5kDlGFvQ9Lx/OltD/7JMphHz/Kk+Mmaqvu3ISPJHR0/31+S4dgHcBMM9bXU8Older6e/A8BB9+zohSYPVSAxLEZtV5aOw0WnaxZxk9qNhPKXdkcyX9KsIVQ3RbopunpiXGbGXPZBwq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHUYopcu; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHUYopcu"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so924830a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224307; x=1790829107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JAG6Ij9c36PXq4bgsIh1K7CQfbf0z/ay7gB5qrwte4=;
        b=aHUYopcukK3QY4q9TRA4dBKUeVXo15mME3s8O6Jun4Te0EHY27RXhkTEo0WsZUOw8P
         /EGm/Xy9ax2khwUrG4QqCuZEQ7XW7oLS+lkBeoYoPD3TV4v8s0rT2wLtOZnw4FTwdNC1
         Xq0q7Go72/wkeVn4fZQHGI9tdZRKI/LEvjRv39vWGdjjpweE8WalOmAD2Rzgn61QK317
         7TELFXAptkDTCjcsxDEcCJHmf2GR6YBwSa+B7eGWKK4oFhRBOHsE51UBNHPiI6n1Yb6v
         NNayT5YvpaVFLAaSBO9LUkG3B8nPcKs/mIfASz7LNMjYIyrNG2ZF4/HN79lxEs87lx2L
         e9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224307; x=1790829107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3JAG6Ij9c36PXq4bgsIh1K7CQfbf0z/ay7gB5qrwte4=;
        b=Su+uNMGnl6lNsYy0j5IYqNKmYFf2/CEGn+SzDwePX/EnXxmrq2oFyc1d2zsOxVtkhr
         ekfB+FFyIZVW5YmEaYSm1Y+5Vvx78NvE6LVgGwTO/0x3x5HCpmGlSyLBaEfvb/2E9Emi
         BdnXzMgbNpKbrolgdW/V8yHdBcBnASIlUGwjXejnkXCe81dZG31WHaqPVviHDuxyUnKm
         9BJIycIMCNaG9T8JqdDWzLqWeMts5i4G3yMWUjfKjSNvjOwXPAOCDAKqzdLdIGLxSOpx
         7Sv0OtgkbooowFMK/6csjFsSMlA/KsfR+CIFStpkaOlLCWkIQNyg9Ucw5QoKnnnM492k
         zKMg==
X-Forwarded-Encrypted: i=1; AKwUvBxm9Lc7hLpdqey3uoePFApCJeNS5Dzi96ts8XVKNRk2oHFhFRFCwFe0ikidBzMylx/zP+7wyagL3Xfbwlk=@vger.kernel.org
X-Gm-Message-State: AFuF++kP0Ljn+KGJxoxDpFjHlCwZBdRvtquQafa690JaEnMCqfz7CDKO
	Y6csAZY/UxCtj+DbEaCLrdx/yBY75i+rJv9dR9NXxkTmkD1wZgO0IHTC
X-Gm-Gg: AYBFou0bLy+eGo6N1qr4zT9zX986qpMj3Qe3vPrH5UUshX+vSV5T6p3KzykSYn/NaIZ
	QRpU4RjoGYMpTmCXGxj1VP0oKowM34LWzxnIUHeu3aojxkj33H1cKmQvXvXfiv5YCQrrC+lQ2Fx
	9jgzYXzbJSsSg8XNJ4D8xYWaZCbvcngLXgfNUjNrVmCITzG5Gi7sshj5KeaJV+1FJKrSKHb39S9
	9G6xlC/5zTDzbmYbwaDM6hN04EBsshYpoLM1yGSDB7SS9LDiy9Q+7XjmGR0UDVzrg0GqvNwpiVp
	PKLtc+lJqFgul3KWSie9bNRnhc/makfO0NUSJ/sHLifk61iO38LsbMpZzQ/QvYbNz9L71TA/IBl
	iBFwZK3b7zr7sAFlhlWsB9/NtOsAwnrigtRzKxt2Fr/NK2y8W296UVKl9o2OGpJGYKwOWqzTRAM
	q9zi37ISYORK9roVjS1jBOAEw0geMmGEfEmWtaI3Fh3Q3+BVdC763+pmBtemh/4TJpdG960ikfw
	l5UV/cnGpu4n6fJfAkKpXfu8LA9hYLpovT0V8PXkyl2vUZpTRG8vTqTAHDDv5Tkc20taOd24IG4
	MKekQ1MIbgx83FMlnkimKW0CcPmzPxV9icqt6rrh2Ywj3u4iaIT2mEYnc5kl
X-Received: by 2002:a17:90b:224b:b0:39e:6a81:f34f with SMTP id 98e67ed59e1d1-3a098bb63femr995846a91.41.1790224307113;
        Wed, 23 Sep 2026 21:31:47 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663fd0sm2333830a91.9.2026.09.23.21.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:31:46 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Hui Peng <benquike@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 3/6] qnx6: avoid double brelse() on error path in qnx6_fill_super()
Date: Thu, 24 Sep 2026 12:31:44 +0800
Message-ID: <20260924043144.3895742-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921042511.1473629-3-benquike@gmail.com>
References: <20260919222556.3792829-1-benquike@gmail.com> <f68323da-e90f-46a4-b3ce-70d26de115e6@kernel.org> <20260921042511.1473629-1-benquike@gmail.com> <20260921042511.1473629-3-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested as described in my reply to 1/6.

Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>
