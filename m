Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97EE4ACC9D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016022; cv=none; b=pySvhhzbYinlKQq2dV5Zvg7yOJhCEuYItxajZ0pLtciQJxSgyB7odjtAMGHElhJq4KTVSlRpHD7VvVdnx0yyB0hYaefMGfFJQcDqR4I+/k0ydXp1P76hiYBOA6IXxY2KQ15OZxV7ajJO2yRC46TRWEZNnl01q1Arhz06tKmLGSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016022; c=relaxed/simple;
	bh=rzk+SQ65GZTwGcyOzgZAzCF8pgwnzPi/zoRs0lmUHdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OGDAV8X8I7fxAnur57CQQcCh9QDseqpQIzaH7VwH0S89I1LiHw77C/RZTHMrsuuJFWOxMRelnwHzU9LVHPbmb5QH1KRxEPg/KkL7umuzA2A5FZDOXA/zN/vI0qKpR2xOucBE7si9vFoJzXoQVDZIc0AT86eRTS5q2nehtaFgkaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=ax4WjLUu; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="ax4WjLUu"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35f1f76ea84so244511eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1792016018; x=1792620818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eAygOaFc4LHF/Oyx+4laODk7Ja1BXhOoWbgmH1NHvto=;
        b=ax4WjLUuwgObv4UrQcH2Vy2/yHWB8ISi4+QmEcCQwgqDuJNPMhwBDOucnvyVsU/61j
         zW0mSn+wJcCVCVeFN1+KsidYAF3RV6WopIDTO8oXnsAjfN2LRe/4rL8YsWPOLqo4MaHX
         dG2iVeT5wkTpvlDJ6f5C7moEyTRg2jibmlOukxKIQdcnJaUBxbbM/2EshNUowg81YLfF
         a4S1y0HYzIVnYj8G1wo6TZRKq6UYmK2lNNI2is1LKLivg4HXp9FhIkwkkImFSBjlo//R
         Key7MBg6I+8Qrsg/S220N3W/7dG0U5MFDNdJsPjp6mSyNhFfWgCCV5dS6UKiJ2yUwJfS
         dzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792016018; x=1792620818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAygOaFc4LHF/Oyx+4laODk7Ja1BXhOoWbgmH1NHvto=;
        b=eoVqhwu9vsMHjstW8ROfrwoLHMvDcjWooH1Ez7g/zZL6V0NTKrYznpFiHuGKF3lF88
         cORGsuP/rS+NqUntO/+/e3wbZctPBhtDTDElkMcEUIlyC6aq9Q9JP9lrrLWs4PzNuU0s
         FYp233ldoLoC89+ke29FYvGCjZe61QixvnkIxqEF+Os0S0LvGkkjPZHl1CKbtPSdMriO
         EajUBMqWLm60n2tLm/nPZigw3IoK42VsgNaKr9o91OEHGndNbd0sXWGg03wuS7n0W3mn
         /p3HP8QI5JDpkPhe0Azx6+5jRwJq7sVxFbgvYztLgROKVMHS5nUR4Stktlm1vRvmFT4Y
         tJQg==
X-Forwarded-Encrypted: i=1; AKwUvBxJtY+ouyDmPZAwp6dd2kJB6naXgOk60L3s2n5jVlPH7anJBftRFrLyQLwByrf3ryZSp8U7+xxjwjxkvCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVAd4GSk/SqDDyDJAooTHypwiVU1E9q6b0AqmrjBriTL2aKzEN
	D0ii2kuFEYldSPye3FvN2tKDS1dFlJEuQOJswt35oHayW0mvQfhif0wOTDAC+gdsDgo=
X-Gm-Gg: AYBFou2aqKrk0f0RjZ9ID9Uh3YM5pdZjkJ1OzsJ7dK/lpKaHrRU/d5XdoANj/hHXq8Q
	jckClind7z4pEIxM3DkG8ZD2TfaI03e31Kxlq9XsrMNRDXGYNVMMhu6lVkjuvwAlkPigHrd6nx/
	fLExK1RuUbbdvbfBSnVCPud7Afohj71MPEyYFaW/MMBAlQgmSoaiClnNsnRXBE0h9bxL4lqyjSC
	vZ2F4TvRtdPUs2LP5FeAxGCRG4ClJ5RWQ7j1kkml9iGCjcW4sJSDlbTcsHNdp/HO9rLzogt9mdt
	BYbc3ZpBR87/czidVdiv5NktQ+/Lc9Sqqr3t/pL1DOwl5rr2ia1froiUm7z80n6+DBjsuXJzOg2
	uOfN+ZipKptWw9+u4AwV1ZBIUT3/YG2mih5mHpEhyU9s1vDUFm4bdWrFrubYK+/Nipy8KmEZhLL
	og2pI69SfmoMvHe3z0m3UfZguElkI3/8MzZFjjsX/2nUbTeJiOQBEPuyYuynqSzIpFhfWrqPW3X
	sESOWJkZGjSXT6ltqMnseDs/hCDcP84t8T0ui6oxDW8TFGmM13bAhloqSdyvWM=
