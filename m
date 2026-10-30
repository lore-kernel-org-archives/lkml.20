Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333202;
	b=G1/sY2T3+nCwtxwTQis8jRPUeeryih0ItRZMj7Sp+z228odNN5lPGy8FvnloyXPntbuC
	 zGZ4ysneKY/W69rWNF4Yuw5KnlIY5SddqaKghahsnkCdHT2yBiNB/OAlvNRQsmItpCKsm
	 CIYHmIbxOYRvrCIlecmRscAZfYZIGIGsc2iRixxZIcIa1lRw14DcwKdPM9Ln67JUkpT73
	 8cTCzHCAbW2BRCpf159iOd8XEFqEL357acEwcr3e9swfuBt5dvQeRoKBMHGP4/rcaXqmR
	 qYrGjl50xJXj8k7ixLxtFxfYWvXnj7hbhkZy5aaH1nUpRz8pwYalzQQma6y+nmmd1KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=idK/OHsk8PCTskL28fTb65exOFJHBkY2hYQtf1j8B4w=;
	b=vtgDPfCE/KdOVFBrz4cqWthQf5QdvvIQcuQOp6N+OlZJUHh7PPkSC3pXKCDNJvZPS9mY
	 L3lYa6+jY9mVjYMAhUqAr+CaEPptW9u8H1Df5e6H9kgKjB7/LB7hE+BeWnK8hmsnaLIC3
	 Lo+jZSHFXHs5/ZFtxsZHGfbhhi3GBHKhxoCnWL9liHV+M2abAP+v03VGQygYnOxZoCeKf
	 zX5fQEzT936GJSaUyHWI6gNdzUsO9XKACIx3b3Q73DjVhse85zMkTsAufKzFAi0lg5vC7
	 XjAu7HFbcaF7jOC/P2waAkOtoMgr6Uk4n6Hn4h3QJmyabl+UedE9mVEeGs6OyHTBgcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0HdgpzyW;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3582606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3582606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0HdgpzyW
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso701740eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333201; x=1793938001; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idK/OHsk8PCTskL28fTb65exOFJHBkY2hYQtf1j8B4w=;
        b=0HdgpzyWMzAaoPAZLrtT2XHCPIqQb3vM4JPk54LSiMC6tIWml53jr1UhLQ1QFeBjX5
         /Ny8K2v7jsRgyPq9BS4f6ivJUECaM1xN+0m9vzWVRILjFl4PqtHWGc9TYJQGJgEd85Tm
         mfCd3EvznNT4sRQyWVtbNk8IxrmiR29ayCxuPa0u2vFxUuaX2GK/ZU08qkbdKs1PTwRs
         DNb+rFIi5b9YGb0tr+hELJNPs7j+AHnivq9/avfW50qjIYBhZCZ+F6lVLgbdPeplb8T9
         nzW1Kb4isSli+EPSqvEvHY+ohd21as7QjwZv0r4AHV4nlL9CogthY0cHjQn+2pfMW89L
         9YdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333201; x=1793938001;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idK/OHsk8PCTskL28fTb65exOFJHBkY2hYQtf1j8B4w=;
        b=wIgoed2UsKF3XPO0oRgX+xps5Dk81idz+Cqm72nfNqM9v0ZB7GEx+wnmi3TYS0h7Uj
         0TuWAYk9ZCHhuYWxMXmA8d2o0rRKekHxp+IX1/j0n6zFptKUkOKvArO3B5OluVwW+3HK
         +772Q5MspbkYg98AOg+M6uQRIr0WXLEfvQDmK+/oUe7Bg03Vta5tk8CGSwa+lV2i8U+V
         lIubwcHQJT50G1WkHMIjhufuc3xCjdffWwR8q1rvSDcyTjFsROJh0joePbaA3rLjr+vY
         4MlOThK0AyIzn+9DSdta/WPCdXI1oGoaA/aMelyWXJ8zz3MSSAFqpSVb8ksZ3DaDCLw7
         O5yg==
X-Forwarded-Encrypted: i=1; AKwUvBwsqKCWjrtqQO8HPwZhwuxjhFY/z+PgtD90QnAMNmuOTosqT7RW+vatjfbLuQg3BxLgJdojz3DJHCJ/lB8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAfDDV3geSMFXYVpqBo2Et89mHKVZ6EC0kK/MsEMEfkSq7ZrtD
	70BGQOl1jVOo1i7Kn2axR5n3AZvP3OXkzQeWFj/MzvmqheJ24Ix55mvk
