Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67BA36A369
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811598; cv=none; b=iks8XtPWofjMOU/CaQRKsmdmPDfWO+RnKzExhQ4CeGejo7re2EZ2aTfFyQ/EiKEER/jIVrDFxdgA4Z9SbZL0TkiROJ3Q6/Unn/ostbldilIgcSVb8+fGXu5zdKBUvad1o6HRI7roLYCIfs9IwymbI7CCVzN0GzIJKY490SkjPPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811598; c=relaxed/simple;
	bh=tEhgdvR5dXlZ2sBWgNodEMf5jbc63XxHqDMT5EOAe0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d3QGkNURlavLAVB/erkQcvBJQosPl/GmRNsKieCb8E1PNu1vy5QcXd0CE5WSt8N0Hgvsyfr2Rhv4G5kZg5aVDA87e+P/z86905CsLGwDSPPSD5kOA6TdwgLzp8wh1eFswqlJVJ5yfHkqg2c63rYSxi0yxsDlHsYpl3RcaoRWfUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UX4zaLK4; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UX4zaLK4"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so2928039eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791811596; x=1792416396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlpHzIuYQd2oZxIU0NKyhphISYrEiSsYul67utJZnW0=;
        b=UX4zaLK4L5HSbe3GFKB458RNoIuwZrn1Qlf+28Gb+HYNHhVnDiRTqwhHGYdU7qnmoT
         PcL26k05Bh4Joh+cB7RgaWU7EtprABjHjUhZgFkRRoxJxDEttfRErWc4vjORckCA4kAy
         bpd+4WgjEZc1s1wQDKW4vmrjO9OV4a8W+Uf7AYcknZIH6lYZVSL3I3iaIyJwFHwNqKKX
         dqAQFA1zNadP0PUKUd4wnsePKqJeKkbyLtgfwmzYj4epwEBq8zaZgv6NZF9ycF9u2vWo
         3PnZoHvB3ID1f5Cwm4oO41AYviQ5OFVaau2JgW/R4GeYky749DdDWlMB/HUBJtehNarJ
         IYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811596; x=1792416396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LlpHzIuYQd2oZxIU0NKyhphISYrEiSsYul67utJZnW0=;
        b=RdnHedy4c9u7ZZYbmGW25YNpR2ZBy5oynHn6/UgO9B+5ECh0Hsq4oGeJmj/HSmTraF
         FFF31Bx6ytRxq/RfIocRtS3BUwLbgWXVlFSsREYyAiDffo+SnyIBtY6CyTIvFR2fFbbB
         DtV/9lJN/zOiyr4c8+cYqku6efGdg+XrkOeU4URIpJfVCwFT5w9Y/AsWqi/eZdc4U7wT
         T1xZTMdx2i8QuZ/cxw3OQPGSDr+Ue3Vsk2DDd3iJlKRJHSPY/7acA+Nlbhygutmo+BP8
         gbeRo1ydRTLI43Ln8Otey7UNSKgdDnVPOqw05utDqfSNXva2FJkh8PvCbooV1qk58wt+
         1uww==
X-Forwarded-Encrypted: i=1; AKwUvBxaJ7KYPXuMpK9deY0FRKs8JfNjIpUTKYFHFZN8KKw7zpMoC9+N/b9IEgzCuyBKAmTJCVg722YogMt+/Lc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/6uv6Uy8RpTBXq/5PeXmhKcrsEYBvu1MACXOdwazkCgaGeLv1
	jYN7uBXCgDBRHb3BZqZ+CYs84367sDuzI60TC5y/RT+px+WtQo4m8Zpi
