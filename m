Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EF641C6A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787897978; cv=none; b=bb1eEk3OkOsz+u5GKintgYBJky0SVDzy9YyDimwpA5MxpsdBe9/OqTE+LiSpZC1zSw/hOsixqnGOHfTwKezQLUbn8uZHnRE5oq1QbIm3Ls7JzjbKcY66nV9UfgbU/Oco7QoFdqiDO+gVSGSa5TBvPTVN/+luat420QeRXRGI43c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787897978; c=relaxed/simple;
	bh=JF4xrCVFmF0o/1tbItiHlnYB2sn3BkauJ+pUKMKJqGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ECjFHG/BBIZ89HZzu13JkdqcCtYk7zxlf/IH3lUZuuV5xJ9u1Xm4sKotZh6DF4S0btCVAkyhp/tpRLvsl+YV05IFvWEOaM+CUMqP+dJIxEHuFigWKKQ9ugNLeeM1JVEL2sCKx6bckS6ud8ST28PWu4/R3Fhcn1r/4OkrB57OUqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from Mogu.localdomain (unknown [223.73.65.69])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ba921c55;
	Fri, 28 Aug 2026 14:19:29 +0800 (GMT+08:00)
From: MoGGuU <Naixumogu@whut.edu.cn>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] accel/rocket: Fix job submit error handling
Date: Fri, 28 Aug 2026 14:19:13 +0800
Message-ID: <20260828061916.20405-1-Naixumogu@whut.edu.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa04705fb1f03a1kunmbcc13c968b1e2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQk1NVklMSk1CQxlPGB9KTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVTEhVTU5VTUJZV1kWGg8SFR0UWUFZS1VLVUtVS1kG

Several independent error paths in the Rocket job submission ioctl can be
triggered by unprivileged userspace. This series validates userspace BO
counts before passing them to helpers with signed count parameters, collects
implicit dependencies before the scheduler job is armed, and propagates the
first per-job submission error to userspace.

The series was tested on RK3588 with zero task counts, invalid task pointers,
invalid BO handles, and oversized BO counts. The requests returned the
expected error codes without warnings or errors in the kernel log.

Changes in v4:
- Added Sidong Yang's Reviewed-by tags, using the corrected email address.
- Dropped Cc: stable from patch 3 because propagating submission errors
  changes userspace-visible ioctl behavior.
- Rebased onto the current drm-misc-next branch.

Changes in v3:
- Kept the individual count checks before GEM lookup, but changed bo_count to
  int so check_add_overflow() rejects combined counts above INT_MAX, as
  suggested by Sidong Yang.

Changes in v2:
- Split the three independent fixes into separate patches as suggested by
  Sidong Yang.
- Rebased onto the then-current drm-misc-next branch.
- Dropped incidental blank-line-only changes from the original patch.
- Added Sidong Yang's Tested-by tag.

v3: https://lore.kernel.org/r/20260828050805.38548-1-Naixumogu@whut.edu.cn
v2: https://lore.kernel.org/r/20260827170608.39511-1-Naixumogu@whut.edu.cn
v1: https://lore.kernel.org/r/20260813142059.151644-1-Naixumogu@whut.edu.cn

MoGGuU (3):
  accel/rocket: Validate BO handle counts on job submission
  accel/rocket: Collect job dependencies before arming
  accel/rocket: Propagate job submission errors

 drivers/accel/rocket/rocket_job.c | 32 ++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)


base-commit: f9c2f70ee41544717b3c209083073db1e21f919b
-- 
2.43.0
