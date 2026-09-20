Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48C6547070
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789914803; cv=none; b=WkiGFmtoIVWmDwHAi51y3xPUO7o8img1bXUu1g0n2bO+ZJRaF4K5gXjUE42nOyahB3yIq2wNq3i2Pi+V4RqEON1TYthTNrvaXk07vPqk2lHOoToN4E6F7lQ2ZXml9evhsUPA5VjEYzRNr8xWRh0mlDdYI9rhzcDKU8x0YqcMqcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789914803; c=relaxed/simple;
	bh=iFMwRKU9pepnxcXJ0kDM8wipLbMUx9cGPgxGzmxcYDo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gp2Mheh1MjvQQREEj2F+XrqTSTDxt6xcqEtSUyR08tL8P5sqx/kU3p3kTFA5pMyKWy8K5XTYLGZcWOyRJnWZ/IdimbQ8ZoEEMKkZSJoXvjDwCkBAljDUew737NL+d2htwuW/7xjuANkmpH1Cydb0DwMGrLU4szv2fHkrWNMjx5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sWF4U4KT; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sWF4U4KT"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd753a52bbso42390935ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789914801; x=1790519601; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BH/eNMKNBqCJqOqSbdABr6hvRFMCrjgOl56a1AIe6Js=;
        b=sWF4U4KTIAWVIm8OR4iedqCvBK9vjOVTxQqg+MYk/Si32foNZMbR87AMCScviRIbG8
         49Cyo4uwVlE4MdO3+wQRmz9Sv1wa7YeMm3E4hN1U2px0/azrdXxVkad/Z5Ah1bxgp7H4
         xTz9D3UKhIaGVrdJV7OJmCe8Mwb0TP7b5qbGvzqUmzYleNokx+qDhqC66Ol8eIp/BNqs
         kzA8VrOL41imoqsJEVSnwnQ9YtIJUayTfIJrFPrd633LhY1Qs1hgx4rezhdivCFrJjY9
         FQ3QZTn/f3MA/05Ncf5gmaCOdGZ9up1m5e9Xob9ycad8NKzsZJvmP0Dwow/9PFeyzG9W
         EQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789914801; x=1790519601;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BH/eNMKNBqCJqOqSbdABr6hvRFMCrjgOl56a1AIe6Js=;
        b=K7BKuCilAJG4+LsUnpJdY8v7HxeZodnyctbwaQxBUUskPaMtyqLRZhX7HbAJ4gnd5y
         zB1lHuCmMm6/71T7TMwDHoV2WtUCZCAfJsbgxg7140AJ11o//5NgxRa3NcUuIp6LTcfd
         DbhS8BzTaVd2M6ywTnZ1ciDyNov4H0h7wXHIGxhG+MSVc9aG3JB6i7+3/bQScpplulPs
         aQWjSzxq2ZoUJsS3RWdKN1Urgp6THAvBJ5GR/5GIfzasxL/yGbQMyEpFBCwVj7hpsKtF
         KrL6AiQqEEv1E+ZBVRTn0fHBc3UsiOBDQctErGbfhGldIVGyeSHY7DULr6t/aLo3jmY6
         SIUw==
X-Forwarded-Encrypted: i=1; AKwUvBw4mkEm1jZgnf+Y7EKiVmEEF6NDTV6S1lnANmKwt1FJoUFJwBNCG3+dsrADZzlpQixLXIsxj/m8MnO6Lpk=@vger.kernel.org
X-Gm-Message-State: AFuF++l6fpSpmGxZSKTCjr57mvmMw0bfTdaGMwPIWdbGE7uXI8uoC8CK
	f8aJxmPEJX5Jc+g3bDdAqzGcuyLdYeZxhRiFiSmKNdq0b9ouA0ZWqaimpzz020ZhtzR+JusK7Ic
	9aez0zJonlCkTwEOxtGNGpw==
X-Received: from plss10.prod.google.com ([2002:a17:902:c64a:b0:2df:4010:a1ca])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:4b28:b0:2dd:c100:a5da with SMTP id d9443c01a7336-2ddc100a676mr59392715ad.46.1789914800976;
 Sun, 20 Sep 2026 07:33:20 -0700 (PDT)
