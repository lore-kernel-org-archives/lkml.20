Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792892838;
	b=OUCJh/pfGx45wc2tqmcjt+A8rl0YyIn8JmrSN7CAIBcE/tSAfonFeTXQ2OVEMNuCpveP
	 biGLymo0V1mFQpIT7vzQT9BBOTT5w5maGE7TUe7jP0veVaJ/z5t6z1o8LH6XA1J8biCyj
	 HChrPPDAC8PPeKGShO5VqqZ2MVuE482BQkvnsgKUufhlcJcPY3X44SIMSP4Wqqhp6LlqB
	 L6vYOTzlNLjLyZIhEHvr7m045xTERjlK2lnZJdEJcU7HnuLmIKs+D9WUE7nsQhGz3Qbcc
	 g81B83q10kEYzVucNQndYRfda0SLT5l/9aFy2hg1ftFJOu2sgwpVtV3xMT5Q3igMBwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792892838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=CqYJudaw98oP5V5GQh9JO5YSPL8zp03ev096osCYM1w=;
	b=TN5n2LASk002oJXy49zKRHtpQ5+O02vc1v2kd9x/Z60+WvBoyQ7y+XIAu7GYxU2lE7Em
	 zy5OYRXs5lpnLwmuypgLmjaZ7cm16sz4+3y/8rlXcyk+UvLXcD+Saj8xWY8gJ1tf3K2yn
	 f8M1YaozsQCamV+nyRMXaPbpJhCpz6PE2pD7lwCHWRBfuRkTMng5YI0YveBuSz3IYjrAL
	 I/M4jay0hhmRidKeFV3ffkPtTe8KRrgXaJIOWHi6atxDieOJJj0N8fX4Su6GmUpRUARXi
	 cpmizt+R7riti/khGp7uALU28jAu35dkKG3ArQZAah/3RZ3mY8JGJYmn702cr/Y7dRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kVQH8sng;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC21606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DC21606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kVQH8sng
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7ce645a1c6aso398697137.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792892837; x=1793497637; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CqYJudaw98oP5V5GQh9JO5YSPL8zp03ev096osCYM1w=;
        b=kVQH8sngGFnZZ1Bc5R7rbJdN6VYoGrSMGNFiosVK4G+fn8WngJ6SgKv7yU/0684/1h
         flfOLQt7GuwgC6AVxfKk8H2+Ny7UKCQG0H4dypBxlfKSyS+9qbXYOaTF2PIf5VJuar74
         VnH7sUdPUmGXHskIMcVYkGh4rLB+5KleTUlvnhtao3THO9H3PgVSBGihOf66/3btVRtq
         agqBignUyIn9qLC56lCqz+BU1C+kBD8d5rKZOXhRbnb7wEnqDS953OOk8W+Y/RzI7B5h
         BndZ4q/ufJQ5WvIHNdhoJ3LPA/iDgFM8bz44sBBa1hOp8VYlpZBKtqwJuGBE0ffhTitJ
         l0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792892837; x=1793497637;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CqYJudaw98oP5V5GQh9JO5YSPL8zp03ev096osCYM1w=;
        b=vaTdtvqn94J/ucb3S/jgzpdb12tcKeMhhUt0TgOprQIEucIopUmvnSExS9XgQinfgM
         Vr0P66cI71FCXHv6XyLBmD3Ygw1OAIjXtXi2h+5INltWHcI2yWudDzLo/jQM86/7FMKV
         pFo7zavjJsIEHoB7j4aEx0dEQ4nhsrgygQDqtl5aznuH8zhkFtz+eWBJZ5MIqBLMuZTn
         LBmW9yzgS1GDBdJi0OIfN+ARIQAFmQmUClxIDy0Jd1PKtgpqhP8msBt7CprLTWE2clWr
         7KL2t71O31JMuBLQLA/WxTEu0BuX+u4Cw4wRUnM8hsxFx9l4XMMwJ+qzgd3mczeesZBh
         X/FA==
X-Forwarded-Encrypted: i=1; AKwUvBw7T9j9rG0m/8DLeTqmD7WcWoXgcffk2LKC6JuuKi0t1osC2cOCUnhkkIg1bCjl6GDURDOYZFF2VTA1Cm0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+9RM6BDTsotRqjsM5wKnG+qM17BMXyaIihRV7IkBA1+XEhwQo
	cI4nYp6Lg+SFP1qymtk9p1r2W3QLPq3msHXC6LtoJUumnDm/FytJYxYM