X-Gm-Gg: AYBFou2yzPsZPKmtVRUScv5TFGDlNCWssjbKSNXHTh6qzcMgvurQZE0esUM6ScrPLK6
	2i1pzQAAHU2Oi276qC4PT+UBMpV34KL20RKrdF2bOyNtonCi11BgbN7cddwNr6IjehDdPvW5qI3
	cbBVYKuygnKhb0d+ke0I2ndjH6KLcUf8xINnuNARz3NlXfORHfE5IZCz24R+/QIEXnaOQO8fjab
	b5aGeWGnM0Y7/ylB84f/YrN95K1IY6ExEQCdNDTmmHVf+6g6wsSLv+DcpcfEeKjZ6CLntgrsIwT
	khkIX9vvpOWSOq7Ooj6X1c+kbbWo28OB6XI0y6eiQP7ug7JdUqI2uw0fOL2Mi7EtyAicBBa/if7
	hWkmgcX9cj92FiUNASht215LpsjB3xzr67rFvKJjg1mqBzmZ/3VF3qRMWDT1EA42kUDb0uQ7FKS
	/PekdveGIBJaUq5GZWpyMOzSTrC4DEg/3h2RjGU8akItbqx+tjMJfwrNv8bS6ZV7p1Bbta5ohDO
	jdF1RVc+KWmL8JGOcS0BArVpz8IN7Tv4aTKOOgmEyRCCD9bRd437ZaKtJwtf50nj+GQGwqkzPjF
	Bk3ELYLSrjt3B+wlBduG16HZrZIvidNDtezaehWhw5H/lplQMbWQrQ==
X-Received: by 2002:a05:7301:db8b:b0:35e:ebb1:8e5a with SMTP id 5a478bee46e88-36a424261e9mr1794192eec.26.1793333200901;
        Thu, 29 Oct 2026 21:06:40 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm3412216eec.11.2026.10.29.21.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:06:40 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, bridge@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net: bridge: disable MRP ports before the FDB flush in
 del_nbp()
Date: Thu, 29 Oct 2026 21:06:18 -0700
Message-ID: <179333317814.2102764.8780283783548366593@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

net: bridge: disable MRP ports before the FDB flush in del_nbp()

del_nbp() flushes the port's FDB entries before it unregisters the RX
handler.  For a normal port, br_stp_disable_port() has already moved the
port to BR_STATE_DISABLED, so no frame is learned in between.

That does not hold for an MRP ring port.  br_set_state() ignores state
changes while BR_MRP_AWARE_BIT is set, so br_stp_disable_port() leaves
the port state alone, and br_mrp_port_del() then sets the port to
BR_STATE_FORWARDING (when the bridge is up) before clearing the bit.  A
frame received between br_fdb_delete_by_port() and
netdev_rx_handler_unregister() is learned with dst == p.  Nothing
removes that entry before destroy_nbp_rcu() frees the port, and a later
frame to the learned MAC is forwarded to the freed port:

  BUG: KASAN: slab-use-after-free in br_forward+0x55/0x3c0
  Read of size 8 at addr ffff8880200bf038 by task mrp-poc/9420
  Call Trace:
   <IRQ>
   br_forward+0x55/0x3c0
   br_handle_frame_finish+0x1300/0x1d40
   br_handle_frame+0x90a/0x15c0

Remove the MRP and CFM instances before disabling the port, so that
br_stp_disable_port() actually transitions the port to BR_STATE_DISABLED.
The synchronize_net() in nbp_vlan_flush() then drains the receive paths
that could still learn with the old state, and the FDB flush that
follows removes their entries.  No frame can be learned after that
flush and before netdev_rx_handler_unregister().

Tested on v7.3 with KASAN and a reproducer that holds del_nbp() in the
post-FDB-flush/pre-unregister window for 1.5 s while a flood keeps
sending frames.  The unpatched kernel reports the KASAN use-after-free
above.  With this change the same window is exercised in six cycles and
no KASAN report is produced; normal bridge forwarding, FDB learning and
port detach also pass.

Fixes: 6536993371fa ("bridge: mrp: Integrate MRP into the bridge")
Suggested-by: Ido Schimmel <idosch@nvidia.com>
Link: https://lore.kernel.org/netdev/20261012123051.GA714215@shredder/
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 net/bridge/br_if.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

v2:
- Implement the reorder suggested by Ido instead of adding a second FDB
  flush after netdev_rx_handler_unregister().
- The reproducer still exercises the post-flush window; the unpatched
  kernel reports the KASAN use-after-free and the patched kernel does
  not.
- Regression-tested normal bridge forwarding, FDB learning and port
  detach.

diff --git a/net/bridge/br_if.c b/net/bridge/br_if.c
index c52613431f88..45642b6a5866 100644
--- a/net/bridge/br_if.c
+++ b/net/bridge/br_if.c
@@ -340,13 +340,13 @@ static void del_nbp(struct net_bridge_port *p)
 
 	nbp_delete_promisc(p);
 
+	br_mrp_port_del(br, p);
+	br_cfm_port_del(br, p);
+
 	spin_lock_bh(&br->lock);
 	br_stp_disable_port(p);
 	spin_unlock_bh(&br->lock);
 
-	br_mrp_port_del(br, p);
-	br_cfm_port_del(br, p);
-
 	br_ifinfo_notify(RTM_DELLINK, NULL, p);
 
 	list_del_rcu(&p->list);
