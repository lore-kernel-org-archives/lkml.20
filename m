Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448699;
	b=LYyGdAdpFEWiYFCokA07NoXAFabxkMPqRjyuac+KyQNyswQ5jGEYLK8nPK3MdvG16Jh9
	 iGt/ZRRLKF94E/9OQAjghsmxLUK6B9yMazjDguAChltvxH8MzQFMBRw4bMgsOKPNENwOz
	 SWQh4rfGDhgqj2Q6wU9nFeaZTG+GZxt0BkfClB9HHr4MzSbk0WEIVFV3Pjd0BPHt+dFOH
	 +jGTFm5HzA3jcQ922nV7dJKoYWySSsSzooW3A7FRugTwAzIeB31q/vAzSs2BbLjCGCsF7
	 hNQa4FN9GTaNEP22v7Q0phP3qYK9jiWVomuTswbCvlJ0TTi1m+uoietjQH32f696E2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448699;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=vEHNSaqmUpCGe4LlNVtAS/c2+1vxtWYWPYfy1mE3vVM=;
	b=TxadaF2NdxshT3x70Cfi6WOQdbyMfEu6UxxuwcZ9PiW2D/mLwUfV6bq/1EN8DtlAPn2r
	 BS/YtArqwtfkni/5+O+mOm2hDWpyvbJNni0P3vSQfS27E2MmwuzVG51rAaepAchg5zsBb
	 1KSzAXylRtaQgTjhfLUEQRHoPQIRL0LiFdQ8VJFIhjz+juZwHR/0kzk54h9qrlRdTlmdP
	 swtEsUvii8R2PyWlwDPBkvs271irVMX5hSdSf89ZvX9hw4JP3L9G1DL1xFNZmZu3K2+VH
	 93qgU9L8s5622zoD0sQRC1JAhYlN667nQXeCxFqddWmfZNDlLNT1oVWIDGbap4bMyuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=UzwvsLSo;
	arc=none smtp.remote-ip=79.135.106.116
