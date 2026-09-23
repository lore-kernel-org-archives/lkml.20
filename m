Received: from mta0.migadu.com (out-134.mta0.migadu.com [91.218.175.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE37417BDE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143578; cv=none; b=Ja+eJP0gqvCpclodTRcCLkgwfSrJWUynKoXFxBJSo+ieY14eZW+vpLhamz7pJ2IT3/5mWV5IxZ/7wss9QsvjEPQxpD5pPLxzyRtqf9fw77HlHDjHBGdz/0FKUTrkQojzFwTJsBjt4hRosajapKc8vrnL9Qr8ZWuncNGTtiF9yDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143578; c=relaxed/simple;
	bh=pilOl5e/3dVl2lca+0EWmcx6Cmwat/rqKsEwX4t7kXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rDKbjsP5ewTQOBmf0Eub8OvPH3annj/emAaSUxpBZH9fxavKg6FAficyFruw+ohbCLSrtCH8g+NsfUVTah7OskqDupkW50tRPMmG3Tqu1DueI2IQD+3UsVsTe9xeIw6zUtZvsDJSt/yeVOwD+A6LYhX8lC13zKi2tgKMzD8ToD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=s8DFRu1l; arc=none smtp.client-ip=91.218.175.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="s8DFRu1l"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pilOl5e/3dVl2lca+0EWmcx6Cmwat/rqKsEwX4t7kXA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790143574; v=1; x=1790748374;
 b=s8DFRu1lamNUpAaWPwA9U9w/fZOuBgV3qd6y0aR7M2c8ZS4zGuOAqcfcUyey1K5cZq/M9XdA
 F2FgMRLQ+gdpj4bCiV55PlAQEWn57cvSUDg0EOcRfgFLV1KBG3jt3MpaA1gOjjwNRhYwxQ5ypYH
 qeA5FlQLEDbI3kcsmi2TFE0Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f7abf9dd7185b6fe;
	Wed, 23 Sep 2026 06:06:04 +0000
X-Mizu-Trace-ID: f7abf9dd7185b6fe
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Tom Herbert <therbert@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 1/2] udp: fix auto-selected port colliding with an existing SO_REUSEPORT socket
Date: Wed, 23 Sep 2026 14:05:44 +0800
Message-ID: <20260923060547.118748-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Observed with two independent servers in the same process:

  fd1 = socket(AF_INET, SOCK_DGRAM, 0);
  setsockopt(fd1, SOL_SOCKET, SO_REUSEPORT, ...);
  bind(fd1, port 0);          /* got 40000 */

  fd2 = socket(AF_INET, SOCK_DGRAM, 0);
  setsockopt(fd2, SOL_SOCKET, SO_REUSEPORT, ...);
  bind(fd2, port 0);          /* got 40000 as well */

Both sockets end up on the same port and join the same reuseport
group, so each of them takes part of the other's datagrams. TCP does
not do this.

udp_lib_lport_inuse() keeps the reuseport rule when it scans for a
free port: a socket with the same uid and SO_REUSEPORT set is not a
conflict, so its port is never marked in the bitmap and the scan can
hand it out again. That rule only makes sense when the user asks for
a specific port.

TCP fixed the same thing in commit 0643ee4fd1b7 ("inet: Fix get port
to handle zero port number with soreuseport set"): reuseport is only
honoured for an explicit port, not during a port scan.

Do the same for UDP. Mark compatible reuseport sockets in the bitmap
during a scan and only skip them when checking a specific port. Using
bitmap to tell the two modes apart is not explicit, but
udp_lib_lport_inuse() already does that for the port match itself.

Note that this still collides when both sockets also have SO_REUSEADDR
set: udp_lib_lport_inuse() skips such a pair before it reaches the
reuseport check, so the port is never marked either. That is not a
common setup and is left as is here.

Fixes: ba418fa357a7 ("soreuseport: UDP/IPv4 implementation")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 net/ipv4/udp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index b3887c42adfd..61cb1e3f5d93 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -147,11 +147,10 @@ static int udp_lib_lport_inuse(struct net *net, __u16 num,
 		    (!sk2->sk_bound_dev_if || !sk->sk_bound_dev_if ||
 		     sk2->sk_bound_dev_if == sk->sk_bound_dev_if) &&
 		    inet_rcv_saddr_equal(sk, sk2, true)) {
-			if (sk2->sk_reuseport && sk->sk_reuseport &&
+			if (!bitmap && sk2->sk_reuseport && sk->sk_reuseport &&
 			    !rcu_access_pointer(sk->sk_reuseport_cb) &&
 			    uid_eq(uid, sk_uid(sk2))) {
-				if (!bitmap)
-					return 0;
+				return 0;
 			} else {
 				if (!bitmap)
 					return 1;
-- 
2.43.0

