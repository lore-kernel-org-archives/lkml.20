Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76F0372EDD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790736159; cv=none; b=h+eWyLeGU3a6wpljQdpLHH4XxJ+qd1TkTh2KtVN0UfWKQso6Wk/uac79r30EEadGv51dZN5OeWF6tAtsziSAiu4y2u8B0xwJf6QHRA350k1yZzoD0uG0R7AknnNz0N4sYpYFOKY2HvJN9pB8o/BV9BBimZZRGbExZN/WjS/HIAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790736159; c=relaxed/simple;
	bh=gOmy+NomzNU9wfi8xkTB1vj81JFqOlEUQg8NggKaspY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PmGJTBHdkBrumU5kvptv5NcDreV7FNru8lzEQJYyE6tJKsobJY7R6grZRuCgJhAJ5wwNwaHJH/bvfX9W6DhoMMx2iwFvvsAWaDCAGFeak1eu/BY8n/31nOFv1xc8InwYtlDmbiBWUjebLGPqBw1cXnytAmdsX+GeAa5B95WZbWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=coz//K4Q; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="coz//K4Q"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so4635930eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790736157; x=1791340957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXAnOf/NZJgORhbHe0MffVtfrlsAlZFWtlHgqEl8yV0=;
        b=coz//K4Q5yPoWwLGYc44loNl9yW4DSFGwbwlgX2PeFS7+c6JuPvhmwDQq/6pOxmi1X
         zhNKytflHFTDbU8tVuRAfxJLIVE72prGOITLm5wfjpIxk699PK29YNqhOBO23paX8mLX
         1nPw0jrsQr5mfhipfT0GfIfrttrxjsRV0mLOhPFvAhGlHskVpSINbfSWMdSdpsT93qqv
         jEcwPip0rGhQGZiCE95f9kuMpUqznscMqrJHmrzQMt71y+jWI/stn28gtwIys/hZAftV
         F1wFxBoixIxukOWWjIT687UUzmYe+o/mgRgef99sOHk9tBRbUUrwP/j4Ii+oiZ0xfEMH
         VH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790736157; x=1791340957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXAnOf/NZJgORhbHe0MffVtfrlsAlZFWtlHgqEl8yV0=;
        b=toF+TKzDjLNmzkHi1/BQ4n6UbbStP7nUwGArcx3RV8dCrVIva0jhxtTyMF7/zyE1o9
         vwXG8AVzmaudffSSjqIRcYuh6xIFvgW+p5MLBxTGJjAT+CIOf38gS+NjrqPyQkl6Ygp3
         Url1CuWI/7YBqYTfEGCtzqC4jI5eUSOajt619fPAfQ0ErG5ZrPB4orxmGaDXMqQ1HLLh
         3TFg8HXXT2B3HHyaMZaBwX9N5GxrVNhpnD/0qpcrjI28IJzPyFBnKwUokJrz1NQbWNzS
         O+TCOOeGq1nc8f/Lv3fS7nWeaFM5Um9XsS6KdZRWDbH4DvI2AFTKMpMgdHxEAl6rnC3+
         uOUw==
X-Forwarded-Encrypted: i=1; AKwUvBy8YGTjf9WwdYM/9Bd41gQDRfFqA0rBS3XoUpdIVBtLcpUXPH4whvW+vWIRrmh9wavRNsUdauAtY9l5iA4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgZ4I264WOAdOsq7y6teCQhMEZpti3avlnmonSPF7qlXnokmWk
	7+ihL+uZintpwyNEpILxSj5cRCSOQ4DYVpdZ6SEZTzpW43CGLFhTjzErQxDNRdFgamU=
X-Gm-Gg: AYBFou25FBiMNokJB1sWTB3slun/FN/TXiVdEz+wt4nYDES/OGP7ZACRgTblHeVIvL7
	RWcmHnmzPdNom2ECYoXdIST0e3tVWCFHYNpu/f9bPzOL1Oc2Fh7Ay7GYD5hF5GvjdETprVu9FkR
	6o7iaIjJkOuPcJ1EzIsSgKQI1rtttQlQV/ZztEZdrF/pq4XmeBM4BmPATi8kE/LPBBmLzpDNBsV
	2aPttxaHBJx4z4oiS9immG2YaxklERehVOKAEieeZOgqEGDF55Gs2h7Q/WvCq8AUk8yUInyrsif
	vsMQNs/Jz8VPlFg8Fo8mMltuF6t7rpFc6E6X7h8885wo4lkPHqeb8UKDk8kWrk8vhYLZl0aB3r8
	L4jSPdVknNmfUNtEhEZDlkN59R/Mj1THzYxCY+grMTEdfE2JRbkVPZ+TY5nAnQfnl35SvfDQ5B0
	Gl6n07Lb9l39C3yr4+YULEBjRP8po9TN7v5hyKJboxHBb72XVWZt3DzPPkxHz00XiC2Ar3E7IVz
	l4/BJjiwRf8g01hkyCAKcYIJRuCTFqCOWTQvA+W8xxYcp7DVqoZyrRd1hg4K4PxoXIbM/i/
