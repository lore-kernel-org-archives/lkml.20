Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794902959;
	b=Iq3FSIQG+SbQ6jSly2tcoyb84lCKcTEetkQNsoRnOS3slv6H7XjgRXsS3bX21eO5hHBf
	 Iz/HJJgFRnypQDzQNSll0KdB6K8MbuHqSxwyIH1a+Kr+vPdU7Cb7XvjMFBVIACLJmMa90
	 YG2m6skpM16n9bvWDGFPoJiY4TCbygSuW0b2sI9uuE6gx2Om66nF58JgQHGhhzXjf0rQo
	 hYTHo3GJWIW0sPJQXLwUTOTmHrx78SuUO3qN0hqOAedpH8Wf4SpB9v24cwsd/1aD2vo1L
	 PQOQOpi84pFnMzRld7xwsRafNtHXybjEDo0bp7UPAl2y4Gor81NV5JNTyT4/BOmhUrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902959;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2AsFSmPkJrfcSU2iokgB2aDPRWQeYmtyi73lpLnFe7k=;
	b=Cna5jxsCQt1rResN7O27Qo9vNVTygckmrKvfmuZ2Bz3N5NBuVO9Ayd53ed10cU6tB9y6
	 AZmjz8UJObwIA82Y+DxVJUGyKhs4UNrn6QwtmEdPEwXoWOrybhCPZrp6Ql/iFwtNmJxIL
	 sUhe1LYZ7+dWe3b/GE6O+XimXnuIe/HriQgl4qsIKH1l5WaCbIYUj5wPPyK0r9LI0yZFz
	 T8V0xW6hELXVLzocJddD0Tc/IxeLxuHQc6nV5/bl0vkTODgRm/ZtQTTic9MYIfrjequRb
	 qzw0kcsTsCGN/9hh08vF/i/pSVoQe+0J5SaXbJS5n+qpKV0VWPfrV11GoV9zSntCQWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oRrKgAzH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF74F606A323;
	Tue, 17 Nov 2026 08:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oRrKgAzH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794902958;
	b=K0lJdGFsKqxiNzhZWDFG198RLjJn0xrJKBchxWuRdtnByzO6VPdtnIZIX4N45t2n8pB+
	 kMiKw51WhSZ+ENMb/q1AGA0broTMDq6UkHAnAHxG/jOuw8xNm/7jDZ+AgUsxvDlRKrBvf
	 u2iIs55y4xT/yJrENuXELW62BGaQKR+VTwWqaKQcACsmtSGUP54cTakAxbnB5f2Atz62I
	 V6XrTxcDgVxqS2pLsgMRwnz96IzxwxsFBawxoEVpne6faEUwHf/th1w0W3VkqNN6cev9W
	 Ollf1JSY8pCp/idmn4+jT0qSxCbzMTCfQ5Tel4oBKuMBpRKmbPZReB/UOmBKpF39Ufg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794902958;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2AsFSmPkJrfcSU2iokgB2aDPRWQeYmtyi73lpLnFe7k=;
	b=HBG3XeKIuVrhjwKTt45u1yjUyLyNmlgbJqaJQ8oSl4tuvBEOy+f9r4KN+wxJDSu0/klW
	 unNv4+m9SuCJFo+hZIvOOYvGCru2Uya/iDMZ9ful6DvlsMejFFGGKibrcd908xZdAlA/C
	 4XjsgEv7HMHtYgYa6ZL338A/dLuqvNVjT9QNkCNu4VrgjH+Pw9WYylroFsWXiQxiJ+1sj
	 F4HAtwokppwqdYbzB2t3XyaTIy+ZdeJyBtbx+JYTJ8oTgpjz5FZ2bqZbA5KMGi5l6JvMO
	 A2mlF3cHdlnnigmnCAyI7PY5M+F9XbmjJm6USRpXsYIZ493Yw64QtsBOQq1dd613bew==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D5A61F000C4;
	Tue, 17 Nov 2026 08:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794902958;
	bh=2AsFSmPkJrfcSU2iokgB2aDPRWQeYmtyi73lpLnFe7k=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=oRrKgAzHDxmScWMEsZU6cbXEBwrbgsQkA63+xe+9dYB9ru+fq664nJGGJZoxTwDpU
	 EPftifQEr9vkFLCFUaIXE2seVbn05yn7HtSdzzV9yGU6ZJC+62eyj/cK6DUmSKpx7w
	 ixzPFUdzxcc5Hv42OaU/EE21LG93+BwTmApW3R/AhgFJlfS/o+EPlBOECkk6p2rTsW
	 6NFmt3/aUn5+6GU7MOpztzl7t1owS+M4SxnT7oGi1S3ZIrYQ5//reZ4zUmQFc5oRjI
	 x2xQylkFY9EBs232dIsPT6x7H778dpge0UeXETobUSyE1MCFSe2BtBkNTVfQpZXeLM
	 GSRtOTSez3crg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 622A64A747;
	Tue, 17 Nov 2026 08:09:17 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Tue, 17 Nov 2026 16:09:16 +0800
