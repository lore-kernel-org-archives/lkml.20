Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036AD48A8C4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352493; cv=none; b=DBZSS2xy1098ppX9Ja75LwZNLHmk/ATS0rnzuYaqQKyHubhA54CI9uZzOwl4cv3Ayv93cZHxogY+00xc9FYCjgIuSuBwoXGnmd8DgMZsUrYBpy06N68jKPfWUU8ZUwLL67yovYGRzaKH7rbDefG1ALwTT/EvO0us6/h0erSa4Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352493; c=relaxed/simple;
	bh=bLm0ySQOMsgpTTTaqr5rs3M4eKG7B8qeNk91g7KG1Vc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BvuKDZ/C3q/mt69+iOQYcB9+z2QeQRKt2AFNkR06N7ghcbkcfAXhDFSzXhjuRyVUXljV4HFGm24atD1+jkvelpyqO997efNN0OrHjgbacsduikxnh3j5/o0aLmZhA4z/1HJ61E2p6P7H0wzItVQJLK53+mm++3Zn62tFuU+ELPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works; spf=pass smtp.mailfrom=empyreal.works; dkim=pass (2048-bit key) header.d=empyreal.works header.i=@empyreal.works header.b=YxagJdIo; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=empyreal.works header.i=@empyreal.works header.b="YxagJdIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1788352488; x=1788611688;
	bh=9Np8DWLpuQ1rRZUMmMGF6LiNN8JJ6X6W5GuPnYtHZqI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YxagJdIoRy72LJmBqMaPxu3Cs9M2sFB51VyRBp4aY1vW49EfxuKiCaRyHiPW2rqS7
	 V6v3dxMgisetHy06ygGQQV5uAxcnlT1CE4rfukHrFNMApwzUwe5UqWI1vwqdlXKi6T
	 pZcNUCxWsdxHbUkeoFoBggSLR3DO65smvTU/45Tt1rpikGES8zfsd+lba9gCj/GGp0
	 CdUqAbl2nRV9GcuKPyTfLZFnbIMC8xfylLTLrAYB6Rf2RGoQO3KaLvv16i1fOJjRNy
	 tElasYuHQ/72Xld+mf8u2V2MP9SVZcav+w/fMxsZWkcpLmLhj1nXdK1zzuknAUPfts
	 6hSPBrFJWfR6w==
Date: Wed, 02 Sep 2026 12:34:43 +0000
To: linux-usb@vger.kernel.org
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com, Sanath.S@amd.com, Basavaraj.Natikar@amd.com, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] thunderbolt: Test ring interrupt warning after host reset
Message-ID: <20260902-thunderbolt-2-2fdc1c1b@empyreal.works>
In-Reply-To: <20260902-thunderbolt-cover-2fdc1c1b@empyreal.works>
References: <20260902-thunderbolt-cover-2fdc1c1b@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 1d297b7de060c95bc1fcd1bc78dba9c3d1aa0054
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Cover the warning decision independently of MMIO by constructing a ring
and NHI generation pair. Verify that duplicate enables always warn,
duplicate disables without an intervening reset warn, a disable after a
reset does not warn, and an update that changed the register never
warns.

Expose the predicate only in KUnit builds through VISIBLE_IF_KUNIT; it
remains private in production builds and is not exported outside the
Thunderbolt module.

The cases were verified under UML KUnit.

Signed-off-by: Andrei Rusu de Castro <arc@empyreal.works>
---
 drivers/thunderbolt/nhi.c  |  4 +-
 drivers/thunderbolt/nhi.h  |  4 ++
 drivers/thunderbolt/test.c | 82 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index f56590100aef..d768a84adaab 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -21,6 +21,8 @@
 #include <linux/string_choices.h>
 #include <linux/string_helpers.h>
=20
+#include <kunit/visibility.h>
+
 #include "nhi.h"
 #include "nhi_regs.h"
 #include "tb.h"
@@ -86,7 +88,7 @@ static void nhi_clear_interrupt(struct tb_nhi *nhi, int r=
ing)
  *
  * Return: %true if the caller should warn about the no-op update.
  */
-static bool
+VISIBLE_IF_KUNIT bool
 nhi_ring_interrupt_should_warn(const struct tb_ring *ring, bool active,
 =09=09=09       bool unchanged)
 {
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index f72d6b274501..393bd831375f 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -37,6 +37,10 @@ irqreturn_t ring_msix(int irq, void *data);
 int nhi_probe(struct tb_nhi *nhi);
 void nhi_shutdown(struct tb_nhi *nhi);
 void nhi_reset_interface(struct tb_nhi *nhi);
+#if IS_ENABLED(CONFIG_KUNIT)
+bool nhi_ring_interrupt_should_warn(const struct tb_ring *ring, bool activ=
e,
+=09=09=09=09    bool unchanged);
+#endif
=20
 extern const struct dev_pm_ops nhi_pm_ops;
=20
diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 05652ee82fbf..3ccdd967396b 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -9,6 +9,7 @@
 #include <kunit/test.h>
 #include <linux/idr.h>
=20
+#include "nhi.h"
 #include "tb.h"
 #include "tunnel.h"
=20
@@ -3095,6 +3096,83 @@ static void tb_test_property_merge(struct kunit *tes=
t)
 =09tb_property_free_dir(dir1);
 }
