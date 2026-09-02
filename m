Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827F435F602
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364330; cv=none; b=FWLwQJ4BuXrmnkssnWAUaOKQJthrFbaun071A97qUfvvRpr8ebKxa5Qj4nk4jWupNDA3rSjRVVTwywcHHkXSQ0r0lsbtZPD5+zK6kXoKuZKGcXdNm0JhkjOr8liJofYrYO/3A9xpmL3Uz5ITHBu4JDjE6opCI0sbRe3xvbu9TZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364330; c=relaxed/simple;
	bh=0SpbhicSZWyHqnsgQJYVKe/OrfGmV1wPZnJDnaK92og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djTzncxtTZR30DSr1+Q4Sa/6dA7u49GlA5OGWxcfXcAwikFfc5tU50yOBPI2SSlkuw2DsWzHJdlh5KFljDvCT9kccQ3MA3APIbLC7XE3xFIdW0LFGnPRmcmL6/59QU4hO5KvOjk+nTRS+mGCo56KaOOcaZg2OosZoEFBSAdfd/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=qj/3Bahm; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="qj/3Bahm"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c25b661d37dso189121266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788364325; x=1788969125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUWG69b+8W7QCI7X0cbPtOV4RaGoCN51mNnYh+LDOwU=;
        b=qj/3BahmMCM+MIoMQB0bgWjqqZFLzD8R5lnGA+nIvPsQqO0sxeEE82+O22GWie4O24
         vzF43N58I9pCDZvFZTbDXbEsawdCi2LArkdG6XlFj6jLlqLPPBTTcc9d/vR43LuQOnWK
         u/Bv4ttCmHzdQvS024eZPzpufUIXtcKBdpH6/rXT7SXWLXGQVW7lFgOsIaNl6JLzroA1
         QRZUh6lgB6QXi6ZDcQLftzT4P4OqHLZPlP5vhPeknhw3UFJJT3txa0FPHlFXeQifqux8
         EEhcS+8TYPVFUo7VwO3pOlNqodmoWtrhsfWIWimXQOxLURyN7OVdEgBQbkX3fQZTJZN+
         FIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364325; x=1788969125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VUWG69b+8W7QCI7X0cbPtOV4RaGoCN51mNnYh+LDOwU=;
        b=S45jFZOsci0gHZMRXzPltkXHzJ888AgJGMSDXkb928DJrwAzA3h59APKn6Iat3ys4m
         /gbVsj+bY3lNnoCBS79zPiik2d5J4GSHPwS0Ort5HkxmSme0y31M6bUbAgZdxlLhdqNF
         CLa+r0wytDGkOC5zJNxvwMvRFFbwKQnTiXpIQ8+wGj6EOIA+l/J+MZmXHvJti21wl9ny
         Jk35aYXpZldlwPbpOxUo0uYqZS0Nu5La1Yy8uQg58ltZPOEhUk/JzdOPY1PihGZBVn/4
         ZyFfWTZ/k2UBOzQWaYyfEZ9LiJ45Nn9PmcfiCh9FW0QItFXQKcuk2HSXJBrH6fZ8khc3
         fobA==
X-Forwarded-Encrypted: i=1; AKwUvBw4F0f5oLvGKN7B4s7g1iUrLt9CooXssQ1mIBaQr7phd8uJU3PQhyBHcSX98fuN8ElYBvvrJrLkZCFQsJg=@vger.kernel.org
X-Gm-Message-State: AFuF++klakQW6Sp4Q4BimFVzwB2j1gOb5QqYbRjqtlDgv97lhruIP3mT
	YzEzPytOpkFO7jiae7PK+48E7OYxQcrxUaHdO/NnYI7R/xbKoJeU3G5IWNxMMZv2JA==
