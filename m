Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5358440F8FC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887362; cv=none; b=eWxGBM7oSUKgdSbRhcailmZ7IpUdD8vr7Eq8jnWEbg6Umwp4qXNZHb6RGwXDg6ymBO0S0ZJtBvqwYpLEbllLYv6g9Y323z9Y/uNLoyanbW7IdPCsZ8PAV3ZdjrN0ch/AajpaXJLpXixFc6x7aABUXLfjcqCRRMVGYDLIu+6gbis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887362; c=relaxed/simple;
	bh=yTZrpMhG7oYJAnjzCIzddDtAInyPWu7nypCHAAGvPo0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q0at6rK64g5KmZPN26I8J5Rieq/VCt5N+464xIA4+keuS4wpFdxulYnSSztprIHx+/ED6QZpRUJj+Ufoh5p6HGRUNSY2H+MkKKpZGnxE5b/yKJJ2GmcYlBmW75YEavaXIJPYubFEQdiZYdlEkaRJAjdDnzt6uvEY9sbBoK5xhos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wHBqbxBi; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wHBqbxBi"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so2716752a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791887360; x=1792492160; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZdaD079cI/p9+3qL8ikHF1wm2BIaNJ6noJDSD0TQRCk=;
        b=wHBqbxBi0BtG1XObcGrnZDCqCJc6iHKeWUmKsmkGXIn9SLfdn2W0uZY9MjfCE31/o4
         2WvvNNuWNDWf/Oj4Gbd+vU6v8BHk4hqtUmhJ1gvQeBmMraC+5+CWRa6PkK4i+8hpBSxZ
         K/Whg/ZwVBLhH5+g7+SmcpkctZUZcz5vFSVDrVOPEp+0tYQOS+kanNRSlBjtsqlQwi+c
         +8wR7OrpkLLFMbQFQ334MLQp+eW86EcK6ofPshw1DU82xfPx8PHs9LBdcqOvcQSDdBp1
         JZy1OV099KMoOiTTU1NRAvm6RSDa229Qa3X+lViKBa5sXb8iE2wQ8/dYCpZjXP6WSx8s
         89iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887360; x=1792492160;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZdaD079cI/p9+3qL8ikHF1wm2BIaNJ6noJDSD0TQRCk=;
        b=DgRqfowCSjlQflat3o/XlDtfMvn/A/Tk9ohAQIxmIjAJEljHeevCtyaNeVKzrJuExW
         sIa3dm35gfAOuVXZrI3oTa3pr1SUGIzdvklbCW5d5ybJHGfW6wNfImSCbLPOaEgmQKwN
         P8JnXVvu9eXBCK2RYdt+m2GkA4voswE7sWlVktcjbugH5K7BS+o1Soazngiq+nr1leBv
         kZxy+mroiv7vfTZQlr+NVR0QFsX9FpxLRiBkqt1x+rzuHHlwvgysYhKIWtNGyOckE59X
         vI0odgbKOdN192OZ5wAQTieZOeza3fw1jiTDya5wyCbzr8f/vzs+NpU34EOlTbL/SmSl
         92hA==
X-Forwarded-Encrypted: i=1; AKwUvBwhbwXJHBGIqmz5e3IWVoLMS62cYLUcLOWTGDIo4IcOBVt9qZGQH8Y/xhJp6l9xhvz/5yB+d/IYf1tAVJ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQAee8+ED7smV32W/0E0FgbeRHF1KWRsQJ+0NyBlIl/Jzqe3OO
	LyBvPvY5Rso3lJugafx4PjN3WJHG2yuvRjclKCsL0/tTJTu/aW1PHBhAaMMKpHM6STN0FJr0fXo
	klRcbL27TNwkkHNdeXi1N2A==
X-Received: from pfbay11.prod.google.com ([2002:a05:6a00:300b:b0:886:fe91:dda4])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:985:b0:882:bf63:480 with SMTP id d2e1a72fcca58-897c7adfb77mr10543894b3a.49.1791887359346;
 Tue, 13 Oct 2026 03:29:19 -0700 (PDT)
Date: Tue, 13 Oct 2026 18:29:12 +0800
In-Reply-To: <20261013102913.948718-1-stanleyjhu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013102913.948718-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013102913.948718-3-stanleyjhu@google.com>
Subject: [PATCH 2/3] scsi: ufs: bsg: Clear the UIC result byte before sending
 UIC commands
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K. Petersen" <mkp@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: powenkao@google.com, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>, 
	Peter Wang <peter.wang@mediatek.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ufs_bsg_request() passes the user-supplied UIC argument2 unchanged,
including the result byte (bits 7:0) that only the host controller
writes. A non-zero value triggers the WARN_ON_ONCE() in
ufshcd_dispatch_uic_cmd() and corrupts the reported result. Found by
syzkaller.

Clear the result byte before sending the command.

Fixes: e77044c5a842 ("scsi: ufs-bsg: Add support for uic commands in ufs_bsg_request()")
Fixes: 9fb4c793223b ("scsi: ufs: core: Complain if UIC argument 2 is invalid")
Cc: stable@vger.kernel.org
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufs_bsg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/core/ufs_bsg.c b/drivers/ufs/core/ufs_bsg.c
index dab1f05aff38..331ead0403a1 100644
--- a/drivers/ufs/core/ufs_bsg.c
+++ b/drivers/ufs/core/ufs_bsg.c
@@ -179,6 +179,7 @@ static int ufs_bsg_request(struct bsg_job *job)
 		break;
 	case UPIU_TRANSACTION_UIC_CMD:
 		memcpy(&uc, &bsg_request->upiu_req.uc, UIC_CMD_SIZE);
+		uc.argument2 &= ~MASK_UIC_COMMAND_RESULT;
 		ret = ufshcd_send_bsg_uic_cmd(hba, &uc);
 		if (ret)
 			dev_err(hba->dev, "send uic cmd: error code %d\n", ret);
-- 
2.56.0.385.gd3acb90ef8-goog

