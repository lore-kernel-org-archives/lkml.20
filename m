Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786BA3CD8BD
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791274922; cv=none; b=QbOFc7pEwKschXFdGzuhQIHX8ASksVcRtNCS34tVK8E52dpHa4vgHZonHjzIRuzfvXLd5JkvbKBio+D447E7bUO/y+dExF+bHhb+ExibeB65/0EBusq8zyH19uR8IBVKhrJy5hlJG8s531e1ZxMtt5hzrns6by4VmpmV4mv425Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791274922; c=relaxed/simple;
	bh=8obgukGNW7ky7Kk/hIb7Tx1nD/UtTtHjcp92oif6oK4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pbDzUH/a7yAwX7n4gc1SVY/Pn7pCJoi811dDg+ljosZtL65NGLMKOORhenwrJTODfF5pDrlSiHp7P62z2GZKiYt/yXpdsTXo0GsWmMW2GLBu1/et24pHB9D5OWnjYk9YC5Wc4WAFRfHfHP2akOlHjKsUvvTufBoTybr3VPzxicE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0Xdv1+G; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0Xdv1+G"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so231615a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791274920; x=1791879720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b8u3Yoco6qaMZId6V3SXGgwbYt0UtNsiNUBPhWK2nhU=;
        b=m0Xdv1+Gml3S8Z5KJmDNN58lyZP1sgf6qPHbzMbWGTtrSX4ppMxjDzQjjkFitF3Tli
         Ns0uq3bcJKCyUwIAFFc0o023gVefmmPDOF0KuLA/fY0S2Y9CUK3OupAS2UEkOrCugBkA
         lIPJp0QmDKg7m+pOgAxbMfo4F+H+L+bo/VtFbNnNfilTYdC1jDKUcjwdR3iiOCyCcwlc
         rOR3wLipqV1DVQ9P2gy9m2RsBS80kYcYjlghYjLFh0fkmO1635q+wj8Jehkkd1qRsV4w
         T+pluCfp/ENkK4Nrpvac91SdcY1QYOiI9HQDJIMfxgG107jcGlv5MpMi96M/QRsRgYWS
         hHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791274920; x=1791879720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b8u3Yoco6qaMZId6V3SXGgwbYt0UtNsiNUBPhWK2nhU=;
        b=hcmcpn/rDRZk0nTrwe73WYKSCvh8YGy8MLHhgp6e80jooE6MUejA5hoZFJE6MX8Feb
         3eUEMWVlypdKnzV/LUSiefsMyTMSvq86fkuuyU/c6xhXZAZVROCW4MmAWBJ+mZTBLrgp
         Hc2FAIT4Q47N7S6pglG1u7JUK2biysq7AHBtXyMCfvVrxORwqgQq+pwYjO0m8BIfbGot
         G1EKQxVNuTOu7F5OfPjcd/a5lHw3jswqtncEgxzuVfz3thhujKgooGa4Tx8EYa9sYuZZ
         hIx+jWzM5RiivXsQiBg83hueMWjIjEhThvWUvtzgnNDrRHFM5bf+ylVsjH39n1eMzzdl
         kwvw==
X-Forwarded-Encrypted: i=1; AKwUvBy/WUA69OKG53vLli0JCj28ll33v/u8po0FDl3kJaXSUaajk80rOCuA6tlPb6j2ERFFDNNkGbaJy5Y98Pg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9fREaKW9ClOV1WKuDOgraEd7Cza8A1FjWJoNZ+BvZN6xcGtWZ
	LEAXnvjtJS/7ZBxfpMk6sPxEbdcoAUT7e0y766ebCYY84Rffvny0oSzD
X-Gm-Gg: AYBFou0+WfVQ8DrAWPgKZhDyqIL5ncODeJ7biaEStaIcI5O38VcPI//pPZJCJ1GNEQO
	0CLHz09xnTkWtAJ+wNxBHMoTnzSTdUGrAu0TKOXr/nxuqNFl996Cf5PTSV67wxgvieOtEt60e4j
	CwbRs4G8Gu3BQDer3UlIhaOBEbHiRe6euxoRz3sJ+ebKmGqpIVP0Vp/UjmcERntyemOv1FLC3IQ
	nb2NbxLZozhbRAxqImXVtH8QuhG3UMycf/Yg+4YlcHCxl/Jz/Gj/6sKxIEmcvddk3Fdn7SJLyqC
	QbBNxiVqhA1MJ5TkxnBqh3Q0FhndR4WWXzi6Ozqc2EH+uZI87NIr4W7GK08nD7CydZ2h8nd/ky1
	oPehyyuFVyc0KB8INB0o4rQoh+A9JnVlIkysRV4zq3pbLtY3Du76/aqkE3+QRLfYPCG1vUoFjWa
	0Ii8PtH3aD2xrZcUpfmeYh1j8ATegWcards7bcVWaN7bjIAJn54OT7oiaRtd4T71JolYmxxck=
X-Received: by 2002:a17:90b:288c:b0:3a2:b036:ed62 with SMTP id 98e67ed59e1d1-3a8733c829cmr301292a91.37.1791274919752;
        Tue, 06 Oct 2026 01:21:59 -0700 (PDT)
Received: from gmail.com ([188.253.12.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cea0f1sm3628152a91.15.2026.10.06.01.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:21:59 -0700 (PDT)
From: Jia Jia <physicalmtea@gmail.com>
To: Mike Christie <michael.christie@oracle.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jia Jia <physicalmtea@gmail.com>
Subject: [PATCH] vhost-scsi: do not count PI bytes in the data length
Date: Tue,  6 Oct 2026 16:21:02 +0800
Message-Id: <20261006082102.27085-1-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vhost_scsi_handle_vq() moves pi_bytesout and pi_bytesin into the
protection sgl and subtracts them from exp_data_len.  The length passed
to TCM is still exp_data_len + prot_bytes.

That sum matched an older target path which subtracted prot_length
again.  sbc_check_prot() now replaces data_length from the CDB only
when the protect field is non-zero, and only for READ and WRITE.
target_cmd_size_check() leaves a write's data_length unchanged when the
CDB size is smaller.

MODE SELECT, SET TARGET PORT GROUPS and UNMAP then use data_length as
the size of t_data_sg.  The PI bytes are not in that sgl.  A parameter
list that ends on a page is followed by a read of the next physical
page.

Pass the data sgl length.  Protected READ and WRITE still take their
length from the CDB.

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
