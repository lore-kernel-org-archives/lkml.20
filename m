Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254639;
	b=MzHuGLYex1Djq1ij0I7Xc/c74DduNpknXo/dnJutw7Z01s3SNXjHxXOR5JOK41LsRLtn
	 VbC9uAwM9JOhZFyyIUoEX4bAmBbUlMpws0X6dIeL7u/h0jLop9RGLJSHKm/HljeUdCM4m
	 19YGfCQVmLU8wD1FLL11u6PGM02yNL8lQstqZ5X3F/xOgnuH37cXLmgRWsDQasVuBWtB7
	 N0iFojflOVV9+/mGj2E/gE/Kfr424M0LCAL2EvIkI0YP/EEmddDKkT8n9+ZTBLVyiXtoH
	 wS65vwF6Vv2vYP2Qpn3oIzTbCJeQzY5tLWJZikPHIJVLkVCo0Ocmd9/w2WbCev7mLXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254639;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=yBZ4TUo03feojPuxZWuTtPwGy7knKvPPOqlwiFV/hDo=;
	b=QVEeVWKZpAhynIZVOW5nMfwTssfWhw1KWRYw/D2oKTk4UR4IWuxaOWrUrr1dK+oO/5pu
	 0aK8YvSIDn4j1WPwkDoSs6VTyM0+fiCxHdRj7BeEbTfVb/IxkRarHK2rQY6eAuon4C5pA
	 JQZ2D3JMKKj11fBm1JUlC9BHJTMPOR6A+AY+P2QIs7F6BFC6t5AcnpFhGFXX/oP1URJpl
	 DH+mn7OKj9TTvr7k6VyufvA4DjKebcCsrshpwq7RDxCo4XjtBlwVQTaDh2Rqx6vRxtpgh
	 RP1dNsznJrl4nYYNGXUpzJ1XCz5gf4OyXAlQwdzNBWYVvXsUdxFwtiAL/AMwivpG9iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MG089LjB;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833D4606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 833D4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MG089LjB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793254638; x=1824790638;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=6EWDwgloRuMWf647VnD//4UEbpnkuFDnlJXuxT0wTts=;
  b=MG089LjBFqwgVRXaqNVH09s/MKrUkM+ykSFK8dRe5h2n+tg4m2YwXT6A
   ePd1i0wtOIOHqeKBMpWuc+gZHOgsHA4Iu6wzyoAk3EAf54A5DShydQNEB
   hyg/WY80lsVyV2u+H8ry/RjoDwHpQeYs4iOZXFUS1lq20xdsxG+esFlQo
   cGpQUFL2Zpxe1lqG9A4Px0Do/+cMP3xCk+6PZs52TCG3yG+hA9OGV4U5P
   Fxwgzjn9wnz/D5I6CVpBUIj7rcLWeJD94cs/6arQfoLaQal0cmC9tRqLS
   ryiw2KbTeBZYRMsIzqIas/34nfjBCAgJRkEptRaN64bW5cnleJGaDaVaL
   w==;
X-CSE-ConnectionGUID: 7Py1PwgFT8GVW6ZjlODDig==
X-CSE-MsgGUID: 6BFNLKg+Scie9RnxJZmPog==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1877302"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1877302"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 23:17:17 -0700
X-CSE-ConnectionGUID: Xwf62UUNRBSQVFDqa7x9vA==
X-CSE-MsgGUID: TRwYLekhRcOWwLmOYq65Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5042596"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 23:17:16 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Thu, 29 Oct 2026 08:16:56 +0200
Subject: [PATCH] mei: avoid reuse client on bus for vtag
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-mei_avoid_reuse_bus_on_vtag-v1-1-ae80231c1265@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqDMBAG0KvIrBvQoP27SilDNF/sLJqUjIaCe
 HeDy7d5GymyQOnZbJRRRCXFiu7S0PRxcYYRX022tdeutQ/zhbArSTxnrAoeV+UUuSxuNrcw3gf
 fow/DRHX4ZQT5n/vrve8HirRzBW0AAAA=
X-Change-ID: 20261029-mei_avoid_reuse_bus_on_vtag-7fb85d4e4f5c
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Menachem Adin <menachem.adin@intel.com>, linux-kernel@vger.kernel.org, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793254635; l=973;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=6EWDwgloRuMWf647VnD//4UEbpnkuFDnlJXuxT0wTts=;
 b=DIf73Js3ieZiw+ZsA9VNE3ODEKn7f8S/e2ObZhkog4S6rVNtD49ygCSl2eSCmIgUS80Zr+vvh
 jefx0JIEw0VCTkRe4TPqF1ld5O/45xNPChqc0XNusYmQ7k66n0no1XQ
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Bus device assumes exclusive ownership on client object.
Do not allow vtag connect to reuse client owned by device on bus.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c
index 4fbf0b323616..1795f1a00b67 100644
--- a/drivers/misc/mei/main.c
+++ b/drivers/misc/mei/main.c
@@ -572,6 +572,10 @@ static int mei_ioctl_connect_vtag(struct file *file,
 			if (!IS_ERR(mei_cl_fp_by_vtag(pos, vtag)))
 				continue;
 
+			/* do not share with devices on bus */
+			if (pos->cldev)
+				continue;
+
 			/* replace cl with acquired one */
 			cl_dbg(dev, cl, "replacing with existing cl\n");
 			mei_cl_unlink(cl);

---
base-commit: 79e5797d243a466138f641932f81dc69f796060c
change-id: 20261029-mei_avoid_reuse_bus_on_vtag-7fb85d4e4f5c

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>

