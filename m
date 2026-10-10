Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C7C4BB5CC
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791660435; cv=none; b=Bn86kO0v+QKk/aQqUlvYeuHa3NFhCIlzsWjthsZqDt8GpYRakpsNws5QPP3sWAa/bw+A97Zk7+1Ca1FMLY19MyM+2ayTjGt4BSWjitIyxi/7JDPG/s3tH0DUj8lsbQkC5xlWfEldPDS40PD9t4IwACoY71T0z/2G2jkudwRgqjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791660435; c=relaxed/simple;
	bh=ec8nIuloHgqueuWiPectNTRxxXUD0xgmT3NqvP+fKfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IRqmmIo3AN+0fX+80cR8MJRNJKDI9VUFpVrZWGSTulRz8+GRXm0h61mVzUwNFu2TQhM+M5W9rH3hCokPbBWoKl4QaeEruhoCiVH+fM5O4DFmH0lv0YfJzvcwslQaHnZ3JeFV32OlPqFlae8PHwrbH8eqczhx+xqYkFS2Ll1AoYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=Y4ySRClv; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="Y4ySRClv"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3515f9a5d25so2018618eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791660428; x=1792265228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bfk5yrsogadbKnMj1jh+Cdq2RJyiLqyab9B5qMCFxFw=;
        b=Y4ySRClvRZCEAae9QBepinQAifx0yP50BtxtzBLVBvv2I6OIVHtht6exZ6QjU9XwOl
         7q/CxcIep1e9W1wCts40cUlV5Arkba83GQkDF2NUnTlPufmyCvcgt2aR2DxXFelcLwk4
         C2fNAgPhNgjpdTYJYG/Nu2Dvqco0HF6RjQkPns3EP73ehuoVxKsn48BqTXV08RDgFYD4
         UAzuvG8D6BFSrS8NDHx6Y9XQXYdem/KYiyJjaj+Q0Ynros2ob5dRkM+hG5moYDrr/z6w
         W/aFZEH3cQ0uuc++i0MsqczDi9aLO+/PB0qnZrM/MFGhOROa8E8wVsVjij2b+1acIEsE
         dtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791660428; x=1792265228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfk5yrsogadbKnMj1jh+Cdq2RJyiLqyab9B5qMCFxFw=;
        b=sLo2NAEc4+x9O0lJx/tLP42JJMIHXUGgJdK2wXKUvCuoMVMWgRkBZbBkMogh63az+7
         S5ruPpM8OFSvFbbiIyqXLLqe5X6kwAyFeYE0nX5kDEJHQKGo/iWM5IswJ7W+0ASe6u+f
         VYkJ3d2W/v3ZlyEp0XrKDyiYX3WFM8ucbKAH2/nW+ZCcV7tqQRQB/9C/a3pqasnTnEiV
         5uwJQZDuV4ZOowZj72XNUayKosSxKzmV1a3uu36xCl22AHseoeeQmpVnKnvHZ5gengvA
         EZDGdgjHLOzjt8gQO55zhBpXFhgsk3zHVcvBS5Kio+c8y56IvGQU54tu+pBiWTjuKx9b
         pqpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxusBLjsuLg0VJ4K2OqZKzzRcNUGWbp9GjzJ//XpNRdWSoxyrqPy8VAN/A2HIIlxM52j9y19VWvQ935Jcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8xiLxUcm4mT9NcqC+9xCWTvwQ8hd7FhjGO/5Hk15uBAcS1vMj
	mexWZCeNiw/63ogpRaMlni+9yy3I2GEfbumMvTl9iBYQJVvXuVPHKDyoR7DWzerkgH0=
X-Gm-Gg: AYBFou0SCWpDJQkkX0S09OBRx0wzs+YcaTEDM1Z5cuG1qCGxfX5llTRutoBKeR/Q33R
	zrDRWTO3h8ZgcRd1aqJgoLWCFZW94TMB63OzLh4mddA74jdStGAbVq8JohzHE5RzSz9GSr09HsS
	IVry/xoXRL7UWc7KT+9dACbPlaLajplSL1eJpDJnMdd5icXVSz6sGhFNLuTMYZ2ht8uUhFCCwVz
	6UVm7a4xoaz4gnQa3vmnxJj06YhU9TC7Evan4AURCC1GHVAX9y+vbwjVrfNwvEIG+MWInUaAvfH
	M2fpzA5y6mK+iJs+oSLLxIW8FO7PYlbUjKTNB4okjSN/uQKhDHRmBf98U+ER7rnxcv3LujTtKwv
	FggoRPlljf7qTQxfkoJ7vN1fCjWiRncWwTvT2QG8gPzep0k6Zfr5N9rvjQgHIXvtNcmM48Dqp0s
	8tFdQydU8+sLa2F4YucFqGRvSBJZ7rfKopwO8bAL0NCAs77tAOxwGjpgBgv5FIYR+o2j5SHqWtN
	2XDdHhdjmpOgpJbgUjWbw==
X-Received: by 2002:a05:7300:a92:b0:351:4d5d:39b7 with SMTP id 5a478bee46e88-3537e0a4a27mr8108185eec.38.1791660428253;
        Sat, 10 Oct 2026 12:27:08 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:9657:9541:a576:7d2f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm18641806eec.10.2026.10.10.12.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 12:27:07 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Dimitri Daskalakis <daskald@meta.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH net v2 0/2] eth: fbnic: validate the Rx completion path
Date: Sun, 11 Oct 2026 04:26:48 +0900
Message-ID: <cover.1791659860.git.yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 is v2 of "eth: fbnic: validate the Rx completion buffer index".
Besides bounding the completion buffer index against rx_buf[], it now
also rejects a buffer-descriptor-queue clean-up head that falls outside
the ring in fbnic_clean_bdq(), and sets add_frag_failed when
fbnic_add_rx_frag() bails on a buffer that was never set up.  Both were
raised in review of v1:
https://lore.kernel.org/netdev/20261009175358.1598001-1-yhlee@isslab.korea.ac.kr/

Patch 2 returns a page-pool reference that is leaked on the
fragment-overflow path of the same function, found while auditing
patch 1.  It carries a different Fixes tag, so it is a separate patch.

v2:
 - patch 1: also reject an out-of-range clean-up head in
   fbnic_clean_bdq(), and set add_frag_failed in fbnic_add_rx_frag()'s
   no-buffer bail.
 - patch 2: new.

Yehyeong Lee (2):
  eth: fbnic: validate the Rx completion buffer index
  eth: fbnic: return the page reference taken for a dropped Rx fragment

 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 40 +++++++++++++++++++-
 1 file changed, 38 insertions(+), 2 deletions(-)

-- 
2.43.0

