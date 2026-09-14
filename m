Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2BB39E18E;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413685; cv=none; b=XVg0as6On8xtJiJHsABcPSRI8NRigDOjPtnvfP/oQWj0JbOMvfuUUqZqSlf6f6rnoRIIOORNiIbwTv03cmocwXtxTA5z29kn2nTvyRhZbqEKbhz00JfHRcr+BzwNkZWHAzNohOeGOs8uS6NHHsmk+XL1EH12In8bckLUHS45iCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413685; c=relaxed/simple;
	bh=3irs+JPodkYv8XStf29IdedO2ZXzXnhbXVoH2x8iVG0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WcqGtL7Nua18H+OUiZc0DSobW9ZWEfn9/puQxz6VpvE9eOHQVf2Et/8aiqNmzmteApBcMSvSeHYhw7wufzxVx6HzbmCwE0wEruy5M3uTXwN+ohc7w9eMKxkgDP0z8MtLUwb3X0YeHsO8nrxktrDLKoMoU5h+Aq2+WL/XzDzCBdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=1ogH/59J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="1ogH/59J"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C547C2BCB8;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1789413685; bh=3irs+JPodkYv8XStf29IdedO2ZXzXnhbXVoH2x8iVG0=;
	h=From:Subject:Date:To:Cc:From;
	b=1ogH/59JLXPW5dE1qDclZtrz51GYrVB8kqYOdRlEOvoXmRWbiUahkaTgBGstnXjkf
	 15adaDSg7uMDllpR4D3FwsRrWSkKdgpLTuLZM3u+Eo1I2OM+Qaa6qkCyZGUcMGAN0T
	 gweQ/KdGTd3DGYenDipc32Jio3UZkXeO219b6HcI=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CF8C88E7B;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Subject: [PATCH 00/10] media: i2c: ov9282: fix control range handling
Date: Mon, 14 Sep 2026 21:20:57 +0200
Message-Id: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABlJqGoC/yXMQQ5AMBCF4avIrDWpkUjrKmJR7WAskA4iEXdXL
 L+8/O8CocgkUGcXRDpYeJkTijwDP7p5IMUhGVBjpa22ajksGlQ9nyQqOGuq4DqPpYGUrJG+IRV
 N+1v2biK/vR9w3w8JUoEBcAAAAA==
X-Change-ID: 20260909-ov9282-fixes-da986dabc238
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Martina Krasteva <martinax.krasteva@intel.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789413683; l=1987;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=3irs+JPodkYv8XStf29IdedO2ZXzXnhbXVoH2x8iVG0=;
 b=iCiYHgrs5MYBiangGDKWdA40tZkWP8x11UnblTud99605Tu+WUF+c+/DLuGrU+SmyV7EM847l
 hrTDBlLkPMwD0VyNKwX7NQ4ABIRCzlaM45KaM7gvQbcn3YL61vufQ4e
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

This series fixes a set of related issues in the OV9282 control handling
code.

The driver updated exposure- and flash duration-related control ranges
in several places, but some of those updates used an incorrect timebase
or were triggered too late, which could leave the controls clamped
against stale values.

The series:
- checks the return value of exposure range updates,
- introduces various helpers for calculating/converting times,
- refreshes flash-duration limits while the sensor is powered down,
- refreshes dependent ranges on mode changes,
- recomputes flash-duration limits when HBLANK changes,
- removes the no longer needed hblank field of the driver struct,
- harmonizes error printing during probe

This series was tested with an ov9282 sensor on a vision components camera
module attached to an i.MX8MP mainboard.

Any feedback is warmly welcome.

Thanks!

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
Richard Leitner (10):
      media: i2c: ov9282: handle error from exposure range update
      media: i2c: ov9282: fix line time and exposure time calculation
      media: i2c: ov9282: fix flash duration to/from microseconds conversion
      media: i2c: ov9282: update flash_duration range even when powered down
      media: i2c: ov9282: add refresh of missing ranges on a mode change
      media: i2c: ov9282: refresh flash_duration range on an HBLANK write
      media: i2c: ov9282: drop redundant vblank field
      media: i2c: ov9282: harmonize dev_err_probe usage
      media: i2c: ov9282: fix flash duration control range
      media: i2c: ov9282: clamp flash_duration default to its maximum

 drivers/media/i2c/ov9282.c | 253 +++++++++++++++++++++++++++++++--------------
 1 file changed, 174 insertions(+), 79 deletions(-)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260909-ov9282-fixes-da986dabc238

Best regards,
--  
Richard Leitner <richard.leitner@linux.dev>


