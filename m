Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC2F384CDD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787955868; cv=none; b=dvuRVqvsmG+xwfzSO9yMQf13EgIQFAjH1p/ZFnYheJRC6Ih2uKeLFg+2Gda9pknFWOOZ7dyoGORm/qNBVs3M+4OSGKyxNZrRyo3XnDmmiaB+rS55f8etEWA+60WyawFRQ3qJX8uyjRUYkncM+At2JuXJ/3bwD2eJ8rf/MSeqyvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787955868; c=relaxed/simple;
	bh=Xk/2itNGGwvzQ5Ct3+3m6nZce7+JaAyYCzQ8fHFJ0sU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L61ZSxz2sziIs4Pfu1sfQP/Ou3wMWE/OpbgTrsRQf40KdD3VzPe+Yn+2MaUhv/6Rma7ekZbw2DmkmLT8BuiugnMDWwiJBNsFszpCr3cPPf8QpUWDANRhTTCN93CNRN8TUoXZWKvLdNZPYFV5nr7RrcjDFpFql8KXzCB2InynylQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=idkmanager.com; spf=pass smtp.mailfrom=idkmanager.com; dkim=pass (2048-bit key) header.d=idkmanager.com header.i=@idkmanager.com header.b=LOqxK3Xn; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=idkmanager.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=idkmanager.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=idkmanager.com header.i=@idkmanager.com header.b="LOqxK3Xn"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97c7afa485bso854998241.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=idkmanager.com; s=google; t=1787955861; x=1788560661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w5YEgwBz/daywwMQ/sIV3Y54o6ngA3GwC0jiF687Iio=;
        b=LOqxK3Xn5B3AiP6eYIbhUCr1MjSkE6ss5oHfHHmqEHdhEj5OnBbHUa0iS8OvmTY6eD
         utoEOe4tlDXmJGJqznGtT7R6B4bGyCyZtgsAiYqh8gZoPq1RjLCYG9LbZDOvQSvh1lIE
         /43ABVMSMP2MWXxDw4lDMnMnxHNSWI7oZ/CJmHzd+qef5M4R/r+/iOWmd+52q1oyIvIN
         PFA5DgPVHDgPMS/00huDTwVp5vdsgf3zicSJbJuaM4TyMUsuJ4u1U5GE/aCSqrW+sJk6
         mJfWuFtkkP2GgFn2UGlaSquLIjVHR1BcCnK4A1OCCjQ4HcMEhd4T8cdmJJ39OAWHLkTK
         twGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787955861; x=1788560661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5YEgwBz/daywwMQ/sIV3Y54o6ngA3GwC0jiF687Iio=;
        b=lygcXFqTED5k9qwZ8VUgnjYtNVysgwP7eoJm77PVYiTh2Sz2Fpa8FyHU6kWEZj9y2C
         1eozi+EB/I11iDRP4C1zaZLIL5xjk5lBZd2GN/ELVc+Vc4Mu/HMxH05u/yhr6Xz8mAfW
         JAS7RtdLzSGaz0ok0mTQcC3PBS7K+bDRV5IDrtcz9pFyvXWVXmSQPjatRYArPjYMmEQc
         80OtvMrzh3HppmLeTHyKVTnhiT3gbKMTUMvffw2/JEmnRTjOTsrzCuFM+v7uuBVpb6RJ
         2ow8YIwF3R2c4lUYbCIhKh04rvV4nDvUu739/u0LP/opyw7Z6geqxc6KQykmm0jPePJJ
         wsWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKu4HtkzukdqAvrovMowg5fw7liAmum10YBa35Zx+yxF+UwlXHRKR6eiyOtdUNqan54VRypH6F0/nwdV0=@vger.kernel.org
X-Gm-Message-State: AFuF++nPpSNY0iLJkSjnIvC0I6BJymyNM37BAEMmotj+SoYIOIU88mJm
	tZTIZjLAlVB89loAg8VFduzP14FqRXf5KuPRmZ0sX1OEU8ihHDvE3d65ayJnc8Wo63M=
