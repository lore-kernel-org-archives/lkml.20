Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C09286D70
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792023547; cv=none; b=N8wJXF1gVxu4ppWO18DYHRt6d/gMkOJcCBV1HhWOBJ0eKiUp835Z9JnFJtr7zTH8PaqVKC1Xsaw4x+lT56t9kX/SXii8ljgWW6j0/zmwlfkKajr6FbqtujBM3KjYieL/YLkOMrLtYGnCmVmruXxTuPHuWrVsw1RI6dY4HHpClDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792023547; c=relaxed/simple;
	bh=DkbK1hCyZBsi9bL1EMrWhf7s+M+Xm+ZYde9iyTpAEvk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lR+JlR79fruTnmnua/waNba4Y19dgf0R6oUgAwn6DzRBW34Fb4+a5wlYqy9AMQf/u+ahdeO55N5y9VH8H4Ux5VfHYOjQBSmoz1iVmUuWkZTA155IC5InzzufMfVZqsh+G7CBn3O6R/pwTyvSIysY2ETNod3TP9OOc56yfKGKSA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eUZDmJ/d; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eUZDmJ/d"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88c76888646so1641972b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792023546; x=1792628346; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7vaOB2E95aQO/eMkL0Ew2CWV5P3KfBjRVcUeuca+9w=;
        b=eUZDmJ/dTHiJMiOp6KoojAyQqB23YXyiZPp9AQyslS1GroydEOA6uADO9TY7juFcqs
         f/W6x/9cTXgv2RqwI+mkyjcfnfTSgWqq3c5H3HWAcP4jtN8KwiN9+FK9ZHBPvpemigai
         VrnO3DAfqnYtpxppdbEUYSrV4VJv8CgXx06lxxYrI46rcAKJlkmRu1RNjKsCxvquqPua
         gwr9WKamo1yEaSwpNMBZQmIABrZdbXpuwqUSNPRq1HVtGGpHdfXSAIYpwfKuAlZ7r3+u
         4xz6iBSx1xUSD2NCTeqkCanGfjyTuHGdHLqacq9FUFjnIUfHsxaOYHshZARzzzEjVCMG
         uP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792023546; x=1792628346;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7vaOB2E95aQO/eMkL0Ew2CWV5P3KfBjRVcUeuca+9w=;
        b=lrA4ebodvmef1qPWF12mm79BOFWLT5ee6zBW8Hw2SBjudcMzC9RV2P5mVMYO2es3EH
         axG+HE8uOGW3HoPyM9eCcYmK2jIWjrsYbpBgbY2UJ56w8LbU3ZB7X0+WwjoJgZ9z0baK
         xUbbqO0lZ+MWapZ/O+vC/Gx+jPAQbwOMsc8YM4f53NOv+dmLoDow1XURpQJDkybgju3G
         MIk0lSfcYO8trYad7Op676Jy2n4kEqSRqWz4GeDE7AQuITXEh7OMzCJqu+I0mBTNUAl1
         cyGdNTKjEXlh4nE8A5xkt+9UoecFP/5jt/VdFhMyt9NmocGaRG6MI+mJLMBvBmJuxGuv
         Wdbw==
X-Forwarded-Encrypted: i=1; AKwUvBwesxKARDvfD4327YG75G81n7c6VkVeEc1dSHtt4CYmS6Ihx34ad8VO8Mg4DeOeoMq3vrP4ANKSRK+Naj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpgYWv+UJKa/o6e0zxQFlieUjkRldNKkSfYv2akykcd6VUbuiX
	mRFdag8dsHdaelQEJSkpXS+gqs3iZ4Ry+jOdAuNBSz5m1QiYAvVlwTSmI2VgMMWI/1YiZOd+XON
	2pGrjnDgimN5Ot+vhJPPxXg==
X-Received: from pfblh20.prod.google.com ([2002:a05:6a00:7114:b0:88b:aa59:d8ef])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:6c90:b0:89e:584:bb77 with SMTP id d2e1a72fcca58-89e0584be02mr2041770b3a.58.1792023545218;
 Wed, 14 Oct 2026 17:19:05 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:18:54 +0800
In-Reply-To: <20261015001855.3450573-1-stanleyjhu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015001855.3450573-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261015001855.3450573-5-stanleyjhu@google.com>
Subject: [PATCH v2 4/5] scsi: ufs: bsg: Reject UIC commands with a non-zero
 result byte
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K. Petersen" <mkp@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Brian Kao <powenkao@google.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ufs_bsg_request() passes the user-supplied UIC argument2 unchanged,
including the result byte (bits 7:0) that only the host controller
writes. A non-zero value triggers the WARN_ON_ONCE() in
ufshcd_dispatch_uic_cmd() and corrupts the reported result. Found by
syzkaller.

Reject UIC commands that have the result byte set with -EINVAL.

Fixes: e77044c5a842 ("scsi: ufs-bsg: Add support for uic commands in ufs_bsg_request()")
Fixes: 9fb4c793223b ("scsi: ufs: core: Complain if UIC argument 2 is invalid")
Cc: stable@vger.kernel.org
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
Changes in v2:
- Reject a non-zero result byte with -EINVAL instead of clearing it,
  as suggested by Bart Van Assche. Dropped Peter's and Bean's
  Reviewed-by as the behavior changed.

 drivers/ufs/core/ufs_bsg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/ufs/core/ufs_bsg.c b/drivers/ufs/core/ufs_bsg.c
index 0db830e54ef0..cadde515f040 100644
--- a/drivers/ufs/core/ufs_bsg.c
+++ b/drivers/ufs/core/ufs_bsg.c
@@ -179,6 +179,10 @@ static int ufs_bsg_request(struct bsg_job *job)
 		break;
 	case UPIU_TRANSACTION_UIC_CMD:
 		memcpy(&uc, &bsg_request->upiu_req.uc, UIC_CMD_SIZE);
+		if (uc.argument2 & MASK_UIC_COMMAND_RESULT) {
+			ret = -EINVAL;
+			break;
+		}
 		ret = ufshcd_send_bsg_uic_cmd(hba, &uc);
 		if (ret)
 			dev_err(hba->dev, "send uic cmd: error code %d\n", ret);
-- 
2.56.0.385.gd3acb90ef8-goog

