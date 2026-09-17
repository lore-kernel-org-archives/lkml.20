Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145264E36E5;
	Thu, 17 Sep 2026 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673953; cv=none; b=qZRYJR6HnNpbYJNz8fGsqoi7N5Y8SyjnCadIk1rDiqgil3fn0RcCv151elVsnmryqMs56DnzOaqg3saC0TCDzeFlr1/evVdX3hJHDpiFFIorFNZwZ4fOLS6dCyF6Zm6feGkbvK/zp1qS6/Ey8E4vTjS7B2mDlQaoO8NO5RQ6VY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673953; c=relaxed/simple;
	bh=WQkgcfgPhULioLNdb9cXK7AgH3vSB1+uDnrO3G2DeLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qpHp7dLToC3PeD2gg/VJijWGTXbNH2z8qnWmFpUISha/4HCkJY10DTrKK0z94lPSnZ/ZDMfRYFNTYW6TKWc+jDURTnOpS/lxkdYZPzhC0CPFHWWMQVfwz6MEP3DXdKkqdjHqsKpFBseD4buy/Bav1F9pDVNLxBMV7Bt2zGgGIsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1G6azor; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1G6azor"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0E51F00893;
	Thu, 17 Sep 2026 19:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789673950;
	bh=2XW0QcR+ioF48olBJxEyzELktnXDfY028oV1liIhZ5A=;
	h=Date:From:To:Cc:Subject;
	b=X1G6azorTcQbnfVikt4BXEcXfPNGufKTG52asFRjcngakwGtvWRaDmKN3ctSimnQK
	 Q8iwiQ1z6o+BOggO5CetLpxRV3JZODDvnxZrZnw2YM4acNIeA630HvLQ9sCr1vtPcw
	 XZr4/Kiy+jJUg4fS5wd0yWyv4dtpfvCsTsJA/NrYZ6plt16q5LMe5Cqkg6pVvw1A77
	 yrRaeVutpWDdbQnh8fGbqu1LDeoDshto7KR3GfmLIB0e/tPeb7Cba79EpOPbg/SOvu
	 rR91D7XhaWck2vICOK2uLCsRBpr1/PpigG0npHMwMZApAMZFbIlLHmT5Tl7hXo+fHS
	 EM1mLHvS3SrIw==
Date: Thu, 17 Sep 2026 20:39:06 +0100
From: Mark Brown <broonie@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Subject: linux-next: manual merge of the scsi-mkp tree with the origin tree
Message-ID: <aqxB2gIACLhW5I0-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w3AvGd+Y//DkYUt8"
Content-Disposition: inline


--w3AvGd+Y//DkYUt8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/ata/libata-scsi.c

between commit:

  6d81700ad7c48 ("ata: libata-scsi: do not raise UA for storage element dep=
opulation and restoration")

=66rom the origin tree and commit:

  c44f095a9d176 ("scsi: ata: libata: Use combined sense codes")

=66rom the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/ata/libata-scsi.c
index db43fd7b64182,66fef7ffbf1b1..0000000000000
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@@ -190,28 -190,25 +190,25 @@@ DEVICE_ATTR(unload_heads, S_IRUGO | S_I
  	    ata_scsi_park_show, ata_scsi_park_store);
  EXPORT_SYMBOL_GPL(dev_attr_unload_heads);
 =20
- bool ata_scsi_sense_is_valid(u8 sk, u8 asc, u8 ascq)
+ bool ata_scsi_sense_is_valid(u8 sense_key, u16 sense_code)
  {
- 	/*
- 	 * If sk =3D=3D NO_SENSE, and asc + ascq =3D=3D NO ADDITIONAL SENSE INFO=
RMATION,
- 	 * then there is no sense data to add.
- 	 */
- 	if (sk =3D=3D 0 && asc =3D=3D 0 && ascq =3D=3D 0)
+ 	if (sense_key =3D=3D NO_SENSE &&
+ 	    sense_code =3D=3D NO_ADDITIONAL_SENSE_INFORMATION)
  		return false;
 =20
  	/* If sk > COMPLETED, sense data is bogus. */
- 	if (sk > COMPLETED)
+ 	if (sense_key > COMPLETED)
  		return false;
 =20
  	return true;
  }
 =20
  void ata_scsi_set_sense(struct ata_device *dev, struct scsi_cmnd *cmd,
- 			u8 sk, u8 asc, u8 ascq)
+ 			u8 sk, u16 code)
  {
  	bool d_sense =3D (dev->flags & ATA_DFLAG_D_SENSE);
 =20
- 	scsi_build_sense(cmd, d_sense, sk, asc, ascq);
+ 	scsi_set_sense(cmd, d_sense, sk, code);
  }
 =20
  static void ata_scsi_set_sense_information(struct ata_queued_cmd *qc)
