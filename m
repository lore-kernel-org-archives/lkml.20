Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156E93C872C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231621; cv=none; b=Yh/otLGZzSJqB3AOUuwSJY8+KBGzAO67CpuNs4pwUUsFBFszLok3GwwLFmnmjeIk5HggtBTdEci8B27NKzqZMN0txgiCUMgq/nZVoCav/D6fJz89MpJ/pSmN5FLdXjMr++vARZuDkdUMHc52dUTe13ZsgkWDyTlcJPH/UXq6vtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231621; c=relaxed/simple;
	bh=FE5OPgwnnVq6/EkJf7a+/zJUwDgjDRqkwrS4uw9s8mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYgJObtVxhmvbcAzzclkeSPxRihl12IhdxxQ+N3syYAOsqwX+41V+f7s7pYx/7IYImL0h6vDcA26ZdvfUYdKJTq+lwIKcX6ew4sy/5295v0FB8nfiBiRjuO1PDofQ2rNy71xixlTPL65jVsXZSkwQQd3FHkodzgXCEfdQKlksM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=IYW53Xw7; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="IYW53Xw7"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so4882985a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788231617; x=1788836417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQXrMd6szNFFZL5zIyMougTL9fSbFjixTSxmkZ29BaQ=;
        b=IYW53Xw7/V8QWarNBp5AoNm1nMNs9AuNqq3rZgBhYRQjycxfQLnZ+iG3H52yRbrmpH
         xDWKICHRZcZqEFxz847KS5VcQbTdUTLShJweGpdQQjMp0M1bvJLW/Lz4iLVvl6T+/0Yz
         /IK8p0bOEDAipSs5z/G2Zom6NIw5BAE44+tCgjhZLIGo+L+57RrDjHQw9MDY2ZZI9NYB
         gzWV349H1Y8JE8QVmAubBQZtR7XuborCNIcUDyRtZyUpfg1CPDQNvIgO0CRj/rcuBCXI
         SJC2CfcMbmrtnCZn0xEBM9gL+297RFQhtQ4HLxoR86ybZ5L0NnYHHqUnic6BTcdux7ro
         0RoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788231617; x=1788836417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DQXrMd6szNFFZL5zIyMougTL9fSbFjixTSxmkZ29BaQ=;
        b=e4v9dCEjKDVS6Dwt6kZYW9TvVJ4Fvf5HhAWzset4fwSldEE5Vhc8ACGfGMf7y0NDgK
         I2t/bi5hmpgiBJhVckdo5Z3gxqh9R5MEHeMOKdHOFnrx7wGKpbLenU5mODfK03xwCLvy
         NSCSsogy7UiwbtNexUSFJQTZFFh/2KzAdTFxoyJzTF3UidsOhtMG9VJdV590sbzPXgQl
         WH4H44aO1PEYDKhw9d3tJZiKVgogIX/lrvM18PU7oFYRFEYWHJPnvjxQyklAQYdo9Emh
         jGVk+YQc0BKl0WpG0RUy8zII2SpjLKglpiXIJWLthYPho+wyD/QnVFlqbwNxgF0n/KyJ
         j95A==
X-Gm-Message-State: AFuF++lsZgTHWyo6fI93Y0x+AwJyfxJBq63LFydiezuNPCwKckGZgd+f
	6gEPY0YSap1rmvsvUzcY5FI1uZI/jQqour8iAvULvS1YOzNbjC/8Y4vsl1LIg+vnlCQp