X-Received: by 2002:a05:693c:8954:20b0:33b:e75b:cc42 with SMTP id 5a478bee46e88-34cdc1ce146mr203864eec.19.1790736156602;
        Tue, 29 Sep 2026 19:42:36 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c386c2723sm2540580eec.18.2026.09.29.19.42.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Sep 2026 19:42:36 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Chunguang Xu <chunguang.xu@shopee.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y] nvme-fabrics: use reserved tag for reg read/write command
Date: Tue, 29 Sep 2026 22:42:31 -0400
Message-ID: <20260930024233.96200-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chunguang Xu <chunguang.xu@shopee.com>

[ Upstream commit 7dc3bfcb4c9cc58970fff6aaa48172cb224d85aa ]

In some scenarios, if too many commands are issued by nvme command in
the same time by user tasks, this may exhaust all tags of admin_q. If
a reset (nvme reset or IO timeout) occurs before these commands finish,
reconnect routine may fail to update nvme regs due to insufficient tags,
which will cause kernel hang forever. In order to workaround this issue,
maybe we can let reg_read32()/reg_read64()/reg_write32() use reserved
tags. This maybe safe for nvmf:

1. For the disable ctrl path,  we will not issue connect command
2. For the enable ctrl / fw activate path, since connect and reg_xx()
   are called serially.

So the reserved tags may still be enough while reg_xx() use reserved tags.

[ Backport to 6.6.y: used the older BLK_MQ_REQ_RESERVED request flag. ]

Signed-off-by: Chunguang Xu <chunguang.xu@shopee.com>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Keith Busch <kbusch@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and nvme maintainers,

I am working through the small CVE backports still missing from 6.6.y.
This one addresses CVE-2024-41082. It reserves a request tag for
controller-register I/O during reconnect and reset.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.6.y?

CVE: CVE-2024-41082
Upstream: 7dc3bfcb4c9cc58970fff6aaa48172cb224d85aa

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/nvme/host/fabrics.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
index fd01b86f10a4b0..8adcc8c97c42cf 100644
--- a/drivers/nvme/host/fabrics.c
+++ b/drivers/nvme/host/fabrics.c
@@ -179,7 +179,7 @@ int nvmf_reg_read32(struct nvme_ctrl *ctrl, u32 off, u32 *val)
 	cmd.prop_get.offset = cpu_to_le32(off);
 
 	ret = __nvme_submit_sync_cmd(ctrl->fabrics_q, &cmd, &res, NULL, 0,
-			NVME_QID_ANY, 0, 0);
+			NVME_QID_ANY, 0, BLK_MQ_REQ_RESERVED);
 
 	if (ret >= 0)
 		*val = le64_to_cpu(res.u64);
@@ -225,7 +225,7 @@ int nvmf_reg_read64(struct nvme_ctrl *ctrl, u32 off, u64 *val)
 	cmd.prop_get.offset = cpu_to_le32(off);
 
 	ret = __nvme_submit_sync_cmd(ctrl->fabrics_q, &cmd, &res, NULL, 0,
-			NVME_QID_ANY, 0, 0);
+			NVME_QID_ANY, 0, BLK_MQ_REQ_RESERVED);
 
 	if (ret >= 0)
 		*val = le64_to_cpu(res.u64);
@@ -270,7 +270,7 @@ int nvmf_reg_write32(struct nvme_ctrl *ctrl, u32 off, u32 val)
 	cmd.prop_set.value = cpu_to_le64(val);
 
 	ret = __nvme_submit_sync_cmd(ctrl->fabrics_q, &cmd, NULL, NULL, 0,
-			NVME_QID_ANY, 0, 0);
+			NVME_QID_ANY, 0, BLK_MQ_REQ_RESERVED);
 	if (unlikely(ret))
 		dev_err(ctrl->device,
 			"Property Set error: %d, offset %#x\n",
-- 
2.39.5

