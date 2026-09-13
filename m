Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D889636657B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789333746; cv=none; b=eNZFxUu5zda2rh0n68XWMUxtYCwsSGsPHMndSKLpCOWKmGVABxlKXxCFfDuc8taq/crSiScTgnnAWu9MXE+KcfhFmwltKn4aDIknwV6uEniQo2wl18leb97IN7fmSkCfmVWDiJTghVOHHa2wpAOuMQcDF7bQ1Vx/R1QTVG9bYP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789333746; c=relaxed/simple;
	bh=hpza5gQaEVXQ69SN8PAS4UtGZzUmazRr8gFB7uKht5c=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PWiePP9Xjqi7jSc8jcIvIimL7wz/T22wH07FodZRsMTDsNn0ptEx+SSuontcleMMDkapM6+1dPz7Yu+VPXGlUeNREeDj+noBhDHWBVS9a9Oa4m4Z/hcoe+GkPVh73Zoaj9HeRSeV25xeEPFH7wTpmhVPr4Nv1Bq6RpU4gazWNfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=rm2vMNab; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="rm2vMNab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789333741; x=1789592941;
	bh=GDHm+oYs40oe2FEBNdGtp6Ozo+b9a2HBUfZ2vnJxyrk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=rm2vMNabcQDQETl7f5V9m8F0FWCJNhm0a88yv1kOMD6rajhWQ8IEr6Krkk3jqx6XB
	 kF3Crr26mSxJz7bG0UjfHDO37jVhcCssnpV9Q/c5bbv+aXj7Qj/79sWcleEnEvr7hH
	 Knce61GDYKk2+wx9LnmBX6LrA+9o4oGJk6Clneut9LhtVLH+i6NcMmSkzx+Bi7cnZR
	 MXZmsrGRRF204wY9UEIXMNC3fC8ujSbSM4kTKYFRqZMb4lZmcmyoptiMDhPz3P9rxu
	 RtLzw7oJvWAx1yLT6cucVNgHAnUPSMxAvC3wMEXYxxAhfgSNe9NftacbsgzLjreibF
	 WF46exDkRYWFQ==
Date: Sun, 13 Sep 2026 21:08:55 +0000
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Bard Liao <bard.liao@intel.com>, Amaan Lalani <zlzzm2014@outlook.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] soundwire: dmi-quirks: drop the ghost RT1320 on the Surface Pro 11 (Intel)
Message-ID: <20260913210849.6446-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: f35380da33acda98db5c21e75963b1a6048311c0
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

Link: https://lore.kernel.org/linux-sound/20260830151516.44629-1-lsa.uz@pm.=
me/
Suggested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Suggested-by: Bard Liao <bard.liao@intel.com>
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v4: resent on its own. v3 was a two-patch series whose 1/2 had already been
    applied as 9b30521074f0, which makes the series awkward to pick up; thi=
s
    is the remaining patch.

    No code change since v3, and it still applies to dmi-quirks.c as that f=
ile
    stands today. Carries Pierre-Louis Bossart's Reviewed-by from the v3
    thread.

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


