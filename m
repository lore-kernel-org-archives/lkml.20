Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792719960;
	b=d2y7jcy4InWGOCZ4fSmZlZ4IQsFU9Ucd1iSVmJw6GUIzhdPKBcKQujDwj87bMlz6P4sn
	 6UEi3fJVgN2D/MeT4aPulxa+z95eG/daUCFURXoTfp673SMzD4QM5nh4Q/qaIlMpy04SX
	 f2z/sAKEtaUy++Mnlp2SuWJzgCoQrGnsNQAFM528B/18QhHILYOYbj6u+poamCpfWDoiw
	 Nrf3+/zz7qt6310jkGRpYZ5G8iuaET6HfxqvYpwXofwY83UcLdNspOePb7gYHKusSU/I0
	 nbh90WjrQLhKtLR+oSaUdam6QmkXrQSSl1jK9xjOjaHsxdTr5wQ3I6ZPebgPQg69Qfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792719960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+2nBh2hTg9GyHqgEIUG/XcZolp0eeZD3+vc0j5AmUsg=;
	b=LcYzBL248UAOWNhLY+rfL7XCGZkOwuokVLXn5ZG+iygECeCl/EbNszEOLdGW/0H+Pxqc
	 dAMcI08Ha2iYPVBAuN5wfLssLF0DSWcxkM3+WHOGWRM3bjVFZqIbgPihLKqbQZKO1pF7H
	 oIVLF0r0bGZnqg04sh7IDGGgsr7PVygRMLLNpETuG8ioYRsj2tOYhrOpMPPh4Oq0l9a2Z
	 6Y6XH8AoUrv6I/h7m64AH5XmwbbNX+kOrShbl6YB+iI5KX40AWkfsmUdivmjGvAJDPpw9
	 a3TovSG2e7zLhK9UfmH71imcPKlnv4JLKFyMrTW4cuQifNmOFgiufSzfZWk+aTV5QlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=corvaglia.dev;
	spf=pass smtp.mailfrom=corvaglia.dev;
	dkim=pass header.d=corvaglia.dev header.i=@corvaglia.dev header.a=rsa-sha256 header.s=google header.b="dk/5OzYE";
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733F5606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 733F5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=corvaglia.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=corvaglia.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=corvaglia.dev header.i=@corvaglia.dev header.a=rsa-sha256 header.s=google header.b=dk/5OzYE
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-679e86015e2so1768267d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=corvaglia.dev; s=google; t=1792719958; x=1793324758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2nBh2hTg9GyHqgEIUG/XcZolp0eeZD3+vc0j5AmUsg=;
        b=dk/5OzYEkOickaCx1hnswEJdwKSiDOEwfv4hJWo7DfTah6nItgJP2Z5K9Lpj6PFbYa
         5s9mXQJZusreJ8yJj/0xRN7u4bd+oHtNECadgyakMML8IHFW5/2PRascJqWODb6Sug4c
         bK55siCkNzTkfXqOAUWJ+iM48VCgcWpQtTHPjdWHNTqmT8RlGMDzmzk6FhturKh1n/Ux
         F9M1/++QmlFLwqGyF5z1n0iRF9T5qiiFVC2620L3IJGEyYYHTQFQMHhlM0j7mcKO0DAA
         XwAzOMDVLP2JJIpX5HkV1GoaDfat0jNpCuBQwk+fsOPaRIji6TI6LkX8Q8wFAY0gAY2I
         eGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792719958; x=1793324758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2nBh2hTg9GyHqgEIUG/XcZolp0eeZD3+vc0j5AmUsg=;
        b=bxYY1aleII0IDufcMjnEBH11gT79K6h1Izy6odgZs5bKXm2yDCc/CZT73o3gshkWT2
         1/q/WjDkWAbV/+ax339jEUnGfK0da8RZFJNu1n4Kuk5o81WVryXZvIiVnvePFKF0fBaF
         cxOAmffVLE+Y/rLOsJUFnZ2lK4oQMG4Oqy72HeIWZyBMOPSrCZJmc8YCv1yBqTFks6WB
         CDDJq8MoFz1/tw/tZPsGCALXuDmvnZVc82S00xW/g+SoQzznP5Nvn7lfM2mQ1lVK+l3o
         hazVJECCg6T/cOEVW+dy6lBF019w4DGXzsfdC/ZpM+hHhP6r6kdfJZBdajPp1mr/wuCq
         8R1g==
X-Forwarded-Encrypted: i=1; AKwUvBw3+50t/mHh8iMz+ypew8F8BTHsn5gtv10PK9VoAm4ivnpsS2Hhjnn7fbKbJ4hdy7ognTp/7zmVtVVY3Gg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDzHWEC+hScX6n8B9WxvWVk6TRgNNV4BUgIPTvhR43XH36sQ3d
	d7yPUxmWMTZ/ZZRN82/Qt1tIzkLUN9jhyiGEy7BZnvlnBrfb/1Xg9jTJRL5LnNlca2vC