X-Gm-Gg: AR+sD128bkWji/NGj6fpp964poJnT+WZOB3EtZABRxLSzEEF6y31VGYpRTpNhxiBV1m
	04XFue6hpcdtjtkIXmk0ZOL0fZrlvSXV0t+nyXwhrSURdwmr3h/5RZh/w74tcTxv2VnsMZ6YWu2
	LJKdygZfjK7gRmRJ7WUU8eSN1/L+JXuuj+WehW1Lnqi22oxicIR+ud7vghxGs8Nx67AXMFrZJHM
	d+TiLxE1ZkNvssnCSLtbsbA3LQWnfbw5oozNvW1icGb9yKXq6GQ2z7WdYQXNH3OYAiJNXNxzUoh
	y72kcceTVXyiwcet9p1T3LPJ1qlgmbkRmCjcR17xomAT5n4hiaAez/8ya53BzWPO7ToVrVFDTK8
	IdY8dlxH9P/jUysdBb3Bn8mf+/254EiUChSA1GBBeHIXp0Lj0lIb0LfFwchpxYcWUm4ZSB5tdO9
	geKuSNZEyeSADLbDRfQwdm/tYZ7QETJJlkrZ3Sq3KjTlM5//ExKC/7uUr/+em+E9pmG8IZVWpY/
	yq0VGK2KDDBEmDwyCR0AeUDvRicm6UhDm+W5u73C7I8tbfjmInjbbueKmuy56VFy9c=
X-Received: by 2002:a05:6102:580f:b0:786:c86c:4f5e with SMTP id ada2fe7eead31-786c86c569emr1400782137.3.1787955860913;
        Fri, 28 Aug 2026 15:24:20 -0700 (PDT)
Received: from localhost.localdomain (corp-190-12-36-222.uio.puntonet.ec. [190.12.36.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97e84bd6b3bsm2305936241.11.2026.08.28.15.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 15:24:20 -0700 (PDT)
From: Alfonso Kuen <gerencia@idkmanager.com>
To: hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alfonso Kuen <gerencia@idkmanager.com>
Subject: [PATCH] nvmet-tcp: report a bounded MDTS instead of "no limit"
Date: Fri, 28 Aug 2026 17:24:07 -0500
Message-ID: <20260828222407.1280-1-gerencia@idkmanager.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvmet-tcp does not implement .get_mdts, so nvmet_ctrl_mdts() falls back
to 0 and identify-controller advertises "no maximum data transfer size".
The initiator takes that literally: max_hw_sectors becomes UINT_MAX, and
the block layer then merges requests up to its generic ceiling -- 32 MiB
on the hosts we measured.

The target cannot actually serve those. nvmet_tcp_map_data() allocates
the command scatterlist with

	cmd->req.sg = sgl_alloc(len, GFP_KERNEL | __GFP_NOWARN,
				&cmd->req.sg_cnt);
	if (!cmd->req.sg)
		return NVME_SC_INTERNAL;

For a 32 MiB command that is 8192 scatterlist entries, so
sgl_alloc_order() asks kmalloc for an order-5/6 block. Under memory
fragmentation that fails, and because of __GFP_NOWARN it fails silently
-- nothing is logged on the target side. The initiator gets
NVME_SC_INTERNAL, which is a generic status, so NVMe multipath does not
fail the command over to another path. A 1 MiB command needs 256
entries, an order-0 allocation, which does not fail. This is why the
failure is intermittent and load-dependent rather than deterministic.

nvmet-rdma has advertised a bounded MDTS since the series "nvmet: Add
mdts setting op for controllers" (Max Gurtovoy, Mar 2020), which
deliberately left other transports untouched. Do the same for TCP, using
the same 1 MiB value, so initiators size their requests to something the
target can allocate.

Measured against a Linux nvmet TCP target with three initiators: of
~1040 failed I/O commands, 980 were exactly 65536 blocks (32 MiB).
Capping the initiator side with max_sectors_kb=1024 removed them
entirely. With the failures reaching a page-cached writer, a 2 TiB image
copy lost roughly 98 GiB while the copy tool exited 0.

Signed-off-by: Alfonso Kuen <gerencia@idkmanager.com>
---
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

