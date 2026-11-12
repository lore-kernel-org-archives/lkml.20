Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476535;
	b=zYFsCgGPs2fO/xD1vZrkugyeUI+QWBh9nU5YmrdKBdsuKyRBDmjenqVcNwjr60BLVDue
	 CGVPLWeQcClGiiR4MmkLVdMntLAdC+72tyTIsj6V1wrjaCgqwTn4LJHpVq7jARKRgCm4w
	 lqIksGKgM5tcZ09UjnF6hSuLK5MWRr9X71/iSEoB927DZkePf0HFNr6k1BSM+DF8m5joy
	 ibCGt9TlVWRPOPDPeZCQw4lorNArY3RuL/BV2Ko3DxiGwLnIrceJ5Px7lLvbRpkCIjgkY
	 CrcT2oi7qYQ7slcJLP3Co31V0RGimN9Lzy4flvyw63MZNIfXV70Y+b1yrNlN1MxRq8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M5z4Z218iwFLIiE49jl2bv9SF37cp7wRUYRt0lwEz+g=;
	b=TvHbINYeF8Oah3v89Cxu6OfGGO1riFnXzk7wnIiDBVz9yuUAk88rI9RSCW+CtohZD1Ie
	 y3popL6/4Cuv6Gpnehu6WJq/CFwKiLjA7+fT7gO8itbRT80on/XBG1UFoKkLy+Xf0RQPL
	 p7vKVroFE48DECwca/qtuLhUW3KuuThb0k5dA0FNPZ6Fm+yi5dArh33Sc1k5bFe074lVN
	 pPxJ8QN/kfH5lSH2ZTAjnQ3JOEzEqdXRVKpRSOTYxRJQ3sJm6ouu8cTLy/76La2QrxZvm
	 AzpBxQjf9TVYckVVuwbqAV4eVMRaFcHxwqdRKPLEtNvBdoHxOuy1wI0sIMOclhBB6pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oghy3hZM;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AE2606A887
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2AE2606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oghy3hZM
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3720addb068so7255754eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794476534; x=1795081334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M5z4Z218iwFLIiE49jl2bv9SF37cp7wRUYRt0lwEz+g=;
        b=Oghy3hZMUYng4sAKtcoxnPw6uGHj+5sCsfYUVf23LwU+ATEnKNflnRzEzIb67/xawB
         tNco7RrfZzCS/s+2YDJ+nguv5RXPGLznG5Vw8B1HcZYHurdd3n44EcP7zvp8H8ez8uXy
         1TjeMT5PT+koVkp+clFHn+eKrqXXRsrzqIJcvZB9mnAduvT3DZTN/nSR7FoJDjgDdvhg
         i+PgyNIfLepNKm/wjuDniyaNJJ/zIaupctIRDTpCuKqLixyR3nzzuP0MQR4RTORtkFwq
         HY18eFm6NjdVvfTBqadsTHC0VQNZNW9EN+u3T3JifzTv+MejzEhp4+DRhUgp5a1QDwV6
         VU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476534; x=1795081334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5z4Z218iwFLIiE49jl2bv9SF37cp7wRUYRt0lwEz+g=;
        b=J4pSiGEhdbmAkiEEr0I9VBip6XympmnXIiA049axFJgF0F7AdP3rb+CaiQRUnYkLmf
         7JbynL0wHjMuveg2ktY7BLrui2yqc2etgswKLx3dRVqJHZ+fvhrT7QdjmXyotILAfuyn
         3Lkobc+lDCnYP1g3lsb8Y9ygBS+kpOCRhi09uB4k4uKaFO8V8Vcj6xihkQV4UEvQP20H
         UaPhhrmJxXEuCeN6Fgk4PcJ2qC0+Fsr08GKaQSTftdWGodQo8mHI9eLtqHDSt7gHGaVN
         CkV8BTCIX20yDnoVNVplx1xvKCSfFhXzXE8JQ6uV+8MS5/cLgEOvoak4cBJ9Uh35viMO
         RCiQ==
