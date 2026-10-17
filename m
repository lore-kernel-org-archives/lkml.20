Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0BE3A7D82;
	Sat, 17 Oct 2026 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225935; cv=none; b=tE5VjpbmW+37GBB18BVb7+D1Rq/M60SXqfGLdsRR/0u+RvackJeiBniA2Ys4LYLCVmSZDfZ/+CGMaEB3OP8CAmJCvJyKltWC2bmGR2hnUZlBIg69OXhogCxWKUKifbPVj13V+PLMkzKRv7G2WOhWTsQ426ThRyQMJI296CYyw98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225935; c=relaxed/simple;
	bh=f8OnSobOSVw7SAIjgs7CnYG7FNsm7CZdkmTmhcthv0E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VKbfDh1KJtD8rWcN9F1og0J/GRmdFH7kvJzYbRbgwSp42wEFvkzRzjJOsExJ09wH0iFWq58o9kqRGgAXjx7gfDwvu7WN32RHWBJn/5008juviA4Gr4wGhfq6DBpt5YK3tnbJR1220KGNPuGIjo0f4FVzjHmrUFlR0+43QFBh++8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p3joZfOf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p3joZfOf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F833C2BCFA;
	Sat, 17 Oct 2026 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792225935;
	bh=f8OnSobOSVw7SAIjgs7CnYG7FNsm7CZdkmTmhcthv0E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=p3joZfOfupNNOCQVxaTNCO3XYkoK3mHwiHFwpcBBUQz7ak0Fkj9wcJCBC+MTzNM2k
	 ivNUYrv2wiP0jXEKwNTDn721WHRCT/ynhEZAOvnOCgIGdvXoxCpSmPztiMnp7yQQEz
	 lfSyDQYwA+vvm5LsSwpBijQnrYirrCLoO/lPjAfqkUrObFCNNZcZ0VCEHiazg7TywJ
	 o4aLfxVYB6ZTGpm7X789U3R5sAVe6iRCHqeFKvOslCXQ3ScPSaZ29l7xaX3wWumkih
	 xNrWJXfQ49dMbLu0ucBDQcq+hH+gL7L9Nezx4dlwAIQxwpH/2FAM2fdJ21AxgHcjNl
	 3xUomHFpp48Jw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE73CCA462;
	Sat, 17 Oct 2026 08:32:15 +0000 (UTC)
From: Tin Posavec via B4 Relay <devnull+tin.posavec04.gmail.com@kernel.org>
Subject: [PATCH 0/3] media: ov9734, ipu-bridge: Enable the camera on the
 Intel NUC M15
Date: Sat, 17 Oct 2026 10:31:56 +0200
Message-Id: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6DIBBFr2JmXRKhRkqv0nQBw1inCzSMGhPj3
 Qt1+X7+ewcIZSaBZ3NApo2Fp1RA3xrA0acPKY6FwbSm1622atqcvXeK57VXXUQXtXUGzQOKMWc
 aeP/XXu+LZQ1fwqUm6iN4IRWyTzjWKdG+wHn+AOv816SGAAAA
X-Change-ID: 20261017-ov9734-ipu6-4dc9d1792c28
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tin Posavec <tin.posavec04@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792225933; l=1899;
 i=tin.posavec04@gmail.com; s=20261017; h=from:subject:message-id;
 bh=f8OnSobOSVw7SAIjgs7CnYG7FNsm7CZdkmTmhcthv0E=;
 b=z/UVEXikEsdvGLW3AMGsI8lMG9zw5kSZkE6e1YE8mjxcWYM2I5Ft/DzIIKlNpLBRVsizsMFAr
 8qYMB2tNQgyCKms9Prq+sXIrrNc/XdLkjMSmRBvJ6TClqU2Ta1AXOXz
X-Developer-Key: i=tin.posavec04@gmail.com; a=ed25519;
 pk=SHQVmXmK88mO08JT/P9vzu9gKd208IICWLSbsX3TmcI=
X-Endpoint-Received: by B4 Relay for tin.posavec04@gmail.com/20261017 with
 auth_id=1222
X-Original-From: Tin Posavec <tin.posavec04@gmail.com>
Reply-To: tin.posavec04@gmail.com

Hi,

The camera on my Intel NUC M15 laptop (LAPRC710, Alder Lake-P, IPU6)
does not work with mainline. It is an OmniVision OV9734 (OVTI9734) whose
avdd supply and clock come from an INT3472 discrete device; its ACPI
device has neither _PS0 nor _PR0.

Patch 1 makes ov9734 defer its probe until ipu-bridge has created the
endpoint, patch 2 adds power on/off sequencing with runtime PM, and
patch 3 adds the sensor to ipu-bridge. The camera needs all three.

Tested on the NUC M15 with Ubuntu's 7.0.0-38 kernel (7.0.14) and the
series backported; the tested ov9734.c differs from this series only
by commit 7eef49c16461 ("media: v4l2-subdev: Add struct
v4l2_subdev_client_info pointer to pad ops"). The sensor streams
1296x734 SGRBG10 at 30 fps (libcamera, simple pipeline, software ISP);
it is powered off when idle, and s2idle works with the camera idle.
Not tested: S3, other boards, and kernels with lock debugging enabled.
v4l2-compliance: 45/46, the SUBSCRIBE_EVENT failure is pre-existing
(no V4L2_SUBDEV_FL_HAS_EVENTS).

I used an AI coding assistant (Claude Code) to track down the cause,
compare with how other sensor drivers handle this, and draft the
patches, hence the Assisted-by tags. I have gone through every change
myself, tested the series on this laptop, and I am responsible for the
result.

---
Tin Posavec (3):
      media: i2c: ov9734: Return -EPROBE_DEFER if no endpoint is found
      media: i2c: ov9734: Add power on/off sequencing support
      media: ipu-bridge: Add OV9734 sensor config

 drivers/media/i2c/ov9734.c           | 139 +++++++++++++++++++++++++++++++----
 drivers/media/pci/intel/ipu-bridge.c |   2 +
 2 files changed, 128 insertions(+), 13 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20261017-ov9734-ipu6-4dc9d1792c28

Best regards,
--  
Tin Posavec <tin.posavec04@gmail.com>


