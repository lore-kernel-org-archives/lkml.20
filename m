Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087A339EF1C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791696015; cv=none; b=s/8kuhWdWh3dSHIuaycVI9dZ0Z9H0arX1KJSRYaEHL8NvKbDc3IqdryW8DJWkCkKIeolKm+BOYf8a8Lr26pJJT7yOY+L38pGUmpSj+VvrmKYCQmA6qtc39z0ceJSWTIkbp+8dADIrkTW311dyA/eebZEaNLqhJOxc2B00wlcFQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791696015; c=relaxed/simple;
	bh=bhuRVDZTMOB436nF4eXvcwCJSadiKSdjvBeUSiyNDnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LREUEHQL6BnD5IDaTZNDMdAjHwtE4HWAjiP3LzrGoHTU8dNyL430afWH8hzQAiIhul6aC9th/NCbu5CZdqlMrwSJfpaaE/HUIeZgC+L45jie09QuOneFIx93edu5Rax91U3eNwDJBDKzHlhUYnE4AeKYnRedmwfEpl5IYNtgFmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnm4PxNs; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnm4PxNs"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30b6dad2382so2144704eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791696013; x=1792300813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ctWXpXlgsw3kgH8TOKSHZsN3WkOjpDcsKfZdtX1gdg=;
        b=lnm4PxNsy0U27Ex9+uw2sjDLLBagqaAxDx8jZAGBCdX+7gQd+XG5T1R7qOTl+wNvBm
         3XUaYSSQTEOagQ5MU4McQqWkn8uMsiGzJaN80YlzDlxquJFEpD+pXegaUldKFT+Vgltr
         8nVntQl7j2QjsOAnY9NrQKz8xzGncHO5zE2mX7dsEUl8Txz0PfXJZOchIEWl6GXnnMYa
         xLKOJ+KBeDAO0FiBfeiOjwenaoC0n5zDQwZQFFZd5VjJrnNYywRbruEYY5MOgf9BrMdc
         iz04nyWupJHHHfffqXS19n5byBiY9/XiCS7Qwzds/FHsLjOABsoG2lqXEoS5t7bLc8+k
         GjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791696013; x=1792300813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ctWXpXlgsw3kgH8TOKSHZsN3WkOjpDcsKfZdtX1gdg=;
        b=Cv41hejZoxXNmVXTUMwaVDzH2LtGjW37WNAhmI2sOOM5mWxxSNDH9lpvwNiudCp3Lh
         OupP+//tDosrbOgQ67slHBwYnH+C/Qmob84JgtO6BMhhY4vsYdNvpW3+n/z1reBrSosc
         Qf85+uIRzuwyx0WXePRHioXQswmFWawlV4A9IWQ09Br55P6PDfEvydTJ8DNaa4Rf1+w7
         cbSYAnYePX79asQZ5W0h+Q7uzImdRpgZzqDw5NDiVv1xsZ5WBLMoKDQTp7TYzakR2/OD
         KPuHfhwb2/eJORpV2y+2lgyWtylfJo7GOTGKIJWFMtpkQatdOzTBeSip5850pNC9Md3A
         LWuA==
X-Forwarded-Encrypted: i=1; AKwUvByuqkEpOwJRUUMK0STnjD94dhnFN3eW2KaqBxn/aeozNTyEo9ipNc+r7H6kHrR8IA652BZxWC7CABlMXVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYInoQBQY/GPh0aa+NwQgVuxId9/+RfH+mCje3qxOFb3L70JpoBA
	v+hAGLfaKII2mLpczLMUGJfH3fFUYGAqsavk9IlcgXxA96u6RJX+0MpO2uP+IJfb
