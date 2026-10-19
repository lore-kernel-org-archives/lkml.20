Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434598;
	b=ZybM161c+fgH2aZ0un307dVFgyOY480EEBkXFZlkxJwFQiU3RYtWyfI3bxohvLtU9KPL
	 GFuC25iYO98oi/tQcBPb5vClf72jyRFcfAc9LkQqQQYj6qblo2dCjbbjgKnry0EbEcf19
	 15Cp2XHvr+Vkw4hXCekz/+8eCE3fAMKCHiM6IEBp7IE87Z7zBNUle9eyD/p3woGrTGROn
	 kYl+eHI4OmSwjAJhw0TKhIHZSL78t8U2QeaCM06AAKYxz2VibXstInYurlXI4hok0oUOD
	 3H8XeZuO9wEjJetL2RuMfP+hNmdIXMcqk7oBmdy6uOGHjyYWUl/CsXUWpEg0wPGmIEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ryMN7FspYYeuz9q2JwGP8JZkmnnmqzmHQjeHzQubOBI=;
	b=ovSAn4ycGpY2Nu4VdLjS5/m5jkSvY23ZayRv7vcMN8Guk9fNxcwoXu/cg+VLevllEl0f
	 1YLgzOsFkH0s8k7rMl2s4BLl/WFYwMT8jb998o1rT99va20tyJaC1dDgE7EWVT4Xp4FKc
	 nzEey+6HZkgUBAujzn8Bvoh9QVfOhX3gcfQbGgA9nLTxeKDawXhYgIWTuAvCCoFIszC9F
	 Kf5ta4JcHvtFd67DrlX9J0k+vtHGbwY8AgvPDPJv+QCKV+qu9VykkK4/XB/BeDpJnsOxp
	 zPgl1oiOkxdNjzb8PLW5JrcbiN4ethqSyxaCQvr+Nt4w8A30fW4VmSWf1kgB0PR0wWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q5Q35urr;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B640C606A328
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B640C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q5Q35urr
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso5962331eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434597; x=1793039397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ryMN7FspYYeuz9q2JwGP8JZkmnnmqzmHQjeHzQubOBI=;
        b=q5Q35urr6rCgOeG2epMNHEQvKgYthXGp521NM1MXNt3XXReE+JJIpWG0cIjS0uIcEk
         Aq6NeSKfc/eLfgYuZc1PH9xDTri5E6b6z4z2Ef/aFMR0HJ469oxDV0xel+ROneGh/imO
         6nZv3ssnkA3ShD3k5y5l347ksRb/w06LH+dKrw1oVNwg1Mljso23Twjqi+7Mm9plkwJl
         ILFMGOxy5EGKoRy31OldeknkpaII5Q//pW0gztLmwHxWUD5a0C46Zs/v/orLZoxieO3E
         RSkT+lAhSY1Q85LhyCiV80UJ+k3mQlfOEmREQiK3wtdI2H3TvnWhIjo3ahfY0kSRh+ID
         mGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434597; x=1793039397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ryMN7FspYYeuz9q2JwGP8JZkmnnmqzmHQjeHzQubOBI=;
        b=WEuFolrFupdQeZSUXU7KhXPWudX1iIM7SZRpz1CairM6ASIF5yN0QXzdZ4CCdkYN59
         Zw3xJs79zDU3I1JBPRZH6UtViYeYEnGkZlAXi7w7x4vRxAmStj1j53kdqdkc+LxAiXOs
         D6ub27Illja0+uyG2xILg9xLDgIWa3ZDgVf9n7nmO3SWzJkaYXRuCE2BMl+2qUXCeY7S
         2cnePnp/8R3YLJ5bW0L+qdxwrOzYDg3YPK2DpR5hE8t9Fzgpd3YlPgYjcHKOVUDJ6zDy
         n2dK3eL0wdQd+6Fj4hGvXK4SLd5XC/g4GUqfy6voVZ10mQsQ17BErXhGRKk2vTUFxLVw
         6d1w==
