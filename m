Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05FF4D2ED2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646184; cv=none; b=EcHD2qtIgcfjLrI6XQ1u7fuG0OML+jDrUSnN9XSpPOCoRmHBSWX4LMwhw39HKsZDn+CJKoJTFokT09J/GZ4uBdKgwb7tHKreM7d1+4n1DZQES5+sF6U9kWAFvdCQm5xbMquPQcEIqOjMAU9wG0uDY+g2bE1+sQWrByJVbQ6mPWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646184; c=relaxed/simple;
	bh=vblgVjmKLjnqZGvPgkCntjtx/0R17wWvdDbLZshFLYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D1Htdl5AExlBLjeASqzg+yaCb4vpJqUmv9ILo8IpzSKaaQVsin/ymwak58VcoAn2NwKqzXl87ewLPHnefZ5C5bVvTIspe448eZqv6SwqjkqiCMaFS6xrRjWwLJDeEym9SWBrN8oqfv2nu70Vt00P6tB28o+yNfJruqdNuyLxQFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSXS0aWi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSXS0aWi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so3937555e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789646169; x=1790250969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sfSAIiiQdgel4feb27tEimyHftJdnHXovDfE5MDcETc=;
        b=YSXS0aWib9djmCbcYduOElRmbUr2+dvSU9vfgRCkf3c058OJK7T6dm4s37P9KufrXp
         Js/sOP5MAPmuCpjRJgqSLmC1LVmsaWyfLufBKXoui9uH4qVL3s58k6/Fs4YRPt8hns+e
         R4CEJ+BnuXW4TguU1oXGN/x5moUmGpezGd51ZK8rGKlfYxYZhj2vXjvruVzIK0dwMBHz
         ZtNgIhdAdZl3A7peeMIIkivZUbKPShnkHfl0molCteJQ1hux6XAjDcCEcgl1cRZoBxsK
         A54Jaqxh0kI09z/xSRXXVH37qvARQS9EoyVadTGK0fZt6xkHDRnKACGd0toWrkAKf0pi
         60Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646169; x=1790250969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfSAIiiQdgel4feb27tEimyHftJdnHXovDfE5MDcETc=;
        b=CfhglKGUFDLs5gKKulhoQIM+XgEERsyjwBw42qWBgpoDI4v0PePCwaSI+kLgyjtrxl
         BZwv4iZY4NrvetsT1QuF8nDKdapiv0ILwjQf4U97mjb6rF8IeGGVXNsv5gFxPil7fzRu
         DV2OU+jTKDl7cqNLF+VJuN5pSsaM/4x2PHXzxE3H4D1VEdhnpWkFIy1o4CSf7E7RBvQt
         BZYLsU2aFHMpqe0Iy5549f9gP+UgY0shW1V8ti0vrN5PbK+CcP/CJiUvx442w0izdujr
         t1znD/NkhjuvjtyUfTqU5WhekRFKnUnXo9y+g5KSmD7QdBW5tdYYwXg6RDcUXBaYoFuM
         YpJg==
X-Forwarded-Encrypted: i=1; AKwUvBytyGFSVtWKwBjWWVibVBmxxDnnW3OoR6GdaPo4JftEflPozpX3CEVt9hvb4XfMEUBvxyocs2Dxbz1cwsk=@vger.kernel.org
X-Gm-Message-State: AFuF++moddvgTNQmU+OTug8izcatEl4fs6RAzKnz70iLbusL42mL975V
	NrpPLs7KPB3msseD148pVbeiEaGj7093P6+d4Ztn0QNzNQycYlTNuMch
X-Gm-Gg: AYBFou3yMmpI3QZJCAkUORyHrI4qy6H4BeDGqRaiaYwFkARD47CouLLgfdpF64BrseV
	pKbCiGq946U/O5WQ+8zDJIU1JgrdrcRalxXmwl70YkDLqr6dwrscT0Uh9Yy6qzqCTYSvfC+hDhO
	mb5z/c0MrKk36t/w4X1Gv96nkLXUMDL5rAjd49yhUDSomaDSDRhr2Ln9JCFP6jRhRFjNuVpQbGm
	qvLeno68MeTbgG2fIb9EZxwnKZBLzc5cplqqBFN8DjKHOrxpszB5K39Gv5ulV4J6YMUePkbbd/2
	sRLh4pVnIkaFr91CPYZJoI2/A+P/xXPA3SJiIuvrToZnLfRNdAW3ZM+fKhIc134q+D0RBlqLi/8
	OnFUGt/VNrukRu01KF3kUM/Gz2v2UhxrPZM68LkuV3MtjAwyekhktfWLjyJEkmR9zbOc01H9DEo
	/e3xmuiRy59iq3i0yyJfVlgl/vLDZ/Ac6KZf0S86/rUSEdS+kxl2spTRzO1c/pBZxYW6H9kjN3F
	vq4lJwlApE7lGGWgq5C9HMvwk34XdtwbVheogXcfyJyEoD6
X-Received: by 2002:a05:600c:8b35:b0:49e:6861:50f7 with SMTP id 5b1f17b1804b1-49eac4626c0mr70270685e9.5.1789646169088;
        Thu, 17 Sep 2026 04:56:09 -0700 (PDT)
Received: from andreayoga.localdomain (93-42-14-189.ip84.fastwebnet.it. [93.42.14.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1ce79csm79913185e9.0.2026.09.17.04.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:56:08 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Boris Pismenny <borisp@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net/mlx5e: fix swapped IPv6 IPsec policy masks
Date: Thu, 17 Sep 2026 13:55:42 +0200
Message-ID: <20260917115542.177675-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPv6 XFRM policies may use different source and destination prefix
lengths. mlx5e_ipsec_policy_mask() builds the corresponding masks
independently, but setup_fte_addr6() installs each mask in the opposite
address field.

When the prefix lengths differ, this makes the source match use the
destination prefix and the destination match use the source prefix. The
resulting hardware rule can both miss traffic covered by the policy and
match traffic outside it.

Install each mask in its corresponding match field.

Fixes: ca7992f52c2c ("net/mlx5e: Properly match IPsec subnet addresses")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c
index 329608c59313b..8ffa8068e90ac 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c
@@ -1564,14 +1564,14 @@ static void setup_fte_addr6(struct mlx5_flow_spec *spec,
 		memcpy(MLX5_ADDR_OF(fte_match_param, spec->match_value,
 				    outer_headers.src_ipv4_src_ipv6.ipv6_layout.ipv6), saddr, 16);
 		memcpy(MLX5_ADDR_OF(fte_match_param, spec->match_criteria,
-				    outer_headers.src_ipv4_src_ipv6.ipv6_layout.ipv6), dmask, 16);
+				    outer_headers.src_ipv4_src_ipv6.ipv6_layout.ipv6), smask, 16);
 	}
 
 	if (!addr6_all_zero(daddr)) {
 		memcpy(MLX5_ADDR_OF(fte_match_param, spec->match_value,
 				    outer_headers.dst_ipv4_dst_ipv6.ipv6_layout.ipv6), daddr, 16);
 		memcpy(MLX5_ADDR_OF(fte_match_param, spec->match_criteria,
-				    outer_headers.dst_ipv4_dst_ipv6.ipv6_layout.ipv6), smask, 16);
+				    outer_headers.dst_ipv4_dst_ipv6.ipv6_layout.ipv6), dmask, 16);
 	}
 }
 
-- 
2.53.0

