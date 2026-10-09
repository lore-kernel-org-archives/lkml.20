Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208593E00B8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522102; cv=none; b=mf8UrEDVUiynL+TvRtsDt3gq0uqTwSNsClgL18q1zbT4lpDF2mHo04iQiaXhAPRSged1Tv+WsQVMhIKxMuBm/G607/pnBK1ZOZMhA/elNxlQkwPaQE4lATszHDN4eug+5jsMFd2Dutgh5bB/XtYU5Ufhn7CbGT2uNXPEIUSRWkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522102; c=relaxed/simple;
	bh=BmOtsxSk6laakYTGY1vhB+TkeFe46FrgReiAo1gmTcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gE4PiFdeINg1uHNxmNEcy4tuZzBgLwtMcvWYnb2jcjMnJluL731xU8ltfgmbpr4hzoK8pqMI7It767L6JGpJvtiVnMvgYBOwhZxyOkyhqt85ajq/9Zsh4p9xIt65Y9UTCdbtNUYWv3qqmk2nolBd3ZbNge0u+FUoizDct6qNwkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=Ze79Uiv0; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="Ze79Uiv0"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4f55a53898cso2056671b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791522100; x=1792126900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ldnK09uw57VN3jHwLW73euAAgs3EKlu4n6BV+LKVFg=;
        b=Ze79Uiv0x06s/DDZGJZeQM83rAUG+DsrbQ0uX2+9ylJ1Mj5zNB3G5Y5cEC4B4RHyLE
         UtdWD1yz0erOVo/oBvLlrP8xo2IA4o6Una3peAglsgGJqogelROwsx7jXoj2NPyTl7bE
         5YJGNYfVx5kcWEBfZgSUcKEhY2MOWuSmO7giY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791522100; x=1792126900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ldnK09uw57VN3jHwLW73euAAgs3EKlu4n6BV+LKVFg=;
        b=IGV0akzlNSd4AkdfwX54ShHZ3qoXfyQHAiwKycXKP/vQCFO7VLR0ulC3ESLMHsTHNB
         LnT5ErANQycnjXGINuhdv/M6Sk0RNyjMxCV95eAuzgMiZXhvX+56s6Zloj8J8W5t7k+I
         PHkRCOEGF/1KppQP58Qv7NNIxhD4lr0B4ggKWQj5rTfP8cW1I6OsPkTVOzIHGnTknsjo
         v96y4TEgH77Urv6EJnRb3jeRNsw1SdK4wq3qXzw3l6iqzhPBlLzA/5/57DvKQcUmFSmA
         8bpmUFjnz6k1Z94ZYv2ShVPB/MJLg/v5pCB7adbElAiheXqFg9rZ9NLH7Qlokn3G3Buy
         Eseg==
X-Forwarded-Encrypted: i=1; AKwUvBzHExZ75gNyKNe9mArp5iU5pX8w9yXjLn5cIrZSp3LLiW+WszTuEOP3OTWEwZWaNIjQB/jdEliaQzOe6jg=@vger.kernel.org
X-Gm-Message-State: AFuF++nYUYC+uCd23OGLSvNNUsqhRPeA8m3U5WZFk3MSlVZNKHfLXblH
	km3JeOTsA+OfQk9uCtUq7BLILPKCSSNV6CNJ884/oyoAR8ITmKdCtIjkhAZZWTM/oRA=
X-Gm-Gg: AYBFou2vb+dDi3QWl+VnbcPXztBZHipfCmCi80wy5ln+qpdXxZW8WsiWVx6pv7V2Xfs
	EM4TQaiLEmqSGMsHrFKpn+6WKoI4FYcmNY2TtvaBLfDaOX+DDOrn7NnGVscrNjXIZ+R3p8Oma3j
	m9vq6Tyz6phlMzr3Od5p91INC3kly/Cw3sVK7Th0NFxzXjVZIAqDwR+OOsambCW8RX2EGu8H4f/
	GhPjwXfI3kXNKSSr+HqXlG2OJNOZhYkjHok/nJnq83kFK7OnyjUhrG3q3WfQPjY3OjgYCji4KAO
	dOvxMh4w32HsL4bCtuuTZXmLNar2X2pUM1UIXcVpFa86+Z8eKTDBb6lFW1BjcSRiTyOOr1YDiI1
	J/JclJ3BylfSpGGHoGOuuE1iC9fUO3LzyeQMXqLc0n0Ud+Qr5oJkXW34eModnkPAyt6O6TRqB6R
	7BEB9PRc6SUgA3WV416+1lllN5iIUYRhmrJfQapqSzge+vOoOEnP1UawOs5A1bE61mi6ok+phfZ
	+pXu983RzadooaT6gzNb2jmHmrdq5GNghKPj+dDHoXVlwv+wNb8yn/JKMjZWgv6q8hCnv61JtnO
	jvM=
