Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E153136729C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789821142; cv=none; b=uFWmqnneFtfxpkqouJRAKmbrBUa+75Sc60SNW8V3zAaKPzDYRtmDxE6JoI4Lc8mxSK0e4JoFuMPSd6SaZntNRvSWj5AZwXGi1iNojYI6cAOmre/6BOgFjD4GQv/m12q+IkPWH+3wLu476sb+AYrZ02Jgupe1L8VoW+gN+L/htUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789821142; c=relaxed/simple;
	bh=ohMLhoHsIhyrQR++saiVhSXMuKOsrbcqrQpd5HS7woc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UlwA81nsuZoydg+UMnLiIw6GySqY3t2ZJlwn5r5v6WUDSG4KTsbmn4U5nInYBqlmunjovJXzErwlzqF4uyYnGpdpoMvy49yBD9540pnmcryDSq4tVrvEz49emNC4+nwS+jljK9YJQai64M3kp8sWI99U+K5LIZ9e6CJ08W8JfpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isec.pl; spf=pass smtp.mailfrom=isec.pl; dkim=pass (2048-bit key) header.d=isec.pl header.i=@isec.pl header.b=VEHKZ/ei; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isec.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isec.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isec.pl header.i=@isec.pl header.b="VEHKZ/ei"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so8317085e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isec.pl; s=google; t=1789821138; x=1790425938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UwlcS9+bFUXKkO5ovoMUYQeBuvELj6Lvx0WboaUWawc=;
        b=VEHKZ/eirlNE3GqF6ljgbufpC1whZ7Ox06fewUk23pQGYZulQ5419SF3E1i+tYTLFt
         IIgeZNUjZR9StsPxqAvhYTMxd4omBw84doRKzizA75mlvt/5nx397opG0u+CtBTK54dZ
         PJRQEZEv6A5OY2PGyBViaxOQ5zey2/zKFt5gdJILTD7LZXggjV48ZjEhsJFVXGbFBKQP
         4LiTcahUy75vtiLr0hv8D+ulJNlXFoIkzQgMqOs/S72ajV13612e2tNNmkrl3mjgKfN7
         1BHcKVTL8CH0G1v2BPpsHKWsYyXPq6PWaMO7xj0CZj2u2cTnp+RMU7RDjSmxxWwAdkDz
         KLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789821138; x=1790425938;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UwlcS9+bFUXKkO5ovoMUYQeBuvELj6Lvx0WboaUWawc=;
        b=E1d9bOgO7+wFEkonWxmQohVgVsxgWyoszMCRX1nhRxhONCUm2g1MqKcLY2zJl+R1nG
         LeafcB6yRdOkdqP+xY8clgEd3L4Hd03/c6ofczPbOlERPfuKAIow483XUhU9PEMV45W4
         tnrWTzjSM92pMSORp7uuL6bJ645XkZnqrYo/8G7OkXIwMDaeeSwiSIUchYX0stGP9/b5
         3LX4goCHdpCew0MYeIXSlvzC+05w5ZZVFcgYQjxZY3iykin/vyeCph/AVsVXK2AvOhgu
         Pkqxkng/KQ+O8NiVE1IchIULMt20B1GEcQK25HzgsbOi6s15VWiDPg7XqNPc4ZiOb03w
         /HcA==
X-Forwarded-Encrypted: i=1; AKwUvByLxvkWQBwl0RPFKpoUdCyXZxiz0KHd0LBz9/z2/IyssRrUsSkbtYfePfrHxZG0vJuHMTXnQvC9H5mXfXg=@vger.kernel.org
X-Gm-Message-State: AFuF++kzuCAKvKavasgu/YGJJB/iJ0CG/aXXPk6TI444UmL9Lpben0Zr
	Dk8rAj6YTdlFelT1iOqlKEv5WA2Dnu4xvi5nRKtJ9xqN1xwQ6RgSAe5YobXWlWahPq8=
