Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785354;
	b=hE3u3VnC5sy5xl1Z6x4gqHMK5KaAAwWk4uPFRwRkQXiQoLm3ai+ZmEeTplH9vn8DK4Rs
	 mDYz1clru3+4OHa6fLQfABGE2v6mEcz9FDVoM/qh3Iug25ALrQKex0z6oWgqU+IK/VsBS
	 Kekd0NYU7iy6oKjJHD9Ll5wDwr7uAxK6xBz0k1i2wDIrDROMnbkgLyUCuqOv7tVz2O8oN
	 3z3IFxwpLBNWXYz0hGhbncms/BzZ94Kgwh/uEFKJ8HNg5gNt5NWmdxDCABIcVcwQ9SCUN
	 uMdyIiGW/ZGc+rCKfKryaDt2qg2PyytQ07GjwS11no0OeoShyNz9+7Mvx994RGzdp/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785354;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=XM2mkysUWOsflw19FxDcHSfbtvN10NMJJ+Nz7r/kGkY=;
	b=HjmikI0B+oCFzfjqaRQVUPPR90CAHwgwLIZjGxMGO1V3vSGJDBAzedtTnNbTUTPeXmHH
	 qZczzUUjO1ZZRfYfaNgEGoXXqaauausIJrnnuA/xL9htLiqSl9wbcBVEOSRxCfXERYqLx
	 mvvBvKDcHDuKIBUcsLJycACMn6/hCqMdMIQ3ouHYpgiZGGWZwDF3VP7dmWLTxWKpCWkBu
	 jioVmPgV1h+HVfW8+yPNgyfADHuW2BG2zO/sDFMyQcXt0tef0oTbv+or0WadaFk2V0ZXj
	 nN0K3KXS/N/jTU9qS9cbz/xHzmVeTq7JgEsuKdIKy/47w78F9CYzauiS+yQOiBDrmWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="aOju/ycD";
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED672606EA7C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED672606EA7C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=aOju/ycD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792785351; x=1793044551;
	bh=XM2mkysUWOsflw19FxDcHSfbtvN10NMJJ+Nz7r/kGkY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aOju/ycDhcq5OYtIYGYMm/qsnsFAQ4gedeEaGRzwkY/WZY6Tt/KhAzf/XaXwppEu1
	 WdOlP+3ixSepZ6aOd/z0YBuvnQapr1SzBdB5Ldf7Zaq5V8+wl8b9nwNkLJyzvWVfW4
	 RAjebCy6DlSyjuw6K0logx2ySSjpjbYS1IpIePR1+hHD4o/jYhwH1MFUzOUYGIxv5E
	 9EiSQbCN6LrjvEJbe+hAMN+hu3DgON5qI9SyYntLfqOSPAusu0g4vNAbUlub2ZW0+O
	 OjAjRLq/cm4qkPvoiKXyc6y1jaGshTwxTMM56QvlI5H67u1cks7pAKNYfjZmqeZrns
	 PGbOLTCLOrovw==
Date: Fri, 23 Oct 2026 19:55:47 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v1 05/11] media: intel/ipu6: check irq_status mask before calling subdevice ISR
Message-ID: <20261023195446.22578-6-valerii.sokolov@pm.me>
In-Reply-To: <20261023195446.22578-1-valerii.sokolov@pm.me>
References: <20261023195446.22578-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: 7389176dd4dcde24ccdccd52a24cda03d6d47845
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In ipu6_buttress_isr(), ipu6_buttress_call_isr(adev[i]) is called at the
start of each loop iteration, before checking whether irq_status has the
corresponding auxiliary device interrupt bit (adev_irq_mask[i]) set.

As a result, the ISYS and PSYS ISRs run on every Buttress interrupt
regardless of its source, and their return value is then discarded by
the continue statement. For the ISYS this means ipu6_isys_isr() taking a
runtime PM reference, masking and unmasking the UNISPART interrupts and
draining the firmware response queue on interrupts not meant for it.

Check irq_status against adev_irq_mask[i] before calling
ipu6_buttress_call_isr(adev[i]).

Fixes: ab29a2478e70 ("media: intel/ipu6: add IPU6 buttress interface driver=
")
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/p=
ci/intel/ipu6/ipu6-buttress.c
index f1d236054c..debc4ac929 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -364,11 +364,12 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 =09=09writel(irq_status, isp->base + regs->irq_clear);
=20
 =09=09for (i =3D 0; i < ARRAY_SIZE(adev_irq_mask); i++) {
-=09=09=09irqreturn_t r =3D ipu6_buttress_call_isr(adev[i]);
+=09=09=09irqreturn_t r;
=20
 =09=09=09if (!(irq_status & adev_irq_mask[i]))
 =09=09=09=09continue;
=20
+=09=09=09r =3D ipu6_buttress_call_isr(adev[i]);
 =09=09=09if (r =3D=3D IRQ_WAKE_THREAD) {
 =09=09=09=09ret =3D IRQ_WAKE_THREAD;
 =09=09=09=09disable_irqs |=3D adev_irq_mask[i];
--=20
2.56.0


