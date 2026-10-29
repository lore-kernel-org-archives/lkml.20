Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261918;
	b=tHTG90LYuH9vvmL09rgR1Uot8Ga+0i8Ae8V4d9WZvNzokoKfmModd6AxI9R3UcON04Hp
	 Xbr+7bkhKd3rizU6DZmCq1fDb9wBJiMW6rIReBsRw9ZdD3Pi1fEVsy3/Qk37GdMcH4j7S
	 mrUK4ywi3JdiOkxHi0Vgs6/GBOkGZjGsomlT5nTIsIwkJPgdXg7PQrq0yXgVEgH2SHlhS
	 8hKgIVKgF5YrEjMW3CW589MTxCbyIS2FcMUngAevMhTuB4Au3tJIhBw04dOxYn+HMJ7CF
	 iChMoVF+UDk11lpxYy2QhRurmUoROQG3ySIz7n1mxpwl7jw/vG40mdqGSDLarcNUdng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261918;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:
	 X-EPHeader:X-CMS-RootMailID:References;
	bh=0lgHRoa196DEU+2U1lk70FoFCFplkDsDz1Bz0nF6vpc=;
	b=gjFyb6ugKKRikwJmaXFqNTK7abI7KwxeQZDMh8EIr8CbFrGrR40BkAIXCY7KWi7kVF7k
	 KV49gcCDSYIGKS4682KccfgTnUWOb7PA1tzbGDLwhY+X2BM0z8sg/zKZgX/q5E43BgHtO
	 JN3u97NUl3depGOhQi50DsiJN+fV/4+nlKajpCn178hmJSo/FzgDQXgCsV2I+ow6baACs
	 mQ7cXbvSqZsruH6nmocVx+csqxEdY91aTh5Q/+DrTgEdajKIYPCthW+ltmya1506O9zjw
	 D+AMNHyiHyswvrRrGd9wBGMnzJrA2DbEH31UfFef7EOCn2Bo53p9UPVGyusSL7lG1PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=VAObjPjS;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FB8606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83FB8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=VAObjPjS
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261029081835euoutp01843d7a8b21cf087248effdc749ea277d~i8jYOzK2b0996509965euoutp01K
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:18:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261029081835euoutp01843d7a8b21cf087248effdc749ea277d~i8jYOzK2b0996509965euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793261915;
	bh=0lgHRoa196DEU+2U1lk70FoFCFplkDsDz1Bz0nF6vpc=;
	h=From:Date:Subject:To:Cc:References:From;
	b=VAObjPjS2TY/SX4X40nIReHrB6Gf9/nC4Ty+LHPFAbmqtDo9dIAStoadIx1rX4WhM
	 2A+ZGkSpSIRYFfwvj2S6DG3xjde1aUoSqXQg+hflKlB3R2zcTLgqRudotEaNqj0IKQ
	 Ny6015+uRrXUr9ZjvVV5KVEe2dlUnJAadAz89DLI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261029081835eucas1p290190c4899f87b740d022b9db9bc361f~i8jX9Cv7L2606526065eucas1p2e;
	Thu, 29 Oct 2026 08:18:35 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261029081834eusmtip19ac2ae38f3972126e7d077eeb848237a~i8jW-rEcn2949629496eusmtip1h;
	Thu, 29 Oct 2026 08:18:34 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 29 Oct 2026 09:17:18 +0100
Subject: [PATCH v4] drm/imagination: Align rogue_fwif_hwrtdata to 64 bytes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-fix_imagination-v4-1-689745dd52ef@samsung.com>
X-B4-Tracking: v=1; b=H4sIAA0B42oC/3XOSwrCMBAG4KuUrI1kJq1NXXkPEQkxabNoKkkNS
	undnRYEpbj85/HNTCzZ6G1ix2Ji0Waf/BAolLuCmU6H1nJ/o8xQYAWIyJ1/Xn2vWx/0SLNcWSd
	MU1LPlIy27tHSyCqeL5Q7n8YhvtYDGZbqfysDBy60UUKjcxLqU9J9eoR2b4aeLVrGj3AQSlRbA
	UmoZQMapFENuK0gvwQQW0GSYOk/WTU1ojO/wjzPb4VZ0LQ0AQAA
