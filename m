Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851719;
	b=eKnTlwDiCDUq+u8wyZeCWUnRo5SXvI1c9L1Kp8EwcgR1Dt3lmFkaxxcjhis1bQJF+V/+
	 2w1W5mRFr5RsNQ9Aiy8uYWpWz8tslkIMF8sNVO20X9VfKKHGQ4qJ8lSi4EzCxkZ8gMkva
	 W93meqmc5SA1qCf8CRfG9dKlQyKxqNYo8UJmPfuljRNbn+oJvK9DkET1ScevbuAk0U+YP
	 y2e1+KKAqeW1ejdZnQGAZvgjX3HFAmE7deC0LjlE0WLB5yMeggHgXuxJ5vIr6onfSFP8c
	 0UiJKN7kljaHG5b1uhOh3Y/J7IpDgkV2GVEqhfw76tlA+LvphfhB92etVCvEOwU2BZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RWur7cBDOElebXPJIkWba01iRlyUJjkUdU+D026M7/U=;
	b=oXK6IvkNbUpUuu82o43VKcrNIku7kG5uv2st1n/o8cK+EIlF26ycgJLtxab+XCnFG8p/
	 AA8WssEAng6zIp1nPJRH8O7ed1W2jSC+AKWKBrHhAkvqijD0Zrra4lO5fZNEuwW9IfEq/
	 NGgVXpqKrY7yhCb/BUnWGdyDkAX6+ogjRZQJI5/3vOYGIcVwOv374SrqQ75N5MBhnzHRu
	 y2cv9Zh+Hw+sjnqWyzW3JU3zp1YjQKg1pOFqTPgtaZElW+yGP5pS4Qc6P/3TpZP2CoKt2
	 BPS11gpiU9roo5qI09piconLOUtVyokngTp7jrzB8G4r3OoOklYRP9EDMNoiW22HDGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgcE75qo;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AC4606A88D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66AC4606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgcE75qo
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9495c633eb5so174588185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851716; x=1795456516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RWur7cBDOElebXPJIkWba01iRlyUJjkUdU+D026M7/U=;
        b=GgcE75qoZKVQJQFnhQGIRH2hvnsY333YcZp05pyOL54t4PvAmRebNm7M7D4DwU/qur
         90weKQMC8AHcQVhxD9s04wQgawJSO6ZlAomSfCvq2Sm1glmq4RZCmR2xLZTCBmnhIHKT
         uASoYXHBmzDwESsK8rdHERLyk6iPOqBCeA8y64vQm+JW4gwsWMBfUThXLTwd2NwYZhy5
         X0hiq3GOl+3VKnYw/6TsQdGIJckdq29pDTWFJuH0LgBlgDKr+ya/2+8wvucPPUdv/ZHa
         hN6RoNqBUZTSsFL+APeE3ojHZ5wawx9FnXpUX5QCh9oUsW6dmsyKPa2Dzt0xZ/jZaSKO
         qeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851716; x=1795456516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWur7cBDOElebXPJIkWba01iRlyUJjkUdU+D026M7/U=;
        b=Mwgq6KmwK68HfLWyXkB8LbZIXblYZQwGXIBByoOewEDuG9NT+7RX+mZcxJ8SVFCJj3
         0Qh8OB8qyXSZ0XXLtrUtSKi1BZBY3gvJrwe4kIcjnS6tXaVWW10hPUSode6522eqFxaQ
         c/c9jJ5pftyK6hxrCWsdEu8GmItt7bXc3iwcchl08ewI4cK3wLAOvbO8h/pIkMMi8Kcl
         7wF0hO76sq+Hf8aA1fkDOGydv5YGzA/aHuPrfmQj5+d6KfasanlBbVES3MBWiMXXGh6d
         dAuedgZnk71ZTrJqbo/IySdmb+h8qR2xUxIGrdClMehvoDLn0CLh0mekbMW5hFQaGfx2
         k+bg==
