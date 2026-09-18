Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E80F3B7746
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769612; cv=none; b=QxvJ82rhofBOXpJfpx+PUJHH4u/MrBqgo+gLt3P/aWL4eEUwklabDCeoU7+WJCC8jFpyCdA4WwoZ2qOCQjubjC9OJTvQZnI4vntt3iMjV9yQ4UlC0V8vOTRL02hY5/0H0euesEBBrhe3wG2Dmup3hCWSnb3MWsVCy1RW77olftM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769612; c=relaxed/simple;
	bh=lMhWyqDKU8tuhSb63S6z46HY7Dg7FOFh3EIVXTTzpPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uN4nk2rwXOCWQpfRQoeyHpqNxupMjB2stdHVC303tb7bXA2HLGitoNwAhBPlVzhuehB7Kz2m4e2fLokfumnlfOeilomxzR0dVRp8bxNPFDI8o5BUbrkZpfj2bDM/jFh/f89cc0CYRSK/yJjDKSThvXj9Dv8iG0qOCvjfGPmPnB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lF4qAbm/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF4qAbm/"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caced6038eso10888595ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789769609; x=1790374409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOwaBnnM/eJvrLcA+Skp3S3cmP/0pzGWTCv//0JXzxA=;
        b=lF4qAbm/BLdITdpanQGFmjZhWxCS3ksn889qJJr+BiqHSqZZzuIoMTd3HOPW7nS5CO
         6+XShZWVhtBG/73n33Vz2Z7b1GNZlK09jqSwUs2U8ZYWKYxqchbqOCn+ldzFdP+Low1E
         dmLE0IiO3i0eD5HfmducbY2BhGDtAIv2XsUlFX7M2XRPaID3f+bDUbYwY/u0XZ36L2D2
         wZ3H9ZoX7GvcEFaRvFY9ovUmWp+tRYDT6IqSuBwRljOLdKwSLMh0JSmoUaIoWTlAeqRg
         oOulOk+m/+msi30+uFQu8Fl4ahBJnGqmk0eXT8vabCKM9pWQ0FOSsqF0fBfPrFkhkAqD
         WW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789769609; x=1790374409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eOwaBnnM/eJvrLcA+Skp3S3cmP/0pzGWTCv//0JXzxA=;
        b=Kom1ac+ycq8sjNuvRi++nhh4SmK79iKdMuYslhePjAiAZB+dEpMJfC2mrDoAbNwevy
         HD9TEd9q6NE/TE7Mcx4qSVysbYJn9B6c8HmId4tFKQW2V6BUgdX4b2sX53sxQ/xLjue3
         fp/9Zx6l22qW6iygQH6g17YpbcRkqfoziiq4Z/IbrbOXgQmtWO9AZKICv1ucXOXgv7TE
         JQtY1X2vJ08hbMEkHfSTUX3XbCGg9yqDL0Ih7dJbd/yZQkxKLEkCLCxLzc8DKxae8Iby
         NaiUEvCyD8/1i3Qwbov81APlJcP6rSfW/qSYiwShiroht6o/RwathgtU7OkqMl7LEDEo
         M1YA==
X-Forwarded-Encrypted: i=1; AKwUvBzdEFTcwEh+4zjJXc5xXwjVTSqUH5heQ1vsXqoWddHPYeTpAF+llcRRJtdEuOQlm8rPoGO+O/YMQ45L1yM=@vger.kernel.org
X-Gm-Message-State: AFuF++lSBOo6Qy4+Gc9OZaR1GHEodeE+V6NJM5PiQwsmXkYfokVq0zYu
	yxtKBKauHZbdkNmNPgsQ1qpvZqM9xnLSk3orXnuS/ztI0eL8GKkc7Qhs
X-Gm-Gg: AYBFou1AHUsX6R1diT6uWuz7WmpS12po8Tube02KaSHfZW3vukQ7N+aaVD5yZCa7qoL
	Nn67rJAKb62BwauwnWuCrBjwWOSWnfE9TeCmDzA065Y20aElzyxfvu/AuvbiwNt36/3JaqRB+Rm
	zeVIixsOwlYqZ9gax6pRJBCuhAzECDaJ1Olvu36KEWpDTY48CCNEhMEPjoRTRBJEYAvC3fo/U1g
	6cr03FijibupV/bEbqUPuc0pB3/WRyrr8GpUN2SjMCIHIA494nd5hLQ0CVUJcx/02YaFRvVncN4
	dbfO7KhpBMNEXmuc283btFdLXj4tScke5+RLf3sFudSixk/ozuO2ure2MBa5Pfxw0hvqbm+SMIb
	C8z8nE0EjnRwac9UDDAUhhoOOT984Bq3nUWD4cl1s501To9P+NAwc4377xgjoc4JyQ/E8or0rWd
	9oJWykuLCR4T0g1gIQL7AGeo82bb3ushnwOx4JyHaP87keXuNFc6dUBflplz7obPkr/5nIVuAP1
	YuQf4L6/5jSQ3TMbnbJbHaLRxEtE5F/rQecKPPjskMAZKHIszrPObhqqptqKVVAy4XkywgG/SsN
	ddYSE7z5m88JXvwayGHn