X-Gm-Gg: AYBFou3ecSYcHc124tKUUs0d6alWoRvzGIe55dM60OohCvzVwuz4w/e5HEpEefjihDp
	uiuAyHEwKtNSoveKJ7Vi+4X6u6zp9hgnV1rpgZ8iVub6pYzrnQwiGBKsZe9N1e3aF5GkIVB3z2X
	SAdCZpqxTREwahevRlfVw0KvaGhcj0VLvPBJZvD6nUJtbcFn71eWNejf++YmAQru+r5DHbxUxKn
	rhxud/79YEFA91J+0sJnXeSOzLlEQJsO1IplQYq9vjoZA4dJP3sN0D3tNypa7ktrCKgvA/VII57
	wD8POM+5TjRZkj32C2ESOCwcsFQLKzDMeGy4WeWgdzoNYL3osI0Roq3uNpF2G+5xpS4kCqqGopD
	EXWLYYn1uozA/zrcLD/MoJhUs6ofR3JBAM6emxez8mSHKlQVCHdXQy6XwFmfDcZ3YoTkIsvVwUE
	zxU45Irl/JSo/+B1iZ7WtWIJwPhHfACbVWEkV6pQN9slN2lBx3eFlZmj5ZWaZ5D45+9K0lJd2gz
	mxyMZvO/rqUkDuL7+YPkraX4Q5OprWR+vcANdKDeTtfz+4XNCF1xhE6c8m5MARC
X-Received: by 2002:a05:690e:12c7:b0:679:9e81:e51b with SMTP id 956f58d0204a3-67a21ae6a1amr2754679d50.0.1792719958345;
        Thu, 22 Oct 2026 18:45:58 -0700 (PDT)
Received: from voyager.localdomain ([47.160.132.81])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a33fd8997sm628743d50.4.2026.10.22.18.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 18:45:57 -0700 (PDT)
From: David Corvaglia <david@corvaglia.dev>
To: netdev@vger.kernel.org,
	bridge@lists.linux.dev
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Corvaglia <david@corvaglia.dev>
Subject: [PATCH net] bridge: mrp: fix silent truncation of IN_ID
Date: Thu, 22 Oct 2026 18:45:36 -0700
Message-ID: <20261023014536.72444-1-david@corvaglia.dev>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IFLA_BRIDGE_MRP_IN_STATE_IN_ID and IFLA_BRIDGE_MRP_START_IN_TEST_IN_ID
are NLA_U32, but these values are stored as u16 in their respective
structs. Values above U16_MAX are silently truncated instead of being
rejected.

Fixes: 7ab1748e4ce6 ("bridge: mrp: Extend MRP netlink interface for configuring MRP interconnect")
Signed-off-by: David Corvaglia <david@corvaglia.dev>
---
 net/bridge/br_mrp_netlink.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/bridge/br_mrp_netlink.c b/net/bridge/br_mrp_netlink.c
index 39f07e13fba5..5abad1cb3914 100644
--- a/net/bridge/br_mrp_netlink.c
+++ b/net/bridge/br_mrp_netlink.c
@@ -6,6 +6,11 @@
 #include "br_private.h"
 #include "br_private_mrp.h"
 
+static const struct netlink_range_validation br_mrp_in_id_range = {
+	.min = 0,
+	.max = U16_MAX,
+};
+
 static const struct nla_policy br_mrp_policy[IFLA_BRIDGE_MRP_MAX + 1] = {
 	[IFLA_BRIDGE_MRP_UNSPEC]	= { .type = NLA_REJECT },
 	[IFLA_BRIDGE_MRP_INSTANCE]	= { .type = NLA_NESTED },
@@ -241,7 +246,8 @@ static int br_mrp_start_test_parse(struct net_bridge *br, struct nlattr *attr,
 static const struct nla_policy
 br_mrp_in_state_policy[IFLA_BRIDGE_MRP_IN_STATE_MAX + 1] = {
 	[IFLA_BRIDGE_MRP_IN_STATE_UNSPEC]	= { .type = NLA_REJECT },
-	[IFLA_BRIDGE_MRP_IN_STATE_IN_ID]	= { .type = NLA_U32 },
+	[IFLA_BRIDGE_MRP_IN_STATE_IN_ID]	=
+		NLA_POLICY_FULL_RANGE(NLA_U32, &br_mrp_in_id_range),
 	[IFLA_BRIDGE_MRP_IN_STATE_STATE]	= { .type = NLA_U32 },
 };
 
@@ -315,7 +321,8 @@ static int br_mrp_in_role_parse(struct net_bridge *br, struct nlattr *attr,
 static const struct nla_policy
 br_mrp_start_in_test_policy[IFLA_BRIDGE_MRP_START_IN_TEST_MAX + 1] = {
 	[IFLA_BRIDGE_MRP_START_IN_TEST_UNSPEC]	= { .type = NLA_REJECT },
-	[IFLA_BRIDGE_MRP_START_IN_TEST_IN_ID]	= { .type = NLA_U32 },
+	[IFLA_BRIDGE_MRP_START_IN_TEST_IN_ID]	=
+		NLA_POLICY_FULL_RANGE(NLA_U32, &br_mrp_in_id_range),
 	[IFLA_BRIDGE_MRP_START_IN_TEST_INTERVAL]	= NLA_POLICY_MIN(NLA_U32, 1),
 	[IFLA_BRIDGE_MRP_START_IN_TEST_MAX_MISS]	= { .type = NLA_U32 },
 	[IFLA_BRIDGE_MRP_START_IN_TEST_PERIOD]	= { .type = NLA_U32 },
-- 
2.56.0

