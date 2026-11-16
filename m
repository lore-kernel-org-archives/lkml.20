Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832847;
	b=qIoY3gPbATbqJOVc9tmxw3QvRTkhuLE1F30SIcLUdWkpji5I/vTuKSUBbCgm916iF/YH
	 8iR8fMdGhV3QJjM9eo2da1b+oxEjYIhUmmbFB2TBERwz5COXC4tCfcCiBaoD0Tjn1IJ9t
	 FY4hb0rReHn94TqsoSEsJu+NOnZOZk3QEyM9gINGHI8fsdmKJDd9sQJt9eiawdIOGHCDv
	 f+8hQEpn90JW1/sKwokFybxjlhzuNjybLzuxSy2D+MMzsJ+jSsubnYp2MdMNLHhORlce4
	 bbzH+JiR+fnZheEXrsZSwka+IAUF3qr1hH4uq9M+YKlQUYt51b0n5OCeSAgzdg1WHQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
	b=GoqNqU6FZ4jk9xJPAQmho1eZsgK53V5PVbN6WripFaPr/zHoit+EpSzXV5L4Uw1v+0yi
	 /nuyXRRAzS+V8x2SgFMspJj0oSI+mD+dU40k7OtzrcvcGTopNE+K9ZxCxX0spOG+PqKmQ
	 9bcQXuqmkM1ACOZMnU5QQAZIE3u1GiXwBoxXj1u4T6BszhcT+XUarP9Diyaw7GeH3d1Pq
	 ocMBfsX/eiURLRDr8ADcR277ixM/Kr8Bku+CTSgAVKrqrkyOkyJPpZZVqro0QQAgx0CIO
	 BxbVOhLfhzvLMoDCZrLTLVq07eGNlzV7rbuf6onYE6u1mnPxXrB7+FbCDpfBXwd9ZKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h/mUxU8i";
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D3F606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D3F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h/mUxU8i
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-847ac7ccd85so2704946a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832846; x=1795437646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=h/mUxU8iT5smy/Nn3/TImjg0PoArS74qd8+QGBliY7Qu+r8ZahiepWhdAe+dWF8FY/
         RsE7FXfC4YyF0zNfa+rJ1fUQ1bg6Tw3KtvLYa47LuoDp7oOmpNRr7n9IB5kqKawpZ1wQ
         7Ewl7FpCFtkRWsB5H6dfXRQt4JWhVYPuNyAQAVc31HEPdH3ONmSIZ7T5yCqxajo1Ky/R
         10rXRQQ0NDgMrvyBZvDw97pz0+Awos07NBYeaN/elymWk+aER6GgjIt37xWKGSyWVcdN
         adJ11onhhPuvH06pPviW885hm7lTGi2gA86v+w6ZLLcToPZz2zaci1bYYlNO2T6lh/SX
         704w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832846; x=1795437646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=S7CTya96CVHUYrFucADXx/IrR2uzAB0BY4JV1MVxZWuWlUu40pvnWIunMtDIwPQrIn
         qhGKFDVFN+3wLf+bZEkMhGDRAS857NLreI1589DPMoYr1vgBtwTdH7gmFGYnHDRJLx2v
         lpjbmQ/xkdafuyhE759o1iljDJmEWOtwHARpf+2PgKOuD8AqBSLrhySfBAa27lQUmFrb
         RU/H/JF4Dfw0LvnYzPtRmGKo0BY0ZMFuK8AUcsKP7+bOOME/dZ4LldP0UmdDDanLTpns
         p8IXlk73Pxn0094g6misoT3j0mrsDivMUxlGdF5g1IxtogsxM39CUQLmChJ/wCwCEWA0
         1MnQ==
X-Forwarded-Encrypted: i=1; AL+hErGFQl1upj7EIFht3n71sj0oRKS7mz5GT4/mWRJ5g3hrZcZtw28JGNGmI+P3cre9lhwudL+rh7YduuPpTGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XXfN5YJl440iEgIUubr0ktBfMf9iqAImtyJUyDE2ifEmPG3bc
	nPfdW3mYb/0COtmZKwIjmEv12uq+eStqHvrgVt4WH2V0/5nvbm5WTvcG
