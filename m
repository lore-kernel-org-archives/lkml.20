Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D403838DC74
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853392; cv=none; b=XoIR7NzZW2LZwF2CcM7tvi9dDvra0nblsRQvP65Z/qOXuNMvoN4TOb4s3xnD9U5OeMT5onnZuzK0y2JIZIIxkDXv7hRlqpb31xSgS20Zy+s6RLSSZYmJrfxP9PqWTBxlYArpZeHvsxTEef7GXKMM6S1eglFO8jjfW7OnjaV0xz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853392; c=relaxed/simple;
	bh=y+kZoY1MgDh7ZkVxBdhh/1ay6+k1Ll1rHWzk6k7pSuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ICUVx/lQoRW6gtfDhr9Cn3LkmZAyz4lip5PnLkt7zSBls9W/8fCK0jeuBMnV16PRfEUi3zZpPl2tPfrPo6osBBx2cmCpg0Bd3VovPt4zv5qDyzL0sawqaUXYiOEYONAMRieVR6TgwloQCS5jnBh7bj9iISoN0D5yXKFGYjWvV7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=V8FdP2ad; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="V8FdP2ad"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84830c774a0so4092483b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788853389; x=1789458189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5gVOEWG5ALyzgg+hgM1J1OcPhbm1svDb4rhqpye/dcs=;
        b=V8FdP2adaD9JX+z59B0asd4OLNYDWsNTl2u0at7c4hLR1JnFdHUqzAuuSl76JRWOhH
         fn2UXH4JCDgUYdYSGF8bSEebWsfGCNtU9qTpnnuuDpKD4Ogwb49EcnkzryfndBXHIrq/
         hrlSVLOG3GymT3a30lQZntGNxrnQGsJbwxERDEeX8QUE6RUwOyW6SUrRD/npSGmLExGc
         JZvA8Z1Eg82LB2qP/YYV1TNuMRMGkzZutF1iBj377RvTLOIKaOLNAfRsGJwo8svGE4Ad
         9GDIcC9A1pZJaSbGP98QB2S3ogHxAxwQjttRu5zII28M5w/UgKVpAXD3k3FxlndRZ1RN
         K+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853389; x=1789458189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5gVOEWG5ALyzgg+hgM1J1OcPhbm1svDb4rhqpye/dcs=;
        b=pl/gWCKgyUvqZBBQY5LTwRa2slOFsvRzkKkHqZ4/mvTWU25loLU9olHjZCeReQiLae
         eW3pJzmPhfyqNaPDc85EPRx3wveyG7QEuzPgMl8pgNXnPBZ8TfQu61fg5Z56omqOP1tH
         HGPhMILYEtxP2KYAyRoJhSoKpa4U4mQOtHDj9FciLtqZail31/aEbZfHG5B38bupkJWM
         FV6ir42fSKxoNHJlbREF8n/EGW9dt1055UmjnF8qXyt4eQ8tAbmZBxH+86DmzOP4bmW8
         mxyDTiB8kLry/zGcs5CmvfgcmQqwv1ZTYcR6LtInyILhShQBOClLjrLGuZubrwJ+p9x6
         gTqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRWeqKSDaAaScmVo6+NKy8RRdPiyzMCGg9oBcJeXUdniN0tM9ysrytm/zDDo2ec6Bip6MZ4mApq2qPRkQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m34mOYTdUxupXlAaQn/INVMJAiRmRvNbEOJ8XKwnumOzyDX+LL
	f5KReHK1pKURlzaN0b6iHYNDpuvpQH5PXDsTM7M75MEt27qLBHgCxOgkRocF4GjW+P3e
