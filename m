Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598251;
	b=mD/SFeQZTOiU9vlkcfM5VZ/jc4PrBZGjndUx4bL/oJwYYURynHFaq+XWSeGfOgUMplyo
	 Ldb16xqWV/j6JK7w5KRSk685hFE34fWZUlQKuSoArqart1kdcHcwua7erO+nn7UysNZoi
	 GSMW5A/YCprNUeyZNrTf80f1uV8FVB6a30+S7Su7h2fQPJAskyaHOCJ5lTmx2PAG6pu4Z
	 IEYfRs/XmIEHHpAsCkdlMKh/sPTv/0sYdV98mqKP6t9nIPKV0EuURM0ZSmuyrjrHNIl+y
	 In5RJaNV9gPafSUNURae36CVRCVLhKBOAdKLpZiyfFWN9uUNPNyrM+UdJAjD0OiU+Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kCobd/8H3lrFs7IumGAQuCM1Z0bCRM4WKAmi0UDfGjE=;
	b=bZ/VmSOy66/TT7vef7dT1WM58FssalqBoOHn+0UmEAolQUnYfyU6w5xyv+R79M4d7IJ1
	 NMX1b0POtNcr8SX77tSXb8w973VYD+LHV31aoFOFnf1h9o2RYfM58d6P559UsYcMHlDiF
	 /r/s7tzpAyPNYNyaSs7tELXYSFrZN+/3mGi34PSsDq3VuMldhK5UBLYOWVMu1RWS6bXLE
	 Bm4f/y4ZL9aN44sDN4TR5X6H7Gpy2GzI2yQQyO96GWJLJ1KsioT0JwEK0GpSxcmoPN1gk
	 dzl8+bdYdTv6qDU9+hI+hFcJD9SXXYTeVg9U70aC9Bzg5sVp6tLxf2e4bcH1SPY+Qog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZoyPgIyS;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA39606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DA39606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZoyPgIyS
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so1099887c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792598250; x=1793203050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kCobd/8H3lrFs7IumGAQuCM1Z0bCRM4WKAmi0UDfGjE=;
        b=ZoyPgIySKKttOPWukmox/vp1dMf5qdgTCDnWQIzCfKSmZIl6beMJUbXYwKBr1tT4BK
         A/9Dj+FVE1WqAelpN8p3nhoo5wPvUkt7tpNlolDE/pCcu3OcWyZSCODEh580evBowYNx
         lPRQIjb3ZE7oZ1Mp/UPsAffsmjp/nS7Ab1K/Zs/S3aLg+ZmD4WfEEhjyY3jfDFa6r9ie
         g09dHsCPea/uP91RXapXwL0AaCvsXCQW741gp7I3krn3iR/jmFfDlybkWfFAjzH83oSz
         EJPbvYNCTj+eApbkyaRSh0NMSd89BG5/jUOfNGyd1dKnQH15stqONzA41SUSsDCmqu0l
         n+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598250; x=1793203050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kCobd/8H3lrFs7IumGAQuCM1Z0bCRM4WKAmi0UDfGjE=;
        b=eFOE7y2jH98C0H9ARG1oovlI5JXtfwaSmrGWJlpnh0HK4uHHVVZwuguCP/GjXR6zNq
         gWwx52JTsvyH8LHwwkMPf5obyTvuoMIYXnTgjz9Jum8wZI3iGVv7A9IKXBQSwM0LkPNi
         xPBnBxJEXRe7jOwkOZlF27IfM0EQrZEdiriqfqa4p/fMxcJ3SgWbLw6k5iKUpFw/MWO5
         ATzL/BxIaNHPCXP/LL1a3YeL4QtTITFAF85oW/dLlb8LGGhD2iPYlrX80JcXR68j0LBy
         g46Jighfqb1x0/pYmK3FH8BUZIkYqm+tjgm8FkeoJl2tnQGzqkO4hAj+YPhtV0OKMOG0
         SHJg==