Date: Sun, 20 Sep 2026 22:33:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260920143319.3659543-1-stanleyjhu@google.com>
Subject: [PATCH 0/2] scsi: ufs: core: Fix SCSI EH command ownership and remove force_compl
From: Stanley Jhu <stanleyjhu@google.com>
To: Bart Van Assche <bvanassche@acm.org>, "Martin K . Petersen" <mkp@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Peter Wang <peter.wang@mediatek.com>, Bean Huo <beanhuo@micron.com>, 
	"Bao D . Nguyen" <quic_nguyenb@quicinc.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

In ufshcd_host_reset_and_restore(), ufshcd_complete_requests(hba, true)
couples LLD resource release (ufshcd_release_scsi_cmd()) with command
completion (scsi_done()) right after ufshcd_hba_stop():

1. EH-owned SCSI commands (SCMD_STATE_COMPLETE set): skipping
   scsi_done() in ufshcd_mcq_force_compl_one() also skips
   ufshcd_release_scsi_cmd(), leaking DMA mappings and
   clk_gating.active_reqs whenever ufshcd_abort() fails.
2. Non-EH SCSI commands (!SCMD_STATE_COMPLETE): calling scsi_done()
   right after ufshcd_hba_stop() completes them before link recovery
   finishes.

This series enforces a strict ownership boundary between LLD hardware
resources and SCSI command completion across SDB and MCQ error recovery:

- LLD resources (DMA mappings, crypto PRDT, clk_gating.active_reqs) are
  tied to controller execution and are released whenever the hardware
  stops executing a command, regardless of whether SCSI EH owns it.
- Command completion (scsi_done()) belongs exclusively to SCSI EH once
  SCMD_STATE_COMPLETE is set. For commands where SCMD_STATE_COMPLETE is
  not set, UFS cannot delegate completion to SCSI EH because UFS also
  performs autonomous resets (ufshcd_err_handler() on UIC/controller
  errors) outside of scsi_error_handler(). Since ufshcd_hba_stop()
  (HCE = 0) wipes all in-flight hardware transfers while SCSI EH is
  inactive, the driver itself requeues halted non-EH commands with
  DID_REQUEUE after recovery finishes so they do not stall for the 30s
  block timeout.

- Patch 1 tracks controller resource ownership with lrbp->in_flight and
  halted non-EH commands with lrbp->pending_requeue, splits host-reset
  cleanup into ufshcd_release_stopped_reqs() (at controller stop) and
  ufshcd_requeue_non_eh_cmds() (after recovery finishes), and aligns
  ownership across ufshcd_compl_one_cqe(), ufshcd_abort(), and
  ufshcd_clear_lu_cmds().
- Patch 2 removes the unused force_compl parameter from
  ufshcd_complete_requests() and ufshcd_mcq_compl_pending_transfer(),
  along with the now-unreachable ufshcd_mcq_force_compl_one() and
  ufshcd_mcq_compl_all_cqes_lock() helpers.

This supersedes the v2 series [3].

Link: https://lore.kernel.org/linux-scsi/eacb6c2a-9219-4e9b-8726-8d38b641f543@acm.org/ [1]
Link: https://lore.kernel.org/linux-scsi/1ddc5181-f547-465c-bfbe-dbf14a91493e@acm.org/ [2]
Link: https://lore.kernel.org/linux-scsi/20260918143809.3034592-1-stanleyjhu@google.com/ [3]
Link: https://lore.kernel.org/linux-scsi/20260920135014.3528082-1-stanleyjhu@google.com/ [4]

Tested:
Verified on QEMU ARM64 (SDB and MCQ) across probe, I/O, reset, and
unbind without UAF or leaks.

Stanley Jhu (2):
  scsi: ufs: core: Release command resources instead of force-completing
  scsi: ufs: core: Remove unused force_compl parameter and MCQ helper

 drivers/ufs/core/ufs-mcq.c      |  26 ----
 drivers/ufs/core/ufshcd-priv.h  |   2 -
 drivers/ufs/core/ufshcd.c       | 213 +++++++++++++++++++++++---------
 include/ufs/ufshcd.h            |   4 +
 4 files changed, 157 insertions(+), 88 deletions(-)

-- 
2.51.0
