Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A372B3939C1
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792281458; cv=none; b=lA3/0mCXBwajeaZwi17smpTc4xbqi1Ucq/7ZB37mGzFh6Su9kl9rtaXd2H8WOl6GBOTYTLecxoJEznQoA2246yUD84HO8pZz8Nq8O4RodJr6WDFlnVlDpvRlOAVdKtguLkRuiHuboenR0Sipx4ahrJxxOJ5lffewjLkeZgd3mmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792281458; c=relaxed/simple;
	bh=o2NBSx/FDXqBMksdU/mUlTzX6/bzw8/craKKvdkqRIE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DEjX1qCzF2p9YcjU9EocCtBJFPxd/Mvlc4INPiOjKdnKyCsrxeuHirmt6fupD8939IGsi6SaAcuvDfVzniIc+zXW1VS4sNy1RZdGWOmjcbX2AUrOV9RpNGsGox1bnhnEcDg6JipoMGmsXVk43uG7mRzLlQwyQMgmpHqQgtTlyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlxL2WOB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlxL2WOB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso7317485e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792281456; x=1792886256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pex06CPzZvFqO9bOYfRUEtlWF/y2fI6jKIVDllT5g/E=;
        b=rlxL2WOBGgULzrCQFYBLIJu6zGUt4XvNu7tqg4nVHKJavNpjogHk/KWGnUX3oDMdqj
         FYbgVMcLwPH+qPkgl0Fs48NALE7r01XFFyZWGgBT5UKMNGdKnltzW1s4GvaJhh8z7IWK
         VFg8Ni1QVWm5B+Zcj3x5IpLy/jDMtXQnKCTFufAYZ8jlDGB9emnLdJYsOgzeO04QKtR5
         mtUp9lq6GJbFdug2Qj+13OQJMOlrtYscNo7xCbIL7pCT/RnSoB2SVBPaqmXDRzqm8Z1O
         KbpF4MV9g8R4ynJNBnZJkz/hz8rbBCkuJFLAZE3D02YuI2hzQQlJ7W80KdDDml10kR2f
         lQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792281456; x=1792886256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pex06CPzZvFqO9bOYfRUEtlWF/y2fI6jKIVDllT5g/E=;
        b=Nrbfo0HImav0K01alE1eltUmQI67LUWaqcJwb3cSzqIKnLhmdoSDGYnnfuplpDkbxN
         iUqELmEz6OeFOYOzbSZSDztqadhFFkApCYQI3WZhKItqtAV58OzFH4egGlLua5hgsUcn
         ZRxgzHmgxQmMgYpk7FvLKNlZdtpqHbuKqNT0NyPEyllOISKpiWluxKShh8CkrgcAoglv
         olA4L24QsV5xu8eQIqvTCKJw28Ckb7SKstzjbTqoOHO99KCUsFI+I5VPx9iCDzc+abaC
         OlzDG9/vf0yQvGtOwVQG4wqN62eDvaebHqcOb/OpsFY85IUgj5m185e/xZ763wHmbdar
         T6PQ==
X-Forwarded-Encrypted: i=1; AKwUvByRWYCYQmWS3KTkiywA0Tp5gBbdoNKfV6+M1F/iqYoYRk58kOU3Y4JwrLVqPedv2rydE1V4LcAa4MNlGDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYImU12O5gwiuSYmZYG3pG+CQGs8BPy1etknB3I/duKLU/hF3D8I
	QWrjkQSDyOMYncprCq67I347OFsaSOfqGdcQIARk3H4ipGP+tDTx3lk8
