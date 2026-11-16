Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847271;
	b=APkLuU9uwU0iXnCz3QgyuzmXQgfj5m4KUmqV7taA41SSIB8TTk5aV1i205S/2fH2DL8Q
	 5gZgwPITOIv9uRc+T6tkxOu1xXpKYTUJhRGwbZXl2MbTqetvCxVifX4jRimhVtZefEEJu
	 XFeiaYO+1GcmyzutieNHZaNk1JLzBv1Yg24ByOmKdsmRyWyD2o/60JC3mJnDM/dkyhqrs
	 QVBr05/xqka148WGGRvw1jUPGEH/zE1q67q40c8XHjfIMkD+MD5QfIDpQk6MBb1s3hkKF
	 qFLCe6RpZefIMJEToz+VeWj2PvXaAlS/m0kJbuo82xWv6bQhf4MJZyJAmkSMUbsje2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847271;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=chqJkz8VlsxxYBzwxSZv+drgaTNPkj2FQ71kub19iKY=;
	b=Z7DdIIDoAbo/ZYRWa+DT+DAom6R/elBAIMwH3OYIV2RZnUYn+T91T8eMIQNj5lQbyQSq
	 zJSiSOUalRuSu0VbxhKetfldHnOGShRaDmJqS+xsThPRWw16jM3/mZI5suEUB43CJIWs6
	 oXnUr0+aS7oogbEeQO3y1GADxJJxbzU+np6PDeI3fZj3aiXwWEvTBtYAShh2q+9qwDwsV
	 q+CNo/AaUWmWgV6O1pGJFhrQY1Nqcpvv/V9Cr0Tk7grV5ZPD/unwI3epB+c/uzolwpihL
	 a4goimD5967sTTltCKOFQWbYuuFjua1xr5RpOxCbPIV/ceIuBUXNqfCBbIHS0zMcVLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=IKIt3OG2;
	arc=none smtp.remote-ip=109.224.244.118
Received: from mail-244118.protonmail.ch (mail-244118.protonmail.ch [109.224.244.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A00606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71A00606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=IKIt3OG2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1794847268; x=1795106468;
	bh=chqJkz8VlsxxYBzwxSZv+drgaTNPkj2FQ71kub19iKY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IKIt3OG2HsEsLpr/PRRtCD0WbA/VO09bCQzrzTGfl5hV2/aatoI8BWDAeqCo7kFCk
	 QyFYHs1BC4g4O8H1ULD/TNnEMayiZKMnG7aRM5pQZv7w5/L3N90U9v5qY9S56ynAai
	 tRcAnd+8JseFlLTwK1XpG0u8ISULHtwYQMv2M5sufnM6F70C1cKFyIS2aLaSw99UqV
	 9uXgZbCP0wnQoi3p3Ey+pYuzowo3PBdqGaHOoN5UGartyqKKyBL2KTy7+RxG20HsG3
	 4nk6fg6768cdaHlgjqEahuoLyau6m4oCqKu1SZYofCqXoqNZZ7KzUlqqycWi/RSTMe
	 h8A76OynK/E9Q==
Date: Mon, 16 Nov 2026 16:41:04 +0000
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: Johannes Berg <johannes@sipsolutions.net>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Kalle Valo <kvalo@kernel.org>, Ayala Beker <ayala.beker@intel.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] wifi: iwlwifi: pcie: use the CSME path when the NIC cannot be woken at probe
Message-ID: <bc42d99ffe982a5af20cd7dd7809680b3979789c.1794846777.git.arc@empyreal.works>
In-Reply-To: <cover.1794846777.git.arc@empyreal.works>
References: <cover.1794846777.git.arc@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 048c2f91cbabc8ee28a503f199514f1651a31764
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

When Intel AMT powers the host on shortly after a shutdown, CSME can
still be driving the NIC while it hands it back to the host. The host's
NIC_READY semaphore is free then, so iwl_pcie_prepare_card_hw() succeeds,
but the MAC clock does not come up within the 25 ms that
iwl_pcie_activate_nic() polls, and the probe fails for good:

  iwlwifi 0000:00:14.3: CSR_RESET =3D 0x11
  iwlwifi 0000:00:14.3: probe with driver iwlwifi failed with error -110

CSME then keeps the device, and the following boots fail the same way
until AMT's wireless is switched off and on again.

At that point HW_IF_CONFIG reads 0x02080000 (ME_OWN and IAMT_UP set). If
the SAP connection to CSME is up, or comes up within 5 seconds, continue
as when CSME visibly owns the device at probe: drop the init-done request,
set csme_own and let the op mode take the NVM from CSME and request the
device over SAP before using it.

Tested on an HP ZBook Firefly 14 G10 (AX211, CSME 16.1) with AMT's
wireless enabled: without this change four of six AMT power-ons and
resets left the host without Wi-Fi; with it, power-ons pressed as soon as
AMT reported the host off came back on Wi-Fi 36-48 s later.

Fixes: 2fd8aaaeb874 ("iwlwifi: pcie: try to grab NIC access early")
Signed-off-by: Andrei Rusu de Castro <arc@empyreal.works>
---
 .../net/wireless/intel/iwlwifi/pcie/trans.c   | 40 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c b/drivers/net/=
wireless/intel/iwlwifi/pcie/trans.c
index 0f4e309fe32b..e95b52332cea 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
@@ -4182,6 +4182,40 @@ static void iwl_pcie_check_me_status(struct iwl_tran=
s *trans)
 =09schedule_delayed_work(&trans_pcie->me_recheck_wk, HZ);
 }
