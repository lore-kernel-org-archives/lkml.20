Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54BA423EB7;
	Wed,  2 Sep 2026 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352462; cv=none; b=XXF/hasESupnGMdziuR91kjmO9vcuGzsInFlL0cquXGd/pAvN2IOg/X25Zgsxr+24sJtOLR6MYZZZij40v79BxM2mzcy3KEQGxtm/eKL7kX1FKih1ahgA0X9/rVV/3R02aXVXFlVx90aAw064GJGVNc/G5C+2mgzviQyJ/ja9jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352462; c=relaxed/simple;
	bh=EnS8XHoKStV+UB3f7yMKvWbW/AEdLoq6tsL64/OeUuQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iePqQKIyXSRBYjBoljmph1c3OEG7e2gNd9zgnt4IjmD0dW+ncDbpBXVb51BiyP/FYLet1EUOxrTBvyCARHRGVFO6Zy4sl0JSGVBGnr5PrFbzSGX3OV8dmsQh3gArF+sjMCqC6gImwZUlRK6yecSzsnvQkciR+epd7KSpWgBI9dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works; spf=pass smtp.mailfrom=empyreal.works; dkim=pass (2048-bit key) header.d=empyreal.works header.i=@empyreal.works header.b=JcDc6uhS; arc=none smtp.client-ip=185.70.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=empyreal.works header.i=@empyreal.works header.b="JcDc6uhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1788352458; x=1788611658;
	bh=mzPf5ChutrVKbDcFh8jVvjHPWsZSdk4VjFdxnOWMu+w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JcDc6uhSLmKQKA9PROvQprV7aWEHXEXXrmw1O19qtJGlIkLZJltbPdDueWYkgXdTt
	 NmA51RdeofZTtAqxBhlDVzWPAB3ubnl0FouwfZBHCqKA/koziCnV/kR6zVT3sGnAxV
	 QQNp1LmtpGFeCHNkZ56JNbm+eMQ3+6N49k3lsmYGreEP233QueITjbRFkEzhs2ZM4d
	 5FYTg7ynBYAToPDw06tC8zjjGeKKV1fVCckS+IAqGW7tKfcqBF7CWVtxYU0B9ihf9C
	 +jipQtv08oH44snaMXWKK02cQDYUn4RxAsPia9C1AhXpZiF+lqD1wpx1Cnhc58yK7s
	 COKGJIZuAF2Hg==
Date: Wed, 02 Sep 2026 12:34:13 +0000
To: linux-usb@vger.kernel.org
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com, Sanath.S@amd.com, Basavaraj.Natikar@amd.com, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] thunderbolt: Do not warn when a reset clears ring interrupts
Message-ID: <20260902-thunderbolt-1-c48cd6e7@empyreal.works>
In-Reply-To: <20260902-thunderbolt-cover-2fdc1c1b@empyreal.works>
References: <20260902-thunderbolt-cover-2fdc1c1b@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: da0ca1ae6d04d10dff90df9b6474a74d1812a5d8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The AMD DMA-teardown quirk resets the host interface before USB4NET
stops its service rings. The reset clears ring interrupt bits while the
rings remain logically running. When tb_ring_stop() later disables the
interrupt, the register update is a no-op and emits a dev_WARN() splat.

The path teardown order is required. Stopping a ring first clears its
descriptor base and unmaps its frame buffers, so pending path traffic
can no longer drain and some host routers never clear their pending bit.

Keep the warning for genuine software-state drift. Increment a host
interface generation after each eligible reset and sample it when an
interrupt-backed ring starts. Excuse a redundant disable only when that
ring crossed a reset. Duplicate enables, duplicate disables without a
reset, rings started after a reset, ineligible resets, and double
software stops retain their existing warnings.

The generation sample precedes interrupt enable while holding the NHI
lock. A reset racing with ring start is therefore observed as newer than
the sample and attributed to that ring.

Source and call-graph analysis identified the reset and
ring-teardown ordering. The change was compile-tested; KUnit coverage is
added separately. It has not run on affected peer-host XDomain hardware
because the attached USB4 device is a hub and does not form that path.

Fixes: f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on DMA=
 path teardown for AMD USB4 routers")

Signed-off-by: Andrei Rusu de Castro <arc@empyreal.works>
---
 drivers/thunderbolt/nhi.c   | 54 +++++++++++++++++++++++++++++++++++--
 include/linux/thunderbolt.h |  9 +++++++
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 5809809f64d4..f56590100aef 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -68,6 +68,43 @@ static void nhi_clear_interrupt(struct tb_nhi *nhi, int =
ring)
 =09=09iowrite32(~0, nhi->iobase + REG_RING_INT_CLEAR + ring);
 }
