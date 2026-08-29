Received: from tabos.org (krueger-it.net [145.239.1.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4448B24679C;
	Sat, 29 Aug 2026 05:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.1.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981704; cv=none; b=rr9OhxudJXT1hBvjPQXdfluKNqgJbWiP5NSEIfdpIORdPuDRglz5w6u1Q2DFcUeZnLGE23ivokFeHl62Zl1gyrtgVe2L1TwnMRlmOOrAVg0wJ3UnVJkwsIkR5lLACNWPovH8jKsiXEjCxTnQGJCJqPrXoriv0PuASY9w9XlvYyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981704; c=relaxed/simple;
	bh=5a8K65dJw13zsEoi3pTHf74nNUh0kVf0LC+CltOyKIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sq3BVyB07JVUYJStT6pzKj1+0fTmmoDsFe/i5vCYccm4WnexL15hMRiZZdvsjhUh224VG4H0lzgjco6iZCBDI2kU/J+xhlBAXOVQ7yBDlcnq1+GwMOTfDadGqbMOH/KpHwnBo2QqXnNhW7PWqATXdGPyVG+JFFvm+bdStz3zL3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tabos.org; spf=pass smtp.mailfrom=tabos.org; dkim=pass (2048-bit key) header.d=tabos.org header.i=@tabos.org header.b=Ubjm0wPy; arc=none smtp.client-ip=145.239.1.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tabos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tabos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tabos.org header.i=@tabos.org header.b="Ubjm0wPy"
Received: from c0d1ngstat1on.fritz.box (unknown [94.31.74.100])
	by dserver.krueger-it.net (Postfix) with ESMTPA id A830E62E0388;
	Sat, 29 Aug 2026 07:25:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tabos.org;
	s=default; t=1787981122;
	bh=TnlQvivcYtmg8pXMUQUCzn01H5WF5wXF821/Q4UxPvQ=; h=From:To:Subject;
	b=Ubjm0wPyru5AukNY9spx+mmKN75HNcqeQFlNqGg2TusGwuS0EmKasRHvSue6QFHgd
	 PqCo5ZfyAQ5OYcTWBlp6hXHP7THyJrGLctqAtzP7iCnXS5C03Z4ch21ZnEbznvA7hY
	 W29lDqJatxdhibcB5ePZnOlB959QmGl29hLMtOI42Et03R+pmL6M57IlfSYk8oSNMS
	 VO5MYzOtIRyutpk3ZgZBfmgAZiyIHnmpHvokvIxxlrwI5zXN6wD6qLeqDIh92RQrPd
	 WLcuTuD/EK9UJkLe3TQMTk8b4pM8QK34evq6WGWOQYBUJCRPBUORkv7Wg8AWk/nQAJ
	 xQ0ECgnr/gInQ==
Authentication-Results: dserver.krueger-it.net;
	spf=pass (sender IP is 94.31.74.100) smtp.mailfrom=jan.brummer@tabos.org smtp.helo=c0d1ngstat1on.fritz.box
Received-SPF: pass (dserver.krueger-it.net: connection is authenticated)
From: Jan-Michael Brummer <jan.brummer@tabos.org>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tian.shu.qiu@intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jan-Michael Brummer <jan.brummer@tabos.org>
Subject: [PATCH 0/3] media: ak7375: Add AK7377 support
Date: Sat, 29 Aug 2026 07:25:11 +0200
Message-ID: <20260829052514.18178-1-jan.brummer@tabos.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AK7377 drives the focus actuator of the main camera on the Fairphone
5, and is register compatible with the AK7375 already supported by this
driver: a 12 bit position in registers 0x00/0x01 shifted left by four,
and standby control in 0x02.  Patches 1 and 2 add the binding and the
compatible.

Patch 3 is a fix that is independent of the above and applies to every
user of this driver.  probe() calls pm_runtime_set_active() while the
regulators are still off, so the first runtime transition is a suspend
against an unpowered chip; it fails its I2C writes and then disables
regulators that were never enabled.  On the Fairphone 5 that showed up
as an -ENXIO from the first resume, after which focus control stayed
dead for the whole session even though the actuator answered fine on the
bus, and as a WARN from regulator_bulk_free() on unbind.

I can send patch 3 on its own if that is easier to route - it does not
depend on the other two.

Testing: the AK7377 on a Fairphone 5, driving the lens across its range
and checking that the image comes into focus, with an out-of-tree IMX800
sensor driver.  I have no AK7345 or AK7375 hardware, so patch 3 is
untested on those; the change moves the first runtime resume from probe
to the first focus request, and confirmation that this does not regress
them would be welcome.

Jan-Michael Brummer (3):
  media: dt-bindings: ak7375: Add AK7377
  media: i2c: ak7375: Add support for the AK7377
  media: i2c: ak7375: Do not mark the VCM active before powering it

 .../bindings/media/i2c/asahi-kasei,ak7375.yaml |  1 +
 drivers/media/i2c/ak7375.c                     | 45 ++++++++++++++++---
 2 files changed, 41 insertions(+), 5 deletions(-)

-- 
2.51.0
