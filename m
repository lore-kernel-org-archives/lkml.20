Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE22456DFD;
	Tue, 15 Sep 2026 20:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789503655; cv=none; b=JS+pOxvqpRp+dQtdawpQxMyxFcry6SnShYZKRj+Vu2pVoN/3MEnv1CmJVjyv4/J4GhjrrbFPv4+jqUBENsk0fgm5GP5iNHzeY8ZCsHQBj39jA9oH8AcJY/MJhDRoUmqf4LXMftmkbWgW07SAQ8czhlfwBt93LBiJhxa1QIKAPRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789503655; c=relaxed/simple;
	bh=ZEQ3J4FqxnkpYsTzOtwn2mqHYYGvQR0TAxGTCP4Bj0Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TSoaJod9k8gflDBuo7/wyaFgICu7KypmLar4XMOiFqhUSGz3yk8JBHXWb/8GCi4KEi73cqwvRI0LdbYqDqwcO6jXCVPxYt9bpPo5cmoW+3ftVZokDMB2ZrMQi8F5jBK0lUr0MBCArcy/XUCBsskiYDDQfjMEv7gVBGSZWuIq5qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WhTjTlJd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WhTjTlJd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AABAC2BCF5;
	Tue, 15 Sep 2026 20:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1789503655; bh=ZEQ3J4FqxnkpYsTzOtwn2mqHYYGvQR0TAxGTCP4Bj0Q=;
	h=From:Subject:Date:To:Cc:From;
	b=WhTjTlJdGTAj0o1QWL96DAzrLaOubO9K2CRAtPR0VD9P5Puk7Vh3Ruh8c70XRYJy9
	 ZyyXB/gzV3Np0HOJh99tYC8OMSw+g97s2RWsVAfx0WOp5nUllRMXFyS9PuHnTcs9Kf
	 K8LaKc+O/J5W+euO7uIk0UISpMJF8Ho5P1Fzrs9A=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56DBC88E75;
	Tue, 15 Sep 2026 20:20:54 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Subject: [PATCH 0/3] Add Vision Components MIPI Camera Module support
Date: Tue, 15 Sep 2026 22:20:22 +0200
Message-Id: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrE1S1Ui4ilgwBiP+0pZIxN0Vy
 2/x3gWOrbCDIrrA8iFO1iUgiSOgoV56RmmDQSudqVyleBDOsgmStxNmrTGauCMyCkKyWe7k/HZ
 l9dvtzcjk3wfc9wP7JxdScAAAAA==
X-Change-ID: 20260903-vc-mipi-ctrl-6d442cefcc40
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789503653; l=2059;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=ZEQ3J4FqxnkpYsTzOtwn2mqHYYGvQR0TAxGTCP4Bj0Q=;
 b=xuekxFxW6sSoMFjNUpYSX4OEcsRNM1xs3u3YsE37zqH+GLe4pa9+Ym99UgNx+/HSXGn/OWjdq
 LHFDTiXYaERD6qmelw838XYCWw0ZwK2GJk3e7ZovoROtS+xjshaAyOn
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

This series adds support for Vision Components MIPI camera modules by
adding a device driver for the controller chip found on those modules.

The controller is an I2C-accessible FPGA that provides three main
functions for the attached image sensor:

 - power sequencing and control of the module supply
 - a fixed clock output used as the sensor input clock
 - routing of I2C traffic between the host and the sensor

The initial version of this driver was written by Laurent Pinchart and
is available at: gitlab.com/ideasonboard/nxp/linux.git in the
v7.0/sensors/vcmipi branch. Therefore I've added Laurent and me as a
maintainer for this driver and left Laurent as MODULE_AUTHOR. If that's
incorrect or not desired, please feel free to reach out! Thanks

This series was tested using ov9282 camera modules from Vision
Components. Those were flashed with different FPGA firmware versions and
connected to an i.MX8MP SoC.

Any feedback is warmly welcome.

Thanks!

Link: https://lore.kernel.org/all/20260728092856.GB1494774@killaraus.ideasonboard.com/
Link: https://gitlab.com/ideasonboard/nxp/linux/-/commits/v7.0/sensors/vcmipi
Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
Richard Leitner (3):
      dt-bindings: vendor-prefixes: add Vision Components GmbH
      dt-bindings: media: i2c: Add vision-components,mipi-module-controller
      media: i2c: vc-mipi: add Vision Components MIPI Module Controller

 .../vision-components,mipi-module-controller.yaml  |  92 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   8 +
 drivers/media/i2c/Kconfig                          |  13 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/vc-mipi.c                        | 541 +++++++++++++++++++++
 6 files changed, 657 insertions(+)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260903-vc-mipi-ctrl-6d442cefcc40

Best regards,
--  
Richard Leitner <richard.leitner@linux.dev>


