Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758743F788F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790052255; cv=none; b=iXCpgEVsROHKyWJcAUaWaftOhMKOIGMcFgEQ9EUxpVtzYixJ/Vi7GLX8OtzbM7WvWqyXo3O7hFt5VkEgEOULukvhOgaQyEan8qDpC5ciK+Z67U75tpcbf44x+TPlbu/7AFPdQbaBNjTJiWZV5QOGwt33hRkzNAKFeVNQEt19ABw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790052255; c=relaxed/simple;
	bh=opW3UCyYmUGIh685jbNut0YC/KSIFOxVldRZxwjwqf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=POocv3/u4B72Zsm+1B7Qa4WJdfeH+/uOGwwKjsTH45lVDpPYtcthqhxfG/H3sCL8hr3gZpqO8pyAbPO8cFjmLGoFGnuU6X0/46/hzS0SPIIFqZle51el7HCZEAEqAZ3KB6maii01HK5QscXVczfgWSEczX3lwH73voc7Mz5ugi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCs/Gi5z; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCs/Gi5z"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-398cb5615deso4329732a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790052252; x=1790657052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nd2sNIwsDlUojlzUKsazShmKean8n/g0XREbYRxOeao=;
        b=JCs/Gi5zIsBW2gU4j05Wt5wOYcGAR3qiK9Dhk9x0TJzUujKDoX6uid4zemMzJYT1KI
         JVaTaqXNDpSDO64+8TR8aazTJ3ijcRnfpuiVKuq4dhQclUG2N26UwL7mqYPt0IXYocFw
         fL9BB/0jfojTT55ff5tN1SpzFfY0dN17C5Pxg1Q9Sz+S4HFIL7zS/Lm39m0h+mGiXf+8
         QUC3NXFtAfdkkLDwBk5Ukkyt6zvQe2YZlkmomcEguYWs0J7l3/x9Oe3GQdKLS0+h8Iag
         PZLYe07wQGdWj5Yt421+meDNZMtLcfr598QT+w+ZQQzA40i6SqyLpf8k+9O78MAjsXCR
         vNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790052252; x=1790657052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nd2sNIwsDlUojlzUKsazShmKean8n/g0XREbYRxOeao=;
        b=m05aOU2RRemRXPWoqwOQ7bKr1mO7wEHstClOnYCkcu/meyK5xfKLLH8XjRUBU+kPOX
         OBsGjO3DPkubgjXIMHEHZ4HGYmtrZTWvpCEbYJp9XDAdmB3fXb9dcz1LtiL5dftF4vHO
         UEvw7KdJMq6ew9V2w33OeKtf3H0rE8PRfhNkJfgfEfJqjox2DAed/cP5h2CUwqwKOBI+
         AS6X6yDYHIB1YzubtH3IYZFz7/bQo2gHmqf7nBw30ZYeGd48GAzZxBt6KYbal/N3BAdP
         bABfbSx5Jgd0rSLAndCIp6RnqWPtXmEiHYAn1qpsGsKosAEwCOZv0ytOnz2VsNWtOLkg
         z2yQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9CRd4Dp9YGPxfIuebaQWcBUVI1g8aeEMZypKixB1NWmO2XGfDoHwbzuY8Ft+McWhjOleques3R0GorQQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kVFWByo7SlUPPdt0+AVKOfyYYrHyimTOsPdRoiSd0DfczutyQa
	RDneY313jqwwmB+nFV+8KDpHYxjOq1MvDzl2l540mjEx6xcSc6rb/VsA
