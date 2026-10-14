Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11AF50B8B4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982919; cv=none; b=V+s+aEzkkNsUYWbxLHH0XEeYVg8HhLWX06XX6l+1Yg8JI3pkXsoOGhFPTkZRhwa+ztVtHRjtfHPPoFEZnLWZrbZNiVY9rLaJMhREmLmtiUbOUxi4D8NQvtjD8YU9U17YZmGAcDwdsOLe+gkOy++aOKyv25W3AdkH/xbpQ6Kf8GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982919; c=relaxed/simple;
	bh=QxnuotfL6OA5AWjvRVfw9V3d+pUNeZ4eWbidEiMYbUk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cXP6YLjz0ErG9xkOA3ho6ROL2UYfR77LDzjAVhcO5WXHG7PSUWsvIEOU+t/cmY/ylbIYeXRbfSK8tDXXTInFudZCI/PdKQ/iN54XBhHhF3UOmRJ+izREMM0l3osJ4ZK1CFOvLXhcWw3iwICDYAfcBCqgKNfzjtMhdeTMT+HFcRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no; spf=pass smtp.mailfrom=optocloud.no; dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b=al6+Q7Z4; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=optocloud.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b="al6+Q7Z4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=optocloud.no;
	s=protonmail; t=1791982908; x=1792242108;
	bh=cdjVAUgtMonI2bwIq12N0u76ImAwxdqlAkmP6wMoH6E=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=al6+Q7Z4zfoY5LvsybghcP9N0yevo43x+2PEhfAAUjPupFRJ8ikAFVbfo6VEftu8o
	 MFDaOa+TXH2ICXg+oclR6omRfWgBIBxnqbW6vr3NwqzTbgEI18+tVSqcz+5DpBqt5P
	 Exr/TfNS8nUVF93BgBUb/NhaP+8WmHt4aRPtL/eHgK0LQ0LNBko/0lnxnylQtPs0oJ
	 XRA7FakBDfC8LpSLqhOjIDjASLdpVAZBilKYEhQQPJm1h0AU6UvUVl/AxmC9dQ9e1G
	 TbrwsjVC+fkYS1O7kOAgZyiIOmP5hRc7TlxpIcCm7zZGN/nSb5xZJmag+meYBYOARV
	 f8anxkKvs8W7g==
Date: Wed, 14 Oct 2026 13:01:39 +0000
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
From: =?utf-8?Q?Eirik_B=C3=B8e?= <contact@optocloud.no>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Yazen Ghannam <yazen.ghannam@amd.com>, Avadhut Naik <avadhut.naik@amd.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, "x86@kernel.org" <x86@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v4] x86/mce: Reset stale per-bank state between bank scans
Message-ID: <kUFp15ffSyDl005h7gLuz1YQ_jDrCgR96A_Q5mxzpXl2BmMNfFHo8hivkv7Qx6NZ6M__9iM0s2nFwDnjcBO_wcJ9-jHHIp8IrgfylJ0av6k=@optocloud.no>
Feedback-ID: 192797588:user:proton
X-Pm-Message-ID: 45bd941e8e135777a6b3901e563c8fb16efa6fda
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
once before the loop; each iteration then resets only MISC and ADDR.
Four more fields are written conditionally inside the loop and never
cleared again, so a later bank inherits them.

On SMCA, mce_read_aux() writes SYND and synd1/synd2 only when
MCI_STATUS_SYNDV is set, so a bank without SYNDV is printed with the
syndromes of an earlier bank in the same scan. Decoders are expected
to ignore them when SYNDV is clear, so the stale values are cosmetic.

A stale m->kflags has two effects on a later bank:

  - smca_should_log_poll_error() sets MCE_CHECK_DFR_REGS when an
    error was taken from MCA_DESTAT. A later bank with ADDRV then
    reads MCx_DEADDR instead of MCA_ADDR, and amd_clear_bank()
    returns before clearing MCA_STATUS, so that bank is logged a
    second time.

  - mce_default_notifier() prints only when m->kflags is empty, so
    unless print_all is set, a bank that inherits the bit is not
    printed by the notifier chain.

Factor the per-bank clearing into mce_clear_hw_err_fields() and call
it from both loops. Reset the vendor union as a whole so later
additions are covered.

Found by code inspection; not reproduced on hardware.

Fixes: db819d60f672 ("x86/mce: Add support for new MCA_SYND register")
Fixes: d4fca1358ea9 ("x86/MCE/AMD: Add support for new MCA_SYND{1,2} regist=
ers")
Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Polling")
Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Eirik B=C3=B8e <git@optocloud.no>
---

Notes (amlog):
    Changes since v3:
    - Dropped v3 1/2; mce_clear_hw_err_fields() covers it, so this is a
      single patch (Yazen)
    - Reset the vendor union in one step instead of synd1/synd2 by name
      (Yazen)
    - Aligned the assignments on '=3D' (Yazen)
    - Picked up db819d60f672 as a third Fixes: from the dropped patch
    - Dropped Yazen's Reviewed-by; it was given on the dropped patch
    - Rebased onto current master
   =20
    Changes since v2:
    - Squashed the synd1/2 and ->kflags resets into one patch, with the
      ->kflags reset in the helper (Yazen)
    - ->kflags now cleared in __mc_scan_banks() too
    - Subject prefix x86/mce/amd: -> x86/mce:
   =20
    Changes since v1:
    - Dropped Cc: stable (Yazen)
    - Added mce_clear_hw_err_fields() (Yazen)
    - Reset all of ->kflags instead of just MCE_CHECK_DFR_REGS (Yazen)

 arch/x86/kernel/cpu/mce/core.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.=
c
index 39f238952e14..6df932c53e8e 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -653,6 +653,21 @@ static struct notifier_block mce_default_nb =3D {
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
+=09m->misc     =3D 0;
+=09m->addr     =3D 0;
+=09m->synd     =3D 0;
+=09m->kflags   =3D 0;
+=09err->vendor =3D (union vendor_info){ };
+}
+
 /*
  * Read ADDR and MISC registers.
  */
@@ -806,8 +821,7 @@ void machine_check_poll(enum mcp_flags flags, mce_banks=
_t *b)
 =09=09if (!mce_banks[i].ctl || !test_bit(i, *b))
 =09=09=09continue;
=20
-=09=09m->misc =3D 0;
-=09=09m->addr =3D 0;
+=09=09mce_clear_hw_err_fields(&err);
 =09=09m->bank =3D i;
=20
 =09=09barrier();
@@ -1345,8 +1359,7 @@ __mc_scan_banks(struct mce_hw_err *err, struct pt_reg=
s *regs,
 =09=09if (!mce_banks[i].ctl)
 =09=09=09continue;
=20
-=09=09m->misc =3D 0;
-=09=09m->addr =3D 0;
+=09=09mce_clear_hw_err_fields(err);
 =09=09m->bank =3D i;
=20
 =09=09m->status =3D mce_rdmsrq(mca_msr_reg(i, MCA_STATUS));

base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
--=20
2.56.0

Cheers,
Eirik B=C3=B8e
