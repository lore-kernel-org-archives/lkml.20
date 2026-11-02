Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631713;
	b=tLEt9UgMYwWoh0sgIxWwgFXCj4ytee78IhVN2rp7/L42YRcbb9KH2Bjf9RcTP09fPjYV
	 iyUzRhXic9FRyBi9teZjboTJLFjJlPKIgvlSHirt5MxiJDEIA3BxLr3y0Om9pZElPfhwC
	 yRluf03oeenMlTa3h+M0GHb8byk65rEzHvv4xXCjYC7p7dzY8rNu7JJZp/CtLeFsqgZXH
	 bKmso2EnYfLNrTCuWhOWExVezUMQKCVgs3eYOnN4rGxm4wHocUASafr9NZ6ATT6gKfmva
	 DDYjWdII/B7n3ePw+jTghdNJIPQOToLbzRnFIyn0RVSq8slIoa9SorwY/GKGDS+YaRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8l44OpvREKctVeUFVW4vf198xHBq2jFaQ6cO5qom3KM=;
	b=ISDb+XeGyTwhj+46lo+C3J+ANsy7QqShPuSIKveufe2aci94X3o/idmNFKPla2Kn6nn1
	 mTqranGu4KlkvBjrbD9P8fKuv9OMLOv6zjvWeTvcud67Z8ViQ3tD9sCVjr65LC3YxYBRe
	 +loAH8ubhhjn+nJ+fS8N3S2rsofqhaKBX/p6rDH+u/1+RDWAGNH3W+EYh2su483nnUvWN
	 69M2d/6hznfbioynflSbUgoUypAM4/sct8qr0Wn2aZDbNOsC7kPNnRsRukEOQjhDV/ZEX
	 hgm/MYnS2jqdF7MCmfkx7XwHEpGPMvtgL/U7VMpVRAcPPKe1mSjoVlpBf1n4LmS0Ydg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nrOjI/IQ";
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0AC60A2630
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E0AC60A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nrOjI/IQ
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2e538951d07so30769945ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631712; x=1794236512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8l44OpvREKctVeUFVW4vf198xHBq2jFaQ6cO5qom3KM=;
        b=nrOjI/IQ8vLRDHe1WeG4/2R824pmXUtn3ORubIMGUAv81K4aIF1ybSqn14Yc88zYEO
         kzdxo9I33lORrsimuUAV8Js5ZTDmPmNBpgdeiAzbjjfvgv6Umfx87NRldYWwfIYgPOnW
         eBR/eJzTfFC1Pyuevj10xoTjKy+DLDs7MYk5Zj8B34Vn2MZtWyFLOsnk2P3VnpdxTW7F
         ChAKJxH3MxP3TA897ZAKLOBwCdYMscH85vQyOG6LUwmhKHRwrb2s93oyCge7zqiBwQFc
         /Dw0N5WOr31coa832+VDR0xDGpUv9aCbhXNQoe10iWxMOLG8FPtXYcZPQ5G/P2XHITGy
         w0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631712; x=1794236512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8l44OpvREKctVeUFVW4vf198xHBq2jFaQ6cO5qom3KM=;
        b=ZE8DqzRgbh5jAVk4Tlve1aNaH/iaQ6maA54LNrAhg/kv3p+5cSo3MuRIlCI0i1Z3s9
         Nd+i6WeP1ESGcyFTQmvHHXjlN7IsGHfhyhTszUYsz8vmniYBTkf1Iyif/sik6+2+g2hR
         keAOJg5MCb/kuNnnbHB8HIQvEQjkMUaJztq4pIAagKmKR7TvTENYXcelucnfSc+HdE1+
         riwEeFymdteCbgI/9cVTqUfM4WfausC+J4+i8lYjYbpt1cvKgr8NkyqHZjAn5Wx350rf
         lhnqOUCjtEVIO5dZMr+ohhx04JiP+ltvmEs07Dq0m62qo7ffgE26RDjbL+oww1cdPpat
         UA3A==
X-Gm-Message-State: APuU4Z+Hlc7n8wfz0wqs5An8gAXX0jgv1U0NbcjjlpC6VySv67ULJA2E
	pMnQrkIDpyt6BERwNnnfZUA3xBIQI+p4EkmdXC9bxB6RA3/B8CfVB9yMBGRCh8ek81g=
