Received: from mail-4399.protonmail.ch (mail-4399.protonmail.ch [185.70.43.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4CE2BE7A7
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788064990; cv=none; b=jj1r7eOPO1qBQ/L9N1qQ99uiCxleV6h8oE62YzaCdpuYuyOUNh+/7NHGW1XyIPqDcMbBabdoa5KhaXrF5nk70KcljQ7lA+aFV+v4Y0TSkU6BEZWsKUls7eUPH4r+qPoJihDZC6qEAgK0x44gxDFkp7U9N1SbfGoeRfieJE5Wg4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788064990; c=relaxed/simple;
	bh=qgiOqnVHrnbJlooRmY6T3DG7Cg9vDQsL3SwxKmFOo14=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KYfFQslMp+Oxsk9miPYDFeuumMJj3Kyo1AojrUIWzWrWYSJP9rmSRYvo8sZeKV/VG/RqQz0Os8cl8jyhwaoK544B5VEwfsdS7kpg1OqGWPplx/kUY50UJsBq2giBOcV5zdxMDtp+DjR0jKBiIlHq9Jp43DrfERv85zsRXqfMINQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no; spf=pass smtp.mailfrom=optocloud.no; dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b=pdUsezRZ; arc=none smtp.client-ip=185.70.43.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=optocloud.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=optocloud.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=optocloud.no header.i=@optocloud.no header.b="pdUsezRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=optocloud.no;
	s=protonmail; t=1788064980; x=1788324180;
	bh=qgiOqnVHrnbJlooRmY6T3DG7Cg9vDQsL3SwxKmFOo14=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=pdUsezRZ6YYdXUkm4I7y5aG8dGb1KVB21WYua+dzFxuHoUmyeq5hRMieMqcUGhERT
	 wu0oHZjyP089WlhseQdxnqGbBB/ETQb02Ypf5ON1RTAGovcCMT3qWOEaqeixokoltD
	 NKzJaJcb031xBgpeMlOPxE6Qk1KqqKaLR/T4/UbCVob++N35LMbUpPRElmLWHWOgGN
	 L2jgbRjY97/DPNpoNykPoX0zoAIrv8dMDLx+KQdSzL/hns7e3PanT7YV69WJnZ4dy1
	 6hBK8517jsItLtLyPcMaDNXVMmyQxxig3QNfH9uPxnl0jk2JbmejmvtYvvcJCW5h8z
	 NBR51XbGuwZSQ==
Date: Sun, 30 Aug 2026 04:42:54 +0000
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
From: OptoCloud <git@optocloud.no>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Yazen Ghannam <yazen.ghannam@amd.com>, "x86@kernel.org" <x86@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Subject: [PATCH 2/3] x86/mce/amd: Reset MCA_SYND1/2 between bank scans
Message-ID: <7EacjuP2vbN93ctW6NuNj0xNiJK0J17etJfHrSNAotd0fSdNc9c1ZKr957iB6gkmpUu_xLHdgrGczfvoZPoyJQerWGYRCEnQYI4gqkhPXKs=@optocloud.no>
Feedback-ID: 192797849:user:proton
X-Pm-Message-ID: fd7114a9c9b7f20e913817a48baad6248489f775
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Same issue as the MCA_SYND leak, for the two supplemental AMD
syndrome registers. mce_read_aux() writes
err->vendor.amd.synd1/synd2 only when MCI_STATUS_SYNDV is set, and
nothing clears them between bank iterations in either
machine_check_poll() or __mc_scan_banks(). A bank without SYNDV can
inherit synd1/synd2 from an earlier bank in the same scan.

Reset both fields at the start of each iteration in both loops.

Found by code inspection; not reproduced on hardware.

Fixes: d4fca1358ea9 ("x86/MCE/AMD: Add support for new MCA_SYND{1,2} regist=
ers")
Cc: stable@vger.kernel.org
Signed-off-by: Eirik B=C3=B8e <git@optocloud.no>
---
 arch/x86/kernel/cpu/mce/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.=
c
index 16183fa4ddc7..e4e588d02a18 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -809,6 +809,8 @@ void machine_check_poll(enum mcp_flags flags, mce_banks=
_t *b)
 =09=09m->misc =3D 0;
 =09=09m->addr =3D 0;
 =09=09m->synd =3D 0;
+=09=09err.vendor.amd.synd1 =3D 0;
+=09=09err.vendor.amd.synd2 =3D 0;
 =09=09m->bank =3D i;
=20
 =09=09barrier();
@@ -1349,6 +1351,8 @@ __mc_scan_banks(struct mce_hw_err *err, struct pt_reg=
s *regs,
 =09=09m->misc =3D 0;
 =09=09m->addr =3D 0;
 =09=09m->synd =3D 0;
+=09=09err->vendor.amd.synd1 =3D 0;
+=09=09err->vendor.amd.synd2 =3D 0;
 =09=09m->bank =3D i;
=20
 =09=09m->status =3D mce_rdmsrq(mca_msr_reg(i, MCA_STATUS));
--=20
2.47.3
