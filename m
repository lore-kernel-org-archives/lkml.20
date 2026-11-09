Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243607;
	b=1h9Of74NaQ+nF6XLqPcp1mXaldjcm43b8eiuMDdLu3el8JN/0N5i/z8LjmwkrytvhlGe
	 1oBaJXFtgeeFOoIEnG9wu1fydu2KYC+UW5feB4pRnUafhD54wd34JtMX2+vi/7wmqrzNc
	 +18M0+GrTLVz3jeH1e6B6qMStKQNs/qMWmuuLgqFM0uI1cUCr/O3O7skRXE3vup5/TKNp
	 S0R3DlufY037xhlEfnsG0wvrElYGAEdPoChpOrVFoYT1PkOig/vtVprlxkeszWbQWXGaY
	 XOsZwYEcmyLK83gCVE/y/C91knsL6Ml0n63/ZRrMThJeyFurLT622vsxnnwSpfWOkCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4oRbTIpiBFqNerUaisLFQ4oAQLBu56UVoUbIIhDTxE4=;
	b=d13MvWMS3Z2/Qd+GKzpBoRxAu1i8LEHRkFl+cSXnucM6sSX2KqoGyYQ6gJgNbEKKv0hQ
	 eUjUAr7xpxVqIRgtNrVCAvxibHLsBr1A8GA+KeYupOJRnEGX+o/dHNQcHLroKPWYcK2hl
	 t88YoZ4j8W0VpyoI+VTcCdpTi+/AmKlVVb/IGKMQeQ40Qoohe5RePX2JbIXzzZb0esC6d
	 vTc++l1uUx6TMNaBBK69wkwLhbx7RhZZ5XjPEsnKQOS6BhyOPKX+paZvCzBSFhZTCuyMW
	 ST64EyTrnVMgH5BATMekT0tBMSoQ03GD0kEQhmn35IJIW7eOs9yD3TgbHXDb0+HEq6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eDdXITGG;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743E9606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 743E9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eDdXITGG
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so998259eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243606; x=1794848406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4oRbTIpiBFqNerUaisLFQ4oAQLBu56UVoUbIIhDTxE4=;
        b=eDdXITGGJWUoMmHmAtjghQH/pX1xA3TTArij0p0y3Y8RX30nUSBZLCg/0TtlOvixDb
         h/3sWwcN8ATxPFFcK/7xBLGLu3N0qRlh2xy4T+Ce0rSF6ZAvPBPfkSVLlJAPWCYJTAOb
         jJeCNKXPqk/nzRnCvl79KkbVxpbS2dX3uYQoxYn1kDScAfVlqouKl77Za1oCo0Vidy1A
         ZfDoW5Q/+x14rdW76ohTTIpfhcczw14MlX3vwtTHS0Gx8DqgOjWZDbEzEZkJOwcuZJ9F
         NddiW2La16NuGfIH/kVwgFYUGjCXGVtHzl8KJiH9XkpldsNJdyEsONuGfKGppzR0s+9w
         wt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243606; x=1794848406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4oRbTIpiBFqNerUaisLFQ4oAQLBu56UVoUbIIhDTxE4=;
        b=O0tY22UT+aNfjI/kZAYpqOFgDa57au0/2iVOBInaaBsy6GSVBdO2jbvfwgLv/Zwty7
         5Cs/pPmKcbshhCYG47NDotDxB5COCqlMqltN++u/zE+HXvidFsIqkVXn0aAvIHKSEFS9
         ayQIVECFzLNHNvCyrH+xEcMaAkHdg19TPIYgWO4yGhAFvxJTJ4oJle0f7Ur2f9fDGXzh
         1OPgfmcRQDS2DgwusIWVSTML6Hxv3CdBY80h1eeAhitQzr7tKAV5l6e4veOZERmyrLPs
         ptcCvWvsejxvmiCbgJqmeA3Ajh++ipgEptBgkbVxpqHnqjS9PUQCEssZaGqUO7sYw0lz
         o0yg==