X-Gm-Gg: AYBFou2bWfnmQQAZ3MKnHd8POonsO4asdZeDHb/VDoksAykFbdsOYaFmoQK5PX4D7Mq
	++h2ygXSYpEjQOuYdm/u2m5ZE2YDp67OipMWg41WAD2cfinGcjhs1zTfWEfs61dXzp0lWUYYb4l
	ebrjjXfNdsoM42dR1p6OpdT5uXzA0mDJAY9i6wTOsuUAlwxmquZLsV96bIhKiZb+Xxzx7lSh/em
	BcA3BniljWtc+heo7GGng3tpgXBGTtwFsQiilHa/T67yLsvR29eBUCWm+j23MGwQtTRovl7LvM7
	wL6nn0heRyvstqKOIU6YHXPMckCdf9+f7ihOpCfe/sI7zDLr1c/MH5dfIFMBrXNUguSrK5RpXbu
	vBtOFMeBY9OC66l08kdUXM1oUV2aGtN5ELXhnyy88Kq3PqO1tVRR7lIrWXV4eas+VVxq4PAETMi
	6N/cQld/Z4AOlsRRsu5MlIEqGpyro60tief6luhbjaxzS26I3hIm13uYKtBjMByzWbdkmOEM4iK
	VvlOWTwLWCxTD/juekBTKJzoV4Md5WBwKUmsEncdaYgf7/g19qBWeZoqsKLYOmpzV5b1Rl3fbxd
	Jnf+ak7locMp2kFrA+Y0oFz6plAkcWIVlQcT2DkzUkfYT2JBZ/o=
X-Received: by 2002:a05:6102:b04:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7ce5ccbfbe8mr1103295137.12.1792892837018;
        Sat, 24 Oct 2026 18:47:17 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([2804:7f0:b101:277b:8118:1af6:d493:fe05])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e6cfb52sm4120593241.2.2026.10.24.18.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 18:47:16 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH wireless] wifi: mac80211: reload eth header after mesh fast
 forward fallback
Date: Sat, 24 Oct 2026 22:47:11 -0300
Message-ID: <179289283170.50420.14882678961393805746@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

ieee80211_rx_mesh_data() sets eth = skb->data and, for unicast frames
that are not for us, first tries ieee80211_rx_mesh_fast_forward().  If
that returns false, the slow path builds the forwarding header from
eth->h_dest and eth->h_source.

ieee80211_rx_mesh_fast_forward() calls skb_linearize() before it looks
at the next hop's TX BA session, and returns false when tid_tx exists
but is not HT_AGG_STATE_OPERATIONAL yet (an ADDBA to the next hop is
still pending).  For a non-linear skb, skb_linearize() goes through
__pskb_pull_tail(), which calls pskb_expand_head() when the paged data
does not fit in the tailroom.  That allocates a new head and frees the
old one, so eth then points into freed memory.

The skb can be non-linear here, for example, for A-MSDU subframes:
ieee80211_amsdu_to_8023s() sets reuse_frag when the driver passes up
head_frag skbs, and __ieee80211_amsdu_copy() then copies only the first
32 + mesh header bytes into a small new head and attaches the rest of
the subframe as page fragments.

The stale eth is then read by ieee80211_fill_mesh_addresses(), which
copies 12 bytes from the freed head into addr3/addr4 of the forwarded
frame.  hdr.addr3 is also passed to mesh_path_error_tx() when no next
hop is found.

Reload eth from skb->data when the fast path declines the frame.  The
slow path already deals with non-linear skbs on its own (skb_cow_head()
and skb_linearize() on fwd_skb, after the addresses have been copied).

Fixes: 8b0f5cb6bc7c ("wifi: mac80211: use mesh header cache to speed up mesh forwarding")
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
Found by code inspection, compile-tested only (W=1 with
CONFIG_MAC80211_MESH=y).  I have not reproduced it at runtime:
mac80211_hwsim hands up linear skbs without head_frag, so reuse_frag
is never set there and skb_linearize() is a no-op on this path.
Hitting it needs a driver that passes up head_frag or paged skbs and a
next hop whose TX BA session for the TID is still being set up.

 net/mac80211/rx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index ecee9348c7..fb49f3974f 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3047,6 +3047,9 @@ ieee80211_rx_mesh_data(struct ieee80211_sub_if_data *sdata, struct sta_info *sta
 	    ieee80211_rx_mesh_fast_forward(sdata, skb, mesh_hdrlen))
 		return RX_QUEUED;
 
+	/* the fast path may have linearized the skb and reallocated its head */
+	eth = (struct ethhdr *)skb->data;
+
 	ieee80211_fill_mesh_addresses(&hdr, &hdr.frame_control,
 				      eth->h_dest, eth->h_source);
 	hdrlen = ieee80211_hdrlen(hdr.frame_control);
