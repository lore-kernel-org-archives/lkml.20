Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D992949E5C1;
	Mon, 21 Sep 2026 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997839; cv=none; b=dPNEcv+UnvSJExNexl4EEb+Wsh3wEmquM7FYOTssKwjKlMBLtkQNwdrntm1Z7geEOOfdosBSQJ6etAPecyfXrgckuBM1S+03PgkrJWu+i/NJmmCjToPfEhAGN8r8C4oELYWIzao8UUIrKttPK2UPfylMJ3E+UGYJ7fukyZppEdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997839; c=relaxed/simple;
	bh=GoENAPf9dFiYUYklg7AsBKBG3mFt3S6OJLXYWWp28cU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rcC3+XmB0P6GkYxIdNQ95HEiSMRDlD+4TFhD42CkChDdn+oGQIUnsbPUR66mr9n/qec2D23R5bNwhCt7hdGZrPcm6MomoHg1Tc6bQYyugMFKE5hYxpsPIuCSirPdJK9GyVW2sf1Jgjywnf+FrBEq5kbAhLMAgciy2Hjj+S5Chhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no; spf=pass smtp.mailfrom=optocloud.no; dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b=HfsoEXIH; arc=none smtp.client-ip=109.224.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=optocloud.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b="HfsoEXIH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=optocloud.no;
	s=protonmail; t=1789997829; x=1790257029;
	bh=x6wUzIlb3dtSGcoG7a+WpQVXahNZmkRSC3HZl+bJRdg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=HfsoEXIHJueU5R38Pp065PIa9ExcBtXpG9uJunXZYX6xhGWaU3371wMEepaOt3orx
	 SLvLld6ODt2XpDdpa+es5HihA9pcvXDntCWZeNkiefLjoP0sXygboJg3WNrz6PFkxb
	 /kVrUm9TpQA8Kgpno9f2BDr05L0w+zbmJ8d69OU0mPNYXSu0JGwAJtq8DoK+LahPyU
	 vzgpipapyiMLK4+GDD/uMyusd4QhQ+aYoBxfaQjkuezkhy1DTRqzPhXLI1c0+no8/l
	 tBO1lBDeKKAhZtofNy7IWWsDQrtK5c0Cp2K1zdb2wBdFel15NVtznxYXmLZ5lV7x+S
	 dDpIBOfRTtoEw==
Date: Mon, 21 Sep 2026 13:37:02 +0000
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
From: OptoCloud <git@optocloud.no>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Yazen Ghannam <yazen.ghannam@amd.com>, Avadhut Naik <avadhut.naik@amd.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, "x86@kernel.org" <x86@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/2] x86/mce: Reset MCA_SYND between bank scans
Message-ID: <zmLt5S3aLNcgxhqRI7yuVhN-gNY-W2KFuNz9F9gU4jvyJuY4LGM41p4WuEVus3-_3fs8B9sMA0143PG2urpBRYKlSCxuUQxV401F6USx4DA=@optocloud.no>
Feedback-ID: 192797849:user:proton
X-Pm-Message-ID: cab022f29a8d9cdad8f31f10022429e94147355f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Eirik B=C3=B8e <git@optocloud.no>

machine_check_poll() and __mc_scan_banks() both reuse a single
struct mce_hw_err while iterating over the MCA banks. The record is
zeroed once before the loop. Each iteration then resets only MISC
and ADDR.

On SMCA, mce_read_aux() writes SYND only when MCI_STATUS_SYNDV is
set. Nothing clears it again, so a bank that does not set SYNDV
inherits the SYND value read for the previous bank in the same
scan, and that stale value is printed and handed to the decoders as
if it belonged to the current error.

Decoders are expected to ignore MCA_SYND when SYNDV is clear, so
the stale value is cosmetic.

Reset SYND at the start of each iteration in both loops, alongside
the existing MISC and ADDR resets.

Found by code inspection; not reproduced on hardware.

Fixes: db819d60f672 ("x86/mce: Add support for new MCA_SYND register")
Signed-off-by: Eirik B=C3=B8e <git@optocloud.no>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
---

Notes (amlog):
    No v2 of this patch was sent. The numbering follows the series.
   =20
    Changes since v1:
    - Dropped Cc: stable (Yazen)
    - Picked up Yazen's Reviewed-by

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
2.55.0

Cheers,
Eirik B=C3=B8e
