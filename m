Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3327E29D27D;
	Wed,  9 Sep 2026 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941525; cv=none; b=JQSjkMkM7PJBhvmKBCoyI8G8RY/H0ONgU+3TDq4nbwdboYbs/7w7tZ6AuhzWxsmbLSrDpxpNp4tVOYHqjDoJ9NzGlvth7/lsvDDG+fE0bviRFjaNFygpvOST0/OrXNOzfHDoyhZqLnGYKCpd4U1+w8O+GN6i7UmMXEZkeXKbews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941525; c=relaxed/simple;
	bh=9dMkHMleRdbFXq/Tngq9Z7Icy4JxHXPrtaDymmuML0o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UoOl9pbxSWibao21y1YkwlX8aM46sbo3paPJvSyaenqVGluab0a4jmcfrgRdAwazrm5nNU86BKlgXpNqr8K4ZAcXkKyh/1MCIEHqkg2dzZeH6KkEHQsxu6pdpaJiWPP5GdMY3ywx5Eoy0xqD5/yD4u0WDKyfeI3i92Af6/X/QfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ss1INxEA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ss1INxEA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEA92C2BCF4;
	Wed,  9 Sep 2026 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788941524;
	bh=9dMkHMleRdbFXq/Tngq9Z7Icy4JxHXPrtaDymmuML0o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Ss1INxEA/Y3iLRZCGK6h0OXSvCP6Gzr+RHw46OidyoUsOLuvmSGuGXtd02Ec+nBem
	 nyVFk1nH30s5/NZDg/eLB36lHbnlhapKiN/5FjSKNrQHLqBpoMI0ZgYD+2XQkQZR5c
	 iIrqsLXf6KR2VeWhWNIhWpRoTdnq2AS8u3dohcpuIcua0id63XRkzx7KPUmSoNlu3H
	 ZqJpF3GisdnE0Ns3iAfywbPCqhJaPXx2CGHk3qLe69XPuVAtOHA2x0WGoF2jnPgsB8
	 8y+bN9NQ8y1Jxfr8c+EURZtDcIHycpi7Chj/il7AFHh3S1LbVTd89gzK/2TNK71g/b
	 PUnF51ILMMX5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B354C79FAD;
	Wed,  9 Sep 2026 08:12:04 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Subject: [PATCH 0/4] Update my email address
Date: Wed, 09 Sep 2026 01:11:58 -0700
Message-Id: <20260909-update-email-address-v1-0-94a240f9469e@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJwWioVzEuxvYHhiiSDhASw
 t2puvwW721kSAqjW7FRwqKmnyGjPBUUOhlasMZsqlx1dd7VPI9RJjDeoi+WGBPMGBAEj+Zy9iX
 ldExodP1t74+/bX72CNP3Rft+AOhrz7Z4AAAA
X-Change-ID: 20260908-update-email-address-eeaec9ef5391
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788941524; l=985;
 i=foss@joelselvaraj.com; s=20260909; h=from:subject:message-id;
 bh=9dMkHMleRdbFXq/Tngq9Z7Icy4JxHXPrtaDymmuML0o=;
 b=jiHVWBP063DjZH2azjp48G9TpUTak2H2UEhlwqzRmb5KYIzCgfIHDAhlaCa9tVAYPf+XT+5Wk
 cQ54I+X6ziHBNNAf+ezwTiBNaAxrbOp5X0hxQUAS7kDfDUwFNviY1JQ
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=UUJ1v4UQJ/nljqj3NjsWt5H4mphWQ7etpQ4Z7JiR2yo=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20260909 with
 auth_id=1018
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

My jsfamily.in email address is no longer active, so update the kernel
tree to use my current address instead.

Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
Joel Selvaraj (4):
      mailmap: update Joel Selvaraj's email address
      MAINTAINERS: update Joel Selvaraj's email address
      dt-bindings: display: panel: ebbg,ft8719: update Joel Selvaraj's email address
      drm/panel: ebbg-ft8719: update Joel Selvaraj's email address

 .mailmap                                                         | 1 +
 Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml | 2 +-
 MAINTAINERS                                                      | 2 +-
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c                        | 4 ++--
 4 files changed, 5 insertions(+), 4 deletions(-)
---
base-commit: a9d7ced84989ec05be09b4b8428759ef60450a0f
change-id: 20260908-update-email-address-eeaec9ef5391

Best regards,
--  
Joel Selvaraj <foss@joelselvaraj.com>


