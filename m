Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462134FE2E8;
	Thu,  1 Oct 2026 14:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865199; cv=none; b=HNxsLJW2Cx0X4tqeSb5CJorOUTfvLtcKMPmPJb6JXfVcxqq1mt2tle6kkzrX++ibZvMmzU0vGZ4UDpDwLZhu+P4CS4Yuj8RI+Mdyxivr7kkJgy7LzVD/VruKXiL6bPu03aQpS4DRShdcRXPCR3zSjjS7V3voge2KG7NMDxN08/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865199; c=relaxed/simple;
	bh=ClcY9zf+yXgbBpMWKPi0RVRgJAvG6d9/mm5qJDfIUMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JpPbY265mhzsmEtPCUFp5l7qfjzJhwHe1resaIyL9e8FEU0DO6hbXXT81TuVXBF5TSn9Ys7eYXqAp74gp7h/fJn/V65abRkO307TUKUUs65WNrVbPscaANDQXjZjW1pHjABL/NokUw6WQIASloMPRgvxIe0tzfkmdxXa1A8ZBcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWfy+Hp2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWfy+Hp2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A1D1F000FF;
	Thu,  1 Oct 2026 14:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865192;
	bh=AYb0/CDUbKDDdRHPi771HHd+ugGnwwFjXjtV1GycWYk=;
	h=Date:From:To:Cc:Subject;
	b=OWfy+Hp2ib8OcQ/NoJbgrYuJGl6MgYc6NC6qQ+duUc9nZPy3PJ6AxANsoxPkkdb7F
	 iwe9fQx4lxhHhUhAz2v3lNkdyIVUKE63SM6ivndTMaU4vjP+zp2LJ+O0BLLUDgqKzr
	 zXGsCCmm3Yx/n9kcA2pMuLLzcyJxjDOVrs+FuSth2KFUO9PtQVX1X03/BRDe2DGhBT
	 DLofHxmq6YQhDpSQCPUDXo2DMG/8P/+Z0HTELruzh03Sy2FAdLGUzxdwftejlemclD
	 2ogQhQWQBSUJNifZUzgv4R06BXNyvxY8zW3b8PZbu+N6vqQsz4AubcoRW83daMuRH2
	 yXDSNc5Qzd7MA==
Date: Thu, 1 Oct 2026 15:33:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iwlwifi-next tree with the iwlwifi
 tree
Message-ID: <ar5vJLMoEjjTyefw@sirena.org.uk>
Mail-Followup-To: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I/AdIQbUxvto0fU1"
Content-Disposition: inline


--I/AdIQbUxvto0fU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iwlwifi-next tree got a conflict in:

  drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c

between commit:

  1e4bd2d49a41e ("wifi: iwlwifi: mvm: debugfs: avoid zero divisor in RSS wr=
iter")

=66rom the iwlwifi tree and commit:

  3ba0a18a80c0d ("wifi: iwlwifi: mvm: remove indirection_tbl debugfs entry")

=66rom the iwlwifi-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c
index ae04f84fe9ae8,90175307a7db2..0000000000000
--- a/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c
@@@ -1,6 -1,6 +1,6 @@@
  // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
  /*
 - * Copyright (C) 2012-2014, 2018-2023, 2025 Intel Corporation
 + * Copyright (C) 2012-2014, 2018-2023, 2025-2026 Intel Corporation
   * Copyright (C) 2013-2015 Intel Mobile Communications GmbH
   * Copyright (C) 2016-2017 Intel Deutschland GmbH
   */
@@@ -13,7 -13,7 +13,7 @@@
 =20
  #include "mvm.h"
  #include "sta.h"
- #include "iwl-io.h"
+ #include "iwl-trans.h"
  #include "debugfs.h"
  #include "iwl-modparams.h"
  #include "iwl-drv.h"
@@@ -153,72 -153,6 +153,6 @@@ static ssize_t iwl_dbgfs_tx_flush_write
  	return ret;
  }
 =20
