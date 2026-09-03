Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB723101A5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 22:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788473493; cv=none; b=imQy4EbKMI7poCufmsLVo+sHWls1BQVd74itZcQ0d3hJxoR9VqPspqzkR79CVLG3rFu37PSM5xF2daWGy6PFr2pAmq3e0dTls6UWhJTdok7E/n5Cw0gYYnnW0EdpK7vQmNu2izCHsrZQkS6UmufRRHKFX1Dnnnux5lPxhOgfDF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788473493; c=relaxed/simple;
	bh=YnGTI7q2cNec7gsoE0wMEOZ6O5zVpzaKA8V3HwnRaww=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YKvugI7FOP9t1XUxiJhHMyvo37Y4+5wubProdXO4QWex7XcU9CArDFVKvbROwJwEuD4g5JhYEqkX6ayHFw9foPgD4SqrdzsbQwue1TXqs8uhwdbDdvI4SdqrZSWayxn6MjdrIFrxKukuLMbRqp7gOf8vBK5nSIUhIqWtWQ08VW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no; spf=pass smtp.mailfrom=optocloud.no; dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b=H83Vfpxk; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=optocloud.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b="H83Vfpxk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=optocloud.no;
	s=protonmail; t=1788473482; x=1788732682;
	bh=WjieKvHmhideiikWI8mxztM5+BpnZX/03eqkSiWPzPM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=H83VfpxkTtn8JCfoMaRFbFVXj/V6uAvhzOcKUotXuNAgXimAzZ9+qh9LkRc1yeQYc
	 s/KAnrcULtEV8x22IKgazyLzYbPSuvH9hj5wuexdWuu1djXDY7cQl00NKAr7IGFl5i
	 k+LEeIS7jVm/OKalyrkJFB8f4CWccaGPLJpFzV9kG3jDgUPJJhWIaZKi3CqUS2PzBm
	 5/Jk39Wz0234RfOlvFrfOIYyvU1tf0MEHEmwH/Lp3l56qiglM8RHV8MdAXGnz0BOHv
	 lYfKyOticREK3w2GJQu2eArbcqcF4rIGwTK6r8sA3ZAFRB32pTJDcXZHHO7fdIwdDu
	 Av5/jYnUi8+/w==
Date: Thu, 03 Sep 2026 22:11:18 +0000
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
From: OptoCloud <git@optocloud.no>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Yazen Ghannam <yazen.ghannam@amd.com>, "x86@kernel.org" <x86@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Subject: Re: [PATCH v2 2/3] x86/mce/amd: Reset MCA_SYND1/2 between bank scans
Message-ID: <Tb70x8vuy1sup6s1goM7aq62Y8Q1NZlRoBl2jMdaIPoglUvoPwXXAvTCpG5UWTcVhu1-YcVc6NHRgt9Eq3AAqxmOWq36lV0s2dzySiO-hVI=@optocloud.no>
In-Reply-To: <20260903203339.GB145182@yaz-khff2.amd.com>
References: <7EacjuP2vbN93ctW6NuNj0xNiJK0J17etJfHrSNAotd0fSdNc9c1ZKr957iB6gkmpUu_xLHdgrGczfvoZPoyJQerWGYRCEnQYI4gqkhPXKs=@optocloud.no> <20260903203339.GB145182@yaz-khff2.amd.com>
Feedback-ID: 192797849:user:proton
X-Pm-Message-ID: fb147f32bd7fe4bedd7d4e93d0d53bd0d751b97f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for the review, here's v2.

Same issue as the MCA_SYND leak, for the two supplemental AMD
syndrome registers. mce_read_aux() writes
err->vendor.amd.synd1/synd2 only when MCI_STATUS_SYNDV is set, and
nothing clears them between bank iterations in either
machine_check_poll() or __mc_scan_banks(). A bank without SYNDV can
inherit synd1/synd2 from an earlier bank in the same scan.

Factor the per-bank field clearing (MISC, ADDR, SYND, and now
SYND1/2) into a shared mce_clear_hw_err_fields() helper, called from
both loops, to avoid repeating the same resets at each call site.

Found by code inspection; not reproduced on hardware.

Fixes: d4fca1358ea9 ("x86/MCE/AMD: Add support for new MCA_SYND{1,2} regist=
ers")
Signed-off-by: Eirik B=C3=B8e <git@optocloud.no>
---
Changes since v1:
- Dropped Cc: stable (Yazen)
- Added mce_clear_hw_err_fields() helper function to avoid
  repetition in machine_check_poll() and __mc_scan_banks() (Yazen)

 arch/x86/kernel/cpu/mce/core.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.=
c
index 16183fa4ddc7..6fa15e19988e 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -653,6 +653,22 @@ static struct notifier_block mce_default_nb =3D {
 =09.priority=09=3D MCE_PRIO_LOWEST,
 };
=20
+/*
+ * mce_read_aux() only fills these fields when the matching status bit
+ * (MISCV/ADDRV/SYNDV) is set, so clear them before each bank to avoid
+ * inheriting a stale value from the previous bank in the scan.
+ */
+static noinstr void mce_clear_hw_err_fields(struct mce_hw_err *err)
+{
+=09struct mce *m =3D &err->m;
+
+=09m->misc =3D 0;
+=09m->addr =3D 0;
+=09m->synd =3D 0;
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
Cheers,
Eirik B=C3=B8e
