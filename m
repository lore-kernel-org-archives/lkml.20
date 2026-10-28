Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181106;
	b=Ngx4XiN/QD4ay6VVcc+Y6D77+vi94fdjLt0qmvLHYiQovhcPi9yfWShypoSyYu7MIdE+
	 0RD+zX6l06d8Nsoayn3qjRztm3ZD7gWwVVndp0JGmA0vnYayThqCC4bZbY7lOS2zkENAf
	 BJvePvF7Qk2UGo16i565bsGE8P2P8OhRLJMGUn+BG+E6NbGJfVFHtOSVFERoSmcFr4fsy
	 W8v7isgq3p2Qldc4wZut4SGQPfG4K3FpLwK0ByLpaW4UwIfKa5PLMVCCFpEkFcdx5aERW
	 CS0vCFjSg8EKu80cx7poH2NroTz3ceWyUbhjQUME/9M7ZoFIDFkf8JH8FwrQpJGLSKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DbKwU23jSrZK1UdP6vJH7WyOhF86zBsgvRqTgUfNiQ0=;
	b=tHtIzi5gm1d1cYKCNLIIUyTczzGXah5ONLJHPmfwR9a6KmaE1e2hVzeMV3ehDCwEKGSh
	 RZtXrNyB/eDh5+dI5JhXquvZYnNmou44B1hVYvvL0xkEDiJPISvEmgoYFjih6kVRano16
	 tM1V/KURB6zapW9PGgbiRGw60W1MI1L3IR9PgXqXcPnN0hr6MZypzpcw8dAU76FbYixbJ
	 0cbk25CSyKpLdTaAMtPy9aS6m8yPbPnPvQunznw0XbcJmWQVofKH6Ab07hYMY7UrwFJRR
	 oUqqwc42bzWplEkHfVdtAngBgQoVm0QagvZPjcK62Nq1Af+vZdBMqTLXKY/Pp4L9f+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BgEgNzyT;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C581606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C581606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BgEgNzyT
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a78ec32fadso1338905e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793181105; x=1793785905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DbKwU23jSrZK1UdP6vJH7WyOhF86zBsgvRqTgUfNiQ0=;
        b=BgEgNzyTIjMWtkSWmPLDCcn2YgLoG5EjawL2ES59oO1gO+nSzZrCvLXdNDqehm5nIQ
         xljOtI5a80Q511qxdKayhe03PC3vcrAdoiEqz9/1q1Cj3BW8euLKXdIbQlIhBSHNEqVG
         QCEvFlonWvrq22n1CyaGURkf0kGuiLODsUN4p/08GvaZ+OT8D9Dc1F1ERUXFx5XKMGYf
         ygPgBM8T1LwR8QI0jUgsjytn+NwyVlgvER8EVt/40C2Y90og2WgNPDZKHLXBHsEm4/Qn
         SgT/cAOWzaSWrcqwNhK3yPOrLJJSWGNkNYHYA+bG6plzSjcS8KbeyEL9mmuBfUm4mj1i
         BiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181105; x=1793785905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DbKwU23jSrZK1UdP6vJH7WyOhF86zBsgvRqTgUfNiQ0=;
        b=wLufsSaoFuzZpP+G1p7Wo7KtQDKC6pgk8TXQecdX5Hm/DfShiwagd5oiC0ESDNjG2J
         R6Bab0Tx8u5OzvEcGtTmF+Grjc87Qye7An+bMw7rZ5IyK+fTCkYmfRIBnwz2RhBDP4wi
         jRkt7AG2ch3pS6TTmeFAaF9f9x9HXOrJdQmx/YP8CdynEc6acVdhU3HCoyemEkWXUdJc
         Bsf/CZ2HrSPml9RpLK94Fh5LGFgsPYsZwMojXJPX4ol03AYMxb0+f3ybi74unLpkIeoN
         QrYVnTCtGEEgDNaq3OJPxfqD16+15ol9820i+MAGgrxDG3TGphEOj+lCj6siFoni14xp
         yMCA==