Received: from mail-106116.protonmail.ch (mail-106116.protonmail.ch [79.135.106.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B15606A321;
	Thu, 12 Nov 2026 01:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B15606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=UzwvsLSo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1794448695; x=1794707895;
	bh=vEHNSaqmUpCGe4LlNVtAS/c2+1vxtWYWPYfy1mE3vVM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UzwvsLSoPf7sBZQzim3s6xxVyVUQDhftslbfu7SQWuRalBjUCfA06NDPsfvLa/zOJ
	 maQ8t9G5FNJQQlNWgY8yIj2Gr5WGU7cSzSWautB/b1Iuvp/XLSZqpHCgiH+5x3LKyf
	 gJJpNfMgS+APlALSW1SFQkEeYCJAKnBqbHEOJxUbiuUowpWxkwKjE0FqmBat5fQqL8
	 t3+REvuV+N1/ARFm9WmCS45iG4B6+Bvi72alZTOi529xNKex1t+VHjLrgLWKqrx9Ab
	 La48S3iH6XaFj97YCmQOyKn72QE9szL7z7h+F/jtpqgbkANb+Qqy8NH0TTpBu/G79i
	 mmOt017bu1VMg==
Date: Thu, 12 Nov 2026 01:58:11 +0000
To: Mika Westerberg <westeri@kernel.org>, Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] thunderbolt: Optionally keep PCIe tunnels up through suspend-to-idle
Message-ID: <20261112-tb-s2idle-keep-pcie-v2-b3c197ac@empyreal.works>
In-Reply-To: <20261111-tb-s2idle-keep-pcie-2a2a66a2@empyreal.works>
References: <20261111-tb-s2idle-keep-pcie-2a2a66a2@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 2a6d6c9b6af766fdafaf8a7abfdd1818f0957bec
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

For suspend-to-idle the routers, links and tunnels can instead stay up,
as they already do across freeze. Add a module parameter,
s2idle_keep_pcie, off by default. When it is set, the target state is
suspend-to-idle and the software connection manager has a PCIe tunnel,
handle the domain as freeze does: stop hotplug handling and the control
channel, but leave the routers and tunnels up, and keep the host
interface in D0 by saving its PCI state in the noirq phase, so the PCI
core does not put it into D3. The devices behind the tunnel then go
through an ordinary PCI suspend and resume.

Hotplug events of the sleep are not handled, so on resume check every
router for presence and identity without reconfiguring it, free the
routers and tunnels that went away or were replaced and rescan for new
devices once the system has resumed. The presence check of the host
interface still runs. Without a PCIe tunnel, in other sleep states and
with the firmware connection manager nothing changes.

On a GZ302EA with an RTX 5090 in a Razer Core X V2 and the parameter
set, suspend-to-idle with the enclosure attached resumes with the GPU
still on the bus and working; the enclosure's domain is kept running
and the other domain suspends as before. With the enclosure unplugged
during the sleep, resume reports the router lost, disconnects it and
its retimers, and PCIe hotplug removes the GPU, without warnings or
blocked tasks. The previous version, which kept the control channel
running, was also tested with the eGPU driving the external monitor:
the compositor kept running and the dock's USB devices stayed intact.
With this enclosure attached the system does not reach hardware sleep
either way, with the tunnels kept or torn down (amd-s2idle: 0%
hardware sleep); without it, the same system reaches 99% hardware
sleep at about 1.1 W. The cost of keeping a tunnel up on a system
that otherwise reaches hardware sleep was not measured.

An LLM assisted with finding the cause, writing this change and its
description, and running the tests above on my GZ302EA.

Signed-off-by: Andrei Rusu de Castro <arc@empyreal.works>
---
Changes in v2:
- Handle the kept domain as freeze does: stop hotplug handling and
  the control channel during the sleep (Sashiko review of v1)
- On resume, check every router for presence and identity, free the
  routers and tunnels that went away and rescan in the complete phase
- Run the host interface presence check on resume again

v1: https://lore.kernel.org/all/20261111-tb-s2idle-keep-pcie-2a2a66a2@empyr=
eal.works/

 drivers/thunderbolt/nhi.c   |  13 ++++-
 drivers/thunderbolt/tb.c    | 108 +++++++++++++++++++++++++++++++++++-
 include/linux/thunderbolt.h |   3 +
 3 files changed, 122 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index f54ab2189..8264f7235 100644
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
@@ -1152,7 +1163,7 @@ static int nhi_resume_noirq(struct device *dev)
 =09 */
 =09if ((nhi->ops->is_present && !nhi->ops->is_present(nhi))) {
 =09=09nhi->going_away =3D true;
-=09} else if (nhi->ops->resume_noirq) {
+=09} else if (!tb->kept_running && nhi->ops->resume_noirq) {
 =09=09ret =3D nhi->ops->resume_noirq(nhi);
 =09=09if (ret)
 =09=09=09return ret;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 418ad0a61..a7528b93a 100644
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
@@ -59,6 +61,9 @@ MODULE_PARM_DESC(asym_threshold,
  *=09=09    after cfg has been paused.
  * @remove_work: Work used to remove any unplugged routers after
  *=09=09 runtime resume
+ * @rescan_on_complete: The domain was kept running through
+ *=09=09=09suspend-to-idle, so look for routers plugged in
+ *=09=09=09meanwhile once the system has resumed
  * @groups: Bandwidth groups used in this domain.
  */
 struct tb_cm {
@@ -66,6 +71,7 @@ struct tb_cm {
 =09struct list_head dp_resources;
 =09bool hotplug_active;
 =09struct delayed_work remove_work;
+=09bool rescan_on_complete;
 =09struct tb_bandwidth_group groups[MAX_GROUPS];
 };
=20
@@ -3106,10 +3112,94 @@ static int tb_start(struct tb *tb, bool reset)
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
+ * that. For suspend-to-idle the routers, links and tunnels can instead
+ * stay up, as they do across freeze, and the devices behind them go
+ * through an ordinary PCI suspend and resume.
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
+/*
+ * Hotplug events were not handled while the domain was kept running
+ * through suspend-to-idle. Mark the routers and XDomains that went away
+ * or were replaced meanwhile as unplugged, without reconfiguring those
+ * still present, whose tunnels are in use.
+ */
+static void tb_check_kept_running(struct tb_switch *sw)
+{
+=09struct tb_port *port;
+
+=09tb_switch_for_each_port(sw, port) {
+=09=09struct tb_switch *child;
+=09=09u64 uid;
+=09=09int ret;
+
+=09=09if (!tb_port_is_null(port))
+=09=09=09continue;
+
+=09=09if (port->xdomain) {
+=09=09=09if (tb_wait_for_port(port, false) <=3D 0)
+=09=09=09=09port->xdomain->is_unplugged =3D true;
+=09=09=09continue;
+=09=09}
+
+=09=09if (!tb_port_has_remote(port))
+=09=09=09continue;
+
+=09=09child =3D port->remote->sw;
+=09=09ret =3D tb_cfg_get_upstream_port(sw->tb->ctl, tb_route(child));
+=09=09if (ret >=3D 0 && child->uid) {
+=09=09=09if (tb_switch_is_usb4(child))
+=09=09=09=09ret =3D usb4_switch_read_uid(child, &uid);
+=09=09=09else
+=09=09=09=09ret =3D tb_drom_read_uid_only(child, &uid);
+=09=09=09if (!ret && uid !=3D child->uid)
+=09=09=09=09ret =3D -ENODEV;
+=09=09}
+=09=09if (ret < 0) {
+=09=09=09tb_port_warn(port, "lost during suspend, disconnecting\n");
+=09=09=09tb_sw_set_unplugged(child);
+=09=09=09continue;
+=09=09}
+
+=09=09tb_check_kept_running(child);
+=09}
+}
+
 static int tb_suspend_noirq(struct tb *tb)
 {
 =09struct tb_cm *tcm =3D tb_priv(tb);
=20
+=09if (tb_keep_running_s2idle(tb)) {
+=09=09tb_dbg(tb, "PCIe tunnels active, keeping the domain running\n");
+=09=09/* As for freeze, no hotplug handling until resume */
+=09=09tcm->hotplug_active =3D false;
+=09=09tb->kept_running =3D true;
+=09=09return 0;
+=09}
+
 =09tb_dbg(tb, "suspending...\n");
 =09tb_disconnect_and_release_dp(tb);
 =09tb_switch_exit_redrive(tb->root_switch);
@@ -3177,6 +3267,17 @@ static int tb_resume_noirq(struct tb *tb)
 =09unsigned int usb3_delay =3D 0;
 =09LIST_HEAD(tunnels);
=20
+=09if (tb->kept_running) {
+=09=09tb->kept_running =3D false;
+=09=09tb_dbg(tb, "domain kept running, checking for changes\n");
+=09=09tb_check_kept_running(tb->root_switch);
+=09=09tb_free_invalid_tunnels(tb);
+=09=09tb_free_unplugged_children(tb->root_switch);
+=09=09tcm->rescan_on_complete =3D true;
+=09=09tcm->hotplug_active =3D true;
+=09=09return 0;
+=09}
+
 =09tb_dbg(tb, "resuming...\n");
=20
 =09/*
@@ -3250,12 +3351,17 @@ static int tb_thaw_noirq(struct tb *tb)
=20
 static void tb_complete(struct tb *tb)
 {
+=09struct tb_cm *tcm =3D tb_priv(tb);
+=09bool rescan =3D tcm->rescan_on_complete;
+
+=09tcm->rescan_on_complete =3D false;
+
 =09/*
 =09 * Unregister unplugged XDomains and if there is a case where
 =09 * another domain is swapped in place of unplugged XDomain we
 =09 * need to run another rescan.
 =09 */
-=09if (tb_domain_unregister_unplugged_xdomains(tb)) {
+=09if (tb_domain_unregister_unplugged_xdomains(tb) || rescan) {
 =09=09scoped_guard(mutex, &tb->lock)
 =09=09=09tb_scan_switch(tb->root_switch);
 =09}
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