X-Forwarded-Encrypted: i=1; AL+hErEIj1435T3xe5YVM8bOMgxYBo5guvlS0V9gWAXLjOEvrF3YFT9y7uu9qII51DubKcp6QitwcWlmg+qcGSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7lmO+Cqh2ZQqoWxecS0NbQnEWbbQHKyzkc/998KqG49obhfey
	6zSPoSTnQJITs6Hly/DoxVEDnGqFV5z7jSUvi0SMuOM7AP/XbmroHoqW
X-Gm-Gg: AYBFou2sx8oEB8PbPx6CPtu2dIYvEZ48pPfo0W0GzBQuXTLq990bp5/cwPBTpEG32Bh
	7D8X4guc307zanL28W73UWXg8KJLBXH1z2IIFIqBxNsaiWfKz1K3UHtbPSQB1d38DYvgSH9d5Yt
	Tw52csT6AbZWth8JnlzeVSRn5mIKCmGQiQ6q2GBl5KBu4AcOJRR2X2w+qM8nIZ88mOsGSsXZong
	hbwrvV8wAapW3JLOTP0Qpgk5KsxFsVfoFYKb5hqLXzkVZd11MUUK/7BG9pB0FwEERq7J0PCdsOC
	9zrgxG05fglcjoqq75Zb9Q2tueLM7dqYNEqx8wYLzhqvf/NXmuR+7I+FAsIXOxPKA0n/wBUAFav
	bdopJXExBss069P9npvuS7glsFgl38f//jnU1ByBww3httomk3YEX3RpiNp/QY1XfPXT5iqbUKX
	iH5ubHMzYdNxPOSqvoGcqDzHnCVPqDweAdN7xo7k5tmPUglOAOph5XZPKSbyY07SOhZkyzdCnfS
	qFWiPQ+6q2fqKaq/AAo/qZYE5o2vsXKW0TE5pOaTwESSHPfkjhnVdIf2wzTxmyXvzLn0E8lnYpO
	q/IA6Wmhpzd2ExuA8esjvPJcusIgVScpsQRZtebrBrl0qgZGjDRarO4p0f+6qSWwrxoxgLaMVbD
	NlTwkjnL1XcE0dqPVVqIFuPDlRkG0Oqm+WNVrnATWHaLwiW0FY2ZWsSi9
X-Received: by 2002:a05:620a:710c:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-9494b9e114fmr1735275085a.12.1794851716146;
        Mon, 16 Nov 2026 09:55:16 -0800 (PST)
