Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2212E469846
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935999; cv=none; b=Nbn3Sux25+P+K2xqxXJ3e8EooIdGUtK/ccVyXDWD6oy8JhrP7SpZ5GeVz5u5xPBY47z21MMUF9Z/OykKizwWhXuWxRQaK29io83Ety/rgdWl73CB6izF1aa+GqPKA9+4oocjUksW3RakJ5dla7NYaEzf2WOVgZwZqlnwvqXZt7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935999; c=relaxed/simple;
	bh=fO+SsmppFI4Z0pBC8bbd6ym53bjx7vYJDW8Pvab0by8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8+SOqSbC7H8STPSEAQCSl5+ZbZpfGmfQIvhHCwA4ZqQ68JYaFUpVFwrxsBhOIP+scOnMZUYGdUiphpiueNFMluF1+vSKj3psOlo1jH5Caqj43USl5mbVz66NP6I+BEhwKJHjYHEvspuZzy3MJKQ1mA9laPmFxxdacfiIP+NCac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SifLcZ+6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SifLcZ+6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36E11F00893;
	Fri,  2 Oct 2026 10:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790935997;
	bh=Iy431WSSyFg9zwyvNCEdj8ICtsm51QaQ13AygCPXOKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SifLcZ+605feOO7/EiQwGMhjzyK7+fs7vD6VD2WY5c6sYKHUdG1edKI05w6rmU3Hl
	 9j5vgbJb83pnCTfqm1Owr0J/xy12zwtYe0MHPnBzLsVsVZvz7ZrFLjfNqJ8BDsc82P
	 3nQsPUSIkV1PmR0zWXQYb1UcwXk4wr2HJdmnP3r946YzpQmcVABOYQry/bx/3KngKa
	 jfrvZxeEcsUBb8tghs6wqyAbx0xRqUtKvRpQBfFimz25SOKAtWxMzStwT/3SmrZmHl
	 d4/0CKE/+AJd4P+yb2FBScZyTByfgbe8+Q3xmLf7x6h/UQOw0vgkFVUawyFOEM8KGq
	 AQmSQjPqAjBmw==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Jianping Li <jianping.li@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 1/2] misc: fastrpc: Reduce console noise from expected DSP info, reserved memory and session messages
Date: Fri,  2 Oct 2026 11:13:01 +0100
Message-ID: <20261002101302.1084243-2-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101302.1084243-1-srini@kernel.org>
References: <20261002101302.1084243-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jianping Li <jianping.li@oss.qualcomm.com>

On some platforms the DSP firmware does not support the fastrpc
capability/attribute query. The DSP side returns an error (err: -1)
while handling the request, so fastrpc_get_info_from_dsp() does not
return DSP_UNSUPPORTED_API but a generic error, and the "else if (err)"
branch in fastrpc_get_info_from_kernel() is taken.

cctx->valid_attributes is therefore never set and every open()/query
re-prints the same "dsp information is incorrect" line. This is not
tied to boot timing: it can be reproduced at any time by manually
starting adsprpcd. On RC builds with metadata flashing enabled several
clients come up and flood the console.

As this is an expected, platform-specific and non-fatal condition,
downgrade the message to dev_dbg. Similarly, the absence of reserved
DMA memory is a valid configuration and does not indicate an error,
so downgrade that message to dev_dbg as well. Also rate-limit the
"No session available" message with dev_err_ratelimited(): it reflects
a genuine failure (open() returns -EBUSY) so it should still be visible,
but must not flood dmesg when the session pool is exhausted.

No functional change intended.

Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
Link: https://lore.kernel.org/all/20260514062825.50172-1-jianping.li@oss.qualcomm.com/
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/misc/fastrpc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 90fd669636ec..f40356c95051 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1783,7 +1783,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 
 	fl->sctx = fastrpc_session_alloc(fl);
 	if (!fl->sctx) {
-		dev_err(&cctx->rpdev->dev, "No session available\n");
+		dev_err_ratelimited(&cctx->rpdev->dev, "No session available\n");
 		mutex_destroy(&fl->mutex);
 		kfree(fl);
 		fastrpc_channel_ctx_put(cctx);
@@ -1941,7 +1941,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 		kfree(dsp_attributes);
 		return -EOPNOTSUPP;
 	} else if (err) {
-		dev_err(&cctx->rpdev->dev, "Error: dsp information is incorrect err: %d\n", err);
+		dev_dbg(&cctx->rpdev->dev, "Error: dsp information is incorrect err: %d\n", err);
 		kfree(dsp_attributes);
 		return err;
 	}
@@ -2563,7 +2563,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	}
 
 	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
-		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
+		dev_dbg(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
 				"qcom,vmids", &vmids[0], 0, FASTRPC_MAX_VMIDS);
-- 
2.53.0

