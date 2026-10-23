Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746942;
	b=qJ7jnqTFD+x8qNyRd9IyrFmjXTx/p2NVC/mQYPFrs67CN0FoufFeUBHcWUJ1fZjkfdJD
	 urwCkruvI52kjTyQq+5Me1FOFtecpIgOD7M0nSMsWlfOXS7AKZ2oAEENwNL4aGcMBlrTU
	 5SYaQYKSE1M8nQ1br1hQ4H04aDH8s2HbedZ2bQp/cq8jwy0QACtXJyozNUrKjddfbi2Wi
	 92+/MfiDB6uNIguqMvKU7mbubev/XuVkJWvLwfkbLlHikgChJze4XQeNRp5VhhJ/wY1Oa
	 TmpYv9gTp0TSOK6oUR7R6QQ8HTIM6bXvvFe/UMf1Amv3Ij/NMYiUTXphU6HPvA0gtyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746942;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oxLJBo5kiejXWGJthd7cBd7kiiHHZ3kDKL/3z8bFmws=;
	b=VOEiwAcdgh9AQRkENNajm/RYbHAlMAjLVrRghZiMlLu5tVL0qJZ4slnDrXjAtHujwYU3
	 ugUtl5cVAaKI+7f5wnxUiIkGTYwm9uXuMkEm3b7Y8tUr78z8znPRqg4UZb4kOm7EiagMX
	 J9Cf8FxL4ehEbWHHiR4zJyQ8TvVMechwLyNr7z1Jzl26o227pmu/Ai9XV+cuWNwyeO/O+
	 mXXTo3p/aU80xvxjlaW6ST3jY8QNkG4bHWUaiyffQl/GKgNIW12zxvn70HgNRxFuzDiRR
	 kAmcjT0Br4yOALAGDz49eIzdxChk2wTB0HLTLh3NACDGet/NYbLdaJh5hAr1tRqAV5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Xa8ID4zr;
	arc=none smtp.remote-ip=95.215.58.58
Received: from mta1.migadu.com (out-58.mta1.migadu.com [95.215.58.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AE9606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7AE9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Xa8ID4zr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rGi6OLiAd6zKc4y/mbTm5VOHf7DVCMJfKD3folF6xio=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792746939; v=1; x=1793351739;
 b=Xa8ID4zrg0/5GVyw52Dt9GIYRZe/5bu93+ZzBLC/f2sl4O3WJabDeCJZY1e7XN+arEd/6bTU
 dP9yN4UX2PYcpaOoNd9SSiMU8lc+Uz5pNQsC5fK8mAJc1gHHb3czNt4HanGSu6edxaalOgIBDqF
 Y3gdECszJfW/pyrykDk175XY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 117f44c2f1bf2234;
	Fri, 23 Oct 2026 09:15:19 +0000
X-Mizu-Trace-ID: 117f44c2f1bf2234
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	stable@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Joel Granados <joel.granados@kernel.org>,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Wyatt Feng <bronzed_45_vested@icloud.com>,
	Yung Chih Su <yuuchihsu@gmail.com>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	Flavio Leitner <fbl@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 2/5] ipv4: fix shift-out-of-bounds in ip_rt_send_redirect()
Date: Fri, 23 Oct 2026 17:13:28 +0800
Message-ID: <20261023091419.167088-3-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023091419.167088-1-jiayuan.chen@linux.dev>
References: <20261023091419.167088-1-jiayuan.chen@linux.dev>
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

ip_rt_redirect_number is the max number of ICMP Redirects we send to one
endpoint; once we hit it we stop. Before that, ip_rt_redirect_load gives
the redirects an exponential backoff:

	if (peer->n_redirects == 0 ||
	    time_after(jiffies,
		       (peer->rate_last +
			(ip_rt_redirect_load << peer->n_redirects)))) {

n_redirects only stops growing when it reaches ip_rt_redirect_number, and
both redirect_number and redirect_load are plain proc_dointvec sysctls
with no upper bound. Set redirect_number past 32 and n_redirects climbs
past 31, so "ip_rt_redirect_load << peer->n_redirects" shifts a 32-bit
int by >= 32 bits, which is UB:

  UBSAN: shift-out-of-bounds in net/ipv4/route.c:949:6
  shift exponent 32 is too large for 32-bit type 'int'
  CPU: 1 UID: 0 PID: 1845 Comm: ping Not tainted 7.3.0-rc7+ #364 PREEMPT
  Call Trace:
   <IRQ>
   dump_stack_lvl+0xc1/0xf0
   dump_stack+0x10/0x20
   __ubsan_handle_shift_out_of_bounds+0x1d1/0x390
   ip_rt_send_redirect.cold+0x2c/0x146
   ip_forward+0x1ddc/0x2430
   ip_rcv+0x2b1/0x320
   __netif_receive_skb_one_core+0x16b/0x1c0
   __netif_receive_skb+0x21/0x150
   process_backlog+0x37e/0x1200
   __napi_poll.constprop.0+0xa5/0x5e0
   net_rx_action+0x4c0/0xf70

Fixing this from the sysctl side would mean bounding both knobs, e.g.
redirect_load to [0, 65535] and redirect_number to [0, 16], which gets
in the way of users who legitimately do not want to cap ICMP redirects.
Instead compute the backoff in u64 with the shift count capped at 31,
which cannot overflow since ip_rt_redirect_load is an int, and clamp the
result to MAX_JIFFY_OFFSET.

The clamp also fixes 32-bit kernels, where the same expression goes
wrong long before the shift count reaches 32. With the default
ip_rt_redirect_load of 20, from n_redirects == 27 on the result is
either truncated or too large for time_after(), which then treats the
deadline as already passed, and from 30 on it is 0, so every forwarded
packet gets a redirect again until ip_rt_redirect_number is reached.
This needs a raised redirect_silence to be reachable, otherwise
n_redirects is reset long before. On 64-bit, ip_rt_redirect_load << 31
stays below MAX_JIFFY_OFFSET, so nothing changes there.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 net/ipv4/route.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 595a3b7f1783..76807b757046 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -907,6 +907,7 @@ void ip_rt_send_redirect(struct sk_buff *skb)
 	struct inet_peer *peer;
 	int log_martians;
 	struct net *net;
+	u64 backoff;
 	int vif;
 
 	rcu_read_lock();
@@ -945,10 +946,10 @@ void ip_rt_send_redirect(struct sk_buff *skb)
 	/* Check for load limit; set rate_last to the latest sent
 	 * redirect.
 	 */
+	backoff = (u64)ip_rt_redirect_load << min(peer->n_redirects, 31U);
+	backoff = min_t(u64, backoff, MAX_JIFFY_OFFSET);
 	if (peer->n_redirects == 0 ||
-	    time_after(jiffies,
-		       (peer->rate_last +
-			(ip_rt_redirect_load << peer->n_redirects)))) {
+	    time_after(jiffies, peer->rate_last + (unsigned long)backoff)) {
 		__be32 gw = rt_nexthop(rt, ip_hdr(skb)->daddr);
 
 		icmp_send(skb, ICMP_REDIRECT, ICMP_REDIR_HOST, gw);
-- 
2.43.0

