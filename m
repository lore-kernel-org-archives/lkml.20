Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C220E3290C5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789711417; cv=none; b=mZIuGpsxh+0APfdP7+SdiHwQW3/y3BBEJnxdapq2yJ7KcV11PPQJwlxU0q+XIWTniE3cOWAMZ299o5YX1+g+N+T4Qca2XOCL/qamXVnVdnydMyo4AE1Naj0q3dqM2byLxKTv5rDrbGivq1bczW75238TJVwyU7mKnd6k0G4BAB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789711417; c=relaxed/simple;
	bh=ZL8Jx3BIoBtLus5oyuP9FbIKPH1b0o3RPwrbGhT9xVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A+z3kN/giioeFZkSF4JOn2M3zs+9DxWMxsnqOmQ5S99G8b7a9Og76es4xw1F7D2vHUupomFj0ZHdDJwg6DE/qpcVYoOMQ4CG3smpEKNcFqLZ28p3G58638a7HFsYELFVe0YnFYhGSKMvEFEiq2Ak3ncCfm3h++TJiiAxCO2EELA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsE85wCy; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsE85wCy"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a33c9cso582759b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789711415; x=1790316215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dperup7ufDLu8IbcgcpGCPqoa93XHCi1Cmm1IIuNUA8=;
        b=ZsE85wCyrqV7kvtpsBQmj4o6VfNSyE7HI5abLOO0RFSOF0PizeisosqSIqVVaMG9EJ
         5jT76wRIPogDHJdcQXquXXMG+WoP59YBngewF7BmEtCZF98Q74nhm/nLNWvKOY9Bmm84
         hY8riWnK+ddtohDEAOj41+BoEfZ5oAYa/U8ya4iVjdeLZmEf3UFLDjA6hVSkdVBjSO1y
         m7eljYYUQB+PClklSzGBvZ4yR4Kn2SrBP8an4WOp2mX/eoonrqIVrC3T1cGkPfqkHQs5
         MUVhEKliFNsteKhEopSUu/Mf0MR3eVgTxxLeKdrQbT95aORYyhb6S7dxQ7OUxPVjcuFh
         VYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789711415; x=1790316215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dperup7ufDLu8IbcgcpGCPqoa93XHCi1Cmm1IIuNUA8=;
        b=l/kGpgz8AXBEqZYmCc+MUbtBoLPhpbvFGzWJcqELCLWGLuJ9lpCytkbjqIJ3r+ODJv
         0v8O3zo5xBQTwGUjsCWvGZuhOAXZrtN9/vCzQzYoYMMNhBS3lZXJRFPexF9/SYnwnG2A
         fWF5lROj63UKCqR+6jjaTNtvl7A8REcz1rw32urjT+nkrNqXJpSWVDXNOCpRxiGtNdVL
         mYKvOBatY3gxHteBB0UMKAo2PJFZglt/hjlsqHC82Dm7k8o/Wu3c2IHAn5JaL7iv+ki3
         I2z7WKVYGO5OKQ8wErpRV1yQxNwmMfqkrw6JOlnibAgakIfiihyf9kJ+YKOZJLm25aST
         LDlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFqj/hDyWWFvwPDGLPqohdMy/VZf0/w/lRdWMsZpdO7UuErxucbdJM0QHsRh8RHYRNUfPI5S63G9mRa3I=@vger.kernel.org
X-Gm-Message-State: AFuF++kYT2Ir6HwweZ6bj6l+r9nVgdu1VpFdWMnOcRnwKmLLzvdq5eAv
	f1lrzwSQgaJyIkqCN5m3MtV5h1S63PYSXzEQh98sDTzYsc8+UUOl9OKN
X-Gm-Gg: AYBFou0cum6TS8TrZQ14KFRpFLu07LcIYPcaIVmeKJxnD9RQQ6IPH8Pnh/Ijy0JJ1fL
	dLzRZ6f6BmrlCz56LbupY+kcO4pZ0KX3REdpBw9no7MVdm9IS6T5tkWU6sHp3Y4q0usmsRFCV06
	JpYsuWtQ0m93qoydwSMcCnS/SincYUBLnpbEdr0UZ17LbASxMF3VMzTXJPvE6LQw+iHFeHwOog3
	zbL5kgIp0NtmRd18mAFc+jKoIgUoow+ao4LDTtJIxq++lUGs+65WYgD2XBYVDxLft4OKf8W5XO1
	IvJbrj4VtaryXOfRx5zaBec/+oavkYGSYSjLH5rdYdf7LLZOUYBLQE9P0MpMOkb/hGaO+e1iFbJ
	WCs5h6t+N2uxa+lP/gv9RZNj+GfeIioCY6TRLcUs3/TrFja00vUCuGDXJNI2ikJyCSn4+KoSxUq
	P7tX7NIILo5svccxWC6rs/M5tj+DDPTgAbJchkPzMuUpv+BveCadM+Du0W3SQKhhkktaT1lln4D
	4Ck9jR9RopZhhNVe4kS8IC9qutToNb6EwZ5oNt/uJAII5WlaZ5WWDxIScbmBBIbPS1RyICB
X-Received: by 2002:a05:6a20:9e4a:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd8c3f80bcmr3323009637.2.1789711415101;
        Thu, 17 Sep 2026 23:03:35 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:c192:a1de:25bb:2e0e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5bfbb4db4sm348985a12.8.2026.09.17.23.03.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 23:03:34 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Sunil Goutham <sgoutham@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] octeontx2-af: remove duplicate SCTP port flags
Date: Fri, 18 Sep 2026 11:33:19 +0530
Message-ID: <20260918060323.53860-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

proto_flags ORs BIT_ULL(NPC_SPORT_SCTP) and BIT_ULL(NPC_DPORT_SCTP)
are present twice. Both fields are already covered by the first pair, so the second
one has no effect.

Drop it. No functional change.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
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