X-Received: by 2002:a17:903:1103:b0:2dd:ad7d:72e1 with SMTP id d9443c01a7336-2ddad7d753amr64644185ad.24.1789769608714;
        Fri, 18 Sep 2026 15:13:28 -0700 (PDT)
Received: from lawlee-vm0.d4y3nv5wwgfelhhopdxv1tqjld.dx.internal.cloudapp.net ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a716sm1553671eec.8.2026.09.18.15.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:13:28 -0700 (PDT)
From: Lawrence Lee <lfqlee314@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	Arun Ajith S <aajith@arista.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Jaehee Park <jhpark1013@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 1/2] ipv6: update NUD_FAILED neighbors from NA messages
Date: Fri, 18 Sep 2026 22:13:23 +0000
Message-ID: <e5b7a4f8cbd7c436b463b3751bf283ce861fcfaa.1789734885.git.lfqlee314@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789734885.git.lfqlee314@gmail.com>
References: <cover.1789734885.git.lfqlee314@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Transition a FAILED neighbor entry to STALE upon receipt of an NA
message on routers when accept_untracked_na is enabled. This extends the
RFC 9131 accept_untracked_na behavior so that FAILED entries are treated
the same as non-existent entries.

RFC 4861 section 7.3.3 says that an entry should be deleted when address
resolution fails. Linux instead retains the entry in NUD_FAILED, so
treating it as untracked is consistent with the protocol model.

Trying to resolve FAILED neighbors via periodic probing (e.g. using
NTF_EXT_MANAGED) is more work compared to this approach which uses
information in NAs that the kernel may already be receiving. Note that
because this behavior in IPv6 is dependent on the accept_untracked_na
sysctl setting, this approach is more conservative than IPv4 which
transitions FAILED neighbors to STALE by default upon receiving GARPs.

Link: https://lore.kernel.org/r/20260813233344.445265-1-lfqlee314@gmail.com
Assisted-by: LLM Sashiko sparse
Signed-off-by: Lawrence Lee <lfqlee314@gmail.com>
---
The existing 6LoWPAN override-only handling also applies to INCOMPLETE
entries and is intentionally left unchanged. The existing
rt6_clean_tohost() source-versus-target behavior applies to all neighbor
states and is also left unchanged.

 Documentation/networking/ip-sysctl.rst | 28 ++++++++-------
 net/ipv6/ndisc.c                       | 47 ++++++++++++++------------
 2 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index f7af0286341c..685c84cf543d 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -3225,18 +3225,19 @@ drop_unsolicited_na - BOOLEAN
 	Default: 0 (disabled).
 
 accept_untracked_na - INTEGER
-	Define behavior for accepting neighbor advertisements from devices that
-	are absent in the neighbor cache:
+	Define behavior for accepting neighbor advertisements for IPv6 addresses
+	that are absent from the neighbor cache or whose entries are in FAILED
+	state:
 
-	- 0 - (default) Do not accept unsolicited and untracked neighbor
-	  advertisements.
+	- 0 - (default) Do not create new neighbor cache entries or update
+	  FAILED entries from neighbor advertisements.
 
-	- 1 - Add a new neighbor cache entry in STALE state for routers on
-	  receiving a neighbor advertisement (either solicited or unsolicited)
-	  with target link-layer address option specified if no neighbor entry
-	  is already present for the advertised IPv6 address. Without this knob,
-	  NAs received for untracked addresses (absent in neighbor cache) are
-	  silently ignored.
+	- 1 - For routers, add a new neighbor cache entry or update an existing
+	  FAILED entry to STALE upon receiving a neighbor advertisement (either
+	  solicited or unsolicited) with the target link-layer address option
+	  specified. Without this knob, NAs received for untracked addresses
+	  (absent from the neighbor cache or in FAILED state) are silently
+	  ignored.
 
 	  This is as per router-side behavior documented in RFC9131.
 
