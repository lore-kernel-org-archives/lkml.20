Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E81A1684B0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791767868; cv=none; b=NKs1bpBUv43KVSI1+n38I+ffwbIScYY5y6WyufCENtJq8wu8BLffdw0YGAv6dsoRjA3hJLMajH05znCpe6dI9vqkyuQFU97xl46ykhODQx4ypjcEdgbdbXU0IDQGhLhjeluFK6ire+xbGFJDLGXp2bnWkx6l6IKvJ5qruLUKiAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791767868; c=relaxed/simple;
	bh=USMYquWjDSlhNyRAuuQZlk822YJxe0sgKgXXZbTaiuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVQ0BWtnNDECtNu2zu/UgQK2cecaBNYg2YDMflSUyQrEJKDTQxD4Vl+7xtulCSLWrXveK1Mm1c/J9VAyF/y+vpfy6MvNq/JmsBCVoYt/pExR4i+GyjIHf7Q8beFs4qt81IwrIt+IiNjqjpQI28GL/rliNwJ4DeuhkDJt4cEdNzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiqNsmzn; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiqNsmzn"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a4c47bb6e3so590887a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791767867; x=1792372667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNJQaLaUPhfizQ3mt3ZckrLpssIZdRd+0u34vIFrxiI=;
        b=BiqNsmzn2Bw1P9Z9RyN0iJgNZZW4ZGR8j8fR76uTOFpgO59/sb0vysH4MqXa9XeCTC
         GVMB4x2Q/jYvqbDWMcxTw+/fYo+x8nvfnn7q5gfnHfEl+jVxnJZqdKvLfRSWN7IM96oi
         1LOAx4euHhj3fXwkEIFQyoLDsChP6U7KnEREVCvgtDYtsaF3FvQDhxX4eF/deNEU2z2Q
         ZCWSd4TWruvnzwWoR955RmK78MWzsS+skbTLpP0oE2j2/962MlpaGAz+q4a11oLXkNvl
         E2xNUb6NqiR+6uB1kMbx71/VNOqCMFb+9ZP6tbSE/gNF0hInQrKUHlXE0GbgZucalBPt
         hhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791767867; x=1792372667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RNJQaLaUPhfizQ3mt3ZckrLpssIZdRd+0u34vIFrxiI=;
        b=v7ysbTAx5/Altu0t27L+EeP/rKaKP4qbL8dLuY92kPO679bVHRWwDxYrOsrBFQIl/o
         30WQsBxiCSdlygZdpMFdqfaaALg1xiq41d9WPmqzGNpMXEmWOTGYb53OET16dawQiB00
         Ul2rQQfmRqT8NfDsNpm35DNPrwi1XHVFqro6Lu3hQw6f5kf1f+jIG+R97dhlnGwm/kx0
         G/1eIKeSWKxy6FFdS1kapr9oFAVp/zhJ9HsECZtRSMfRmKkltBKQHBl4p0fZnQtKtzXE
         3k9z9DcA49yc6GzdKf7RBiEiZCVYqMcakaapqjdnXKTT7MusXIph1bh87vFTGSl94dpn
         1I6Q==
X-Forwarded-Encrypted: i=1; AKwUvBz1Lo6GFPPu3+CWCpTTgkm+z0AM8BaOJxvyUtu1g9+K9hlBwnCF6RMq+1jaKU2Jx8nvH7oJ0N4VjRfee2M=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3gtyWSm7JTAhLpD8LCdd7TSBIr21qk3nqjZGfcwe6/xwFFQh4
	Aqa7BuD2Yf9/nnNdQKVTGCJaWBjSw34IZHFTkejJEiJOFu9SowJ+mZyZPk4jKAVC
X-Gm-Gg: AYBFou2FWpl050QcUWL+3Ve1H7IlKFqPeSXB3xZGPg3T8Fqwdt2gLzfAwPM9bQioqTF
	8vlgP3/tPHpAHlH/Pjr/088+RTX+xkLXgvqgMa1inZdwmJzzO1DRVZvvWbFZuiaEfxkr090iTcH
	j5oosFQocVPtDeIOGFosZlWVTdOTM4H+IV0svGer5ZDh8pee0z6yctltYJZJuw+lEaNwvCtgKun
	7tNgCrFkbxP8c6Tbs/P58cUN6lLNADEaVDJlOqaMU3nP7X2wZDnu2VNnDepW0IvAqcYYKoafTbD
	J+WBTipE3c3O3yMX4S+zSYVx84/thHY/BgvsMS10aoJhGC31Zp9uGL0aAIvxBWomYSo2Rx9nF8p
	foyR6lK2iSf7sTVy5neBzQJS0O1LrgMKalLSXzzA/mBmxlfLut7DJcicqnZpmIUQ3BcOxUVY8pa
	0yItse5mYFEXMLOJ2psNYwjJ7qECxms4Op/9Jk3jha5VCM0OLOTwoLVNRvxX0iDWLGsKqj9lZCF
	p2iY5qpJ266CEzMu+1caY8VlNCAIpAqVswO5qysyGdHgYOO5YWU1G9vzWdJF/z0TCu3nXkpEGDE
X-Received: by 2002:a17:90b:4fcb:b0:3a6:dc2f:f07f with SMTP id 98e67ed59e1d1-3ab3a609f14mr6808753a91.10.1791767866883;
        Sun, 11 Oct 2026 18:17:46 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm13743307a91.8.2026.10.11.18.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 18:17:46 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Kees Cook <kees@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v11 5/6] netlink: specs: rt-addr: document AF_PACKET multicast dumps
Date: Mon, 12 Oct 2026 10:17:06 +0900
Message-ID: <20261012011707.3378-6-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012011707.3378-1-sigefriedhyy@gmail.com>
References: <20261012011707.3378-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the global flag, list the attributes the AF_PACKET dump uses and
describe how ifa-family selects IPv4, IPv6 or link-layer output for
RTM_GETMULTICAST.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 Documentation/netlink/specs/rt-addr.yaml | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 17ead22034515..cccfccf49cc11 100644
--- a/Documentation/netlink/specs/rt-addr.yaml
+++ b/Documentation/netlink/specs/rt-addr.yaml
@@ -77,6 +77,8 @@ definitions:
         name: mcautojoin
       -
         name: stable-privacy
+      -
+        name: global
 
 attribute-sets:
   -
@@ -168,7 +170,17 @@ operations:
           attributes: *ifaddr-all
     -
       name: getmulticast
-      doc: Get / dump IPv4/IPv6 multicast addresses.
+      doc: |
+        Get / dump multicast addresses. ifa-family must select the address
+        family: AF_INET or AF_INET6 for the IP multicast groups joined on
+        a device, AF_PACKET for the link-layer multicast addresses in the
+        device filter. Link-layer entries added explicitly, e.g. with
+        SIOCADDMULTI or "bridge fdb add ... self", rather than by a
+        protocol join are reported with the global flag set. For AF_PACKET
+        a non-zero ifa-index restricts the dump to that device and
+        ifa-prefixlen, ifa-flags and ifa-scope must be zero, AF_INET and
+        AF_INET6 apply this and target-netnsid with NETLINK_GET_STRICT_CHK
+        only.
       attribute-set: addr-attrs
       fixed-header: ifaddrmsg
       do:
@@ -181,10 +193,13 @@ operations:
             - multicast
             - mc-users
             - cacheinfo
+            - flags
+            - target-netnsid
       dump:
         request:
           value: 58
-          attributes: []
+          attributes:
+            - target-netnsid
         reply:
           value: 58
           attributes: *mcaddr-attrs
-- 
2.43.0

