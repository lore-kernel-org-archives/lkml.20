Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFBC4D0CF7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767769; cv=none; b=VlgyrfFn0mQZCAElD6B8bt9FKb7nDfkvPHshnAIbmUiVQcYZA+FY94vlKFkXRcNI09iDaiZQaGA6ETuAT42SnWGMXjds29I9KutrsFGEdKf6+C/74iFvH1RAe+/4s7kBGvgiIMooBTEa9ooDBG2o+4PTfRR6tQIB9vScr72obeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767769; c=relaxed/simple;
	bh=MtRgZIL0ejzkv81A5uoXkUOIGYLKSnfs4/MRbrb/dH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0sNcaaY2LGUqrcmt5IE/KYZz2GCIAcW9h/kZpzWz/fmALXWRXlDzjtSVxUZIhJ1MAD+m5EZiwLdtQFsYsMRuXi1L5MQxyQU4kgbQl6zVB6vcAXPZYNILlZOJYdF7Sv12KZmHa+DKM5PyPKWrztQXC8YHbojtYtrRS1BLHJo7Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNKiX4ki; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNKiX4ki"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4bb1ed012so780030a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767767; x=1791372567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eDtomUq8zw6nK1KObwDR6CCREpvglQp6A+WXvBo8Gzs=;
        b=TNKiX4kiUPdsvOWP9SceCTouK6sy9iUYNjo1F8p9Mjxl7+lwcdssD7ZKzSS0/xNJt5
         uXpVEDEEwiMs13xJSNvz5v5hIoas9TJqjepmu9rU2fJ/zR2OZgiby+dfL1Fjw75rYGC5
         QLmvrPGdCnVtrJMiyoZUk8qDvZ62TUQujP8MY9ys/usdldL3pDj31Cy6lx/ZumGiYwtN
         Z5T8oLTuX9zLVZUpQoIGJg8POp4DjP6tvZThArmXEphubZSTQw6nwtz/Ib8SDNj9/KOi
         d2/VsFm1E0Rdl1jb66V4QHR3THJ2wM6nbdDoxMMc6qUtKY/6jZHFDcOVOZrMydY9b2Zi
         didg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767767; x=1791372567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDtomUq8zw6nK1KObwDR6CCREpvglQp6A+WXvBo8Gzs=;
        b=huML9GyWsFSIjezgVhgHnNtAJtiKPu+2TGlhMcV2lRLXHra1TT5lPAPKyIpI6ttTWx
         TI59LCHBZLZk9bDDvKbFuXZ3ty7qhGLEUAY/QMs8VOos6tNbI4nVv7NZdCRiB1fBMB4d
         3MR+499i2XvOvXEBu3MF9GanlkN07UsQYw5YamVg81HWzmeOsm9akq1WBLdRln1o3q0N
         B2OU/oWYV/adM/3OcbATcxRppMW7JMDvCz8feN0YaW7aHziXDyx3QgycFil9h3/X06wD
         m2JtSgtb3sm8GqnDKcMnB3UYvO9lZNRM+hOf6gcTuNqwDUB1kr0fBwXnbf+wrBoX4u2S
         S+DA==
X-Forwarded-Encrypted: i=1; AKwUvBzSRiPHwloH+HjxxDymQ95/hUg/QNlOdbnIRmo0QSN4CIRCxN0bXTOIWFkrcSAoZQpBwiLkKzIgz8KXKz8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbshqJTgrWKwTeW4RLW8THyPJUbc6c8xc+E2u8SEgyVTApdG6/
	4l2aAhJ1eAYavPsnI1WEarEZ2ETm+LyPsUxLeypxcOpUPLFSSLygP0xE
X-Gm-Gg: AYBFou1MdT89fwI3yG8xgLZEXyAMIOW8dTYC9gXHn2YxDiudgt8TQjuJI8Qqn0zf7zQ
	cPMSES5wu/I1rbChBg+0E8GL8TkcWoAWoys51lcHwLieqnPVNfOAkG1jVa1qaKAyIrz89cxR/Je
	IDatfNP2K1CJiVWyV+XS4yWFEBRS17ce2q5ADOFruzpsw8IXVxeklaVPPV7SchBBfFGjT+0jTiN
	GkcnKf0byWPPZrC6fGdmUTF6n1X9T+pK/72XCn+zweKK1TFqTPqzuNdjuA3GJ9Q9Vq3xJ137swR
	426b98om+UNX7ONSfSF9a34gG96ylMADntvVWDtrQxCg/V/DI87k7/8eSz/wKr2RGeLm0kQ13hj
	Zqt7K8t104jrAzEy5N7YJd9IYWxWlQA+W5qAQIQ0ZaTd5aEAM4GibPet82rueIdzgQ/ZKbpUrnT
	DVsZzEcDxIpIgeylWPmu3MI9mr5Bz7tUqIOrWayj2AQoBU5N8s2hYo8QSuJoKQjzVv2/Gep/7Uu
	p534+tvSdpwA+EfSrJ76xf/JLsAlj5qEcJnVkZRUYrE
X-Received: by 2002:a17:90b:2787:b0:3a0:e76e:ae10 with SMTP id 98e67ed59e1d1-3a4d175ddcamr1003462a91.28.1790767766632;
        Wed, 30 Sep 2026 04:29:26 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:3fb:270c:7df4:18f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7dab46db6sm712637a12.31.2026.09.30.04.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:29:26 -0700 (PDT)
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
Subject: [PATCH net-next v9 5/6] netlink: specs: rt-addr: document AF_PACKET multicast dumps
Date: Wed, 30 Sep 2026 20:28:41 +0900
Message-ID: <20260930112842.21323-6-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930112842.21323-1-sigefriedhyy@gmail.com>
References: <20260930112842.21323-1-sigefriedhyy@gmail.com>
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
 Documentation/netlink/specs/rt-addr.yaml | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 17ead22034515..1bd1184d1e202 100644
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
@@ -168,7 +170,16 @@ operations:
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
+        AF_INET6 apply this with NETLINK_GET_STRICT_CHK only.
       attribute-set: addr-attrs
       fixed-header: ifaddrmsg
       do:
@@ -181,10 +192,13 @@ operations:
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

