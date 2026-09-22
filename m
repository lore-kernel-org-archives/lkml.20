Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0183B960F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047453; cv=none; b=rcMG2fA2Z8GYCEA6PSzbiTUbPdtlkNTZtEes5HjknM7jiOxfPPKTVTYtNUTGzYZIJ+H1ulDy8M59kM/RmuvUDWo3z2jVDS18K8dt/UTw76+TMcASpp9iyFWLeQg4AX1wlIBlEQcxsfhGUKKFK6oWNMVCu7qd8oPv5llDEtmyR94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047453; c=relaxed/simple;
	bh=ncRkxkkeAIbVD1Fahz40xlau2ePXTrC1LaSC/1ZaVZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NxC3FwmwmG3tZgZQvnmBedPBejvm3tj95aKhiXXMGa+CzG5j7eX/hCsH6B4OmSvAJw4785V2IeO/6roA6ZdmFEXskgSq8+OakO1hGzpaMqHj9qJr4a7SOyD1gj0ITU6Jr0qn+VH6GbDSkHEuY/CQNh3dtOJ8IWdZXXLfLbb6AHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=armXNzHc; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="armXNzHc"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-530fa0716f6so42777851cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047446; x=1790652246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDp7kCvGQJv7Gj/mubADb200WD9R0dbypDFk/xuiIQw=;
        b=armXNzHchuMt3s6lUUeJUD9lf+AKr1CRTU3NCvj06ezAF054Wg3nEIJiDwPuw817Ok
         7+I+X0WtnPtrwZeGB2Fx9smegxeCS2DmLe95feLbvfZiaKFSSqgpWixfouDQuDc0+6wE
         GCYqO3C4syFsZrCazgk+55BAfqRm/q4ZxXUFUNOKzsLtdgGnW7f8JKvpVUTqyU6/PYXS
         Qsrse8XlJY3o4Ry0+g23PW/Y/OIxPUTbX9+ED4efGOGCYUFVAvB1VeRvs4Ki5lmGL1oG
         1D+F0wRBW7Pc9m/nLMInpoD+aJZbl3iOUCUv5FNqjALVPNV5ww9/KnIUTCGiaCBM8wU7
         +V/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047446; x=1790652246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDp7kCvGQJv7Gj/mubADb200WD9R0dbypDFk/xuiIQw=;
        b=mR5LSCAvQrRtdiM3Y+CDcVHktpCZWmssIlIQ56q6uDmb8xJ12k5CHIsTe8cOCpAz2q
         IB83TRzEIbEzMna5DU/k6iJhaWfqLpemIjwSvuZC0lwc2+OfVLCr9Yx4Wc5N9zy/klUV
         aTUpZCZ0yJs5N+xiFsU/EIPCpCln0IvaUAC7bnFaCuSVc4Z6j6QIdSnxGH+G+9mfFOrg
         qf+QigkQriVUEg2/b+ati8yva042gtcPfEobFusXueMqTkmHmgleqCz5/Bjbo9Z9c1/c
         GZ00WX1SYRIOJX8FOocplG5hG4n9MIEfp9EmOAVCXAF7U6SiQrY0S3TaMlcPRvDaplTW
         918A==
X-Forwarded-Encrypted: i=1; AKwUvBwXDtukSylcEdnmO42njSpRQTI9NK507VmdZlNeo+anPNKk55h5vDr731WOhaF+GmV00MTU6ebiqltwPds=@vger.kernel.org
X-Gm-Message-State: AFuF++n5rkpHoAR6VfdNdVSOKpfufg77v0yjFth/ky902Utk/3K7ioyf
	2BzkbtG6M40D2rh/J0gimrbiaIuoMpnYx9a2al0T1yARHUtVfkVNcJA=
X-Gm-Gg: AYBFou3mRLajrFOZ/9hQH7vXZMwJ6ZGHSUMnEnqx10F5LrxhvV6OuYJvYvhcVS03K+R
	ePjT7u2sTHp3f+IMm1XYcdIyKNsIQuVdDrUHZg+nX8JP41QN2AEjelfBQnTvHcXcWgGor2b97bL
	iDSbqaj8odY9ad4dy1YvLup/GMH9vp090PVluc3nX+9B/Kg9jesD4cFlB1w4RPtHYJPP8ilrHZo
	mQ6OlJbTKOpw63sNXzXjbUXChXfZd6qF2F8ph4ihYhL5LHmzIz66JSk2YFuzPOEOoNgIdIsVLmI
	Gr0iya7QhIskXy6+WKArTOn/QmmhGiRjbKfCRbjaGHs4SNFOfR3FnRbPvSoTa6IPN0ipLKN7bVO
	88p5kKFBomPS/Q5Zll+7+OopY8JWqUrBfZQ/4W0moA9njk0V5zX62HX+ZM+yEb5B1C2OIqQ0Hbu
	GHhBodUw255FFld647P8udLGFu3oRHyGaxoyRRqj0y63PyMlrjCKNKwLc1attbfNDbQNo2lTTmy
	cBSI3TPLGDXOuXxLUYRmnaZt9mjndx1fGIyPi0NedZjaeupUDUiwC40jIEWSjPPh/Nz/iSdHHP4
	YBvTS5O2i31fWS9NfDEOQRWWU07cvZDl2PypwII=
X-Received: by 2002:ac8:5a86:0:b0:531:d21:5021 with SMTP id d75a77b69052e-532d8d35f7dmr36423011cf.13.1790047446387;
        Mon, 21 Sep 2026 20:24:06 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e196ef4csm2429671cf.28.2026.09.21.20.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:24:04 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: mtu3: Prevent dr_work rearm during teardown
Date: Mon, 21 Sep 2026 23:23:59 -0400
Message-ID: <20260922032359.687286-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ssusb_otg_switch_exit() drains otg_sx->dr_work with
cancel_work_sync().  A later queue_work() from ssusb_set_mode()
arms it again.  Callers that outlive the cancel are the role-switch
store, ssusb_id_notifier(), and the manual-DRD debugfs mode file.
The role switch is unregistered on the next line.  The extcon
notifier is devm-managed, and extcon_sync() invokes it after
dropping edev->lock, so unregister is not a barrier.  The mode file
is removed only after ssusb_gadget_exit(), ssusb_host_exit() and
ssusb_rscs_exit().

The late work calls mtu3_stop() or mtu3_start(), writes IPPC
registers and calls pm_runtime_get_sync().  dr_work is embedded in
the devm_kzalloc()ed struct ssusb_mtk.

disable_work_sync() rejects a later queue_work() and drains an item
already pending or running.  Exit does not enable the work again.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 18cfd7b85ced ("usb: mtu3: rebuild role switch flow of extcon")
Cc: stable@vger.kernel.org # 6.10+
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/mtu3/mtu3_dr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index ffa5b9401dad..262922057b13 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -326,6 +326,6 @@ void ssusb_otg_switch_exit(struct ssusb_mtk *ssusb)
 {
 	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
 
-	cancel_work_sync(&otg_sx->dr_work);
+	disable_work_sync(&otg_sx->dr_work);
 	usb_role_switch_unregister(otg_sx->role_sw);
 }

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0
