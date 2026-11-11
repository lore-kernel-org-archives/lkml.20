Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437836;
	b=XfCdlht+R3qcT5uU3/FWN04rZOsayxo8bBLuGk2YirNbHxrg7GscQv+CQzeAigA2mmxe
	 fICdblYr2BO9m1LzKoHQeqdlhIL/t2oxXdLspB/a0BymDe043IJYvy5OgStLrJifAs3qy
	 uJlQCqwI1FR4PMPbsCj3p3nj5SaNqf+cL0+58AEsMjtLmSsCUtQtQVn7+YVFAuMy/qNPc
	 HGqCNaUp8rRI/7rJPgrDRT/FVbSh0zKIIZAJ8a4lfjqCUyIi/3SfV/C+AY+A3JqFU1dXw
	 jOx4O7WSWUL2Q7ieQlO5Y+jlXnVboRVNFndcuVHNJywSa6qToHU7dK+v4gP/8bhU2+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437836;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=v172BBhSIs/s5PfOVoC6QLXEKejm10fyQ3ON2luHBR8=;
	b=u9rnWTDN3e1s9rWrWiEOGUuhzng1P+FV8+J76lKYqymTdNLQIdeGmS62P6RqMmdxjaX9
	 3V1SDAS9aya4gZ6wAM2i6uryxw6LophohVxBFdV2zK8fG3bZepZA4a+5mZ34YS9weu0Jr
	 ch9LaCTLarRl5MRXBTvRyc1ud8+i6tMC5RhCJP0OuIHv0u3sn6taUjdCvOlqZU7ZUO+aj
	 AThUyZqrm6JfBWyaE+LW5E2RT0CTtLImy4T/XdG2nacOvzCdmo+W79OhPKeDlZllcHDBy
	 O6VXJsv5A6eGFVa4/s4wwgHgg7uIJRnDlVEPd4WDPHieqE4LnS80pgZtaA4yiCDMxzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=ot7f2DjZ;
	arc=none smtp.remote-ip=185.70.43.20
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364F7606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 364F7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=ot7f2DjZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1794437833; x=1794697033;
	bh=v172BBhSIs/s5PfOVoC6QLXEKejm10fyQ3ON2luHBR8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ot7f2DjZfdOvaoKT98aNyQ4lOgqKPiytil0eEs5gr8h+Aun6/08pngKEHP5rnNhqP
	 m3Ke28rBYcWE8K8spD79qiHIq0wVu2xK2t96F5iWnaMQPvdQrwu7oHTU1Skx6EXAlH
	 DFkT2RUEvNeVyOkowvNV7iMCi6h302dX55zGnXldzFyhIMlLcv0D3cbvmfxFoATujL
	 x+oeUzLdfSJ/K8dKs1cQnF3GdFna9FuGbDKDs4DE9t2+2LBCh1ib29hd/Qfz3NksC7
	 +mbRNx1VsVlzYYMBTNM5K0Wai9woxsKcV/+VZ6803BUEAU5S9DELzcVEY/RaDhJtJh
	 pk+Vyl5ZCdZDg==
Date: Wed, 11 Nov 2026 22:57:08 +0000
To: Mika Westerberg <westeri@kernel.org>, Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] thunderbolt: Optionally keep PCIe tunnels up through suspend-to-idle
Message-ID: <20261111-tb-s2idle-keep-pcie-2a2a66a2@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: d4ce41085359501846bbf2c7261c179945a6c0ef
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Every system sleep puts the USB4 routers to sleep, which takes all
tunnels down, and the connection manager re-creates them on resume. A
PCIe device behind a tunnel disappears from the bus in between. An
external GPU that drives a display does not survive that: on a ROG Flow
Z13 (GZ302EA) with an RTX 5090 in a Razer Core X V2 driving an external
monitor, the GPU driver found the device gone after suspend-to-idle, the
enclosure was removed and re-added under a compositor still using it,
and the desktop froze.

For suspend-to-idle the domain can keep running instead. Add a module
parameter, s2idle_keep_pcie, off by default. When it is set, the target
state is suspend-to-idle and the software connection manager has a PCIe
tunnel, leave the routers, links and control channel running and keep
the host interface in D0 by saving its PCI state in the noirq phase, so
the PCI core does not put it into D3. The devices behind the tunnel then
go through an ordinary PCI suspend and resume. Without a PCIe tunnel, in
other sleep states and with the firmware connection manager nothing
changes.

With the parameter set on the GZ302EA, suspend-to-idle with the eGPU
driving the monitor resumes with the GPU still on the bus, the same
compositor process and the dock's USB devices intact. With this
enclosure attached the system does not reach hardware sleep either
way, with the tunnels kept or torn down (amd-s2idle: 0% hardware
sleep); without it, the same system reaches 99% hardware sleep at
about 1.1 W. The cost of keeping a tunnel up on a system that
otherwise reaches hardware sleep was not measured.

An LLM assisted with finding the cause, writing this change and its
description, and running the tests above on my GZ302EA.

Signed-off-by: Andrei Rusu de Castro <arc@empyreal.works>
---
 drivers/thunderbolt/domain.c |  5 +++--
 drivers/thunderbolt/nhi.c    | 14 ++++++++++++
 drivers/thunderbolt/tb.c     | 43 ++++++++++++++++++++++++++++++++++++
 include/linux/thunderbolt.h  |  3 +++
 4 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 24611f05b..168a286cd 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -535,7 +535,7 @@ int tb_domain_suspend_noirq(struct tb *tb)
 =09mutex_lock(&tb->lock);
 =09if (tb->cm_ops->suspend_noirq)
 =09=09ret =3D tb->cm_ops->suspend_noirq(tb);
