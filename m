Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF7731F9A5
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862812; cv=none; b=b20ygB67ryggRLWZhHgFuYpBzsZ0AkNbVCY4gRIgDPbP2ZJHQDcbkmlJtMGD9cdiOLDReAq4++UhyxvCwFVjHAaTTzZLdblCF7pu39fsvEb+Tz4YEo/2oJO5t/7VtOfbmsQnvuFqaLmyUEX6wWQROm+Wkx13SJvkRAL3r/Xjiyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862812; c=relaxed/simple;
	bh=3BAaltnCkbdgENCRtuIxeD3voB1ggAQUkOZ4SyHFgWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Or0Yk1lIFMWyZkCCcS5yL9jnhcLXVRXXygAd0BZsdc86DToINqmBlDa4+jNIsyx5sKtryU5/4B4EelIX28feIUlozeMge+ixCOocEYPsB2rkmwejpH7jg/qBF1HcV8DYfUEyfe0A01c+h2loKYo+kmMM7Ajdi5pbD4/UXoWBifc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZjBjz2i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZjBjz2i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0E11F00A3F;
	Thu, 27 Aug 2026 20:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787862801;
	bh=dN++67rDjyqdMbNr9GA584bXADDlqA1mW/Fue7rbdF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FZjBjz2iuHmvca0Joxx8flKYOPpCp2GjHnzDVk39GGYuo495dslkA14YDTSpu0kr5
	 d7F5AZM9rklq78LNtaPlkQU7ZZqmEGYnedtbLKOhmkEsQ8q/COJZkQl2p6zJLigTiY
	 bakfQroTL0zkJxnIVATv2MTIDtQN9QA0rZz950od/Hb10qhNv9qkG2igD0mH3cc/4/
	 EJzCcdwNOvEFjpDiy4I1hSOWi5ea1t7grQb+Rr9w+UDgRD0/3vIkw9k5TMME1xHzy5
	 YCpKzkvC0p/aYNQVjXQHvXK9L2frwZriiP7tG/zLXzFkTWdITYkl/mo4xIdI2LeeTV
	 N9Eql8oqAXY5Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 27 Aug 2026 15:33:04 -0500
Subject: [PATCH 05/11] accel: ethosu: Ensure SRAM region size matches job
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-ethosu-fixes-v1-5-346f9ea8791c@kernel.org>
References: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
In-Reply-To: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

It is possible for userspace to set the job SRAM size to 0, but then still
have SRAM accesses in the command stream. When the job SRAM size is 0,
setting the region base register is skipped and a stale base address from
a prior job is used.

Check the region size against the job's SRAM size instead of just the size
of the SRAM. The job's SRAM size was already checked against the total SRAM
size.

Fixes: 9cff90774872 ("accel: ethosu: Validate SRAM size on submit")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/accel/ethosu/ethosu_job.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_job.c b/drivers/accel/ethosu/ethosu_job.c
index c33f2877b385..0982722a9195 100644
--- a/drivers/accel/ethosu/ethosu_job.c
+++ b/drivers/accel/ethosu/ethosu_job.c
@@ -441,13 +441,13 @@ static int ethosu_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
 			if (!cmd_info->region_size[i])
 				continue;
 			if (i == ETHOSU_SRAM_REGION) {
-				if (cmd_info->region_size[i] <= edev->npu_info.sram_size)
+				if (cmd_info->region_size[i] <= ejob->sram_size)
 					continue;
 
 				dev_err(dev->dev,
-					"cmd stream region %d size greater than SRAM size (%llu > %u)\n",
+					"cmd stream region %d size greater than job SRAM size (%llu > %u)\n",
 					i, cmd_info->region_size[i],
-					edev->npu_info.sram_size);
+					ejob->sram_size);
 				ret = -EINVAL;
 				goto out_cleanup_job;
 			}

-- 
2.53.0