@@@ -316,8 -313,7 +313,7 @@@ static void ata_scsi_set_passthru_sense
  static void ata_scsi_set_invalid_field(struct ata_device *dev,
  				       struct scsi_cmnd *cmd, u16 field, u8 bit)
  {
- 	ata_scsi_set_sense(dev, cmd, ILLEGAL_REQUEST, 0x24, 0x0);
- 	/* "Invalid field in CDB" */
+ 	ata_scsi_set_sense(dev, cmd, ILLEGAL_REQUEST, INVALID_FIELD_IN_CDB);
  	scsi_set_sense_field_pointer(cmd->sense_buffer, SCSI_SENSE_BUFFERSIZE,
  				     field, bit, 1);
  }
@@@ -325,8 -321,8 +321,8 @@@
  static void ata_scsi_set_invalid_parameter(struct ata_device *dev,
  					   struct scsi_cmnd *cmd, u16 field)
  {
- 	/* "Invalid field in parameter list" */
- 	ata_scsi_set_sense(dev, cmd, ILLEGAL_REQUEST, 0x26, 0x0);
+ 	ata_scsi_set_sense(dev, cmd, ILLEGAL_REQUEST,
+ 			   INVALID_FIELD_IN_PARAMETER_LIST);
  	scsi_set_sense_field_pointer(cmd->sense_buffer, SCSI_SENSE_BUFFERSIZE,
  				     field, 0xff, 0);
  }
@@@ -525,7 -521,8 +521,8 @@@ int ata_cmd_ioctl(struct scsi_device *s
  		 * check condition even if no error. Filter that. */
  		if (scsi_status_is_check_condition(cmd_result)) {
  			if (sshdr.sense_key =3D=3D RECOVERED_ERROR &&
- 			    sshdr.asc =3D=3D 0 && sshdr.ascq =3D=3D 0x1d)
+ 			    sshdr.sense_code =3D=3D
+ 			    ATA_PASS_THROUGH_INFORMATION_AVAILABLE)
  				cmd_result &=3D ~SAM_STAT_CHECK_CONDITION;
  		}
 =20
@@@ -613,7 -610,8 +610,8 @@@ int ata_task_ioctl(struct scsi_device *
  		 * check condition even if no error. Filter that. */
  		if (cmd_result & SAM_STAT_CHECK_CONDITION) {
  			if (sshdr.sense_key =3D=3D RECOVERED_ERROR &&
- 			    sshdr.asc =3D=3D 0 && sshdr.ascq =3D=3D 0x1d)
+ 			    sshdr.sense_code =3D=3D
+ 			    ATA_PASS_THROUGH_INFORMATION_AVAILABLE)
  				cmd_result &=3D ~SAM_STAT_CHECK_CONDITION;
  		}
 =20
@@@ -792,79 -790,143 +790,143 @@@ static void ata_qc_set_pc_nbytes(struc
  	qc->nbytes =3D scsi_bufflen(scmd) + qc->extrabytes;
  }
 =20
+ struct ata_err_sense {
+ 	u8	err_mask;
+ 	u8	sense_key;
+ 	u16	sense_code;
+ };
+=20
  /**
   *	ata_to_sense_error - convert ATA error to SCSI error
   *	@drv_stat: value contained in ATA status register
   *	@drv_err: value contained in ATA error register
   *	@sk: the sense key we'll fill out
-  *	@asc: the additional sense code we'll fill out
-  *	@ascq: the additional sense code qualifier we'll fill out
+  *	@scode: the additional sense code and its qualifier we'll fill out
   *
   *	Converts an ATA error into a SCSI error.  Fill out pointers to
-  *	SK, ASC, and ASCQ bytes for later use in fixed or descriptor
+  *	the sense key and sense code for later use in fixed or descriptor
   *	format sense blocks.
   *
   *	LOCKING:
   *	spin_lock_irqsave(host lock)
   */
