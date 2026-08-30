Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C436D234994
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788064812; cv=none; b=SGHym+wXhR01KF9U7u96WVUhuNg1Gb55ue1QUoBCFe/mUefxkB+bf1YOuw2LJCuC6fZZHcU2bwJ/p+nahgPwSJVR1+hYXTi1uw7YoltsHoDkr7ct3/GwJc8bPHhll/GIbIKUW5oD7ls3CfYodn6tfYxsQArxrQrSPSzGzWeXIU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788064812; c=relaxed/simple;
	bh=5WXDhizpxuVpd5R5IBrkKsXbw4WhGvB34q5YJxj82tM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jAuHpyxVUql8mbyh3z2rK/JTXx2oH2g/Ax9JGlM+HIN57LH2n62bZ8UmjwUI0Bp8cOJpWtQau1wreJaW0s5Yz1u0pvxlczR0YOpGl3HOCqYrilNt3MuotWbTE/7LEozu6kXXNDka7ZmbwN46c488mi9y8REA31JQvRUHaWKLv14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no; spf=pass smtp.mailfrom=optocloud.no; dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b=Bo47FJZ0; arc=none smtp.client-ip=109.224.244.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=optocloud.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b="Bo47FJZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=optocloud.no;
	s=protonmail; t=1788064805; x=1788324005;
	bh=5WXDhizpxuVpd5R5IBrkKsXbw4WhGvB34q5YJxj82tM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Bo47FJZ0G6CZ32n2MwMvAfkvwRyrJpCBAZraQRImk5P9d3buGWAauD47xhoieMg4W
	 PcVRqryIru2VXTKPrRgrs1ByO47zSFb6Cj+aorqFnw3m4iebFwtMaLFeVPusDiyqbq
	 94hR5WSWiZNYVkQXYcuKr2hPreX/iCu8sJYsSk4ZxDbD7QVOtmu351T3fmVhTRmLT0
	 FFA11etdZqtBcdu0visqD4E2aQB7RwTWa7E5QOgT2DCoHBiigBoZN1pzkEiQluFA+G
	 oRs52MWVptANDUDSHFm1RzYnlobVhBWPXl9QPzkm8mrSMPNgSCuUm24ytfyisxDF5J
	 Gk1n0rSsZaleQ==
Date: Sun, 30 Aug 2026 04:40:01 +0000
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
From: OptoCloud <git@optocloud.no>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Yazen Ghannam <yazen.ghannam@amd.com>, "x86@kernel.org" <x86@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] x86/mce: Reset MCA_SYND between bank scans
Message-ID: <6XMrR2i2tP3toFjOshJwvZ6agC3N8DSZi74aW-2DJwC5_rGPf1aT6nsZzd55MHD0nMwxx6x-NaFHU_OQaH0t8BdJcjWoBHkcAf-udzh5TKw=@optocloud.no>
Feedback-ID: 192797849:user:proton
X-Pm-Message-ID: f27e67f628f8034c3023be02accb6c5f8e97ba9a
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

machine_check_poll() and __mc_scan_banks() both reuse a single
struct mce_hw_err while iterating over the MCA banks. The record is
zeroed once before the loop; each iteration then resets only MISC
and ADDR.

On SMCA, mce_read_aux() writes SYND only when MCI_STATUS_SYNDV is
set. Nothing clears it again, so a bank that does not set SYNDV
inherits the SYND value read for the previous bank in the same
scan, and that stale value is printed and handed to the decoders as
if it belonged to the current error.

Reset SYND at the start of each iteration in both loops, alongside
the existing MISC and ADDR resets.

Found by code inspection; not reproduced on hardware.

Fixes: db819d60f672 ("x86/mce: Add support for new MCA_SYND register")
Cc: stable@vger.kernel.org
Signed-off-by: Eirik B=C3=B8e <git@optocloud.no>
---
 arch/x86/kernel/cpu/mce/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.=
c
index ab469605fc89..16183fa4ddc7 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -808,6 +808,7 @@ void machine_check_poll(enum mcp_flags flags, mce_banks=
_t *b)
=20
 =09=09m->misc =3D 0;
 =09=09m->addr =3D 0;
+=09=09m->synd =3D 0;
 =09=09m->bank =3D i;
=20
 =09=09barrier();
@@ -1347,6 +1348,7 @@ __mc_scan_banks(struct mce_hw_err *err, struct pt_reg=
s *regs,
=20
 =09=09m->misc =3D 0;
 =09=09m->addr =3D 0;
+=09=09m->synd =3D 0;
 =09=09m->bank =3D i;
=20
 =09=09m->status =3D mce_rdmsrq(mca_msr_reg(i, MCA_STATUS));
--=20
2.47.3
