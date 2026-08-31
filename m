Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66C43BCD05
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213136; cv=none; b=kDSGiSECzSc1nU+IwMQdCIxwh5BrCfMk8DIGhzIYJV/KijnGeKoOezVB/ROAd+pTq5rwis9fFvMF1HP/PpvnIOm/4y7lXF9Ldo8dDKwfjWnAqEkT4VaD+VovIkpGhHsgoumd1uvUTADQoTwAzC+t5qRmUcFqBjGO4/edjL7Bjmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213136; c=relaxed/simple;
	bh=DKx6E5dImMHY5Yp7PtZ+11Xgio+IIf1+fa0J4Yfua5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FUf0+sYu+7QVHhoZ4k75lngKaNcqTcUrJwTXM/GBzIWNPHgCxBehcHM/lVNUHt1EGOWLLtbgF9XZs1t5GFY/DLbclil/JpakLZwcDTyh6PNTWEPeqOoUeq6GzHUp0gtYLDMu7zuj4J+t/OF0aQgPtg8oaxaoNFvPP7+PIKmodP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVgo4FjY; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVgo4FjY"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b5e18f0439so3333366e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788213128; x=1788817928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSBImvVt2nvI5IA5hzH0bnJG/0pKCpXdDgr7PN684mk=;
        b=FVgo4FjYMnrXsqLzBYzYwyqThIHtsqfWwPPL+TflXy8XWHAiS6fkyp9DX5EwI+wQYW
         WCF5znIy0U4U+mJbuwLikyVCQyIXkDYZFxGBxM1Jzj8crjpN6J6dW5CLCX0RJDGmgcKT
         3HoF/9pr/eMg65bpE5PVEGsvaO4povUSeyuCgFpOQ5Hqt+qctuPp1o2qLEi7ZvGT9ghE
         CBt4dV3Y34RkOQ0bDcn+ssnlkiPgJz7uykTWPhRQh/f92bcskU0VDJxZE0beA3N321p3
         rBADMULBVB22RZv/mqvRdYEbeVJt+ifkXNXlda31YSRPiTHpeah/+eYjcCNymRov2d+a
         pWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213128; x=1788817928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSBImvVt2nvI5IA5hzH0bnJG/0pKCpXdDgr7PN684mk=;
        b=h0uPIffPWs5FZc1u1AtAvtuwZlLWmvA8LZLOXyvs0HtpiMWCOA0fxUZpNqK5CEUjhj
         +cyUvvWwn9OcevZebNUyZQh1nhW1ntDNbFPytxhdhYQB/PZHnJJILf0UVlyMBW9Fkth7
         K81tJ5rvQTPvucVYZa/CJxnN/q/99uPxxc2T6BI35wXDZiQM/Rxy3vLRr/WaqonoF6TR
         VjgRX9rsqIuxWuQ6/o883Ca3FSCv+vGKduYdfUq8P05b8nX5TsU8ETdYk28wcn2aOH2w
         YySQfB9A4qraYue54/o/lzpR3qyOO3HFbInfuwS/RckERVUq27LIAIwJRYMdswQHnyqB
         QLAw==
X-Forwarded-Encrypted: i=1; AKwUvBzqcQzwUgb6toIQ4G45Qg+VS64+L9FA26HqTDUjM4DwY1LjWb7TCCVJCLTnQkWjTUuYqePG/zddYXfC2e0=@vger.kernel.org
X-Gm-Message-State: AFuF++m1wiALsKB6vSS4G5Zx2vKau+Eb9n2RKzdAzfwSTx6PIrpbmMn2
	4uB+pv0RqHNMwNa3fo2ZaZpXGtC6uAS1KsCxo6T8ORTgmVmHlOdDbWys
X-Gm-Gg: AYBFou1exgqQpuPOhnt1sADQqwcouMcHCVVQEZLdz5QqDDn97UDakiiIczM/ssDDsg2
	HvIxJgT+FesYH8QIPk4oq47ZeTC3R7oKBmes2hRhGT/z9kTPd5o9zvR8csBtHrdc8dFXp5qHczU
	xjBhkkR+eJ+FIKnChaj95W7tb5nxee7xRye7LFqKuHRrVRbSGByrbmg5fGkm5UqVpbaDBz6ckGG
	6VyVPam7rTXinRuHLxliYQkwD+r3/kF+wPNlwc9gZPr3PfEN8ZR43VY+CXEdJ3T0Tf1i9j/V5gD
	KTfdhjztmiFhHjG2NiKcsg4zDFmz8qqAvEj1oGjSz0nryTr0EKvdtZMH74ffL5KBNHs1zd05hgu
	X/wENX4l23yYBEBgzgAwnC48s6AOM2fPTrtK5aYHyF4zhs2Hs+moElaepE7412RarO/xz3gJTxr
	r+KkARZJluO4tP1m+QK4ABtWKmJEtMtRMxJm6/HMo3b6UreUul6lnXTsNJF6UYMQtCetHwzigsF
	zGqUp6m1CRr5Y1vk2+Grlp16sACek6+tQ==
X-Received: by 2002:a05:6512:4014:b0:5b4:a836:13fd with SMTP id 2adb3069b0e04-5b5fe0fbbaamr1575023e87.22.1788213127704;
        Mon, 31 Aug 2026 14:52:07 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.184.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a06a77sm2388782e87.48.2026.08.31.14.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:52:07 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 11/11] selftests: net: cover the tunnel transmit drop reasons