X-Received: by 2002:a05:6808:23c2:b0:4f5:1273:14b0 with SMTP id 5614622812f47-50c59399bb4mr729134b6e.44.1791522099894;
        Thu, 08 Oct 2026 22:01:39 -0700 (PDT)
Received: from com-68297.corp.openai.org ([199.47.143.0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1c1246cbsm944574b6e.18.2026.10.08.22.01.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 22:01:39 -0700 (PDT)
From: nramaswamy@openai.com
To: netdev@vger.kernel.org
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Neal Cardwell <ncardwell.sw@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Yuchung Cheng <ycheng@google.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 3/3] selftests: net: packetdrill: test RTO fallback after partial undo
Date: Thu,  8 Oct 2026 22:00:34 -0700
Message-ID: <976f8457bffbc513197d6ff5c052ca7c4bd6ed03.1791506907.git.nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791506907.git.nramaswamy@openai.com>
References: <cover.1791506907.git.nramaswamy@openai.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Neil Ramaswamy <nramaswamy@openai.com>

Tests that a segment that is lost but also previously retransmitted is not
added back to the RACK list during partial undo, and is instead
retransmitted by the RTO. It utilizes the fact that a TLP doesn't increment
retrans_out, which needs to be 0 for partial undo (but this scenario may
also happen without the TLP).

Signed-off-by: Neil Ramaswamy <nramaswamy@openai.com>
Assisted-by: LLM
---
 .../tcp_partial_undo-rto-fallback.pkt         | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_partial_undo-rto-fallback.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_partial_undo-rto-fallback.pkt b/tools/testing/selftests/net/packetdrill/tcp_partial_undo-rto-fallback.pkt
new file mode 100644
index 000000000000..844895121573
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_partial_undo-rto-fallback.pkt
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Test that a segment that is lost but also previously retransmitted is not
+// added back to the RACK list during partial undo.
+
+`./defaults.sh`
+
+// Establish a connection with a 100 ms RTT and a 1000-byte payload MSS.
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+  .100 < S 0:0(0) win 20000 <mss 1012,sackOK,TS val 1000 ecr 0>
+    +0 > S. 0:0(0) ack 1 <mss 1460,sackOK,TS val 100 ecr 1000>
+  .200 < . 1:1(0) ack 1 win 20000 <nop,nop,TS val 1100 ecr 100>
+    +0 accept(3, ..., ...) = 4
+
+// A is delayed. B, the tail segment, is lost.
+  .210 write(4, ..., 1000) = 1000
+    +0 > P. 1:1001(1000) ack 1 <nop,nop,TS val 210 ecr 1100>
+  .211 write(4, ..., 1000) = 1000
+    +0 > P. 1001:2001(1000) ack 1 <...>
+
+// With no ACKs, the TLP retransmits B at roughly 2*RTT after its send,
+// which adds TCPCB_EVER_RETRANS to B.
+  .400~.430 > P. 1001:2001(1000) ack 1 <...>
+  .435 %{
+assert tcpi_ca_state == TCP_CA_Open, tcpi_ca_state
+assert tcpi_total_retrans == 1, tcpi_total_retrans
+}%
+
+// C is sent and arrives with a 40ms RTT. It is sent after A and B's tail
+// retransmission, and both A and B have remained unack'd for RACK's
+// RTT + reorder window. So RACK marks them as TCPCB_LOST. C's SACK allows A to
+// be retransmitted as A'. Now, A and B are both TCPCB_LOST and
+// TCPCB_EVER_RETRANS.
+  .440 write(4, ..., 1000) = 1000
+    +0 > P. 2001:3001(1000) ack 1 <...>
+  .480 < . 1:1(0) ack 1 win 20000 <TS val 1380 ecr 100,sack 2001:3001>
+    +0 > P. 1:1001(1000) ack 1 <...>
+    +0 %{
+assert tcpi_ca_state == TCP_CA_Recovery, tcpi_ca_state
+assert tcpi_lost == 2, tcpi_lost
+assert tcpi_total_retrans == 2, tcpi_total_retrans
+}%
+
+// The original A arrives. Its timestamp predates A's retransmission,
+// which starts partial undo. B's TCPCB_LOST flag is cleared, but because it
+// is TCPCB_EVER_RETRANS, it is not restored to the RACK list. Only RTO will
+// rescue it.
+  .490 < . 1:1(0) ack 1001 win 20000 <TS val 1390 ecr 210,sack 2001:3001>
+  +.001 %{
+assert tcpi_unacked == 2, tcpi_unacked
+assert tcpi_lost == 0, tcpi_lost
+assert tcpi_retransmits == 0, tcpi_retransmits
+assert tcpi_total_retrans == 2, tcpi_total_retrans
+}%
+
+// No prompt retransmission: the remaining hole is recovered by one RTO.
+  +.100~+1.000 > P. 1001:2001(1000) ack 1 <...>
+    +0 %{
+assert tcpi_retransmits == 1, tcpi_retransmits
+assert tcpi_total_retrans == 3, tcpi_total_retrans
+}%
-- 
2.55.0