X-Received: by 2002:a05:701b:4349:b0:15c:20b8:796e with SMTP id a92af1059eb24-16a5f112b00mr24410244c88.22.1792016018246;
        Wed, 14 Oct 2026 15:13:38 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becefdsm50084912c88.7.2026.10.14.15.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:13:37 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next] amt: make the per-tunnel group and source limits configurable
Date: Wed, 14 Oct 2026 22:13:34 +0000
Message-ID: <20261014221334.2443184-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A relay caps the state one gateway tunnel can hold at AMT_MAX_GROUP (32)
group records and AMT_MAX_SOURCE (128) source records, counted across
all of the tunnel's groups. Both are compile-time constants. An SSM
receiver uses a source record for every (S,G) it joins, so a gateway that
needs more than 32 groups or 128 channels through one tunnel has the
excess joins dropped, and the relay operator cannot raise either limit.

Add IFLA_AMT_MAX_GROUPS and IFLA_AMT_MAX_SOURCES, read when the link is
created, like IFLA_AMT_MAX_TUNNELS. Zero or an absent attribute keeps the
current defaults. Gateways drive these allocations, so the policy caps
them at 1024 groups and 4096 sources per tunnel, and strict_start_type
has it validate them, and any attribute added after them, strictly.
Report both limits in amt_fill_info().

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
Notes:
- At the policy ceilings, with 256 source buckets per group, one tunnel
  can hold up to 1024 * 4 KiB group records (176 bytes plus 2 KiB of
  buckets, a kmalloc-4k object) and 4096 * 192 bytes of source records,
  about 4.75 MiB. At the defaults it is about 152 KiB.
- The IPv6 outer transport series ("amt: add an IPv6 outer transport",
  posted 2026-10-09) also appends attributes after IFLA_AMT_MAX_TUNNELS
  and sets strict_start_type at its first one. Whichever is applied
  second will be renumbered after the other and drop its own
  strict_start_type line.
- Tested on net-next 05b5019b01fb, x86_64 KVM guest, with the iproute2
  companion patch, which follows once this is applied. The defaults read
  back as 32 and 128, 1024 and 4096 round-trip in text and JSON output,
  zero keeps the defaults, and 1025 or 4097 is rejected by the policy
  without creating a device. An 8-byte IFLA_AMT_MAX_GROUPS is rejected
  as an invalid attribute length, and the same request with 4 bytes
  creates the link. tools/testing/selftests/net/amt.sh passes 6/6.
  W=1 builds with IPV6=y and =n, sparse, and kernel-doc report nothing
  new.

 drivers/net/amt.c        | 15 +++++++++++++--
 include/net/amt.h        |  5 +++++
 include/uapi/linux/amt.h |  8 ++++++++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 81d26ef82..30cff8de4 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -3162,6 +3162,7 @@ static void amt_link_setup(struct net_device *dev)
 }
 
 static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
+	[IFLA_AMT_UNSPEC]	= { .strict_start_type = IFLA_AMT_MAX_GROUPS },
 	[IFLA_AMT_MODE]		= { .type = NLA_U32 },
 	[IFLA_AMT_RELAY_PORT]	= { .type = NLA_U16 },
 	[IFLA_AMT_GATEWAY_PORT]	= { .type = NLA_U16 },
