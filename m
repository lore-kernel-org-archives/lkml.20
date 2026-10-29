Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257745;
	b=SSO0suNp5PuJrNL9VV+n0s7Qzix8iy3Ycf9gxQ8pZhefsPWcRwdIy1kKTUo5Rh/Pa9Fr
	 Je4LerirnDHPDbaHdN6A8iTlZ+rTAV7yQgj+hx1ZWsngen0HqjDgeEuP2o+n+MiNAa3fE
	 lLr+NZf7onP7H3KcEVc9HVIK1mGXtpVYUZ6z8eDDCzaraXD3vLW7RCdM+3eIo4scvMxp7
	 fR3sQFnnvL+wjg/wPAPznf6ddWLv8NE1NoX6JfuW4bYH9kfPIQkPZ7yNMCgnsaOdYYjws
	 UfWsQiSby4cS17MA60rLoKP4/NvIG00704ymfmTmq76omaK84nsTOcBJBschHOLolCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/ChzfnrguZ/H1j3NAqG6KHPxUvTJUSYvVzUQIOYG/3o=;
	b=TW0q//ZGNgUIqHQBccMcUuXWhRKO3SZbHiyEtXsRn9LapH8UNSSswYQrCDGsS1eFzxZX
	 hjixvPfos5WH5Ler61ppFEa7QUJFAJcEDKp/GmZwTgDT/Z5t2ZNuc6lOyKgNUJmbj3Tyc
	 R/zcR/gV55bhrAGcWHwWB9Dp+Y/985389EMV+rSSVTOoBmVRab3VKQcMsVrJGK8T/JpSl
	 sm3kRgAPb2InHRAt4PWtPSwO6ZhHHLbDDxq9dxT5T0+FlXGux3hMfFI+PMqRKNpgYeCgp
	 BbtlCGuNhTXZRlJb/IvkZNp0O/PEtENAULqBGXmessNJIvU54lw1jh02As7tG3dX84A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YVMEjrFH;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722D8606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 722D8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YVMEjrFH
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06bc723b1so2330649b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793257745; x=1793862545; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ChzfnrguZ/H1j3NAqG6KHPxUvTJUSYvVzUQIOYG/3o=;
        b=YVMEjrFHAnDeABDDiXtBf5RXtinjezCrspfrOtyeUGDUfV9WV+nunR/iYPaaWnfidA
         Mk9z5qaQn4IyUvvz5LFadgaawjBaEKhX+VZZgtna4g7EFhEmyxoM1VENB+ZPaqxF1opq
         axURJtSkQidWe9ft56a8xAdQyrXKboPwZvbaEkhyS2NHUBiCrS8S0r7cRMsaB8fJ27MW
         oUOWOqYoRd6FASaZ7hXldIuFUWI99J4PVgb65ymY1usilmick8I+Xl4ZxuY+dsG53PYp
         MWDW9SXWKuaTNpORrtkZSjsdpGXpZUFQUBLmiLo8DsRMsgKuw/cf+udBio/UWOwVj3/F
         NuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257745; x=1793862545;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ChzfnrguZ/H1j3NAqG6KHPxUvTJUSYvVzUQIOYG/3o=;
        b=L5smrhojyPcYd+PnxPQSHoGG1Y3OgDYaPxvroHrxbZCS1x5gUFmfevTaTzLoBF0pbO
         cc1CMEGzfU5GC1hQNe/8lxrNG3jZnMjDdB8fZjt1m7uYGVsWVuJ9SNqCHGb6goqP9Cca
         ldYCgSbgIqLje6y0BYVjjPwiHBqRgMEx39XOIecahFTGRiHQlk1AR28178WxfJNHwZEM
         c84S6I8TbIxqkcaqGGArFb7PT31u5hJNsioQUT073HV3SZaq5ZFmyTRl0Ao8RKIfnc23
         AS1y8OKxLNprhKg89tlN2ThI5our1MfcutwbdAQRt4AQ8hiGVMlmLYYHrJwgC1V0Llov
         qsyg==
X-Forwarded-Encrypted: i=1; AKwUvBwwQ2rXfA26jZ0EcL+g0w2DPathwOUmfLm/zm/D/yruinlzA9TB6ymW4d7l44OyfDXIccbZvCfzfBRNft4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEywocomoLneECkD0sUiaN3P3R/1bNV1lc29XQTxzZ/hmdnAgz
	cFKXom1c5GZIQSLrvdUc1BpHL/UCDYoiw8wV8pX6BfBijbC66Ke63JwPXzO9jrnHJQhnsvC5ajE
	KcApiNQ2MItoOwq14VgUZzQ==
