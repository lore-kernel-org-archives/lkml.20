Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B36F5616B0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092678; cv=none; b=AekJvAnHhosxH+9bFd55DZNCWT9x8gS6b460c1Kb1D9E2Etq7/cN3CjpMxUTbosAVzAfckAZnKDrTP9lBhZnuNX/btKBKt8EJ6mJdfE2sd1kW0hK1SnPOXqm2MJTCW7STaeUyXYwu9wkW7QMIWYDLvyAPb4l7hLCVCNKVa2acFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092678; c=relaxed/simple;
	bh=EjdoWGQVSEH2AHQI7YBfJ+ZVVjimW9SOllviym8xCXo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=My3POJriL4UaS5lJI7/2Te4HhRQJmIMCRGr975R5fH1vI4eE7uK7x1YXoOusWPg5ADN0LfEuVgMixcXchoF4zZY75rXg2U4FrbKUCSU4dFPI7y/RHCAusgwo4zvK4hiXiUe8fkXYE0PbgzAf1G8Obc2NRo1IeJQwZnTdptV+/W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 68MFvl33035256;
	Wed, 23 Sep 2026 00:57:47 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 68MFvllt035253
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 23 Sep 2026 00:57:47 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <db497449-b16b-4a61-9f06-fbbe7a3dcc73@I-love.SAKURA.ne.jp>
Date: Wed, 23 Sep 2026 00:57:44 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: LKML <linux-kernel@vger.kernel.org>
Cc: Matthieu Buffet <matthieu@buffet.re>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] tomoyo: fix socket permission checks
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav413.rs.sakura.ne.jp
X-Virus-Status: clean

This is a squashed patch addressing three problems.

[PATCH 1/3] tomoyo: Enforce connect policy in TCP Fast Open

  Tomoyo restricted TCP connections in 2011 in commit
  059d84dbb389 ("TOMOYO: Add socket operation restriction support.")
  using the socket_connect() LSM hook.

  However, the MSG_FASTOPEN sendmsg() flag was added in 2012 to allow
  combining connect() and the first sendmsg(). Tomoyo was not updated to
  take this into account in its send hook.

  This resulted in a TCP connect policy bypass similar to that reported in
  Landlock in 2024 (see Link below), with the difference that Tomoyo was
  fine when originally merged, and the problem got introduced when adding
  fastopen support, possibly due to lack of synchronization between lsm
  and netdev worlds.

  Add MSG_FASTOPEN handling in Tomoyo's existing send hook.

  Link: https://github.com/landlock-lsm/linux/issues/41
  Link: https://lore.kernel.org/all/20260616201615.275032-1-hexlabsecurity@proton.me/
  Fixes: cf60af03ca4e ("net-tcp: Fast Open client - sendmsg(MSG_FASTOPEN)")
  Cc: stable@kernel.org
  Signed-off-by: Matthieu Buffet <matthieu@buffet.re>
  [penguin-kernel: Modified to use tomoyo_sock_family() in order to exempt
  kernel services. Also, modified not to check sk->sk_protocol because
  conditions to check became too complicated and error prone because of
  the second patch.]

[PATCH 2/3] tomoyo: Handle SMC socket

  During the sashiko's review on the first patch, sashiko pointed out that
  TOMOYO is not checking PF_SMC sockets. If a socket was created using
  socket(PF_SMC, SOCK_STREAM) instead of socket(PF_INET, SOCK_STREAM),
  tomoyo_sock_family() was returning 0 despite PF_SMC sockets can communicate
  like PF_INET socket. Check permissions on PF_SMC sockets, by adding PF_SMC
  to tomoyo_sock_family() and tomoyo_socket_sendmsg_permission().

  Link: https://sashiko.dev/#/patchset/20260619002207.61104-1-matthieu%40buffet.re