X-Gm-Gg: AYBFou2Ds/ZKNA4Xq+llBUA/rKy8sjxrbOMvQZMB2WY+Py8ab3hi3B2sYIlmwCqyl/B
	lcWx1XdJPajP/xsMSCEgYyPiqs9k/p7zpc6isMMq35PJcHkXwUUezPwhCre92Xl3l7bLYQFt6ln
	X9xVdrgCIxNiFy6ei/XRLKRDM6N+3SMmKiu46GQ/vK07vHR9k0s3Ms8hN1TUbHsQpq+lrJs65p2
	xF1aftxVDKF2TDYIilkhMWeQgIAeoJTEWsCTUO+IR1/M0ZhNjjFSrPjBtJTLaFrUilVDVDkY57/
	A5dvF5gJyrCz6BNCsR5mdn+SVWVd1KaA3ZL4anrJ1Q2QscuUB3etjdfu8OmL34/XedsYeqG6C+R
	nurONB7FWk+yUGtvPWyjjsMogZM35TpUj94XzQbFOa/DJBaTmgRDsHgYXvJzOZYztD4ICIBLim9
	lIgck8bVoRLxJI6/K6lwqzYEhKA+RPFa5V2uPv9BqVpIbgtP2oY+KV66FrYkoAzk6hIGSFp8uOc
	cayVD5kW3Df0/xC4s0lHPSd6QEiCJy2BeuMZaJSJowQyRRc7GS/RUGVcCUi9WDR2JcIkkVhcg==
X-Received: by 2002:a17:90b:580c:b0:39e:4c81:6c96 with SMTP id 98e67ed59e1d1-39e54f8a187mr19084529a91.28.1790052252288;
        Mon, 21 Sep 2026 21:44:12 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:6cb2:ad3:ad92:1570])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e5751f2sm943802a91.9.2026.09.21.21.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 21:44:11 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: code@tyhicks.com
Cc: blum@kernel.org,
	chenyichong@uniontech.com,
	a.velichayshiy@ispras.ru,
	kees@kernel.org,
	liubaolin@kylinos.cn,
	eilaimemedsnaimel@gmail.com,
	ebiggers@kernel.org,
	roberto.sassu@polito.it,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+e4391e0d6e7c89b8c84e@syzkaller.appspotmail.com
Subject: [PATCH] ecryptfs: validate auth_tok key payload size before use
Date: Tue, 22 Sep 2026 10:14:00 +0530
Message-ID: <20260922044400.14078-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ecryptfs_verify_auth_tok_from_key() casts a "user" type key's raw
payload directly to struct ecryptfs_auth_tok without checking that
the key actually holds enough data to back that struct. Since a
user-type key's payload length is fully attacker-controlled via
add_key(2), an undersized key whose description matches
global_default_fnek_sig lets later code (e.g.
ecryptfs_write_tag_70_packet()) read fields such as
session_key_encryption_key/session_key_encryption_key_bytes past the
end of the actual allocation, causing a slab-out-of-bounds read.

Reject the key up front if its datalen is smaller than
sizeof(struct ecryptfs_auth_tok).

Fixes: 0e1fc5ef470cc ("eCryptfs: verify authentication tokens before their use")
Reported-by: syzbot+e4391e0d6e7c89b8c84e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e4391e0d6e7c89b8c84e
Tested-by: syzbot+e4391e0d6e7c89b8c84e@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 fs/ecryptfs/keystore.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 51651314b7a6..81768a0e43b1 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -462,6 +461,14 @@ ecryptfs_verify_auth_tok_from_key(struct key *auth_tok_key,
 		goto out;
 	}
 
+	if (auth_tok_key->datalen < sizeof(struct ecryptfs_auth_tok)) {
+		printk(KERN_ERR "Auth tok key payload too small (have %d bytes; need %zu)\n",
+		       auth_tok_key->datalen, sizeof(struct ecryptfs_auth_tok));
+		rc = -EINVAL;
+		*auth_tok = NULL;
+		goto out;
+	}
+
 	if (ecryptfs_verify_version((*auth_tok)->version)) {
 		printk(KERN_ERR "Data structure version mismatch. Userspace "
 		       "tools must match eCryptfs kernel module with major "
-- 
2.43.0

