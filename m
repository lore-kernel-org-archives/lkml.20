Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344513;
	b=3+7V//afP9qxImFxZMcue41FfSr563KFvwVL3w4LM6+FOTH4A6s6UIOL6hAbXAwS70H+
	 SiR4yeRD6Lb2hhx8jnSGRidca2WnC6clp2pEJIwVm3auPWzI+Zu1/XuV3dkgzrG4tzbmG
	 i4rJ//9iDxnOLB5damIwa5AxXP9QoH4A4DS6yDMdMGrQRN6gc32zUrYu8NtrL7IwYWq04
	 K9lRUqDN2wyXJO6eG3+Y7ZFLUbjkrHBDOw0vbunptfmFOgQfNKHx4PjQh2qGVjEWaof0j
	 GRfW2jurU0j3We5TXg5E+dMUgQROOrBAjBsI88WbNDve0FD/ikwJ1lqFOqx/jipd3Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M7R8N2eXWD6+EHKfny1HAblM/aky2ALTwQRlCwbdbPY=;
	b=Pa5F7WWnvz7N43i+DcDxaBRtB58tZIZMj3wWbSS8Zyilg9AREORaUKb2PPRjyImBBcOw
	 gOyyvZKmT6PzmzxK1kraK+08NOW1UEqNe8+5opBHL+DhwVvz9d63akALEQ0IQ+HgC33hs
	 NkMSAlwkAfEJxONvzpS5j0Mogb1JJngGPMHO6QYRCRtGxYgcwN3GO02RrDBKqAl8+7PFM
	 rLwNdk56GEYdxqkRuoV/CrJdMo8FFh5QDOCjNp3Oj8wwYDUrdnOtPDnxcsWI6THziJ8UI
	 UT94KLGuFv9m0oCvICDSCtn4xcvyiJvVM8umkMjyxk6BjOWOFCLzS98Cth0Sm3jYf6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=CSJ9Dgp0;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209C3606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 209C3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=CSJ9Dgp0
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37198ed3727so3199071eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794344512; x=1794949312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7R8N2eXWD6+EHKfny1HAblM/aky2ALTwQRlCwbdbPY=;
        b=CSJ9Dgp0zGlrS9GT0Yb7zoj6ITj6pka3nrha22Lru7iJfbhyzdeBhzBHWat74WMNtO
         6I7fNFUxnihp+OiK6I4FRUbbuzOmWZig8TzXInUMD4q82joiV8MMV7bPZ5itH+GxgLLI
         /2STzSYDYWj41+0g/1DnGSRu/Q9ONfSdCbUvBnxZ/8pWVf145+nbhldcjBbi2kkMHJd4
         pZNiRQ5MQlHFYCyKBQMngh56SCV47a9T7N9W97bXOnZZlt2hWWn9X6NBKP0Vi0d6emIN
         t3xR8T6qT4F5vB9asfdyn6rukpaXEP+J3H4ACd0uK6VRHkXkrbgBkCg9pnZ2hAMy7kIP
         EtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344512; x=1794949312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7R8N2eXWD6+EHKfny1HAblM/aky2ALTwQRlCwbdbPY=;
        b=Ba/7CVz75vwCEHLspSGLbqmKWXWf31ApTwuwi1GfV3EwBsK9w6TY4q7eRaKl/5Jf2+
         o60vgmliBPyKnJcWX4S+SGMp3cQgYf1ELmLw4Q8M3gpcF7bSs/zUG0Wh92rITsEuBmwI
         O20HOULF8Z9/uC1aJ6oUBDtDMTjOSXNQFJ46GEPCFOvCdlhCwEA13TslBibAXZuB1EFG
         yCy9wi+hwCRp4a3aTECPoZANEMrOrBsYRhjz6DIjeMiqWaQ3UFnEe7x1kYMFjpX5yKlE
         o73LwAIDtHDdZ2RUWv4H45QO2Qo5gL/EIokaomp4XJhZK/s95cUVfHfckFiunw/5B+9c
         /gpg==
X-Forwarded-Encrypted: i=1; AL+hErGDm7TDDa0WlMFHc+bL2qr31mE+DVIOs5Nqb7u9tHokJjFCp3fmKw1AKOOXbU/o0zbasPRE6TMoa6OAig0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vNiCqTKspvYmLsSd2PH0hye3gZntigxdlKblufbhzJyPYZBQJ
	+Dgh7TQYSxCQ35qgmxV9ZU9lKK6MaHWZa5PKS7vRHDOG3zehDIsQlYBEqnxhFnFVpls=
