Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA66360EFC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862800; cv=none; b=Zv+0BXHY+XUwQA8uSfksKFIYrionxlWj+S5CHzU/F7Ef31g2lwi3xXtLvPW4yLUMzim08vshrDRYxzdtSMqpOUfgbeq3junHsDKgyyMFnCEMrM1A4V0fKRubkwqKo9qTf9bJ6IuCwjVeImHpyUhz+14U3ubNXk/N/MW0im9NML8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862800; c=relaxed/simple;
	bh=rPtOMLzk146zv2eEvXEmxjqB0zivsCKY1TZEhUlzI/8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WQJ+d90U9cRdPZ/SoHLh/niXOlYNbEB2ZVYR0Io6CLMK0xj7jhqPJwSARV2UCcWq2oS/y3o57jLjmG9HYJ+5wNeb4TTKBOHp5M6zKMGa28IP58AM1OAI4AhzuALM0/Eqbc+0tE5ZUgLzvvW7MJnXcMjETBAHEonQLo7Ea9fM7mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCkI4dbg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCkI4dbg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE811F000E9;
	Thu, 27 Aug 2026 20:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787862797;
	bh=hXeCrlr2H2UZCuLEvvGGoMqVWRnxMZcI2iWHVfhvG3k=;
	h=From:Subject:Date:To:Cc;
	b=PCkI4dbgyKdkB4OV5KuL8wg7G11MgCfPxQHpr72rgWdnBfDwiLkxYtcu3rar3QMY2
	 4rfszF2eD2ukLUDQbO8EtZZqvJRyqi/anmwCGpIV2HGGgnAj8SQIb96ball0wDaPbg
	 CnZ9fyPA3GOH7SNC05Wtee8TnYYwFlrruTwjJHrIIIJoTHHH3R6QbVaJEygsJor8lt
	 AOzbnu9FVjTMpnvC+AE/pbZ70esfsKamc5hEizOcIFATYN2VzYKyh+7t+TASj2Ba1d
	 YJPApV9gXic5Fr4YcI+ZR/rasbvpKAkXRBhFHnKiTnaGIFzstRbRhmYI7sTrRZdBA7
	 gHJJrqG7eSclw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 00/11] accel: ethosu: Another batch of fixes
Date: Thu, 27 Aug 2026 15:32:59 -0500
Message-Id: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyNz3dSSjPziUt20zIrUYt3UVFMLYwuzVEsDAwMloJaColSwBFBHdCy
 EX1yalJWaXAIyQ6m2FgB+EhHQcAAAAA==
X-Change-ID: 20260827-ethosu-fixes-ee58386e9000
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

This is another series of fixes to the ethosu driver. It's mostly probe 
error paths and cmd stream validation fixes. It's a mixture of 
AI reported issues, different solutions to other posted issues and 
fixes[1] and my own fixes.

The series adds rejecting OFM tranpose in cmd stream, but then the last 
patch adds support for it. I did this so the rejection can be 
backported, but maybe supporting OFM transpose is small enough that it 
should just be backported too?

Rob

[1] https://lore.kernel.org/all/20260717061145.1478139-1-zhaoguohan@kylinos.cn

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (11):
      accel: ethosu: Fix ethosu_job_open() return value
      accel: ethosu: Drop IRQF_SHARED flag
      accel: ethosu: Ensure cmd stream ends with a stop op
      accel: ethosu: Ensure SRAM size is 0 on mapping failure
      accel: ethosu: Ensure SRAM region size matches job
      accel: ethosu: Fix probe error cleanup
      accel: ethosu: Factor buffer bounds checks
      accel: ethosu: Validate secondary streams
      accel: ethosu: Reject unsupported commands
      accel: ethosu: Validate all feature map tiles
      accel: ethosu: Validate OFM transpose

 drivers/accel/ethosu/ethosu_device.h |   6 +
 drivers/accel/ethosu/ethosu_drv.c    |  17 ++-
 drivers/accel/ethosu/ethosu_gem.c    | 240 ++++++++++++++++++++++++++++++-----
 drivers/accel/ethosu/ethosu_job.c    |  22 ++--
 4 files changed, 233 insertions(+), 52 deletions(-)
---
base-commit: f7e3f4d9f425cf4c5577cd84a096e6e618488083
change-id: 20260827-ethosu-fixes-ee58386e9000

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