- static void ata_to_sense_error(u8 drv_stat, u8 drv_err, u8 *sk, u8 *asc,
- 			       u8 *ascq)
+ static void ata_to_sense_error(u8 drv_stat, u8 drv_err, u8 *sk, u16 *scod=
e)
  {
  	int i;
 =20
  	/* Based on the 3ware driver translation table */
- 	static const unsigned char sense_table[][4] =3D {
- 		/* BBD|ECC|ID|MAR */
- 		{0xd1,		ABORTED_COMMAND, 0x00, 0x00},
- 			// Device busy                  Aborted command
- 		/* BBD|ECC|ID */
- 		{0xd0,		ABORTED_COMMAND, 0x00, 0x00},
- 			// Device busy                  Aborted command
- 		/* ECC|MC|MARK */
- 		{0x61,		HARDWARE_ERROR, 0x00, 0x00},
- 			// Device fault                 Hardware error
- 		/* ICRC|ABRT */		/* NB: ICRC & !ABRT is BBD */
- 		{0x84,		ABORTED_COMMAND, 0x47, 0x00},
- 			// Data CRC error               SCSI parity error
- 		/* MC|ID|ABRT|TRK0|MARK */
- 		{0x37,		NOT_READY, 0x04, 0x00},
- 			// Unit offline                 Not ready
- 		/* MCR|MARK */
- 		{0x09,		NOT_READY, 0x04, 0x00},
- 			// Unrecovered disk error       Not ready
- 		/*  Bad address mark */
- 		{0x01,		MEDIUM_ERROR, 0x13, 0x00},
- 			// Address mark not found for data field
- 		/* TRK0 - Track 0 not found */
- 		{0x02,		HARDWARE_ERROR, 0x00, 0x00},
- 			// Hardware error
- 		/* Abort: 0x04 is not translated here, see below */
- 		/* Media change request */
- 		{0x08,		NOT_READY, 0x04, 0x00},
- 			// FIXME: faking offline
- 		/* SRV/IDNF - ID not found */
- 		{0x10,		ILLEGAL_REQUEST, 0x21, 0x00},
- 			// Logical address out of range
- 		/* MC - Media Changed */
- 		{0x20,		UNIT_ATTENTION, 0x28, 0x00},
- 			// Not ready to ready change, medium may have changed
- 		/* ECC - Uncorrectable ECC error */
- 		{0x40,		MEDIUM_ERROR, 0x11, 0x04},
- 			// Unrecovered read error
- 		/* BBD - block marked bad */
- 		{0x80,		MEDIUM_ERROR, 0x11, 0x04},
- 			// Block marked bad	Medium error, unrecovered read error
- 		{0xFF, 0xFF, 0xFF, 0xFF}, // END mark
+ 	static const struct ata_err_sense sense_table[] =3D {
+ 		{
+ 			/* BBD|ECC|ID|MAR - Device busy */
+ 			0xd1,
+ 			ABORTED_COMMAND,
+ 			NO_ADDITIONAL_SENSE_INFORMATION
+ 		},
+ 		{
+ 			/* BBD|ECC|ID - Device busy */
+ 			0xd0,
+ 			ABORTED_COMMAND,
+ 			NO_ADDITIONAL_SENSE_INFORMATION
+ 		},
+ 		{
+ 			/* ECC|MC|MARK - Device fault */
+ 			0x61,
+ 			HARDWARE_ERROR,
+ 			NO_ADDITIONAL_SENSE_INFORMATION
+ 		},
+ 		{
+ 			/* ICRC|ABRT - Data CRC error */
+ 			/* NB: ICRC & !ABRT is BBD */
+ 			0x84,
+ 			ABORTED_COMMAND,
+ 			SCSI_PARITY_ERROR
+ 		},
+ 		{
+ 			/* MC|ID|ABRT|TRK0|MARK - Unit offline */
+ 			0x37,
+ 			NOT_READY,
+ 			LU_NOT_READY
+ 		},
+ 		{
+ 			/* MCR|MARK - Unrecovered disk error */
+ 			0x09,
+ 			NOT_READY,
+ 			LU_NOT_READY
+ 		},
+ 		{
+ 			/* Bad address mark */
+ 			0x01,
+ 			MEDIUM_ERROR,
+ 			ADDRESS_MARK_NOT_FOUND_FOR_DATA_FIELD
+ 		},
+ 		{
+ 			/* TRK0 - Track 0 not found */
+ 			0x02,
+ 			HARDWARE_ERROR,
+ 			NO_ADDITIONAL_SENSE_INFORMATION
+ 		},
+ 		{
+ 			/* Abort: 0x04 is not translated here, see below */
+ 			/* Media change request */
+ 			0x08,
+ 			NOT_READY,
+ 			LU_NOT_READY
+ 		},
+ 		{
+ 			/* SRV/IDNF - ID not found */
+ 			0x10,
+ 			ILLEGAL_REQUEST,
+ 			LOGICAL_BLOCK_ADDRESS_OUT_OF_RANGE
+ 		},
+ 		{
+ 			/* MC - Media Changed */
+ 			0x20,
+ 			UNIT_ATTENTION,
+ 			NOT_READY_TO_READY_CHANGE_MEDIUM_MAY_HAVE_CHANGED
+ 		},
+ 		{
+ 			/* ECC - Uncorrectable ECC error */
+ 			0x40,
+ 			MEDIUM_ERROR,
+ 			UNRECOVERED_READ_ERROR_AUTO_REALLOCATE_FAILED
+ 		},
+ 		{
+ 			/* BBD - block marked bad */
+ 			0x80,
+ 			MEDIUM_ERROR,
+ 			UNRECOVERED_READ_ERROR_AUTO_REALLOCATE_FAILED
+ 		},
+ 		{
+ 			/* END mark */
+ 			0xFF, 0xFF, 0xFFFF
+ 		},
  	};
- 	static const unsigned char stat_table[][4] =3D {
- 		/* Busy: must be first because BUSY means no other bits valid */
- 		{ ATA_BUSY,	ABORTED_COMMAND, 0x00, 0x00 },
- 		/* Device fault: INTERNAL TARGET FAILURE */
- 		{ ATA_DF,	HARDWARE_ERROR,  0x44, 0x00 },
- 		/* Corrected data error */
- 		{ ATA_CORR,	RECOVERED_ERROR, 0x00, 0x00 },
-=20
- 		{ 0xFF, 0xFF, 0xFF, 0xFF }, /* END mark */
+ 	static const struct ata_err_sense stat_table[] =3D {
+ 		{
+ 			/*
+ 			 * Busy: must be first because BUSY means no other bits
+ 			 * valid.
+ 			 */
+ 			ATA_BUSY,
+ 			ABORTED_COMMAND,
+ 			NO_ADDITIONAL_SENSE_INFORMATION
+ 		},
+ 		{
+ 			/* Device fault */
+ 			ATA_DF,
+ 			HARDWARE_ERROR,
+ 			INTERNAL_TARGET_FAILURE
+ 		},
+ 		{
+ 			/* Corrected data error */
+ 			ATA_CORR,
+ 			RECOVERED_ERROR,
+ 			NO_ADDITIONAL_SENSE_INFORMATION
+ 		},
+ 		{
+ 			/* END mark */
+ 			0xFF, 0xFF, 0xFFFF
+ 		},
  	};
 =20
  	/*
@@@ -876,13 -938,12 +938,12 @@@
 =20
  	if (drv_err) {
  		/* Look for drv_err */
- 		for (i =3D 0; sense_table[i][0] !=3D 0xFF; i++) {
+ 		for (i =3D 0; sense_table[i].err_mask !=3D 0xFF; i++) {
  			/* Look for best matches first */
- 			if ((sense_table[i][0] & drv_err) =3D=3D
- 			    sense_table[i][0]) {
- 				*sk =3D sense_table[i][1];
- 				*asc =3D sense_table[i][2];
- 				*ascq =3D sense_table[i][3];
+ 			if ((sense_table[i].err_mask & drv_err) =3D=3D
+ 			    sense_table[i].err_mask) {
+ 				*sk =3D sense_table[i].sense_key;
+ 				*scode =3D sense_table[i].sense_code;
  				return;
  			}
  		}
@@@ -893,11 -954,10 +954,10 @@@
  	 * has only the ABRT bit set, we decode drv_stat.  ABRT by itself
  	 * is not descriptive enough.
  	 */
- 	for (i =3D 0; stat_table[i][0] !=3D 0xFF; i++) {
- 		if (stat_table[i][0] & drv_stat) {
- 			*sk =3D stat_table[i][1];
- 			*asc =3D stat_table[i][2];
- 			*ascq =3D stat_table[i][3];
+ 	for (i =3D 0; stat_table[i].err_mask !=3D 0xFF; i++) {
+ 		if (stat_table[i].err_mask & drv_stat) {
+ 			*sk =3D stat_table[i].sense_key;
+ 			*scode =3D stat_table[i].sense_code;
  			return;
  		}
  	}
@@@ -907,8 -967,7 +967,7 @@@
  	 * that won't cause people to do things like return a disk wrongly.
  	 */
  	*sk =3D ABORTED_COMMAND;
- 	*asc =3D 0x00;
- 	*ascq =3D 0x00;
+ 	*scode =3D NO_ADDITIONAL_SENSE_INFORMATION;
  }
 =20
  /*
@@@ -931,40 -990,41 +990,41 @@@ static void ata_gen_passthru_sense(stru
  	struct ata_device *dev =3D qc->dev;
  	struct scsi_cmnd *cmd =3D qc->scsicmd;
  	struct ata_taskfile *tf =3D &qc->result_tf;
- 	u8 sense_key, asc, ascq;
+ 	u16 sense_code;
+ 	u8 sense_key;
 =20
  	if (!(qc->flags & ATA_QCFLAG_RTF_FILLED)) {
  		ata_dev_dbg(dev,
  			    "missing result TF: can't generate ATA PT sense data\n");
  		if (qc->err_mask)
- 			ata_scsi_set_sense(dev, cmd, ABORTED_COMMAND, 0, 0);
+ 			ata_scsi_set_sense(dev, cmd, ABORTED_COMMAND,
+ 					   NO_ADDITIONAL_SENSE_INFORMATION);
  		return;
  	}
 =20
  	/*
- 	 * Use ata_to_sense_error() to map status register bits
- 	 * onto sense key, asc & ascq.
+ 	 * Use ata_to_sense_error() to map status register bits onto sense key
+ 	 * and sense code.
  	 */
  	if (qc->err_mask ||
  	    tf->status & (ATA_BUSY | ATA_DF | ATA_ERR | ATA_DRQ)) {
  		ata_to_sense_error(tf->status, tf->error,
- 				   &sense_key, &asc, &ascq);
- 		ata_scsi_set_sense(qc->dev, cmd, sense_key, asc, ascq);
- 	} else {
- 		/*
- 		 * ATA PASS-THROUGH INFORMATION AVAILABLE
- 		 *
- 		 * Note: we are supposed to call ata_scsi_set_sense(), which
- 		 * respects the D_SENSE bit, instead of unconditionally
- 		 * generating the sense data in descriptor format. However,
- 		 * because hdparm, hddtemp, and udisks incorrectly assume sense
- 		 * data in descriptor format, without even looking at the
- 		 * RESPONSE CODE field in the returned sense data (to see which
- 		 * format the returned sense data is in), we are stuck with
- 		 * being bug compatible with older kernels.
- 		 */
- 		scsi_build_sense(cmd, 1, RECOVERED_ERROR, 0, 0x1D);
+ 				   &sense_key, &sense_code);
+ 		ata_scsi_set_sense(qc->dev, cmd, sense_key, sense_code);
+ 		return;
  	}
+=20
+ 	/*
+ 	 * Note: we are supposed to call ata_scsi_set_sense(), which respects
+ 	 * the D_SENSE bit, instead of unconditionally generating the sense data
+ 	 * in descriptor format. However, because hdparm, hddtemp, and udisks
+ 	 * incorrectly assume sense data in descriptor format, without even
+ 	 * looking at the RESPONSE CODE field in the returned sense data (to see
+ 	 * which format the returned sense data is in), we are stuck with being
+ 	 * bug compatible with older kernels.
+ 	 */
+ 	scsi_set_sense(cmd, 1, RECOVERED_ERROR,
+ 		       ATA_PASS_THROUGH_INFORMATION_AVAILABLE);
  }
 =20
  /**
@@@ -981,19 -1041,18 +1041,18 @@@ static void ata_gen_ata_sense(struct at
  	struct ata_device *dev =3D qc->dev;
  	struct scsi_cmnd *cmd =3D qc->scsicmd;
  	struct ata_taskfile *tf =3D &qc->result_tf;
- 	u8 sense_key, asc, ascq;
 =20
  	if (ata_dev_disabled(dev)) {
  		/* Device disabled after error recovery */
- 		/* LOGICAL UNIT NOT READY, HARD RESET REQUIRED */
- 		ata_scsi_set_sense(dev, cmd, NOT_READY, 0x04, 0x21);
+ 		ata_scsi_set_sense(dev, cmd, NOT_READY,
+ 				   LU_NOT_READY_HARD_RESET_REQUIRED);
  		return;
  	}
 =20
  	if (ata_id_is_locked(dev->id)) {
  		/* Security locked */
- 		/* LOGICAL UNIT ACCESS NOT AUTHORIZED */
- 		ata_scsi_set_sense(dev, cmd, DATA_PROTECT, 0x74, 0x71);
+ 		ata_scsi_set_sense(dev, cmd, DATA_PROTECT,
+ 				   LU_ACCESS_NOT_AUTHORIZED);
  		return;
  	}
 =20
@@@ -1008,9 -1067,12 +1067,12 @@@
  	 */
  	if (qc->err_mask ||
  	    tf->status & (ATA_BUSY | ATA_DF | ATA_ERR | ATA_DRQ)) {
+ 		u16 sense_code;
+ 		u8 sense_key;
+=20
  		ata_to_sense_error(tf->status, tf->error,
- 				   &sense_key, &asc, &ascq);
- 		ata_scsi_set_sense(dev, cmd, sense_key, asc, ascq);
+ 				   &sense_key, &sense_code);
+ 		ata_scsi_set_sense(dev, cmd, sense_key, sense_code);
  		return;
  	}
 =20
@@@ -1019,7 -1081,8 +1081,8 @@@
  		"Could not decode error 0x%x, status 0x%x (err_mask=3D0x%x)\n",
  		tf->error, tf->status, qc->err_mask);
  aborted:
- 	ata_scsi_set_sense(dev, cmd, ABORTED_COMMAND, 0, 0);
+ 	ata_scsi_set_sense(dev, cmd, ABORTED_COMMAND,
+ 			   NO_ADDITIONAL_SENSE_INFORMATION);
  }
 =20
  void ata_scsi_sdev_config(struct scsi_device *sdev)