=20
+static struct tb_ring *alloc_interrupt_test_ring(struct kunit *test,
+=09=09=09=09=09=09 int nhi_generation,
+=09=09=09=09=09=09 int ring_generation)
+{
+=09struct tb_nhi *nhi;
+=09struct tb_ring *ring;
+
+=09nhi =3D kunit_kzalloc(test, sizeof(*nhi), GFP_KERNEL);
+=09if (!nhi)
+=09=09return NULL;
+
+=09ring =3D kunit_kzalloc(test, sizeof(*ring), GFP_KERNEL);
+=09if (!ring)
+=09=09return NULL;
+
+=09ring->nhi =3D nhi;
+=09atomic_set(&nhi->reset_generation, nhi_generation);
+=09ring->reset_generation =3D ring_generation;
+
+=09return ring;
+}
+
+static void tb_test_ring_interrupt_warn_duplicate_enable(struct kunit *tes=
t)
+{
+=09struct tb_ring *ring;
+
+=09/* Enabling an already enabled interrupt is always a driver bug */
+=09ring =3D alloc_interrupt_test_ring(test, 7, 7);
+=09KUNIT_ASSERT_NOT_NULL(test, ring);
+=09KUNIT_EXPECT_TRUE(test, nhi_ring_interrupt_should_warn(ring, true, true=
));
+
+=09/* Including when the host interface was reset in between */
+=09ring =3D alloc_interrupt_test_ring(test, 8, 7);
+=09KUNIT_ASSERT_NOT_NULL(test, ring);
+=09KUNIT_EXPECT_TRUE(test, nhi_ring_interrupt_should_warn(ring, true, true=
));
+}
+
+static void tb_test_ring_interrupt_warn_duplicate_disable(struct kunit *te=
st)
+{
+=09struct tb_ring *ring;
+
+=09/*
+=09 * No reset happened while this ring was running, so a redundant
+=09 * disable means the driver lost track of the hardware state.
+=09 */
+=09ring =3D alloc_interrupt_test_ring(test, 7, 7);
+=09KUNIT_ASSERT_NOT_NULL(test, ring);
+=09KUNIT_EXPECT_TRUE(test, nhi_ring_interrupt_should_warn(ring, false, tru=
e));
+}
+
+static void tb_test_ring_interrupt_no_warn_after_reset(struct kunit *test)
+{
+=09struct tb_ring *ring;
+
+=09/*
+=09 * The ring was started before the host interface was reset, which
+=09 * cleared the ring interrupt bit underneath it.
+=09 */
+=09ring =3D alloc_interrupt_test_ring(test, 8, 7);
+=09KUNIT_ASSERT_NOT_NULL(test, ring);
+=09KUNIT_EXPECT_FALSE(test,
+=09=09=09   nhi_ring_interrupt_should_warn(ring, false, true));
+}
+
+static void tb_test_ring_interrupt_no_warn_when_changed(struct kunit *test=
)
+{
+=09struct tb_ring *ring;
+
+=09/* An update that actually changed the register never warns */
+=09ring =3D alloc_interrupt_test_ring(test, 8, 7);
+=09KUNIT_ASSERT_NOT_NULL(test, ring);
+=09KUNIT_EXPECT_FALSE(test,
+=09=09=09   nhi_ring_interrupt_should_warn(ring, false, false));
+=09KUNIT_EXPECT_FALSE(test,
+=09=09=09   nhi_ring_interrupt_should_warn(ring, true, false));
+}
+
 static struct kunit_case tb_test_cases[] =3D {
 =09KUNIT_CASE(tb_test_property_parse_u32_wrap),
 =09KUNIT_CASE(tb_test_property_parse_recursion),
@@ -3141,6 +3219,10 @@ static struct kunit_case tb_test_cases[] =3D {
 =09KUNIT_CASE(tb_test_property_parse_zero_length),
 =09KUNIT_CASE(tb_test_property_parse_rootdir_overflow),
 =09KUNIT_CASE(tb_test_property_merge),
+=09KUNIT_CASE(tb_test_ring_interrupt_warn_duplicate_enable),
+=09KUNIT_CASE(tb_test_ring_interrupt_warn_duplicate_disable),
+=09KUNIT_CASE(tb_test_ring_interrupt_no_warn_after_reset),
+=09KUNIT_CASE(tb_test_ring_interrupt_no_warn_when_changed),
 =09{ }
 };
=20

