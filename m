Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900A6314B72
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437391; cv=none; b=Y+MX9h2UgB8Xkjc3HiZR18XUXvq/zNSdDMZqP0VJsGw/skEeUNGfqPhDK83i4l/g6ZIJ+VqLbCDup0zFJ5jMNWanH0yf5Nqff8mX1mRades1k2oC33KL5p407FHPQmCQJiZcl/n2K3p72N6anreuosQ1oDqQQY3Q4eRRVxDPm9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437391; c=relaxed/simple;
	bh=/5UFvdGu+OHYF/gq3sfGR7CGH984AqlEKoEyR9gRllI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+LT0o2vMMoxZDnjLqkYP52d7dBbqD/Emdj0u9p4iEtFT9Rr8ymS1Q8eLZadw+Z5pqnNWZwDArWEr6Z78aROscVwxIlb8kO2Oo5AE6WlC17nyIDbUNCUOh71dMGvmAZGBRY/ELJSIYfTcPvYXlnE7mrb2/eti7SafO3Rk3CXBaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cx2POZGW; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cx2POZGW"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a80e169311so1914847a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437390; x=1792042190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGoxhrVVZ8PQS4Uszm5/WMaB7d9N6tEh6N4uLXjChtk=;
        b=cx2POZGW4juE5ZREcHGfS9DFLnqJdjwDAFri2IGuU12/suTgZyF+ULheLf/KL7+RCz
         FbDGJoAo/CMYCjXO49fNDq+YeswQiwxofhZrf033XFLo+s88bos/CntbkVyuEaOpFgM7
         UW9mPgsai+7dzd4Gjy104M1Y4Ri3DtgUrM/iu1er9MNfHDQJmb+IS6pa8RW/oQz2+jrB
         vC/BBFuQKgHxL8FGaCRBewPV4RejuZBhXPenYar5/NYsUVe9oDDofbjv7RSkyoQcvOHj
         fsoUk2qWoGJgy0HuniT0eIGTrZxV+H4yvORfbl3ubgPM6e1dGWaDdZk1BXTUzKJaYNp4
         CEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437390; x=1792042190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hGoxhrVVZ8PQS4Uszm5/WMaB7d9N6tEh6N4uLXjChtk=;
        b=n8C95fRhgU4lSWpiG9cdz99S9Ydvq0i8+PSPir9gwwj9ZJRvR+wlTZxUrVA/WqBCs1
         Wn4IVbcjD+O1YtzvMKbyeQ5md8oI0twh0YGCNT8LKb/mlASTEaKxPudF8gBCUXvyqXSn
         biXQU7QAoeTdhmfc4e2t5SrTJb8sWHX+kOIo3TW36me9CFz3yaWZuMWoK7VwNLv7qPHa
         p+iHJ4saO7wprJM8DNN9cbS9igPBxT34NF6oM3IF03Ch+5h/IVf6ADHOkT8Ldgz2mKgq
         Dxh2y4HqE1AU55bHC+PGpRSimarIWoksZH/T5hcRejFXXEKhtRSgyA+dpZFOTZz0DQk7
         covw==
X-Forwarded-Encrypted: i=1; AKwUvBzJ9qR+g2wesYLdXFxdLHhCmT8XRwr+RvndCmZZg6KoZOYILtSWMISjKM+TuiCBfMXkvtVPYzcwMMtDAGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW00cA0JIcZOQmsCcS5xGYtjCsSWvlUdqulFTQeMnGP4n1RX3R
	2y3DZmBKq+rWzPpqp5RcvEyrqJluebt2HmrMnoujeAd/RxVQCI1Ow3/X
X-Gm-Gg: AYBFou2EOUgzLrljsh7AJJxO0ILnpZe7A6dc/tI8kIKYyEVhQzKJUCST3JflXbl1Xru
	APlEM7l8QMVzWaz6ILZB7FmE5NNovBP6niu13xtAYHVXSLJY5rgSNcyvwbaAMKYuq7LtJRIrNjj
	HZdzcySuHEFH/WwLISFQvb7On9zOE2y/VImX29azwNT7BrNiHYZJdJFkiIB5aBdhkzAnLuve8fG
	G5PjsKLdTxnEody9PgMx9NH4s7UPgYz1BH6i042SGQ2tZ2D6h1Bxxsae/vrWd7r8+SiMugf6W6X
	KonTDD7MBW25mL6/gw5XD64c0hFtEUQ2xV2HVtARIlV5hS/EbQnPAQS4g9duYfI0owsFer3kj8b
	hjhlV9I0h97HTivpqYDQ6ZqwxWl1JCE5UO2o3OoI2NFeMKcL8PNAgtH8mAXw/70lp8DJvrUBiY+
	wvCpj8W22E1YCKN7h++WDuN6ctUDjkh/ruyK+OrZ8uAfI0CdqAEwvBIpcTpNPj2r5+oPa00gFoh
	ngAQfCyzD0=
X-Received: by 2002:a17:90b:3b4a:b0:3a4:adf9:5d38 with SMTP id 98e67ed59e1d1-3a89f674ce1mr3395846a91.4.1791437389813;
        Wed, 07 Oct 2026 22:29:49 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89dcc4e04sm3758223a91.1.2026.10.07.22.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 22:29:49 -0700 (PDT)
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
Subject: [PATCH net v2 2/2] ipv6: do not warn on route notification size race
Date: Thu,  8 Oct 2026 14:29:23 +0900
Message-ID: <4012604727e5ba80b69ccd4d08796511397ddaef.1791423190.git.4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791423190.git.4ncienth@gmail.com>
References: <cover.1791423190.git.4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fib6_info_hw_flags_set() sizes the skb with rt6_nlmsg_size() and later
fills it with rt6_fill_node().  With nexthop compatibility mode enabled,
a concurrent replacement can grow the group between these independent
snapshots.  rt6_fill_node() can then legitimately return -EMSGSIZE, so
the warning does not prove a sizing bug.

Remove the warning.  The existing error path still frees the skb and
reports the error to listeners.

Fixes: 907eea486888 ("net: ipv6: Emit notification when fib hardware flags are changed")
Reported-by: Ido Schimmel <idosch@nvidia.com>
Link: https://lore.kernel.org/netdev/20261007114003.GA1011260@shredder/
Suggested-by: Ido Schimmel <idosch@nvidia.com>
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 net/ipv6/route.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 153ce16628c1e1..a5e955e56e794f 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -6509,8 +6509,6 @@ void fib6_info_hw_flags_set(struct net *net, struct fib6_info *f6i,
 	err = rt6_fill_node(net, skb, f6i, NULL, NULL, NULL, 0, RTM_NEWROUTE, 0,
 			    0, 0, RT_DEL_REASON_UNSPEC);
 	if (err < 0) {
-		/* -EMSGSIZE implies BUG in rt6_nlmsg_size() */
-		WARN_ON(err == -EMSGSIZE);
 		kfree_skb(skb);
 		goto errout;
 	}
-- 
2.55.0

