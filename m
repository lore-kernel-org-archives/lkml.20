Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A4336729D
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789194382; cv=none; b=EHKPj6X1veIvpbL5XG8xPW0RMM14l+4zmGjYH+k1YQSINwRwwW4ZbAexAayqui3H6vVb4u69Ltf6Jw5+K0PBv7Id7rstaZ6kcBjV5mDcfyYiP1QLe+fXHs0hKxW7G7inTQQ3IIV5LKJEhLc2pRKB40APKyp+4dZhbBdUEh3MugQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789194382; c=relaxed/simple;
	bh=4+N7cdDhN3844Z1q8z+zFikbwV4LBr5lVJ1YjHeeoFs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g+B5lNAGYGfqCCuoj58Cb++V0GJDzISylL2vveEmc/FbZ0SUqtkgjdDYvA3b3Ea+EzBBU/OFXpZpXeMpUDk5STUQfzQ/TncfrJEVFLHbebbxZ+0glamCP5eMJd+4ESlKmaIbiIlapfbJlPTTjxEp5RrHASd1FO8erGyWsz1D9fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8tdQYhB; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8tdQYhB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so2168175e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789194379; x=1789799179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ztIntik1xeW8jWQz7bcwpnWQ4yK2/dDMrcPOzey+VHE=;
        b=f8tdQYhBBfOJUEvFAA3vjecV13jPgs2zZXXymqBFS034ofTkKRXXtNTOYbY2oQ6sdB
         SyRUgShgwBASRUeof1HO92zIXscqdaljlKsQ0ugfsvTUop1zlXDIrxx/bVloPiUySZvt
         anwf8ukJ7AFMETsoIRkext14/P8alAS3DKLZstvRjxPfAndFsBU/yoZQMvlXYgUqcFRn
         OFtTfkJP/aY2uFqPY+P0D+5Uo13rpIQmYy50OupNcxqs2Ir7HWVPnNMvwFGDv7E8UV3l
         OY+EGTaQSatgh/Vb66APo5+hXNYjstGX6Z2+Qy0wgHwAolSX9V4PLuSsarqFJj/HI2mh
         MrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789194379; x=1789799179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztIntik1xeW8jWQz7bcwpnWQ4yK2/dDMrcPOzey+VHE=;
        b=kZ330ImiJABGMZek9SN3UtPVBgN9feevE/EX77FfhvwzX6agBB+MNm7jAkNS7rc0dJ
         ZY5VGEnwUFis89IfNQLNKqPA71ZMGo7LhJE3dJxBClNuowNeydGnplgccEfu336DQa5K
         3ko4OJMbtbLZnItx7zQdYsQ4K53c7i4nbbmmpPbyg5j97jRmpsgwd4MuXk5FEDohpo4I
         O9aVvW4wyJh6Al9NrO8LAP3HSZSlyIP9Ynb6x9f+T1UfzndoLRDDyAe3g/uobnz/dYMs
         bQyD+4gj0cutbf3yEV+yJYZJSBchp7uIO0fsA4uly82+1w7XmmO0x7skLU5im0wN8dbx
         5img==
X-Forwarded-Encrypted: i=1; AKwUvBwnfpNRW8GdcxsCSwIWGvCjeeBZm2ceJpCO8r+7IOZs4aKJS8D6CUqv10ZNjVx/Hk8tVUDzSqNNRudB5TM=@vger.kernel.org
X-Gm-Message-State: AFuF++mA3mUz79cJEfQ9Po+dTchvbDbOZfdLP78V90N1gOjLZ7t/0HFf
	mbJmkXwLfv4niVfpkW2P9k6GYe1iI6miVkXetCU7NyLCUUZp0WbZfXhz
X-Gm-Gg: AYBFou2kiv2CNT5KOsd4lCCSRxWi9103SxH5fPFX0Rqom0osFwph7P2NvTEmKVq+5CN
	hWu8L41UUIx/zIue6bfvmx9f2jrcJfXuEjB8EVslx0eg7e3O1JPzwICkVVqUj2pQ7sFLC5RiQWY
	DBzfyABidyEFkCaCQJMEwep6BVrFfIFhyLWfsIzPdK0MRo+Q5MXzSNQt/8HLBbUwlUhnqi4SOVI
	ltQ6/WJshyzcmIlZNsMk/mh0gxsnyX1fd3tW1e5Z50FTPwwZIiu0M9ha3J8WcI6pTqCS27GLaNb
	SLHI5ryUSZMcwCMKB5mpSaUD8W3m5BRbt2vo5415mv0aczXxSVY31XV5dOL0MEU6cZGfQUKuqnE
	utKcuJeq4Pi4NQVgea4ZssaAxjLajMnztip9V5ZAyMuX/9gUGxrKyYWUzNLe6Z+U62hOnCykQwE
	RX/D5PvNfArNlEYao6ugjyux2AO1kjW6QupdukdhyF4f4fWRyMfYZOZNMDfailz+ntNeSyNAqVK
	zp2VU0Omqse/2daR05cW4TtyFANIShIOP2y+j/5/nqwD4MiLhcWhKcCYJfsjDQKNPQA9sfP7YXZ
	YvaFLyN1rPA2J7JEZ8EVYtFUM3+nppGes9F7wOxfvmIdEK73ZIbH8jNzvfm6iCeE057XI5eDIVX
	qzA==
X-Received: by 2002:a05:600c:190b:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49e6caa6f6bmr12779215e9.2.1789194379075;
        Fri, 11 Sep 2026 23:26:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaeefsm130212965e9.12.2026.09.11.23.26.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 23:26:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gfs2: Fix the return value in gfs2_get_link() kernel-doc
Date: Sat, 12 Sep 2026 08:26:14 +0200
Message-Id: <20260912062614.42899-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gfs2_get_link() returns the link target or an error pointer, but its
kernel-doc still describes an integer status. The mismatch dates back to
the change in its predecessor's follow_link calling convention.

Describe the returned pointer and error value.

Fixes: 680baacbca69 ("new ->follow_link() and ->put_link() calling conventions")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 fs/gfs2/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index f361876c5583353a1196ed35be1c95af33a90c02..d5e03ec89127254654dceaff56322ed617a3400a 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -1900,7 +1900,7 @@ static int gfs2_rename2(struct mnt_idmap *idmap, struct inode *odir,
  *
  * This can handle symlinks of any size.
  *
- * Returns: 0 on success or error code
+ * Returns: the link target on success, an ERR_PTR() on failure
  */
 
 static const char *gfs2_get_link(struct dentry *dentry,
-- 
2.39.5 (Apple Git-154)

