Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB274B4892
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152111; cv=none; b=Rty/Di0gCtD2364rptdUBgfJkM0ebLR8bYdAQPjrI1iu0hh2CnI4Ht4OVMcVzEbWsJRvDvgF9zfU3aRwoD0Y3zat7W2o7O7NoAgMzh+BEoYilDAtswgPJkc4cNAB8tPkMvDxlYQq/bg5LI63zVJLv3EV5zzFu0JcYnpucUOzNmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152111; c=relaxed/simple;
	bh=CRgZ0azeESVx05XN/DI2CTmUes8DOfM/w7avTS/EtcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i9xGrb0Cek6jvOneDwmZyW4GvRkwJK+uDmEWlN86SwYEB3pCYEUgZrLMhgk0ba62IJChzdrVPdh/tggc6kxC0tdlcR2IvvNI6VD0VvynbdNoIPMeCwdHEjDENQMPwfWikcVGeBjJ4S9Ej3XRXqtFY7lZwyi3Md81BgJ1vEnoxdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=GmvhFeG/; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="GmvhFeG/"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-801a52aa540so835498a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789152102; x=1789756902;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMbZw9icvnNTXwCanhAuRSvqQw9hREcvdfSXLJ7VSbo=;
        b=K92Vri0x+k85v4lWH7HsbJfYYSjGylrJQJKHJWikeEaw69ivYvXsS7DsuDOc9/k3Qo
         k5E+EGfAL+FWW5L6cyowCPo+j9NtXq4/Nj8kxwGtWSFY9869ELf9J9PmhqRPVL7UgbEp
         jRWy9LN71SmOd8XUqyxKOCKuRwee3s7cE5vpv8P3Z3C3yKco14VagTWMUsVL4bNhRQcw
         c3nYuy7tSGimoRQaRgJb7p68wQOlLGcB2bxVYC+hURy+NqAlHphHZxYT+IfTATQ13ngk
         BQjbE6kuH/ZhtntZHUG5OLA84gYI/aVJA9VNvFpaS9oA5G2SyLu/evx+bveArUS7UyQf
         RQ6w==
X-Forwarded-Encrypted: i=1; AKwUvBw8imFw0cZHs1FIZBbnLssJ/Jg3pFz9dZGmB/7x1Xr+0Xd+IusFu2bReO3zU5rSRvAwstpFg2/HcjMVH4c=@vger.kernel.org
X-Gm-Message-State: AFuF++nvFoMITF3dM1ho8mxzMbSNn1sxsEDhht2HP2rxdMMmQWu/6gRE
	EkoUmm2AzncKLKIAf7qWlEiV2SeMIFgW+IaOIi7Clg2djSQyQZW500hs
X-Gm-Gg: AYBFou3vgyqcrLruh2NvoX+6T9LFr6aIXlZHbal6KQjKL2bRyvKl8BweVRLR5ayWCw+
	jgzMK4OZUlLTQUJUe1qVijb/IgLGGNujgoP08K7VdRr15njFzCvjYLJzUTm9R0MMYjACw4YQGcp
	YVs5R39gS4nL7hxCZ4mjo729MzvMvAwmp1TEd4CbcYz0KwjjTvWYWBWXm+Yl3zEKy8GulCSpXSo
	c2TAg9LFOQTcIzeH+3EbflWSd3HbNN4x5+PKMrjBbUXuMrKPaybaE+Z9BuHEWwJfDswHin/s+89
	qKYMXARuVgmBSSa3mq3qYNtLZ9nePo96k819DqGYHJ1RTaiyMchDqVTkND5HLyrFf7WUHbt6evn
	7yUXA5Qqgr9KAYiYOwVaVPv+YiBO7Xx8WHZzSeytlaymjIHLUc4CBA7JjHdF+g7p+Ab627G0HAl
	qRYsGjCz2woBuAeQEKfr7PA4OYlTrDS5/Me0+N6XwNAdCs3OyX/YVB9df35RW/qLgdQtuvta64Y
	TBu8KxMFEmTHuCQeX6Ep9+MMISQsGnzYAwTyKIFPN6IaotfOkrn7RF/16S8CtoW997u0HSS6Kxf
X-Received: by 2002:a05:6830:67d2:b0:7fa:ab72:9e01 with SMTP id 46e09a7af769-803ffea3bb4mr4180312a34.25.1789152102165;
        Fri, 11 Sep 2026 11:41:42 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-804e70994aasm1411448a34.19.2026.09.11.11.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:41:41 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8237260B4C;
	Fri, 11 Sep 2026 18:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1789152100;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=yMbZw9icvnNTXwCanhAuRSvqQw9hREcvdfSXLJ7VSbo=;
	b=GmvhFeG/edXAwhxbHy4zVlJAHL3Difik2/7rqr8mkCuh/eBqLiRhB+/rB/z+YRScVpTDWZ
	jaPlwREiXGWzCpJ87c4wMcm4tF2ScT5m7fye3rL1SQtytITIdf83hgUqxEMZa5lF+J4FJe
	iQD9OsSY0mWOLNPQb3lOX8gOfOnD1eeK5g9pybwMdWj36qh/OirRFnyFcTth+ELzvFe/PV
	32C3NzzGMhDvSgXiO3Vm0nNYzNf9wDfm09UFBEUl9m7bRwRQMb490N21y4+OeMwRUR/079
	KuswwzL9e6PSQV11tX540K0KfngidjL5L1LRUDAin9ak82HUPppUtWnuynvktw==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Fri, 11 Sep 2026 15:41:33 -0300