Date: Tue,  1 Sep 2026 00:51:37 +0300
Message-ID: <20260831215137.549324-12-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
References: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the tunnel drop reason test with three failures of the transmit
path, all on GRE:

 - an underlay that cannot carry what the tunnel advertises, so the
   encapsulated packet does not fit the path MTU and is dropped after an
   ICMP fragmentation needed is sent back.  This is the case worth
   telling apart from the others: path MTU discovery is working as
   intended, and until now the drop was indistinguishable from a real
   failure,

 - a device in external mode receiving traffic that carries no tunnel
   metadata, reported as TUNNEL_TXINFO,

 - a tunnel whose remote endpoint has no route, reported as
   IP_OUTNOROUTES.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 .../selftests/net/tunnel_drop_reasons.sh      | 58 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/tunnel_drop_reasons.sh b/tools/testing/selftests/net/tunnel_drop_reasons.sh
index aad003f0efe5..5639e29365a4 100755
--- a/tools/testing/selftests/net/tunnel_drop_reasons.sh
+++ b/tools/testing/selftests/net/tunnel_drop_reasons.sh
@@ -26,6 +26,11 @@
 #    GRE_TUNNEL_NOT_FOUND.  It is triggered here by giving the two
 #    endpoints different keys.
 #
+# On the transmit side, the reasons reported while encapsulating are
+# checked too: a packet that does not fit the path MTU, a device in
+# external mode that receives no metadata, and a tunnel whose remote
+# endpoint has no route.
+#
 #  - a header with the routing bit set is reported as GRE_INVALID_HDR,
 #    and a header announcing a GRE version nobody handles is reported as
 #    UNHANDLED_PROTO.  Both are triggered by corrupting the GRE header
@@ -81,6 +86,7 @@ setup_tracing()
 
 setup_ns_pair()
 {
+	PING_ARGS=""
 	cleanup_all_ns
 	setup_ns NS_SND NS_RCV
 
@@ -122,9 +128,15 @@ addr_tunnels()
 	ip -n "$NS_RCV" addr add "$TUN_RCV/24" dev gre_test
 }
 
+# Traffic used by check_reason().  Tests that need something else set
+# PING_ARGS before calling it.
+PING_ARGS=""
+
 send_traffic()
 {
-	ip netns exec "$NS_SND" ping -c 2 -W 1 "$TUN_RCV" >/dev/null 2>&1
+	# shellcheck disable=SC2086
+	ip netns exec "$NS_SND" ping -c 2 -W 1 $PING_ARGS "$TUN_RCV" \
+		>/dev/null 2>&1
 	# Let the tracepoint records reach the trace buffer.
 	sleep 1
 }
@@ -254,6 +266,46 @@ test_corrupted_header()
 	check_reason "$name" "$want"
 }
 
+test_tx_pkt_too_big()
+{
+	setup_ns_pair
+	# The underlay cannot carry what the tunnel advertises, so the
+	# encapsulated packet does not fit the path MTU.  The kernel sends
+	# an ICMP fragmentation needed back and drops it, which is path MTU
+	# discovery working as intended.
+	ip -n "$NS_SND" link set veth_s mtu 1280
+	ip -n "$NS_RCV" link set veth_r mtu 1280
+	add_gre "$NS_SND" "$SND_V4" "$RCV_V4"
+	add_gre "$NS_RCV" "$RCV_V4" "$SND_V4"
+	ip -n "$NS_SND" link set gre_test mtu 1500
+	addr_tunnels
+
+	PING_ARGS="-s 1400 -M do"
+	check_reason "gre: packet does not fit the path MTU" PKT_TOO_BIG
+}
+
+test_tx_no_metadata()
+{
+	setup_ns_pair
+	# A device in external mode expects the destination to come from
+	# the tunnel metadata, which plain traffic does not carry.
+	ip -n "$NS_SND" link add gre_test type gre external
+	ip -n "$NS_SND" link set gre_test up
+	ip -n "$NS_SND" addr add "$TUN_SND/24" dev gre_test
+
+	check_reason "gre: external mode without metadata" TUNNEL_TXINFO
+}
+
+test_tx_no_route()
+{
+	setup_ns_pair
+	# Nothing knows how to reach the remote endpoint of the tunnel.
+	add_gre "$NS_SND" "$SND_V4" 172.31.255.254
+	ip -n "$NS_SND" addr add "$TUN_SND/24" dev gre_test
+
+	check_reason "gre: no route to the remote endpoint" IP_OUTNOROUTES
+}
+
 if [ "$(id -u)" -ne 0 ]; then
 	echo "SKIP: need root"
 	exit "$ksft_skip"
@@ -279,6 +331,10 @@ test_corrupted_header "gre: routing bit set" GRE_INVALID_HDR \
 test_corrupted_header "gre: unhandled GRE version" UNHANDLED_PROTO \
 	offset 21 u8 set 0x01
 
+test_tx_pkt_too_big
+test_tx_no_metadata
+test_tx_no_route
+
 if [ -e /proc/sys/net/ipv6 ]; then
 	test_opts_mismatch ip6gre iseq
 	test_old_seq ip6gre
-- 
2.47.3

