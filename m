Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33442DB785
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789854772; cv=none; b=GMLjyBuQMC8e+RMeyTxLFt9OkwtnikPnlXzHOo7/n1h/i9TdHzM2FI21iWdeqYSlC8gqWtf3deb3DM/SzTq1M2Gd/XDdy54TI1tnT/DZ6m8nGq4b7eiI+AXY9/pmQtP8rRolEX8QWfbIJs+aAn9rLxaptF68CSo/Cu42oCwreLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789854772; c=relaxed/simple;
	bh=ok7q8RjuE02Bww+2QvSjqNtvkMyCStknUKyLWbBaTyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZXqqJdIeQFKmmpqQTpif4Q6zGlyZY+WfTFxiCCQfSHRFiFi+2/0XXHNFAFAMJsId3Z4TLxDtoTpRJ/07oH/53srJU54+202+GcWKcX99FVXEXjeSjO3s21rSfsyBMjv52ZCpcjEl3IccQvWqcj27M3+8B1mywbVxJOnu9EQOXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwXrRn6c; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwXrRn6c"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed6d6eso18528765ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789854763; x=1790459563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cp35LkaPgGuGmcugrLJDe3EFri8Cdl2WjJc6hIpiryg=;
        b=PwXrRn6cQlBooUIymKChwIp4+XG5Gw6XmGayioQv/YymQnxBptgc9e77iOSJ2PipL5
         dqJgc6xz6QTUkcGOPunig3s+D/W+89ajnwtsg8ntizY1qBDVP1styBx+4gBF+D2Y3pPj
         W7yibt025sqDOPNQz19Ac4tZ/zKEwFxUQfQ708Il9Tq/CZ/+jtcNEQPZu6dff32mTzQC
         WgAK9H234C4VnQtFC4nlAQyxa3gjQVIxXFDzo60w3TiIVz9ivVYxh+/aSX6Qq4lEnPOA
         l7EJf2pGe2gZCCRkWJbllFvlHXOjv7huQj4GbIoOvGb7WhOr5foSFIE4P5NqG1JcL2Gs
         zmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789854763; x=1790459563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cp35LkaPgGuGmcugrLJDe3EFri8Cdl2WjJc6hIpiryg=;
        b=wH8VnavXCIb+pGwx9WDQepDMhhV1auYsOckq6pH+cpkJozGJ/57cyhXkj9PWbAqkUd
         88ZwlqNn6xBt0BKIVBH+ZySQI3uaXrzptbtyJSScj7GydTSyEI+VZDByIFPXMenIuLHc
         lrFyVE19YzKHGXUQg5pNFyXc/c8dGFcyUAgSsgvwLSEBm0VM6igdo0rdpRKRTEkhbqiJ
         cAGWLesf54iv7Fj7TzN2IecAni2K6j7Ki94MrrOJ+vW/Pno800drhdBzHlLv+sp1JMgk
         T9wjWMACRbZL8EWCyv+aXHSdvb5LCgOcTSxgbKhMMjvtpTq1Q9KYQWA+vlPt3VZI5pRT
         Fu9A==
X-Forwarded-Encrypted: i=1; AKwUvBymcVPEiG4zciawDTntXEANdEHI3NwNy32z6q/qcywoswCNceoW4EJYQ4ZnshafkJXRgv8QZVvFUC1u3OM=@vger.kernel.org
X-Gm-Message-State: AFuF++lmILcWyT9LX3EpA1tXjVJm6e9+SMunXwv4uyoGHxpSChHSBUk5
	aQLtuBjya59miW6HepVTYnstjANsiYyOKyZpQcPl7+q1B2uxsYP8EOmk
X-Gm-Gg: AYBFou2z8bUbzBIKh3F7H8pVK5TklS4dBViVTDFRrbtTiLKmdW8gEUTjnXVzfy5jfqP
	KJ/ZuEtH78hru4xgfgY6k1dKua8BC5HJlQstwk9SPzeXaR1rN0MN7MYNDMUyzLkBoAerbxnCUWQ
	RwvB2ugEvPhl3RugyiouOm8eABfu20JWlJBpdCz97Ep3GTovRuoPkAjlRQzV7DzJRVdD/4raEZ9
	HNKNFMDl0LA2ovzfbIGpMNSEza1yFOE5+p96gaWGFRh92WAVNSH38RN8lgNk8Lq7Zt3ZwwUWqyM
	f6eEP1c+QmSLX4hRJCZxHshcYU6JQ4LPrzAxOXDa+/W9tskd561TUpurgEORVUhXhMwGVm7eABA
	uOblfexqUOhB8pE1jsns9/UPVMu6TpX7YSJRmdg8Nxl1w2YHSllx5p74SKPMge8pQMtPR9qg+P5
	AjMJs6CwW+em32VPLJIbfpBHG3jv3mp7SfW0gcCegBuN1J2ze+LoaM2K2VX/LukOs2bQ8a2fs3p
	8aFNsEnKk1bgc4gqL68mGGxuo//lZGgdeRD3U1rNHr/Do28ISbHGZ+nSNaNd40NboopAq2euQiT
	8M03c5H11w==
X-Received: by 2002:a17:903:2343:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2ddb1ab24edmr114324035ad.5.1789854763351;
        Sat, 19 Sep 2026 14:52:43 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df3ae73eb9sm3264875ad.44.2026.09.19.14.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:52:42 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] netfilter: nf_nat: fix unsigned range_size underflow for ICMP and GRE when max < min
Date: Sat, 19 Sep 2026 21:52:42 +0000
Message-ID: <20260919215242.3471883-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nf_nat_l4proto_unique_tuple(), when NF_NAT_RANGE_PROTO_SPECIFIED is set
for IPPROTO_ICMP, IPPROTO_ICMPV6, or IPPROTO_GRE with max < min,
computing max - min + 1 in a u16 range_size underflows (and wraps to 0 when
min == max + 1, causing a divide-by-zero in % range_size for GRE). Handle
max < min gracefully by swapping min and max for ICMP/ICMPv6 and clamping
range_size to 1 for GRE, matching the TCP/UDP/SCTP path.

Fixes: 203f2e78200c ("netfilter: nat: remove l4proto->unique_tuple")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/net/netfilter/nf_nat_core.c b/net/netfilter/nf_nat_core.c
index a4858c2b2d65..83f4eb63a584 100644
--- a/net/netfilter/nf_nat_core.c
+++ b/net/netfilter/nf_nat_core.c
@@ -575,8 +575,10 @@ static void nf_nat_l4proto_unique_tuple(struct nf_conntrack_tuple *tuple,
 			range_size = 65536;
 		} else {
 			min = ntohs(range->min_proto.icmp.id);
-			range_size = ntohs(range->max_proto.icmp.id) -
-				     ntohs(range->min_proto.icmp.id) + 1;
+			max = ntohs(range->max_proto.icmp.id);
+			if (unlikely(max < min))
+				swap(max, min);
+			range_size = max - min + 1;
 		}
 		goto find_free_id;
 #if IS_ENABLED(CONFIG_NF_CT_PROTO_GRE)
@@ -596,7 +598,11 @@ static void nf_nat_l4proto_unique_tuple(struct nf_conntrack_tuple *tuple,
 			range_size = 65535;
 		} else {
 			min = ntohs(range->min_proto.gre.key);
-			range_size = ntohs(range->max_proto.gre.key) - min + 1;
+			max = ntohs(range->max_proto.gre.key);
+			if (max < min)
+				range_size = 1;
+			else
+				range_size = max - min + 1;
 		}
 		goto find_free_id;
 #endif
