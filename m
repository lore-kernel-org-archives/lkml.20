Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BEE3A1683
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788079527; cv=none; b=qjidgOpsnirLVihVzKaHFaQ9e8likGlC10+lAuXnsNLgXnU3Z5iE/cDlopCGAEaw7sxUOHJNjZ73JRHcyadjFtwJC6rDak+29ch0ToT8/ZAt8dBS89Qlu2WhXUBmYrIMUR266x4cY3fKdsZTtr/7yRPPRF851/anq978eWZPCTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788079527; c=relaxed/simple;
	bh=lcs4zcrgdLIT3JD+m7JIIvdFU0tstU3E/FP3fDCC6aM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o4TVwnZXtMVI9XkPFHQfeadGoXakJ2KLLi8FZaqE8nzvt9bn/azOBPD0dJPgxvVOvkVOLUVCG+z6xB3onk3f1M+GJoIft+ZEG3uI6C8Jx78BBwvfn3GfNEV0aCyAVRN7vs2pLQKG/9dyjd6q/MUU/BNSwzdHuPt9jMUY8mUXCFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=oIQeFc4P; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="oIQeFc4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788079523; x=1788338723;
	bh=qLEuIV9WXMF8WA2Og6nH2usoaxxRB7X4vIDz5I7QZmU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oIQeFc4PK+OexnYPkcAATKV809YRpWFF2dBNDX3Xq9IM5zVwyMtu4bQa9g87Sb1vR
	 XOuBTbZHNy1dxb/aMy4to85hRLEyaDFinyzgORPNZTGbS7yP8EFJPdRdWZFCWko2Ux
	 mmpOHrrIDMccwTb+a1CIOTG3mN0td+P5pKLR1V8PxlyqTSwxid9zVO4fTH2nsgvq34
	 WKEMm5xkaXIRBXoOv2nwmhoLC6FTarZeR4+t1s1nvGgN2M2CvqEql58yfQ8J9D9tbe
	 U7KuGnpZsN/o1laIsb4hKHHL5K7owGNtKTHym2k6tgI1pv4c909ebdjJY6i5eq5Zq3
	 6HrqoFxvJQPEQ==
Date: Sun, 30 Aug 2026 08:45:20 +0000
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] soundwire: dmi-quirks: drop the ghost RT1320 on the Surface Pro 11 (Intel)
Message-ID: <20260830084500.6123-3-lsa.uz@pm.me>
In-Reply-To: <20260830084500.6123-1-lsa.uz@pm.me>
References: <20260804225853.31585-1-lsa.uz@pm.me> <20260830084500.6123-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: c887decb40059c5d4142f26eb1a2606818aca2dc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Microsoft Surface Pro 11 for Business (Intel, Lunar Lake) carries a
single physical RT1320 amplifier on link 0 and describes it twice:

  SWRA  _ADR 0x000030025D132000   SDCA class 0
  SWRB  _ADR 0x000030025D132001   SDCA class 1

Identical apart from the class id: same link, same manufacturer, part and
version, same unique id 0. The part reports class 1, so only SWRB
enumerates. SWRA never attaches on any boot or firmware version tested,
including the November 2025 bundle.

The ghost is not harmless. It consumes an amplifier index in
find_acpi_adr_device(), so the real part is named "rt1320-2" and the stock
sof-soundwire UCM profile enables switches on a device that is not there.
Its endpoints also reach create_sdw_dailink(), which builds DAI link names
from link id and function type alone; the ghost declares the same SmartMic
function as the real part, so the card fails to register at all:

  sysfs: cannot create duplicate filename
    '.../sof_sdw/SDW0-Capture-SmartMic'
  kobject_add_internal failed for SDW0-Capture-SmartMic with -EEXIST
  sof_sdw sof_sdw: probe with driver sof_sdw failed with error -12

Remap its _ADR to zero so sdw_acpi_find_slaves() never creates the
peripheral, which is how ghost devices are handled already - see
ghost_realtek and global_ghost_adr in this file. Both failures then
disappear, because neither path is reached.

Matched on DMI_PRODUCT_SKU rather than the product name. A later batch of
the same model could carry a different RT1320 version, which would change
the _ADR; keying on the SKU keeps this remap to the hardware it was
verified on, and follows dell_sku_0A3E above.

Suggested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Suggested-by: Bard Liao <bard.liao@intel.com>
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v2:
 - new in v2. Replaces v1's 2/3 (sdw_utils runtime presence test) and 3/3
   (SOF/Intel amp-index dedup) with a single remap at enumeration, per
   Pierre-Louis Bossart's suggestion.
 - matched on DMI_PRODUCT_SKU rather than the product name, per Bard Liao:
   a later batch could carry a different RT1320 version and therefore a
   different _ADR.
 drivers/soundwire/dmi-quirks.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.=
c
index d75037558..8b3c5c8d1 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -111,6 +111,25 @@ static const struct adr_remap ghost_realtek[] =3D {
 =09{}
 };
=20
+/*
+ * The Microsoft Surface Pro 11 (Intel) describes its single physical RT13=
20
+ * amplifier twice on link 0, as two _ADR entries differing only in SDCA c=
lass
+ * id and sharing the same unique id. Only the class 1 entry enumerates; t=
he
+ * class 0 entry is a ghost.
+ *
+ * Matched on the product SKU rather than the product name: a later batch =
of the
+ * same model could carry a different RT1320 version, which would change t=
he
+ * _ADR. Keying on the SKU keeps this remap to the hardware it was verifie=
d on.
+ */
+static const struct adr_remap microsoft_sp11_intel[] =3D {
+=09/* ghost rt1320 on link0 */
+=09{
+=09=090x000030025d132000ull,
+=09=090x0000000000000000ull
+=09},
+=09{}
+};
+
 static const struct dmi_system_id adr_remap_quirk_table[] =3D {
 =09/* TGL devices */
 =09{
@@ -207,6 +226,15 @@ static const struct dmi_system_id adr_remap_quirk_tabl=
e[] =3D {
 =09=09},
 =09=09.driver_data =3D (void *)ghost_realtek,
 =09},
+=09/* LNL devices */
+=09{
+=09=09.matches =3D {
+=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_SKU,
+=09=09=09=09=09"Surface_Pro_11th_Edition_With_Intel_For_Business_2103")
+=09=09},
+=09=09.driver_data =3D (void *)microsoft_sp11_intel,
+=09},
 =09{}
 };
=20
--=20
2.50.1 (Apple Git-155)


