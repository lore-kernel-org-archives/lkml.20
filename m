Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA56449F122;
	Mon, 21 Sep 2026 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997910; cv=none; b=i01jJ1lFYY2VB1IzbUgBAGPqW5e7+Se3BMnzWOgjqV//OJBwYl7XSe28EnzCgubnNJU9GWjq7B3sRlZphpBC932wwovC+kYZ0lNHgd+cVK0iziax1Xe9C45VDlBJS184CPpIt8aHcDEfm7pSpxPyWd3y9VXZ+Up548QcaGEz8W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997910; c=relaxed/simple;
	bh=INs6yTwJ2aXc2evGA740BxRIcgVOkFiUNnqB9hueM5A=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=At78GyF/liQpJp/8rGl8ehbDsf2apXyxGz0gwK8FVPdqBNxddRho/n5y3RjaAIBqga3lWZrzmpRq0dsFlXb2QvyKNVTbAvnP5ZyBW5PGoQMfiD0rrROB05pMB9QEMXWKnQ+DpOlu2wCdJpFi3oXqqNBDEuf29NYUHxlqiR+URtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no; spf=pass smtp.mailfrom=optocloud.no; dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b=YatXaDFf; arc=none smtp.client-ip=79.135.106.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=optocloud.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b="YatXaDFf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=optocloud.no;
	s=protonmail; t=1789997899; x=1790257099;
	bh=oZp52jeoE3zWBvBNXxk3p5EJ8gqPMCZzUtcRbR1jijk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YatXaDFfcI0ECwbkZ1Fes2OKVq8UTAlfqvC1Qg38ybWnNrHdSM8/hbsYsybBstyY4
	 Oc3IULEgblsQwrsK1FubiPn1/iaPj6zAzVgzAR1fD2VOCG6KZgGXLgrQmRFhcjDXD8
	 fPKBN8+CEf74kHxVgrRPhCAXG7R1arwnkbEc5n2FfG6igis6sseG+czdxrmbBtE7Zo
	 +BmswDwM1AtNdLTUskI0zkQUvSu7Mz9TklbDro25nAwhLwyz5fZu1l0JJda1lMG10H
	 zIqF9ltcSRw6lSCS7j976/zD16Lbnz4rBssqPo8pBgNmYgseWA3IPPvxe9947UcGb1
	 OZ/iowEPF4Q1A==
Date: Mon, 21 Sep 2026 13:38:12 +0000
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
From: OptoCloud <git@optocloud.no>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Yazen Ghannam <yazen.ghannam@amd.com>, Avadhut Naik <avadhut.naik@amd.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, "x86@kernel.org" <x86@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/2] x86/mce: Reset MCA_SYND1/2 and kflags between bank scans
Message-ID: <n489m-wELNDg-JxPbFni_X3f1c3kAR0ODpWqP-6B0YEZ_a_xs8eGi6BfU1J5AOS9dt13GpHGucYDJoPucZ0D5pezQwkFoX-Jm_vX7OH72vI=@optocloud.no>
Feedback-ID: 192797849:user:proton
X-Pm-Message-ID: 2593274b464494892eeea85d1548280679eb0676
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Eirik B=C3=B8e <git@optocloud.no>

machine_check_poll() and __mc_scan_banks() reuse a single
struct mce_hw_err across the whole bank scan. The record is zeroed
once before the loop. Each iteration then resets only MISC, ADDR and
SYND. Three more fields are written conditionally inside the loop and
never cleared again, so a later bank inherits them.

mce_read_aux() writes err->vendor.amd.synd1/synd2 only on SMCA, and
then only when MCI_STATUS_SYNDV is set, so a bank without SYNDV is
printed with the supplemental syndromes of an earlier bank in the
same scan.

A stale m->kflags changes what happens to the next bank:

  - smca_should_log_poll_error() sets MCE_CHECK_DFR_REGS when an
    error was taken from MCA_DESTAT rather than MCA_STATUS. A later
    bank in the same poll then reads MCx_DEADDR instead of MCA_ADDR
    if it has ADDRV, and amd_clear_bank() returns before writing 0 to
    MCA_STATUS, so MCI_STATUS_VAL stays set and the bank is logged a
    second time on the next poll.

  - mce_default_notifier() prints a record only if m->kflags is empty
    or print_all is set, and the record reaches the gen pool as it
    stands. A later bank that inherits MCE_CHECK_DFR_REGS is logged
    with a non-zero m->kflags and is not printed by the notifier
    chain.

Factor the per-bank clearing into mce_clear_hw_err_fields() and call
it from both loops.

Found by code inspection; not reproduced on hardware.

Fixes: d4fca1358ea9 ("x86/MCE/AMD: Add support for new MCA_SYND{1,2} regist=
ers")
Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Polling")
Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Eirik B=C3=B8e <git@optocloud.no>
---

Notes (amlog):
    Changes since v2:
    - Squashed the MCA_SYND1/2 reset and the ->kflags reset into one
      patch, with the ->kflags reset in mce_clear_hw_err_fields() (Yazen)
    - m->kflags is now cleared in __mc_scan_banks() as well, which it was
      not in v2
    - Subject prefix x86/mce/amd: -> x86/mce:
   =20
    Changes since v1:
    - Dropped Cc: stable (Yazen)
    - Added mce_clear_hw_err_fields() so the resets are not repeated in
      machine_check_poll() and __mc_scan_banks() (Yazen)
    - Reset the whole m->kflags field instead of just MCE_CHECK_DFR_REGS
      (Yazen)

 arch/x86/kernel/cpu/mce/core.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.=
c
index 16183fa4ddc7..e906c3f8e888 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -653,6 +653,22 @@ static struct notifier_block mce_default_nb =3D {
 =09.priority=09=3D MCE_PRIO_LOWEST,
 };
=20
+/*
+ * These fields are only filled in conditionally, so clear them before eac=
h
+ * bank to stop a bank inheriting the previous bank's values.
+ */
+static noinstr void mce_clear_hw_err_fields(struct mce_hw_err *err)
+{
+=09struct mce *m =3D &err->m;
+
+=09m->misc =3D 0;
+=09m->addr =3D 0;
+=09m->synd =3D 0;
+=09m->kflags =3D 0;
+=09err->vendor.amd.synd1 =3D 0;
+=09err->vendor.amd.synd2 =3D 0;
+}
+
 /*
  * Read ADDR and MISC registers.
  */
@@ -806,9 +822,7 @@ void machine_check_poll(enum mcp_flags flags, mce_banks=
_t *b)
 =09=09if (!mce_banks[i].ctl || !test_bit(i, *b))
 =09=09=09continue;
=20
-=09=09m->misc =3D 0;
-=09=09m->addr =3D 0;
-=09=09m->synd =3D 0;
+=09=09mce_clear_hw_err_fields(&err);
 =09=09m->bank =3D i;
=20
 =09=09barrier();
@@ -1346,9 +1360,7 @@ __mc_scan_banks(struct mce_hw_err *err, struct pt_reg=
s *regs,
 =09=09if (!mce_banks[i].ctl)
 =09=09=09continue;
=20
-=09=09m->misc =3D 0;
-=09=09m->addr =3D 0;
-=09=09m->synd =3D 0;
+=09=09mce_clear_hw_err_fields(err);
 =09=09m->bank =3D i;
=20
 =09=09m->status =3D mce_rdmsrq(mca_msr_reg(i, MCA_STATUS));
--=20
2.55.0

Cheers,
Eirik B=C3=B8e