X-Forwarded-Encrypted: i=1; AKwUvBwURHn0SXp9jnpVZYZY5qKBDl3YBNk/wFKgumAeqv6aOKFp7802Mq1nYbtjeqzctODYV8tTRmXruMR97k4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/5bkp4baUJWpTbZcCXQDSlNhfRvdocHOSh21x4ghtlIwUfFex
	WKq7RmbwKQMVujLUmxoMj/506nz3F33wpiXpkH14T/TWX98s5bV7YQbv
X-Gm-Gg: AYBFou3bMclKnXiwWly3XC6wtSlNqmoACv69dH0Up6iezdkVlzHKJmbofQ5GAPVLMHo
	C8uRrSxZme07b5iYPHJ7lzt1bfDGgAefS/ZA4XQ3uwDok3HjIVuGl+LrHxjHgzZRLUx0JL0HDBj
	NT2vbbVahWuI/8HHOuSpyw+B172mEa5Z+F1DVnXfMZ17uLeYfeZv5wKbFEhqdz05OuzTcVxR3EM
	14VsYUS82Km9J6Zs7wvBnWed0Ls2NXfNhPIEHoBrOUsj3xxP130dqMWmQKn1oDqiuPBI1/sy9Nz
	+pl3aulwSjrFLxPVu975L2xXqdubCjoa40voN85hj57GEGaYKx+sGWgRfN/I7lnzeE4WMMm6xvN
	6rr8ELOf6s4ZpozHSljeDYrOMR8mTYgMRTUhi0sQVvE8CUSmT+z7UqJaiDIsdxwPSkpkPe2bTZF
	KL80Ei7u6+kKwLvaMUyWoZfn/WN+u0swcCCJOtk8L3n5+7tFiUDxof1Tnlyon0IqNE8DoE9a7nZ
	pA99kXWHGR/NP661k/tUpEMw8t2NJbSL8c=
X-Received: by 2002:a05:7301:7305:b0:34e:9923:e372 with SMTP id 5a478bee46e88-361a2b35aefmr11654736eec.29.1792434596820;
        Mon, 19 Oct 2026 11:29:56 -0700 (PDT)
Received: from pranith.org (c-67-164-4-239.hsd1.ca.comcast.net. [67.164.4.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm35009576eec.5.2026.10.19.11.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:29:54 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: target-maintainer@vger.kernel.org
Cc: Pranith Kumar <bobby.prani@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] eventpoll: separate nested-check objects by cache line
Date: Mon, 19 Oct 2026 11:29:33 -0700
Message-ID: <f1968f55f65acf6e2f4edccb280e9d8c4dabe3d4.1792433364.git.bobby.prani@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792432666.git.bobby.prani@gmail.com>
References: <cover.1792432666.git.bobby.prani@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generation stamp, topology rwsem, and global mutex occupy one
64-byte line in the ARM64 build. Readers of the stamp can therefore
share a line with frequent rwsem updates from independent workers.

Align the stamp and rwsem independently on SMP builds. This leaves
the mutex on a separate line as well. The rwsem reader count remains
a shared object; this change only removes mixed-object sharing.

On the local four-core workload, nested throughput rose
from 5,325,959 to 5,487,081 pairs/s (+3.03%) over the parallel-add
change.

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 fs/eventpoll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index 5f7cd03107b3..ffe2c12858ab 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -422,7 +422,7 @@ static long max_user_watches __read_mostly;
 static DEFINE_MUTEX(epnested_mutex);
 /* Hash collisions only reduce concurrency. */
 #define EP_FILE_LOCK_BITS 8
-static DECLARE_RWSEM(epnested_rwsem);
+static __cacheline_aligned_in_smp DECLARE_RWSEM(epnested_rwsem);
 static struct mutex ep_file_mutexes[1 << EP_FILE_LOCK_BITS];
 
 static struct mutex *ep_file_mutex(struct file *file)
@@ -430,7 +430,7 @@ static struct mutex *ep_file_mutex(struct file *file)
 	return &ep_file_mutexes[hash_ptr(file, EP_FILE_LOCK_BITS)];
 }
 
-static u64 loop_check_gen = 0;
+static u64 loop_check_gen __cacheline_aligned_in_smp;
 
 #define PATH_ARR_SIZE 5
 
-- 
2.47.3

