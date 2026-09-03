Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3EE471D10;
	Thu,  3 Sep 2026 12:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437423; cv=none; b=ZoDgYfGaFJniSbZSk7H7BZXLzBMUtvR+064U0a7QsoZWsys6+OqyqMrvfyaPRHLLb2FN2PVNFw/+iA71yVDMTizdXwSaIbeptnmy22H2ozXlesGs+qTzHY5NRrIJpWhVsIUldtWe9so3CgFgNejCoFRGWVusI10FhGZVXT8gyHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437423; c=relaxed/simple;
	bh=1o0HV5ptWkPncFS17Yk0IazxMvMPnOZ52wTQeaFw8m8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QZEXI3igek4L7Agriau+2TxBrICRBwborNsyDJiCMYAHnLWQZk7uauyi2sj93AsVsv6GtJnhNykfx3iyE6QWtHOEbWHpiBew9ZfHIzfdGaBaMDGSm7hejcZfOw6hUOc/IWHLqDBBX9ZL9I7gJaNSmg7D2O+KBqAhuU2gNKNKS2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qgMElyhh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qgMElyhh"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA16BC1;
	Thu,  3 Sep 2026 14:08:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788437327;
	bh=1o0HV5ptWkPncFS17Yk0IazxMvMPnOZ52wTQeaFw8m8=;
	h=From:Subject:Date:To:Cc:From;
	b=qgMElyhhxG0A24A1GewZoUxbSi6gILlE3nNMo6SiBfUt5H8DWB4/4MNuT0DR45KmI
	 OLLnKaSxSKY/vuXlKZbMPREGbe0CBUW7ezuUPbq/ZBWriD14n7twRh3bL/IpRBJEEJ
	 uQ6+fNbFyQJRswxnz9bxNYsRH4nlw+fOPvC6n4cw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 00/10] drm/tidss: Preparation for AM62P and BeagleY-AI
 display support
Date: Thu, 03 Sep 2026 15:09:50 +0300
Message-Id: <20260903-tidss-pre-beagley-v1-0-93928baa8b12@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI9jmWoC/yXMQQqDMBCF4avIrDuQTjEQryJdJGaqI6Ilo2IR7
 26sy4/H+3dQTsIKVbFD4lVUpjHj+Sig6fzYMkrMBjJkjTMvnCWq4jcxBvbtwD8sI5G3LhBZB/m
 Xt49s/2b9vq1L6LmZrxAcxwmT7uH1dQAAAA==
X-Change-ID: 20260903-tidss-pre-beagley-5d22a69b2269
To: Devarsh Thakkar <devarsht@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=1o0HV5ptWkPncFS17Yk0IazxMvMPnOZ52wTQeaFw8m8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqmWOikW23aSBgqTDlri5ZUITdtqYCp3PVbIM4Q
 4gZWtl9B62JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCapljogAKCRD6PaqMvJYe
 9fufD/9wUYoQgNWY+KAqZ1NHV9RCbejZ5I7mkj6R1vF7YxEfKdrjYdgdTTOk2DhNrH9csnXv+7D
 BQRNz16s9ZLu1nrZAGiS5nEc+1a4jBJZLueP3Pkp1/b+MT6THF0sJHtvHp/MX4F4t6hL+mweISs
 /w/WjEVS2YJL5gZ1fSKhuIohsE9l7vsu7O/l7yWHhxJVY2svFfNXZ9CGegz2mLzl3WPRhoEUrZf
 qbnkFxp8Lqwxl4RYljJk3imbkB9scVVQyXZ+n64WWbGV1ESgbTNOsJJknmWGb0Tc/ULZe8FSfKZ
 pqXrYMTuqnPc7jGWUh2vgKuvAqTeOqij2ZjM2X4vVTwaF9VDVrb+vjQwsDmwsz6er7S1/GCWdW5
 ub9JkYWx1Furi8Adr7UUhShpr1kAg9nfzDNLRJCbeOoSviamCsblBbjG0vkg4Fiw6tlmy0SgDKQ
 ACapwSAdh+kbB7SbOBovTSPLhfb824M+QJ9qJk7lTQ90NaemetrWkyRTKx9G/2lt9+iojGXLbmY
 GH4rndRve+Hsjqz4OimoOQKykNcGbHAEJAb6QR7KacUNDFudh3q4c14hFtI7RssfVoM1d+escpS
 +hRtToqysYnhCLxz6Ha38bHhuJYJpJ0BO6UVcPIGtyzmV/pD6+4QOOl42q/RKURKHIH+vJWXvsD
 gLouZ2XjbzK07hA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

This is a reduced set from the original "[PATCH v3 00/15] drm/tidss: Add
BeagleY-AI display support (and some more)" series, with a few new ones
on top. I have dropped the patches that still have unresolved issues.
Essentially that means AM62P and BeagleY-AI support is not added in this
series, but all these patches stand on their own and are needed for the
future AM62P support.

Most of these have already been reviewed.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (10):
      dt-bindings: display: ti: Move ti,am62l-dss binding to a new binding file
      dt-bindings: display: ti,am65x-dss: Simplify binding
      dt-bindings: display: ti,am625-oldi: Add optional power-domain for OLDI
      drm/tidss: Remove extra pm_runtime_mark_last_busy
      drm/tidss: oldi: Remove define for unused register OLDI_LB_CTRL
      drm/tidss: Add mechanism to detect DPI output
      drm/tidss: Add support for DPIENABLE bit
      drm/tidss: oldi: Fix OLDI signal polarities
      drm/tidss: Drop WARN_ON() from tidss_runtime_put()
      drm/tidss: oldi: Fix missing of_node_put()s in error paths

 .../bindings/display/ti/ti,am625-oldi.yaml         |   3 +
 .../bindings/display/ti/ti,am62l-dss.yaml          | 136 +++++++++++++++++++
 .../bindings/display/ti/ti,am65x-dss.yaml          | 149 ++++++---------------
 MAINTAINERS                                        |   1 +
 drivers/gpu/drm/tidss/tidss_crtc.c                 |  10 +-
 drivers/gpu/drm/tidss/tidss_crtc.h                 |   4 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  28 +++-
 drivers/gpu/drm/tidss/tidss_dispc.h                |   5 +-
 drivers/gpu/drm/tidss/tidss_dispc_regs.h           |   1 +
 drivers/gpu/drm/tidss/tidss_drv.c                  |   7 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |  70 +++++++++-
 drivers/gpu/drm/tidss/tidss_oldi.c                 |  46 +++++--
 drivers/gpu/drm/tidss/tidss_oldi.h                 |   1 -
 13 files changed, 323 insertions(+), 138 deletions(-)
---
base-commit: 97c594f71fa71dc30a0583a76d8b6ef5c5ea10b1
change-id: 20260903-tidss-pre-beagley-5d22a69b2269

Best regards,
--  
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