[PATCH 3/3] tomoyo: Handle SCTP socket

  During the sashiko's review on the first patch, sashiko pointed out that
  TOMOYO is not checking SCTP sockets. Implement sctp_bind_connect callback,
  using selinux_sctp_bind_connect() as template. Since sctp_bind_connect
  callback receives pointer to "struct sock", update existing socket hooks
  to receive pointer to "struct sock". Also, extend policy profile structure
  because SCTP allows socket(PF_INET, SOCK_SEQPACKET, IPPROTO_SCTP).

  Link: https://sashiko.dev/#/patchset/20260619002207.61104-1-matthieu%40buffet.re

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 security/tomoyo/common.c  |  3 ++
 security/tomoyo/common.h  | 12 +++----
 security/tomoyo/network.c | 52 ++++++++++++++++------------
 security/tomoyo/tomoyo.c  | 73 +++++++++++++++++++++++++++++++++++++--
 security/tomoyo/util.c    |  3 ++
 5 files changed, 112 insertions(+), 31 deletions(-)

diff --git a/security/tomoyo/common.c b/security/tomoyo/common.c
index fdaeaff01fc1..d645a17d7348 100644
--- a/security/tomoyo/common.c
+++ b/security/tomoyo/common.c
@@ -54,6 +54,9 @@ const char * const tomoyo_mac_keywords[TOMOYO_MAX_MAC_INDEX
 	[TOMOYO_MAC_NETWORK_INET_DGRAM_SEND]        = "inet_dgram_send",
 	[TOMOYO_MAC_NETWORK_INET_RAW_BIND]          = "inet_raw_bind",
 	[TOMOYO_MAC_NETWORK_INET_RAW_SEND]          = "inet_raw_send",
+	[TOMOYO_MAC_NETWORK_INET_SEQPACKET_BIND]    = "inet_seqpacket_bind",
+	[TOMOYO_MAC_NETWORK_INET_SEQPACKET_LISTEN]  = "inet_seqpacket_listen",
+	[TOMOYO_MAC_NETWORK_INET_SEQPACKET_CONNECT] = "inet_seqpacket_connect",
 	[TOMOYO_MAC_NETWORK_UNIX_STREAM_BIND]       = "unix_stream_bind",
 	[TOMOYO_MAC_NETWORK_UNIX_STREAM_LISTEN]     = "unix_stream_listen",
 	[TOMOYO_MAC_NETWORK_UNIX_STREAM_CONNECT]    = "unix_stream_connect",
diff --git a/security/tomoyo/common.h b/security/tomoyo/common.h
index d098cf8aae61..6db83be62077 100644
--- a/security/tomoyo/common.h
+++ b/security/tomoyo/common.h
@@ -354,6 +354,9 @@ enum tomoyo_mac_index {
 	TOMOYO_MAC_NETWORK_INET_DGRAM_SEND,
 	TOMOYO_MAC_NETWORK_INET_RAW_BIND,
 	TOMOYO_MAC_NETWORK_INET_RAW_SEND,
+	TOMOYO_MAC_NETWORK_INET_SEQPACKET_BIND,
+	TOMOYO_MAC_NETWORK_INET_SEQPACKET_LISTEN,
+	TOMOYO_MAC_NETWORK_INET_SEQPACKET_CONNECT,
 	TOMOYO_MAC_NETWORK_UNIX_STREAM_BIND,
 	TOMOYO_MAC_NETWORK_UNIX_STREAM_LISTEN,
 	TOMOYO_MAC_NETWORK_UNIX_STREAM_CONNECT,
@@ -1023,13 +1026,10 @@ int tomoyo_path_perm(const u8 operation, const struct path *path,
 		     const char *target);
 __poll_t tomoyo_poll_control(struct file *file, poll_table *wait);
 __poll_t tomoyo_poll_log(struct file *file, poll_table *wait);
-int tomoyo_socket_bind_permission(struct socket *sock, struct sockaddr *addr,
-				  int addr_len);
-int tomoyo_socket_connect_permission(struct socket *sock,
-				     struct sockaddr *addr, int addr_len);
+int tomoyo_socket_bind_permission(struct sock *sk, struct sockaddr *addr, int addr_len);
+int tomoyo_socket_connect_permission(struct sock *sk, struct sockaddr *addr, int addr_len);
 int tomoyo_socket_listen_permission(struct socket *sock);
-int tomoyo_socket_sendmsg_permission(struct socket *sock, struct msghdr *msg,
-				     int size);
+int tomoyo_socket_sendmsg_permission(struct sock *sk, struct msghdr *msg, int size);
 int tomoyo_supervisor(struct tomoyo_request_info *r, const char *fmt, ...)
 	__must_hold_shared(&tomoyo_ss)
 	__printf(2, 3);
diff --git a/security/tomoyo/network.c b/security/tomoyo/network.c
index cfc2a019de1e..938e10613bb5 100644
--- a/security/tomoyo/network.c
+++ b/security/tomoyo/network.c
@@ -152,6 +152,11 @@ static const u8 tomoyo_inet2mac
 		[TOMOYO_NETWORK_BIND]    = TOMOYO_MAC_NETWORK_INET_RAW_BIND,
 		[TOMOYO_NETWORK_SEND]    = TOMOYO_MAC_NETWORK_INET_RAW_SEND,
 	},
+	[SOCK_SEQPACKET] = {
+		[TOMOYO_NETWORK_BIND]    = TOMOYO_MAC_NETWORK_INET_SEQPACKET_BIND,
+		[TOMOYO_NETWORK_LISTEN]  = TOMOYO_MAC_NETWORK_INET_SEQPACKET_LISTEN,
+		[TOMOYO_NETWORK_CONNECT] = TOMOYO_MAC_NETWORK_INET_SEQPACKET_CONNECT,
+	},
 };
 
 /*
@@ -636,6 +641,7 @@ static u8 tomoyo_sock_family(struct sock *sk)
 	switch (family) {
 	case PF_INET:
 	case PF_INET6:
+	case PF_SMC:
 	case PF_UNIX:
 		return family;
 	default:
@@ -680,18 +686,17 @@ int tomoyo_socket_listen_permission(struct socket *sock)
 /**
  * tomoyo_socket_connect_permission - Check permission for setting the remote address of a socket.
  *
- * @sock:     Pointer to "struct socket".
+ * @sk:       Pointer to "struct sock".
  * @addr:     Pointer to "struct sockaddr".
  * @addr_len: Size of @addr.
  *
  * Returns 0 on success, negative value otherwise.
  */
