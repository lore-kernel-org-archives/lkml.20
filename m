Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406536;
	b=Zoy24GCQjP2rdj3FEWtIlWpiJTiUr08Kx6U2bkfEQNzzrOxTOzvtBSFI2ymMvhnBd77i
	 dGQf1EQbSkK2x4Qx5Eu2iXSIrdYaC27mmu0sL3ws1n6mpGDb6V8Bj7DPfVeII5hoSBaqj
	 sjdyxQICLf3hE9wOEUEoM9Z5sPCD92lyRDp/MPtGBz0J2+EujJeVDmGhXQxMYHyH79aNN
	 FJsPTVmXDjc+9wxRXFlz+B8oz2ziwbVUaJyEJdX5C7WFaUDpnkzHNsZ5DN/Y1GRJbRqbh
	 tJaJqoLVGiqq/bKqchdwJUYvfatXngmmar5LWDc1/Jxcmf0LnSY4mb3GyiUXq1/YXug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hD0FvPuK89Nc4itApZkfNbLnC4rRCi60V7hm0Ulu9Xw=;
	b=IwZRAJoJrs4WuN8ACaogyXkB4WVQC1PYT88iJBxK987VMS2o5MLVBE67XDEZcrbbaTD7
	 UZAO0vNa9//sqU/kIxk122Xx6oyJbPcuCzQz73lPZo/6ZzQVj6/QQAWOPS6ZaYo8pu8Y9
	 HxYvuiaxAKY0I/3ji7BvsP6Nc//8tRzK1N30UMEXLFLdotiJIesfAVOSaPfZ151rAYurz
	 o32BeE/IYC8qJetLZ5Bmn0CoHL2WYkz/B87isiHoqhNmxX5Sul7yUq/Eh0caqknla0C4c
	 g+ANbHH8Dq0QrzAuiD0xNFCFwyWhp3IdQ2c/uw7UbcmeWqmY+kMmwe16c6owBHPzV3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y29IlMV4;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7A4606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C7A4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y29IlMV4
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so3346576eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794406535; x=1795011335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hD0FvPuK89Nc4itApZkfNbLnC4rRCi60V7hm0Ulu9Xw=;
        b=y29IlMV4wz99+WxEnDbeBqvaKdg7+HUqKSijux/YeRToxi12Uvw5UpzDHKVQbBoIC0
         07DbW8wKZI0/g9tgM+2rsUzar5wQgE3vfDJHqsznUgmRqfNIaYqztSccoyabAoSTbbf1
         9PA9GZg+XIDM9hyy2QlQYdVktZFLjUBJXASmh5uY2CIRPvyC3nSW8idtWSGv/I/tziHk
         p5ZhQw59ln5RHyxkQX6v6msEZxDBy0BvGUUrb8ik9dldJ5tUhbh6XWHUNtU1sQSc9waa
         Z6dVUQ2rMh3BxBpTS+Ps3OhOHhywtgg8pqk/8kzYnYTL6Jbi776coZFFcwYTEWgS77zM
         3BfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406535; x=1795011335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hD0FvPuK89Nc4itApZkfNbLnC4rRCi60V7hm0Ulu9Xw=;
        b=nubJ/xP4z2hqMR7vt6lvIza8JdOfa48VBV+vOf9SNWxJROFkUHUhCFLdU5oX8sGhTf
         k35d0AjO4ijgRrX3GkaNg1ufIURe4nz2Pw2RudYFw2zcG04Q21bvZU1F9yJzqInFHgst
         ruwBJj1fXiaCfyL1SKHUkL1g/JaZb28KeIfbE7gIzTziUX57kLSKbQXfLzow011M2eJt
         My/BA6o7V/jBYAa9btriWtAIXq9D4GNxYTD43R0OIcmwaHxPUQfR/py/ku/7cDUyqBqh
         k9muEWyio4sO2pKK1i3T8DBeuKi2bBbN91fNBSa3IoBBB1Jpej6zMuqSeIKkeHMoAGho
         R7wA==
