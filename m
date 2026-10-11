Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058E31E0DE8
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791683321; cv=none; b=BmktKoN3n2y8amz+L/zKkZAkepziLOy/5nLTGnB9F4U9dXgbxQgVUTu4X3JDHhOM2JETMFj0PpUSvn1koTZLug4E+qPAD/WQysEJcAAygggLzvYWFY9exae6Qtc8CMyyYBxr85bP1S7n1Vw1AC14Yk/LKExrOHUP9RuQ1SpiPMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791683321; c=relaxed/simple;
	bh=iNfEOTki28mG8+E/q+jod6G13cAmJ5gfKHCYNhNQfFo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T9dHqXT4ENwRE7j9JDmM1x+rdqQVCG13vWDpoPZTxQctfYbgftdfTGCYRCpNTy9nEXJHM+K1Fe3G+TLRLk+KXN/o9T3CNKD+i8o+VGj+XguF+Ru473mVX61q9Ov4Hrle79Rsr+NARo03ECuUWuO0vw0mY9zdjL8rES57qdmOEYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqqv1dPt; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqqv1dPt"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso552855a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791683319; x=1792288119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H4ioZwXLugL7a4JvMdl+hzI1AKbv2zUcDeCQrSIJAnw=;
        b=hqqv1dPt22TGHPM7i3hEAwK1YSq7U86az3rphZlqO2YpsBR7FMxjU0m0+ZHYOMoqQu
         jzUq5deRVj+w11S/6D1T6EmVM0MVGQQ+fY3SM399thlP1n/hOab2WBg73JoVoGjmE9vt
         TbIqngpCkwcztSIArZ4IJURVc3ZMsdVxktpnBoj22ch3f9cStx0W1X9OpS4DBHxjuZUB
         Bw6xb+rcILHp1VXlDAfuKeDfCofScEppe3CQV/kjk/pf9nvlfmF72z0PK+fkp2gdvZzP
         IOj4UFWcDaGkUIQLFj2i2+mPCGhV4IfGhFz8gQFpNn3nVO0JO/hHS+mYh92Pr6baBwBv
         MdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791683319; x=1792288119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4ioZwXLugL7a4JvMdl+hzI1AKbv2zUcDeCQrSIJAnw=;
        b=j7uylllKtODF+mrUTTKaREnBnXwYBZ3E6EGadQNo0C8NC1Ux6c6jJ3lkVCwxgalPEt
         GWEGC29y3VhDRqhPsAR1+4Dw8ZeMeMyIGTSpL44xfoPf23dCdqNTMe2ISuZpxvmzhVKT
         u2kLM5LxDheWFxH5YfkpNKaoah/EREgBuLGCmUS7e/SM9vLjfyFm2BXAq3RlDT9CEMB0
         fq+B8nYufLJfhRltwam3HTuLFIZj5z3DaRyJyFoEZ+LgaOWMcbPd2qo1UJoyH/j5fLid
         SdKRzk5TKq252IBzL8m56e7cfOh2QqXLrVqz1TZvAG3rxrY1ow8omwaJE4Ens+qPDWYs
         IyJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ1XiDhfhSsi3rLJeHgrgiGulMYORsZjTV/k8ThpbJ1FFkWfwRr2UTGkWZWyn+pSvHx1Zf6GuRylxKjzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQmQOJyTrEDVCfc43aqUgl5TLSI5y0wvTRPyAlt/3wp9fhNgNI
	E4c2i6K8iMiyYjilB8X14Z1eGc9Te1AlqkkZOpgQ/LbDGSR4S0nyKBam
