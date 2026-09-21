Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0E63BBFDA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790021255; cv=none; b=arAsNVXRIyLzl/ViZk3RVRTpcwUAlGbAC7pp4x9sh9nebXuTEu0/LYem5m+6WKDUc5Zm4rWphaZYElXbqqloblc9umStZL/RTwX/WLMk0b6PgTEqN4+s4TEI52D5VU8cJnLjpaxyE8O4G/6f+bAYE6w/OVorJaDXpndDCPPqiOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790021255; c=relaxed/simple;
	bh=GebsKRDHt3UQhaWaTAl53f/Sh/f8qeGCKjN+sx5S42A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D/nAY7yf/GhWyVBosAJDZ89N64lXkbHfzg9QtZKBIUr+FBXuEywlTq+YfH8ZZKoQPgJxavnA7pl5C09ucYnbJVne3whTMZr4w2LcSou9Xjgcx6TGM7+01ThGWZ9ZV5x9mT+MOOPOnKqUVom/MDDwjc/Xunqcdl3GbNP6BLyuPqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=B00vAzGp; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="B00vAzGp"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so2965835a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790021253; x=1790626053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6cpRmN69U5lCxBcGPQGzsX/kkdZBkTNEMnGFB5cbb5o=;
        b=B00vAzGp78XYuGLYqOz2Vq9anLXJzpwREE9AXmGxLez3d+Y0XAqGcXuD9ExyPHmAUB
         TuZEk3CFW6CkHeK27es8PcyRDIIuyKnLBX1A8mhmTpE1Td2cd5M6QgNCZjUvpyjHL2sv
         YRlH3zTW/nXq2VCVnbWpoE0mzvLdyfIb2SN7SEj6hTtv3XIw5olN7CjhqiucHAbEdjAx
         rbVTUg25voKXZbIaCM0h19MFRc/j+uuubdHU3j+Z0VShiHneaN5N90PfI86ZyDAgXtjf
         HXzB1IG+kKXNbXevS0vCvJCxbG6A1nHZa1CDsLkgZpp69q8ALpelkr/+QZ0wDM/6StRE
         nuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790021253; x=1790626053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cpRmN69U5lCxBcGPQGzsX/kkdZBkTNEMnGFB5cbb5o=;
        b=rywB15wvmtx4sM8141KOSiCINm8/lXnUsxr+ZtsrB9VcOPB8EJy15pwTaIErc93Etb
         52Orz67Up7tHTKmtF2tUdQbxd8nKFJjSGOV4D3Kz3WDg0+kbNjouw6D++BGzPJ+FKo13
         9jfJEg7JGhVHDmb+fTcWcnDw2FhLi5RgWw3h1QpSsGKsTTkhdvkULALnLqij0pvkR/sx
         t6j2jcsGeaBtqLLP53uf4aguPQKyglHIG7wP8hOO+Tkzfug7fYBvT++oaFlF0T+1ACBS
         KvJ7ISywn4TxpeISWnWaTyeDpWnTNRWcthkmQ+boj7NZ7U+1K9NQuf1jnr7RtDzXu1Ao
         2XTA==
X-Forwarded-Encrypted: i=1; AKwUvBxNpRc6uLetlc6H0G9ypFR+u6q0Bz8jxiFaSEdwDvKAlPlQeEQlpZIFsAXRUHcb0FG5eK+XeOK03U8NHwQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nrl5G2BTB7lQb5C9yrm09Rhz3saFgp9X/agk4f9O3hZxb0fPOQ
	8KZU6xNihy+vStV+2IfA56bxhdp/0d4HV7YoAi12mus63UGdJA/HencFRjGhpGvgePE=
X-Gm-Gg: AYBFou2HHOD8B7Nq4CWb9eF8bQLckaVsGsLjg/L7RdvByfv7C9vicSfdVRskRneuTHm
	kmxmbuuUvsVYmmzHenPuNwozsBJwIsRAQgLadAP0X1/IUXXzPnugDTyOF5J0bzaIPRSwZ9bWbBX
	WeGVBcMT3S15hCrWmG8+danUIIicVIqKMvU/9t2xf09MLCH2jIGQKK921K4bPaNgplT0pQzL0nK
	yZIbP/axV4gg1XvjWs5Ek4EqSc4dIJ0OrJNj+Ia7+mmmzkms8ckHzzHVY8YcbqnLWTGTHJpJgkC
	pIbu1KgI/V3Z8lQsi4ArnRUstHAK28Nj84GqkseumQ+lVzHjyZK524ESGLqIoG+zeZ8fWcRVh1N
	G8YeseiAJWTF338L2EjfYmkjHpnB+O5zXRp4BzuriEZWJ+YeERxDrGshBMkT//GpyFyY6UVvhvN
	aWL6CLVIF5fM8uKZJrlYL5kNFyMwW6Hw1bP9mJ6DiKp3Css+A7WQQNlccFxChsER+Nx2zZuSo7v
	qceE443j4KkYZUcoyhJCEE3Q4RnHvBEQgwi4rDWqAAJTcckUVT8fSM3Ml0LV/FXyyM5k0w=
X-Received: by 2002:a17:90b:1c83:b0:39e:6c69:34dd with SMTP id 98e67ed59e1d1-3a06b0caf64mr39927a91.65.1790021252643;
        Mon, 21 Sep 2026 13:07:32 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:289a:f600:f11e:a45c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ebcdbe8sm501164eec.15.2026.09.21.13.07.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 13:07:32 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengming Zhou <zhouchengming@bytedance.com>,
	Ming Lei <ming.lei@redhat.com>,
	Yi Zhang <yi.zhang@redhat.com>,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 6.1.y 0/2] blk-mq: backport CVE-2023-54227 to 6.1.y
Date: Mon, 21 Sep 2026 16:07:24 -0400
Message-ID: <20260921200728.84114-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, Sasha, and block maintainers,

I am continuing with the smaller CVE backports still missing from
6.1.y. This series handles CVE-2023-54227. The first patch frees excess tag
sets after a queue-count reduction. Its immediate upstream follow-up moves
that free past hctx resizing so the repair itself cannot race into a UAF;
they need to travel together.

Both changes are already inherited by v6.6 and every later mainline
release.

Could you please queue the pair for 6.1.y?

Thanks,
Artem Dinaburg

AI assistance: An LLM helped find the missing CVE fix, adapt
it, and prepare the draft; I reviewed the code and build output.

Chengming Zhou (2):
  blk-mq: fix tags leak when shrink nr_hw_queues
  blk-mq: fix tags UAF when shrinking q->nr_hw_queues

 block/blk-mq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.39.5

