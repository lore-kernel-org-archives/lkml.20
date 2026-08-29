Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC5A35E950
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787967557; cv=none; b=CMJqTHE2tGdXjrDh8gVBNc2K7LJxpzr/2JI7H/KLW2fNRnjbqAwevjuh5MDpyTqO3MDaL72JSp0o5wKtMiiJrfvDJ6CyGVWClZfiJvgvALRaLmvcIKZaSVGgT5RdFRzoyj2UUgRfrm2XTqstoAbVQxJB8vGs1dK5F+/J482b3gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787967557; c=relaxed/simple;
	bh=jk+Tp5Wp7JHdfUA4T1AKFZM2AwkhL09WNDUlriyk4Z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cbDQKSFhlLeyWAV8MfqjYqMp4cwJgPW4PCNst7k0V/hMU5VVDWajxMy44KrK5giC1/jaBvWxP2f1kFE2OOpy5NLGOjaL/qWu2+FQ07go1dorL492HwMJg774J3ePH9Jv2LTafvPtOaB1KvQsQsgy2MIZg78gnK8XpadDIYUifYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=idkmanager.com; spf=pass smtp.mailfrom=idkmanager.com; dkim=pass (2048-bit key) header.d=idkmanager.com header.i=@idkmanager.com header.b=LRWhkwwU; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=idkmanager.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=idkmanager.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=idkmanager.com header.i=@idkmanager.com header.b="LRWhkwwU"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-97cc72fe0f3so2003046241.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=idkmanager.com; s=google; t=1787967554; x=1788572354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5slJd6WExDyikoMceEsk8sBohrxbGQ7bqx/Tq+katg=;
        b=LRWhkwwUI5i0JBD2TFaeWtsKpdHciCJ+AdEyTewDu2VDmXLIxQNNT7nxwvwvzcUTsT
         BH+iljojNGldGzvqCM8SDreBodvaTJcLlm6ZKtD0zUWgfo75sUndmhZ2SK4QO5eEjoDu
         noCXhbWOLXk+bXJAsU4eoPeyeUvuKNw7cb/TnXFUIwPvYJDL0Yma+TEJKwc0mYvjWS7m
         sLfAAwLxIl86MNoWWcpOd5wBvQvU8XngREuXmuUEvquk5g3ks9t+3K8v6mEGmrty7Aiq
         x1Ml5GvXeklEyRnmQ2O/Fv9SVkwUTVLLQxkFENwBg0NK73gqamUCI7pMRm7jmZrT96Zs
         sOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787967554; x=1788572354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O5slJd6WExDyikoMceEsk8sBohrxbGQ7bqx/Tq+katg=;
        b=rJhg+eEAWzMl+UgT0mdXHnebCsa4NuEpEwJdqjMIRdhxPVpmiRV0IMLSANp3bFIyt8
         OOvDvpi+psM891Y+IwAVMCKdkprEGbenFhMRuXyfeg4xh2aQc4foMYOTkmk2DxAflKkY
         7BgeLRwUmimW/KFAtUJUptfPXza6eACmcBmKgMh8QHcNyWdCYj0WeeZXK1RmBCSxNEce
         jWkagkRyhFawVAzOwA48rYBHsYjRwQChJkf1u9SB2m6OSAJAxyZrtMip6fWZP1h0eQhJ
         voE9KCRnnF3Q2i+XmO3kTx/DfBm7zeFbM9rauKUlE+pk0ymzmjHmS2QlqlSM42CPUJKB
         F2WA==
X-Forwarded-Encrypted: i=1; AHgh+RqlWfjCSLTF2/QXhCosZFQX4xfkDj3qsXi0y5uYnvYVin7RTyK7wNqaoDfCYgRqzkxlp2B/Hb34vpxsWck=@vger.kernel.org
X-Gm-Message-State: AFuF++mnFhE1nOv/ImrGfMQ3y+WXYTMbTcaeN6xEc7cx8sFo1U8Ddqvd
	1zQncXQd9SEZsaDv7ZNz7oIf81RadEwP14kRb9qp9h6yGcwbxvkOY58QUmG17yMXwRI=
