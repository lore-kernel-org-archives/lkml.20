Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490DB3905EB;
	Wed,  7 Oct 2026 20:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791404354; cv=none; b=T20xd7nlV4fUiXCui/qNvEiUqjdx9RckOGaLkQk8Pyp3HgzVdFhGRH3YyLnZ+EACthBe97541aQhUEUWkVY2GEldngYzZcZZuQks6f0dzJMcKhif02hpBz0OJyKzAc+ENW+QOVzy7km+AIqcOyA6LkYl8b1X8awjfYSBOy6rKHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791404354; c=relaxed/simple;
	bh=K9hsH8idjjeLKyRAQ+TwEQ/+sjz3dYXs7NZrLptlizU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mFDmXC/Ym4zIhCABuPTfzLPcOmZZgJVMkQXX5RqzYQ02emV1KVVmcPy6vGbcYB10dSZpDZC+7LpOqSMv+Fb9S+91x8WJTgFovkiEeqChwr7mB+0SZAwbFK5UQ4mbGY4K1qnwBXqRjiruIyO4BfiCsV5oqJF15POXd/N65UyxWfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com; spf=none smtp.mailfrom=mail.savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=c2RYVRQP; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mail.savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="c2RYVRQP"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 106BE3D818A0;
	Wed,  7 Oct 2026 16:19:04 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 6YAIV7jNVkQz; Wed,  7 Oct 2026 16:19:03 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 085983D81859;
	Wed,  7 Oct 2026 16:19:03 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 085983D81859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1791404343; bh=egqWC/42mwW2SZfbT/ur767U61gd29E6H+p4BrJ2fGw=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=c2RYVRQPeXBHOB0aCQTf59Y6j9WcvUWSIztS6bzem1Z+r234kFgJ98mTEd1omKOIP
	 cq2YuAr8Czpu3M1qXjgTPGvWCMg5+kDrc+1JgPuswI4tYuUSyRKkrwUzfVzzehFchn
	 dOBMuf3bVnW869BBEHF+VbNUy/pBJp2exhmWbUcjwElo8MW4jvMDtAg6NEouD/a/R9
	 +Cheo2gBP/GCuPc4M/OEifBe89sA8L5Mc9DzQOyw4KLiJ/LM7h15ACHFBDiboyLKYp
	 Fj9SL2sx9ZWCbDgzJy9WhE1xsdbi3MjRmGDH/Lp54g/TZurradmvkaeF2rKg3wbcj/
	 f2XvtIM/EnVPw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id OONYnz5ObB-z; Wed,  7 Oct 2026 16:19:02 -0400 (EDT)
Received: from localhost (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 6E4383D8182D;
	Wed,  7 Oct 2026 16:19:02 -0400 (EDT)
From: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Ondrej Jirman <megi@xff.cz>,
	Purism Kernel Team <kernel@puri.sm>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Felix Boucher <felix.boucher@savoirfairelinux.com>,
	Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
Subject: [PATCH 0/4] drm/panel: st7703: add support for DCLTek DT300248
Date: Wed,  7 Oct 2026 16:18:55 -0400
Message-Id: <20261007201859.3709656-1-marc-olivier.champagne@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series adds support for the DCLTek DT300248 10.25-inch MIPI DSI
panel based on the Sitronix ST7703 controller.

Patches 1 and 2 are necessary preparation: they make the driver send
the init sequence from prepare() with the DSI host guaranteed up,
since not all hosts accept commands once the video stream is running.
These affect all panels using the driver.

Patches 3 and 4 add the binding and panel.

Marc-Olivier Champagne (4):
  drm/panel: st7703: set prepare_prev_first
  drm/panel: st7703: move init commands to prepare()
  dt-bindings: display: panel: add compatible for DCLTek 300248 10.25in
    panel
  drm/panel: st7703: Add DCLTek 300248 10.25in display

 .../display/panel/rocktech,jh057n00900.yaml   |   2 +
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 117 +++++++++++++++++-
 2 files changed, 116 insertions(+), 3 deletions(-)


base-commit: 5d7b464a4f517d1db533b1b231f42ddcf4e1dff4
--=20
2.34.1