- static ssize_t iwl_dbgfs_sram_read(struct file *file, char __user *user_b=
uf,
- 				   size_t count, loff_t *ppos)
- {
- 	struct iwl_mvm *mvm =3D file->private_data;
- 	const struct fw_img *img;
- 	unsigned int ofs, len;
- 	size_t ret;
- 	u8 *ptr;
-=20
- 	if (!iwl_mvm_firmware_running(mvm))
- 		return -EINVAL;
-=20
- 	/* default is to dump the entire data segment */
- 	img =3D &mvm->fw->img[mvm->fwrt.cur_fw_img];
- 	ofs =3D img->sec[IWL_UCODE_SECTION_DATA].offset;
- 	len =3D img->sec[IWL_UCODE_SECTION_DATA].len;
-=20
- 	if (mvm->dbgfs_sram_len) {
- 		ofs =3D mvm->dbgfs_sram_offset;
- 		len =3D mvm->dbgfs_sram_len;
- 	}
-=20
- 	ptr =3D kzalloc(len, GFP_KERNEL);
- 	if (!ptr)
- 		return -ENOMEM;
-=20
- 	iwl_trans_read_mem_bytes(mvm->trans, ofs, ptr, len);
-=20
- 	ret =3D simple_read_from_buffer(user_buf, count, ppos, ptr, len);
-=20
- 	kfree(ptr);
-=20
- 	return ret;
- }
-=20
- static ssize_t iwl_dbgfs_sram_write(struct iwl_mvm *mvm, char *buf,
- 				    size_t count, loff_t *ppos)
- {
- 	const struct fw_img *img;
- 	u32 offset, len;
- 	u32 img_offset, img_len;
-=20
- 	if (!iwl_mvm_firmware_running(mvm))
- 		return -EINVAL;
-=20
- 	img =3D &mvm->fw->img[mvm->fwrt.cur_fw_img];
- 	img_offset =3D img->sec[IWL_UCODE_SECTION_DATA].offset;
- 	img_len =3D img->sec[IWL_UCODE_SECTION_DATA].len;
-=20
- 	if (sscanf(buf, "%x,%x", &offset, &len) =3D=3D 2) {
- 		if ((offset & 0x3) || (len & 0x3))
- 			return -EINVAL;
-=20
- 		if (offset + len > img_offset + img_len)
- 			return -EINVAL;
-=20
- 		mvm->dbgfs_sram_offset =3D offset;
- 		mvm->dbgfs_sram_len =3D len;
- 	} else {
- 		mvm->dbgfs_sram_offset =3D 0;
- 		mvm->dbgfs_sram_len =3D 0;
- 	}
-=20
- 	return count;
- }
-=20
  static ssize_t iwl_dbgfs_set_nic_temperature_read(struct file *file,
  						  char __user *user_buf,
  						  size_t count, loff_t *ppos)
@@@ -591,16 -525,24 +525,24 @@@ static ssize_t iwl_dbgfs_tas_get_status
  	if (ret < 0)
  		return ret;
 =20
+ 	if (iwl_rx_packet_payload_len(hcmd.resp_pkt) !=3D sizeof(*rsp)) {
+ 		iwl_free_resp(&hcmd);
+ 		return -EIO;
+ 	}
+=20
  	buff =3D kzalloc(bufsz, GFP_KERNEL);
- 	if (!buff)
+ 	if (!buff) {
+ 		iwl_free_resp(&hcmd);
  		return -ENOMEM;
+ 	}
  	pos =3D buff;
  	endpos =3D pos + bufsz;
 =20
  	rsp =3D (void *)hcmd.resp_pkt->data;
 =20
  	pos +=3D scnprintf(pos, endpos - pos, "TAS Conclusion:\n");