@@ -3170,6 +3171,8 @@ static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
 	[IFLA_AMT_REMOTE_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
 	[IFLA_AMT_DISCOVERY_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
 	[IFLA_AMT_MAX_TUNNELS]	= { .type = NLA_U32 },
+	[IFLA_AMT_MAX_GROUPS]	= NLA_POLICY_MAX(NLA_U32, AMT_MAX_GROUP_LIMIT),
+	[IFLA_AMT_MAX_SOURCES]	= NLA_POLICY_MAX(NLA_U32, AMT_MAX_SOURCE_LIMIT),
 };
 
 static int amt_validate(struct nlattr *tb[], struct nlattr *data[],
@@ -3235,8 +3238,10 @@ static int amt_newlink(struct net_device *dev,
 		amt->max_tunnels = AMT_MAX_TUNNELS;
 
 	spin_lock_init(&amt->lock);
-	amt->max_groups = AMT_MAX_GROUP;
-	amt->max_sources = AMT_MAX_SOURCE;
+	amt->max_groups = nla_get_u32_default(data[IFLA_AMT_MAX_GROUPS], 0) ?:
+			  AMT_MAX_GROUP;
+	amt->max_sources = nla_get_u32_default(data[IFLA_AMT_MAX_SOURCES], 0) ?:
+			   AMT_MAX_SOURCE;
 	amt->hash_buckets = AMT_HSIZE;
 	amt->nr_tunnels = 0;
 	get_random_bytes(&amt->hash_seed, sizeof(amt->hash_seed));
@@ -3352,6 +3357,8 @@ static size_t amt_get_size(const struct net_device *dev)
 	       nla_total_size(sizeof(__u16)) + /* IFLA_AMT_GATEWAY_PORT */
 	       nla_total_size(sizeof(__u32)) + /* IFLA_AMT_LINK */
 	       nla_total_size(sizeof(__u32)) + /* IFLA_MAX_TUNNELS */
+	       nla_total_size(sizeof(__u32)) + /* IFLA_AMT_MAX_GROUPS */
+	       nla_total_size(sizeof(__u32)) + /* IFLA_AMT_MAX_SOURCES */
 	       nla_total_size(sizeof(__be32)) + /* IFLA_AMT_DISCOVERY_IP */
 	       nla_total_size(sizeof(__be32)) + /* IFLA_AMT_REMOTE_IP */
 	       nla_total_size(sizeof(__be32)); /* IFLA_AMT_LOCAL_IP */
@@ -3382,6 +3389,10 @@ static int amt_fill_info(struct sk_buff *skb, const struct net_device *dev)
 			goto nla_put_failure;
 	if (nla_put_u32(skb, IFLA_AMT_MAX_TUNNELS, amt->max_tunnels))
 		goto nla_put_failure;
+	if (nla_put_u32(skb, IFLA_AMT_MAX_GROUPS, amt->max_groups))
+		goto nla_put_failure;
+	if (nla_put_u32(skb, IFLA_AMT_MAX_SOURCES, amt->max_sources))
+		goto nla_put_failure;
 
 	rcu_read_unlock();
 	return 0;
diff --git a/include/net/amt.h b/include/net/amt.h
index 2846dde0c..18379ff7a 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -372,6 +372,11 @@ struct amt_dev {
 #define AMT_GC_INTERVAL		(30 * 1000)
 #define AMT_MAX_GROUP		32
 #define AMT_MAX_SOURCE		128
+/* Upper bounds for IFLA_AMT_MAX_GROUPS and IFLA_AMT_MAX_SOURCES. Gateways
+ * drive these allocations, so keep one tunnel's worst case to a few MiB.
+ */
+#define AMT_MAX_GROUP_LIMIT	1024
+#define AMT_MAX_SOURCE_LIMIT	4096
 #define AMT_HSIZE_SHIFT		8
 #define AMT_HSIZE		(1 << AMT_HSIZE_SHIFT)
 
diff --git a/include/uapi/linux/amt.h b/include/uapi/linux/amt.h
index 2dccff417..a106d7a07 100644
--- a/include/uapi/linux/amt.h
+++ b/include/uapi/linux/amt.h
@@ -54,6 +54,14 @@ enum {
 	IFLA_AMT_DISCOVERY_IP,
 	/* This attribute specify number of maximum tunnel. */
 	IFLA_AMT_MAX_TUNNELS,
+	/* Maximum number of group records one tunnel may hold.
+	 * Zero or absent means the default of 32.
+	 */
+	IFLA_AMT_MAX_GROUPS,
+	/* Maximum number of source records one tunnel may hold, counted
+	 * across all of its groups. Zero or absent means the default of 128.
+	 */
+	IFLA_AMT_MAX_SOURCES,
 	__IFLA_AMT_MAX,
 };
 
-- 
2.43.0