X-Forwarded-Encrypted: i=1; AKwUvByaBfCwfs5RjP5K9eJr7yAIpDCEhkzHk6U+WzSwoolP0i9ylPtLgVa0LQbqVN7BOwiSgMmucqPMnOxIIKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVR63+5KWZWf3RS6Z0LNxcfncWvpdw1taYJx27FHder+e3vRGl
	WQF/cOl9zk25fKZwTCMtKvtVMNIiKWzt6SsJzHXG86TQyk0egD+jpAkm
X-Gm-Gg: AYBFou04ImM1Okz6EK3A936ASNOdsVT+hIYpxWT/2h6pc/Rc7ssF3kPU5y6nwRbYOzp
	ikbZvKSEmZrARdu2hpNqet/Rg4EltAaPKycftC4fR+bgDWtLR/B7ekifimOhqs08aS6s6YkcnvS
	zODBmyLKcCcsMlAXcsZ+Md28lSs0jAUkwsIMSpKSQATXKUGKXKuoceFnjlAx6ao934FwUVbv+Ah
	3tFTlA2ebBmAIP8d/o354jFLhRSenol1posSyvpU4wTSMaqDoNwQHzMNgO8sVSYz0+xcHY5xuhQ
	jNjxKfTQyEqtc8PynsPfmvklv8PDO0Gnj4D/PRfXll7A6gntzD/OuXOxuDwI6X6TkKQOTwkwfRF
	0hdMqMTaSASaAMp0dZNSG89gzlIsXpLM5P4PcwLv6HNMdm9y/wgZLK0C7o564Nc5yZmfR0b74JQ
	5dDovpbwM1a5H79smHZMxwzqLHLFIq6ttom0FKsguYkVSW6G67jf/h6Kega4GFPqqh5z1XjbqNc
	DI3tlJ6qiCUD+1x4GyzC1TItNaEQmc1QH9zAFzWbwAgcFUAKGy9WIeRLjQttntNklZ1Inh9bnHC
	KSSWE2tgQNRavxMRL7nVuCArea2TaJYrMikYORcT4iTiBV6PWQ58+b6ZtIJU6PsN33pKXhFQyct
	e6ymVoqwr4okLMaZ79EfgPw==
X-Received: by 2002:a05:600c:c3cc:20b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4a96179c9d9mr26099685e9.0.1793181104449;
        Wed, 28 Oct 2026 02:51:44 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4bc5sm27552365f8f.34.2026.10.28.02.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:51:44 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-btrfs@vger.kernel.org (open list:BTRFS FILE SYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] btrfs: zoned: fix double free of bitmaps on clone failure
Date: Wed, 28 Oct 2026 10:50:51 +0100
Message-ID: <20261028095053.20459-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

btrfs_clone_dev_zone_info() duplicates the original orig_dev->zone_info
with kmemdup(), which also copies the seq_zones, empty_zones and
active_zones pointers. The clone then replaces them one by one with
fresh bitmaps. If one of the allocations fails, the error path frees all
three pointers, including those not yet replaced, which still point to
the bitmaps owned by the original device.

Clear the three pointers right after kmemdup() so the error path only frees
what this function allocated.

Fixes: 21e61ec6d0bb ("btrfs: zoned: clone zoned device info when cloning a device")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 fs/btrfs/zoned.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index 08a15465a087..7dab7aac7b96 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -645,6 +645,11 @@ struct btrfs_zoned_device_info *btrfs_clone_dev_zone_info(struct btrfs_device *o
 	if (!zone_info)
 		return NULL;
 
+	/* Don't let the error path free the bitmaps still owned by @orig_dev. */
+	zone_info->seq_zones = NULL;
+	zone_info->empty_zones = NULL;
+	zone_info->active_zones = NULL;
+
 	zone_info->seq_zones = bitmap_zalloc(zone_info->nr_zones, GFP_KERNEL);
 	if (!zone_info->seq_zones)
 		goto out;
-- 
2.53.0

