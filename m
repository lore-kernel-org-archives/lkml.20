Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847274;
	b=UqtexsCjfUCufTC49bNXSgbNy+aIcJ/34PEkxCLZa0ekgbWN+J2qWXLj2T1ijXYHq6Nb
	 EyLB0q1/NhKoYYzg6yBDctrVUdjql94UJ084pxoPVRHg3lXZigLkPrUD2GB6wq7WL9hoN
	 bIry5FLNDMeFvap7hk87s8cPvnJJTPdEeVsXJFinmNOndYzcoUXfFAtk99CvtJdv/rMgi
	 0VEpKtUDXayN3UXEl4eZBkZX6wUWPOpHlSuhmJWAsTJhV2VNOjTblp8Jbsz6AKtjV05lA
	 RmW5hlN9TFWmsKJGGsURmtTzVj8OpNBhlydtQ4ibEvmR8MxgRZuE6DzDOSgLnzFgG9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847274;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=L1HPCLuxL47HcECfhtLJ+OJ6/lU/iL+27C/QG4+YTtc=;
	b=iiFb3VnSk/Csa7kZYoZlfTYOtkqfhw5g7QGt6UDmnLjGR5wX01HIxyeEJTW2v37NWx6K
	 wuQpIAWUMNKMb56PQwA72RPie1J441VNy2OMDGYfzVPIBEKsZTV0BETsamNpzwjWPZujW
	 DiDdk3ypezrQYaXdkK+K6VDkyL+2X/jekESJxb+jxJbBEqo/zZ/bZ/6ah4uNbu03PVv/I
	 yZmmRHGHpgyjM+oXpCrYjoliYlTKvqMUGEIfFPNCd+zns3HhkcvIwQDUU6cAZ+MRORXbO
	 7FXVfWPMuHW0smnU1Lz9CWSUbnz8AGnEAypNmcAWpuAayrZy8IwDRHvsBC5ytt4BVvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=YMe61yAk;
	arc=none smtp.remote-ip=185.70.43.20
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EBE606A329;
	Mon, 16 Nov 2026 16:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17EBE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=YMe61yAk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1794847272; x=1795106472;
	bh=L1HPCLuxL47HcECfhtLJ+OJ6/lU/iL+27C/QG4+YTtc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YMe61yAkx/chxgLXetR35+tJMkE91X8rxSwtrD30jYFHZ/PIL4Jhss/KL2GE4phPK
	 7pDfsyIdSruVTENAW+rgt2x1A6+t1LD+HMdMbTucSYqX/08WWinLrNS8k8bmlH9CtY
	 bsVE4WPCxYToGtGcmLo08Xy7FX+sA7gNOSvRBuh53/VdVTpmVQ4J+Nh+3BBYKpM8gj
	 VGu50dCCKHdd/YNF87GUTrRkrrytJ1uKstBziIuVxAliMVtZWRXLShScc9rG2mz50M
	 rbl/gQW6ddinZcC9aicwFBT/xTT5bxTOkncNdUCbeiiPdi0A8POEobhSP1aExQuH5t
	 Uv/IEIK6unSDQ==
Date: Mon, 16 Nov 2026 16:41:08 +0000
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: Johannes Berg <johannes@sipsolutions.net>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Kalle Valo <kvalo@kernel.org>, Ayala Beker <ayala.beker@intel.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] wifi: iwlwifi: mvm: take the NVM from CSME when it takes the device back
Message-ID: <8184bd7d05625acc13d0a641af387431c5b0499f.1794846777.git.arc@empyreal.works>
In-Reply-To: <cover.1794846777.git.arc@empyreal.works>
References: <cover.1794846777.git.arc@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 203728c2fd4281b31860a2118c71be367ef10926
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

Right after Intel AMT powered the host on, ownership of the device can
still move between CSME and the host. The last iwl_pcie_prepare_card_hw()
of the probe may get the device, clearing csme_own, and CSME take it back
before iwl_mvm_start_get_nvm() starts it. iwl_trans_start_hw() then fails
with -EBUSY after setting csme_own again:

  iwlwifi 0000:00:14.3: SAP not supported for this NIC family
  iwlwifi 0000:00:14.3: Error while preparing HW: -16

and the op mode never comes up, so the host has no Wi-Fi until it is
rebooted. HW_IF_CONFIG read 0x10080000 at probe in that case (IAMT_UP
without ME_OWN).

When starting the device fails with -EBUSY and csme_own is set, take the
NVM from CSME, as when CSME owned the device at probe; the device itself
is then requested over SAP when the interface comes up.

Fixes: 6d19a5eba5cd ("iwlwifi: integrate with iwlmei")
Signed-off-by: Andrei Rusu de Castro <arc@empyreal.works>
---
 drivers/net/wireless/intel/iwlwifi/mvm/ops.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/ops.c b/drivers/net/wir=
eless/intel/iwlwifi/mvm/ops.c
index 183251457361..7818453db4d4 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
@@ -822,9 +822,12 @@ static const struct iwl_fw_runtime_ops iwl_mvm_fwrt_op=
s =3D {
 static int iwl_mvm_start_get_nvm(struct iwl_mvm *mvm)
 {
 =09struct iwl_trans *trans =3D mvm->trans;
+=09bool tried_csme =3D false;
 =09int ret;
=20
+get_nvm_from_csme:
 =09if (trans->csme_own) {
+=09=09tried_csme =3D true;
 =09=09if (WARN(!mvm->mei_registered,
 =09=09=09 "csme is owner, but we aren't registered to iwlmei\n"))
 =09=09=09goto get_nvm_from_fw;
@@ -859,6 +862,16 @@ static int iwl_mvm_start_get_nvm(struct iwl_mvm *mvm)
 =09=09mutex_unlock(&mvm->mutex);
 =09=09wiphy_unlock(mvm->hw->wiphy);
 =09=09rtnl_unlock();
+=09=09/*
+=09=09 * Right after CSME (Intel AMT) powered the host on, ownership
+=09=09 * can still move between CSME and the host: the probe's last
+=09=09 * check may get the device and CSME take it back before we
+=09=09 * start it. Then the device is busy and csme_own is set again,
+=09=09 * so take the NVM from CSME, as when CSME owned it at probe,
+=09=09 * and get the device over SAP when the interface comes up.
+=09=09 */
+=09=09if (ret =3D=3D -EBUSY && trans->csme_own && !tried_csme)
+=09=09=09goto get_nvm_from_csme;
 =09=09return ret;
 =09}
=20
--=20
2.55.0

