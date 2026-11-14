Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686064;
	b=yJ6ana0IsseuwqdcBQOBFo2goi4hpsZDbHT2BhSxLXt6fbqVYs3mJgrpEQG7CULFT3MX
	 Vog3mRjoVw+QsDWAOSvPNMIlUg+afO9lRUUBHQ15IMC9M2egbUVGna7HbjtvmsRByteF8
	 gxNUoqnbDlR2VqlBLMLXD8wNJfVN2IwTvrc9VZDKgMBk+0X/6EwXurB0tZgqZVO/eyOHu
	 U1reU58EPCVRjfhd8lcMlPPTLdOZDQyTZperGF0Wa+O6FOOLq2DAKAlgPPOnYLQZPQ/eC
	 d0UpMYRFkRwigBtO7DMutnCuiYTML5LiYvmjfScM5Tzpn4bqFm4gsLBvTfbfMrrt/ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3qJyGE4a5UB8YhjOY/fzHOLCz805/i0NwCGq/ktQh8s=;
	b=T6v260FQBMjcjm8aApRA3uC4zD7XgNw8wnF5omTd+6pcWzI9qXsdlMkVqdQVMOtV6WZd
	 MG4VrEsr9cfF7YHV1dIxKlupt7KvfIdP0dcl+UMNEdSpasQbyEw7Ruq/P+lj0tCvIgFA/
	 2Tj5Foa/dVuPcpE9TewSgIaNh2JY2qEcjAUBOKJ8ZreNXGjx28E0P2q2aPgk4WEYLVl/D
	 ekAx+YbQyCpLOkrPVdKtNDyY85OWjOMtVQxEPSAEgPezYmDqfUZYUKP//1252S0PDHysv
	 fCQ2vwCmU9N1FEtyAOSdntGlU0nxUS2m++v4j87uybNK1LFeXr8Y/GJ7o2vAtaq1GAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIUueDOB;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39726606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39726606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIUueDOB
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3791619605cso4351600eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686063; x=1795290863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qJyGE4a5UB8YhjOY/fzHOLCz805/i0NwCGq/ktQh8s=;
        b=wIUueDOBpnVCEvuV8Dp2/5jiAS+lYJl4cP2IVvXaTwL/NtbOF8E8OqpR1ki0rwgV4d
         Qec5TkPv0LlEh2Y8V/u9Q43jXt1yQmzhpMWLB2CUDZgGmaA3QxIAqDH0yKtxJgtwhT2O
         5bgWymkei0ImgUBzoSsanK+1ZWFBMKcSp9Xnmjz+usNmf59VffX6IvJ+uAMZ6x4MIva6
         Y56K6nOVKvFIOxhdmCokMLbIt0LEN0RrmXyhCSk9sOIgG4HLbEWsInMOfIhU95K1ikJ5
         o6jpnA3CHQTHjXPVjkosZKfqXN/2gs6gqXC1Ymz5ux3Fy07zhmVMY2BhXS4dnBIGDWLi
         xL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686063; x=1795290863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qJyGE4a5UB8YhjOY/fzHOLCz805/i0NwCGq/ktQh8s=;
        b=b2Sx1oeKphLn1VjzqnUNy0kwMh+s7qHrLd3zez/HfkpaWo4sfvNoYNREshPx+8lZUp
         r3gdtNswyFLDNHKkIWi6QTo+9k2baJic6/qGP+jQGE6VERExg8oYmm7Rt5Ccfn3yIPih
         cP8mFjOifahp12wLgzvr0iDzhjh6xePD9wEavIk8aLO/S2nxJOfryN9P0AfnNSjA7KOH
         Dy/7Ksb2g+ptuurSBzjwZcmpQAnbo76SZfoBxeUL1+jlzGtbIDCXcf3pNC7ayJBd1ivE
         b4sp78rJNdcvbINKNbwbkUul6CFgt4oSYRAnbBJ4WquvAtllds0SJwxHMvIYOtHyohQ1
         iDpg==
X-Forwarded-Encrypted: i=1; AL+hErFrEHf30D7SOfwI+Sv5bFJ51EYLpb0mANwy5rOAAKgfVrvbet9Z4bppJIMitLsxH3Mo//JNvy8AW1/48mw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2OC//jDxJ76Qw6KLIuEEb1OOA6OQNemv6lb57GPzLfbDy2xAO
	yllMKgnsZxvCmUpnNPt4GcJb16d0PuVc/gC5GUcqEHpBJUYIThjMUOHJ