X-Gm-Gg: AYBFou0TGQdD6E8cpiLCDLFbHVlL97hTghxYeQrUwWKbTU8UVAfGMHO0PuvBBi4HiiV
	TG/JicHNumlLo/mdgVa84uKSu9Sng/TgUOZAWUZY+H0XSZVeZB6Wn3/z2pgtpzTyg0eT7v7Fycm
	7bzLC9VkIjPAoRZqCtcGQcFAa1shZDmZQS57zy9MrsuHmR0lB1VGbTtEUhDrsD22kc5/nxVcI8E
	egJXC4s7cU19QCPgU4pk1dmK2wT2NWuOWQqQK4NH1/FPSaCZvy4VbtzTwBO1bl3nEPSGj7NffTt
	qxpdzgx5zjm6v4iaYfigXd/x0RSihapdvsa/0pdm64xO0EaOQhipzI9nBe/U3VNGP9D8TYVWnVD
	ZwreI2uX5q/j1frw1OdOqQ+DvH4nEf81hy/gKRLtRUfNmNc5ktYPBTK3O4Ur7WTdgmjJXvWm7Op
	nl92UIFYBBsQ3rbCIgCs35gGZVb+NccPNlaUiTr1ZA2qqIuh6tG1Et0lvoQtfugcV4OuOBQCu9q
	AjNna0aff34GtM8mShy5IfI2cV5bHrsC7MYqCglISTbabI4y16RJfeYOjSrsVWBzN3X6uch8s8y
	WvLr0EpskFu21KSaVi6W7s/VWQCPVQdef1m8XIB66pw4eoB0PBWytIYPrME9K5cjVFaOHilM8Kx
	yl26F4E9sY5jGRbkwcrIKw379/81t97Y1jaJivcig1DKkhBip22K1WrrgJZ3fBDN0kMlqg+S58m
	yvKKkvi1ncsxhc73HwoDpdIQ==
X-Received: by 2002:a17:907:dab:b0:c20:21be:ea75 with SMTP id a640c23a62f3a-c25d52b715amr356033066b.8.1788364324671;
        Wed, 02 Sep 2026 08:52:04 -0700 (PDT)
Received: from Desktop (pd9513d53.dip0.t-ipconnect.de. [217.81.61.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d03fbb75sm160187366b.49.2026.09.02.08.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:52:04 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v2 2/2] selftests: netfilter: nft_flowtable.sh: check the priority a flow carries
Date: Wed,  2 Sep 2026 17:51:36 +0200
Message-ID: <20260902155136.4963-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902155136.4963-1-julius@bairaktaris.de>
References: <20260902155136.4963-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Count, on the egress hook of both router interfaces, the TCP packets
that leave with priority 0:3 and the ones that leave with none, first
with no priority set and then with "meta priority set 0:3" in a forward
chain that runs ahead of the one adding the flow. Without it no packet
carries the priority; with it every packet does, in both directions,
including the ones the flowtable forwarded past the chain that set it.
The test runs at the MTU where the fast path handles the transfer, for
IPv4 and IPv6, and fails on a flowtable that does not store the
priority.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
New in v2.

 .../selftests/net/netfilter/nft_flowtable.sh  | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/tools/testing/selftests/net/netfilter/nft_flowtable.sh b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
index 449c518bd947..ab7732358e1d 100755
--- a/tools/testing/selftests/net/netfilter/nft_flowtable.sh
+++ b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
@@ -458,6 +458,106 @@ fi
 	check_dscp "dscp_fwd" "$pmtu"
 }
 
