Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847298;
	b=m/SDhpdQYvRLGdmq+VB7QU3nawi63r3SUpplpaymjjbeQZt05lyp9zmB12JRfuoz7yjG
	 aDG4SW9fPHgQ16hBRuMXtRbaZG82gr5hW9XYdKPtqSkJXli5ywv3flPg1Zgw1qkA/pPOY
	 sMat84msryAFi4XBUef03XViiYKvLUow3MCn2+k9TbkSTA0cBFymoeWuKUevrBYfudnkQ
	 vJ6ECIXbAn652Vf+ai3X4lWrFUKodiW5T9U2XxvbfNV8bF3H6Yo8knW3ak9VMLw+OY3mW
	 pIW1gOCDX4+CClE/DMqwssEdJIpF0R5n8iWPRoQ6qF3v9K6C+L74sxjYXDJ0ZtN7ZJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847298;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bXe3eidCmTCiQenfd9n3CrcXKRfuQUm45Vpd1CjGvEQ=;
	b=N79zhZpo2TSMzsubuFJDmXa+10KaL94QJ+3hS0uWAQsx4s33Ye3SHTTWlvzKKONCv3lv
	 tH3y+bTgV5JcixXKpKrjFt14hq2JiJY236NQnzWP0bMuvWW7YmpbXkzmkGHIfJp8c2FW6
	 dYx9eL9dAUkiloBZs3wqiW6s5eDZk/qaJSRZIDCyKSPY7AbYbzJNew1EVrMgmxizSMYev
	 4Ktc/5mVRKvETxYNkaEItCyUeuE0QMnV+O+mtpX4HaDKhObBMh0T5QV4DZRqKSltkrdjK
	 YWJP/uv2APUHrUZJdxgpFuFkq6UlwFTNl069LN+LnVCocZ/qr+qFgx6Ai9yWNJQgCaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=fLSqBKfD;
	arc=none smtp.remote-ip=185.70.43.98