X-Forwarded-Encrypted: i=1; AL+hErE90EiWIk3F8/kVx5ejpyy73yr76aXM8vAJurOSvnDNov1Cia4a/qDGJ5zZEyhDKxTKRWQVL+Szv4t7ZN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pJgkq7Tx6Aha+5ebw9aatfvhBzqDRx9oSFlPXuF+ax78gkaEi
	0iponpwFQ5/+a46R7NhqWeAY3GPrlC5jo5hGd6ZbvSDCvI57SbQUBsjI
X-Gm-Gg: AYBFou20P7O1eMTEBVKUB1uo2h3U3HCmvOitDKizxVPcZB0zBC0VXSbhrjHMZBFrfua
	/I8Hc25tzoy5WlyXV11f1dqTagrDxtnmu9M75V8VLpXNCpxLk5IA02GsjBeOj938sm+0w6Zs/D5
	hKMJQ8OPyxS/YYzqvNV5sarCrXd3/0IB9AWlc3lE/BKr8mSnzlPoIoij28F1gQBzZrv5HpmUqSt
	9UdQatZTVGISBUvWNgApLWVsPt/tBNMNheOB+s+aPPoNSn2Yv2druJ6Uq7VJdRegkPJPNL3ceTZ
	2M4V8MTTbeFLttaWiePeEE5j3FtNarDnRVotvFicoGiSon1q1j8zxfzO7fKObW11sra9xmyCBEa
	+d4W31PKl6CIfzzmezGcNyltozALhUKqPRz9smoEgvF8TkgqzDF3W1bu+iBwknD0krJEqPbERuB
	UpVbiAy9F1Kt/J55VWHOa0Jag8SWCopM0pf/znpldJF+D4cJxbE9bp7NSSMj6nBG9glOl5harQl
	Kz1EhZHxIaT55ElLnDuP3mLLV2dAUC0/1e+1wBUGkE7VRRPeFEwhbIIozXBnRla2cAvcUJ5+8W2
	rSq1REBJ/9FVAhcyAZDtWRA44AYtbKLWKiPDEgM/gIkIjZCkoVdHVPyJafYjFVMEf8RCQ1uAq0Y
	tNXR4gaec8xqpmvJ9yyB6qbsDVOMJDyyM86FkalO1SwS57nz41DcBhz9Ns7omuu93a5dqT7WupR
	w=
X-Received: by 2002:a05:693c:42d1:b0:36e:c9e5:33aa with SMTP id 5a478bee46e88-376854ba4b9mr5548647eec.13.1794476533548;
        Thu, 12 Nov 2026 01:42:13 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm26300020eec.7.2026.11.12.01.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:42:12 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Florian Westphal <fw@strlen.de>,
	Mat Martineau <martineau@kernel.org>,
	XingWang Xiang <v3rdant.xiang@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net v6] genetlink: Reject joining multicast groups no family owns
Date: Thu, 12 Nov 2026 09:42:05 +0000
Message-Id: <20261112094205.1120090-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
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

genl_bind() checks the GENL_MCAST_CAP_* flags of a group only when a
family owns it. For a group ID that no family owns, it returns 0, so any
user can join it.

A family registered later can get that ID, and the socket stays a member:
nothing checks it again. An unprivileged user can join the free IDs, load
a family module with CTRL_CMD_GETFAMILY, which calls request_module(),
and then receive the notifications of a group with
GENL_MCAST_CAP_NET_ADMIN or GENL_MCAST_CAP_SYS_ADMIN. For example the
drop_monitor "events" group always gets ID 1, and is free until the
drop_monitor module is loaded.

Fix by returning -ENOENT from genl_bind() when no family owns the group.
There are no group flags to check before the family registers, so this
applies to privileged callers too: a program that joins a fixed ID such
as NET_DM_GRP_ALERT before the family is loaded no longer gets its
messages. I don't know of a program that does this. One that resolves
the family first still joins.