- 	for (i =3D 0; i < rsp->in_dual_radio + 1; i++) {
+ 	for (i =3D 0; i < min_t(int, rsp->in_dual_radio + 1,
+ 			      ARRAY_SIZE(rsp->tas_status_mac)); i++) {
  		if (rsp->tas_status_mac[i].dynamic_status &
  		    BIT(TAS_DYNA_ACTIVE)) {
  			pos +=3D scnprintf(pos, endpos - pos, "\tON for ");
@@@ -655,7 -597,8 +597,8 @@@
  			 "\tDo TAS Support Dual Radio?: %s\n",
  			 rsp->in_dual_radio ? "TRUE" : "FALSE");
 =20
- 	for (i =3D 0; i < rsp->in_dual_radio + 1; i++) {
+ 	for (i =3D 0; i < min_t(int, rsp->in_dual_radio + 1,
+ 			      ARRAY_SIZE(rsp->tas_status_mac)); i++) {
  		if (rsp->tas_status_mac[i].static_status =3D=3D 0) {
  			pos +=3D scnprintf(pos, endpos - pos,
  					 "Static status: disabled\n");
@@@ -1159,7 -1102,7 +1102,7 @@@ static ssize_t iwl_dbgfs_fw_nmi_write(s
  	if (count =3D=3D 6 && !strcmp(buf, "nolog\n"))
  		set_bit(IWL_MVM_STATUS_SUPPRESS_ERROR_LOG_ONCE, &mvm->status);
 =20
- 	iwl_force_nmi(mvm->trans);
+ 	iwl_trans_force_nmi(mvm->trans);
 =20
  	return count;
  }
@@@ -1211,56 -1154,6 +1154,6 @@@ iwl_dbgfs_scan_ant_rxchain_write(struc
  	return count;
  }
 =20
- static ssize_t iwl_dbgfs_indirection_tbl_write(struct iwl_mvm *mvm,
- 					       char *buf, size_t count,
- 					       loff_t *ppos)
- {
- 	struct iwl_rss_config_cmd cmd =3D {
- 		.flags =3D cpu_to_le32(IWL_RSS_ENABLE),
- 		.hash_mask =3D IWL_RSS_HASH_TYPE_IPV4_TCP |
- 			     IWL_RSS_HASH_TYPE_IPV4_UDP |
- 			     IWL_RSS_HASH_TYPE_IPV4_PAYLOAD |
- 			     IWL_RSS_HASH_TYPE_IPV6_TCP |
- 			     IWL_RSS_HASH_TYPE_IPV6_UDP |
- 			     IWL_RSS_HASH_TYPE_IPV6_PAYLOAD,
- 	};
- 	int ret, i, num_repeats, nbytes =3D count / 2;
-=20
- 	if (!nbytes || nbytes > sizeof(cmd.indirection_table))
- 		return -EINVAL;
-=20
- 	ret =3D hex2bin(cmd.indirection_table, buf, nbytes);
- 	if (ret)
- 		return ret;
-=20
- 	/*
- 	 * The input is the redirection table, partial or full.
- 	 * Repeat the pattern if needed.
- 	 * For example, input of 01020F will be repeated 42 times,
- 	 * indirecting RSS hash results to queues 1, 2, 15 (skipping
- 	 * queues 3 - 14).
- 	 */
- 	num_repeats =3D ARRAY_SIZE(cmd.indirection_table) / nbytes;
- 	for (i =3D 1; i < num_repeats; i++)
- 		memcpy(&cmd.indirection_table[i * nbytes],
- 		       cmd.indirection_table, nbytes);
- 	/* handle cut in the middle pattern for the last places */
- 	memcpy(&cmd.indirection_table[i * nbytes], cmd.indirection_table,
- 	       ARRAY_SIZE(cmd.indirection_table) % nbytes);
-=20
- 	netdev_rss_key_fill(cmd.secret_key, sizeof(cmd.secret_key));
-=20
- 	mutex_lock(&mvm->mutex);
- 	if (iwl_mvm_firmware_running(mvm))
- 		ret =3D iwl_mvm_send_cmd_pdu(mvm, RSS_CONFIG_CMD, 0,
- 					   sizeof(cmd), &cmd);
- 	else
- 		ret =3D 0;
- 	mutex_unlock(&mvm->mutex);
-=20
- 	return ret ?: count;
- }
-=20
  static ssize_t iwl_dbgfs_inject_packet_write(struct iwl_mvm *mvm,
  					     char *buf, size_t count,
  					     loff_t *ppos)
@@@ -1655,7 -1548,7 +1548,7 @@@ iwl_dbgfs_prph_reg_read(struct file *fi
 =20
  	pos +=3D scnprintf(buf + pos, bufsz - pos, "Reg 0x%x: (0x%x)\n",
  		mvm->dbgfs_prph_reg_addr,
- 		iwl_read_prph(mvm->trans, mvm->dbgfs_prph_reg_addr));
+ 		iwl_trans_read_prph(mvm->trans, mvm->dbgfs_prph_reg_addr));
 =20
  	return simple_read_from_buffer(user_buf, count, ppos, buf, pos);
  }
@@@ -1676,7 -1569,7 +1569,7 @@@ iwl_dbgfs_prph_reg_write(struct iwl_mv
  	if (args !=3D 2)
  		return -EINVAL;
 =20
- 	iwl_write_prph(mvm->trans, mvm->dbgfs_prph_reg_addr, value);
+ 	iwl_trans_write_prph(mvm->trans, mvm->dbgfs_prph_reg_addr, value);
 =20
  out:
  	return count;
@@@ -1919,7 -1812,6 +1812,6 @@@ MVM_DEBUGFS_WRITE_FILE_OPS(start_ctdp,=20
  MVM_DEBUGFS_WRITE_FILE_OPS(force_ctkill, 8);
  MVM_DEBUGFS_WRITE_FILE_OPS(tx_flush, 16);
  MVM_DEBUGFS_WRITE_FILE_OPS(send_echo_cmd, 8);
- MVM_DEBUGFS_READ_WRITE_FILE_OPS(sram, 64);
  MVM_DEBUGFS_READ_WRITE_FILE_OPS(set_nic_temperature, 64);
  MVM_DEBUGFS_READ_FILE_OPS(nic_temp);
  MVM_DEBUGFS_READ_FILE_OPS(stations);
@@@ -1936,8 -1828,6 +1828,6 @@@ MVM_DEBUGFS_READ_WRITE_FILE_OPS(scan_an
  MVM_DEBUGFS_READ_WRITE_FILE_OPS(fw_dbg_conf, 8);
  MVM_DEBUGFS_WRITE_FILE_OPS(fw_dbg_clear, 64);
  MVM_DEBUGFS_WRITE_FILE_OPS(dbg_time_point, 64);
- MVM_DEBUGFS_WRITE_FILE_OPS(indirection_tbl,
- 			   (IWL_RSS_INDIRECTION_TABLE_SIZE * 2));
  MVM_DEBUGFS_WRITE_FILE_OPS(inject_packet, 512);
  MVM_DEBUGFS_WRITE_FILE_OPS(inject_beacon_ie, 512);
  MVM_DEBUGFS_WRITE_FILE_OPS(inject_beacon_ie_restore, 512);
@@@ -2117,7 -2007,6 +2007,6 @@@ void iwl_mvm_dbgfs_register(struct iwl_
  	spin_lock_init(&mvm->drv_stats_lock);
 =20
  	MVM_DEBUGFS_ADD_FILE(tx_flush, mvm->debugfs_dir, 0200);
- 	MVM_DEBUGFS_ADD_FILE(sram, mvm->debugfs_dir, 0600);
  	MVM_DEBUGFS_ADD_FILE(set_nic_temperature, mvm->debugfs_dir, 0600);
  	MVM_DEBUGFS_ADD_FILE(nic_temp, mvm->debugfs_dir, 0400);
  	MVM_DEBUGFS_ADD_FILE(ctdp_budget, mvm->debugfs_dir, 0400);
@@@ -2137,7 -2026,6 +2026,6 @@@
  	MVM_DEBUGFS_ADD_FILE(fw_dbg_clear, mvm->debugfs_dir, 0200);
  	MVM_DEBUGFS_ADD_FILE(dbg_time_point, mvm->debugfs_dir, 0200);
  	MVM_DEBUGFS_ADD_FILE(send_echo_cmd, mvm->debugfs_dir, 0200);
- 	MVM_DEBUGFS_ADD_FILE(indirection_tbl, mvm->debugfs_dir, 0200);
  	MVM_DEBUGFS_ADD_FILE(inject_packet, mvm->debugfs_dir, 0200);
  	MVM_DEBUGFS_ADD_FILE(inject_beacon_ie, mvm->debugfs_dir, 0200);
  	MVM_DEBUGFS_ADD_FILE(inject_beacon_ie_restore, mvm->debugfs_dir, 0200);

--I/AdIQbUxvto0fU1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+byQACgkQJNaLcl1U
h9Bccgf+OHev113b3BmaDqY8qXBkEqJSKXVaUVD9ReSgAU019HPvKFeAtNIRT+C3
AkhKE1lxJxR8/u1F62OttWDNLAsCCSeuOFs2oWn9LZJeFsFVBwE8w0Yiy6KSm6Or
eqN1SgVLBtgfytUBYN5EeEgYUZdP85/lmr0gUOF6TFqNyl2/waM7mXyGYTjXEdbL
+QUBp+/vdSGACeLzBBL6f2cVVz7pYknBx43xil5QQiTLF7BAJT91uCtGruZhF4/g
bG0TpDtMe4Zz19Dh/Ydrn3PFvjV80b6yEXBifzYw+2LGS/P0Ruy8CHDSSOTQPWFa
vgDH0CM6a57y0BD2A2SYslsPESGu1A==
=oqwO
-----END PGP SIGNATURE-----

--I/AdIQbUxvto0fU1--
