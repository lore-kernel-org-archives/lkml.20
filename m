Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD361343882
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791033833; cv=none; b=Gr5iGZWp9zComcLu1Oi/BBSDw5nQeUl122pkIprRc0OPEd8g5QoJmPMALG15BdArPxWiJm18Hb1a1dlgU0QOf8upN/4BqYpCwOFRg404AwuiJV+f9GkqsQ1WR8INL81X5zwvPkCuYHad6lWlmEvb6qCrPlnK/budcGZpwbRGMnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791033833; c=relaxed/simple;
	bh=QKQRz/UKVlDJD7p+wWZ8GxyH5BRlskE+T+4ZQdTPnmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kn39Ourm+Goo9fH8ppsyQIs3roFF/2X/Pif3rQyLIUuoEeDIMR1G/vM4ii0ErRRhp3xINiBCkXOOiUiywsDfGp4tRW+S/xgYqB2uU7Q/oa2stuC9k1k6fEGZhdLgGWwjMv7pMCu/Qg7x6ZyVdwv1AXIcZqDV87I0P5XB8MIjm0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHTe/0wl; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHTe/0wl"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso6325881fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 06:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791033830; x=1791638630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t772w8+UbkoBEiNw/aoRjKIZuva5aJhFhdS9Tdlyi5Y=;
        b=LHTe/0wlr8+1bjtIGIXAtJG8sksT3lKbdw+bl1JTVBLmjHH2DFT19oxSpZqPWFk2K1
         CSqMDPLfOxG9T6cpH+jeNXlyDiWx/V+DrrAYzq6p9pfQFWoAnxSZiGx1HSweLPpbD4xS
         KK39sxSmhKAdWSjXV3ICFTHLLcUKS+p1nFSkk4h8QhXbTb6KRs/Hx9Ik54fvSELOljvW
         ytAHtqro0vBo94bC9Y6ZNkoxL/FFR1C9gXoCXJ99HtwwY4OehK8VAKpZfSW6xZG1IWwJ
         I5XG1yBZi0Q3lziyq+lQp37WYjf00tjcEnDUTjfPEUh4gxR/asKxytiWCzRqt0gNvdlJ
         N2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791033830; x=1791638630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t772w8+UbkoBEiNw/aoRjKIZuva5aJhFhdS9Tdlyi5Y=;
        b=aGbprS/fz4t4AbhjFkb41xh1HYjjB55/GRP1J0T9xnIynWJmTNwYr5nCUJSqalCIcL
         aKGH8scN0LmFbSO1UTXVHJTPAbkJiYS8nOZtskTsfvk9P6ohGWcNgJUEFgJwtDHOBlPt
         ruSp1hJh48jPso+LuvZNH0kLAUFDIT3skJzpLSn4VvCGc/rfZ5k8qoAb2VNoGz6lxkfG
         bQui+3m3A0fE1d2EWqdugFS6DjjVUHLNLQzi4iITZTKvcTAmph5p0HSRKSZUjIcYTWP9
         jj7DudevZY1t3j0P9pBdg52M8xjwuzfthnyM1PGnC9ba+9cXIqzqQWpH0LL10zxWxsyG
         uclg==
X-Forwarded-Encrypted: i=1; AKwUvBy+Qm1WcfTf9Shif24am8EvvnKxMrbHENOvIMZWIB1XqSYcMIqPVsDcw4KQBh40umaSwIb6gwvl047F3PY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgjQQ3B88h/xC92qfQKROf8sDuwuIjH6kJqXPl1yWS74sk5UEm
	6bQrEXE6Hh6RckAZtPZ6BHyS7Oet6tG1ZOyYoOs/wOGzb4KGBqR2JrLK
X-Gm-Gg: AYBFou22TxnJYTWXCGlLHdFODQ+AKoB4GKy3EwiCcuc4/p40vd3Cx96QHGcVJ+ZYcfm
	d28F8bMPQLvCWZQ77Qzx0xW5xQJPWeVjQI4h7Wd5LfHCXNU+ph8iC/Md8EJOC9DCmVQFnFnGUhK
	QWnriL+mZRNEd5i+M1X1OyJ1xm915KsSj8gW5rd6yOLY+ppzmAxbCjksGBW4j3NC0aASDYeMZZn
	WByv8NYG5SJt06+wZpr69l/1KkUP5vCaTuHeV2oxk/dXorIdNnhQ6wJzpuGx5xjR7uevNtdgM//
	Hq5GAqasSw93cb6SvV9V0YvZ5fLWvoSmTWAn3r61Z6DzuBq0Zs60yCmzHdaD2IjEWm4Z4Mo9K/N
	2FyteBnFgLve+muRsazI0u1jyCVLjuOvhRWVfHrDFnx2SxMmef7LKtTelIHwYOv8EIG4Lby+CzS
	/Bx2yseDVqPDkF25gSm3EfRgjDqglQpYul0NGzyMEY8vpLWWFdgXBj0xaY7YKPShMzdy9MfIqA+
	cx518FeEDg+Zc3FAllMUTNltceYFE22PTL2XOHgww==