X-Gm-Gg: AYBFou0+IHJ7Jp65Kpt8RPbtW3RwrM8TZfXGOm55n6pvdllRwiGuNuvlfF5eIJd3Sch
	DVTv+si428gJosrpTCUujmAexoSsTap8JMx8Ykj98/KjTb/InpFUt+fpobiWKG0O7upTQ3g9wQA
	u7dzpgZ3AaozVsN5PTNppfmHGGFEu/Sa/DjBCsLyfmltwFrCSd+kBUsCU+/vuRC3xAN/8HWZ8h5
	smhiOS21mqqa28jnA0rk5EPU0oT0I00TZYyZX0ZG+YL1T0taW+D78dE1dnRmkKnc6VLSEkKGq5Q
	kg8Wz7kGk9JzWvd36FhiS6kqCeF5ZmGJTDk3sy7QMNcwhsIpknmg2blKmnDi6cOleUxiHtR+Tz2
	Tu+bSfevlVkH/PnXBfxldqmDPTbjq0U45jll4RIx49zGH4r3FxtOwKf9JlKPme3pShULQHc6NFm
	6z7aAbkunXCshGPitRFcUMbE7Xd60JwY25gPTV4WYvE2NQvj5JLbEfm+iF8tC44UBxXjwDCXwFW
	at7QogUf3xBUo+4mvgxwRYu7kRRla+MHwvPEKFHrbC4exo1vCyylfuPgwqQwoaRE23nTCrrVqNr
	z93DQT7YBTny84MY6ZQCmEb74dMhpJgxyfbxPGSiIvlQE5vDT/mCbPWUxBqlzv3XFCYMSyziNqn
	toGFQqyF9YEZ8k3eGfSQvS2EXpjiZ3RoIBkLUsohmU+xT0LH2cMq/gI0OCyN3qA==
X-Received: by 2002:a17:903:1a0f:b0:2e9:6788:9369 with SMTP id d9443c01a7336-2eb364cbac0mr99822395ad.34.1793631712330;
        Mon, 02 Nov 2026 07:01:52 -0800 (PST)
Received: from localhost (ec2-95-40-37-200.ap-east-1.compute.amazonaws.com. [95.40.37.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052bb1sm31540395ad.1.2026.11.02.07.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:01:51 -0800 (PST)
From: jianyungao89@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Jianyun Gao <jianyungao89@gmail.com>,
	stable@vger.kernel.org,
	Carlos Maiolino <cem@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Viktor Malik <vmalik@redhat.com>,
	Yuzuki Ishiyama <ishiyama@hpc.is.uec.ac.jp>,
	"Bill O'Donnell" <billodo@sgi.com>,
	David Chinner <david@fromorbit.com>,
	Lachlan McIlroy <lachlan@sgi.com>,
	linux-xfs@vger.kernel.org (open list:XFS FILESYSTEM)
Subject: [PATCH] xfs: fix temporary cursor leak in btree shift corruption paths
Date: Mon,  2 Nov 2026 23:01:41 +0800
Message-Id: <20261102150146.19777-1-jianyungao89@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: Jianyun Gao <jianyungao89@gmail.com>

In xfs_btree_lshift and xfs_btree_rshift, when XFS_IS_CORRUPT detects
an invalid firstrec/lastrec result after xfs_btree_dup_cursor has
successfully allocated a temporary cursor, the error path jumps to
error0 which returns without freeing tcur.  This leaks the cursor
memory, the xfs_group reference, and the per-level buffer references
held by the duplicated cursor.  Jump to error1 instead, which calls
xfs_btree_del_cursor(tcur, XFS_BTREE_ERROR) to properly release all
resources.

Cc: stable@vger.kernel.org
Fixes: 9eaead51bed95 ("[XFS] implement generic xfs_btree_rshift")
Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
---
 fs/xfs/libxfs/xfs_btree.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_btree.c b/fs/xfs/libxfs/xfs_btree.c
index 7effebe297ea..d706f59b0301 100644
--- a/fs/xfs/libxfs/xfs_btree.c
+++ b/fs/xfs/libxfs/xfs_btree.c
@@ -2567,7 +2567,7 @@ xfs_btree_lshift(
 		if (XFS_IS_CORRUPT(tcur->bc_mp, i != 1)) {
 			xfs_btree_mark_sick(cur);
 			error = -EFSCORRUPTED;
-			goto error0;
+			goto error1;
 		}
 
 		error = xfs_btree_decrement(tcur, level, &i);
@@ -2737,7 +2737,7 @@ xfs_btree_rshift(
 	if (XFS_IS_CORRUPT(tcur->bc_mp, i != 1)) {
 		xfs_btree_mark_sick(cur);
 		error = -EFSCORRUPTED;
-		goto error0;
+		goto error1;
 	}
 
 	error = xfs_btree_increment(tcur, level, &i);
-- 
2.34.1