X-Gm-Gg: AYBFou02yQSgQv3DUcV8rtS970+wdvP4Fb5goSuoELEq/xtCTW3QKf7JPH/GV6hDLkE
	SQkmWpgklDTG7tam1pI58bvaJ7OgIr/PYvf19vZkXkBZEfxGPVFe+Z3h8kTqaMty4JiapuuU7yv
	7RCrMBAopFm7skfj17I25srz8JMH1w9Ecqz+YpV+CmXUYYpwiKluQ4pLpU0ZZhFCKsze3PyMb/c
	VnVnV5f2t9dIraBo1I3rP3e+9sN+uaVRZ74UQjCC3FUl3ePsEKbQ4CSQ3lIXEgYXdUDlLiSW2Dp
	QHggWiesa/KdU7xzP1L2cVOemthKB56AacmT8LbKCeyuWfMtHoS6/71dy950AFr+Pb/1NT8gCnB
	O+MVkQolLSFLt5U/+tapRM12FJZ3+zl3wOCCYFhxAUOQmiOFZhvpjFq0b8y2HAZDa18Vau1j8BZ
	o2wyRFyoWNu+y7rFdG2ZLp76qlA6ZofZk2jATU0fnpfmYta/VKPsTvASAWGAhQtkNeT0OL2uAeo
	JCrLiOpscYsX//mpsM9vVoULurBmOHnFfF/vLQY9r0H5PyZgCWD2J56ccazIhu4XfsZ+O3ojeiZ
	T/HejbikF9w7XgZE4GtfcXHY/jF3VDQW6mkiR5JYbEEMu+0YB923Esar6oUuI4ur9oedR1z3sty
	6XEvy0O8MT+vlFDX/u9uZUtWRzUHvbXHjFVYnV/kkfz291ixFeC1+aZU64T0yZb8T
X-Received: by 2002:a05:7300:fa15:b0:35b:9851:a896 with SMTP id 5a478bee46e88-35b9851ab64mr1197254eec.10.1791811595645;
        Mon, 12 Oct 2026 06:26:35 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm31467174eec.6.2026.10.12.06.26.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 06:26:35 -0700 (PDT)
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
Subject: [PATCH net-next v3 2/2] selftests/net/packetdrill: cover SO_RCVBUF vs the route window clamp
Date: Mon, 12 Oct 2026 18:56:22 +0530
Message-ID: <20261012132622.48550-3-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012132622.48550-1-jain.sm@gmail.com>
References: <20261012132622.48550-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add packetdrill tests for the interaction between SO_RCVBUF, a user
TCP_WINDOW_CLAMP and the route "window" metric (RTAX_WINDOW) on the SYN:

 - tcp_rcvbuf_before_connect_window.pkt: SO_RCVBUF set before connect()
   must not defeat the route metric; the SYN must advertise the
   route-clamped window and window scale 0.

 - tcp_window_clamp_vs_rcvbuf.pkt: a clamp set with TCP_WINDOW_CLAMP must
   be honoured on the SYN and not be overwritten by a later SO_RCVBUF on
   the still unconnected socket.

 - tcp_fastopen_connect_rcvbuf_window.pkt: with TCP_FASTOPEN_CONNECT the
   SYN is deferred to the first write() while the socket sits in
   TCP_SYN_SENT; SO_RCVBUF applied in that gap must not defeat the route
   metric on the deferred SYN either.

Without the first patch of this series the SYN carried win 65535,
wscale 5 in the first and third cases (the route metric was skipped) and
the SO_RCVBUF-derived window in the second (the user clamp was lost).

The tests are picked up automatically by the packetdrill selftest
Makefile (TEST_PROGS := $(wildcard *.pkt)).

Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
 .../tcp_fastopen_connect_rcvbuf_window.pkt    | 22 +++++++++++++++
 .../tcp_rcvbuf_before_connect_window.pkt      | 27 +++++++++++++++++++
 .../tcp_window_clamp_vs_rcvbuf.pkt            | 24 +++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_fastopen_connect_rcvbuf_window.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rcvbuf_before_connect_window.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_window_clamp_vs_rcvbuf.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_fastopen_connect_rcvbuf_window.pkt b/tools/testing/selftests/net/packetdrill/tcp_fastopen_connect_rcvbuf_window.pkt
