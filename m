Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67023612E7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790916681; cv=none; b=eAp+QdFNgYzdMfCdDlVMNCXFAyoa1ulFxy1PdtDbFzNi8iRFEdHphyVtLcC7fhb7cQI0jUVDsvoigbRxOhw9Kl4bZu331sFDXvAoc1ezJ8tRHZzE2kjRxor4+YSfcKquL716Cxip8EUziLR5MwXNsstSt0dxOpxjCg/SXrSVDdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790916681; c=relaxed/simple;
	bh=EteBqRwOLnXN3M0J+gAk+oFidGRofjnyUkuhc8Yj/b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zy10aFlZ23GcD82LhLYgICxO5tUqq6jlzrZlmt1O1oKqzVRqc0+b/bwKvAz0c2sno4JNrDa68EWbJBr0JDUbtIGLQTBRhcxzpmkK4vCynFig67gooHcTW44NnEam6hELuKasD9vM1+5j3v8+oZMhJDVmvaEhNEVNNU4mnr/Jbk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGnbTb3Z; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGnbTb3Z"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc433d52421so2699815a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790916679; x=1791521479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTsDoHWNhTSL7kUFc6o5v5Gkxn0GUpcR2BsXzWRaXlU=;
        b=pGnbTb3ZDweKliMva6oEL3jqZIp2+UbsL+t6DWW6bNpGIQ5QKYrjpBTxkuGQ9B3nFZ
         yjCbCPRh8k1i84kdgJ3WQ7/IrBXEL5XbcP0odQFJzP9Lkmmhisml/3ydcNnKJEMiNHer
         0pTZwSw/j6aLPM3Dpy/l6YYqjs46DLhD6nx6MqJwRPEbkLQcs3GBVtuRg9/8/KkLW6Qb
         N8gqckLAJa9qknACM5B9HkgT8HqlqeGSpW58L37dNoChSPiOeJDIZfmCQpQpgrnDKryN
         1FK6cVfJd2Ii0GpPkihfYJdm4PKahkaoYhJHcD77ZVuk06wkodmCSAy86zP+4dqDiILJ
         zJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790916679; x=1791521479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTsDoHWNhTSL7kUFc6o5v5Gkxn0GUpcR2BsXzWRaXlU=;
        b=YzPVjY/BfbOCjFIdDrCKFYSDkgq3j00K4qUXvSFOQdmZZhrCA+C/VQxgSq4NlLUvu6
         uI/djnXWwDjAHW/taKTYGeVf4twItHutELdpa8b+EXsSXucw2nfV57/HTt1pAdO5jkM1
         Ue8X9dfhm5gaI4GBMClfrFyLPzP3OzrDJSYqNICLX7x21aXJqQkyifAGE97TGlJQEBUU
         XLwXc8xqYMxxOQjDZyMdjxpjN9v+IYyJ463fElvZNmhgMK6tlvdy9MVb40Ltq6PL454f
         1v5w1Y9bQeGmQsi2C2D2N6i5SzoecBwAIMkT2u1pptg19TuBLQEzRCvRvpcrtMMCAbmm
         AkEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ7vKblkYkPKIyg6Ysh0vVccqWfJQx/ZU1ACRyLuxM1/sTh/itG5VcSv57deYMwMFANw1xJHrJRqlpCBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRsSwZMP5nshjR/ZM/5Ltylbxd1BQu0bALESFEGSvdJilGeMVu
	fkFge+F+hNKGi+AQSyntK9mMUD07KaBlfwyZmB+TaQG4OgDce21jvZ79
X-Gm-Gg: AYBFou3ZwOpO8+ramV7ptFhz8+LFgXJeWwXoL2gcKUpUGUS3w8cLedwBmoYgocJ3LGd
	P4vwal2mgywAxbHaakmRS0YmX2xTayeiYVYuQaEQ3nOmfFz0hqRo7wphD6KvcamzjAAfWLB9flt
	x8fKL0RWJ+u866W8byS16l25azBxAMW6Q7EI5QQwTdLzKynpJGXq2hwaal5yP7YeS29IbOPIly4
	zKlF2R0lXLO4lqhSbKeURNsUJ3nW5rUeiAhqaMI+zMmSt97qE8RwmKvMLPomp2vI48fA0j+TJH8
	Rr7f2+rq3b/BcT2ibbrk8uVvdzYpAwchK1sycZiOdTaY1QgYTWyrcDjw1tzXvxD/NeN1Em7zeNM
	dLFCikG+anWl7N1AQhI55HC4R7yNgJ7Fp7eFXqLsZES5BHXgryHzzrFCMDJarGiQQWPFUrgzBJl
	HWWrgY2xxeRrU4dQ1Sgm6RccK6a5XhRwJ7eel025IQRgxBn240FbCntuZD+W/1ZY0GuYbmmW8sC
	LH2LMfGZSI=
X-Received: by 2002:a17:90b:3e85:b0:3a5:3f7:27f with SMTP id 98e67ed59e1d1-3a6cecaf8c5mr1436229a91.66.1790916678778;
        Thu, 01 Oct 2026 21:51:18 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd3962f0sm642682a91.3.2026.10.01.21.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:51:18 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Vladimir Vdovin <deliran@verdict.gg>,
	Donald Hunter <donald.hunter@gmail.com>,
	Amit Cohen <amcohen@nvidia.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH net v2 1/3] ipv4: stop PMTU walk when nexthop group shrinks
Date: Fri,  2 Oct 2026 13:50:58 +0900
Message-ID: <4fb87ed994dfc067178fc845cdd8bc9b5446b039.1790915964.git.4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790915964.git.4ncienth@gmail.com>
References: <cover.1790915964.git.4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7d3f3b4367f3 ("net: ipv4: Cache pmtu for all packet paths if
multipath enabled") made __ip_rt_update_pmtu() update every path.

For nexthop objects, fib_info_num_path() and fib_info_nhc()
independently load nh->nh_grp.  RCU protects each group's lifetime but
does not make the loads observe the same group.  If replacement shrinks
the group after the loop accepts an index, fib_info_nhc() returns NULL
and update_or_create_fnhe() dereferences it.

A deterministic probe only widened the existing window between the real
operations.  On v7.2, an RTM_NEWNEXTHOP replacement published a
one-member group after the PMTU reader accepted index 1 from a two-member
group, producing:

  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: update_or_create_fnhe+0x45/0x15b0

Stop when the indexed path is absent.  Groups are dense, so no later
index exists in that snapshot.  The same real-writer window completed
114,423 PMTU iterations without an oops with this check.  A reproducer
is available on request.

Replacement requires CAP_NET_ADMIN in the network namespace.  Where
unprivileged user namespaces are permitted, a local user can obtain it
in a new user and network namespace.

Fixes: 7d3f3b4367f3 ("net: ipv4: Cache pmtu for all packet paths if multipath enabled")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 net/ipv4/route.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 37674d76f90f0..5f2197874bebc 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -1082,6 +1082,8 @@ static void __ip_rt_update_pmtu(struct rtable *rt, struct flowi4 *fl4, u32 mtu)
 
 			for (nhsel = 0; nhsel < fib_info_num_path(res.fi); nhsel++) {
 				nhc = fib_info_nhc(res.fi, nhsel);
+				if (!nhc)
+					break;
 				update_or_create_fnhe(nhc, fl4->daddr, 0, mtu, lock,
 						      jiffies + net->ipv4.ip_rt_mtu_expires);
 			}
-- 
2.55.0