@@@ -1273,7 -1336,8 +1336,8 @@@ static unsigned int ata_scsi_start_stop
 =20
  	/* Ignore IMMED bit (cdb[1] & 0x1), violates sat-r05 */
  	if (!ata_dev_power_init_tf(qc->dev, &qc->tf, cdb[4] & 0x1)) {
- 		ata_scsi_set_sense(qc->dev, scmd, ABORTED_COMMAND, 0, 0);
+ 		ata_scsi_set_sense(qc->dev, scmd, ABORTED_COMMAND,
+ 				   NO_ADDITIONAL_SENSE_INFORMATION);
  		return 1;
  	}
 =20
@@@ -1501,8 -1565,8 +1565,8 @@@ invalid_fld
  	return 1;
 =20
  out_of_range:
- 	ata_scsi_set_sense(qc->dev, scmd, ILLEGAL_REQUEST, 0x21, 0x0);
- 	/* "Logical Block Address out of range" */
+ 	ata_scsi_set_sense(qc->dev, scmd, ILLEGAL_REQUEST,
+ 			   LOGICAL_BLOCK_ADDRESS_OUT_OF_RANGE);
  	return 1;
 =20
  nothing_to_do:
@@@ -1638,8 -1702,8 +1702,8 @@@ invalid_fld
  	return 1;
 =20
  out_of_range:
