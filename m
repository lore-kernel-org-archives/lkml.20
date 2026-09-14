Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C754B2FBE1F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350367; cv=none; b=NLgUqCjaYhX5wp5BJHaOLWd2O8lo2IPE2tg3sv3Wycy5SYzOGvlIMWkDQIdT9h2pfZRMw7gkZ6sHUNb1gnjNtQdzfILWuZ+7Oq5eAeTzWwVtgCA3fm58NqoH692NmL2rWnkd4Zmwz7NiOE9faZUExcz2sSBu9xPjtyD4uTlJjWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350367; c=relaxed/simple;
	bh=XWZSGWd0VF3BDk2Yg1A/EXE1uFX53VnoBEuepPt1BZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LN/Hpfy5TX+pxh94NB8Sx55CFZrVOZvZA1EMlocuR/kTBW9LIuQSdmSRubOTNN5hOroMjpc4WKxwX0gpy69Zps+yDrsZyk+0dQNXzuiz6SBWaZjdOuimKlA9xBZ9rQToTlrr9e4KVogNFABJZ62GfyNvcOE8o17rvwHk7ZFUY4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DR/bgdsP; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DR/bgdsP"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4ae61629fso1027543a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789350365; x=1789955165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6q020bOQ0jwuBWM3LeSY8k8HYujoeSZlWF2NlYzVlg=;
        b=DR/bgdsPljUgtaFRX/bjYdAttfefBZcB7asPvpvDxFZ3heijMUWoQ16Cw5OObbBWgB
         KoXZUiO2G4+kPw0afcqGPKzIjQpKnz0CTmxT27DkjGbIw4XfBQ2liyHcBCxGCJDEJoWj
         LBL5Qh99LJmFAXb3Gm7BVfrfbE4qaTCNLXljx9y50Po6Ic5aQM9tB+FQQ8D98BDLxouO
         BRD1rjSepQ3EyDbHbefwfmwwyFu2Y4DpWDzZyHCiZrojTGf0FdogkGN9+mlxpq1K0hAo
         C4KLV4gM4NcP5CdwpZwIhVHq4jXR0v2RnAxE8dyRaGOm4ozslvXHnERq7LwdBixAJIYi
         hyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789350365; x=1789955165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r6q020bOQ0jwuBWM3LeSY8k8HYujoeSZlWF2NlYzVlg=;
        b=UuWWxC0QzUYIlJ7qDDgUI3SyIm9VKTahGhcSPQ3TZktMjybflBPuXVrz7D+5ZDhtW/
         LcbgaBX2ORKCGL0JaP+MbRyBzzAIbXqAlYT3/gJXP54rxvqKpz7QBgwZyrQrUxKssu2P
         /5HZxXakvTULL3s9Z+Z8WeLPPNA84Jz1Yhp7jFZMPRI0+6W3dNF0cobteoCDKmHFlk3U
         jbJgAwiL7SrVjWdDoxgBShO+TBTOUJ6wBbu7cGPhKGqkpltuiRYpuQwTPmHcK6Z1sjvh
         Hu8csC0k6aTRd7BHIaMxOl6VvGREOMEw1AugUGckOBJYWFTtv+cEFr+uVu1t64zCI8IZ
         O4uw==
X-Forwarded-Encrypted: i=1; AKwUvBxgkq1nkt8iCRRKDTJ1TdxNx/cjmepaByPe2/YlAJJYI8Ip4Y8qI0OgHG+MjolOu6r75gC+HLAJwdvrTFg=@vger.kernel.org
X-Gm-Message-State: AFuF++lXOV/yAs+vp4+4PoZFBOzjfQwUfwxxzKlpj5ASOFfq5oVVg9b+
	B09Vq62Yctf1SnpjA+sr2zuNVOQQfq19f9fnep12ff7LaaFYF/F15HoW
X-Gm-Gg: AYBFou0UT46ls1o8pbuXvsekzdt19L64Aa7WF64ru0L8641Jkyk2AV4upmmavUiCDRP
	RzLnTdr6yVBPqms43Cm2teVOgXA96E/34XnkpxNq63eQCEvXk9vBIQ/T3y3W6bNS6Pc07WtXra4
	nibl482K0HW63FHs4Y8q1GAV1L76J4MHi3Z2/D5fHN+/OE8YjngaKXzCfhS7HNmMrfjg1TAyvHf
	mRGjy29aE/XksKcHL3IY5QA1dSdPm6HEaAgsgMEmUXqMdTQ1VqwG4cdwIARQb/lb7MnnV9o59Bx
	6w9CICvFWPbl9GVfxfmbP0DcIkIlOolEgUA5BJ+/0L/EuNYJheMWk7J+eK7GS3EzLuqba38Bzm6
	kPvjo4sWWykE9gbLSHWJHWdStBbaF+hSgGaBh/kfpZJDnF6fCKut/BRugV0FjctHsvdO+DWOR27
	r3zLQ9Zp5kman600M5vI5lZX7PJvsTtS2CDIZdh5tjZPUsmTpQNAIhWOFDft5IEJ1/9QGKJXOtb
	eMVWtfWVGTjJUjP2O7zaCeu+0wQ3oqRIDnGTdmvzP0u+v8=
X-Received: by 2002:a17:90b:4f4c:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39dec099eddmr1038486a91.20.1789350365102;
        Sun, 13 Sep 2026 18:46:05 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:fd07:4a24:951e:c85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d951d1056sm17513403a91.7.2026.09.13.18.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 18:46:04 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v5 3/4] netlink: specs: rt-addr: document AF_PACKET multicast dumps
Date: Mon, 14 Sep 2026 10:45:38 +0900
Message-ID: <20260914014539.5015-4-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914014539.5015-1-sigefriedhyy@gmail.com>
References: <20260914014539.5015-1-sigefriedhyy@gmail.com>
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
 Documentation/netlink/specs/rt-addr.yaml | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 17ead2203451..1a17e55d1cca 100644
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
@@ -168,7 +170,13 @@ operations:
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
+        protocol join are reported with the global flag set.
       attribute-set: addr-attrs
       fixed-header: ifaddrmsg
       do:
@@ -181,10 +189,13 @@ operations:
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