new file mode 100644
index 000000000..7892ac566
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_fastopen_connect_rcvbuf_window.pkt
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+// TCP_FASTOPEN_CONNECT defers the SYN until the first write(); between
+// connect() and that write the socket is in TCP_SYN_SENT. SO_RCVBUF applied
+// in that gap must not defeat the route "window" metric on the deferred SYN.
+// optname 30 = TCP_FASTOPEN_CONNECT, 34 = TCP_FASTOPEN_NO_COOKIE on SOL_TCP.
+--ip_version=ipv4
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_fastopen=5
+ip route replace 192.0.2.1 via 192.168.0.1 dev tun0 window 4096`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_TCP, 30, [1], 4) = 0
+   +0 setsockopt(3, SOL_TCP, 34, [1], 4) = 0
+   +0 connect(3, ..., ...) = 0
+   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [1048576], 4) = 0
+   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
+   +0 write(3, ..., 1) = 1
+
+// The deferred SYN (carrying 1 byte of data) must advertise the route
+// clamped window and window scale 0 (not win 65535, wscale 5).
+   +0 > S 0:1(1) win 2920 <mss 1460,sackOK,TS val 0 ecr 0,nop,wscale 0>
diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcvbuf_before_connect_window.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcvbuf_before_connect_window.pkt
new file mode 100644
index 000000000..7ec7f14d8
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rcvbuf_before_connect_window.pkt
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+// Setting SO_RCVBUF before connect() must not defeat the route "window"
+// metric on the SYN.
+//
+// The route to the peer carries "window 4096" (RTAX_WINDOW). With SO_RCVBUF
+// also set before connect(), the SYN the kernel sends must still advertise
+// the small, route-clamped receive window and a window scale of 0 (the
+// window scale option is sent, with a shift of 0).
+//
+// Since commit b025461303d8 ("tcp: update window_clamp when SO_RCVBUF is
+// set"), setsockopt(SO_RCVBUF) wrote tp->window_clamp while the socket was
+// still in TCP_CLOSE. tcp_connect_init() then treated that as a user clamp
+// and skipped RTAX_WINDOW, so the SYN carried win 65535, wscale 5 instead.
+--ip_version=ipv4
+
+`./defaults.sh
+ip route replace 192.0.2.1 via 192.168.0.1 dev tun0 window 4096`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [1048576], 4) = 0
+   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
+   +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
+
+// The SYN must advertise the route-clamped window and window scale 0.
+   +0 > S 0:0(0) win 2920 <mss 1460,sackOK,TS val 0 ecr 0,nop,wscale 0>
+  +.1 < S. 0:0(0) ack 1 win 65535 <mss 1460,nop,wscale 7>
+   +0 > . 1:1(0) ack 1
diff --git a/tools/testing/selftests/net/packetdrill/tcp_window_clamp_vs_rcvbuf.pkt b/tools/testing/selftests/net/packetdrill/tcp_window_clamp_vs_rcvbuf.pkt
new file mode 100644
index 000000000..3d73178df
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_window_clamp_vs_rcvbuf.pkt
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+// A window clamp the user set with setsockopt(TCP_WINDOW_CLAMP) must be
+// honoured on the SYN even when SO_RCVBUF is set afterwards on the still
+// unconnected socket: SO_RCVBUF must not overwrite the user's clamp, and
+// the route "window" metric must not replace it either.
+//
+// TCP_WINDOW_CLAMP is optname 10 on SOL_TCP (this packetdrill build has no
+// symbol for it).
+--ip_version=ipv4
+
+`./defaults.sh
+ip route replace 192.0.2.1 via 192.168.0.1 dev tun0 window 4096`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_TCP, 10, [16384], 4) = 0
+   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [1048576], 4) = 0
+   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
+   +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
+
+// The SYN advertises the user's clamp (win 16060), not the route window
+// (2920) and not the SO_RCVBUF-derived full window.
+   +0 > S 0:0(0) win 16060 <mss 1460,sackOK,TS val 0 ecr 0,nop,wscale 0>
+  +.1 < S. 0:0(0) ack 1 win 65535 <mss 1460,nop,wscale 7>
+   +0 > . 1:1(0) ack 1
-- 
2.43.0

