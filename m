Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1BE1F4631
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700139; cv=none; b=CGPHOfRB1p2r3uMD4FLPP1YVNNe8teQKphYRl5DC4ez13u+lkNBfY9uLlDebqyplhMYslmd5Por+PqvpeI5wpUFsyDMJvxrLIqDC27M9P6yw9/dU1noa0Re0Gw8gclXzJsGIiDCgybWc1q1PkcHl5qb+3SWGTfEbpzn6C/OeKCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700139; c=relaxed/simple;
	bh=4oNNBVrx7iWlKCs0k9aLCLQO+dCsFhb60Z7Vs+mKWdk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YR6EfqLOc4EdhPK7IFoU4Wv0ZtlpoALNiahIvSbLxjHE6HA3WgZ5DT7SbRcRKHrU5e02gTItTiP6CcbkTEK1OV1VACY2ZxmzeWVSX6lTO+yoN55PDh4v9X9mkFRQEd6Bq6mzj6Ik73jymejxV9MVPlX1P8QuooAR9Q5Jmhkhuss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=TIAigef5; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="TIAigef5"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-532db7db0c6so40588831cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1790700135; x=1791304935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qkmc9HSMYXuGuOTX21xyysxiwNQV626wcdXoxNjH/r4=;
        b=TIAigef5/fRo3DQh1ApmGh8ZNqLC/2sdOW/k1yVBYRMU8FzToEKFWJBY7+Xk8DU8r0
         6ke/fHBgWWjPDPMyzGymFLnEKdVbzwSQKGbfpHf8r1mJKYDGCj60TZBOSwg7/qg7bxRW
         ZN4/h785w6evL1B6sqc4K1A7MdkZ6aEdQirN0J3QnU8EnWriS1DDWxKoUjApAL7Zmwxk
         JDD98ViSGpLHdC2z16UbA8jTdtFBQBl1RFTnWVdiaaqyPHbr2P2wFr2lU8jCBzCZw9hs
         FdqPDrHyqX3RQqSHIJYGajaFFzgsGS6rTNwsfh7r7D4a9u55d9Gdh7ng6u6SBpJUCiCg
         aQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700135; x=1791304935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qkmc9HSMYXuGuOTX21xyysxiwNQV626wcdXoxNjH/r4=;
        b=0Rm4hEnTIax8udX4PSkNhg/y2BiAM9vhag+ObrJOBBBgEa9lSfswneCK0bfMSqCNns
         Cir+s5TYKRC6CzqSkR1Ge1qxiKZrBEpBr4hKNmaoiAplbcUCb4ePkh/92ipENqJxLkNa
         NdTwywtDXP0YiR/K3oPEjOSZFJm0Yl+763BgkFz/SNA61zin/lkRRkCzNE1Z8f86TBQD
         TlUX8rbqDFCmBjXBW4YWoxLoEa8wFctH2qEWvVTkuPgqlH80mB+6ekHVe84m3LcJVQZm
         QdBAl5f6Ph7suD0CqUHTcc2IwMBGDp+4hLbxK5+c7DkNv8YAuY9wLg+IuWaktiWlz1tY
         I53w==
X-Forwarded-Encrypted: i=1; AKwUvBxjdzStfb6Y0fQUSUR3GOtytJOYS/dKTY8mJMmwPD+CRe+0eQAFRG5QlBIvoUP1V4m9aNnmq+bv+jxxS78=@vger.kernel.org
X-Gm-Message-State: AFuF++nlNKBeTbct/nOsXdoDNJamCTDHTlFlkoo2YZSQEhZXyDZ7pwXW
	lkpPk+3UIoJV17UxQQUh+JulToZg8hPO1abqQrJ1OKRy9zgeTP4iYaU6ZUmaxaMOOg==
X-Gm-Gg: AYBFou3QhaGLLbW8b33jdSv192PY4Eq+n/jtR1KxpEEvx4B4RA8Mh+SML9bcvsYdgIA
	nvA7wgiTo+E4oPVdFqSjZLL7zp+3NMq0HrCwtKYmAJSGMvSgwzFPXBtU1Hyu1XuivHwpLz/pwFV
	n9h7TWe6fRcxG3KJgd/x6shEWnZcdh3g9qT3yF+d/BBh+Xc6aWXDNVX3u88I5jquFDUheg7A/mr
	V1EfclXxYSVtVylhGUBani8un/jA5rjQjZHMu8eZs//H9JlY+3OWn0qoJ/PxrehL2br2R1gvjgd
	hKRaY02QhtMJanO0sZnBLXK+uIqsLSZbqv2rj4yWeZKWywcFBw3Ig7kKAjKOnPS9VlMM0b/f1Tu
	q+ANBYQxLguryQYirQk7ZrD2Fkj/5jWlu7PU7Nr8TsXL/JMA2jivbJYtTp84v2762K6D62Zp1DY
	k48ifRKa9hNRMkgUEBjDTVvrJdLJ72uFPEJB1HrMMdfwDfcbKKWSBu2loVN1S+4OSRrxVDIODsD
	eK/yC3WN2PEeEkhTN1aLw==