X-Gm-Gg: AR+sD12vuMnr42j1+ZnFnsaA3oTkNp0V2bHb099sL6UuW1QdKRwd0jqjk8MHaUee6Mb
	fl9oYft1ctxxdwVp/YOYQBQtdwszlyfxzlia4KrqN/HOLMJQPKDnmmA0TQAeuwRQyWIr7VeTw62
	C5ibA0rfLx8N2T5qGj1zKqa0c/rz8tZTvLoCqtmV06D+eeGOj5ibpx1WKnC+TArPGYq4aH2bsl/
	eEQzGEjezbTXhxRw/3F0X+BIvQu5Ul4bkZ+huKiGL83r416784B7ywRHjmOhkZoYj6HgyUrSO7X
	leAWhdtVerf6CwIpoHOdRSIDcKP52cN8KYpGKyU6tHPeMu7F22fDMAVRny5gebXATK/fhuEi1Jw
	JoR0/3xKs3YuYC7Qm0qLuHfHY8dE6e5QG5MJm0VwYKwhFF/F0eQy2nchkrGiMwAOeV+se2YyUQr
	xg1BT+tw6x0shzwk7Ho9kGC3ytScvrOAihHdyj8bVqSlA7xB02QOhazRVyV8wTARGMO/leyVzXb
	yV1UxIWAp6qG3fJBmzjdiNI9vOpSCBujpo83kTVkp+NHCrOWBvloh2BqCcouRrVilW3
X-Received: by 2002:a05:6102:3c0e:b0:787:ebf8:77ad with SMTP id ada2fe7eead31-787ebf89425mr295346137.18.1787967554199;
        Fri, 28 Aug 2026 18:39:14 -0700 (PDT)
Received: from localhost.localdomain (corp-190-12-36-222.uio.puntonet.ec. [190.12.36.222])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f247e397sm2414216137.0.2026.08.28.18.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 18:39:13 -0700 (PDT)
From: Alfonso Kuen <gerencia@idkmanager.com>
To: hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alfonso Kuen <gerencia@idkmanager.com>
Subject: [PATCH v2] nvmet-tcp: report a bounded MDTS instead of "no limit"
Date: Fri, 28 Aug 2026 20:39:00 -0500
Message-ID: <20260829013900.10392-1-gerencia@idkmanager.com>
X-Mailer: git-send-email 2.53.0.windows.1
In-Reply-To: <20260828222356.1264-1-gerencia@idkmanager.com>
References: <20260828222356.1264-1-gerencia@idkmanager.com>
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

Since 4a3f00262a04 ("nvmet-tcp: bound SGL data length before allocating
command buffers"), nvmet_tcp_map_data() rejects any len above
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

nvmet-rdma has advertised a bounded MDTS since "nvmet-rdma: Implement
get_mdts controller op" (Max Gurtovoy, Mar 2020), which left the other
transports untouched. Do the same for TCP, using the same 1 MiB value,
so initiators size their commands to something the target accepts
instead of discovering the limit by failing.

Signed-off-by: Alfonso Kuen <gerencia@idkmanager.com>
---
Changes in v2:
 - Rewrite the rationale. v1 described the sgl_alloc() order-6 failure as
   current behaviour; since 4a3f00262a04 that path is unreachable and an
   oversized command is rejected earlier with SGL_INVALID_DATA | DNR. Both
   failure modes are now described, and which kernels see which.
 - v1 attributed the 32 MiB command size to a "generic 32 MiB ceiling" in
   the block layer. The generic cap is 4 MiB; the 32 MiB came from the
   target's own NOWS raising io_opt. Corrected -- and it sharpens the point,
   since the same controller advertises an optimal I/O size it cannot serve.
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