X-Gm-Gg: AYBFou36aNlhDHgGJZhfY3kXowX5SiLRPLK79N+kroWUVeFy93CZSoWVKqxgHdgyU40
	HeQ8BIpFKKuBSXyA+K2MxfNvZ4UoN2n/MUZfzxlUxfJtMJS2Vi0hkwjOveFTtVAcyV8Bmdo94GC
	ox/ogrNqOf+EkhujQ0P127rBlXzhUI3tZMB6YiSxM6Cr0mS1Zv12PTlfbJe8nIlWQE5sRW8kL5C
	mOEqDjulQWWBhFlsoPCTTgla6CWJOWaWhXLUXaKk0CbQT01K7cfYxaaD76i05w0fBtqfbOqVOvA
	0O6Q+tgVahggkAKXagekZun6fiItGI5EX+R6bBbVYTTyh7VCYnibIOQyvjK6wOKUW9aHUA0p6gr
	1TLFdIIxWVmRoBJwMFQxFzkfht5s9AghZrt141edyl5I/KlBdJDNatYkdJ0RTscqHH9+6HbDY3s
	B8UhFchE0L8aRLUipNYASRj1qco1YQWnRhuC8dqOzDjCA7zwuEJZSHJkfni1106p286UcpYAnhT
	/NYCPWZLl0fwn0U8ySHl2wAK3OX2/gZ9OVpsgT/TRO7KmhokSMS/p7kIIw+0fwsDL3RAxO1V4rL
	gzvfAbNpI/a5MbCFceZ3LhDnGT1dEFe0Otej
X-Received: by 2002:a05:7301:fc09:b0:36e:b3e6:ebe7 with SMTP id 5a478bee46e88-37966a58499mr5631650eec.26.1794686063266;
        Sat, 14 Nov 2026 11:54:23 -0800 (PST)
Received: from user.. ([2405:201:c052:b00b:f7bc:3425:951e:ab09])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm23226931eec.27.2026.11.14.11.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:54:22 -0800 (PST)
From: pavankumaryalagada@gmail.com
To: horms@verge.net.au,
	ja@ssi.bg
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	lvs-devel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	syzbot+84e27adb95fd2a1fe9bb@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH net] ipvs: wait for RCU callbacks before dst_ops teardown
Date: Sun, 15 Nov 2026 01:24:09 +0530
Message-ID: <20261114195410.96503-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

During network namespace cleanup, IPVS releases cached destinations
using RCU callbacks. However, ip6_route_net_exit() destroys the
per-CPU destination counters before these callbacks complete.
The RCU callbacks call dst_release(), which updates the destroyed
counters and causes a NULL pointer dereference in
percpu_counter_add_batch().

Call rcu_barrier() at the end of __ip_vs_cleanup_batch() to make
sure all pending IPVS RCU callbacks finish before the destination
counters are destroyed.

Reported-by: syzbot+84e27adb95fd2a1fe9bb@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6af795e2.98e60839.1e023a.00d4.GAE@google.com/T/
Closes: https://syzkaller.appspot.com/bug?extid=84e27adb95fd2a1fe9bb
Fixes: 026ace060dfe ("ipvs: optimize dst usage for real server")
Cc: stable@vger.kernel.org
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 net/netfilter/ipvs/ip_vs_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/ipvs/ip_vs_core.c b/net/netfilter/ipvs/ip_vs_core.c
index 8a3c880fdb26..9c456efe13c7 100644
--- a/net/netfilter/ipvs/ip_vs_core.c
+++ b/net/netfilter/ipvs/ip_vs_core.c
@@ -2553,6 +2553,11 @@ static void __net_exit __ip_vs_cleanup_batch(struct list_head *net_list)
 		IP_VS_DBG(2, "ipvs netns %d released\n", ipvs->gen);
 		net->ipvs = NULL;
 	}
+
+	/*
+	 * Wait for ip_vs_dest_dst_rcu_free() callbacks before dst_ops teardown
+	 */
+	rcu_barrier();
 }
 
 static void __net_exit __ip_vs_dev_cleanup_batch(struct list_head *net_list)
-- 
2.43.0