X-Received: by 2002:a05:622a:2d6:b0:533:360f:e753 with SMTP id d75a77b69052e-533360ff66cmr172909001cf.35.1790700134841;
        Tue, 29 Sep 2026 09:42:14 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533223efcc4sm90377781cf.25.2026.09.29.09.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:42:14 -0700 (PDT)
From: hengyul@cs.unc.edu
To: dlemoal@kernel.org,
	cassel@kernel.org
Cc: mkp@kernel.org,
	ipylypiv@google.com,
	linux-ide@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hengyu Liang <hengyul@cs.unc.edu>,
	stable@vger.kernel.org
Subject: [PATCH v2] ata: libata-scsi: do not lose CHECK CONDITION for failed ATAPI commands
Date: Tue, 29 Sep 2026 12:41:35 -0400
Message-ID: <20260929164135.266708-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hengyu Liang <hengyul@cs.unc.edu>

Since commit 2e1d2e65e773 ("ata: libata-scsi: terminate deferred commands
on time out"), atapi_qc_complete() sets SAM_STAT_CHECK_CONDITION for a
failed command only if cmd->result is zero, so that the DID_TIME_OUT or
DID_REQUEUE host byte of a terminated command is preserved.

However, cmd->result can also be non-zero for a regular failed ATAPI
command completed through libata EH: ata_eh_analyze_tf() calls
ata_eh_decide_disposition(), that is, scsi_check_sense(), on the sense
data obtained with REQUEST SENSE, and scsi_check_sense() sets the SCSI
midlayer internal byte of the result for some sense codes, e.g.
SCSIML_STAT_TGT_FAILURE for ILLEGAL REQUEST with ASC 0x20 (INVALID
COMMAND OPERATION CODE) or 0x24 (INVALID FIELD IN CDB), or
SCSIML_STAT_MED_ERROR for MEDIUM ERROR with ASC 0x11 (UNRECOVERED READ
ERROR). For such commands, atapi_qc_complete() keeps the result as is and
the command completes with a GOOD status byte, even though it failed and
valid sense data is available.

As a result, passthrough users see these failed ATAPI commands as
successful. For example, with the emulated IDE CD-ROM drive of QEMU and
no medium loaded, a PLAY AUDIO MSF command issued with SG_IO completes
with status 0x00 (and no DRIVER_SENSE) instead of 0x02 (CHECK CONDITION)
with sense key ILLEGAL REQUEST, ASC/ASCQ 0x20/0x00, and the CDROM ioctls
CDROMPLAYTRKIND, CDROMSUBCHNL, CDROMPAUSE, CDROMRESUME, CDROMPLAYMSF and
CDROM_GET_MCN return 0 instead of -ENOMEDIUM or -EOPNOTSUPP.

Fix this by setting the status byte to SAM_STAT_CHECK_CONDITION whenever
the host byte is not set. Use set_status_byte() rather than overwriting
the whole result, so that the SCSI midlayer internal byte set by
scsi_check_sense() is preserved, as ata_scsi_qc_complete() already does
for ATA commands.

Fixes: 2e1d2e65e773 ("ata: libata-scsi: terminate deferred commands on time out")
Cc: stable@vger.kernel.org
Suggested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Changes in v2:
- Only set the status byte with set_status_byte() instead of overwriting
  cmd->result, so that the SCSI midlayer internal byte set by
  scsi_check_sense() is preserved (suggested by Niklas).
- Link to v1: https://lore.kernel.org/r/20260924180414.2102946-1-hengyul@cs.unc.edu

 drivers/ata/libata-scsi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
index 8f9aa97a519d..fb5517d51095 100644
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@ -3059,10 +3059,15 @@ static void atapi_qc_complete(struct ata_queued_cmd *qc)
 		if (qc->cdb[0] == ALLOW_MEDIUM_REMOVAL && qc->dev->sdev)
 			qc->dev->sdev->locked = 0;
 
-		if (cmd->result)
-			ata_scsi_qc_done(qc, false, 0);
-		else
-			ata_scsi_qc_done(qc, true, SAM_STAT_CHECK_CONDITION);
+		/*
+		 * Report CHECK CONDITION unless the command was terminated
+		 * with a host byte set. Only set the status byte, so that the
+		 * SCSI midlayer internal byte, which scsi_check_sense() may
+		 * have set from the sense data, is preserved.
+		 */
+		if (get_host_byte(cmd) == DID_OK)
+			set_status_byte(cmd, SAM_STAT_CHECK_CONDITION);
+		ata_scsi_qc_done(qc, false, 0);
 		goto schedule_deferred;
 	}
 
-- 
2.53.0

