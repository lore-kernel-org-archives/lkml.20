Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208B4391E7C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761719; cv=none; b=BBwKPrq5xDIniPA1U7T678AtzpgpQ+XztCSBhPC2KMACLzPFPNujNrofaA+PWj8bIyhU6rp48Fl51v+96kMfnP3PJQdDZSlQeOSYRQHVpx4bRjfDfosL3DZWkqvZ27sHLAb6uVRv0pxMHPGNSEw+GDvF78GdYSszB3tbJNAo7FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761719; c=relaxed/simple;
	bh=O1v7h0Glt9tec5AHuLUy0WkK7jpV3Eob1sB7vRLAoEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IFiw7u76om4km82hHr9DHqPAUp+G3R57SnDgWpihCPPWLdiCj44VMfn1S7T3ouYdsNbdj7bSfVRJKXhjLjrGdMPo3AdqdKF5xj3hPU0b0Ug5EPyKjyXKY8TxcAgGA37YtSTN7nXKMXJZtESQ6VkHgrSv0W/KnuhQLrdd/5hWY9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUYpZcHY; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUYpZcHY"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2830001a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761716; x=1789366516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XBOjAJZv7VoWT7HeRN3N+zGKpkHHnMAZ/hXhWpBPzzM=;
        b=QUYpZcHYmP1XqpvAX9edhGvDmrzD9h7wd3wliWV6JL4nyNmPLzt2EeeFa/lMdIrFyp
         F4xAFw1LlQe89pnVhZxmAx341XTO/cdRgIQUR3kMNFx/gOq/l/4OyhGz2JEOCjIJY+Kn
         fe6FvCgWNq1haUwvcamBb4M1+i7ZqDbEaWV+qGh7/GYrWvt5eX7u/IG7vAhGSmdXAibS
         rVAdfmhz6DNE9Sv8FGTxyjddAas8qINRPPcGrZ97M7T3R1oYeDRjAbpYAXGmEZxK/DHM
         7c4fJoacPZ+m0rCch/0q9KLVoxHhO1uAg0GHj/1aMuKmw70NhR+nj4Xuy/oXfhM7v7Jt
         wxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761716; x=1789366516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBOjAJZv7VoWT7HeRN3N+zGKpkHHnMAZ/hXhWpBPzzM=;
        b=EcupTPI6Kdfo8IOuYT8ASoUewPhduLiGKl2bb5bzMG04UmNiiEWhqbWmnR/hjptoI/
         l6LCqFx8f061NXdyobRkeI02gfvdbeNsayn1JI8JW1dYzN3xKdE42snfXNugl/R+eiWX
         0DgiWO+Fs+9bIiUdZ8D1NirBmen3E91Ui+LhneVJvxiQoJ/1O2p+dCrZbDskh2y0mVYc
         69tWfBbS/LjsLVmJR/IoeWiMQPNR1tbig3IzF6WqFFVG+L3ew1CfQiRZWUh/CdXoxK5I
         s69qua8jZPmPyh23S81u3wfOUghb1Qy9KzXk88T/nX1xCC/uPyoGT6bVcVucRK+TZiEy
         ugvg==
X-Forwarded-Encrypted: i=1; AKwUvByVb9CTVTt9adf92t7XOf+rbxRpC5uFi6XTcgT1Ho9F3sw+vL8JhW+xEpFv0Wj23p0erIkjVkl1aQi/8uE=@vger.kernel.org
X-Gm-Message-State: AFuF++mAqAx+lgCg8wSFRKtvJSKnCfw2PSHIn62PNG/yAXoe87CRYOBn
	Yrzni3xVEnIr0qMj1a8WN8nrfjIyVoc18TipqvnI/oKWD1ctxEskWjea
X-Gm-Gg: AYBFou12fbAugpaziWba/LqfTX+3h7nsjplIpGYyrHxpsi2lZpqttx+NdpRBBuDDc8T
	EYRicqOPgwGwaC7tN/qNQUBzCgStEJr52cvFX+7amB5/kqXxOhnnLr5r4yuCCrS6Wk9uTudphm/
	akiG6HDT9Ioc1ZsRF2irbmVG9E1155y7nGNOo2Mc8NX7ZAou0E0fGU9eg1I7DBuvP5gU/oHHLNW
	M9DdwK6qFwYDq//JsJT3XllIJf+eJTNKNjNptZbcZqZwvA4HoqLA101/HoNyx7cMp3hlEX3LkTO
	f89PyjgBSpKNL9+RjOQkoKAGnC+mZyMb7343wTWDqhXKp8niIhF0NM+oEzNwmPfPatPtDSjhaS8
	jU4SdfaEGdNwM03+SW050bS0s6QztdxOw0goetMPSKnsFQoXH5fEECpqQxb4YLZaieQSiLzWlf+
	mqhq7BQJBP5oi5PpllM5OSuLVs4PiE1eZExuuqmp1aT6gmZoXgkuvOcQUgCR3mF92JZE8MqLKFb
	d3Iv7MGg9UMdg==
X-Received: by 2002:a05:6a21:3292:b0:3cb:b6b0:1b83 with SMTP id adf61e73a8af0-3da214199afmr26825240637.9.1788761716261;
        Sun, 06 Sep 2026 23:15:16 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm4657413c88.9.2026.09.06.23.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:15:15 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Paulo Alcantara <pc@manguebit.org>
Cc: netfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] netfs: fix repeated words in comments
Date: Mon,  7 Sep 2026 11:45:11 +0530
Message-ID: <20260907061511.35092-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/netfs/direct_write.c | 2 +-
 include/linux/netfs.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/direct_write.c b/fs/netfs/direct_write.c
index c16fbad286a1..634a860f3ebb 100644
--- a/fs/netfs/direct_write.c
+++ b/fs/netfs/direct_write.c
@@ -247,7 +247,7 @@ ssize_t netfs_unbuffered_write_iter_locked(struct kiocb *iocb, struct iov_iter *
 		/* If this is an async op and we're not using a bounce buffer,
 		 * we have to save the source buffer as the iterator is only
 		 * good until we return.  In such a case, extract an iterator
-		 * to represent as much of the the output buffer as we can
+		 * to represent as much of the output buffer as we can
 		 * manage.  Note that the extraction might not be able to
 		 * allocate a sufficiently large bvec array and may shorten the
 		 * request.
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index f837a501008c..fc6e76102642 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -627,7 +627,7 @@ static inline void netfs_write_zero_point(struct inode *inode,
  * @inode: The inode to access
  * @i_size: Where to return the local file size.
  * @remote_i_size: Where to return the size of the file on the server
- * @zero_point: Where to return the the point beyond which the server has no data
+ * @zero_point: Where to return the point beyond which the server has no data
  *
  * Read remote_i_size and zero_point safely without the potential for tearing
  * on 32-bit arches.
-- 
2.48.1