X-Gm-Gg: AYBFou3dKH+/gqyi5QFrQutKKmjYQXDSR7o2hCCECfD8Bteh9V8RCCx14aXQn+5dCnt
	k1jzJkitOwLDGwiyahQkC+6LSDXaYzx5vV9LeJMdDzRn7p4aDujqbAT9uPnYlTqKjlK7QewjvOS
	jC4qmmThgKP53T2s6vXx81Pi47YPOljCuwC8VSt6jGaJID62UVf0QYspd7zjbTWHqjvuX/UkBHg
	0oroteuDiWlJ9RFPPzrtrFJLvhqTAzMFfWlHYYvcbKJU1AcyjwpqueBFMV5hvwm1dRsT2glvJbB
	q0GXGdePBomNxeittqSN+iAUofeil5vCfxebhGi/GYY+wP8vNMtPOi6ThMMQCnBbQ9+HbuimaU0
	FtlfXPJWejv88oUw84D6aS5+assbe90qbpnIHLJdAHpcQootqT72DZy8sidEOA9wV/gYpcf9/sU
	JwQVzhD8mdwZuRgdUVUW08BWeYLsYFM3N16A77z6kMidTcu6U+vsyXwSqaXygTYNW8VDkwKSvRm
	GAdcjil/K9c8WbrYXcv6OhOvPaBnaJ0ZT3zahIzk1kifFcSdHtF8vFB6iITfWI1vRngqInozhsd
	zfQ9rG+z00v8yrZmglgIBEbAXCA8ewlbl/jVvk0H3GVizV4JTskDYGomSNy9CeGW2VeRV1J4GwN
	uLB3JtDn6OFUtMGR08m8G6VWMfmAwBWKOCp85UKKx7Yr6j1Rl/fVz2YIxl92sSE/iDFzoRqTp+w
	==
X-Received: by 2002:a05:6830:2b0e:b0:85f:c55:b0e8 with SMTP id 46e09a7af769-862898287b3mr8933968a34.5.1794832845686;
        Mon, 16 Nov 2026 04:40:45 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c4dd9abesm2830937a34.20.2026.11.16.04.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:40:45 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: [PATCH net v7 1/2] genetlink: Reject joining multicast groups no family owns
Date: Mon, 16 Nov 2026 12:40:29 +0000
Message-Id: <20261116124030.1595567-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116124030.1595567-1-anilkaushikwireless@gmail.com>
References: <20261116124030.1595567-1-anilkaushikwireless@gmail.com>
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
the family first still joins. Say so in the comments on the static
IDs.

bind() takes a mask of groups, and most IDs in it can have no owner. Such
a mask used to work, so keep it working: netlink_bind() skips an ID when
the bind callback returns -ENOENT, and joins the others. Only genl_bind()
returns -ENOENT. A skipped ID is not joined, so it is no longer in the
groups that getsockname() and NETLINK_LIST_MEMBERSHIPS report.
setsockopt() returns the error, as it asks for one group.

This does not cover a family that is unregistered between the check and
the point where the membership bit is set. Hitting it needs a
privileged module unload at the same time, and the capability check
already has the same window.

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
 include/linux/netlink.h          | 3 +++
 include/uapi/linux/net_dropmon.h | 2 ++
 net/netlink/af_netlink.c         | 6 ++++++
 net/netlink/genetlink.c          | 5 ++++-
 4 files changed, 15 insertions(+), 1 deletion(-)

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
diff --git a/include/uapi/linux/net_dropmon.h b/include/uapi/linux/net_dropmon.h
index 87cbef48d4c7..4f2fee982c8a 100644
--- a/include/uapi/linux/net_dropmon.h
+++ b/include/uapi/linux/net_dropmon.h
@@ -58,6 +58,8 @@ enum {
 
 /*
  * Our group identifiers
+ *
+ * The group can be joined only after the NET_DM family is registered.
  */
 #define NET_DM_GRP_ALERT 1
 
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
index 5cc1037d4917..e5d4f3c4e22a 100644
--- a/net/netlink/genetlink.c
+++ b/net/netlink/genetlink.c
@@ -85,6 +85,8 @@ static DEFINE_IDR(genl_fam_idr);
  * cater to that by giving it a static family and group ID.
  * Bit 18 is marked as already used since the PMCRAID driver
  * did the same thing as the VFS quota code (maybe copied?)
+ * These IDs can be joined only after the family that owns them
+ * is registered.
  */
 static unsigned long mc_group_start = 0x3 | BIT(GENL_ID_CTRL) |
 				      BIT(GENL_ID_VFS_DQUOT) |
@@ -1825,7 +1827,7 @@ static int genl_bind(struct net *net, int group)
 {
 	const struct genl_family *family;
 	unsigned int id;
-	int ret = 0;
+	int ret = -ENOENT;
 
 	down_read(&cb_lock);
 
@@ -1841,6 +1843,7 @@ static int genl_bind(struct net *net, int group)
 			continue;
 
 		grp = &family->mcgrps[i];
+		ret = 0;
 		if ((grp->flags & GENL_MCAST_CAP_NET_ADMIN) &&
 		    !ns_capable(net->user_ns, CAP_NET_ADMIN))
 			ret = -EPERM;
-- 
2.25.1