X-Gm-Gg: AYBFou2WBwkRnLTQBp3BoktdE/DvIPfNrhrusZH89kQI5leaMuXSvS+i/MdUPFnlF97
	iTm3Haq+aE+/+RmmGnTmAKKWbr1P0h3f1CZDU8uXj6SA/Ln7lT+0Y8Ddvxex6Zd8CEiOdHMksVz
	sQMAvf0sE7pN5oTvosC/WXc/FyQbnWzK+SNbS2js+tI01lWqCykgIEsC0xiaB76eOEm24qQQegO
	MV64AFW2rFMiFPmNVKrlY/v4+l1+5YzQUswsz/sCVN2EOPToYF5X/t41f2J/5Z0y2ZQ9OAwQBfZ
	JDvXGbQrulAOWxlLXNbR9MdrgUBHXZB++6JJnIS0F6V7QcnE66aHmU5it7+d/I2c25rCm/CPQIE
	CSQbXlAfLRfuLMsbv6msXxK2Mn7zRBXB9QeqGan4huNTZrXuPdtImtcPTW5JvbTmKOi/TqKkI77
	YZ0QMFvMtCO2k5oPGqMOHKFOfgwMA4giqoCWBt7oJTN3cxeZTiefB5EVFdBxKthayOtUoZdqXZG
	G2Qx8rnXzbb1fcARsSMNxccveMaxg==
X-Received: by 2002:a17:90b:3b41:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39907cd4e1dmr5994892a91.6.1788231616458;
        Mon, 31 Aug 2026 20:00:16 -0700 (PDT)
Received: from b6ad5085b32f.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990baaeec3sm2909012a91.0.2026.08.31.20.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:00:15 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Patrick McHardy <kaber@trash.net>,
	stable@vger.kernel.org,
	Zihan Xi <zihanx@nebusec.ai>,
	Vega <vega@nebusec.ai>
Subject: [PATCH net v2 1/1] ipv4: fib: bound automatic table ID allocation
Date: Tue,  1 Sep 2026 03:00:01 +0000
Message-ID: <7b6bd9bb1bf6bd43db18156f42b2d7f83789a673.1788223735.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788223735.git.zihanx@nebusec.ai>
References: <cover.1788223735.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fib_empty_table() probes every table ID from 1 until it finds a
free one.  IPv4 tables are stored in a 256-bucket hash table, so a
dense set of IDs makes each probe walk a growing hash chain while
RTNL is held.

Automatic table assignment ("ip rule ... table 0") is an IPv4-only
legacy path.  Bound the automatically allocated ID to 4096 so the
RTNL hold stays bounded, without changing lookups of explicitly
specified table IDs.

Fixes: b801f54917b7 ("[NET]: Increate RT_TABLE_MAX to 2^32")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Suggested-by: Ido Schimmel <idosch@nvidia.com>
Assisted-by: Codex:gpt-5.4
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
changes in v2:
  - Replace the bitmap-based O(N) rewrite with a 4096 cap on
    automatically allocated table IDs, as suggested by Ido Schimmel.
  - Point Fixes: at b801f54917b7, which first raised RT_TABLE_MAX
    to 2^32.  1af5a8c4a11c only switched the probe to a hash lookup
    while the scan was still capped at 255.
  - v1 Link: https://lore.kernel.org/all/0a00492a13038b268c1e0a219c138d07cfab92b3.1787982246.git.zihanx@nebusec.ai/

 net/ipv4/fib_rules.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/fib_rules.c b/net/ipv4/fib_rules.c
index 4edb0dca7be8..060501b376a8 100644
--- a/net/ipv4/fib_rules.c
+++ b/net/ipv4/fib_rules.c
@@ -214,6 +214,8 @@ INDIRECT_CALLABLE_SCOPE int fib4_rule_match(struct fib_rule *rule,
 	return 1;
 }
 
+#define FIB_MAX_AUTO_TABLE_ID  4096
+
 static struct fib_table *fib_empty_table(struct net *net)
 {
 	u32 id = 1;
@@ -222,7 +224,7 @@ static struct fib_table *fib_empty_table(struct net *net)
 		if (!fib_get_table(net, id))
 			return fib_new_table(net, id);
 
-		if (id++ == RT_TABLE_MAX)
+		if (id++ == FIB_MAX_AUTO_TABLE_ID)
 			break;
 	}
 	return NULL;
-- 
2.43.0