-int tomoyo_socket_connect_permission(struct socket *sock,
-				     struct sockaddr *addr, int addr_len)
+int tomoyo_socket_connect_permission(struct sock *sk, struct sockaddr *addr, int addr_len)
 {
 	struct tomoyo_addr_info address;
-	const u8 family = tomoyo_sock_family(sock->sk);
-	const unsigned int type = sock->type;
+	const u8 family = tomoyo_sock_family(sk);
+	const unsigned int type = sk->sk_type;
 
 	if (!family)
 		return 0;
@@ -710,25 +715,23 @@ int tomoyo_socket_connect_permission(struct socket *sock,
 	}
 	if (family == PF_UNIX)
 		return tomoyo_check_unix_address(addr, addr_len, &address);
-	return tomoyo_check_inet_address(addr, addr_len, sock->sk->sk_protocol,
-					 &address);
+	return tomoyo_check_inet_address(addr, addr_len, sk->sk_protocol, &address);
 }
 
 /**
  * tomoyo_socket_bind_permission - Check permission for setting the local address of a socket.
  *
- * @sock:     Pointer to "struct socket".
+ * @sk:       Pointer to "struct sock".
  * @addr:     Pointer to "struct sockaddr".
  * @addr_len: Size of @addr.
  *
  * Returns 0 on success, negative value otherwise.
  */