@@ -3251,9 +3252,10 @@ accept_untracked_na - INTEGER
 	  used in conjunction with the ndisc_notify setting on the host to
 	  satisfy this prerequisite.
 
-	- 2 - Extend option (1) to add a new neighbor cache entry only if the
-	  source IP address is in the same subnet as an address configured on
-	  the interface that received the neighbor advertisement.
+	- 2 - Extend option (1) to add a new neighbor cache entry or update a
+	  FAILED entry only if the source IP address is in the same subnet as
+	  an address configured on the interface that received the neighbor
+	  advertisement.
 
 enhanced_dad - BOOLEAN
 	Include a nonce option in the IPv6 neighbor solicitation messages used for
diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index 90cd5d852569..12d85d7f8234 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -973,13 +973,13 @@ static enum skb_drop_reason ndisc_recv_ns(struct sk_buff *skb)
 static int accept_untracked_na(struct inet6_dev *idev, struct in6_addr *saddr)
 {
 	switch (READ_ONCE(idev->cnf.accept_untracked_na)) {
-	case 0: /* Don't accept untracked na (absent in neighbor cache) */
+	case 0: /* Don't accept untracked NA (absent or FAILED) */
 		return 0;
-	case 1: /* Create new entries from na if currently untracked */
+	case 1: /* Create new or update FAILED entries from NA */
 		return 1;
-	case 2: /* Create new entries from untracked na only if saddr is in the
+	case 2: /* Create new or update FAILED entries only if saddr is in the
 		 * same subnet as an address configured on the interface that
-		 * received the na
+		 * received the NA
 		 */
 		return !!ipv6_chk_prefix(saddr, idev->dev);
 	default:
@@ -1067,34 +1067,39 @@ static enum skb_drop_reason ndisc_recv_na(struct sk_buff *skb)
 	neigh = neigh_lookup(tbl, &msg->target, dev);
 
 	/* RFC 9131 updates original Neighbour Discovery RFC 4861.
-	 * NAs with Target LL Address option without a corresponding
-	 * entry in the neighbour cache can now create a STALE neighbour
-	 * cache entry on routers.
+	 * NAs with Target LL Address option can now create a STALE neighbor
+	 * cache entry on routers if the NA does not have a corresponding entry
+	 * in the neighbour cache or has a corresponding FAILED entry.
 	 *
-	 *   entry accept  fwding  solicited        behaviour
-	 * ------- ------  ------  ---------    ----------------------
-	 * present      X       X         0     Set state to STALE
-	 * present      X       X         1     Set state to REACHABLE
-	 *  absent      0       X         X     Do nothing
-	 *  absent      1       0         X     Do nothing
-	 *  absent      1       1         X     Add a new STALE entry
+	 *       entry accept  fwding  solicited        behaviour
+	 * ----------- ------  ------  ---------    ----------------------
+	 *  non-FAILED      X       X         0     Set state to STALE
+	 *  non-FAILED      X       X         1     Set state to REACHABLE
+	 *      FAILED      0       X         X     Do nothing
+	 *      FAILED      1       0         X     Do nothing
+	 *      FAILED      1       1         X     Set state to STALE
+	 *      absent      0       X         X     Do nothing
+	 *      absent      1       0         X     Do nothing
+	 *      absent      1       1         X     Add a new STALE entry
 	 *
 	 * Note that we don't do a (daddr == all-routers-mcast) check.
 	 */
 	new_state = msg->icmph.icmp6_solicited ? NUD_REACHABLE : NUD_STALE;
-	if (!neigh && lladdr && idev && READ_ONCE(idev->cnf.forwarding)) {
-		if (accept_untracked_na(idev, saddr)) {
-			neigh = neigh_create(tbl, &msg->target, dev);
-			new_state = NUD_STALE;
+	if (!neigh || (READ_ONCE(neigh->nud_state) & NUD_FAILED)) {
+		if (!lladdr || !idev || !READ_ONCE(idev->cnf.forwarding) ||
+		    !accept_untracked_na(idev, saddr)) {
+			if (neigh)
+				neigh_release(neigh);
+			return reason;
 		}
+		if (!neigh)
+			neigh = neigh_create(tbl, &msg->target, dev);
+		new_state = NUD_STALE;
 	}
 
 	if (neigh && !IS_ERR(neigh)) {
 		u8 old_flags = neigh->flags;
 
-		if (READ_ONCE(neigh->nud_state) & NUD_FAILED)
-			goto out;
-
 		/*
 		 * Don't update the neighbor cache entry on a proxy NA from
 		 * ourselves because either the proxied node is off link or it
-- 
2.43.0
