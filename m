Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794343540;
	b=cNTW/9+MKGUJHfEC7or2YdoK+g1GjrwooxCnH0dn8+6TFifNFhPdTjF2yk2Y7EST/njI
	 VIUY+9s9H5YYOBXKADH6wBTmXJ6YCI0yubCLyNWpD3acV0Ih/YUgdWaQQbRJYN06Z11Uf
	 NES0mu7hGqwtBckJUI8vvymsq2Zrs2/tvKruEFRONnKY6FAs6ga3HCfh8C5C7cLQHV/k1
	 6t7UtZLc/zCvzbaWm7BwkDq+zcwK1hXDOvtSk9mbqPsy6XNc642GYEC1ALiiyhc79IthG
	 wzCAuBAQyF1H8rpQW8W8t4/AsIJ7RRnUlAOMAiA5bRgwMn1lRnqcpYyeEaJKtl2kIPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QS6tIBWeQpAVCHgZ00Ay33RlDxsOh5tAnN1shI1GpNk=;
	b=FXIPz/wwvHEIDCg3hGsAd9Oqv5bBu8UdCisVidA7oPyDcZNKolyWSsf6cWez9OI/17HB
	 9oIJUFmkQN8hVUcv8zJKfWcBftaVw1ACjUAWrzBeUallbto2q0LbAQ2AVkQqE2DX+SKys
	 6Vhzg+QjHJiQM1va1Glr2mzHY+dI/dkCN0cS81EXHPIZptPjVWaqjjozAuy8su6n7YPsR
	 YTNqq6drOJHOiesZwjoszwDRo4TrRI3iawCcUngMpXRmR+FgQ+Kr5dl1yQ7GkR2PQaODR
	 uRp+dCgwlPD0yhQwleAmrfHqoHPaAfA0V6w1XlWR/5Vgv6cJxFmcSOx05TFuUEJlKSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jd/wTADe";
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F2F606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F2F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jd/wTADe
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e63ee7b4cso220625685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794343539; x=1794948339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QS6tIBWeQpAVCHgZ00Ay33RlDxsOh5tAnN1shI1GpNk=;
        b=jd/wTADe/IxW5y1Tu8cRX8JzyYPR6XEB6pfxYXD5Zw+BxBSCBuHXoD+f+7/DcNfeVd
         7vQI5eYY++AeurZGed9B4uWy9AB3AkxtPCFei4RYAKcN3/jNPvsqi/YmCysThDqXgq1p
         mF5oIvMenr+c2GTJfYFo/JSgvif83Ss3xwM1lCcZZoTZBKP6vyChtY/KiF0+Vd0wn/ok
         B+vwvt3mBnEvSpN6PMOeFB8EY6d9O/Cnor+cTjAGoxb1LV4+AUAJezS1Wkl8rTY+R5CQ
         vbQGncEwFBUuEUJJeI0IosgrEKsRXgruvnRaBI33+iJbM1lMGOvFQhNuDSrrBXIC9C8o
         4cBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343539; x=1794948339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QS6tIBWeQpAVCHgZ00Ay33RlDxsOh5tAnN1shI1GpNk=;
        b=LYBKV79iD7Sv8Sdcj7N+RCMVYkn76q4aw7lH8L/h9hY3VM8S45yEVz454Fcm3synTK
         ZbUXprXkazKk4rALe3aNj+axH8kRQ7kojQOQ7CCk4vQ0tdiVExQ1HlvvH39SF3BeaLYW
         BdQFZLj0Ud8nhJYbsMkNjFCwec6fXbd3B7f8vCnpM6An4Kkop9JrWo+eG5KYUh8VuRHq
         J54SIffTeNGCViMJJ+Kx5sqqf5Ri9AHL3So9aw/80q0kQKUui2rpqFAX2KN0Q/r6RZPD
         P2HYGWH+EkSOUkF5uX4z8HFtqSsCDGnLXnNM+lVXa6hKv+w8Rr3YzgVEJGSdQ3oRI65s
         rr7g==
X-Forwarded-Encrypted: i=1; AL+hErHyroHxRizxm8bFQ/9BoVz0SDAm9/0juIxIqgLBEgR5g1jYBlylUwwjzPF8KBkN9UB4kPOjOSqRc6mBE8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+coz2F0cuiL8Xo5aY4nRfdXm1aNllB4pt3DrzY4nb5V1jQbhJw
	4CImhcH6Y7Cm6OK72QDS6oQdVO7PCVZnQbEnKETkt9UXh0RSVUBQ3Rue