-int tomoyo_socket_bind_permission(struct socket *sock, struct sockaddr *addr,
-				  int addr_len)
+int tomoyo_socket_bind_permission(struct sock *sk, struct sockaddr *addr, int addr_len)
 {
 	struct tomoyo_addr_info address;
-	const u8 family = tomoyo_sock_family(sock->sk);
-	const unsigned int type = sock->type;
+	const u8 family = tomoyo_sock_family(sk);
+	const unsigned int type = sk->sk_type;
 
 	if (!family)
 		return 0;
@@ -745,28 +748,33 @@ int tomoyo_socket_bind_permission(struct socket *sock, struct sockaddr *addr,
 	}
 	if (family == PF_UNIX)
 		return tomoyo_check_unix_address(addr, addr_len, &address);
-	return tomoyo_check_inet_address(addr, addr_len, sock->sk->sk_protocol,
-					 &address);
+	return tomoyo_check_inet_address(addr, addr_len, sk->sk_protocol, &address);
 }
 
 /**
  * tomoyo_socket_sendmsg_permission - Check permission for sending a datagram.
  *
- * @sock: Pointer to "struct socket".
+ * @sk:   Pointer to "struct sock".
  * @msg:  Pointer to "struct msghdr".
  * @size: Unused.
  *
  * Returns 0 on success, negative value otherwise.
  */
-int tomoyo_socket_sendmsg_permission(struct socket *sock, struct msghdr *msg,
-				     int size)
+int tomoyo_socket_sendmsg_permission(struct sock *sk, struct msghdr *msg, int size)
 {
 	struct tomoyo_addr_info address;
-	const u8 family = tomoyo_sock_family(sock->sk);
-	const unsigned int type = sock->type;
+	const u8 family = tomoyo_sock_family(sk);
+	const unsigned int type = sk->sk_type;
 
-	if (!msg->msg_name || !family ||
-	    (type != SOCK_DGRAM && type != SOCK_RAW))
+	if (!msg->msg_name || !family)
+		return 0;
+	if ((msg->msg_flags & MSG_FASTOPEN) && type == SOCK_STREAM && family != PF_UNIX) {
+		address.protocol = SOCK_STREAM;
+		address.operation = TOMOYO_NETWORK_CONNECT;
+		return tomoyo_check_inet_address((struct sockaddr *)msg->msg_name,
+						 msg->msg_namelen, 0, &address);
+	}
+	if (type != SOCK_DGRAM && type != SOCK_RAW)
 		return 0;
 	address.protocol = type;
 	address.operation = TOMOYO_NETWORK_SEND;
@@ -776,5 +784,5 @@ int tomoyo_socket_sendmsg_permission(struct socket *sock, struct msghdr *msg,
 						 msg->msg_namelen, &address);
 	return tomoyo_check_inet_address((struct sockaddr *) msg->msg_name,
 					 msg->msg_namelen,
-					 sock->sk->sk_protocol, &address);
+					 sk->sk_protocol, &address);
 }
diff --git a/security/tomoyo/tomoyo.c b/security/tomoyo/tomoyo.c
index c66e02ed8ee3..2968a8ce14e1 100644
--- a/security/tomoyo/tomoyo.c
+++ b/security/tomoyo/tomoyo.c
@@ -8,6 +8,7 @@
 #include <linux/lsm_hooks.h>
 #include <uapi/linux/lsm.h>
 #include "common.h"