X-Gm-Gg: AYBFou00CMcxAsxteYS0Xe/i5tSnvuWqmG+DKqGzFRVfMJMQJqjdaBNhYqmlRLUNIAU
	jCpSVC8z+7oDVIiabyXrVbmO9SzFZTllFFSez6fOJI5jvjaSk9S7XIMeT31ws6ZFiV52AGBqGTf
	+4/8eRk8RPbjvrzVp/Qs52ngFS+BRzsdqGOFHn+78RUYU17V7y/kxNSRWQ+wIN4nx0btD5uSOkp
	QNhNTlRESTQzsk0NDOcJxiVk29HUOtU6R9omwx9LlKrmtFZoUZ5quhCFv0lAjUaln+Erm8GVPLP
	+gJOqJ9uB8qGpCGG6vj/eeIjsGaTqAsNLnmYw23ICXshxAOWOPy69rh7ZUKxKWtaaSqisnMs3Ct
	ea62RZwbrLPJ70gc+pPdE8ckmfa07IxwIa4f5pS/hBS4+FpI4ReQVGKmAyNnqgcQrZi1NSdgo1h
	Syi+R+9xSwFSwd6q00Jdz+y1DXNCkG96ZAKI82vYkXv13RYYXglZ+kFOHrWvklRbBAii8c5g==
X-Received: by 2002:a17:90a:d008:b0:3a8:49f2:8ddb with SMTP id 98e67ed59e1d1-3ab3ae36cbcmr5697749a91.60.1791683319116;
        Sat, 10 Oct 2026 18:48:39 -0700 (PDT)
Received: from gmail.com ([188.253.12.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab55e41eefsm8496023a91.10.2026.10.10.18.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 18:48:37 -0700 (PDT)
From: Jia Jia <physicalmtea@gmail.com>
To: Mike Christie <michael.christie@oracle.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Nicholas Bellinger <nab@linux-iscsi.org>,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jia Jia <physicalmtea@gmail.com>
Subject: [PATCH v2] vhost-scsi: do not count PI bytes in the data length
Date: Sun, 11 Oct 2026 09:48:03 +0800
Message-Id: <20261011014803.100454-1-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vhost_scsi_handle_vq() moves pi_bytesout or pi_bytesin into the
protection sgl and subtracts those bytes from exp_data_len.  The length
passed to TCM is still exp_data_len + prot_bytes.

prot_bytes comes from virtio_scsi_cmd_req_pi.  With
VIRTIO_SCSI_F_T10_PI negotiated, vhost reads that header and does not
check that the CDB is a READ or WRITE.  sbc_check_prot() replaces
data_length from the CDB only when the protect field is non-zero.
target_cmd_size_check() leaves a write's data_length unchanged when the
CDB size is smaller, so a command that does not get that replacement
keeps a data_length larger than the data sgl.

The KASAN report is a MODE SELECT whose header had pi_bytesout set.
The data sgl held only the parameter list.  spc_emulate_modeselect()
walked data_length and read the next physical page.

Pass the data sgl length.  Protected READ and WRITE still take their
length from the CDB in sbc_check_prot().

KASAN reports:

  BUG: KASAN: use-after-free in spc_emulate_modeselect+0x145/0x380 [target_core_mod]
  Read of size 1

  spc_emulate_modeselect
  __target_execute_cmd
  target_execute_cmd
  vhost_scsi_write_pending
  transport_generic_new_cmd
  __target_submit
  target_queued_submit_work
  process_one_work
  worker_thread
  kthread
  ret_from_fork
  ret_from_fork_asm

Fixes: 9f977ef7b671 ("vhost-scsi: Include prot_bytes into expected data transfer length")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
v2:
  - Drop the claim that target used to subtract prot_length.
    9f977ef7b671 cites 14ef9200, which is not in the tree
  - prot_bytes comes from virtio_scsi_cmd_req_pi

 drivers/vhost/scsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index 4f8c0260bc9e..4bd29c2ceed9 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -1534,9 +1534,13 @@ vhost_scsi_handle_vq(struct vhost_scsi *vs, struct vhost_virtqueue *vq)
 		 * vhost_scsi_queue_data_in() and vhost_scsi_queue_status()
 		 */
 		cmd->tvc_vq_desc = vc.head;
+		/*
+		 * exp_data_len is the data sgl. prot_bytes already sit in
+		 * the protection sgl. Protected READ and WRITE replace
+		 * data_length from the CDB in sbc_check_prot().
+		 */
 		vhost_scsi_target_queue_cmd(nexus, cmd, cdb, lun, task_attr,
-					    data_direction,
-					    exp_data_len + prot_bytes);
+					    data_direction, exp_data_len);
 		ret = 0;
 err:
 		/*
-- 
2.53.0