X-Gm-Gg: AYBFou2csVUeghIbgBEbh/+AouhZU5LgLXMCpBM9Jr3NWiGmQgToIT0C6Q9NxUwPwZW
	ZsjN51SkGUhD3uisH3S1xcDVyB8G4JDM5A8ozMXiMwyd56/7Ji6IPLIFdj5o2IpjoAE1yY/+FS9
	LWpkAJUZrc22q87A9cHFeia23wQMG+z4tm/H64nQuYS7tYt52983s2cLQX/RptwCatButwRNTI8
	OHWtXdQIeRH9r5ofDdNFSU4FbCuBc2TxFi5U9KPPA3/BWK/ehBxLNxg+vXwyLd9KWF3AoZ5DRWY
	gQPCNgRs2BHrpjZSE9vP/qRpbciuxlU8NUfvSHjFOD0EEKE3BWQ93jx08DnEi1C3d4GHKCl57+K
	TaSbOCkUndiR83/U/qF71V+CXTCpT/tv6KbL3JP17b3gwDIsKA4vY2llg5dmCDAf+oYDAq/fFTp
	Bou6qZ24iCp3HXlyVwsUekQ2b/4FXIkq7TKvCXH/oBgqjQOc2N3jnNabyjOJQGzESiw8mwoYiX7
	Wxt5NXySe9z45dQwofsq4x7pSsDhc0L9t5x9YG6rvlLg8KJRa0ZhH0rCyqVCfLDPJZSR4u33rJ2
	4kmOUzvj4TLek/3vzbLglp7amIYCxmxftS3XR3ih9l4NJiJeu0Km4OQYxWfZ3tFZU0amNG//L/Z
	SLaebNd3ANu+Sdn7xCTzl7rq5SUGLT3eDo0iW4bCtN0YdLs0=
X-Received: by 2002:a05:620a:1b94:b0:947:832b:5527 with SMTP id af79cd13be357-947b003f9b6mr20573885a.42.1794343538943;
        Tue, 10 Nov 2026 12:45:38 -0800 (PST)
Received: from localhost.localdomain ([2601:140:9000:ea70:4d94:8f0c:83a0:5c76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f02fcc4b7sm5204076d6.44.2026.11.10.12.45.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 12:45:38 -0800 (PST)
From: Ethan Ferguson <ethanf108@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Ferguson <ethanf108@gmail.com>
Subject: [PATCH] net: remove CONFIG_NETDEVICES requirement for SO_BINDTODEVICE and SO_BINDTOIFINDEX
Date: Tue, 10 Nov 2026 15:45:24 -0500
Message-ID: <20261110204524.82341-1-ethanf108@gmail.com>
X-Mailer: git-send-email 2.54.0
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
if CONFIG_NETDEVICES is disabled, even if the lo interface exists. I
believe it would be prudent to allow for valid bindings even if
CONFIG_NETDEVICES were disabled, as an error here would be inconsistent.

Signed-off-by: Ethan Ferguson <ethanf108@gmail.com>

---
 net/core/sock.c | 56 +++++++++++++------------------------------------
 1 file changed, 15 insertions(+), 41 deletions(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index e8551df8330f..d2da59700ecf 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -634,18 +634,14 @@ EXPORT_SYMBOL(sk_dst_check);
 
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
@@ -654,12 +650,7 @@ static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
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
@@ -678,15 +669,12 @@ EXPORT_SYMBOL(sock_bindtoindex);
 
 static int sock_setbindtodevice(struct sock *sk, sockptr_t optval, int optlen)
 {
-	int ret = -ENOPROTOOPT;
-#ifdef CONFIG_NETDEVICES
+	int ret, index;
 	struct net *net = sock_net(sk);
 	char devname[IFNAMSIZ];
-	int index;
 
-	ret = -EINVAL;
 	if (optlen < 0)
-		goto out;
+		return -EINVAL;
 
 	/* Bind this socket to a particular device like "eth0",
 	 * as specified in the passed interface name. If the
@@ -697,9 +685,8 @@ static int sock_setbindtodevice(struct sock *sk, sockptr_t optval, int optlen)
 		optlen = IFNAMSIZ - 1;
 	memset(devname, 0, sizeof(devname));
 
-	ret = -EFAULT;
 	if (copy_from_sockptr(devname, optval, optlen))
-		goto out;
+		return -EFAULT;
 
 	index = 0;
 	if (devname[0] != '\0') {
@@ -710,16 +697,13 @@ static int sock_setbindtodevice(struct sock *sk, sockptr_t optval, int optlen)
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
@@ -727,42 +711,32 @@ static int sock_setbindtodevice(struct sock *sk, sockptr_t optval, int optlen)
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
-- 
2.56.0