+#include <linux/sctp.h>
 
 /**
  * tomoyo_domain - Get "struct tomoyo_domain_info" for current thread.
@@ -468,7 +469,7 @@ static int tomoyo_socket_listen(struct socket *sock, int backlog)
 static int tomoyo_socket_connect(struct socket *sock, struct sockaddr *addr,
 				 int addr_len)
 {
-	return tomoyo_socket_connect_permission(sock, addr, addr_len);
+	return tomoyo_socket_connect_permission(sock->sk, addr, addr_len);
 }
 
 /**
@@ -483,7 +484,7 @@ static int tomoyo_socket_connect(struct socket *sock, struct sockaddr *addr,
 static int tomoyo_socket_bind(struct socket *sock, struct sockaddr *addr,
 			      int addr_len)
 {
-	return tomoyo_socket_bind_permission(sock, addr, addr_len);
+	return tomoyo_socket_bind_permission(sock->sk, addr, addr_len);
 }
 
 /**
@@ -498,7 +499,72 @@ static int tomoyo_socket_bind(struct socket *sock, struct sockaddr *addr,
 static int tomoyo_socket_sendmsg(struct socket *sock, struct msghdr *msg,
 				 int size)
 {
-	return tomoyo_socket_sendmsg_permission(sock, msg, size);
+	return tomoyo_socket_sendmsg_permission(sock->sk, msg, size);
+}
+
+/**
+ * tomoyo_sctp_bind_connect - Check permission for sctp's bind or connext.
+ *
+ * @sk:      Pointer to "struct sock".
+ * @optname: Type of operation.
+ * @address: Pointer to "struct sockaddr".
+ * @addrlen: Size of @address.
+ *
+ * Returns 0 on success, negative value otherwise.
+ */
+static int tomoyo_sctp_bind_connect(struct sock *sk, int optname, struct sockaddr *address,
+				    int addrlen)
+{
+	int len, err, walk_size = 0;
+	void *addr_buf;
+	struct sockaddr *addr;
+
+	/* Process one or more addresses that may be IPv4 or IPv6 */
+	addr_buf = address;
+
+	while (walk_size < addrlen) {
+		if (walk_size + sizeof(sa_family_t) > addrlen)
+			return -EINVAL;
+
+		addr = addr_buf;
+		switch (addr->sa_family) {
+		case AF_INET:
+			len = sizeof(struct sockaddr_in);
+			break;
+		case AF_INET6:
+			len = sizeof(struct sockaddr_in6);
+			break;
+		default:
+			return -EINVAL;
+		}
+		if (walk_size + len > addrlen)
+			return -EINVAL;
+
+		switch (optname) {
+		/* Bind checks */
+		case SCTP_PRIMARY_ADDR:
+		case SCTP_SET_PEER_PRIMARY_ADDR:
+		case SCTP_SOCKOPT_BINDX_ADD:
+			err = tomoyo_socket_bind_permission(sk, addr, len);
+			if (err)
+				return err;
+			break;
+		/* Connect checks */
+		case SCTP_SOCKOPT_CONNECTX:
+		case SCTP_PARAM_SET_PRIMARY:
+		case SCTP_PARAM_ADD_IP:
+		case SCTP_SENDMSG_CONNECT:
+			err = tomoyo_socket_connect_permission(sk, addr, len);
+			if (err)
+				return err;
+			break;
+		}
+
+		addr_buf += len;
+		walk_size += len;
+	}
+
+	return 0;
 }
 
 struct lsm_blob_sizes tomoyo_blob_sizes __ro_after_init = {
@@ -583,6 +649,7 @@ static struct security_hook_list tomoyo_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(socket_connect, tomoyo_socket_connect),
 	LSM_HOOK_INIT(socket_listen, tomoyo_socket_listen),
 	LSM_HOOK_INIT(socket_sendmsg, tomoyo_socket_sendmsg),
+	LSM_HOOK_INIT(sctp_bind_connect, tomoyo_sctp_bind_connect),
 };
 
 /* Lock for GC. */
diff --git a/security/tomoyo/util.c b/security/tomoyo/util.c
index 6799b1122c9d..b27b7036e860 100644
--- a/security/tomoyo/util.c
+++ b/security/tomoyo/util.c
@@ -60,6 +60,9 @@ const u8 tomoyo_index2category[TOMOYO_MAX_MAC_INDEX] = {
 	TOMOYO_MAC_CATEGORY_NETWORK,
 	[TOMOYO_MAC_NETWORK_INET_RAW_SEND]          =
 	TOMOYO_MAC_CATEGORY_NETWORK,
+	[TOMOYO_MAC_NETWORK_INET_SEQPACKET_BIND]    = TOMOYO_MAC_CATEGORY_NETWORK,
+	[TOMOYO_MAC_NETWORK_INET_SEQPACKET_LISTEN]  = TOMOYO_MAC_CATEGORY_NETWORK,
+	[TOMOYO_MAC_NETWORK_INET_SEQPACKET_CONNECT] = TOMOYO_MAC_CATEGORY_NETWORK,
 	[TOMOYO_MAC_NETWORK_UNIX_STREAM_BIND]       =
 	TOMOYO_MAC_CATEGORY_NETWORK,
 	[TOMOYO_MAC_NETWORK_UNIX_STREAM_LISTEN]     =
-- 
2.52.0

