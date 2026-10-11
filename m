Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ED918FDBD
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791717386; cv=none; b=DeMHbJUaivN4V6kmonMpj1cmWFKMdGIT6LBWO9YIwXrutm9joYuNkD9pSRaSpqEis7H/K8fVxFaOZ1AMgCNNZa7jxs/OjQr+6KEMmS0+wKAsSP6fFJKPFa3uBX9UqAXUy4h3/wCwh+6cZS4rfL+0KAHYluLlJkLWvZ0I/3hg7yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791717386; c=relaxed/simple;
	bh=g9ET9/Wbeb9U9AgyJHKHgPcnysCUntixLAXYJ/HlT4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7RNWE51VPlkBE8N/fVMVmPghY7WXZ5vBR8vl9XgYPp8a6nkbWtMyHXIyPaq+U1qJzQARQ7rQFrp1tC3gZ65XW+Tkg2OYCOOP0fS1xy4VsdHsSYbIvXz2XRPfbzbAPkpU5y5xc8krCW4jHcCXTQgQ4/m0DhqxaFfumOEQp7J8HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FcjNixYm; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FcjNixYm"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-356b1e20700so1376246eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791717382; x=1792322182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmatCOb7GYfr2BJ3VdKdlsW8GJA/oiSGbFjGfYuhsqI=;
        b=FcjNixYmVQe5sVPyUZ21b1b0VHEL9/8ZCzGPcz5iTlz9J5btgyf0SfKHt6vcZaszSR
         GOK/35PvGlyT7mfo4qOnyhh0oltXmUFdUVtt283LircNEHLmqVa2gmrDYnqzSbf09Ruf
         gjued0EHaQ2qDwfj0C++z0IhWvd1LO2Is+Tya0H4pLsvloZL6aZPVuEfUCIcySzMLu3+
         cklVC4jvvxOjlhVwax8zuQ32/CRCo3U0uT/SPS6UVQUR+KoMB4gjq5Hz6p07s8dPQwC6
         wgYXwtTo78EqyGUV42aNoF55pW88/noip/ww3fArmQGZ/jCLkch5GIZkvqyYoBAINZ0s
         6p2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791717382; x=1792322182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OmatCOb7GYfr2BJ3VdKdlsW8GJA/oiSGbFjGfYuhsqI=;
        b=Tjaz8FbDKgNGfFKX11NsDMgJv0AbVau/nTM6yCSXsd9ZhPKOvpvTwvDUW/tTuUQigI
         6tI8PlByqKyakuu1JQWrp8NPBDBgRwdGKkpeNOe2TpJ8PbxJ7Y7H45q9iuG8zN9sx060
         48UsMkrNgcR1z93e40+Nb/ukOSqeXmo6z4vsSVVxgi6C4s3dYjFBC5iGNbigXJ5RSAJu
         /fBTCtn1XC5DVfGEAgFK1eOlPDeftClBULQfyvL1smNb+0PcYPyqB4OOLqFNexCr0ldx
         +xvzrGfgS9HyIxxVZ+U6CGu+9hMH/JO8BXnk/qOVahxMiqnz5qbsnxcimz7l6uhmWths
         z08g==
X-Forwarded-Encrypted: i=1; AKwUvBxkC+KJ/h5w7DCOEX7tMmuAx4gfefe9KiH2SDPX3+49n94hl+57sKvNkrC7cdobFU43259ouAdslG17mcI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJBTo+GxxCwRq+pFwZ3s3MfIacp9KZRCVbyo1y7i8kDafBh19N
	9Rif3mdb0rDzPI4rnV9vqCFOaVUYVYSeChdm81Lk8PtY3yZau8zVPxHR
X-Gm-Gg: AYBFou0MQsZvWp/a8N+BCmvuOAQdFXF0wRPNFuBhksZ+k+LFDKJJKSTxr274xOVWiI+
	NMhuJlQpGXPgjA4iqhnnBPpuBLoobIK1hwRXccSkOKIHbN9gjOEPe/zMjy+nURm01DJ7DcChn+y
	K81piyG0WYuZqgN0G0f6F+tYOMbsbPTXy5+fsPtJY9ZD3OJb79V2zj5cwMhqq9JHYDHDccb9vn4
	4aYitUCTvzGpc3q4+UetP3w6R8EkvF3S2d0kL2neeO+vJE+VeQRlifwJCugZaOl/TPAMj+km2kN
	k6sP5xf6Ic1EucHf9b8SAohFkCz6rKMMA6fgr6ZsP5KiekhbSU454UAb1ePS421XiOl2FKUXJfq
	TUKM039cgNojZbO3zspVIfJ+lGBoSfOAy34oV4R3vqkjxBd4qivwXzZs6g0qWAUKlBh6W5TEGVA
	kvLH8igVwTuaYZr/kCreRBlV27gFpOfS2fwVyumzsvGay6y9BLWavyM2eXfrI2h/rym4ahtDaCa
	6hQS5WMHw9D+s6E0ITc/dZ9Y38WEtDeaazay4jSHiF1ifvci2kAbv5MHqNnNNvUSsFFsnjLX6n5
	KnR5bz14TX+bAbjEryf8Ca+h46dVtWnUHEyRotZGXUf9daFWUbUgnnUhY6uheAb4hfON+6zeYhw
	HWA/hQHq3B89RwjZpKe8ZTVGUFzThohEV5TqS23TkWgkrD6NDYAa6uoGWXFXnGQRQTg==
X-Received: by 2002:a05:701b:205b:20b0:148:ece:8cc3 with SMTP id a92af1059eb24-16a1555cfb3mr8844066c88.24.1791717382312;
        Sun, 11 Oct 2026 04:16:22 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a6021e49sm20851347c88.20.2026.10.11.04.16.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 04:16:21 -0700 (PDT)
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
Subject: [PATCH net-next 2/2] selftests/net/packetdrill: test SO_RCVBUF before connect keeps route window
Date: Sun, 11 Oct 2026 16:46:06 +0530
Message-ID: <20261011111606.14753-3-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261011111606.14753-1-jain.sm@gmail.com>
References: <20261011111606.14753-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a packetdrill test for the SYN window and window scale when
SO_RCVBUF is set before connect() and the route to the peer carries a
"window" metric (RTAX_WINDOW).

The test puts "window 4096" on the route to the peer, sets SO_RCVBUF,
connects, and checks that the SYN advertises the route-clamped window
and a window scale of 0. Without the first patch of this series the SYN
carried win 65535, wscale 5, because setsockopt(SO_RCVBUF) had written
tp->window_clamp while the socket was still in TCP_CLOSE and
tcp_connect_init() then skipped the route metric.

The test is picked up automatically by the packetdrill selftest Makefile
(TEST_PROGS := $(wildcard *.pkt)).

Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
 .../tcp_rcvbuf_before_connect_window.pkt      | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rcvbuf_before_connect_window.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcvbuf_before_connect_window.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcvbuf_before_connect_window.pkt
new file mode 100644
index 000000000..a3557ce80
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
+ip route change 192.0.2.1 via 192.168.0.1 dev tun0 window 4096`
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
-- 
2.43.0