-=09if (!ret)
+=09if (!ret && !tb->kept_running)
 =09=09tb_ctl_stop(tb->ctl);
 =09mutex_unlock(&tb->lock);
=20
@@ -556,7 +556,8 @@ int tb_domain_resume_noirq(struct tb *tb)
 =09int ret =3D 0;
=20
 =09mutex_lock(&tb->lock);
-=09tb_ctl_start(tb->ctl);
+=09if (!tb->kept_running)
+=09=09tb_ctl_start(tb->ctl);
 =09if (tb->cm_ops->resume_noirq)
 =09=09ret =3D tb->cm_ops->resume_noirq(tb);
 =09mutex_unlock(&tb->lock);
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index f54ab2189..c453153c2 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1089,6 +1089,17 @@ static int __nhi_suspend_noirq(struct device *dev, b=
ool wakeup)
 =09if (ret)
 =09=09return ret;
=20
+=09if (tb->kept_running) {
+=09=09/*
+=09=09 * Saving the state here keeps the PCI core from putting the
+=09=09 * host router into D3, which would take the tunnels down;
+=09=09 * for suspend-to-idle it then skips the bus PM of this
+=09=09 * device on resume as well.
+=09=09 */
+=09=09pci_save_state(to_pci_dev(dev));
+=09=09return 0;
+=09}
+
 =09if (nhi->ops->suspend_noirq) {
 =09=09ret =3D nhi->ops->suspend_noirq(tb->nhi, wakeup);
 =09=09if (ret)
@@ -1145,6 +1156,9 @@ static int nhi_resume_noirq(struct device *dev)
 =09struct tb_nhi *nhi =3D tb->nhi;
 =09int ret;
=20
+=09if (tb->kept_running)
+=09=09return tb_domain_resume_noirq(tb);
+
 =09/*
 =09 * Check that the device is still there. It may be that the user
 =09 * unplugged last device which causes the host controller to go
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 418ad0a61..641502ec2 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -9,8 +9,10 @@
 #include <linux/slab.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
+#include <linux/moduleparam.h>
 #include <linux/pm_runtime.h>
 #include <linux/stringify.h>
+#include <linux/suspend.h>
=20
 #include "tb.h"
 #include "tb_regs.h"
@@ -3106,10 +3108,45 @@ static int tb_start(struct tb *tb, bool reset)
 =09return 0;
 }
=20
+static bool s2idle_keep_pcie;
+module_param(s2idle_keep_pcie, bool, 0644);
+MODULE_PARM_DESC(s2idle_keep_pcie,
+=09=09 "keep a domain with PCIe tunnels running through suspend-to-idle so=
 the devices behind them stay connected (default: false)");
+
+/*
+ * Putting the routers to sleep takes every tunnel down, and the PCIe
+ * devices behind a tunnel then disappear from the bus until it is
+ * re-created on resume. A device that cannot lose its link while its
+ * driver holds it (an external GPU driving a display) does not survive
+ * that. For suspend-to-idle the domain can instead keep running: the
+ * routers stay awake, the links and tunnels stay up and the devices
+ * behind them go through an ordinary PCI suspend and resume.
+ */
+static bool tb_keep_running_s2idle(struct tb *tb)
+{
+=09struct tb_cm *tcm =3D tb_priv(tb);
+=09struct tb_tunnel *tunnel;
+
+=09if (!s2idle_keep_pcie || pm_suspend_target_state !=3D PM_SUSPEND_TO_IDL=
E)
+=09=09return false;
+
+=09list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
+=09=09if (tb_tunnel_is_pci(tunnel))
+=09=09=09return true;
+=09}
+=09return false;
+}
+
 static int tb_suspend_noirq(struct tb *tb)
 {
 =09struct tb_cm *tcm =3D tb_priv(tb);
=20
+=09if (tb_keep_running_s2idle(tb)) {
+=09=09tb_dbg(tb, "PCIe tunnels active, keeping the domain running\n");
+=09=09tb->kept_running =3D true;
+=09=09return 0;
+=09}
+
 =09tb_dbg(tb, "suspending...\n");
 =09tb_disconnect_and_release_dp(tb);
 =09tb_switch_exit_redrive(tb->root_switch);
@@ -3177,6 +3214,12 @@ static int tb_resume_noirq(struct tb *tb)
 =09unsigned int usb3_delay =3D 0;
 =09LIST_HEAD(tunnels);
=20
+=09if (tb->kept_running) {
+=09=09tb->kept_running =3D false;
+=09=09tb_dbg(tb, "domain kept running, tunnels intact\n");
+=09=09return 0;
+=09}
+
 =09tb_dbg(tb, "resuming...\n");
=20
 =09/*
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 57502da29..8cd7c1b75 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -78,6 +78,8 @@ enum tb_security_level {
  * @index: Linux assigned domain number
  * @security_level: Current security level
  * @nboot_acl: Number of boot ACLs the domain supports
+ * @kept_running: The domain was left running through the current
+ *=09=09  suspend-to-idle, its tunnels intact
  * @privdata: Private connection manager specific data
  */
 struct tb {
@@ -91,6 +93,7 @@ struct tb {
 =09int index;
 =09enum tb_security_level security_level;
 =09size_t nboot_acl;
+=09bool kept_running;
 =09unsigned long privdata[];
 };
=20
--=20
2.56.0


