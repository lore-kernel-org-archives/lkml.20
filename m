Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7232AF1D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788137493; cv=none; b=AyxKKy29i+727+8PL+uYuRJQZH2fLrnOemf6LYx+L/CuoQ2oohcIUasZt/LAsrJnfnvYlJFxjtTzmNn9glB+aD7dZVSODnQMFNunHfh/QJv7x+ekNIKB1XQOKDnMkFTcKSHlDZI6E3lRkZhQDmkMg7G5tmdORyPprl0lXdNwRjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788137493; c=relaxed/simple;
	bh=oHEVBF03cPJoQ3jlK+PeO9ih9pb+31Aq8qjS2efB/rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rX5k4ZPRLf2MlbG1g4DPHYokBf6646Tjzh1LfTYS18EiRuX9+gXp64tlR5ug/jOKU2Ii9YbiZ1GFzQ+uTZfm7vg1wwII6LcNzYf/DHN52hRhp3TIMIpUHmc+49xp5AeFqWFlVHwpOS/K7JUIDgjryG3+doTYmb1ttOCgeslyv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=idkmanager.com; spf=pass smtp.mailfrom=idkmanager.com; dkim=pass (2048-bit key) header.d=idkmanager.com header.i=@idkmanager.com header.b=xsJ3fNMn; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=idkmanager.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=idkmanager.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=idkmanager.com header.i=@idkmanager.com header.b="xsJ3fNMn"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97ea7f0d417so152816241.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=idkmanager.com; s=google; t=1788137490; x=1788742290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ba4TYNQwJkIIEP9Ptfm6U3S+ptJAfpuHjbRlL4XIV28=;
        b=xsJ3fNMn95rq6uxQJEkLB3VQK/FiWc9IQJJLxpMNC94K/6lbNw0rl6IMSY29BOB9Qr
         lJyJkQqlOBmABadkKbmvGhuF4LGdfBhVttAGrM+hDh46VzVve5/JY0jFHgOSnhV9Q1qx
         FD8I1R4oJH7wA23ZQZRjdSu8RaF/iNJ6rtbFO2vLYt4eDu3R+he1qRHJiTdeJwqjHOOm
         ZXnU4nEcGbtoGmen13xtPvvStRgnaP4Nu8311E3xGajzPXLSqcbmN6PREis0ctuMsfqZ
         BsRe9PoxuHtRrLOlu+sVzOV71ea/ma81SxGFQ8j8uYmNajryta9jASK4Umczi+jS0x55
         OVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788137490; x=1788742290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ba4TYNQwJkIIEP9Ptfm6U3S+ptJAfpuHjbRlL4XIV28=;
        b=kz16o8qdDkIBZcgiZRjGovry5ff8pl2R/SbBut7I5W3g8QTlrzGC6PGS4X7BeLVjEg
         fiF0bDwy2xpiQh06zKM1vJJ/Px2QyAtOXDN6L01TQrmYNXnQlZJgYC8sqMRZAQgRj2yQ
         Wnt2Jueblbf7HSG7MyfpJeplK/1hORP+7pVQY4fTMb9EKocKMywINo/2Sa1zcBwtZrq9
         vlxMElmoYdHrIsTZwGh6rubJpdWwVgr1kTIWbD9BkzpP8YBNak9un72C2vNO8XW+4+L8
         ySxeH4flk+4Cwhap+2xrjJMB8qNNuiPFlSgX1LOh0t4sl1drXwQ8Q2i/8nr4qOzOl8LF
         ya+Q==
X-Forwarded-Encrypted: i=1; AHgh+RplQByWBf4n3YeMaVcytGwIIqIQxSbnIrXjAai/tPTTTD6rXpte7K2uvA26cSk5FiDte9znGmNaZqMCZs8=@vger.kernel.org
X-Gm-Message-State: AFuF++kDKWv846E0VXYhK1yrR+R+GoJYFLjwtutfyZzYCAjKbzEDS1bz
	0Db+yHVteFACl1ESZYjYgNp7kE+EcXph73dthKLIHhRqqco6NuMBL+sXS35BfO63lm8=
X-Gm-Gg: AR+sD13s5gd2FAZO8tp+RFAYsG7opBU+Od5AXBCZndpSwkNfsIhA4EIdLT6sPuRKxYg
	X4dZBKlIRsxDWw1s0cK48S5mfLvT48lunYC5lqKzVeqOOHHg5r7Rpppt/wJplEIJRgNsHxPyh4K
	rDxG2AgeteIyimdFWWplS1oGMBhsd4SXj0aUrczTCqkaJG8vaArMed8I/eel2Ai6/zt1jkRERtL
	B0VEMbaorV3Rpqaj7J6WXG16RrWH2LnQgbheepzlGrbvifZ5pAY2rk/kXA7spmcUPlGeAnfeP1z
	e/0XRMBPfsRHs0xN0LLYn9WkMqQM9rR9cRwxV6Qo8ReTHah99eFhw+yfTgcA+k+4ZcblPLHO3xi
	q+fLNspWLTxfzxMGCwzYOkIWolAZvVq2/BrH6bg17kusXJYY1BzyGZ/IUA9LjkyZyRFlt6TgE4V
	3n28J6/OwqJSgn5SYXgOb1UMjHjBsebEUFXQcgc9wFBFrHHakt8P/ZAKSVy8hBzGDWNKt0jquQl
	MkA5RTMV1Y3IcYfOdcx7h55mwWM5wp+MqjctlV1y2/yvKP5qNod9uKr
X-Received: by 2002:a05:6102:80a3:b0:789:3f43:645b with SMTP id ada2fe7eead31-789ef7277f6mr175545137.2.1788137490503;
        Sun, 30 Aug 2026 17:51:30 -0700 (PDT)