X-Gm-Gg: AYBFou0T58hnaFIXSHKuUfuAWhMTzRCD9kNZMxEdxCzzP23NQPY6tZpgezu+x328EaI
	U3IPBxHvPukr4xbjoyXzPWkO77zGT+FcYXkMiO4vhcu+z/igL75r4fRz7RJ137PcD66gWdZeEtt
	NVe+1p3PXTqH2zdrXGnrMvRyMn92crH9lFQq3/B0/G1gCE2bOLZfHwr8hEwl81ZdxLWedPloj9S
	7dpmTwlMqNZcUlIkuXA6h5eahf0AppImm0clD3e/QEkolk6L/MmdxapLc+E/g/f6xd0YbGF+VQW
	n0Kqi+GXAK93DXFL0JZIf9W+3GF9K/+VHOogtGDMcDPy9haVYQypBTW56l70vP7hWiv0eXq5FPo
	Sz92GQf7nrRKs1i7JqBdviBVEOiJsa2zp2XHgUrGlYIerDDid2JTGr8MAxnzPa3fvuKTm7w3zlp
	Ng0TLXqx3CbyXpyGLOrH0IcVgB7ECTJP798yOVZBrppgsCUWdIjAJqHzh5YP81Ow/U8wBm+Pcsv
	ETnXQKjcLkvykOmHHDnux9I4OznGXSOIKQXVWmMRF5gnfS9DVVTNMNJfbtTeQiR7av9dFn4x9YV
	+YP2uLKUjdc+SzfDtdhb1luTMQc2DgFbnE4Cr+xq5FE7CTd3iVRrHcRFhMlgCznXPySOwLMp8TG
	BY5TmCsX9WMtK3g4y
X-Received: by 2002:a05:701b:4516:20b0:14b:1ef8:698d with SMTP id a92af1059eb24-1b3c036c2c0mr73201c88.15.1794344511472;
        Tue, 10 Nov 2026 13:01:51 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4efc2sm8017033c88.15.2026.11.10.13.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:01:50 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: ap420073@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH net v5 1/5] amt: fix use-after-free when a Membership Update re-arms a freed tunnel
Date: Tue, 10 Nov 2026 21:01:46 +0000
Message-ID: <20261110210147.100396-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179423575689.994134.7687724928848317687@kernel.org>
References: <20261105125010.1107546-2-omar@blockcast.net> <179423575689.994134.7687724928848317687@kernel.org>
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

On Mon, 09 Nov 2026 14:49:16 +0000, netdev-bot+sashiko@kernel.org wrote:
> - [High] amt_tunnel_expire() (drivers/net/amt.c:1412) runs on amt_wq.
> - [High] amt_del_group() (drivers/net/amt.c:293) used to free the group
>   node with kfree_rcu().

v6 has superseded this posting; this patch is v6 2/6:
https://lore.kernel.org/netdev/20261107004935.2627329-3-omar@blockcast.net/

Answers below are against v6 and the v7 I am about to post.

> Can this flush deadlock amt_wq? amt_tunnel_expire() runs on amt_wq, and
> so do group_gc_wq and source_gc_wq.

Fixed in v6, and v7 keeps it. Both flushes are gone:
amt_tunnel_expire() and amt_dev_stop() call __amt_group_gc_work()
directly, and the group GC calls __amt_source_gc_work() directly
instead of flushing source_gc_wq. The cancel_delayed_work_sync() calls
left in the GC queue nothing: each takes a pending timer work off its
timer or queue, or waits for a running one on a barrier that
max_active does not count.

> What limits the number of deleted group nodes waiting on group_gc_list?

Nothing, and v6 still has this. max_groups bounds live groups, not
parked ones, and before this series a deleted group went to
kfree_rcu(), so the series introduces the regression.

v7 counts the nodes parked on both GC lists, under the one lock that
now protects both, and queues the drain of both lists at once when the
count reaches AMT_GC_KICK (2048). A parked group keeps its 256 source
hash heads, so it is a kmalloc-4k object, and 2048 of them is about
8 MiB; the kick keeps the backlog near that instead of letting it grow
for up to 30 seconds. A periodic drain that ends with that many parked
again re-arms at 0 rather than after the interval.

> When the GC finally runs, __amt_group_gc_work() walks the whole spliced
> list with no cond_resched():

v7 adds cond_resched() after each node in both drains. They run only in
process context, with no spinlock or RCU read-side section held. The
kick also bounds what amt_dev_stop() frees in its drain under RTNL.

> Is 0 safe to use here as the "never refreshed" value for last_seen?

Fixed in v6: 2/6 stores "jiffies ?: 1", and 6/6, where every tunnel is
stamped at creation, drops the special case.

> Could the commit message describe each of these failures? Alternatively,
> could they be split into separate patches, each with its own Fixes tag,

v7 keeps one patch, since the tunnel and node fixes share the same
helpers and the same tunnel->lock rules, but its message now names each
failure: (1) as the amt_dev_stop()/amt_tunnel_expire() double
list_del_rcu() and free, (3) and (4) as frees after only
cancel_delayed_work(), and two more races in the timer work: parent
pointers read before tunnel->lock or RCU, and a second destroy or
delete after waiting on tunnel->lock. It carries both tags:

Fixes: cbc21dc1cfe9 ("amt: add data plane of amt interface")
Fixes: bc54e49c140b ("amt: add multicast(IGMP) report message handler")

Both went into v5.16, so stable reach is unchanged.

On (2): every walker of a group's source hash, the report handlers and
amt_group_work(), holds tunnel->lock, as does every caller of
amt_destroy_source(), so I don't find a reader that can follow
snode->node onto the GC list. v7 still gives sources and groups a
gc_node of their own, and says it is hardening.
