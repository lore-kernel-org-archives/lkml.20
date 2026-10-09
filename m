Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6844CDDC9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548690; cv=none; b=juWE7fNdoslQSJoVqjtE2IWqZipIBHT1v2UD0DtNDrBIEH0Z5o6TcZUdhs+cT8ITr/e1+lH6uxBmWwJ5X3X+G3qDNHBu4fz6URe3FvUO9RDMK9BZ0KA0pmohubtrPiZ1NHTAcW6QlN/xlZTozHWReeMazMuarLYee1kRVOTzGLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548690; c=relaxed/simple;
	bh=75pu/VqDz0I5UvTLjr/ZyRljXF69cAISXm2ZGIjzB6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhhVbNJcRy3WwzZceaii9N3gQ94hXGV2k4AMm4UWHoG3F08lZY8UZE8v4WhC+2yNH5pRoDP/KCjRa2LljtPu5+jxhnVE5ioKQWQpi5ap0O+C1t3H71DvK6lsHEzLPhomVeG5sIeVXD0bKtCmarYBXqWhTBHSNAUB4MdeX2StUjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=MhVtR5kY; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="MhVtR5kY"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso4474871a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791548680; x=1792153480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zExdM9noMaMug6ygrgHma4FvQk9d0LjUHaAr85Brhzs=;
        b=MhVtR5kYLx9DfWBR4GDyJH50JUG8RRMWF4XTAyAvLVtNl2e2jzm14PiWqjNimdDi6T
         R+AzyjwkiVmCEAzAi7I1IMAGm3DlhVh6MHkXWkCz2+WY2PxwPWr39r5YlbJkskFBLdE9
         81peaEmC4Eb9TcAXQES3CcWHveAyCycHWO90bF5Iz8h3+HU/EV+2It1z1lWY2W/PsiXo
         1kKqX0ebR6ChfN+0uCdXPNsMN7+xRFoxDh1lveAAuLX2VvDyrmMgx+SXhzw1heCzRxgu
         E9L6Y1ka+EwP60vVul9I+ugqWxrJnrIFgEmP2VCjtTS4S4o38XAML+iUDnZFt3yS0mM5
         rFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548680; x=1792153480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zExdM9noMaMug6ygrgHma4FvQk9d0LjUHaAr85Brhzs=;
        b=x/IR9QwpIBX5JvlDuy/0FhJCMzT4dk5n2b6nysgaSBJ3HR7kmlTVglzVNgAzT7UGCb
         SnLaOlY6mPvh8i4OVSUo1ncBv+HsgoLQKEfUTnJ7p58Ya8mOExVJ22fwALJlQ+937WlZ
         XrlBtpV4RNRHcujLPkgyIQheGStycv+DSposkDu3ro3hOFdpsqRXIG4h2a+33+rQBGg8
         hliBiFqTLGV9Zr/y9e3vrJpAGNKQGfk3e6ymDK6PhbOsfzvivE6IZkKIVB14isXVDudp
         uSM8ei164k3P+MHHa4vBoTOnNdU3aXbdwYANjRzNQbvphZtYnWBFMOtjSSDmJByed4dS
         WcxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzoMIekBE1tWqqed/Qgu8l7rfFZRXR0W0L8L/Y2aKLX7RlPAwMb0mLsfV7vndW62mOdEc3c24QpTdHu0I=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3v5nGuzE0m4TvGtrVl8AV4DITvq2O1xPdIls5L6BG14OEPfdW
	P8FhnOtTtXK3HRinti4P5zNKPjrbyINEkr6YaQz5w8r9BIZ6OvkSKSxvc64sw/0x8I8=
X-Gm-Gg: AYBFou3NtMxTPKSDfbFHwnU3Z551t7Ld0bmEwMXDCUcEsaxaVdLF5JG6DGUWUyPJDM8
	6hbFXiyXwXPDCEA8BWC+mlbvjuHGxrDk8X/0GgRsxFWfnFobZ2uLei69nLeGlGqyvXZTtQLut2v
	XGxFY0FgfDXHL5VBFZKyt4YPBhidbxs4JZ+ceDLbr1kkcprokLAt2uQGC67wJSp5Jr+9BYp36+q
	IZRrXe9eFg9n8vr9lLb/+a1UOA2oqYLSGfo7TofYQzJMq6iNMQIXiJ9G1dJ7jyWDJAyw+tm43ux
	e0nyLR/U9hbb9ewN62vKNMdw/DYGOtYO9c96AJLIn5adiRCBB7Rhbbr+OWp+4hrQoSh/sxTbDXe
	DR3dLRD/v+em3/hsnhFdwxd71UtYSpff/NEVW8IePCIpO3qdBDmTQL8EdGMm2i0JcXV8HHyyY9R
	IAP7O3QA0QLRupG7q1xBx4YbYYk3liyIsNDx4ttTIU6DWEAR6ztFwu30oYRUkdCqDdzwPLUMZOy
	JKOkaLs0IkPsHLeI8CYInuM5FfjOMTJWLBs0ZPv
X-Received: by 2002:a17:90b:1d4f:b0:3a8:211b:6c8c with SMTP id 98e67ed59e1d1-3ab3a955e15mr1746334a91.22.1791548680373;
        Fri, 09 Oct 2026 05:24:40 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab55e41eefsm1660502a91.10.2026.10.09.05.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:24:38 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 05/13] amt: match the Membership Update tunnel by outer family
Date: Fri,  9 Oct 2026 12:24:18 +0000
Message-ID: <20261009122426.551178-6-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009122426.551178-1-omar@blockcast.net>
References: <20261009122426.551178-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amt_update_handler() finds the gateway's tunnel by comparing
tunnel->addr.ip4 with ip_hdr(skb)->saddr, which on an IPv6 outer header
reads bytes 4-7 of the source address as an IPv4 address, so an IPv6
relay never accepts a Membership Update.

Take the outer source with amt_outer_saddr() on entry, by value, before
pskb_may_pull() and iptunnel_pull_header() can reallocate the header.
Match the tunnel with amt_addr_equal(), as amt_request_handler() does,
so the tunnel a Request created is the one its Updates find in both
families. The inner report parsing is unchanged.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 5e8a74c..b977b00 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -2620,14 +2620,14 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 {
 	struct amt_header_membership_update *amtmu;
 	struct amt_tunnel_list *tunnel;
+	union amt_addr saddr;
 	struct ethhdr *eth;
 	struct iphdr *iph;
 	int len, hdr_size;
 	u64 response_mac;
-	__be32 saddr;
 	__be32 nonce;
 
-	saddr = ip_hdr(skb)->saddr;
+	amt_outer_saddr(amt, skb, &saddr);
 
 	hdr_size = sizeof(*amtmu) + sizeof(struct udphdr);
 	if (!pskb_may_pull(skb, hdr_size))
@@ -2646,7 +2646,7 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 	skb_reset_network_header(skb);
 
 	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
-		if (tunnel->addr.ip4 == saddr) {
+		if (amt_addr_equal(&tunnel->addr, &saddr)) {
 			if ((nonce == tunnel->nonce &&
 			     response_mac == tunnel->mac)) {
 				mod_delayed_work(amt_wq, &tunnel->gc_wq,
-- 
2.43.0