X-Received: by 2002:a2e:be0a:0:b0:3a9:7d11:a785 with SMTP id 38308e7fff4ca-3a97d11ab62mr429641fa.16.1791033829528;
        Sat, 03 Oct 2026 06:23:49 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.161.1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e304663sm18807311fa.22.2026.10.03.06.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 06:23:48 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] tun: use pskb_may_pull_reason() and remove SKB_DROP_REASON_HDR_TRUNC
Date: Sat,  3 Oct 2026 16:23:39 +0300
Message-ID: <20261003132340.4175269-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tun_get_user() is the only user of SKB_DROP_REASON_HDR_TRUNC. It sets
it when pskb_may_pull() fails to pull the Ethernet header of a frame
written to a TAP device.

pskb_may_pull_reason() reports why the pull failed: PKT_TOO_SMALL if
the packet is shorter than requested, NOMEM if pulling the data into
the linear area fails. Use it for both header pulls in tun_get_user(),
on TAP and on TUN devices, and remove the now unused
SKB_DROP_REASON_HDR_TRUNC. The pull of the IP version byte on a TUN
device with IFF_NO_PI was reported as NOT_SPECIFIED and now reports
PKT_TOO_SMALL, for example when only the virtio-net header is written.

After a successful pull drop_reason is SKB_NOT_DROPPED_YET. The later
error paths without a reason of their own, the unknown IP version on
TUN and the path that finds the queue detached, relied on the
SKB_DROP_REASON_NOT_SPECIFIED initializer. Fall back to
SKB_DROP_REASON_NOT_SPECIFIED at the free_skb label, as vxlan_rcv()
does, so that these paths, and any later one without a reason of its
own, keep reporting it.

The errors returned to user space do not change.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Link: https://lore.kernel.org/netdev/20260923145931.GA2859441@shredder/
Assisted-by: LLM
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
v2:
- Also convert the pull of the IP version byte on TUN devices (Willem).
- Dropped the Reviewed-by tags, as the IFF_TUN conversion is new.

v1: https://lore.kernel.org/netdev/20261001093925.3529772-1-littlesmilingcloud@gmail.com/

 drivers/net/tun.c             | 8 +++++---
 include/net/dropreason-core.h | 7 -------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 5a302709a68a..9fe2dfd173ad 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1908,7 +1908,8 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		if (tun->flags & IFF_NO_PI) {
 			u8 ip_version;
 
-			if (!pskb_may_pull(skb, 1)) {
+			drop_reason = pskb_may_pull_reason(skb, 1);
+			if (drop_reason) {
 				err = -EINVAL;
 				goto drop;
 			}
@@ -1932,9 +1933,9 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		skb->dev = tun->dev;
 		break;
 	case IFF_TAP:
-		if (!pskb_may_pull(skb, ETH_HLEN)) {
+		drop_reason = pskb_may_pull_reason(skb, ETH_HLEN);
+		if (drop_reason) {
 			err = -ENOMEM;
-			drop_reason = SKB_DROP_REASON_HDR_TRUNC;
 			goto drop;
 		}
 		skb->protocol = eth_type_trans(skb, tun->dev);
@@ -2062,6 +2063,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		dev_core_stats_rx_dropped_inc(tun->dev);
 
 free_skb:
+	drop_reason = drop_reason ?: SKB_DROP_REASON_NOT_SPECIFIED;
 	if (!IS_ERR_OR_NULL(skb))
 		kfree_skb_reason(skb, drop_reason);
 
diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 12f909651591..47b44a29daab 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -82,7 +82,6 @@
 	FN(DEV_READY)			\
 	FN(FULL_RING)			\
 	FN(NOMEM)			\
-	FN(HDR_TRUNC)			\
 	FN(TAP_FILTER)			\
 	FN(TAP_TXFILTER)		\
 	FN(ICMP_CSUM)			\
@@ -427,12 +426,6 @@ enum skb_drop_reason {
 	SKB_DROP_REASON_FULL_RING,
 	/** @SKB_DROP_REASON_NOMEM: error due to OOM */
 	SKB_DROP_REASON_NOMEM,
-	/**
-	 * @SKB_DROP_REASON_HDR_TRUNC: failed to trunc/extract the header from
-	 * networking data, e.g., failed to pull the protocol header from
-	 * frags via pskb_may_pull()
-	 */
-	SKB_DROP_REASON_HDR_TRUNC,
 	/**
 	 * @SKB_DROP_REASON_TAP_FILTER: dropped by (ebpf) filter directly attached
 	 * to tun/tap, e.g., via TUNSETFILTEREBPF
-- 
2.47.3

