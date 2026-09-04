Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE94476072
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524096; cv=none; b=BmM5lswReQTa+94N29vt87WsKLxMrMD39dWM3o/jMVPf7kD9pN6Jp2vALyvN/FpYczff8Hq3PMR4r6nBAn56btJRlnK/DLOJeYUCfADaAWgC4pLZ8NC5vbmrXRdc/9SGP1mLrpdPHgNj/lZsEg4G8a0F45r2+Zmr+9fqWow+L7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524096; c=relaxed/simple;
	bh=dd1lCGy0Kh3z0zS/NqxWoc16amM2UKMB9VnBcyxbIFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E3oYwfOEl91xTX3UgDC+pK1eqOqSiHg8Nysig4V90Pzdn1vQSZzIZmYiXmigZnhqqvqV2+UmXWc7pRHnjDL2e41QWWnV6WzZcIwLLtL9ARqQob0W07j7h62HJJ0Aac3gkStoZU8ocHUVuSQJ5rdnVeEnrWvjWMLxMGQeE1izsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+lL6tTY; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+lL6tTY"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-469d76ce704so805931fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524093; x=1789128893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wTh4q0fVS/vkJBpUmk5P6WbrM8N8JqcQKf6Z2q56q3g=;
        b=c+lL6tTYmmsVSf++ktmoHE6AOgDet2C7okYRW5FMabVbx/ZCC3Ri+QAX7tgqwIHeh0
         dbyUwcGk/x94mX+1l3/4nc8JH9s+YA9H6+RSza/R6wp/LvwjRqM6PrMcWE5aLr10bHLc
         5cuLG4gmqrzCdYB4QNifqtoIKJcodmXDqmQv7/SyI4R14iRWlsQ7Tdo76i6qexgqAKq2
         MQJbKdwOqBb2fkfPFErxtA9AUwfymSQ1w5Mu90BhXlg0sGfdzmzW2UpPFe900ppHWXWP
         eXtUoIzrDeClgp2kdhAok2A68xlOWGduEnupRgPX2uoWZ8vZYJCUSkvd8PBlc/ypArJI
         8N4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524093; x=1789128893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTh4q0fVS/vkJBpUmk5P6WbrM8N8JqcQKf6Z2q56q3g=;
        b=bDE6y4DpssjAep/E7kfn1OUSTCBAaPaHIHOC3d/phPgN/3f2r7M3qlsN5kfLOdDa5w
         ZldrCJrf2sA+Pp3epGzTmqLvcsGjrxxbyyqYIQI5aPjsHaFr5GiYRtHrsZeMGcATu39u
         34++ruY8AkV32dyl9yNpfk1PPXAwGDewvinR80Xp/kSOf16iZhYJjzI7qjV9zLi4mRBg
         2MOoekKjWmkt5gHIjpA9UFVN4F3x5bxSTY9qDz9snwUkd3XwxNGDsjMJ7SBiNTkY5vQ1
         LPE7Jwrr06TzgLiU2NLUBEJ/swC1IiGImh/XVi47w1eLLczRYAWso6Pko3lKetcAE80K
         t6aw==
X-Gm-Message-State: AFuF++mqv51wwMyzr7NLh0b+F0N0ap4GqpL/I0xGZUj7txe5lsiAVcCC
	UntQOF8XLhbq8pLHm5fU5tXxQYWfuYVDotdg9pcLaQTVa84GyQMID+R+8EPvhMWRDKQ=
X-Gm-Gg: AYBFou0fbVVmm9xywjSroqDtz0a2S2kfphfY6crfdPp1KCYGCPODUjrjSNA2YlGoaFx
	z0c+xqFFfiG0JS5hFztbySAkTsdMIJRoGL/ZvmFYBWyFC18W4ZzoPM+HuaXhrTWBxvZiMPVmRga
	tkCWL5PbsfPvOoQveBzfLJ72hUZyADaIkMxOMRAQ3OrnAg4hDqHen+s68vc27XnBsuPdx4X7bMJ
	2yEvjeC0SXxYr2gF/RQn2SrZW1rkTbwvzsq8p86VuruZvSA0GypuFOjTWvKTuLSMMGQvps+vRea
	XvrwvE2VvtF4JAu0OhTNPRlfQ3QtXP4KdAu105ts3Bg7IK0xejcRiRn71W4bZ4Xb+cN6arpBYHX
	1atq/Qn9HzLE4vEkEmDG+69EuMkfgGPxgMbi7WgzR9Qe38IBTyZk2+nXYXx4I2+3ZSssE96q/Gt
	GGWXjfhZZPD2tTgYprLx44cmQqwNiC5SYbsuajcI120g6o3ACYZKr8CVYptlGvcpQf6uhGhpnhL
	4ZFHbqwkduuwtA=