=20
+/**
+ * nhi_ring_interrupt_should_warn() - Is a no-op interrupt update unexpect=
ed?
+ * @ring: Ring whose interrupt state is being updated
+ * @active: %true if the interrupt is being enabled
+ * @unchanged: %true if the register value did not change
+ *
+ * Updating the interrupt mask normally toggles a bit, so an update that
+ * changes nothing means the driver lost track of the hardware state.
+ *
+ * There is one legitimate exception. Hosts with
+ * %QUIRK_RESET_DMA_ON_TEARDOWN reset the host interface as part of
+ * tearing down a DMA path, which clears the ring interrupt bits while
+ * the rings themselves are still running. A ring that was started
+ * before such a reset is therefore expected to find its interrupt
+ * already disabled when it is stopped afterwards.
+ *
+ * Return: %true if the caller should warn about the no-op update.
+ */
+static bool
+nhi_ring_interrupt_should_warn(const struct tb_ring *ring, bool active,
+=09=09=09       bool unchanged)
+{
+=09if (!unchanged)
+=09=09return false;
+
+=09/* Enabling an already enabled interrupt is always a driver bug */
+=09if (active)
+=09=09return true;
+
+=09/*
+=09 * Only excuse a redundant disable if the host interface was reset
+=09 * while this ring was running.
+=09 */
+=09return ring->reset_generation =3D=3D
+=09=09atomic_read(&ring->nhi->reset_generation);
+}
+
 /*
  * ring_interrupt_active() - activate/deactivate interrupts for a single r=
ing
  *
@@ -138,7 +175,7 @@ static void ring_interrupt_active(struct tb_ring *ring,=
 bool active)
 =09=09"%s interrupt at register %#x bit %d (%#x -> %#x)\n",
 =09=09active ? "enabling" : "disabling", reg, interrupt_bit, old, new);
=20
-=09if (new =3D=3D old)
+=09if (nhi_ring_interrupt_should_warn(ring, active, new =3D=3D old))
 =09=09dev_WARN(ring->nhi->dev, "interrupt for %s %d is already %s\n",
 =09=09=09 RING_TYPE(ring), ring->hop,
 =09=09=09 str_enabled_disabled(active));
@@ -714,8 +751,15 @@ void tb_ring_start(struct tb_ring *ring)
 =09=09ring_iowrite32options(ring, flags, 0);
 =09}
=20
-=09if (!(ring->flags & RING_FLAG_NO_INTERRUPT))
+=09/*
+=09 * Sample the reset generation before touching the interrupt so
+=09 * that a reset racing with this start is seen as happening after
+=09 * the ring started, and the eventual stop does not warn.
+=09 */
+=09if (!(ring->flags & RING_FLAG_NO_INTERRUPT)) {
+=09=09ring->reset_generation =3D atomic_read(&ring->nhi->reset_generation)=
;
 =09=09ring_interrupt_active(ring, true);
+=09}
 =09ring->running =3D true;
 err:
 =09spin_unlock(&ring->lock);
@@ -1199,6 +1243,12 @@ void nhi_reset_interface(struct tb_nhi *nhi)
 =09=09  nhi->iobase + REG_HOST_INTERFACE_RESET);
 =09/* Wait for tHIReset (10 ms) to complete */
 =09usleep_range(10000, 20000);
+
+=09/*
+=09 * The reset cleared the ring interrupt state behind the back of
+=09 * any ring that is still running, so record that it happened.
+=09 */
+=09atomic_inc(&nhi->reset_generation);
 }
=20
 static struct tb *nhi_select_cm(struct tb_nhi *nhi)
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index d48623fda79b..867ec3ed23c6 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -19,6 +19,7 @@ struct device;
=20
 #if IS_REACHABLE(CONFIG_USB4)
=20
+#include <linux/atomic.h>
 #include <linux/device.h>
 #include <linux/idr.h>
 #include <linux/list.h>
@@ -519,6 +520,10 @@ void tb_service_properties_changed(struct tb_service *=
svc);
  *=09=09downstream ports to signal disconnect before tearing down the
  *=09=09router tree. Only Thunderbolt 3 devices are reset; USB4
  *=09=09routers are skipped.
+ * @reset_generation: Incremented every time the host interface is reset b=
y
+ *=09=09      nhi_reset_interface(). Rings sample this when they are
+ *=09=09      started so that they can tell whether their interrupt
+ *=09=09      state was cleared by a reset while they were running.
  */
 struct tb_nhi {
 =09spinlock_t lock;
@@ -534,6 +539,7 @@ struct tb_nhi {
 =09unsigned long quirks;
 =09struct completion domain_released;
 =09bool host_reset;
+=09atomic_t reset_generation;
 };
=20
 /**
@@ -552,6 +558,8 @@ struct tb_nhi {
  * @work: Interrupt work structure
  * @is_tx: Is the ring Tx or Rx
  * @running: Is the ring running
+ * @reset_generation: Host interface reset generation sampled when the rin=
g
+ *=09=09      was started. Protected by the NHI lock.
  * @irq: MSI-X irq number if the ring uses MSI-X. %0 otherwise.
  * @vector: MSI-X vector number the ring uses (only set if @irq is > 0)
  * @flags: Ring specific flags
@@ -580,6 +588,7 @@ struct tb_ring {
 =09struct work_struct work;
 =09bool is_tx:1;
 =09bool running:1;
+=09int reset_generation;
 =09int irq;
 =09u8 vector;
 =09unsigned int flags;