X-Gm-Gg: AYBFou33CI9qWbpmY2aoH2PeILiOq6wjk4wiGaDJ+kSuq4KAXFkF3+NzKbZGaCGTfd8
	CiQFRqWSj7BIkShcQdJYloT6TsATBVIHaS6vt2WrphZgnMUQT7erOvRv3Pb3Oi/lzSkc69BdsuC
	TgkIOtpf4M0O+lB4VimA/yZwl5YxQB+OH84RTt1w8q+omdOznFWDrWMvdnJjjA1ENFREDv0Pt8g
	fwh18qOrIVwVVIqZY3PHJcp05uKyEsi3qFpYYIuFfd3fcOXVQnwOxqk0cQCO6YJZ1DM2THVptE0
	/oUmTBn/cFqq/+f+d6G3X/IPvh4+MMQAWy/UhcPOEuGNA/ddMPwb3J/gf4notSzQsxEbFeM2tTq
	kgzM986pR3pu59W9J0OTIyRXwn4mjZbyk2iQIRsORBKm8JEuBHawKIGAkWMWfagAXpTdcop4nrk
	wnz7PETFOgrToc6mmzKdunIBIs1yLOWRDlGrKnQ1kw1E7QZDqGsd7wCWktw6oJj0r/rTHPJTOMn
	kY8ok22/cETvTtbENM40Uy7eIdf7Q==
X-Received: by 2002:a05:6a00:2c94:b0:857:727c:a1f2 with SMTP id d2e1a72fcca58-8616907f6e9mr40004970b3a.20.1788853389137;
        Tue, 08 Sep 2026 00:43:09 -0700 (PDT)
Received: from b6ad5085b32f.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8633cc0f7e2sm3499943b3a.37.2026.09.08.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:43:08 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: Zihan Xi <zihanx@nebusec.ai>,
	Simon Horman <horms@kernel.org>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vega <vega@nebusec.ai>,
	Luxing Yin <root@tr0jan.top>
Subject: [PATCH net 1/1] ipv6: fix fib6 walker UAF on seq stop
Date: Tue,  8 Sep 2026 07:42:56 +0000
Message-ID: <89699735763f6c297584d7c2ff106239cc1e8ce0.1788837093.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788837093.git.zihanx@nebusec.ai>
References: <cover.1788837093.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipv6_route_iter_active() treats a walker in FWS_U at the table root as
already unlinked. fib6_del_route() can move a still-linked walker into
that same state when the current leaf is the last route at the root,
so ipv6_route_native_seq_stop() skips fib6_walker_unlink(). The seq
private object can then be freed while it remains on
net->ipv6.fib6_walkers. A later route deletion walks the dangling list
and uses the freed walker.

Use the list head as membership state and reinitialize it when
unlinking. Keep the existing w->node check so a never-started iterator
with a zeroed private object is not treated as linked.

The same stop helper is used by /proc/net/ipv6_route and by the BPF
ipv6_route iterator. The BPF show path only widens the race.

Fixes: 8d2ca1d7b5c3 ("ipv6: avoid high order memory allocations for /proc/net/ipv6_route")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Co-developed-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 net/ipv6/ip6_fib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index 3e382ba1573e3..9ea75703b38d4 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -85,7 +85,7 @@ static void fib6_walker_link(struct net *net, struct fib6_walker *w)
 static void fib6_walker_unlink(struct net *net, struct fib6_walker *w)
 {
 	write_lock_bh(&net->ipv6.fib6_walker_lock);
-	list_del(&w->lh);
+	list_del_init(&w->lh);
 	write_unlock_bh(&net->ipv6.fib6_walker_lock);
 }
 
@@ -2760,7 +2760,7 @@ static void *ipv6_route_seq_start(struct seq_file *seq, loff_t *pos)
 static bool ipv6_route_iter_active(struct ipv6_route_iter *iter)
 {
 	struct fib6_walker *w = &iter->w;
-	return w->node && !(w->state == FWS_U && w->node == w->root);
+	return w->node && !list_empty(&w->lh);
 }
 
 static void ipv6_route_native_seq_stop(struct seq_file *seq, void *v)
-- 
2.43.0