X-Received: by 2002:a05:6820:3102:b0:6b2:f445:af17 with SMTP id 006d021491bc7-6b6fc7d2b9cmr4190592eaf.26.1788524093027;
        Fri, 04 Sep 2026 05:14:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm9311666c88.2.2026.09.04.05.14.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:14:52 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] scsi: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:44:21 +0530
Message-ID: <20260904121449.24178-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  scsi: fix typos in comments
  scsi: fix repeated words in comments

 drivers/scsi/aacraid/aachba.c                   |  2 +-
 drivers/scsi/aacraid/aacraid.h                  |  2 +-
 drivers/scsi/aacraid/commsup.c                  |  2 +-
 drivers/scsi/aha152x.c                          |  6 +++---
 drivers/scsi/aic7xxx/aic79xx.h                  |  8 ++++----
 drivers/scsi/aic7xxx/aic79xx_core.c             |  4 ++--
 drivers/scsi/aic7xxx/aic79xx_osm.c              |  2 +-
 drivers/scsi/aic7xxx/aic7xxx.h                  |  6 +++---
 drivers/scsi/aic7xxx/aic7xxx_core.c             |  2 +-
 drivers/scsi/aic7xxx/aicasm/aicasm_macro_scan.l |  2 +-
 drivers/scsi/aic7xxx/aiclib.h                   |  2 +-
 drivers/scsi/aic94xx/aic94xx_scb.c              |  2 +-
 drivers/scsi/arm/fas216.c                       |  8 ++++----
 drivers/scsi/arm/fas216.h                       |  6 +++---
 drivers/scsi/atp870u.c                          |  2 +-
 drivers/scsi/be2iscsi/be_cmds.c                 |  2 +-
 drivers/scsi/be2iscsi/be_iscsi.c                |  2 +-
 drivers/scsi/be2iscsi/be_main.c                 |  4 ++--
 drivers/scsi/be2iscsi/be_main.h                 |  6 +++---
 drivers/scsi/bfa/bfa_core.c                     |  2 +-
 drivers/scsi/bfa/bfa_defs.h                     |  2 +-
 drivers/scsi/bfa/bfa_defs_fcs.h                 |  2 +-
 drivers/scsi/bfa/bfa_defs_svc.h                 |  2 +-
 drivers/scsi/bfa/bfa_fc.h                       |  6 +++---
 drivers/scsi/bfa/bfa_fcpim.c                    |  6 +++---
 drivers/scsi/bfa/bfa_fcpim.h                    |  4 ++--
 drivers/scsi/bfa/bfa_fcs_fcpim.c                |  2 +-
 drivers/scsi/bfa/bfa_fcs_lport.c                |  4 ++--
 drivers/scsi/bfa/bfa_fcs_rport.c                |  6 +++---
 drivers/scsi/bfa/bfa_ioc.c                      |  6 +++---
 drivers/scsi/bfa/bfa_ioc.h                      |  2 +-
 drivers/scsi/bfa/bfa_svc.c                      |  2 +-
 drivers/scsi/bfa/bfa_svc.h                      |  2 +-
 drivers/scsi/bfa/bfad.c                         |  4 ++--
 drivers/scsi/bfa/bfad_bsg.c                     |  2 +-
 drivers/scsi/bfa/bfi.h                          |  4 ++--
 drivers/scsi/bfa/bfi_ms.h                       |  4 ++--
 drivers/scsi/bnx2fc/bnx2fc_fcoe.c               |  2 +-
 drivers/scsi/bnx2fc/bnx2fc_io.c                 |  2 +-
 drivers/scsi/bnx2fc/bnx2fc_tgt.c                |  2 +-
 drivers/scsi/bnx2i/bnx2i.h                      |  2 +-
 drivers/scsi/bnx2i/bnx2i_sysfs.c                |  2 +-
 drivers/scsi/csiostor/csio_hw.c                 |  2 +-
 drivers/scsi/csiostor/csio_hw.h                 |  2 +-
 drivers/scsi/csiostor/csio_isr.c                |  2 +-
 drivers/scsi/csiostor/csio_lnode.c              |  4 ++--
 drivers/scsi/csiostor/csio_mb.c                 |  2 +-
 drivers/scsi/csiostor/csio_scsi.c               | 14 +++++++-------
 drivers/scsi/csiostor/csio_wr.c                 |  8 ++++----
 drivers/scsi/dc395x.c                           |  2 +-
 drivers/scsi/esas2r/esas2r.h                    |  2 +-
 drivers/scsi/esas2r/esas2r_init.c               |  2 +-
 drivers/scsi/fcoe/fcoe_ctlr.c                   |  4 ++--
 drivers/scsi/fcoe/fcoe_transport.c              |  2 +-
 drivers/scsi/fnic/fnic_main.c                   |  2 +-
 drivers/scsi/fnic/fnic_trace.h                  |  2 +-
 drivers/scsi/fnic/vnic_devcmd.h                 |  2 +-
 drivers/scsi/hpsa.c                             |  2 +-
 drivers/scsi/hpsa_cmd.h                         |  2 +-
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c        |  2 +-
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.h        |  2 +-
 drivers/scsi/imm.c                              |  4 ++--
 drivers/scsi/ipr.c                              |  2 +-
 drivers/scsi/libfc/fc_exch.c                    |  2 +-
 drivers/scsi/lpfc/lpfc_debugfs.c                |  6 +++---
 drivers/scsi/lpfc/lpfc_init.c                   |  2 +-
 drivers/scsi/lpfc/lpfc_sli.c                    |  2 +-
 drivers/scsi/megaraid.c                         |  4 ++--
 drivers/scsi/megaraid/megaraid_mbox.c           |  8 ++++----
 drivers/scsi/megaraid/megaraid_sas_fusion.c     |  4 ++--
 drivers/scsi/mpt3sas/mpi/mpi2_init.h            |  2 +-
 drivers/scsi/mpt3sas/mpt3sas_base.c             |  2 +-
 drivers/scsi/mpt3sas/mpt3sas_base.h             |  6 +++---
 drivers/scsi/mpt3sas/mpt3sas_ctl.c              |  8 ++++----
 drivers/scsi/mpt3sas/mpt3sas_scsih.c            | 12 ++++++------
 drivers/scsi/mpt3sas/mpt3sas_transport.c        |  2 +-
 drivers/scsi/mvsas/mv_sas.h                     |  2 +-
 drivers/scsi/ncr53c8xx.c                        |  4 ++--
 drivers/scsi/pcmcia/nsp_cs.c                    |  2 +-
 drivers/scsi/pcmcia/nsp_io.h                    |  2 +-
 drivers/scsi/pm8001/pm8001_sas.h                |  2 +-
 drivers/scsi/pm8001/pm80xx_hwi.h                |  4 ++--
 drivers/scsi/pmcraid.c                          |  4 ++--
 drivers/scsi/pmcraid.h                          |  2 +-
 drivers/scsi/ppa.c                              |  4 ++--
 drivers/scsi/qedf/qedf_main.c                   |  4 ++--
 drivers/scsi/qla1280.c                          |  2 +-
 drivers/scsi/qla2xxx/qla_fw.h                   |  2 +-
 drivers/scsi/qla2xxx/qla_iocb.c                 |  4 ++--
 drivers/scsi/qla2xxx/qla_nx.c                   |  2 +-
 drivers/scsi/qla2xxx/qla_os.c                   |  6 +++---
 drivers/scsi/qla2xxx/qla_target.c               |  4 ++--
 drivers/scsi/qla2xxx/qla_target.h               |  4 ++--
 drivers/scsi/qla2xxx/tcm_qla2xxx.c              |  2 +-
 drivers/scsi/qla4xxx/ql4_fw.h                   |  2 +-
 drivers/scsi/qla4xxx/ql4_nx.c                   |  2 +-
 drivers/scsi/qla4xxx/ql4_os.c                   |  2 +-
 drivers/scsi/qlogicfas408.c                     |  2 +-
 drivers/scsi/scsi_error.c                       |  2 +-
 drivers/scsi/scsi_transport_iscsi.c             |  2 +-
 drivers/scsi/sd.c                               |  2 +-
 drivers/scsi/sd_zbc.c                           |  2 +-
 drivers/scsi/sg.c                               |  4 ++--
 drivers/scsi/snic/snic_debugfs.c                |  2 +-
 drivers/scsi/snic/snic_fwint.h                  |  6 +++---
 drivers/scsi/snic/snic_scsi.c                   |  4 ++--
 drivers/scsi/snic/snic_stats.h                  |  4 ++--
 drivers/scsi/st.c                               |  2 +-
 drivers/scsi/sym53c8xx_2/sym53c8xx.h            |  2 +-
 drivers/scsi/sym53c8xx_2/sym_hipd.c             | 10 +++++-----
 drivers/scsi/sym53c8xx_2/sym_hipd.h             |  2 +-
 drivers/scsi/wd719x.c                           |  2 +-
 drivers/scsi/wd719x.h                           |  2 +-
 drivers/ufs/core/ufshcd.c                       |  4 ++--
 include/uapi/scsi/scsi_bsg_fc.h                 |  2 +-
 include/ufs/ufs_quirks.h                        |  2 +-
 116 files changed, 194 insertions(+), 194 deletions(-)

-- 
2.48.1

