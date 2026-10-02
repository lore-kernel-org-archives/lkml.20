Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD88361DC1
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790916674; cv=none; b=U8KJdaWsM89EQt8ZFQZNRtrxo/DIX6+Dqmll4TDhkahOuqrYzbIF5rCabEV6zREOAXZbznbCmvNHMQeVwv2yDtO516P6fHMpbbPTFSwwvwnXkuW+WXz1+san75ImtwuMS3llwTuMidq7LZ0ZO+gHz4kUV9RaJJY8rj6bQ4vcSp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790916674; c=relaxed/simple;
	bh=nqiEs/yNZYlAeYT+GuoSdhvwQmIIqc/V9r7buHE+D+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nQZiXIvkEI++Web6EeCgB2elqt6cpynzBadw3wl4ePfdtQP+NyokkHpIxMAGuerUjl7FNRAMxRDfkdwHzr+t8fwpYBo5rK2apxmkzpwe+39H+aNhQ+FM5DDdNWr12fOkWIAkmkAWFHId9lMv/yMrZ/6kkjmxDwbf/0IN3d2R6bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8jj41OF; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8jj41OF"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso2894770a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790916672; x=1791521472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iilXiQzuSFQz+l8QQU4nopfLIRLODykiTqVDi/iuygY=;
        b=a8jj41OFuOK1Qb8HTJSjNOovYdljwQ/rAczgiXN88r7bwm7zvWa2jtNr3VXLpVPprK
         ET8VX2OGvkSigr9muYNL6pmXdCdRT/y/QeZW51a9GpM7Az7AQLIxfiuWQFpo8iWE9ASV
         FzVyaIFYTtjAI5tHYSLg55/3ZsHIQfYsaRA8DmY0pmkFOVKtrQoejod3CAHE/7yzLJZS
         W0hz2qd4MpAyXzlLccXc+pYeEfcr21UYinkOf18MsQaLKdTO4axgcY78bJZ5KBkI+eeI
         osvHYMH10G6suk5kf9JjOKrOJZGJ1Xjbg1NGKuOeujw6cjvJImE4SBtCmXeVD1sSAM5b
         yRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790916672; x=1791521472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iilXiQzuSFQz+l8QQU4nopfLIRLODykiTqVDi/iuygY=;
        b=eMttv+j8JIncGIZboqxE1CzwmsZdCP+fJKTHVHDlVCSAEenWIzomUv29J0CAC8K5e2
         +xRK/6GQatjtrWfsplMLX8nT66YaCbyPWXdiNnVrMZAh67SgcOK/sZ64qZVgaSXvu76m
         KeV+sQ4SFQk5L0JRq37Uojjj2bO+tNouuO/ZhN+RkbbXTJV7OhDRctZEKcKUZpZWEsZo
         bptpKbhsrvVY6uz0ImtrtuIbXP0MItrRrtP64LutAhzQCfvGl9qeU39etUyxqR9hv8Xc
         Hl3Yv3fvlPQr6cXK7dyZN79yhHR5P81ZoVXmg+JsI7ziirzMf/oswtGHWOOjthDFi8b8
         YL7w==
X-Forwarded-Encrypted: i=1; AKwUvBxt6jvsTGrNXVcWfCUVDl8oj/G4Dfqsdy30ZRFORxtNjqoFfnjfmmw3huHuVlZq/j6hkQW/0jajhI5PA5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOw1tFLDq3iVgNOBvcD3wzW+zOO1q2tA7MewSuL62Bt8LL0tmx
	Fu21XKDRzeAXih0Gh/UvOPbhSvQ8PNihGwJxv5eddeJayq9jPmJ4e8D/
X-Gm-Gg: AYBFou0GCdIG2v5kSnGir00H31/atRrbFOEhQos5LSGbIoaG5ffQqR9ITzuw5/mW4QW
	4GUM8S+XoFWKlYTR+/YN8z4oS7WovQdi4AJIFrEYCyD2ejIxejZrQla6i8Ri9MsSQXWNffQQjem
	5eJlkPTUQSrM9HJGZVopRuI3N6B4djGG0wHE8xTZVAdpe2CMo0l4ZCaRVPWJL9Y+rWCin8KR8hD
	xYxwQvzE3N/l2LN36F0s2h/lAQO50cKcJs2SShCrY70b/drltWGOmMgWecxe2XG5MzgYevpLsS9
	7/6Vtzm1iUbBkIad4sea6cmDjApU8ap03BB3DvGTmoGRkcTgbv1C2ymfI1+gplXn0/jqHdjE4n+
	Oc0rXSE5YZql1ZduhFZc7PhQR9PgttLWQpa1to8BbQuIYSSeUYYvnOeZF9PvWlTurS6mbHvD1P6
	NhUEuHgvGv6fi1Nb/Q8ipZ1dUS0R72vxHZQCM7pMpnCVFyGid3HhAj2yHmUJh2GWu8BWlrnCta/
	7KdGvUKYBZPmlFQkefl4g==
X-Received: by 2002:a17:90b:2249:b0:3a4:cb38:30b7 with SMTP id 98e67ed59e1d1-3a6ced70b5cmr1491944a91.59.1790916671871;
        Thu, 01 Oct 2026 21:51:11 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd3962f0sm642682a91.3.2026.10.01.21.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:51:11 -0700 (PDT)
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
Subject: [PATCH net v2 0/3] ipv4: handle nexthop group shrink races
Date: Fri,  2 Oct 2026 13:50:57 +0900
Message-ID: <cover.1790915964.git.4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fib_info_num_path() and fib_info_nhc() can observe different RCU
generations of a replaceable nexthop group.  An indexed consumer can
therefore accept an index from a larger group and receive NULL after a
concurrent shrink.

Patch 1 is unchanged from v1.  Patch 2 addresses the analogous
fib_dump_info_fnhe() race Ido identified.  Auditing the remaining
accessor pairs found the same issue in the RCU-only hardware-flag
notification path, fixed by patch 3.  Separate patches retain the
correct Fixes tag for each concurrency boundary.

Thanks to Ido for the review and follow-up pointer.

---
v2:
- Carry Ido's Reviewed-by on unchanged patch 1.
- Add separate exception-dump and notification-sizing fixes.

v1: https://lore.kernel.org/netdev/20261001010550.2742297-1-4ncienth@gmail.com/
review: https://lore.kernel.org/netdev/20261001170513.GA1657889@shredder/

Validation:
- Patch 1 retains its deterministic vulnerable/fixed result.
- Patches 2 and 3 are source-audited only.  No new allyesconfig or
  allmodconfig W=1 build or runtime test was run.

Daehyeon Ko (3):
  ipv4: stop PMTU walk when nexthop group shrinks
  ipv4: stop exception dump when nexthop group shrinks
  ipv4: stop route notification sizing when nexthop group shrinks

 net/ipv4/fib_semantics.c | 3 +++
 net/ipv4/route.c         | 5 +++++
 2 files changed, 8 insertions(+)


base-commit: 28bc1ef699610ee09ce3d46a00552f5a0a0144bd
-- 
2.55.0