X-Gm-Gg: AYBFou2v2p2BfWIthiiOl8rxeTMCmvfjjXJ1rfSwyf2CY33hXs6IxW8+BsERpLiM7Gd
	QEl3mpQALbbqBCv0pnoEr8uycdxCB2WMHJcTAcB9o6AQuFXZ5bgc+0onhvQhQvVF80lqFH9kKpE
	y4B547gUKy7k8FqsbMbFSAvXubVObHU2lbvRmYPcNWhtyVj+77RHGeUNnbJoKSnK5mEpO2FKU14
	X1E+Kl9XX2X8Vh04D4nmGy1bg9maQkl90pR7aq4h/r4GhedfIDCKypQEmvibIbCl/QvjiJuJwfP
	5cs3YqO0rsjNACsnqEtQXMC/9MS3CaHTv/7dyaGh4a5a3TdS2JX/4BvQCVUFB8gqzKDnWJilOxe
	NJ86HA+UGm+Y5fJ46V0vqbO4qyIaDKenRfYbQlfaxT2C2Lh5gVlSIWWNtoP97dQ+w7JhCG9KaJK
	SQvb3ImsmNU3nHXd3ERF5JWrEED1dF3ekmN7bdzDwEhG2lE2lCsRTURvB9YU/Lc7w/5Z0PVUCvP
	NtqP56RQt2Ieau/QBYz2MDDuXWP3uFZrcoYs0+UCAjMVFfsOqsrXCr9fhjmShqQ4JGE
X-Received: by 2002:a05:600c:8219:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a1d76031bfmr80634935e9.20.1792281455606;
        Sat, 17 Oct 2026 16:57:35 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf05009csm139331075e9.10.2026.10.17.16.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 16:57:35 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: joern@lazybastard.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	stable@vger.kernel.org,
	syzbot+c9d8bc9f8ccc03799e1f@syzkaller.appspotmail.com
Subject: [PATCH] mtd: phram: fix name leak when phram_setup() fails
Date: Sun, 18 Oct 2026 00:57:33 +0100
Message-Id: <20261017235733.14667-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

parse_err() is a macro that prints the message and then does "return 1".
phram_setup() still uses it after parse_name() has allocated the device
name, with a "goto error" right after each call. That goto is never
reached, so the kfree(name) under the error label never runs and the
name leaks every time one of these checks fails.

syzbot hit this by writing "p0,0x8000000000000000,0" to
/sys/module/phram/parameters/phram. The zero length fails the
erasesize/len check and the "p0" string is leaked.

Use pr_err() for these five messages so we really jump to the error
label and free the name. This also means the real error code goes back
to the caller instead of 1, which sysfs returned to userspace as if one
byte had been written.

Fixes: 49c64df88057 ("mtd: phram: fix a double free issue in error path")
Cc: stable@vger.kernel.org
Reported-by: syzbot+c9d8bc9f8ccc03799e1f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c9d8bc9f8ccc03799e1f
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 drivers/mtd/devices/phram.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index b42cadcd76b1..7aed57b31967 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -289,34 +289,34 @@ static int phram_setup(const char *val)
 
 	ret = parse_num64(&start, token[1]);
 	if (ret) {
-		parse_err("illegal start address\n");
+		pr_err("illegal start address\n");
 		goto error;
 	}
 
 	ret = parse_num64(&len, token[2]);
 	if (ret) {
-		parse_err("illegal device length\n");
+		pr_err("illegal device length\n");
 		goto error;
 	}
 
 	if (token[3]) {
 		ret = parse_num64(&erasesize, token[3]);
 		if (ret) {
-			parse_err("illegal erasesize\n");
+			pr_err("illegal erasesize\n");
 			goto error;
 		}
 	}
 
 	if (len == 0 || erasesize == 0 || erasesize > len
 	    || erasesize > UINT_MAX) {
-		parse_err("illegal erasesize or len\n");
+		pr_err("illegal erasesize or len\n");
 		ret = -EINVAL;
 		goto error;
 	}
 
 	div_u64_rem(len, (uint32_t)erasesize, &rem);
 	if (rem) {
-		parse_err("len is not multiple of erasesize\n");
+		pr_err("len is not multiple of erasesize\n");
 		ret = -EINVAL;
 		goto error;
 	}
-- 
2.34.1