Received: from localhost.localdomain (corp-190-12-36-222.uio.puntonet.ec. [190.12.36.222])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f247e397sm5757890137.0.2026.08.30.17.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 17:51:30 -0700 (PDT)
From: Alfonso Kuen <gerencia@idkmanager.com>
To: hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alfonso Kuen <gerencia@idkmanager.com>
Subject: [PATCH v3] nvmet-tcp: report a bounded MDTS instead of "no limit"
Date: Sun, 30 Aug 2026 19:51:16 -0500
Message-ID: <20260831005117.142713-1-gerencia@idkmanager.com>
X-Mailer: git-send-email 2.53.0.windows.1
In-Reply-To: <20260829013900.10392-1-gerencia@idkmanager.com>
References: <20260829013900.10392-1-gerencia@idkmanager.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvmet-tcp does not implement .get_mdts, so nvmet_ctrl_mdts() falls back
to the port value (0 by default) and identify-controller advertises "no
maximum data transfer size". The initiator believes it:
nvme_init_ctrl_finish() sets max_hw_sectors to UINT_MAX.

What the initiator then issues is decided by the block layer. The
generic cap is 4 MiB (BLK_DEF_MAX_SECTORS_CAP), but a namespace that
advertises a large NOWS raises it: blk_validate_limits() takes
max_sectors from io_opt once io_opt exceeds that cap. On the array we
measured, NOWS is 65535, so io_opt is 32 MiB and the initiator emitted
32 MiB commands -- from a controller that advertised no MDTS at all.

The target cannot serve those, in one of two ways depending on the
kernel.

Since commit 4a3f00262a04 ("nvmet-tcp: bound SGL data length before
allocating command buffers"), nvmet_tcp_map_data() rejects any len above
NVMET_TCP_MAXH2CDATA (4 MiB) with NVME_SC_SGL_INVALID_DATA | DNR, so the
command fails hard and deterministically. That is the right response to
an oversized command, but the initiator had no way to avoid sending it:
nothing advertised the limit it was exceeding.

Before that commit the command reached sgl_alloc(), which for 32 MiB
needs 8192 scatterlist entries -- 256 KiB, an order-6 kmalloc. Under
fragmentation that fails, and it surfaces as NVME_SC_INTERNAL, a generic
status, so NVMe multipath does not fail the command over to another
path. A 1 MiB command needs 256 entries, 8 KiB, served from the
kmalloc-8k slab, which does not fail. That failure mode is intermittent
and load-dependent rather than deterministic; on a vendor kernel
predating the bound it cost us roughly 98 GiB of a 2 TiB image copy,
with the copy tool exiting 0.

Commit ec6d20e16c2d ("nvmet-rdma: Implement get_mdts controller op")
left the other transports untouched. Do the same for TCP, using the
same 1 MiB value, so initiators size their commands to something the
target accepts instead of discovering the limit by failing.

Signed-off-by: Alfonso Kuen <gerencia@idkmanager.com>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
Changes in v3:
- Cite the RDMA change as commit ec6d20e16c2d ("nvmet-rdma: Implement
  get_mdts controller op") rather than by patch title, per Sagi's review.
- Pick up Sagi's Reviewed-by.
- No functional change: the diff is byte-identical to v1 and v2.

Changes in v2:
- Rewrite the rationale. v1 described the sgl_alloc() order-6 failure as
  current behaviour; since 4a3f00262a04 that path is unreachable and an
  oversized command is rejected earlier with SGL_INVALID_DATA | DNR. Both
  failure modes are now described, and which kernels see which.
- v1 attributed the 32 MiB command size to a "generic 32 MiB ceiling" in
  the block layer. The generic cap is 4 MiB; the 32 MiB came from the
  target's own NOWS raising io_opt. Corrected -- and it sharpens the
  point, since the same controller advertises an optimal I/O size it
  cannot serve.
- v1 called the 1 MiB SGL an order-0 allocation; it is 8 KiB.
- No functional change: the diff is byte-identical to v1.

 drivers/nvme/target/tcp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index e4f603b2a..414ba896e 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -23,6 +23,9 @@
 #include "nvmet.h"
 
 #define NVMET_TCP_DEF_INLINE_DATA_SIZE	(4 * PAGE_SIZE)
+
+/* Assume mpsmin == device_page_size == 4KB */
+#define NVMET_TCP_MAX_MDTS		8
 #define NVMET_TCP_MAXH2CDATA		0x400000 /* 16M arbitrary limit */
 #define NVMET_TCP_BACKLOG 128
 
@@ -2243,6 +2246,11 @@ static ssize_t nvmet_tcp_host_port_addr(struct nvmet_ctrl *ctrl,
 			(struct sockaddr *)&queue->sockaddr_peer);
 }
 
+static u8 nvmet_tcp_get_mdts(const struct nvmet_ctrl *ctrl)
+{
+	return NVMET_TCP_MAX_MDTS;
+}
+
 static const struct nvmet_fabrics_ops nvmet_tcp_ops = {
 	.owner			= THIS_MODULE,
 	.type			= NVMF_TRTYPE_TCP,
@@ -2254,6 +2262,7 @@ static const struct nvmet_fabrics_ops nvmet_tcp_ops = {
 	.install_queue		= nvmet_tcp_install_queue,
 	.disc_traddr		= nvmet_tcp_disc_port_addr,
 	.host_traddr		= nvmet_tcp_host_port_addr,
+	.get_mdts		= nvmet_tcp_get_mdts,
 };
 
 static int __init nvmet_tcp_init(void)
-- 
2.47.3