Subject: [PATCH net-next] tcp: document black hole detection for
 tcp_mtu_probing
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-tcp-mtu-probing-doc-v1-v1-1-552ae04de4ef@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKsL/GoC/yWM0QrCMAwAf2Xk2YDZnAV/RXxYs2xGsC1tNgZj/
 27Vx+O426FIVilwa3bIsmrRGCrQqQF+DmEW1LEytOf2SkQOjRO+bcGUo9cw4xgZV8KuJ/auv0y
 D81DjlGXS7Te+QxDDIJvB42/K4l/C9v3CcXwAl7FO74QAAAA=
X-Change-ID: 20261117-tcp-mtu-probing-doc-v1-351cb754fa7b
To: corbet@lwn.net, pabeni@redhat.com, edumazet@kernel.org, 
 davem@davemloft.net, kuba@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuniyu@google.com, 
 rdunlap@infradead.org, horms@kernel.org, ncardwell@google.com, 
 linux-doc@vger.kernel.org, skhan@linuxfoundation.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794902956; l=2370;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=uFO+5f2+BsqKYlZQnC2908gTApJQjYev79CULLrFyVs=;
 b=CTFRsXj4zsCMBDDo033TASmfOhkpWF8sCLe3jBnz3Qrz0p1qrRih9+UYwaftb9K38pxZJd4/f
 c15nntriJSoAe9rckuW1XmJPrcLXwr80ROaq2bwkr9FY2/TxNZncrLI
X-Developer-Key: i=echoowall@gmail.com; a=ed25519;
 pk=9XP6JhqjjPsHCF6UZZZTeqTRnXIa4+ufggnxXtTJ+no=
X-Endpoint-Received: by B4 Relay for echoowall@gmail.com/20261026 with
 auth_id=1323
X-Original-From: Yongjian Wang <echoowall@gmail.com>
Reply-To: echoowall@gmail.com
Content-Transfer-Encoding: 7bit

From: Yongjian Wang <echoowall@gmail.com>

ip-sysctl.rst says that tcp_mtu_probing=1 enables MTU probing once an
ICMP black hole is detected, but not when that happens or what TCP
does then.

Describe both, as implemented in tcp_write_timeout() and
tcp_mtu_probing(). Also add the missing defaults of tcp_mtu_probing
and tcp_base_mss.

Signed-off-by: Yongjian Wang <echoowall@gmail.com>
---
This describes the behavior checked by the black hole detection tests
added in commit 8a83f21ad75d ("selftests/net: packetdrill: add TCP black
hole detection tests").
---
 Documentation/networking/ip-sysctl.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 0b7bfbd98a92..a11baf04758c 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -412,6 +412,8 @@ tcp_base_mss - INTEGER
 	Path MTU discovery (MTU probing).  If MTU probing is enabled,
 	this is the initial MSS used by the connection.
 
+	Default: 1024
+
 tcp_mtu_probe_floor - INTEGER
 	If MTU probing is enabled this caps the minimum MSS used for search_low
 	for the connection.
@@ -711,6 +713,20 @@ tcp_mtu_probing - INTEGER
 	- 1 - Disabled by default, enabled when an ICMP black hole detected
 	- 2 - Always enabled, use initial MSS of tcp_base_mss.
 
+	A black hole is detected when the retransmission timer fires after
+	the handshake and retransmissions have stayed unacknowledged for as
+	long as tcp_retries1 retransmissions would take with the minimum
+	RTO, which is 3 seconds with the default tcp_retries1.
+
+	With value 1, the first detection enables MTU probing and the MSS
+	falls back to tcp_base_mss. Each later detection, or any detection
+	with value 2, lowers search_low to half its MSS, keeping it at most
+	tcp_base_mss and at least tcp_mtu_probe_floor and tcp_min_snd_mss.
+	Once MTU probing is enabled, the connection also probes for a larger
+	MSS, as with value 2.
+
+	Default: 0
+
 tcp_probe_interval - UNSIGNED INTEGER
 	Controls how often to start TCP Packetization-Layer Path MTU
 	Discovery reprobe. The default is reprobing every 10 minutes as

---
base-commit: 6ff4c5942a301675eb12e5b49d53a81e604624a1
change-id: 20261117-tcp-mtu-probing-doc-v1-351cb754fa7b

Best regards,
--  
Yongjian Wang <echoowall@gmail.com>


