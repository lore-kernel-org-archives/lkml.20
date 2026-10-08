Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5D53B8BBB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437380; cv=none; b=gckWh7lftUcwPZ1d0yGjrmq1HVlqGKU73zBZLjtV+Al77ukBLUnu6z0FTfmRDc/monc5x1rQUMoEXCgwM12XiFcZR6Ehn33BmNcc7oVN71u08LRXh/fDCSkjQfsyky2Y1kv1+JVFkq+GPK2vCpG2snPtABiK5xL6vGUrttEvsFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437380; c=relaxed/simple;
	bh=FujY0FuqAuIpkLZ3y+9g/MN53rcCMTlTeQOqOTnanCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wy2rkgTvRedGVbTHjr9ksKAazS+SAKCn223pukhNnGb0m1nXf8rNP1ra/X0oPiPJGdme2Nv6NOHgjA7nGJDDGAA0NVeuPcXsPDA7UQkpQg7BZLx9h1xg+GWBRKKOYeaD6Y0/aVFxSOefNrgatzKBzdmdzMUc7EIHpL2x8K0VYHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5I+NI90; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5I+NI90"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a7fecf8440so1565129a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437378; x=1792042178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DLvhL5rr6s47bfQUS28f5Gkp9XOkJpXtZ7mZKPR0QEw=;
        b=n5I+NI90Wi+5BHGbjKuqJzjvxnlBhtkl89NGTJK3c5ZNAEuMchJD7X1B+mF2GBf3xp
         VpTnmPv148uVdg4gQOWEMyRylIq0x01pTh8MSNcClZBFXFCm5OMB5l9Un8mRd7K98czm
         FZpA45l4gUvz1rdh6FgFMQDHyGWHlSnPQxDRvYOEpcj/r14jt8ovKQl5qFQU52wrWFi2
         uxxdL13drp1LCD8kxU9K52WzrMP5bu1Eabg1ED1RKECZjgU6sVl/QnzwkZSJAaqVx7Zk
         3kreTT8pHwqq5+NIbeF8X9OJBprYA405VXWULBUOovW5YyNi52XSAZHKQQOf2l4hmdkM
         HVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437378; x=1792042178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLvhL5rr6s47bfQUS28f5Gkp9XOkJpXtZ7mZKPR0QEw=;
        b=i4Xye7hV26VFuFfueXNud4Wpc8Cm1eP/PGzOCSR6Ewxgaou7N0gX0I4DoWgQFOWbks
         cA/PXcM0CLCskwcXkpJE/ISeXa32fFU9M1a/LyJoNXQIWaWe5uo6wlVc5WLj12T80Cax
         y24tcNA3lEg7v0vffdmATmB/X0emB8WxrcjH+1BCH5+Xb8YzT5MTnhARRzlL2yNVL7/w
         gEiZ4SihSV4bra+Ea+NIyZAnY+Onh9aSPThYJ1hzQB75G/8bOrU4r/pQa63OR5jiuK79
         Snq34Jm373x1ChldhUP43OBC6mm7WTxfcvJBqTALkC3I21tdAvmkycjEypwj5KkrWvX6
         FDHw==
X-Forwarded-Encrypted: i=1; AKwUvBzapEeDg8GZThyGiaoJuJxuRoQWkKi/EjHwKxmZjqTZ2fXnJiYn5Wf7Om8TnUaUv5ejPDAe+HoNwL1OmzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYId2qh6UUDwt4u4Gq2R3BZzdSOgKpEE0qjTWLi0SRiEIn4iXsfc
	Cw93u4Tpuq4fRVcwvQEElQtzF51caVqyLuxVb71/hEU5l612TIG1PDRJ
X-Gm-Gg: AYBFou1CHFBI7DM0TeNyQ3q8h6HMdmVx5SCTJ1tWGrxTKHa3zgeqqUlGTi0th+ecJpL
	P4M6DZr+oymPX6vMO6UfA1SjPbODu+7fzAotfAdsb1FoqUCTn9ADgLzy5u8a7AWK3n+ciStOXMd
	eGB/lrVTm60MMs2ZJL+GpR070epEoSwCxxEfnFwRD5TnE67cPuZHsf6w0YjUHhsjmtx0jNw6QUR
	jtQFwOWhXxtvUJytZkWVCTNUvFo3AfBV4qmYZoqmJr2JTS23cW7tE13LE6UDJ/0ZB13k8U638Em
	EhkAb3i1o+r0QzMjJ1V0hHQ7ptZ5XWuFMYa5Sk4IrQXODCCFUm1w8GoJUNyy1amyiVa1eqARp5d
	x5Dca585OM3PrGt7FrruF3eQz6wuI9LtmhV9ROS4aFm7AM0I+JDFKeKY2S0NDdKFvDVTt1QY+0b
	bT9QBhMV/Kq4dPY2OTnmcmAe3wzjAmdj3aoMoQsE2ctrJoVCV0B04+g/qa3Y+ghMSA8T6uyaQIN
	eRSNsW9fnI=
X-Received: by 2002:a17:90b:2584:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3a8a192b889mr3373640a91.11.1791437377539;
        Wed, 07 Oct 2026 22:29:37 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89dcc4e04sm3758223a91.1.2026.10.07.22.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 22:29:37 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Amit Cohen <amcohen@nvidia.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH net v2 0/2] ipv4/ipv6: do not warn on route notification size races
Date: Thu,  8 Oct 2026 14:29:21 +0900
Message-ID: <cover.1791423190.git.4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A nexthop group can grow between route notification sizing and filling.
Both IPv4 and IPv6 can then legitimately return -EMSGSIZE, so remove the
stale warnings while preserving their existing error paths.

Patch 1 is unchanged from v1.  Patch 2 adds the IPv6 counterpart requested
by Ido.  No new build or runtime test was run; both changes only delete the
stale comment and WARN_ON().

---
v2:
- Add the IPv6 counterpart.

v1: <20261007045410.3806739-1-4ncienth@gmail.com>

Daehyeon Ko (2):
  ipv4: do not warn on route notification size race
  ipv6: do not warn on route notification size race

 net/ipv4/fib_trie.c | 2 --
 net/ipv6/route.c    | 2 --
 2 files changed, 4 deletions(-)


base-commit: 23609bce9e1de525d1d0e73fc68c6e7971d0b49e
-- 
2.55.0