X-Change-ID: 20251222-fix_imagination-8ef0c94122c4
To: Frank Binns <frank.binns@imgtec.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,  Donald Robson <donald.robson@imgtec.com>, 
	Sarah Walker <sarah.walker@imgtec.com>,  Alessio Belle
	<Alessio.Belle@imgtec.com>,  Matt Coster <opensource@mtcoster.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,  kernel
	test robot <lkp@intel.com>,  Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2756;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=JvFUP7flyqTbe0DcKzZ1qgU/tpsVC6tlbD1knLD9FIs=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWQ9ZowKeise9Fucc5e+ZeNaDomt8jlzd/wV3bmP1Tdui
	49gyDWFjlIWBjEOBlkxRZazG6ONJP8xPC0//vgXzBxWJpAhDFycAjCRx0sYGc6sSep53XNNnGdN
	6yqRnZY2DkVZM+ycdW3jxPU/J8Rq72ZkeNVZGVvwTa232VHkYMXZ55bL9v8rubFMYUb6pY8Pvin
	28wIA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261029081835eucas1p290190c4899f87b740d022b9db9bc361f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261029081835eucas1p290190c4899f87b740d022b9db9bc361f
X-EPHeader: CA
X-CMS-RootMailID: 20261029081835eucas1p290190c4899f87b740d022b9db9bc361f
References: <CGME20261029081835eucas1p290190c4899f87b740d022b9db9bc361f@eucas1p2.samsung.com>

Sparse (W=1) builds fail because `SIZE_CHECK(struct rogue_fwif_hwrtdata,
384)` expects 384 bytes, but the compiler generates a 336-byte
structure.

This is due to an alignment conflict: the inner member `cleanup_state`
requires 64-byte alignment, but the outer struct is explicitly marked
`__aligned(8)`.

While a non-sparse build implicitly pads the size to a multiple of 64, a
sparse build strictly respects the 8-byte outer alignment, resulting in
a size mismatch.

Fix this by aligning the entire structure to 64 bytes, which resolves
the contradiction and forces the correct 384 byte size on all builds.

Fixes: a26f067feac1 ("drm/imagination: Add FWIF headers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512131851.1WNXk3BC-lkp@intel.com/
Reviewed-by: Matt Coster <matt.coster@imgtec.com>
Reviewed-by: Luigi Santivetti <luigi.santivetti@imgtec.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
Changes in v4:
- Reworded the commit message to state that the size mismatch is reported
  by sparse (W=1) builds, not by regular GCC builds on RISC-V, as
  requested in v3 review. The commit message rework announced for v2 was
  never actually applied, so v2 and v3 went out with the v1 message.
- Picked up Matt's Reviewed-by from v1.
- No changes to the code.
- Rebased on latest master.
- Link to v3: https://lore.kernel.org/r/20260810-fix_imagination-v3-1-e512359722fc@samsung.com

Changes in v3:
- Cleaned up the changelog section by removing the accidental b4
  "EDITME" template from v2.
- No changes to the code or commit message.
- Rebased patch on latest master.

Changes in v2:
- Expanded the commit message to properly explain the root cause of the
  GCC alignment conflict on RISC-V vs ARM64, based on v1 feedback.
- No changes to the code.
---
 drivers/gpu/drm/imagination/pvr_rogue_fwif.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_rogue_fwif.h b/drivers/gpu/drm/imagination/pvr_rogue_fwif.h
index 5d590c4c25663e431601dd26944465b62c31526b..2f8daa93c9e6832bbeec7460275c4b803792cb02 100644
--- a/drivers/gpu/drm/imagination/pvr_rogue_fwif.h
+++ b/drivers/gpu/drm/imagination/pvr_rogue_fwif.h
@@ -2174,7 +2174,7 @@ struct rogue_fwif_hwrtdata {
 	bool geom_caches_need_zeroing __aligned(4);
 
 	struct rogue_fwif_cleanup_ctl cleanup_state __aligned(64);
-} __aligned(8);
+} __aligned(64);
 
 /*
  ******************************************************************************

---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20251222-fix_imagination-8ef0c94122c4

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

