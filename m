Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2114A367B8E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790916684; cv=none; b=MNWKF+327RVFHeYfq4exEW5el6ilxDnDTy7K5xOoi2+RZlQoMmWakW9LgyBvN2m2EVQDcVFIuTSvViNgR88ZXCCGt2yCaDXwgOBtGcjrI/WBf4Vy6ti/l6NwNwU/RrYhrJ/wdt5WtH9rA/Z6M3oQXalWntYRDriSQ+zvtT74Fmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790916684; c=relaxed/simple;
	bh=EGguTxu+yiR4KwL1wKGNSQg0HqiyBt2K1DUYSLPw5F8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1R0Hzpp9HYT3e8ulTDQk1qkGY8wcRNiIsf1cIZZL3H8SiyJEdK48PPPp28veO/cWpEFc6YMTumYDZPMzJtMcsAKaqtN4Y2wsWJmGw0quaFzRDFJdFuhyiSCfHL9gUjcRckha7eNpCHAuuVu++0rL7aOszrkN9PSowml641ZYXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqSoiytw; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqSoiytw"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba91so3551890a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790916682; x=1791521482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZFYDOqsBqKsmqK8JD9bXDjgEMMt1l5X2G9myljwvLmU=;
        b=pqSoiytwOV79ViU1elSejbgGBkcNMAskEzMq401Kx4d7dUhfuvHewAnjf8Zq54vauq
         veu9TWfbv1FaossOguPAii++wGK5Nw7xnaXFrDgVI32n+dIOX+uPj3puZww5uADbbqEf
         Yd53W7/OA6xGTwkk1MikccdQzNbY4ncKdgeWCDBSA71HijTwRji73T1BRrvAx3rijgek
         68uV+/MsB6RPtBgiCW+k/mO/oFhQtJK2vugCY9wQ5atIbEPTpmdpvqIU/o1wtMh6j+JP
         v4KdijnQ6Vkmk2+0ggg5HtOaAyv+EZJTvoaVeL7G9H6YBZvW2Apdx48qvgQ+x8/20xr4
         1ktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790916682; x=1791521482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZFYDOqsBqKsmqK8JD9bXDjgEMMt1l5X2G9myljwvLmU=;
        b=enkqHfzIkdL9QBDGKxbQa53X99c1nqC5cqQW/nVKilJhYiECMtK3DIpyCXV8sPvFy/
         ps06Q6UFqUeDVG59rXAudWMGWb+qVIosdp84KpBRoroDuwd6wmLIOf5WoFfYxnAO0DuZ
         eLSEH9lj4aGVkeCxFJQG67wzMgVGk4wnPiefG/8nJ8GHm5MQPpCMNk9rXZWxJOpXye8D
         v79Cuc+AVuslUZaffNhXB8wNrJtf1tTE6HvESS1Scjw7irLgriXQ+cuhueYCnFDt8JxD
         l7577NVpcph/yDTephQ9UKyx8mA3dIlmgYHdjxp/lPV8Rh5il018szWdOJY/RENYdtBG
         4aFw==
X-Forwarded-Encrypted: i=1; AKwUvBzs5zJloQqLOfW1SlKLlqrHl0hGTNT0mFMzFyKJE9xSXDTgoaIcHJdFlreIleDMKFF6Y8nPpR5lxIuK7wk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyKhcDQQlyVcOUpAyi/8jDH/rGYbha2/nW4TyFcAWlnzf74Y1H
	7AvfZ3Ia3MneUpbfvt4K3g6njqVDBQ/2jVml82t8NCchs/mTvuzDgSh2
X-Gm-Gg: AYBFou3GxWwHY/lDOVFxDg2GUhgB1S04O6wlAtHWAQ0LULwxnfWd/P7eAOV0EzgvNdC
	i+7Ri6mRH8geeAKgj8DTegl+HqjN/KhZLTjlW1Lcx6Taur+pYoXfPLZ7jQb8YjKyP/BDKuf62zg
	iGb+tQyK1u7mgF+Gc72eOTPtSIHpgBfJVk+wzNQ+BHo31cevCc7WXccbCwvIos6e1t0C1Puq6k1
	M2Eu13paNFX4JSQR3A3qgbTaFLRo9EREL+Qloy9AQHEXpV4edreoH2ToJhnsmb4e2mr/i8AoxZZ
	cHUf9FhgHKDnMuIP30+ewKcXellbB//NcQ85oI+35F+xcW3dliVue0Z1yCci5jZIXXdAzo+JQFF
	PtkKjXAO5xzFiGXmZwkrGJ1m854N0a7WgOxuJsoi9kpHllVzGeWF6FkhBGZfNCqDwhX6v4MwCvB
	4VWTAEhid/+kGJ18ZYIBv6JV4b5vArQPbNQUE2nIW9bgOkzCI+8ax/02wczkh84wjSQkO5aSZwj
	1yUj+q2tN4=
X-Received: by 2002:a17:90b:35c3:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a6cead5baemr1466604a91.47.1790916682376;
        Thu, 01 Oct 2026 21:51:22 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd3962f0sm642682a91.3.2026.10.01.21.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:51:21 -0700 (PDT)
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
Subject: [PATCH net v2 2/3] ipv4: stop exception dump when nexthop group shrinks
Date: Fri,  2 Oct 2026 13:50:59 +0900
Message-ID: <5bb7bd97411eb9db454464bf449107395e760f26.1790915964.git.4ncienth@gmail.com>
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

Commit 4ce5dc9316de ("inet: switch inet_dump_fib() to RCU
protection") allowed IPv4 FIB dumps to run concurrently with nexthop
replacement.

fib_dump_info_fnhe() uses fib_info_num_path() as the loop bound,
then fib_info_nhc() independently reloads nh->nh_grp. If
RTM_NEWNEXTHOP replaces a group with fewer paths between those loads,
fib_info_nhc() returns NULL and the dump dereferences it through
nhc_flags.

Stop the walk when the indexed path is absent. Nexthop groups are
dense, so the current snapshot has no later path.

Fixes: 4ce5dc9316de ("inet: switch inet_dump_fib() to RCU protection")
Reported-by: Ido Schimmel <idosch@nvidia.com>
Link: https://lore.kernel.org/netdev/20261001170513.GA1657889@shredder/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 net/ipv4/route.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 5f2197874bebc..268d8821f7e09 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -3170,6 +3170,9 @@ int fib_dump_info_fnhe(struct sk_buff *skb, struct netlink_callback *cb,
 		struct fnhe_hash_bucket *bucket;
 		int err;
 
+		if (!nhc)
+			break;
+
 		if (nhc->nhc_flags & RTNH_F_DEAD)
 			continue;
 
-- 
2.55.0