X-Forwarded-Encrypted: i=1; AKwUvByrU/k9Xf2b9Jw0uM4fcfJgyAY4a4DKWnfgyM7m4BW9TQ50B+HZrB2KDipktcHqQCAMYYjjRXSW3gFv15E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLurI2lvPJ6evLHECWpn7N7SMbTNXvjRvaA07lwV1FBFZeCrVaw
	NDRfEtHrbhn/E3Pz/Yk2brcGiu89mrWpFA8tGzxr6pTxyWQIrZ/GKVB2
X-Gm-Gg: AYBFou2HtprE+kQaxAhodFg1C1rMPyK6+3WndOCMqk9hsMt0VXkCZdansUIeDXckchP
	EX5sSsheSjOA5WN/eqy1qwpwsaJIejIYOiCfUvTOyJsN/2G+DhEI0NqRTa0HeU4iMv00NmUT476
	sJa0jrwwoNwz7HRpQvf0L7Z6PS/vVVTtWMbPblrpiK7cmCLQx7V/dn57s+P7qbWE2FybLEcfOl8
	j1/BIc0HAHjYBYYKWJ+j6gaCnshBbZ8csH4Kf/+oW6FuTQAci1/pAx+/lZLgi9FUs/XLwIpoDxf
	ty48Gz/wnWFRxfi6LRErbkFe5G7yWWFw1vRATTTzESzHVvl9BpDNUFTkqaHTRxLbP6octKIxUF5
	LnmvU6coC99gsvs71AYYkC1VgQnCwCezb84f+gfhrc9UMgU7YtVY5jCqsW/ML3RdSMoyiFFving
	jeVpHZZpONRiwq0Lz5fUCk9VWOuISV7+tnSCqfkvN+A4l8sXfbjeyQ8ncy8as93nuSh8B0zMMmH
	oxbq3mTI4ZH52d8yBOjihLZ2VCnBT4hdgzqJDmR1PfDkUPkFtJ6St4aw8O80vAL9qKMObJN5XLj
	YMXdkpEEJqwokOY1pMagmjcZHiSNjxT5la3KU5kRqX9uzAOeehixnr0xYvdLZVdldzBhqlQFpP7
	kD/H9w2oCZs4MDU345My2HtsV93IihFJb9oOU5Xy68zuMwpMWdWKU/zJK93OWxUnqOS8a5LMpEB
	MIrBDwBBd3OYd27EGLDnq40lBCefRUlP2fyVQ=
X-Received: by 2002:a05:701b:2919:b0:160:90a3:ca8c with SMTP id a92af1059eb24-190a44718b4mr2920705c88.7.1792598249202;
        Wed, 21 Oct 2026 08:57:29 -0700 (PDT)
