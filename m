Received: from mail-wm2-f5.google.com (mail-wm2-f5.google.com [74.125.225.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F95038333A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619809; cv=none; b=czdihV9id17YG+ankuAAJY8ADswbdMJUzsUY+pphve4y8yO9T2YZ4faSg/X7aKtwZYKnJbZPR6PCs46jjBRLkn6qQGerQO09qxmZy6XKW65w4ikfH/TAkIZDdGr7M/ednrgWcJH4SypX+kyAli5xXxBQj9wyGm0EycZYnx6A7/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619809; c=relaxed/simple;
	bh=NKB5rqSwEt/lKn2AC1ELkAaqSFBsUp6D/aGlIYyMdac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vc2PDlSFk1/nbeRDgXeXKi0pb8PmCL2ZAznHJjBXQdgeMyGsoaDCwkZxNJTrPYBq7IGVbnvums1yTY20PIeGj3WYIk7lz5yyc651EXUTxBRP2jCAuMLMJZ+sU9IhZFkYwuqBTLeare5KvlXCkAlRNGi3985agqpAwf8EeaG4W9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=Zb4f5aNs; arc=none smtp.client-ip=74.125.225.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="Zb4f5aNs"
Received: by mail-wm2-f5.google.com with SMTP id 5b1f17b1804b1-49e7b06acb8so14663745e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790619806; x=1791224606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKB5rqSwEt/lKn2AC1ELkAaqSFBsUp6D/aGlIYyMdac=;
        b=Zb4f5aNsl5iwLe1FSAwNb0ycX2DrDw2H4HofWQwFBIbhCwwyILo1YciTASRLUGshbU
         +hATWqqRxaQj50ct6KhRnQZZNpD2biq0S0Us8wos/qa/FrCpGlWGYe/c6ASG7YiRfPg2
         7XFhw3gcvxPp6rsE+8y+ssuz4b4wQxCAxn/W/KLW2a30J7ICRm+v+C6Hc4aTx3W4wkYl
         BC3Ea31lnF6PQLfGwthnOpcoLU+SAzh4q7XYf3Q5YWWXYoHlWEn0KkLRaT9GZ2a+g7S0
         7It0LA4w7MvkAGGQM+3ee2n13aq1mxVrGdFHJC43/BsYdMz6V80qRiadoD2KUFXfNync
         7cCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619806; x=1791224606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKB5rqSwEt/lKn2AC1ELkAaqSFBsUp6D/aGlIYyMdac=;
        b=LObPHOeQzgNXwws5T1MCzIRut8AJH0/fMtJfmp6N7l4KOIKUK19H7BSSwidEhfAJpW
         Dj0jlYnLZhD78SmxFwG/+DS1p+sSw4viCulYdD5W585LjyIP/HCnFdgoYD5dx3YHDwEX
         Bz2Ya4gNqpoq/RK+AJBqfXCSyAfRl2ipuD57PNa+0+wIPQZINi2U/mJNDpfUrflcvjzF
         J8+fdoSu3x2/Vj02CM13lY10171STA3+xil+hr1pnhwAC0xmTjM0dw6W1CjGMoZyO/CW
         6rWDA/veSDjEPeeC90rBBfNctiuQYG+yXNKM9Tc308JnrspVxcTQQ79OY2F3kqqJ8Zs+
         Q6tw==
X-Forwarded-Encrypted: i=1; AKwUvBzBFiNUjojmtU92/FiyuRDQC24j/wDsGrmaS+nR2lzAxs9utSKld/+TYglhTwVxYDpf4arHKd6wgCNs8HQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l3nKAV3U5mc8R9D4f+X/66e2CA/KYSZVgVLMalrNlwoQTQOf5u
	en5ythhEeW3BQkrFf2pNfkTBiDgwl23/WdJmII7mzFyV8CzVmLHfZanW2Q72Km6Nc+Q=
X-Gm-Gg: AYBFou3w9dsK9s+0pM1iQ6vjMiFhRCNQy4S0T5HpH2Mz2zM6zlW7uV+JiSaXN15F6xE
	CIxENL0zmvL4t4FcfWa69C5w4dtT68eNcerjeO8PhlaXuOVDMMk27utjqJ7xhz1oCyfdNY0M21n
	OGKDRZH3qFsctFXCXdM+99NJwRrF3jYdCzDYsZ527zl842DCwCIgxSnp1VQBUTfDqEReP5IURJY
	QcCLR70zqKlAjzc0gZuYHqytahwxgjTXZSNqpYOnU8mgK56sNg2aFoAZ4RF1eC6ajWltyYU+Q9W
	c2NKlGibjlgr5PLwn6r7XTBf9W7RJfiVrFib1/FU6LQW/zt5kdifu5y76QgZcuCy02KefASweqI
	NHSJs0iAChVsOso1nvsGgXli93uk05zozYJaN9iEt7ka4vyuYpZvuM+/zocn8aqfeiVUk5a+QLa
	zLsTKCRdhCU1kX6O2df2Ok/5ZAw4gaVGMqEYO9rM/rKaH5ixCLgfV+sDvTqgT5h4/dipBXtVy2K
	v7bo18MWs8A4pfHnRJHdqmODAppbcVrX1Lw97DdcFDZ6Y63hSXVQJ+eNx0tp1+XWcfLRecGD3bZ
	qQ==
X-Received: by 2002:a05:600c:4744:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49fe7b6371bmr246224735e9.12.1790619806453;
        Mon, 28 Sep 2026 11:23:26 -0700 (PDT)
Received: from localhost.localdomain ([197.51.38.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f68basm9476785e9.12.2026.09.28.11.23.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 11:23:25 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Cen Zhang <cenzhang@linux.microsoft.com>
Cc: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AutonomousCodeSecurity@microsoft.com,
	Xiang Mei <xmei5@asu.edu>,
	tgopinath@linux.microsoft.com,
	kys@microsoft.com
Subject: Re: [PATCH net v2] amt: do not store tunnel pointer in skb control block
Date: Mon, 28 Sep 2026 21:23:22 +0300
Message-ID: <20260928182322.90171-1-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179038364383.2160803.12085088814406803245@kernel.org>
References: <20260922214150.13970-1-cenzhang@linux.microsoft.com> <179038364383.2160803.12085088814406803245@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Sep 26, 2026, Sashiko wrote:
> [Severity: Medium]
> Can this lookup return a tunnel that amt_request_handler() has published but
> not finished initializing?

Yes, I think this one is real for v2. amt_request_handler() makes a
new tunnel visible with list_add_tail_rcu() before it writes nonce and
mac at the send: label. A query left in the qdisc from an expired
tunnel can therefore match a re-created tunnel for the same gateway
and port during that window.

The direct-send approach proposed earlier in this thread avoids it by
construction. amt_send_igmp_gq() and amt_send_mld_gq() run at the end
of amt_request_handler(), after the same context has written nonce and
mac. They call amt_send_membership_query() for that tunnel, and nothing
is looked up again at dequeue. I've posted that as v3:
https://lore.kernel.org/netdev/20260928181601.85857-1-omar@blockcast.net/

I ran Cen's reproducer on net at 17741334d00 (KASAN, slub_debug=FZU):
the unpatched tree reports the slab-use-after-free in amt_dev_xmit(),
and both v2 and the direct-send diff run clean. The reproducer does
not exercise the re-creation window above, so this confirms the UAF
fix, not the v2 race.

> [Severity: Medium]
> [...] a query that was successfully handed to udp_tunnel_xmit_skb() is
> counted as tx_dropped

v3 removes the relay query branch from amt_dev_xmit(), so a General
Query that was sent is no longer counted as dropped. The gateway report
path (a successful amt_send_membership_update() followed by goto
unlock) has the same miscount. That is independent of the UAF; I'll
send a separate patch for it once v3 is in, since it applies on top.

> [Severity: High]
> amt_dev_stop() deletes the same entries with no lock at all

This predates the fix and is independent of it. Reading net, it looks
right to me: nothing disables the per-tunnel gc_wq before the unlocked
loop. cancel_delayed_work_sync() comes after list_del_rcu(), so it can
wait for a running amt_tunnel_expire() that then deletes the entry and
calls kfree_rcu() on it a second time. Cen already posted a fix for
this, "amt: fix tunnel list corruption on device stop":
https://patchwork.kernel.org/project/netdevbpf/patch/20260822045407.28983-1-blbllhy@gmail.com/
so I'll leave that one to that thread.

pw-bot: cr