X-Forwarded-Encrypted: i=1; AL+hErF5cmR8/yG3LWL/rRQFcUUsWKUyLmXgUIb6DYUUKby1rhZQFxNrx1imusNXUSBvYP05xK42AROoxvx2lyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E1DoycJuIQz98MSLPZbTsHSyY4uSz520BzMo00ZxVo+yq9GgE
	16rnCK7xIaHaryr/gDW7W3pqKlb04y/w6vEKJPHFG4Kt9qE6F5ZDBEGw
X-Gm-Gg: AYBFou2bDK6DAZLv1GGlCDpbhR/+qLCaqkLFU1r+81qbUKtxvlsJYVT6W5YJ77fLp1W
	nM73GhpTPnmbifpU+YGlmhKBk69QCo2jL5yqO/M8i9Q+OrACVUw+39Qm7bxXmUVFYhR6Mz1dOND
	Y9sOHcuaxuaqsL2XagsWSArDMPAHP4g1lWoVzIlSukjElG64BQH+nrL6qWiSUE47PJX6jOOKa7c
	oMwcWDy+q6N9+XxY085/ZC3FVVuamGYx2E6l7Gbso9Kb3QQYLccNSZm7dF+7IfKuBxiX8VAnlBq
	jPovQlqfk5n49ENGaAy0z0USDy1HGjKUHBTquBdT4alqeyvNTbJS0J8b8yK1/ylDUgVHovNAxJW
	LL7w52Gxz4W+z36cQKjruz6WGoV26Floe0TfAwih9XzW2ujuj0wzFnmes9m6vNOiOIinmzfOJUF
	6mwpSbRJyRvd64VbnAbVkiA9siQ6+BCdDLaOjYI9FFt3Pq8SubKeQUxDcR+00CSYsakdLUssXKe
	eRAtVOv+s0+skjWGq/FTopK6QVjIoyg2RU4XO2XCseLotrVnMVMkxqKFN+SuwaSPTEfq3VC98qp
	hoO5enTLEqU9CaQ7krBQ6lghnhJDig==
X-Received: by 2002:a05:7300:2153:b0:371:ede8:3e9b with SMTP id 5a478bee46e88-3725ef0f5bbmr12262115eec.36.1794243605818;
        Mon, 09 Nov 2026 09:00:05 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:9b1b:1e76:b09b:3a78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-373920a0219sm9394010eec.9.2026.11.09.09.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:00:05 -0800 (PST)
From: mdshahid03@gmail.com
To: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: =?UTF-8?q?Ondrej=20Mosn=C3=A1=C4=8Dek?= <omosnacek@gmail.com>,
	selinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] selinux: fix potential use-after-free in sel_netif_flush()
Date: Mon,  9 Nov 2026 22:29:39 +0530
Message-ID: <20261109165939.138448-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Mohammad Shahid <mdshahid03@gmail.com>

sel_netif_flush() use list_for_each_entry() while deleting
entries from the network interface list.

Use list_for_each_entry_safe() to save the next entry before
deleting the current one and avoid accessing freed memory.

The issue is reported by smatch as potential use-after-free.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 security/selinux/netif.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/selinux/netif.c b/security/selinux/netif.c
index fa6d24a37c39..d5e258fd52aa 100644
--- a/security/selinux/netif.c
+++ b/security/selinux/netif.c
@@ -242,11 +242,11 @@ static void sel_netif_kill(const struct net *ns, int ifindex)
 void sel_netif_flush(void)
 {
 	int idx;
-	struct sel_netif *netif;
+	struct sel_netif *netif, *tmp;
 
 	spin_lock_bh(&sel_netif_lock);
 	for (idx = 0; idx < SEL_NETIF_HASH_SIZE; idx++)
-		list_for_each_entry(netif, &sel_netif_hash[idx], list)
+		list_for_each_entry_safe(netif, tmp, &sel_netif_hash[idx], list)
 			sel_netif_destroy(netif);
 	spin_unlock_bh(&sel_netif_lock);
 }
-- 
2.43.0

