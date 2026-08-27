Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096D7366075
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787855229; cv=none; b=B/+ZHASVCyYcblh3pydSmkhmgMEt2kmXuQLzJN4NslCTdZXrMYBqspJbF0oK09+yOUezI5hmrn1gzOsCxGV/1qNiWBbgA7U0iTKgkybwn/tjUCkjCt0gO8hbXCKwEf20VL2vKyJeVudsicbr+dWGvUEXX363AiWL4LDGiKCTzs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787855229; c=relaxed/simple;
	bh=QYThMHGG1K+g7XdUfWdgFZNifigH3qkZM0bwORC1CQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f5o1Ipx4jV24qWqyt9dVjGGd9NJUbFe+cOGJE0IMj0gpNA2P621/gjkMNQZ4GhW42b8KCNwN0UUntbZRfDCm9w0xxqO3+WM365C0RmFol1XOR8u4wmvhR7OsYpK6eQ7LCFbNqvuZnCQwcLAVuQuRfDp2QAchUHj6oXoMonAPwWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=mtgkdzHJ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="mtgkdzHJ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso96817b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1787855227; x=1788460027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bWfJta+Gdp3BTxZw5fOdxizjLpZb3H9i2ar+IchDHeI=;
        b=mtgkdzHJ+kKOLb9/pocEM+FY/c2arAH0DntR+IA9oQ14bo5dSXnw+Y6sDFXInihc1A
         5XLerAETkgMvTj8QDlMQOi7OWatckE3MOIZrEDFcVfEXXpMrMFnoMCQH8ISoQzlx4e5F
         fm2RGmlIgZiurQra9JMCe2k2Mh3LPZ6lOsC1CEkELC1pcLatBmyfIdtW/34r1bAW8HLv
         nMCmxs8YEC0h+aDnIpIt4sxfOHDWifFwUSFlZxmwpZzcvDMJlUb7RHZ4jLiCjzppIQo5
         aedi4VjJkQ8K7+z6kiNY1nXhJ4Ak/9IL5PhYGnNPpQotXuEaIlYhm1U854IewrL6VM8R
         tXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787855227; x=1788460027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bWfJta+Gdp3BTxZw5fOdxizjLpZb3H9i2ar+IchDHeI=;
        b=WnRRmfOq67TKupkX2V9w1cjtrIB4ADVeX9b2KjCATOD6fd9BbqV6/0P4hyWejtt0ar
         kDP1iIBNeThex66W29IKPMjNJaWJpwqSAliMGBJwvvcYUtk0pfJxe4fArU7W6FsUWh7V
         ASN6hwn+hty16+0uWiprkekyAyYcqPLXljltcd8anXYj9sHlM6xAWBbI6v++KNi09QTQ
         lP86xw098DoWb6oBw+xerbtWrw/Ts3ZwbqW4L79gEfu4Rxl477zQIsFDgQ4ueKfz7sXi
         /TLNv3O0xg+PDIfqolHjwfm4vncT5z15eHhpDLAl28ZRSr1mfb2hTXeqMCYm+65GKkms
         Jr3g==
X-Gm-Message-State: AFuF++nUv4k5vHcVIsDPqDLJcrViG6x+pa08CHWBDUQkONQ9dem/Dae3
	Zc03406Qx+J8kXy5XjA3JXeEdsq4P437gsAg91RPQP738QdKqNZ0bXVcPJWtcQdRV3MC
X-Gm-Gg: AR+sD12PZhlgVmwamCDc6xyjrnYrEZvISUrv1No35gcb0lZtDL0V67jcbHkwTaLdAhV
	d67sp7Rp7DhqesHEPkttwmQ75aeTKjqhc5qMVb+ohtngjqTBGQncGmkO4SD/HOoZPip74ukLWeb
	FE6TQ3wmtm2awUCR7HK74RzWqKR5VJg3qs9ymkzWlLirEE9DELmVW/XFLDYm6F9pgYGxpdr0A+z
	iETyBGO1fdSTuoHkTYJKOrAM8qirGIVeNlLgxaxblPLtCnU/XrOuYc/7frfBKGtMbS++HOqd3wx
	8H7hDuMtogImPYsoFFURAapAyhgEakzyCIOeCFD5ndn4YmzcvrY7VeAgsljF6R03gM4uZGeU/6O
	b92UDzioXLicOaiLMysD41uXRoHzzEdSy7dotUWjr6u++uLPMX/y81gvuKYLuBNj552uKVW+iZk
	ZySROdNmf6HC56fti8D/KDbKl5AKK5JqaEyYeq2+jJFEchBH6u2EnyDMJKzCNbVxiTQDrmkheTV
	pl7FQhfDiHWQA==
X-Received: by 2002:a05:6a00:a585:b0:853:90fb:aa6c with SMTP id d2e1a72fcca58-854c6485748mr12053839b3a.2.1787855227265;
        Thu, 27 Aug 2026 11:27:07 -0700 (PDT)
Received: from gmail.com ([202.201.12.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535cf4462esm2333905b3a.53.2026.08.27.11.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:27:06 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Peter=20N=C3=B8rlund?= <pch@ordbogen.com>,
	stable@vger.kernel.org,
	Zihan Xi <zihanx@nebusec.ai>,
	Vega <vega@nebusec.ai>
Subject: [PATCH net v2 1/1] ipv4: avoid divide by zero in fib_rebalance
Date: Thu, 27 Aug 2026 18:25:14 +0000
Message-ID: <20260827182514.4667-2-zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827182514.4667-1-zihanx@nebusec.ai>
References: <20260827182514.4667-1-zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fib_rebalance() computes the total eligible nexthop weight in one pass
and programs upper bounds in a second pass. A concurrent change to
ignore_routes_with_linkdown can make the first pass return zero while
the second pass sees an eligible nexthop, resulting in division by zero.

If the first pass reports a zero total, set each nexthop upper bound to
-1 and skip the division. This matches the IPv6 fix in commit
d2c26c2911dd ("ipv6: avoid divide by zero in rt6_multipath_rebalance")
and preserves the lock-free rebalance path.

Fixes: 0e884c78ee19 ("ipv4: L3 hash-based multipath")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: Codex:gpt-5.4
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
changes in v2:
  - Replace the v1 RTNL sysctl serialization with a total == 0 guard
    in fib_rebalance(), matching the applied IPv6 fix.
  - v1 Link: https://lore.kernel.org/all/cover.1786812660.git.zihanx@nebusec.ai

 net/ipv4/fib_semantics.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/fib_semantics.c b/net/ipv4/fib_semantics.c
index 0483519b7fb0..7a362f2e2c2b 100644
--- a/net/ipv4/fib_semantics.c
+++ b/net/ipv4/fib_semantics.c
@@ -874,7 +874,7 @@ static void fib_rebalance(struct fib_info *fi)
 	change_nexthops(fi) {
 		int upper_bound;
 
-		if (nexthop_nh->fib_nh_flags & RTNH_F_DEAD) {
+		if (!total || nexthop_nh->fib_nh_flags & RTNH_F_DEAD) {
 			upper_bound = -1;
 		} else if (ip_ignore_linkdown(nexthop_nh->fib_nh_dev) &&
 			   nexthop_nh->fib_nh_flags & RTNH_F_LINKDOWN) {
-- 
2.43.0