X-Gm-Gg: AYBFou08qe8pFgCgPXCcgcR2XgXKNenWtwFbF+BDKUBBooe/h5FGoX6MJjhf5VkENAh
	TbuLT9GrSO5MuapNw+sz5wuFYNJPa8eI+JYu2ETup5fq3UE7JSdYx63KQ+h7+nJVA9lIvv5Gesr
	uv/sDGlrdlFSGI0RnK+oDGJZoo1bhEGrKbGujYa1ms366HMO9vjNHgFqT3csGiJVB6SlNgJdNlz
	DPAqfIyP74SLWJOJwGEhLaxZ66dqtyQ/zAvmCkB6HEP9xtuMrm2tkH4oI03zuPofuPBa83C4c/0
	RDtJjvtmuEGHiY2QKDbNFRnlRFgRASF1jOsCYoxp8KnFU8jd8K0QQjXMqmJ7aXkS86ChqqkX7sn
	2mJpSwp4YcN5RT2GmkJZCs1rdZGb0vGH76WzBELWsLOT9AgfE0DOFjuYshw4zFe0HNPldZcDouY
	lZK3kRbyRgeZiTJ2LSwZcnoey8+Daj8avdpJo4dDAHZChB5tuyUhKnFptOH8XrJK3G/cVKsoFcW
	f0QhL8BAxG+ZAJePL8lbdHnnoFbseqae74xgqWMVL/81Ws0I52hMLn2n7pa5cxN9atKl0ljDDem
	L0AImeNxEpi+2mmmOeIzWn3p8+BMB20mbK8ygY+mAAILnRcR2CvLyVFG/XGD0NS25EpiSBX91ZN
	cUPGdNidVFXAe9FHZybdR8K0Ea5O7AA9i7d5yeGmDDnF3A4x5XRjXZ4Q=
X-Received: by 2002:a05:7300:bc9a:b0:346:7c2c:1d25 with SMTP id 5a478bee46e88-3537e27b99dmr13526095eec.41.1791696012402;
        Sat, 10 Oct 2026 22:20:12 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm23269051eec.3.2026.10.10.22.20.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 22:20:11 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tcp: keep the route window metric when SO_RCVBUF is set before connect
Date: Sun, 11 Oct 2026 10:50:06 +0530
Message-ID: <20261011052006.60585-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit b025461303d8 ("tcp: update window_clamp when SO_RCVBUF is
set") SO_RCVBUF sets tp->window_clamp from the new buffer size in every
socket state. For a socket without a connection this has a side
effect. tcp_connect_init() and tcp_openreq_init_rwin() use the window
metric of the route (RTAX_WINDOW, "ip route ... window N") only if
window_clamp is zero. The clamp left behind by SO_RCVBUF makes the
metric ineffective for that socket, or for the connections accepted
on a listener.

Example: two network namespaces connected by a veth pair, "window
4096" on the route to the peer on both sides, SO_RCVBUF set to 1 MiB
before connect():

  v7.3-rc6:                    SYN win 65535, wscale 5
                               TCP_WINDOW_CLAMP 1047128
  with that commit reverted:   SYN win 2920, no window scaling
                               TCP_WINDOW_CLAMP 4096

With SO_RCVBUF set on the listener the SYN-ACK and the clamp of the
accepted socket differ in the same way.

The update is not needed in these states. When the connection is set
up with SOCK_RCVBUF_LOCK set, both functions limit a zero or too
large clamp to tcp_full_space(), which is the value tcp_set_rcvbuf()
computes. Skip the update for sockets in TCP_CLOSE and TCP_LISTEN.

Tested in qemu with the setup above. With the route metric, the SYN
and SYN-ACK windows and TCP_WINDOW_CLAMP are the same as with the
commit above reverted. Without the metric they are the same as before
this change, with and without SO_RCVBUF on either side.

Fixes: b025461303d8 ("tcp: update window_clamp when SO_RCVBUF is set")
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

 net/ipv4/tcp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 87ef6d5cbf..9b6f214411 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1856,6 +1856,14 @@ int tcp_set_rcvlowat(struct sock *sk, int val)
 
 void tcp_set_rcvbuf(struct sock *sk, int val)
 {
+	/* Without a connection there is no clamp to update: it is chosen
+	 * from the route's window metric and the buffer size when the
+	 * connection is set up, see tcp_connect_init() and
+	 * tcp_openreq_init_rwin().
+	 */
+	if ((1 << sk->sk_state) & (TCPF_CLOSE | TCPF_LISTEN))
+		return;
+
 	tcp_set_window_clamp(sk, tcp_win_from_space(sk, val));
 }
 

base-commit: a5ebb76233b79db01e82e061173cb73c6d2b5c6b
-- 
2.43.0