=20
+/*
+ * CSME (Intel AMT) can still be driving the NIC while it hands the device
+ * over to the host, for example right after the host was powered on throu=
gh
+ * AMT: the host gets the hardware semaphore, but the MAC does not wake. I=
f
+ * the SAP connection to CSME is up, or comes up shortly, continue as when
+ * CSME visibly owns the device: the op mode gets the NVM from CSME and as=
ks
+ * it for the device over SAP before using it.
+ */
+static bool iwl_pcie_csme_drives_nic(struct iwl_trans *trans)
+{
+=09int t;
+
+=09for (t =3D 0; !iwl_mei_is_connected() && t < 5000; t +=3D 100)
+=09=09msleep(100);
+
+=09if (!iwl_mei_is_connected())
+=09=09return false;
+
+=09IWL_INFO(trans,
+=09=09 "Couldn't wake the NIC but SAP is connected, CSME owns it (HW_IF_CO=
NFIG 0x%08x)\n",
+=09=09 iwl_trans_pcie_read32(trans, CSR_HW_IF_CONFIG_REG));
+
+=09if (trans->mac_cfg->device_family >=3D IWL_DEVICE_FAMILY_BZ)
+=09=09iwl_trans_clear_bit(trans, CSR_GP_CNTRL,
+=09=09=09=09    CSR_GP_CNTRL_REG_FLAG_BZ_MAC_ACCESS_REQ |
+=09=09=09=09    CSR_GP_CNTRL_REG_FLAG_MAC_INIT);
+=09else
+=09=09iwl_trans_clear_bit(trans, CSR_GP_CNTRL,
+=09=09=09=09    CSR_GP_CNTRL_REG_FLAG_INIT_DONE);
+
+=09trans->csme_own =3D true;
+=09return true;
+}
+
 int _iwl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent,
 =09=09   const struct iwl_mac_cfg *mac_cfg,
 =09=09   u8 __iomem *hw_base, u32 hw_rev)
@@ -4218,9 +4252,11 @@ int _iwl_pci_probe(struct pci_dev *pdev, const struc=
t pci_device_id *ent,
 =09ret =3D iwl_pcie_prepare_card_hw(iwl_trans);
 =09if (!ret) {
 =09=09ret =3D iwl_trans_activate_nic(iwl_trans);
-=09=09if (ret)
+=09=09if (ret && iwl_pcie_csme_drives_nic(iwl_trans)) {
+=09=09=09ret =3D 0;
+=09=09} else if (ret) {
 =09=09=09goto out_free_trans;
-=09=09if (iwl_trans_grab_nic_access(iwl_trans)) {
+=09=09} else if (iwl_trans_grab_nic_access(iwl_trans)) {
 =09=09=09get_crf_id(iwl_trans, &info, &hw_wfpm_id);
 =09=09=09/* all good */
 =09=09=09iwl_trans_release_nic_access(iwl_trans);
--=20
2.55.0

