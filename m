Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2180431A4A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789907302; cv=none; b=YF9nHnZh6MhdCk5CjF6xMFjZJLiS8R/l16AWPdUgJHPCGAyVeeRy758dJFhDzgWfXdyig5+gYxGdINog+4zSngvwb5nokuvy0o6JPupeJPOFLQqJ/f1ZuS3c1m6JEve8vtEsYDEML7P8xsqNvhLZXE6GKGZ8OZaepvuA35ealHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789907302; c=relaxed/simple;
	bh=ug5ivTizQ1N7ESUeK1HC0Ctk7wrSvLsfG5IU53GsVEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DXHAAihovYjY2qItBo/qOV/V9yNg3NU1nn3r8LMBweFwO1Bv0C6AUS5fiBmiFOMoi1QlC/pF89RgNao48T0bjMBJliAQGXmZhvGBKF1czBUHvnVPB2PRIIDB5i4swgyDF9ik3y1CHWApcgRpk9k1din8LWGZBsOtSEI9P298Bx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnkmQBfl; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnkmQBfl"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffdso15488685ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789907293; x=1790512093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dV2mf6OjkoqKta420YWVjn2IUO2T2gOHZv0jasF5Urw=;
        b=LnkmQBflNZn6Ywv9y6nSyxsFWOZhHopQ2Fq8MD0pyTfTS7ob6lHf0VvD7fECVe1Ok6
         lP6wNnsACmbxjJXrDmvPAzEgjBCDJdbJaMpB/pBnoq76Bzntj6k0neJhSgLsPALTZG/Q
         JrwbdVItGyWBdw4GyqpE9R7oc9DYsyYzzyh4t3OlDmZac0ryKqcdR8J3syD6mZcJFUdl
         R3hF29u8G4usOdvv+FzTHT6JuD0OIAjru3cYEzABIrKqd9ib6czw2dTkOCYqgwhhqlW1
         ebjOvOYLP0fkZiQuRbp+VjGaw+xNdHJuioYddWwrfqt30pTfgouxlY0BzaOnF1tFDeY5
         Fl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789907293; x=1790512093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dV2mf6OjkoqKta420YWVjn2IUO2T2gOHZv0jasF5Urw=;
        b=mX5pmz0kHaufLv1xVLp6e8Frfkjw7wdbv1T10vz5kZ1u5N1gz/Yu5+MPnYoYhE6YSV
         YCxT/5Opv1ofWow5k/NXv7FQWX2fwqWVQMmE4AGKwJWvGxO81Qq8D4ka5OcwZKN9Ukym
         avKzfinMG7cDAEodKhc/sIEQawRI8092FwYTMJnoDP4O5lAidkBYqVmkSGsjFs3R455h
         8wGMn/OQjt2tyAWpd7MtzGjpDodVgUXPGdfGVGtAUrMnWqGqDL2RGzx8KelNP7mMt5hR
         Y2ZQMVxt2N0eUSP2AHif8ffBihwki3SRTvmE468fCp1JsXVC2M13idGE6Ky1VE1O2POI
         gLGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbq9WwhXhgfVppZFtY9tYc1j95rhU/ungneDdP7m/TJI42F0ttcFtCeF0B8ai60WXh+J9xvR9FU+cSkUk=@vger.kernel.org
X-Gm-Message-State: AFuF++nZ+0a+wNeG4BG8/H7JwTkrXZdKe5VhDoQCbSH7WiSmHUUkl+WL
	KZ13KF1dTNxAKFp5soNB00GLVP046httxwBHsf36jzOapAUXrEPELN+i
X-Gm-Gg: AYBFou2gRsdPUlr7LtpnBi2BZeA9ROJM2fsXSbU/1b3Sw16Ee8NfzYBYzt/ljVth8Wx
	BgMzKp4KaID+xmuiaU3C8UUqPO19jJeXEjuTyMGG6jluMgtFjNd4WIr+WmKrXhfgA3tdrdoW43c
	y8CTAldgB7HiXv2WY2B813kcFimDgF1TKGJkjYpgFSDl67H0AoC3XnMsNI9kuqrRpi1QsZ/qGHu
	DEFDpqcfs1Wf4NeyKFiFLPosNBi1EjcNqD/tLHzoyR+2Fq8+GXQpgTqSCgAzu6lFoXSARrJ+MVL
	uIbQEv70JIKR5jJkZMTbTie6Cdn22zRh5XahzMQIcDytKTdHC7NZZomfn96GfnwoS2nVCvWGy2L
	LRr0HiFTCJ3mrKE7TZdXaV2s+uuhBA9w9WyDwP58JKOR+GGPGkKgqIqCkstNyAUT2rFXqkJGqMl
	69uqu8zEoBVjemxrTuHjibnyWT86AhTKv9ojaUX+Q3bAcVupyNNsn8G6x67jrHchQsYKjWOfbG3
	9Or/c1luGSz7GYIkkiDPKVtQ0qa08EtzSs12LI58GerX3inHt7FWL1sAYKokb4hK7AXs/Sb
X-Received: by 2002:a17:903:37c8:b0:2dd:c100:80b0 with SMTP id d9443c01a7336-2ddc1008158mr57187955ad.43.1789907293493;
        Sun, 20 Sep 2026 05:28:13 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:2df5:84c3:962:c847])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df36806cdbsm15428845ad.80.2026.09.20.05.28.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 05:28:12 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Ratheesh Kannoth <rkannoth@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH net-next v2] octeontx2-af: remove duplicate SCTP port flags
Date: Sun, 20 Sep 2026 17:58:02 +0530
Message-ID: <20260920122803.6277-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

proto_flags ORs BIT_ULL(NPC_SPORT_SCTP) and BIT_ULL(NPC_DPORT_SCTP)
twice. The second pair is redundant and does not change the mask.

Drop it.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
Reviewed-by: Geetha sowjanya <gakula@marvell.com>
---
v2: add the missing net-next subject tag. No Fixes tag, the patch has
    no functional change. Picked up Geetha's Reviewed-by.

Link to v1: https://lore.kernel.org/netdev/20260918060323.53860-1-sinha.aryan03@gmail.com/
 drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c
index d422bdd5e..ec004ea51 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c
@@ -698,7 +698,6 @@ static void npc_set_features(struct rvu *rvu, int blkaddr, u8 intf)
 	proto_flags = BIT_ULL(NPC_SPORT_TCP) | BIT_ULL(NPC_SPORT_UDP) |
 		       BIT_ULL(NPC_DPORT_TCP) | BIT_ULL(NPC_DPORT_UDP) |
 		       BIT_ULL(NPC_SPORT_SCTP) | BIT_ULL(NPC_DPORT_SCTP) |
-		       BIT_ULL(NPC_SPORT_SCTP) | BIT_ULL(NPC_DPORT_SCTP) |
 		       BIT_ULL(NPC_TYPE_ICMP) | BIT_ULL(NPC_CODE_ICMP) |
 		       BIT_ULL(NPC_TCP_FLAGS);
 
-- 
2.46.0

