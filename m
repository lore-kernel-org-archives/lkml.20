Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793492575;
	b=vYch6ccDYUZSCYNqN2RUj6rvspNhbnmCl4uJ5HJoxcsFpM5JwbjZHibAFz7Uuq4TSUHF
	 pbLjKbjTmj9S5yQioS+WlgUaM0Q0fkxVETILmRqjGad5kBW/gyXWNR4xXRd04av8HyUe5
	 AyMimb34sBXgrvOStMUzxPyPHHes4blS+uHlLHvEPfYUn3qS4Q6VwSCQoRSEvEgLG+1PP
	 YvcrMCIgIVeu6YFa8349IsqV3PK4PNWM69M3YiEz6avU8aGAZhZOR/4BgL8e3p2l21IhX
	 F8/Lcwop1xfFcn3hBP2i8eT/zXXcSNHr1awsAX0Fnx50x91yalfVS/V1exKBtb+E+Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793492575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=iAN+RZ2zas5JcAoGByv9N9iIw6NxJqE3IMnDqczyNyA=;
	b=c1u3xI9DHNGpuY4vtgOInrg6+KGUduhfDmFhNtfjErRndUVDzpdRv2iwbUb0Rl1KHfmS
	 w/uDnGHtirEm4Y3MecexhadeR3CKPgkOA1KbJszrLBii48xCUFblnldWhop17+hBnsTW2
	 KkDR2FHUilAgVaN1MLOZo8R1aSVFMWQepF4ufZo4mdVaJ7YYV3ujFkmha19cPfyMz7xoV
	 yiGn0YB0krVrWi/m6qsfC/Q7ZUgdxb+k39rnphpahNRqZIvGR+6yvBd3yKHaC8y0K4IP0
	 +RDNbt3pMgtsrlzDBmJVSVUWgqLxvsnENvNO+R1t4o/wzwbDozdD+4fLNkjjmJmH+QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRDT07mR;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4816606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 00:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4816606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRDT07mR
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so11125655e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793492573; x=1794097373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iAN+RZ2zas5JcAoGByv9N9iIw6NxJqE3IMnDqczyNyA=;
        b=XRDT07mRCG9RNIpM5bctTBceffAp3019d+hei9C7tnKJpaNPPxD/qr6t6M+SxfpduJ
         rdywQZdXbPl7nkwiCaknejdW2ta/fJm05+r77hhCSqk4CSG6yShVVh4DVmXgm20rnJwQ
         PQ8u8/tyB2TbLxiUatPFJVWVk39LHs6t4F8g9nPiqrl1ILGS8PqiQXeuDH4jcRBhBB/Q
         x4+hwcnckUVse1dz71DaHql5Gs6smof4MF5w8h+lV/GgsIcvp+XU2+sl5Ji8pY18eIDl
         PffQu2Bh4A8S6WA0rVhbADrj7gGiSe3NNNZrrPTKJao1/xFo9oeyilC6xr/6NvLuqcJL
         vvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793492573; x=1794097373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAN+RZ2zas5JcAoGByv9N9iIw6NxJqE3IMnDqczyNyA=;
        b=KRXvNdOyGDvjmjSwvbPks8BS56OTjPJHCsOTZDuMQP6ggSc2TJblPh4TVS5ny4CbqU
         k4C37ZDoxw/Suw6VJMggvpmkH5kszY/wnQBBa2MquEeu0CDeoxoG9smgzB26BBAn4sJI
         qkC0v6a2m+b2n+7onH0HGlLpbotjK1jlx5Is47PgZM3I59PD6uj9KQUOc+C1ajPe9scn
         o81Cf4yYgykyqyS7MWwU8FQ0mRk4A1iIRSonKOD9jVvnT9h+19RGyBcTRdhJ35B/NTqU
         YHrUNLb1ScuAzWVx5I8XD+tZO2591yHBZxDfMOCsh0JC9xT1VqtYsqBMvov2f5+fJiGi
         neOg==
X-Gm-Message-State: AFq9FYIK7cCHm1QmwT2sGJNVyVhm+QFGgMwo8IOjjsyCqzbLUy1ZzL4V
	VxHtn+r6haQgfRJ+AXDfPCNjZ9wmMQjQPO60Jkfft9GsX1xfhQxcivRp
X-Gm-Gg: AYBFou2Pqgmpu/Y9EC70Ee8bvMgx83WVHp58J6NyUOOKaMDnx4yg5mu2v1e759nZisX
	YaX2ZtegnZrCl+8+e7Oqm3PVfn5637H6fdFEKSCPhN9tS8B+0Fn/mbtwut88hncHVn2J8ZdqvnF
	P8YbDCWsquwqRaFJ8RXOdn0alz2P/HpiDUU+icAo+VrPP59yoTQdaQfK20WVw15d+UkjB5QN++X
	9uO5jsM5zHiKT8T/5ouPvQTb/uaIJDdbzN7P8YsgoxcZLf0Np8hK/oFw3ikQOmEjdYd5F/nBglF
	C2UX4SwynOWg7qEolF4gLC6tpqgkyJqoNe7k+O2TA+UzwLXIxC2MmwUEAd3hnvVUTKQSwh95mud
	OLoa9le8abhpVJQB2LVvOkNAgtlPXT/X5hTdejiYWTi04rO82acn3/HdKWHe/47bGhiy3HO6y9Q
	vd9VLHtXxda/8GDWe+TD7zzJxjTG4H9krPpf5y4x2R64C+N/6dJOKECTuDwqe7rjmvFCfVnqFcO
	UBIbK2I6U5kXmX8nNe9O5gJvDSISwhiySywaaSrszkhPXZN6ELUFY8Uwp4Dd6D2w8kimTXFhAgj
	mJl72yVTHtHrb4yIcKWGIeWkx/eJaqDGTi78uqhH7iTYzw==
X-Received: by 2002:a05:600c:3b88:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4ac187a6ffcmr147069015e9.29.1793492573258;
        Sat, 31 Oct 2026 17:22:53 -0700 (PDT)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aab10sm159019305e9.9.2026.10.31.17.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 17:22:52 -0700 (PDT)
From: koraynilay <koray.fra@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [PATCH] ntfs3: set .getattr in ntfs_link_inode_operations
Date: Sun,  1 Nov 2026 01:22:24 +0100
Message-ID: <20261101002224.677245-1-koray.fra@gmail.com>
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

When running stat (or calling statx() with AT_SYMLINK_NOFOLLOW) on a
symlink, ntfs3 doesn't report btime, cluster size or any other file
attribute because it falls back to generic_fillattr() without populating
those fields.

Fix this by setting ntfs_link_inode_operations.getattr to
ntfs_getattr().

Fixes: 82cae269cfa9530 ("fs/ntfs3: Add initialization of super block")
Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
Thanks

 fs/ntfs3/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 8adbdf1a7d11..0cc46c184ac6 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -2316,6 +2316,7 @@ static const char *ntfs_get_link(struct dentry *de, struct inode *inode,
 const struct inode_operations ntfs_link_inode_operations = {
 	.get_link	= ntfs_get_link,
 	.setattr	= ntfs_setattr,
+	.getattr	= ntfs_getattr,
 	.listxattr	= ntfs_listxattr,
 	.fileattr_get	= ntfs_fileattr_get,
 	.fileattr_set	= ntfs_fileattr_set,

base-commit: ee1cb3443cff5a800948b662756f75b17ca63fe2
-- 
2.56.0