X-Gm-Gg: AYBFou2JL16T/ioNcKQP0Mc0brHRwTmJ+MeP5FP758xn8cm7/jp4pukKYWZJlpBgrg3
	48x6sBe3GisJw0nUDB5Kskl1sMXRpx0pAkukIcEegk2v5ANCb8ZAAFkJOneanZ3DPHUe0IyQidO
	IyWxVZ5+R45meL6Y47I5Y33uabZ8VMG9YOQX1hFUZMSP6BqUEFEyz+uyggyd5Pon4DIZNk53M/n
	l6fLjM5DEaW6Z9rtcd6oNJkj8GuFMQNrfBGxiZb/tPUHohAaZ/atuLfIwd5jbnZiV7v5vNj1a76
	NXjpn7mlEk8KXUoMehtIG+Vp3dX178IChWMefF2JN5tXqhDAzEDbxOt1O0h/Bj7qrJMgWbn0kUF
	DyMlYgm07BV/ax7ZvPhK94Htd+eOBCDhfGBgCOpiWGUbqBQM4iw5CIhvFODm77urKnQRVj5x+hW
	KzDCUIBd8ZsBLOOtqmZ/KQQyr98xeGj7XTR5uY36bz4IZad9fqzL3WbWZaPGFvAfIcg9EJ7ZuwC
	NIFolOXwUBOiyl96Ttr2PQqQgqHTXXp088YdX5DQKSdYL0=
X-Received: by 2002:a05:600c:5251:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fc5736898mr67615405e9.23.1789821138247;
        Sat, 19 Sep 2026 05:32:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a318:80b3:9080:dcd8:ca10:f229:8aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd10d21asm88593265e9.12.2026.09.19.05.32.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 05:32:18 -0700 (PDT)
From: =?UTF-8?q?Bart=C5=82omiej=20Dmitruk?= <bartlomiej.dmitruk@isec.pl>
To: Bryan Tan <bryan-bt.tan@broadcom.com>,
	Vishnu Dasa <vishnu.dasa@broadcom.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] vsock/vmci: enforce per-netns mode on the datagram receive path
Date: Sat, 19 Sep 2026 14:31:57 +0200
Message-ID: <20260919123208.29032-2-bartlomiej.dmitruk@isec.pl>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20260919123208.29032-1-bartlomiej.dmitruk@isec.pl>
References: <20260919123208.29032-1-bartlomiej.dmitruk@isec.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The send hook vmci_transport_dgram_allow() refuses datagrams when the socket's
netns is not in global mode (vsock_net_mode_global()), but the receive path
(vmci_transport_recv_dgram_cb() -> vmci_transport_allow_dgram()) did not, so a
socket bound in a non-global (local) netns received datagrams from peers it
could never send to, defeating namespace isolation.

Add the check at the start of the receive decision, before the
VMADDR_CID_HYPERVISOR short-circuit, so the hypervisor CID is covered too
(matching the send side).

This was found by code inspection; I do not have VMCI hardware to test on
(compile-tested only).

Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
Signed-off-by: Bartłomiej Dmitruk <bartlomiej.dmitruk@isec.pl>
Assisted-by: Claude (Anthropic)
---
v2: perform the netns check first (before the hypervisor early return) so
    hypervisor datagrams are also gated in local mode -- the Sashiko AI review
    noted v1 left that path partially bypassed.
v1: https://lore.kernel.org/netdev/20260917220225.56200-1-bartlomiej.dmitruk@isec.pl/

diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
--- a/net/vmw_vsock/vmci_transport.c
+++ b/net/vmw_vsock/vmci_transport.c
@@ -532,6 +532,14 @@
 static bool vmci_transport_allow_dgram(struct vsock_sock *vsock, u32 peer_cid)
 {
 	u64 access;
+
+	/* Enforce the per-netns mode first, symmetrically with the send hook
+	 * vmci_transport_dgram_allow(): a socket in a non-global (local) netns
+	 * must not receive datagrams it could never send (this also covers the
+	 * hypervisor CID).
+	 */
+	if (!vsock_net_mode_global(vsock))
+		return false;
 
 	if (VMADDR_CID_HYPERVISOR == peer_cid)
 		return true;