Received: from FT6N242TWK ([223.181.118.44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm12350080eec.24.2026.10.21.08.57.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 08:57:28 -0700 (PDT)
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
Subject: [PATCH net-next v4 2/2] selftests/net/packetdrill: cover SO_RCVBUF vs the route window clamp
Date: Wed, 21 Oct 2026 21:27:15 +0530
Message-ID: <20261021155715.30094-3-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021155715.30094-1-jain.sm@gmail.com>
References: <20261021155715.30094-1-jain.sm@gmail.com>
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

Add packetdrill tests for the interaction between SO_RCVBUF, a user
TCP_WINDOW_CLAMP and the route "window" metric (RTAX_WINDOW).

Active open, checked on the SYN:

 - tcp_rcvbuf_before_connect_window.pkt: SO_RCVBUF set before connect()
   must not defeat the route metric.

 - tcp_window_clamp_vs_rcvbuf.pkt: a clamp set with TCP_WINDOW_CLAMP must
   not be overwritten by a later SO_RCVBUF on the unconnected socket.

 - tcp_window_clamp_reset_rcvbuf.pkt: TCP_WINDOW_CLAMP=0 removes the
   user's clamp, so a later SO_RCVBUF must again not defeat the route
   metric.

 - tcp_fastopen_connect_rcvbuf_window.pkt: with TCP_FASTOPEN_CONNECT the
   SYN is deferred to the first write() while the socket sits in
   TCP_SYN_SENT; SO_RCVBUF applied in that gap must not defeat the route
   metric either.

Passive open, checked on the SYN-ACK and on the child:

 - tcp_rcvbuf_listener_window.pkt: SO_RCVBUF on the listener must not
   defeat the route metric.

 - tcp_window_clamp_vs_rcvbuf_listener.pkt: TCP_WINDOW_CLAMP and then
   SO_RCVBUF on the listener; the SYN-ACK must use the user's clamp.

 - tcp_syncookies_rcvbuf_window_ip4.pkt and its _ip6 twin: with
   net.ipv4.tcp_syncookies=2, the child created from the cookie must use
   the window scale the SYN-ACK advertised (tcpi_rcv_wscale).

Established socket:

 - tcp_window_clamp_rcvbuf_raise.pkt: after tcp_init_buffer_space()
   lowered window_clamp, a larger SO_RCVBUF must raise it again, up to
   the value set with TCP_WINDOW_CLAMP and not beyond.

All nine tests fail without the previous patch and pass with it. They
are picked up by the packetdrill selftest Makefile
(TEST_PROGS := $(wildcard *.pkt)).

Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
v4:
 - symbolic TCP_FASTOPEN_CONNECT / TCP_FASTOPEN_NO_COOKIE
 - new: listener (SYN-ACK) tests, SYN cookie tests for IPv4 and IPv6,
   TCP_WINDOW_CLAMP=0 reset test, SO_RCVBUF raise test

 .../tcp_fastopen_connect_rcvbuf_window.pkt    | 21 +++++++++++++++
 .../tcp_rcvbuf_before_connect_window.pkt      | 27 +++++++++++++++++++
 .../tcp_rcvbuf_listener_window.pkt            | 20 ++++++++++++++
 .../tcp_syncookies_rcvbuf_window_ip4.pkt      | 22 +++++++++++++++
 .../tcp_syncookies_rcvbuf_window_ip6.pkt      | 22 +++++++++++++++
 .../tcp_window_clamp_rcvbuf_raise.pkt         | 27 +++++++++++++++++++
 .../tcp_window_clamp_reset_rcvbuf.pkt         | 22 +++++++++++++++
 .../tcp_window_clamp_vs_rcvbuf.pkt            | 23 ++++++++++++++++
 .../tcp_window_clamp_vs_rcvbuf_listener.pkt   | 25 +++++++++++++++++
 9 files changed, 209 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_fastopen_connect_rcvbuf_window.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rcvbuf_before_connect_window.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rcvbuf_listener_window.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_syncookies_rcvbuf_window_ip4.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_syncookies_rcvbuf_window_ip6.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_window_clamp_rcvbuf_raise.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_window_clamp_reset_rcvbuf.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_window_clamp_vs_rcvbuf.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_window_clamp_vs_rcvbuf_listener.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_fastopen_connect_rcvbuf_window.pkt b/tools/testing/selftests/net/packetdrill/tcp_fastopen_connect_rcvbuf_window.pkt
new file mode 100644
index 00000000000..b297294ed16
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_fastopen_connect_rcvbuf_window.pkt
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+// TCP_FASTOPEN_CONNECT defers the SYN until the first write(); between
+// connect() and that write the socket is in TCP_SYN_SENT. SO_RCVBUF applied
+// in that gap must not defeat the route "window" metric on the deferred SYN.
+--ip_version=ipv4
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_fastopen=5
+ip route replace 192.0.2.1 via 192.168.0.1 dev tun0 window 4096`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_TCP, TCP_FASTOPEN_CONNECT, [1], 4) = 0
+   +0 setsockopt(3, SOL_TCP, TCP_FASTOPEN_NO_COOKIE, [1], 4) = 0
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
index 00000000000..7ec7f14d8e8
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
diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcvbuf_listener_window.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcvbuf_listener_window.pkt
new file mode 100644
index 00000000000..ed20a75fa9a
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rcvbuf_listener_window.pkt
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+// Passive side: SO_RCVBUF set on a listener must not defeat the route
+// "window" metric on the SYN-ACK, and the child must use the window scale
+// that the SYN-ACK advertised.
+--ip_version=ipv4
+
+`./defaults.sh
+ip route replace 192.0.2.1 via 192.168.0.1 dev tun0 window 4096`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [1048576], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+   +0 < S 0:0(0) win 65535 <mss 1460,sackOK,TS val 100 ecr 0,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 win 2896 <mss 1460,sackOK,TS val 100 ecr 100,nop,wscale 0>
+ +.01 < . 1:1(0) ack 1 win 514 <nop,nop,TS val 110 ecr 100>
+   +0 accept(3, ..., ...) = 4
+   +0 %{ assert tcpi_rcv_wscale == 0, tcpi_rcv_wscale }%
diff --git a/tools/testing/selftests/net/packetdrill/tcp_syncookies_rcvbuf_window_ip4.pkt b/tools/testing/selftests/net/packetdrill/tcp_syncookies_rcvbuf_window_ip4.pkt
new file mode 100644
index 00000000000..e26f78704ab
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_syncookies_rcvbuf_window_ip4.pkt
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+// SYN cookies: the child built by cookie_v4_check() must use the same
+// window clamp rule as the SYN-ACK. With SO_RCVBUF set on the listener and
+// a route "window" metric, the SYN-ACK advertises window scale 0, so the
+// child must use a receive window scale of 0 too.
+--ip_version=ipv4
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_syncookies=2
+ip route replace 192.0.2.1 via 192.168.0.1 dev tun0 window 4096`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [1048576], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+
+   +0 < S 0:0(0) win 65535 <mss 1460,sackOK,TS val 100 ecr 0,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 win 2896 <mss 1460,sackOK,TS val 4000 ecr 100,nop,wscale 0>
+ +.01 < . 1:1(0) ack 1 win 514 <nop,nop,TS val 110 ecr 4000>
+   +0 accept(3, ..., ...) = 4
+   +0 %{ assert tcpi_rcv_wscale == 0, tcpi_rcv_wscale }%
diff --git a/tools/testing/selftests/net/packetdrill/tcp_syncookies_rcvbuf_window_ip6.pkt b/tools/testing/selftests/net/packetdrill/tcp_syncookies_rcvbuf_window_ip6.pkt
new file mode 100644
index 00000000000..8b5dd71d765
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_syncookies_rcvbuf_window_ip6.pkt
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+// SYN cookies: the child built by cookie_v6_check() must use the same
+// window clamp rule as the SYN-ACK. With SO_RCVBUF set on the listener and
+// a route "window" metric, the SYN-ACK advertises window scale 0, so the
+// child must use a receive window scale of 0 too.
+--ip_version=ipv6
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_syncookies=2
+ip -6 route replace fd3d:fa7b:d17d::1 via fd3d:0a0b:17d6:8888::1 dev tun0 window 4096`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [1048576], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+
+   +0 < S 0:0(0) win 65535 <mss 1460,sackOK,TS val 100 ecr 0,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 win 2896 <mss 1460,sackOK,TS val 4000 ecr 100,nop,wscale 0>
+ +.01 < . 1:1(0) ack 1 win 514 <nop,nop,TS val 110 ecr 4000>
+   +0 accept(3, ..., ...) = 4
+   +0 %{ assert tcpi_rcv_wscale == 0, tcpi_rcv_wscale }%
diff --git a/tools/testing/selftests/net/packetdrill/tcp_window_clamp_rcvbuf_raise.pkt b/tools/testing/selftests/net/packetdrill/tcp_window_clamp_rcvbuf_raise.pkt
new file mode 100644
index 00000000000..08ef005bf99
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_window_clamp_rcvbuf_raise.pkt
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+// After the handshake, tcp_init_buffer_space() lowers window_clamp to the
+// receive space. A later, larger SO_RCVBUF must raise window_clamp again,
+// but only up to the clamp the user set with TCP_WINDOW_CLAMP.
+//
+// packetdrill has no symbol for TCP_WINDOW_CLAMP, so optname 10 is used.
+--ip_version=ipv4
+
+`./defaults.sh`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_TCP, 10, [40000], 4) = 0
+   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [8192], 4) = 0
+   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
+   +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
+   +0 > S 0:0(0) <...>
+  +.1 < S. 0:0(0) ack 1 win 65535 <mss 1460,nop,wscale 7>
+   +0 > . 1:1(0) ack 1
+
+// The small receive buffer keeps window_clamp below the user's clamp:
+// 8192 (tcp_full_space()) minus the one segment (advmss 1460) that
+// tcp_init_buffer_space() reserves.
+   +0 getsockopt(3, SOL_TCP, 10, [6732], [4]) = 0
+
+// A larger SO_RCVBUF raises it again, up to the user's clamp.
+   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [212992], 4) = 0
+   +0 getsockopt(3, SOL_TCP, 10, [40000], [4]) = 0
diff --git a/tools/testing/selftests/net/packetdrill/tcp_window_clamp_reset_rcvbuf.pkt b/tools/testing/selftests/net/packetdrill/tcp_window_clamp_reset_rcvbuf.pkt
new file mode 100644
index 00000000000..458f2f313c7
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_window_clamp_reset_rcvbuf.pkt
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+// TCP_WINDOW_CLAMP set back to 0 on an unconnected socket removes the
+// user's clamp: a later SO_RCVBUF must then not stop the route "window"
+// metric from being applied on the SYN.
+//
+// packetdrill has no symbol for TCP_WINDOW_CLAMP, so optname 10 is used.
+--ip_version=ipv4
+
+`./defaults.sh
+ip route replace 192.0.2.1 via 192.168.0.1 dev tun0 window 4096`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_TCP, 10, [16384], 4) = 0
+   +0 setsockopt(3, SOL_TCP, 10, [0], 4) = 0
+   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [1048576], 4) = 0
+   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
+   +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
+
+// No user clamp is left, so the SYN advertises the route window.
+   +0 > S 0:0(0) win 2920 <mss 1460,sackOK,TS val 0 ecr 0,nop,wscale 0>
+  +.1 < S. 0:0(0) ack 1 win 65535 <mss 1460,nop,wscale 7>
+   +0 > . 1:1(0) ack 1
diff --git a/tools/testing/selftests/net/packetdrill/tcp_window_clamp_vs_rcvbuf.pkt b/tools/testing/selftests/net/packetdrill/tcp_window_clamp_vs_rcvbuf.pkt
new file mode 100644
index 00000000000..69a05959e42
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_window_clamp_vs_rcvbuf.pkt
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+// A window clamp the user set with setsockopt(TCP_WINDOW_CLAMP) must be
+// honoured on the SYN even when SO_RCVBUF is set afterwards on the still
+// unconnected socket: SO_RCVBUF must not raise window_clamp above the
+// user's clamp, and the route "window" metric must not replace it either.
+//
+// packetdrill has no symbol for TCP_WINDOW_CLAMP, so optname 10 is used.
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
diff --git a/tools/testing/selftests/net/packetdrill/tcp_window_clamp_vs_rcvbuf_listener.pkt b/tools/testing/selftests/net/packetdrill/tcp_window_clamp_vs_rcvbuf_listener.pkt
new file mode 100644
index 00000000000..f7e7ddb5000
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_window_clamp_vs_rcvbuf_listener.pkt
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+// Passive side: a TCP_WINDOW_CLAMP set on a listener must be honoured on
+// the SYN-ACK even when SO_RCVBUF is set afterwards on the listener, and
+// the route "window" metric must not replace it.
+//
+// packetdrill has no symbol for TCP_WINDOW_CLAMP, so optname 10 is used.
+--ip_version=ipv4
+
+`./defaults.sh
+ip route replace 192.0.2.1 via 192.168.0.1 dev tun0 window 4096`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 setsockopt(3, SOL_TCP, 10, [16384], 4) = 0
+   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [1048576], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+// The SYN-ACK advertises the user's clamp, not the route window and not
+// the SO_RCVBUF-derived full window.
+   +0 < S 0:0(0) win 65535 <mss 1460,sackOK,TS val 100 ecr 0,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 win 15928 <mss 1460,sackOK,TS val 100 ecr 100,nop,wscale 0>
+ +.01 < . 1:1(0) ack 1 win 514 <nop,nop,TS val 110 ecr 100>
+   +0 accept(3, ..., ...) = 4
+   +0 %{ assert tcpi_rcv_wscale == 0, tcpi_rcv_wscale }%
-- 
2.43.0