X-Received: from pffl11-n1.prod.google.com ([2002:a05:6a00:c34b:10b0:89e:78fd:6ab9])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:230a:b0:883:71f6:5fb with SMTP id d2e1a72fcca58-8a6e6348be0mr4187982b3a.13.1793257744383;
 Thu, 29 Oct 2026 00:09:04 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:09:02 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029040004.2100004-1-stanleyjhu@google.com>
Subject: [PATCH] scsi: ufs: core: Skip completion of SCSI commands owned by
 the SCSI EH
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>
Cc: Peter Wang <peter.wang@mediatek.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	John Garry <john.garry@linux.dev>, "Bao D . Nguyen" <quic_nguyenb@quicinc.com>, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stanley Jhu <stanleyjhu@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

1. A SCSI command times out. scsi_timeout() sets SCMD_STATE_COMPLETE
   and hands the command to the SCSI error handler.
2. The abort fails, so the error handler resets the LU and
   ufshcd_clear_lu_cmds() completes the cleared command.
3. ufshcd_compl_one_cqe() overwrites cmd->result with DID_REQUEUE.
4. scsi_eh_flush_done_q() only sets DID_TIME_OUT when cmd->result is
   zero. A command that may not be retried, such as an SG_IO
   command, is finished with DID_REQUEUE instead of DID_TIME_OUT.
5. If a retried command times out again, the DID_TIME_OUT set by
   scsi_timeout() is overwritten as well. sd_eh_action() then does not
   count the medium access timeout, so the disk is not taken
   offline, and a REQ_FAILFAST_DEV command is retried instead of
   failed fast.

Only release the LLD resources of such a command, since the SCSI error
handler owns it. Commands sent by scsi_send_eh_cmnd() reuse the
timed-out scsi_cmnd with SCMD_STATE_COMPLETE set and still complete
normally. Completions that arrive after the command was resubmitted
are not handled here.

Fixes: 7a3e97b0dc4b ("[SCSI] ufshcd: UFS Host controller driver")
Fixes: ab248643d3d6 ("scsi: ufs: core: Add error handling for MCQ mode")
Cc: stable@vger.kernel.org
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index fd52deb72d21..710d57bb4dbc 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5987,6 +5987,22 @@ void ufshcd_release_scsi_cmd(struct ufs_hba *hba, struct scsi_cmnd *cmd)
 	ufshcd_clk_scaling_update_busy(hba);
 }
 
+/**
+ * ufshcd_cmd_owned_by_scsi_eh - Check if the SCSI EH owns @cmd
+ * @cmd: SCSI command pointer
+ *
+ * scsi_timeout() sets SCMD_STATE_COMPLETE before it hands a block-layer
+ * command to the SCSI EH. Commands from scsi_send_eh_cmnd() reuse such a
+ * scsi_cmnd with the bit still set and must still reach scsi_done().
+ *
+ * Return: true if the SCSI EH owns @cmd.
+ */
+static inline bool ufshcd_cmd_owned_by_scsi_eh(struct scsi_cmnd *cmd)
+{
+	return cmd->submitter == SUBMITTED_BY_BLOCK_LAYER &&
+	       test_bit(SCMD_STATE_COMPLETE, &cmd->state);
+}
+
 /**
  * ufshcd_compl_one_cqe - handle a completion queue entry
  * @hba: per adapter instance
@@ -6009,6 +6025,10 @@ void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
 		lrbp->compl_time_stamp_local_clock = local_clock();
 	}
 	if (ufshcd_is_scsi_cmd(cmd)) {
+		if (unlikely(ufshcd_cmd_owned_by_scsi_eh(cmd))) {
+			ufshcd_release_scsi_cmd(hba, cmd);
+			return;
+		}
 		if (unlikely(ufshcd_should_inform_monitor(hba, cmd)))
 			ufshcd_update_monitor(hba, cmd);
 		ufshcd_add_command_trace(hba, cmd, UFS_CMD_COMP);

base-commit: 503e6172fa74da6b4944ece458f5534681e51d21
-- 
2.56.0.313.g2479322e68-goog

