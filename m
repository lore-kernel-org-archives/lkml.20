Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740263;
	b=q3UmKRxq8jXA6A0eOzgmD2BOIK7Wstxw418qr3cd+5Hdr/qzyDPBzIC2x0m/jYnVIull
	 Y5l10Nd8febHFTNDqdr3iA7+oe+iSOU9oI/ZDyYqDpLvdKbUzUJA/s1EwBbLnNLcEMA1t
	 BvzMBsh8dTWnhWA2/rI/YgosrfxgpNZrcUx6QlFTrGuxiW7FjR12iReYsvr3JWlCNKpVJ
	 MepmjhGimXx2cNsngLOskiOCKyve6iVF011SBRULtklLO5qyrfOU3wGx8mpzT25+DjBjM
	 CcyXE8qrJTYTaYK9NBkMISzk3bV3hDigbxEiHrNDBX2syEDWclFFzrEntnmthr4MC8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740263;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=hNifrZ/WZEw+wmjcAsPUampZoMi4WcDNpsWEtFvOZeU=;
	b=q+X39e2fqa+zngl6jfcoJ345hsbqYRn3TW1asqBxCP4d15Bl/5PneQX0BwfG14WFjJnx
	 xo9M1kvcohr2M4wW6nVPOArR9NnAV+jkOEOr43/ryWlPfiPlyAXeXx2bBRcoN1S817Ix2
	 dKo68/tOLV7Y+49hlelCci8rwFB6HpNcvaAmptepmPfGJXrYK9CJvyHuHbmazE7Elm7gC
	 L3VpJ556UCDLhV1PnmatVJTIxublaMc5KkfNitMg3/7OZ/vkjzeCRwOATUxJ7/K/ZclKr
	 LgxsLjOdEgE0UBzCdt1yGnK5Ek8z5H/OklIEUmi+5EA3Zww0Q07fmr9+2fIbhJhvASg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=YcGLNJCD;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC84606A33A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EC84606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=YcGLNJCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793740260; x=1793999460;
	bh=hNifrZ/WZEw+wmjcAsPUampZoMi4WcDNpsWEtFvOZeU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YcGLNJCDtNtZSK3ucVFu90Sv0jk/Ky/IzlBRwgiK3FhcmK00RPMja2CVJuiOXzgzZ
	 IRZOoS34uRjnkWKlecI5/irTynaU+q+oZ4Ho1fWIPoYAIMC97YKrxyBsOxz+lSLE7K
	 s/s60nQF4C0+dYORvGtRRZgKDXsyEvduZvrOF/39KAm06bynVpsGn30eDfxkFsxZIY
	 PL7OtmXkWmgxk2GPpzD2nPlJ8tV29HbFQP/N2wUBofayvQd/KWvWfCpJaD/DboyAei
	 TIqPc0AP/k+/MZLOMCC6q3rPptj0+ITznDnWcKUvVcFBdIKJRzvBwvmo/JsNgkqKfc
	 MEvPVTlHtYxLQ==
Date: Tue, 03 Nov 2026 21:10:55 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v2 05/11] media: intel/ipu6: check irq_status mask before calling subdevice ISR
Message-ID: <20261103211031.1573726-6-valerii.sokolov@pm.me>
In-Reply-To: <20261103211031.1573726-1-valerii.sokolov@pm.me>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: 5ba67b23033f4b315fb08fb8e4d7ecd593201f77
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
Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>
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