Received: from str-mac-5701 ([2600:383:10c5:608f:b04c:c18a:ec2:dbf9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9497dc91f48sm283670985a.42.2026.11.16.09.55.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 09:55:15 -0800 (PST)
From: Ethan Ferguson <ethanf108@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Ferguson <ethanf108@gmail.com>
Subject: [PATCH net-next v2] net: remove CONFIG_NETDEVICES requirement for SO_BINDTODEVICE and SO_BINDTOIFINDEX
Date: Mon, 16 Nov 2026 12:55:04 -0500
Message-ID: <20261116175504.15295-1-ethanf108@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The SO_BINDTODEVICE and SO_BINDTOIFINDEX sockopts return -ENOPROTOOPT
if CONFIG_NETDEVICES is disabled, but the lo interface still exists.
I believe that these sockopts should not fail on the lo device just
because there are no other net devices.

Signed-off-by: Ethan Ferguson <ethanf108@gmail.com>

---
v2:
- Reverse xmas tree
- Use net-next tree
v1: https://lore.kernel.org/netdev/20261110204524.82341-1-ethanf108@gmail.com/

 net/core/sock.c | 61 ++++++++++++++-----------------------------------
 1 file changed, 17 insertions(+), 44 deletions(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index e529ffeaedb9..4225e0569125 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -635,18 +635,14 @@ EXPORT_SYMBOL(sk_dst_check);
 
 static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
 {
-	int ret = -ENOPROTOOPT;
-#ifdef CONFIG_NETDEVICES
 	struct net *net = sock_net(sk);
 
 	/* Sorry... */
-	ret = -EPERM;
 	if (sk->sk_bound_dev_if && !ns_capable(net->user_ns, CAP_NET_RAW))
-		goto out;
+		return -EPERM;
 
-	ret = -EINVAL;
 	if (ifindex < 0)
-		goto out;
+		return -EINVAL;
 
 	/* Paired with all READ_ONCE() done locklessly. */
 	WRITE_ONCE(sk->sk_bound_dev_if, ifindex);
@@ -655,12 +651,7 @@ static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
 		sk->sk_prot->rehash(sk);
 	sk_dst_reset(sk);
 
-	ret = 0;
-
-out:
-#endif
-
-	return ret;
+	return 0;
 }
 
 int sock_bindtoindex(struct sock *sk, int ifindex, bool lock_sk)
@@ -679,48 +670,40 @@ EXPORT_SYMBOL(sock_bindtoindex);
 
 static int sock_setbindtodevice(struct sock *sk, sockptr_t optval, int optlen)
 {
-	int ret = -ENOPROTOOPT;
-#ifdef CONFIG_NETDEVICES
 	struct net *net = sock_net(sk);
+	struct net_device *dev;
 	char devname[IFNAMSIZ];
-	int index;
+	int ret, index;
 
-	ret = -EINVAL;
 	if (optlen < 0)
-		goto out;
+		return -EINVAL;
 
 	/* Bind this socket to a particular device like "eth0",
 	 * as specified in the passed interface name. If the
 	 * name is "" or the option length is zero the socket
-	 * is not bound.
+	 * is unbound.
 	 */
 	if (optlen > IFNAMSIZ - 1)
 		optlen = IFNAMSIZ - 1;
 	memset(devname, 0, sizeof(devname));
 
-	ret = -EFAULT;
 	if (copy_from_sockptr(devname, optval, optlen))
-		goto out;
+		return -EFAULT;
 
 	index = 0;
 	if (devname[0] != '\0') {
-		struct net_device *dev;
-
 		rcu_read_lock();
 		dev = dev_get_by_name_rcu(net, devname);
 		if (dev)
 			index = dev->ifindex;
 		rcu_read_unlock();
-		ret = -ENODEV;
 		if (!dev)
-			goto out;
+			return -ENODEV;
 	}
 
 	sockopt_lock_sock(sk);
 	ret = sock_bindtoindex_locked(sk, index);
 	sockopt_release_sock(sk);
-out:
-#endif
 
 	return ret;
 }
@@ -728,42 +711,32 @@ static int sock_setbindtodevice(struct sock *sk, sockptr_t optval, int optlen)
 static int sock_getbindtodevice(struct sock *sk, sockptr_t optval,
 				sockptr_t optlen, int len)
 {
-	int ret = -ENOPROTOOPT;
-#ifdef CONFIG_NETDEVICES
-	int bound_dev_if = READ_ONCE(sk->sk_bound_dev_if);
+	int ret, bound_dev_if = READ_ONCE(sk->sk_bound_dev_if);
 	struct net *net = sock_net(sk);
 	char devname[IFNAMSIZ];
 
 	if (bound_dev_if == 0) {
 		len = 0;
-		goto zero;
+		goto copy_len;
 	}
 
-	ret = -EINVAL;
 	if (len < IFNAMSIZ)
-		goto out;
+		return -EINVAL;
 
 	ret = netdev_get_name(net, devname, bound_dev_if);
 	if (ret)
-		goto out;
+		return ret;
 
 	len = strlen(devname) + 1;
 
-	ret = -EFAULT;
 	if (copy_to_sockptr(optval, devname, len))
-		goto out;
+		return -EFAULT;
 
-zero:
-	ret = -EFAULT;
+copy_len:
 	if (copy_to_sockptr(optlen, &len, sizeof(int)))
-		goto out;
-
-	ret = 0;
-
-out:
-#endif
+		return -EFAULT;
 
-	return ret;
+	return 0;
 }
 
 bool sk_mc_loop(const struct sock *sk)

base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
-- 
2.56.1