- 	ata_scsi_set_sense(qc->dev, scmd, ILLEGAL_REQUEST, 0x21, 0x0);
- 	/* "Logical Block Address out of range" */
+ 	ata_scsi_set_sense(qc->dev, scmd, ILLEGAL_REQUEST,
+ 			   LOGICAL_BLOCK_ADDRESS_OUT_OF_RANGE);
  	return 1;
 =20
  nothing_to_do:
@@@ -2015,7 -2079,8 +2079,8 @@@ static void ata_scsi_rbuf_fill(struct a
  	len =3D actor(dev, cmd, ata_scsi_rbuf);
  	if (len) {
  		if (WARN_ON(len > ATA_SCSI_RBUF_SIZE)) {
- 			ata_scsi_set_sense(dev, cmd, ABORTED_COMMAND, 0, 0);
+ 			ata_scsi_set_sense(dev, cmd, ABORTED_COMMAND,
+ 					   NO_ADDITIONAL_SENSE_INFORMATION);
  			spin_unlock_irqrestore(&ata_scsi_rbuf_lock, flags);
  			return;
  		}
@@@ -2894,8 -2959,8 +2959,8 @@@ invalid_fld
  	return 0;
 =20
  saving_not_supp:
- 	ata_scsi_set_sense(dev, cmd, ILLEGAL_REQUEST, 0x39, 0x0);
- 	 /* "Saving parameters not supported" */
+ 	ata_scsi_set_sense(dev, cmd, ILLEGAL_REQUEST,
+ 			   SAVING_PARAMETERS_NOT_SUPPORTED);
  	return 0;
  }
 =20
@@@ -3732,12 -3797,12 +3797,12 @@@ invalid_fld
  	ata_scsi_set_invalid_field(dev, scmd, fp, bp);
  	return 1;
  invalid_param_len:
- 	/* "Parameter list length error" */
- 	ata_scsi_set_sense(dev, scmd, ILLEGAL_REQUEST, 0x1a, 0x0);
+ 	ata_scsi_set_sense(dev, scmd, ILLEGAL_REQUEST,
+ 			   PARAMETER_LIST_LENGTH_ERROR);
  	return 1;
  invalid_opcode:
- 	/* "Invalid command operation code" */
- 	ata_scsi_set_sense(dev, scmd, ILLEGAL_REQUEST, 0x20, 0x0);
+ 	ata_scsi_set_sense(dev, scmd, ILLEGAL_REQUEST,
+ 			   INVALID_COMMAND_OP_CODE);
  	return 1;
  }
 =20