Received: from mail-4398.protonmail.ch (mail-4398.protonmail.ch [185.70.43.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B73606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B73606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=fLSqBKfD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1794847294; x=1795106494;
	bh=bXe3eidCmTCiQenfd9n3CrcXKRfuQUm45Vpd1CjGvEQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=fLSqBKfD/EthqPHTah1zzZH9jYccZ6Fh5lHBJ81i+orfH5mzBcNCmcmvCtWfIY8pH
	 +lLQMU9rkBRS3PuUCwf3Xvw+Wo59u3w00XIUtD3Fm/TTxffNDrCszXv4DA7Gm1Ewhf
	 Y5ubxaUyekdLpvzuMvPXPggxwba5V4gm1J4CY3YJ9HDE/enb97WXz1zXzfRtttUrT3
	 GpfYWTlb9q2ZBOdVCdqNzCpN9pWuoNqwwD8aFAeZa/LbmeldemBKTQcm0K//zky8IF
	 gC7lJxF289uZmLANEsoGpFG7v83fXJyw3Mu66lxd0H+pV9xbrS3G/fwWXmYJG4Hq6U
	 mEyym/LYOilsw==
Date: Mon, 16 Nov 2026 16:41:31 +0000
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>, Johannes Berg <johannes@sipsolutions.net>
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] wifi: iwlwifi: mei: tell user space when CSME needs a DHCP refresh
Message-ID: <20261116-iwlmei-ip-refresh-rfc-4d2c91a7@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 848621748f35c74c2a297cbbbb5586926aaf000b
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

CSME shares the host's IPv4 address and learns it from the host's DHCP
exchange: iwlmei copies the host's DHCP requests to CSME, and CSME's
filters pass the replies to it. When AMT's wireless is switched back on
while the host owns the NIC, CSME redoes the SAP setup within a fraction
of a second, then waits about 28 seconds, sends
SAP_MSG_NOTIF_TRIGGER_IP_REFRESH, which iwlmei ignores, and without a
refresh falls back to a lease of its own 20-30 seconds later. AMT is
unreachable for 44-57 seconds after the switch.

Only the DHCP client in user space can refresh the lease, so add an
ip_refresh op to iwlmei and have iwlmvm send a new Intel vendor event,
IWL_MVM_VENDOR_CMD_IP_REFRESH_EVENT, on the station interface. iwlmei
calls it when CSME asks for a refresh, and as soon as CSME's filters pass
a DHCP reply after its wireless was enabled: the first filter sets CSME
sends then do not (four of the five it sent in one traced switch), and a
refresh before that shows CSME the request but not the reply.

The vendor event follows the existing iwlmei interface to user space
(IWL_MVM_VENDOR_CMD_ROAMING_FORBIDDEN_EVENT, with the same
IWL_MVM_VENDOR_ATTR_VIF_ADDR attribute), so a user space that already
listens to these events needs nothing new to find it. The value 0x3c
follows the last command of Intel's backport tree (0x3b) to avoid a
collision. A uevent on the netdev would add a new kind of interface for
one driver, and the driver cannot refresh the lease itself: SAP has no
message to hand CSME the address. No upstream DHCP client listens to
iwlmei's vendor events yet; tested with a small listener on the nl80211
vendor multicast group that renews the lease through NetworkManager.

Tested on an HP ZBook Firefly 14 G10 (AX211, CSME 16.1): after AMT's
wireless was switched off and on while the host was connected, the event
arrived 1.7-2.0 s after the switch and AMT answered over Wi-Fi 6.0-7.3 s
after it (each probe includes AMT's TLS handshake of about 1 s), instead
of 44-57 s; the host stayed associated.

Signed-off-by: Andrei Rusu de Castro <arc@empyreal.works>
---
RFC because this adds a value to the Intel vendor command list in
include/uapi/linux/nl80211-vnd-intel.h, and no upstream user space
consumes iwlmei's vendor events yet. If you would rather have this
reported another way (or a different value than 0x3c), I'll rework it.

Applies to iwlwifi-next. IWLMEI depends on BROKEN; it builds with
CONFIG_WERROR only together with [1], and binds only with [2]:

[1] https://lore.kernel.org/r/20261116-iwlmei-nvm-const-0c16d1de@empyreal.w=
orks
[2] https://lore.kernel.org/r/20261116-mei-cl-dma-parent-60802f47@empyreal.=
works

 .../net/wireless/intel/iwlwifi/mei/iwl-mei.h  |  3 +
 drivers/net/wireless/intel/iwlwifi/mei/main.c | 68 +++++++++++++++++++
 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h  |  2 +
 drivers/net/wireless/intel/iwlwifi/mvm/ops.c  | 11 +++
 .../wireless/intel/iwlwifi/mvm/vendor-cmd.c   | 24 +++++++
 include/uapi/linux/nl80211-vnd-intel.h        |  7 ++
 6 files changed, 115 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/mei/iwl-mei.h b/drivers/net=
/wireless/intel/iwlwifi/mei/iwl-mei.h
index 2081775e0ec9..7f4db53fa2f0 100644
--- a/drivers/net/wireless/intel/iwlwifi/mei/iwl-mei.h
+++ b/drivers/net/wireless/intel/iwlwifi/mei/iwl-mei.h
@@ -307,6 +307,8 @@ enum iwl_mei_sap_version {
  *=09when the SAP connection is re-established.
  * @nic_stolen: this means that device is no longer available. The device =
can
  *=09still be used until the callback returns.
+ * @ip_refresh: CSME needs the host to refresh its DHCP lease, so that CSM=
E
+ *=09learns the IPv4 address it shares with the host.
  */
 struct iwl_mei_ops {
 =09void (*me_conn_status)(void *priv,
@@ -315,6 +317,7 @@ struct iwl_mei_ops {
 =09void (*roaming_forbidden)(void *priv, bool forbidden);
 =09void (*sap_connected)(void *priv);
 =09void (*nic_stolen)(void *priv);
+=09void (*ip_refresh)(void *priv);
 };
=20
 #if IS_ENABLED(CONFIG_IWLMEI)
diff --git a/drivers/net/wireless/intel/iwlwifi/mei/main.c b/drivers/net/wi=
reless/intel/iwlwifi/mei/main.c
index ce92e26c42d7..aa7f0728379a 100644
--- a/drivers/net/wireless/intel/iwlwifi/mei/main.c
+++ b/drivers/net/wireless/intel/iwlwifi/mei/main.c
@@ -149,6 +149,8 @@ struct iwl_mei_filters {
  * @filters: the filters sent by CSME
  * @got_ownership: true if we own the device
  * @amt_enabled: true if CSME has wireless enabled
+ * @ip_refresh_on_filters: refresh the host's DHCP lease once CSME's filte=
rs
+ *=09pass a DHCP reply to CSME, after CSME's wireless was enabled
  * @csa_throttled: when true, we can't send CHECK_SHARED_AREA over the MEI
  *=09bus, but rather need to wait until send_csa_msg_wk runs
  * @csme_taking_ownership: true when CSME is taking ownership. Used to rem=
ember
@@ -180,6 +182,7 @@ struct iwl_mei {
 =09struct iwl_mei_filters __rcu *filters;
 =09bool got_ownership;
 =09bool amt_enabled;
+=09bool ip_refresh_on_filters;
 =09bool csa_throttled;
 =09bool csme_taking_ownership;
 =09bool link_prot_state;
@@ -692,6 +695,57 @@ iwl_mei_handle_rx_start_ok(struct mei_cl_device *cldev=
,
 =09mutex_unlock(&iwl_mei_mutex);
 }
=20
+/*
+ * CSME shares the host's IPv4 address and learns it by watching the host'=
s
+ * DHCP exchange: iwlmei copies the host's DHCP requests to CSME, and CSME=
's
+ * filters pass the replies to it. Without a fresh exchange CSME only fall=
s
+ * back to a lease of its own after a timeout, so have the op mode ask the
+ * DHCP client in user space to refresh the lease: when CSME asks for it, =
and
+ * as soon as CSME's filters pass a DHCP reply after its wireless was enab=
led
+ * (the first filters it sends then do not yet).
+ */
+static void iwl_mei_request_ip_refresh(struct mei_cl_device *cldev)
+{
+=09if (!iwl_mei_cache.ops || !iwl_mei_cache.ops->ip_refresh)
+=09=09return;
+
+=09dev_dbg(&cldev->dev, "Asking for an IP refresh\n");
+=09iwl_mei_cache.ops->ip_refresh(iwl_mei_cache.priv);
+}
+
+static void iwl_mei_handle_ip_refresh(struct mei_cl_device *cldev,
+=09=09=09=09      const struct iwl_sap_hdr *hdr)
+{
+=09struct iwl_mei *mei =3D mei_cldev_get_drvdata(cldev);
+
+=09mei->ip_refresh_on_filters =3D false;
+=09iwl_mei_request_ip_refresh(cldev);
+}
+
+/* Whether a DHCP reply (UDP from port 67 to port 68) reaches CSME. */
+static bool iwl_mei_filters_pass_dhcp_reply(const struct iwl_sap_oob_filte=
rs *filters)
+{
+=09const struct iwl_sap_flex_filter *filt;
+
+=09for (filt =3D &filters->flex_filters[0];
+=09     filt < &filters->flex_filters[0] + ARRAY_SIZE(filters->flex_filter=
s);
+=09     filt++) {
+=09=09if (!(filt->flags & SAP_FLEX_FILTER_ENABLED))
+=09=09=09break;
+
+=09=09if (filt->flags & SAP_FLEX_FILTER_TCP)
+=09=09=09continue;
+
+=09=09if ((filt->src_port && filt->src_port !=3D cpu_to_be16(67)) ||
+=09=09    (filt->dst_port && filt->dst_port !=3D cpu_to_be16(68)))
+=09=09=09continue;
+
+=09=09return true;
+=09}
+
+=09return false;
+}
+
 static void iwl_mei_handle_csme_filters(struct mei_cl_device *cldev,
 =09=09=09=09=09const struct iwl_sap_csme_filters *filters)
 {
@@ -714,6 +768,17 @@ static void iwl_mei_handle_csme_filters(struct mei_cl_=
device *cldev,
=20
 =09if (old_filters)
 =09=09kfree_rcu(old_filters, rcu_head);
+
+=09if (mei->ip_refresh_on_filters) {
+=09=09bool pass =3D iwl_mei_filters_pass_dhcp_reply(&filters->filters);
+
+=09=09dev_dbg(&cldev->dev, "CSME filters %s DHCP replies\n",
+=09=09=09pass ? "pass" : "do not yet pass");
+=09=09if (pass) {
+=09=09=09mei->ip_refresh_on_filters =3D false;
+=09=09=09iwl_mei_request_ip_refresh(cldev);
+=09=09}
+=09}
 }
=20
 static void
@@ -826,6 +891,8 @@ static void iwl_mei_handle_amt_state(struct mei_cl_devi=
ce *cldev,
=20
 =09mei->amt_enabled =3D dw->val;
=20
+=09mei->ip_refresh_on_filters =3D mei->amt_enabled;
+
 =09if (mei->amt_enabled)
 =09=09iwl_mei_set_init_conf(mei);
 =09else if (iwl_mei_cache.ops)
@@ -1019,6 +1086,7 @@ static void iwl_mei_handle_sap_msg(struct mei_cl_devi=
ce *cldev,
 =09=09=09iwl_mei_handle_csme_taking_ownership, 0);
 =09SAP_MSG_HANDLER(PLDR_ACK, iwl_mei_handle_pldr_ack,
 =09=09=09sizeof(struct iwl_sap_pldr_ack_data));
+=09SAP_MSG_HANDLER(TRIGGER_IP_REFRESH, iwl_mei_handle_ip_refresh, 0);
 =09default:
 =09/*
 =09 * This is not really an error, there are message that we decided
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/mvm.h b/drivers/net/wir=
eless/intel/iwlwifi/mvm/mvm.h
index ae2ee8771f16..0883d2ee5c11 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/mvm.h
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/mvm.h
@@ -2683,6 +2683,8 @@ static inline bool iwl_mvm_mei_filter_scan(struct iwl=
_mvm *mvm,
 =09return false;
 }
=20
+void iwl_mvm_send_ip_refresh_event(struct iwl_mvm *mvm,
+=09=09=09=09   struct ieee80211_vif *vif);
 void iwl_mvm_send_roaming_forbidden_event(struct iwl_mvm *mvm,
 =09=09=09=09=09  struct ieee80211_vif *vif,
 =09=09=09=09=09  bool forbidden);
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/ops.c b/drivers/net/wir=
eless/intel/iwlwifi/mvm/ops.c
index 183251457361..84cc2944ca8f 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
@@ -1185,12 +1185,23 @@ static void iwl_mvm_mei_nic_stolen(void *priv)
 =09rtnl_unlock();
 }
=20
+static void iwl_mvm_mei_ip_refresh(void *priv)
+{
+=09struct iwl_mvm *mvm =3D priv;
+
+=09if (!mvm->hw_registered || !mvm->csme_vif)
+=09=09return;
+
+=09iwl_mvm_send_ip_refresh_event(mvm, mvm->csme_vif);
+}
+
 static const struct iwl_mei_ops mei_ops =3D {
 =09.me_conn_status =3D iwl_mvm_me_conn_status,
 =09.rfkill =3D iwl_mvm_mei_rfkill,
 =09.roaming_forbidden =3D iwl_mvm_mei_roaming_forbidden,
 =09.sap_connected =3D iwl_mvm_mei_sap_connected,
 =09.nic_stolen =3D iwl_mvm_mei_nic_stolen,
+=09.ip_refresh =3D iwl_mvm_mei_ip_refresh,
 };
=20
 static struct iwl_op_mode *
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/vendor-cmd.c b/drivers/=
net/wireless/intel/iwlwifi/mvm/vendor-cmd.c
index 0f7fa6032c66..dda79feb7949 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/vendor-cmd.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/vendor-cmd.c
@@ -106,6 +106,7 @@ static const struct wiphy_vendor_command iwl_mvm_vendor=
_commands[] =3D {
 enum iwl_mvm_vendor_events_idx {
 =09/* 0x0 - 0x3 are deprecated */
 =09IWL_MVM_VENDOR_EVENT_IDX_ROAMING_FORBIDDEN =3D 4,
+=09IWL_MVM_VENDOR_EVENT_IDX_IP_REFRESH,
 =09NUM_IWL_MVM_VENDOR_EVENT_IDX
 };
=20
@@ -115,6 +116,10 @@ iwl_mvm_vendor_events[NUM_IWL_MVM_VENDOR_EVENT_IDX] =
=3D {
 =09=09.vendor_id =3D INTEL_OUI,
 =09=09.subcmd =3D IWL_MVM_VENDOR_CMD_ROAMING_FORBIDDEN_EVENT,
 =09},
+=09[IWL_MVM_VENDOR_EVENT_IDX_IP_REFRESH] =3D {
+=09=09.vendor_id =3D INTEL_OUI,
+=09=09.subcmd =3D IWL_MVM_VENDOR_CMD_IP_REFRESH_EVENT,
+=09},
 };
=20
 void iwl_mvm_vendor_cmds_register(struct iwl_mvm *mvm)
@@ -125,6 +130,25 @@ void iwl_mvm_vendor_cmds_register(struct iwl_mvm *mvm)
 =09mvm->hw->wiphy->n_vendor_events =3D ARRAY_SIZE(iwl_mvm_vendor_events);
 }
=20
+void iwl_mvm_send_ip_refresh_event(struct iwl_mvm *mvm,
+=09=09=09=09   struct ieee80211_vif *vif)
+{
+=09struct sk_buff *msg =3D
+=09=09cfg80211_vendor_event_alloc(mvm->hw->wiphy,
+=09=09=09=09=09    ieee80211_vif_to_wdev(vif),
+=09=09=09=09=09    100, IWL_MVM_VENDOR_EVENT_IDX_IP_REFRESH,
+=09=09=09=09=09    GFP_KERNEL);
+=09if (!msg)
+=09=09return;
+
+=09if (nla_put(msg, IWL_MVM_VENDOR_ATTR_VIF_ADDR, ETH_ALEN, vif->addr)) {
+=09=09kfree_skb(msg);
+=09=09return;
+=09}
+
+=09cfg80211_vendor_event(msg, GFP_KERNEL);
+}
+
 void iwl_mvm_send_roaming_forbidden_event(struct iwl_mvm *mvm,
 =09=09=09=09=09  struct ieee80211_vif *vif,
 =09=09=09=09=09  bool forbidden)
diff --git a/include/uapi/linux/nl80211-vnd-intel.h b/include/uapi/linux/nl=
80211-vnd-intel.h
index 79ccc9401d50..f95abb1fd405 100644
--- a/include/uapi/linux/nl80211-vnd-intel.h
+++ b/include/uapi/linux/nl80211-vnd-intel.h
@@ -45,12 +45,19 @@
  * @IWL_MVM_VENDOR_CMD_ROAMING_FORBIDDEN_EVENT: notifies if roaming is all=
owed.
  *=09It contains a &IWL_MVM_VENDOR_ATTR_ROAMING_FORBIDDEN and a
  *=09&IWL_MVM_VENDOR_ATTR_VIF_ADDR attributes.
+ * @IWL_MVM_VENDOR_CMD_IP_REFRESH_EVENT: the CSME firmware needs the host =
to
+ *=09refresh its DHCP lease on the interface with the
+ *=09&IWL_MVM_VENDOR_ATTR_VIF_ADDR attribute. The CSME firmware shares the
+ *=09host's IPv4 address and learns it from the host's DHCP exchange; with=
out
+ *=09a refresh it falls back to a lease of its own after a timeout. The us=
er
+ *=09space DHCP client should renew the lease when it receives this event.
  */
=20
 enum iwl_mvm_vendor_cmd {
 =09IWL_MVM_VENDOR_CMD_GET_CSME_CONN_INFO=09=09=09=3D 0x2d,
 =09IWL_MVM_VENDOR_CMD_HOST_GET_OWNERSHIP=09=09=09=3D 0x30,
 =09IWL_MVM_VENDOR_CMD_ROAMING_FORBIDDEN_EVENT=09=09=3D 0x32,
+=09IWL_MVM_VENDOR_CMD_IP_REFRESH_EVENT=09=09=09=3D 0x3c,
 };
=20
 enum iwl_vendor_auth_akm_mode {
--=20
2.55.0