+check_priority()
+{
+	local what=$1
+	local pmtu="$2"
+	local ok=1
+
+	local counter
+	counter=$(ip netns exec "$nsr1" nft reset counter netdev priocheck prio3 | grep packets)
+	local pc3=${counter%*bytes*}
+	pc3=${pc3#*packets}
+
+	counter=$(ip netns exec "$nsr1" nft reset counter netdev priocheck prio0 | grep packets)
+	local pc0=${counter%*bytes*}
+	pc0=${pc0#*packets}
+
+	local failmsg="FAIL: pmtu $pmtu: $what counters do not match, expected"
+
+	case "$what" in
+	"prio_none")
+		if [ "$pc3" -gt 0 ] || [ "$pc0" -eq 0 ]; then
+			echo "$failmsg prio3 == 0, prio0 > 0, but got $pc3,$pc0" 1>&2
+			ret=1
+			ok=0
+		fi
+		;;
+	"prio_fwd")
+		if [ "$pc3" -eq 0 ] || [ "$pc0" -gt 0 ]; then
+			echo "$failmsg prio3 > 0, prio0 == 0, but got $pc3,$pc0" 1>&2
+			ret=1
+			ok=0
+		fi
+		;;
+	*)
+		echo "$failmsg: Unknown priority check" 1>&2
+		ret=1
+		ok=0
+	esac
+
+	if [ "$ok" -eq 1 ] ;then
+		echo "PASS: $what: priority packet counters match"
+	fi
+}
+
+test_tcp_forwarding_set_priority()
+{
+	local pmtu="$3"
+	local proto="$4"
+	local dstip="$5"
+	local dstport="$6"
+	local lret=0
+
+ip netns exec "$nsr1" nft -f - <<EOF
+table netdev priocheck {
+   counter prio0 { }
+   counter prio3 { }
+
+   chain egress0 {
+      type filter hook egress device "veth0" priority 0; policy accept
+      meta l4proto tcp meta priority 0:3 counter name "prio3"
+      meta l4proto tcp meta priority none counter name "prio0"
+   }
+
+   chain egress1 {
+      type filter hook egress device "veth1" priority 0; policy accept
+      meta l4proto tcp meta priority 0:3 counter name "prio3"
+      meta l4proto tcp meta priority none counter name "prio0"
+   }
+}
+EOF
+	if [ $? -ne 0 ]; then
+		echo "SKIP: Could not load netdev:egress for veth0 and veth1"
+		return 0
+	fi
+
+	if ! test_tcp_forwarding_ip "$1" "$2" "$pmtu" "$proto" "$dstip" "$dstport"; then
+		lret=1
+	fi
+	check_priority "prio_none" "$pmtu"
+
+	# The flow stores the priority set before it is added, so the packets
+	# the flowtable forwards leave with it too, in both directions.
+ip netns exec "$nsr1" nft -f - <<EOF
+table inet prioset {
+   chain forward {
+      type filter hook forward priority -1; policy accept
+      meta priority set 0:3
+   }
+}
+EOF
+	if ! test_tcp_forwarding_ip "$1" "$2" "$pmtu" "$proto" "$dstip" "$dstport"; then
+		lret=1
+	fi
+	check_priority "prio_fwd" "$pmtu"
+
+	ip netns exec "$nsr1" nft delete table inet prioset
+	ip netns exec "$nsr1" nft delete table netdev priocheck
+
+	return $lret
+}
+
 test_tcp_forwarding_nat()
 {
 	local nsa="$1"
@@ -516,6 +616,11 @@ else
 	ret=1
 fi
 
+if ! test_tcp_forwarding_set_priority "$ns1" "$ns2" 0 6 "[dead:2::99]" 12345; then
+	echo "FAIL: IPv6 flow offload for ns1/ns2 with priority update" 1>&2
+	ret=1
+fi
+
 # delete default route, i.e. ns2 won't be able to reach ns1 and
 # will depend on ns1 being masqueraded in nsr1.
 # expect ns1 has nsr1 address.
@@ -572,6 +677,11 @@ if ! test_tcp_forwarding_set_dscp "$ns1" "$ns2" 1 4 10.0.2.99 12345; then
 	exit 0
 fi
 
+if ! test_tcp_forwarding_set_priority "$ns1" "$ns2" 1 4 10.0.2.99 12345; then
+	echo "FAIL: flow offload for ns1/ns2 with priority update and pmtu discovery" 1>&2
+	ret=1
+fi
+
 ip netns exec "$nsr1" nft reset counters table inet filter >/dev/null
 
 if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 ""; then
-- 
2.53.0