X-Forwarded-Encrypted: i=1; AL+hErFlFnIR5v2GxnbcgPkL3nfHvybvfuqJQlQ1AXbFgXJQOnofuSRvR+5F4p6sCyM8DIQuIRciJaN7IYnE8SE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MJPpZNy3K7YyR1rowm1AdKRRljKkflzdNaB1TJV8XK+/wvZru
	/Nb7CTZWYmbhs9jEYx5wbn+/ewtd4TIlqk9KnYF3TVJ4dZrbLVEvLycTxwiPqphJ
X-Gm-Gg: AYBFou3uZn6gXetgmlk7LeXZ7iU6i3tNaeqIISnpL1gD23lrZBkEDixD46qYx0XkKX1
	k8eNQB7+NU+vv9MX38cFUm5CHCoZQb0mtibiEf12LqnDIGHXZBRfMrIp1eRJNOH0cXYnA2jo0gQ
	hPEV2k28iz2qK0KBe6RAoWpzmQ1/ZsWVi7H/y8rTdQrQN00L+rOTCvZ7v0eoGq6SkGT5ao/AQZe
	D/bb/LP07yeBfU3ugbQ1J9lREJtk6C4odUU+iBncjaubTgqTS4s3n+MiiG6ulLC/xTrbCNP1ZHe
	4vEaVPNzwCeVsbxC4wFYGjBOF7IJfRjMXDbxtAEUZ1pEPyoDOCf8J+xIjQJRkDzZ7j0GebTFAWa
	9yNp53i9V1GLwGm0GL1D4JywC2kP3T80qhpkFYsDnlEJjZOun9vcKzoT6oLNhK7vtHaXlaDLBaW
	YqbcIO7cQh910x8j3yIEulRdp+YsMI+EdMe+p5q4R0wk802LdHip1q/IB8DTcKyc3IYmc/6pIuG
	jCdfkh6jOkW5no5hJXCl1juh/Uylb+lTPfqdvkW+rAGY4+c+Jh+N+TCMR6k6LkCbvCo8/CC2MrZ
	rW+DOmOSkMJCqc3+ZWBUbh2Hw40Zepa/fKmqFsyP6MY8pQ==
X-Received: by 2002:a05:7300:cc82:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-37686a4a762mr3171035eec.41.1794406535092;
        Wed, 11 Nov 2026 06:15:35 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm32700233eec.29.2026.11.11.06.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:15:34 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: xiang@kernel.org
Cc: chao@kernel.org,
	zbestahu@gmail.com,
	jefflexu@163.com,
	dhavale@google.com,
	hongbohbli@tencent.com,
	guochunhai@vivo.com,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH] erofs: reset buf->off in erofs_init_metabuf()
Date: Wed, 11 Nov 2026 22:15:29 +0800
Message-ID: <20261111141529.719166-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

erofs_init_metabuf() sets buf->off only for the block device and keeps
the old value when it switches to the metabox or the managed cache.
erofs_bread() adds buf->off to every offset, so the result depends on
how the buffer was last initialized.

getxattr and listxattr init the same buffer twice, for the inline and
the shared xattrs, with in_metabox taken from different places.  On a
block device mount with fsoffset=, if the inode is outside the metabox
and COMPAT_SHARED_EA_IN_METABOX is set, the shared xattrs are read at
their metabox offset plus fsoffset.  The same image mounted file-backed
returns the right values.

Reset buf->off on every init.

Fixes: 414091322c63 ("erofs: implement metadata compression")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Tested with a hand-edited image, as mkfs.erofs does not produce this
layout.
---
 fs/erofs/data.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 968303afd620..da4f3e7bd443 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -60,6 +60,7 @@ int erofs_init_metabuf(struct erofs_buf *buf, struct super_block *sb,
 	struct erofs_sb_info *sbi = EROFS_SB(sb);
 
 	buf->mc = false;
+	buf->off = 0;
 	if (in_metabox) {
 		if (unlikely(!sbi->metabox_inode))
 			return -EFSCORRUPTED;

base-commit: 7c26dc33ea7bb677db294bfb4e58d4207477c9e3
-- 
2.43.0