Subject: [PATCH net v2] selftests/net: Fix icmp.sh race between ping and
 tcpdump startup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-selftests-net-icmp_race-v2-1-c7458dec9d0b@marliere.net>
X-B4-Tracking: v=1; b=H4sIAFxLpGoC/4WOQQ6CMBBFr0K6tto2BsGV9zDGlDLAGClkphIN4
 e629QAu/58/L28VDITA4lysgmBBxsnHYHaFcIP1PUhsYxZGmVLVSkuGZxeAA0sPQaIb5ztZB7I
 0ZdVWVWmONYj4PRN0+M7kq4hTcfuV/Goe4EJiplljGWRD1rshVRNhj/4wWg5A6T4gh4k+2W/RG
 fZXZdFSS9UYa05Qa6vcZbT0RCDYZ5Ft276gfxMX+AAAAA==
X-Change-ID: 20260901-selftests-net-icmp_race-6268d886249e
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>, 
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1789152095; l=4012;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=CRgZ0azeESVx05XN/DI2CTmUes8DOfM/w7avTS/EtcM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QL6TGAIu2GyzsEiydnqTAMIRSsCPc75Zq4paR9dHvCGfGc8ymZdjH+qmG4Ttl/cy5pGe2sXfUhs
 SezPyzixKOAI=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

icmp.sh backgrounds ping and then starts tcpdump, with no synchronization
between the two. If tcpdump is not capturing yet by the time the ICMP
unreachable replies come back, the test fails even though the kernel
behaved correctly:

  FAIL - got ICMP response from , should be 192.0.0.8

The empty address is misleading: it means the capture matched nothing
before its 10s timeout, not that the reply had a wrong source address.
NS1's Icmp InDestUnreachs counter still increments across such a failure,
so the replies were generated and did reach NS1. Ping sends several probes
over its 3s deadline, so losing every one of them takes a multi-second
stall in tcpdump startup, which does happen on loaded CI hosts [1].

Fix it by starting tcpdump first and waiting for its "listening" banner
via slowwait() before sending traffic. Run ping synchronously, then kill
and reap tcpdump if it did not already exit on -c 1.

Fixes: 7e9838b7915e ("selftests/net: Add icmp.sh for testing ICMP dummy address responses")
Link: https://openqa.opensuse.org/tests/5907626/logfile?filename=icmp_sh.tap.txt#line-2 [1]
Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
Changes in v2:
 - Drop timeout(1) wrapper from tcpdump invocation.
 - Run ping synchronously in the foreground.
 - Kill and reap tcpdump PID after ping returns if it did not exit on -c 1.
 - Simplify commit message description of the fix.
- Link to v1: https://patch.msgid.link/20260901-selftests-net-icmp_race-v1-1-0b2a27e91a0c@marliere.net

To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Shuah Khan <shuah@kernel.org>
To: Toke Høiland-Jørgensen <toke@redhat.com>
To: David Ahern <dsahern@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 tools/testing/selftests/net/icmp.sh | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/net/icmp.sh b/tools/testing/selftests/net/icmp.sh
index 824cb0e35eff..1670caef2b90 100755
--- a/tools/testing/selftests/net/icmp.sh
+++ b/tools/testing/selftests/net/icmp.sh
@@ -28,10 +28,11 @@ RT2=172.16.0.0/24
 H2_IP6=2001:db8:1::2
 
 TMPFILE=$(mktemp)
+TCPDUMP_ERR=$(mktemp)
 
 cleanup()
 {
-    rm -f "$TMPFILE"
+    rm -f "$TMPFILE" "$TCPDUMP_ERR"
     cleanup_ns $NS1 $NS2
 }
 
@@ -53,11 +54,22 @@ ip -netns $NS2 route add $RT2 via inet6 $H1_IP6
 # Make sure ns2 will respond with ICMP unreachable
 ip netns exec $NS2 sysctl -qw net.ipv4.icmp_ratelimit=0 net.ipv4.ip_forward=1
 
-# Run the test - a ping runs in the background, and we capture ICMP responses
-# with tcpdump; -c 1 means it should exit on the first ping, but add a timeout
-# in case something goes wrong
-ip netns exec $NS1 ping -w 3 -i 0.5 $PINGADDR >/dev/null &
-ip netns exec $NS1 timeout 10 tcpdump -tpni veth0 -c 1 'icmp and icmp[icmptype] != icmp-echo' > $TMPFILE 2>/dev/null
+# Run the test - start tcpdump and wait for it to be capturing before
+# sending any traffic. -c 1 means tcpdump exits on its own once it captures
+# a reply; kill it afterwards in case it is still waiting.
+ip netns exec $NS1 tcpdump -tpni veth0 -c 1 \
+    'icmp and icmp[icmptype] != icmp-echo' > $TMPFILE 2>$TCPDUMP_ERR &
+TCPDUMP_PID=$!
+if ! slowwait 3 grep -qs "listening" "$TCPDUMP_ERR"; then
+    echo "FAIL - tcpdump did not start listening"
+    cat "$TCPDUMP_ERR"
+    exit 1
+fi
+
+ip netns exec $NS1 ping -w 3 -i 0.5 $PINGADDR >/dev/null
+
+kill $TCPDUMP_PID 2>/dev/null
+wait $TCPDUMP_PID 2>/dev/null
 
 # Parse response and check for dummy address
 # tcpdump output looks like:

---
base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
change-id: 20260901-selftests-net-icmp_race-6268d886249e

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

