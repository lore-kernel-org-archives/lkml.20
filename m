Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784106;
	b=D3en+H2XCFvgRruhrhTi9wR42gEWCXMy77FhJ4xbCjVDcTmQd+J9Y8i77RK+YkQJHpkp
	 9diToFW2yX32Mamy2eIiUu+spKffeBjMbbcigtOMhYAmHSNARefQ/uO92TO3DLkuFLFTe
	 78DxWIymB6H3XO5UGiw394jAtPSr2aRikL6FAwDHV+ThRtOZiGyZ2j1tat9CEmNly7cAB
	 U9c3pMTgeZjXPuWYxUBgmqLTnEE68hNMOil/xEo2HlWmhOuGGBKZjVvixyQc9lnm46/mu
	 nvLIsVhCtuI59B6RkLzV39ZBDNli3xLgrPMwrQowsV7L1amKTR4Tx8aIPYpIeYa782Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T/AZ7gxbICQBy82Z/aLCx5YwZpMWKUdrGG/VPdsaF5s=;
	b=nx4KARfup+w5BDh7ZG0GBJW9j7zfz/yeXJdiUsaV8ofssUjrZ+YsQyT6TdwjFPX0mM+k
	 F4ifAgePtDvvFI0l28JgpTuctpL3gtR96m5vDUgRNaMrKVCzFpJopbO08gGuAlyqBPxGH
	 h7v/qQqpTOYuMRKohM//GseQlQ8BPxu5mK7MWIL5S2vmn7dbsQvGEC5IOcmUycLnPlr1u
	 bprYpalwA/7la+3ctnLtkUyYu47So0yIoE6mRseuobebKQimCqtvxHAB2CPsTzUBbLHnH
	 AL8yoRKu5Spmr1WARqsxx7u+/0KQtRw8Ixz41AKK0C2gRfzW2awZiRkl7ok+pid6quA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fepx8XML;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E4C606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E4C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fepx8XML
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36d6e342f98so42395eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793784100; x=1794388900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/AZ7gxbICQBy82Z/aLCx5YwZpMWKUdrGG/VPdsaF5s=;
        b=fepx8XML0SaNsiRjtVLibg48wRMIKJRsiEbBjwoiF6B+n02lviTdyXjVzdjKAFFxnL
         ugx5Z6VpS1a+gvrMAhACIzMWHxyvLJgu0T691Qe2Bnb4At4Lu9zi+OFE11ZwcSoqUqYT
         cFMnGPzGCZ81NlyJPB0I6epjB/OdrESX0sXRKqkn3S2TG/M4adKeyGyB47/iFpbXstuq
         mBB64flN6PblrdxokA2fZZDA50SqbC+h/TDhXwihDJVFjY7MFdu8esde8RZn5eQT8V1a
         bjs7GAbh9kfU63MogdJzShsGCLDdv/TU09o/DK2M2XQh1+kx9osqM4tUZBD+bL/rGvBE
         R2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784100; x=1794388900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T/AZ7gxbICQBy82Z/aLCx5YwZpMWKUdrGG/VPdsaF5s=;
        b=1XLX6aUb/gnMNJu0nXLMyeLP1tpsswMQ6p6t6no7JuJOHp/sx6I1vM5N6rsPUyMMBd
         a5wtaa/7GzFxbZFTQHAgMfD3qRYmu2OwNwNWGoEbUQ5tXTdBhw7Q7hGNQFPMA1CGyXyZ
         E075uOdfyBcHtGC5Wg0JwaA5+Z83DkSb4s9zwajDOG4Z33Icsyw5Dq+eWTaFEFf7cU3u
         qDQu6DndZPcD0zqYZLtWPhziSx+/m4piSPjKerKWTpy4y4knaSbLWqPuNlqiN1zO+3YQ
         ZO70+6XQE25fEQ/2zwvlSQeEGMeugsbXCNbFslXmspX35D5QiPPSkmMIcdFRTMTH9hkl
         s7nw==
X-Forwarded-Encrypted: i=1; AKwUvBzDJRPxIzT2Xd5IvaO9lv2mCaxXDYKnQy7a9Hh153581Gax+2zRsLagMuuQaXiqQ57qnNkxu2eDlHEC2Io=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ItXmg6AgFuNQQN1BpNkAVhKdmxFZzkEJN4w9mZRqxVere9ZSW
	k+ZXnpkVwrcGP3doF089XgsiiNKMP1/tHQ7eIZhBNnYbkeU+r9uV1ZVi
X-Gm-Gg: AYBFou2jcG2eA5xQu2L3Rovb6NX7nDF6Au/L3nS9D0nfowRyfEJpmiSKgBXMmR0fHer
	5o4LAgqXO6nMq/bNLmShBaJnhQSvjruR8wuKI/bGyAsFly3dmqvySGAm3/pQgs30AzkTrrPiR35
	5IuF8Bzhw+sZJ3zr1kp0DLD2UKMGTfJYUspCiqzoM1kxn/wQrh6kN0BVZ7HoTvs0owdnobE8RzE
	zmayn+K2VRnsY2KyzDxCeBWxkMe8dnJ5QtD5t+TvxqqH/YGKuu0nrZDzs6ORP3lFDEQweYUSLCh
	AxFDnx4ZQp3U1bWfcQOLviMyaDsJ+cAeVnDg388Xd2RhMlDw60NPvcxAvDufx0vyGYbsHx7BVlL
	SE92qyV8Y1XoIPZrY2xwXmNSFTpIm2zzgQod84cpkqKAvq8GG0OXakdGw/YNJ87UHyHh9UAe5gg
	UvDm910EwLHFRwaj68Dj9nQosoXqXCeysd4K+x/BobgCFVDltxM6mc70RJZGZBZn/sl7StKYmQN
	jSALEtlXdmjlHqEHel+tMnZqcE+xBK4XiuJoyk2tEiWB4wLQ2a6297gFI6uXX1RxULlc8EkhF2Q
	Mn4L65lK0581GFNLo7mGsW+jukK8k4v0uNWfEQO+xdS39FHupN++sSQZw5iMRFuQdffNnnWHJk2
	OTlooG51wCf20vQuylcBj5jqHNUy22uGqyxxmmkBhLvHvSmBE+BT5vvmMogTe1AxAJA3gk0X6Jg
	==
X-Received: by 2002:a05:7022:b059:20b0:1ad:3402:733f with SMTP id a92af1059eb24-1ad3420f9a1mr22983816c88.44.1793784099122;
        Wed, 04 Nov 2026 01:21:39 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b87c4asm6058628c88.3.2026.11.04.01.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:21:38 -0800 (PST)
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
Subject: [PATCH net v5 1/2] genetlink: Reject joining multicast groups no family owns
Date: Wed,  4 Nov 2026 09:21:24 +0000
Message-Id: <20261104092125.211537-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261104092125.211537-1-anilkaushikwireless@gmail.com>
References: <20261104092125.211537-1-anilkaushikwireless@gmail.com>
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
Nothing is ever sent to such a group, so joining it has no use.

bind() takes a mask of groups, and most IDs in it can have no owner. Such
a mask used to work, so keep it working: netlink_bind() skips an ID when
the bind callback returns -ENOENT, and joins the others. Only genl_bind()
returns -ENOENT. A skipped ID is not joined, so it is no longer in the
groups that getsockname() reports. setsockopt() returns the error, as it
asks for one group.

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
 net/netlink/af_netlink.c | 6 ++++++
 net/netlink/genetlink.c  | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index fec2879c497d..94c1390e8dc5 100644
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

