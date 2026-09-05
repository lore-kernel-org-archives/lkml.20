Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F343CFF73
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601191; cv=none; b=n0viB/V3MbVRCciXPaqbGkP1JpinJRCjWihbfWnx+5hOTsNhi1x0X/87A1lOd0sBkyN/QHLehMenMc6bzDVdsdapCp60aVCJN5UOsuTOAEBu5VrKm96ATUSUi0lZ5R9qA8TpzDdCnT/jWsw7872BYhxbQ/muPbYoA16jeMWGfd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601191; c=relaxed/simple;
	bh=2zQvRUscIgNiPZoEjC1Z5mtgLCeG0uKE2CLDirOMMRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=royML9POVbvGi2eIYh2SShfWUMdh6tG4+zqqeckcKU1o0jzdPpFIhmlsL62mBETaEvUko112do1gyYk2JdVJyKY3iv8AOLOxjPf4e1djMbUfuxR1bpi9LxCbXeHdZgXXo9u6i1b8wn2XESnw/lY84Evqk1JOiMtVyd2IRLmdhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5uRxfuQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5uRxfuQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d9db539a54so16149385ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601189; x=1789205989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=263Ot5CK8k8W50+c/iZQZai2Z4LPXqFiKiK4/FLJICs=;
        b=Z5uRxfuQPO7vRR3AcaQhSTSINViylUkUzrar1hGkf40UvxNae79gyGUbaTUdtR2WRs
         hCkeoMYRG+rJqorEjyXgkxqIIvYWvIbnXOGs2z5UoyByFdfEFpu3HNkNe6UvaWh6fW24
         +usJubVDvODNRX+JmqCexzDZ02SD+fVQcBxkq/8okuiZYPJzARASw+M3Ir+nYZOhcVp/
         QxHwVdP0+dGSx1K5gXc2m3kxX2MrifJkbGsJG9VXYI31O6ZHMwEZ8xtebuLMz5VLyUQP
         TaLn6t9CeJh6rZ6mjjKVgMdNDoYDsKJ/iF691oDZVKykHRkQiOi3fxpwo+q09dviCn1y
         sqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601189; x=1789205989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=263Ot5CK8k8W50+c/iZQZai2Z4LPXqFiKiK4/FLJICs=;
        b=B5HH/FWKjTxVHlKEfzKZZaZnNDYsW5KRMTycO4S3LmelsT7sg/XNmnNHq3kRUhvFx+
         BPonoU7QTyw54UMOjisWSvGzzpajKXl5dbRQhDajFNUNqgTJ2/JHlzEYYPHifOgy3oAy
         1IKfuNDWzK4vxL0tNZRizjKIjMlSa9o2XlKLDEaAYD2zHFDkIHTmuh/yst4JAFBkINwU
         9zVxlKe9ZnQV5QHCmXt96/iuVWkp47TB7LTZPOcwF49UHactThAqXokI7z8j7Y5rOJhp
         nmhbtdpUxmHQUvP3fPZWfeCmIWFrjDG0OKi3/r21xRQ2m3WdgsrL/VFkFIr5LQ9NlPdW
         NyAA==
X-Forwarded-Encrypted: i=1; AKwUvBxYcsv+C3zWwuh1w6d9YOpMEZ1xCo+bK4lrUwnjplnBaH9thyoEuFypAbKThU4go7oJ1L/1A92LA7svJ44=@vger.kernel.org
X-Gm-Message-State: AFuF++kq6rmQeQDV/4jhO8Fu78sDMWJ9zkyKKmcuMeg3aX9QfQu6qpRl
	1JPidgNqWL9xmixY4/uN4zn1rYDNLv9mod+FOiBtLa46TYJuJku0d3Fg
X-Gm-Gg: AYBFou0rkKNWiUT4G+uYf4cZRZ8VLx7NRYf2Ix3vEnUeByBX5KtrSxZJrujYMdok+Ni
	oVDQi55RHhSppnh/BSNFsv/x+Ux2h8pq2tSGASzLLJV1Ka3CtA7POBqUCtqkPGbKH4d+zJtPoCr
	fVvQF2dJ3WlphVT6SkYNwNqQi+/KozZRg26s61COTLYMcrA2vJ638cYRwjU+cU7UaQyLOFLkanR
	xJTlxkrcRoOE5BeePAF+dtfgTibVBQDl9EzcprcL+ymifUqbvJJbW3xJeFn7QdgebdN1ewwG7nB
	StJi/ssDKbPA5SM0KdYuwLaVQGzVAo1Rz7p9rGYVVvgg5mRZvIPGK/0G92II8IBTkT0LZZzvpWs
	AKhiKL1n7Y/1JVc3uE99UuoeVulMvQXR/UKlY6UKZXlfd+TkqVmG/BoM5+kXAguOvP1VySd+KJf
	jZ+GLduYgKix0Z77OZTCxBS4se9JYdMRg5l/nUp4FbOuzSZuaJs0mgN3uMn+mBug61Uwcnl1H3a
	tBBfBEC9vOspX0mCO9Y249l/nKFaLIiEl0t1w==
X-Received: by 2002:a17:903:8c3:b0:2d6:fec3:bd57 with SMTP id d9443c01a7336-2db125c2f3cmr189302985ad.14.1788601189102;
        Sat, 05 Sep 2026 02:39:49 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:dbc1:ef89:4dd5:b812])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495a0c0sm20393745ad.17.2026.09.05.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:39:48 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next 2/3] netlink: specs: rt-addr: document AF_PACKET multicast dumps
Date: Sat,  5 Sep 2026 18:39:31 +0900
Message-ID: <20260905093932.43726-3-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905093932.43726-1-sigefriedhyy@gmail.com>
References: <20260905093932.43726-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mention that ifa-family AF_PACKET dumps link-layer multicast addresses
and what the permanent flag means for them.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 Documentation/netlink/specs/rt-addr.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 0ecbd24c890c..2a2310cb0df0 100644
--- a/Documentation/netlink/specs/rt-addr.yaml
+++ b/Documentation/netlink/specs/rt-addr.yaml
@@ -168,7 +168,12 @@ operations:
           attributes: *ifaddr-all
     -
       name: getmulticast
-      doc: Get / dump IPv4/IPv6 multicast addresses.
+      doc: |
+        Get / dump multicast addresses. ifa-family selects the address
+        family: AF_INET or AF_INET6 for the IP multicast groups joined on
+        a device, AF_PACKET for the link-layer multicast addresses in the
+        device filter. Link-layer entries added with SIOCADDMULTI are
+        reported with the permanent flag set.
       attribute-set: addr-attrs
       fixed-header: ifaddrmsg
       do:
-- 
2.43.0