@@@ -4199,8 -4264,8 +4264,8 @@@ invalid_fld
  	return 1;
 =20
  invalid_param_len:
- 	/* "Parameter list length error" */
- 	ata_scsi_set_sense(qc->dev, scmd, ILLEGAL_REQUEST, 0x1a, 0x0);
+ 	ata_scsi_set_sense(qc->dev, scmd, ILLEGAL_REQUEST,
+ 			   PARAMETER_LIST_LENGTH_ERROR);
  	return 1;
  }
 =20
@@@ -4277,8 -4342,8 +4342,8 @@@ static unsigned int ata_scsi_zbc_out_xl
  	ata_scsi_set_invalid_field(qc->dev, scmd, fp, 0xff);
  	return 1;
  invalid_param_len:
- 	/* "Parameter list length error" */
- 	ata_scsi_set_sense(qc->dev, scmd, ILLEGAL_REQUEST, 0x1a, 0x0);
+ 	ata_scsi_set_sense(qc->dev, scmd, ILLEGAL_REQUEST,
+ 			   PARAMETER_LIST_LENGTH_ERROR);
  	return 1;
  }
 =20
@@@ -4629,8 -4694,8 +4694,8 @@@ static unsigned int ata_scsi_mode_selec
  	return 1;
 =20
   invalid_param_len:
- 	/* "Parameter list length error" */
- 	ata_scsi_set_sense(qc->dev, scmd, ILLEGAL_REQUEST, 0x1a, 0x0);
+ 	ata_scsi_set_sense(qc->dev, scmd, ILLEGAL_REQUEST,
+ 			   PARAMETER_LIST_LENGTH_ERROR);
  	return 1;
 =20
   skip:
@@@ -4789,7 -4854,8 +4854,8 @@@ ata_scsi_get_phys_element_status_xlat(s
 =20
  	/* ATA_CMD_GET_PHYS_ELEMENT_STATUS is a DMA command. */
  	if (!(dev->flags & ATA_DFLAG_DEPOP) || !ata_dma_enabled(dev)) {
- 		ata_scsi_set_sense(dev, scmd, ILLEGAL_REQUEST, 0x20, 0x0);
+ 		ata_scsi_set_sense(dev, scmd, ILLEGAL_REQUEST,
+ 				   INVALID_COMMAND_OP_CODE);
  		return 1;
  	}
 =20
@@@ -4823,6 -4889,28 +4889,6 @@@
  	return 0;
  }
 =20
 -static void ata_scsi_depop_ua_cap_changed_complete(struct ata_queued_cmd =
*qc)
 -{
 -	struct scsi_cmnd *scmd =3D qc->scsicmd;
 -	u8 *cdb =3D scmd->cmnd;
 -	bool is_ata_passthru =3D cdb[0] =3D=3D ATA_16 || cdb[0] =3D=3D ATA_12;
 -	bool is_success =3D qc->err_mask =3D=3D 0;
 -
 -	/*
 -	 * For successful non-passthrough commands, raise a UNIT ATTENTION with
 -	 * the additional sense code set to CAPACITY DATA HAS CHANGED to be
 -	 * raised. Note that this should be done only if the capacity has
 -	 * actually changed, which may not be the case if the element that was
 -	 * specified for depopulation was already depopulated, or we did not
 -	 * restore any removed element. But a capacity change unit attention is
 -	 * harmless, so always raise the unit attention.
 -	 */
 -	if (is_success && !is_ata_passthru)
 -		ata_scsi_set_sense(qc->dev, scmd, UNIT_ATTENTION,
 -				   CAPACITY_DATA_HAS_CHANGED);
 -	ata_scsi_qc_complete(qc);
 -}
 -
  static unsigned int
  ata_scsi_remove_element_and_truncate_xlat(struct ata_queued_cmd *qc)
  {
@@@ -4834,7 -4922,8 +4900,8 @@@
  	u32 id;
 =20
  	if (!(dev->flags & ATA_DFLAG_DEPOP)) {
- 		ata_scsi_set_sense(dev, scmd, ILLEGAL_REQUEST, 0x20, 0x0);
+ 		ata_scsi_set_sense(dev, scmd, ILLEGAL_REQUEST,
+ 				   INVALID_COMMAND_OP_CODE);
  		return 1;
  	}
 =20
@@@ -4862,6 -4951,7 +4929,6 @@@
  	tf->flags |=3D ATA_TFLAG_ISADDR | ATA_TFLAG_DEVICE | ATA_TFLAG_LBA48;
 =20
  	qc->flags |=3D ATA_QCFLAG_RESULT_TF;
 -	qc->complete_fn =3D ata_scsi_depop_ua_cap_changed_complete;
 =20
  	return 0;
  }