bind() takes a mask of groups, and most IDs in it can have no owner. Such
a mask used to work, so keep it working: netlink_bind() skips an ID when
the bind callback returns -ENOENT, and joins the others. Only genl_bind()
returns -ENOENT. A skipped ID is not joined, so it is no longer in the
groups that getsockname() and NETLINK_LIST_MEMBERSHIPS report.
setsockopt() returns the error, as it asks for one group.

This does not cover a family that is unregistered between the check and
the point where the membership bit is set.

Found by the Sashiko review of the gtp multicast group fix. Tested as an
unprivileged user who joins all free IDs, then loads gtp and
drop_monitor:

Before:
  joins: ok=62 EPERM=2
  gtp/gtp (ID 15): member
  NET_DM/events (ID 1): member

After:
  joins: ok=19 ENOENT=43 EPERM=2
  gtp/gtp (ID 15): not member
  NET_DM/events (ID 1): not member
  bind(), an owned group and free IDs: ok, member of the owned group only

genl_bind() was added, with its first capability check, in the commit
in the Fixes tag.

Link: https://lore.kernel.org/netdev/179324692107.3134.14443689892607921337@kernel.org/
Fixes: 4d54cc32112d ("mptcp: avoid lock_fast usage in accept path")
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
v6:
- Drop patch 2 of v5, as Jakub found it too ugly. A family unregistered
  between the check and setting the membership bit is not covered.
- Say that early joins to fixed IDs stop working, also for privileged
  callers, and that NETLINK_LIST_MEMBERSHIPS changes.
- Document the -ENOENT meaning on the bind member.
- Rebase on net/main.

v5: https://lore.kernel.org/netdev/20261104092125.211537-1-anilkaushikwireless@gmail.com/

I used an LLM to help write and review the code, the tests and the
commit message of this patch. I checked and tested every change myself.

 include/linux/netlink.h  | 3 +++
 net/netlink/af_netlink.c | 6 ++++++
 net/netlink/genetlink.c  | 3 ++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/linux/netlink.h b/include/linux/netlink.h
index 882e9c1b6c1d..b4eb873850e7 100644
--- a/include/linux/netlink.h
+++ b/include/linux/netlink.h
@@ -48,6 +48,9 @@ struct netlink_kernel_cfg {
 	unsigned int	groups;
 	unsigned int	flags;
 	void		(*input)(struct sk_buff *skb);
+	/* -ENOENT means no one owns the group: bind() skips it and joins the
+	 * others, setsockopt() returns the error.
+	 */
 	int		(*bind)(struct net *net, int group);
 	void		(*unbind)(struct net *net, int group);
 	void            (*release) (struct sock *sk, unsigned long *groups);
diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 69bb951b5fb8..ee573ba6396d 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -1033,6 +1033,12 @@ static int netlink_bind(struct socket *sock, struct sockaddr_unsized *addr,
 			err = nlk->netlink_bind(net, group + 1);
 			if (!err)
 				continue;
+			/* no one owns this group, still join the others */
+			if (err == -ENOENT) {
+				__clear_bit(group, &groups);
+				err = 0;
+				continue;
+			}
 			netlink_undo_bind(group, groups, sk);
 			return err;
 		}
diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
index 5cc1037d4917..f038f04ef4ea 100644
--- a/net/netlink/genetlink.c
+++ b/net/netlink/genetlink.c
@@ -1825,7 +1825,7 @@ static int genl_bind(struct net *net, int group)
 {
 	const struct genl_family *family;
 	unsigned int id;
-	int ret = 0;
+	int ret = -ENOENT;
 
 	down_read(&cb_lock);
 
@@ -1841,6 +1841,7 @@ static int genl_bind(struct net *net, int group)
 			continue;
 
 		grp = &family->mcgrps[i];
+		ret = 0;
 		if ((grp->flags & GENL_MCAST_CAP_NET_ADMIN) &&
 		    !ns_capable(net->user_ns, CAP_NET_ADMIN))
 			ret = -EPERM;
-- 
2.25.1