@@@ -4876,7 -4966,8 +4943,8 @@@ ata_scsi_remove_element_and_modify_zone
  	u32 id;
 =20
  	if (!(dev->flags & ATA_DFLAG_DEPOP_MODIFY)) {
- 		ata_scsi_set_sense(dev, scmd, ILLEGAL_REQUEST, 0x20, 0x0);
+ 		ata_scsi_set_sense(dev, scmd, ILLEGAL_REQUEST,
+ 				   INVALID_COMMAND_OP_CODE);
  		return 1;
  	}
 =20
@@@ -4904,7 -4995,8 +4972,8 @@@ ata_scsi_restore_elements_and_rebuild_x
  	struct ata_taskfile *tf =3D &qc->tf;
 =20
  	if (!(dev->flags & ATA_DFLAG_DEPOP_RESTORE)) {
- 		ata_scsi_set_sense(dev, scmd, ILLEGAL_REQUEST, 0x20, 0x0);
+ 		ata_scsi_set_sense(dev, scmd, ILLEGAL_REQUEST,
+ 				   INVALID_COMMAND_OP_CODE);
  		return 1;
  	}
 =20
@@@ -4914,6 -5006,7 +4983,6 @@@
  	tf->flags |=3D ATA_TFLAG_ISADDR | ATA_TFLAG_DEVICE | ATA_TFLAG_LBA48;
 =20
  	qc->flags |=3D ATA_QCFLAG_RESULT_TF;
 -	qc->complete_fn =3D ata_scsi_depop_ua_cap_changed_complete;
 =20
  	return 0;
  }
@@@ -5064,7 -5157,8 +5133,8 @@@ static void ata_scsi_simulate(struct at
  		break;
 =20
  	case REQUEST_SENSE:
- 		ata_scsi_set_sense(dev, cmd, 0, 0, 0);
+ 		ata_scsi_set_sense(dev, cmd, NO_SENSE,
+ 				   NO_ADDITIONAL_SENSE_INFORMATION);
  		break;
 =20
  	/* if we reach this, then writeback caching is disabled,
@@@ -5093,8 -5187,8 +5163,8 @@@
 =20
  	/* all other commands */
  	default:
- 		ata_scsi_set_sense(dev, cmd, ILLEGAL_REQUEST, 0x20, 0x0);
- 		/* "Invalid command operation code" */
+ 		ata_scsi_set_sense(dev, cmd, ILLEGAL_REQUEST,
+ 				   INVALID_COMMAND_OP_CODE);
  		break;
  	}
 =20
@@@ -5382,7 -5476,7 +5452,7 @@@ bool ata_scsi_offline_dev(struct ata_de
   *	ata_scsi_remove_dev - remove attached SCSI device
   *	@dev: ATA device to remove attached SCSI device for
   *
 - *	This function is called from ata_eh_scsi_hotplug() and
 + *	This function is called from ata_scsi_hotplug() and
   *	responsible for removing the SCSI device attached to @dev.
   *
   *	LOCKING:

--w3AvGd+Y//DkYUt8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqsQdkACgkQJNaLcl1U
h9C1mAf+NpRQtIC3+T7H7EHIiEx4KGwFpZJYgSM5Z+zmRluO39tMRGr7KiIDelaA
JCfTQQxVIKjn2gSRjd76aihctrhZMOKpug6EhHXLkFfNtVFjNfjWsOvQi3sYzQHT
gDvDVWLiqUx9ajEDNGdNqPFY3+dAYDkH0l4+nF5XNOiQoRwGAtB/l8stcVGM3a0D
NV3h3tXwxli2B9G4uMKqSxG8wz1QcWgGjp8q/aUEUBzbfehd4GAJF2BFOg1ejXjr
Z9rCpIPksw5opQ2PNwahU+OXgXeBoaD5kNNcxFn4laHAEya9deGrF67bAcdLKhqn
5smaizqSG9tPG9KWO6NQyfxj0pULaQ==
=KBZI
-----END PGP SIGNATURE-----

--w3AvGd+Y//DkYUt8--
