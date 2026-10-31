Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437706;
	b=yq/faCqVosQ5SxSekeoX82r9S9Mv3gSzck9EDmdaKvnCoLgc31rPY7d0houlZKhO31sy
	 pfGMPuRBSayPcAhVPyby8VaHOjjBcwCDTDJIdPLERe1AYeTiLoaoWy3xAHR3BAKO/LKHF
	 ngvXeI2xisU91ivBmDl2b+z54ut0/fUzXbSPGi23DWvcu6vy4extFLAhdflwEaIDUz7sp
	 rXz56W7a4y9kD2ZMG5jbuWv6jazaafuKvVyX+cKUQem3Jd2QF0prgLTL9ZRkcsFscfLnK
	 VLeaiCiCOh+ZDd5RMCV3klieWVaAru3EnrzVVTPHtlI/2FR/c7oaGCja+DHljt1BHvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aG7uUgIWZ0oyfHEXG9QJCx6yU4GdFnWFe7KXXLifVuA=;
	b=iNvVCq8R3opd0irsY88aTwUkyTu6DWRW55rw9+ONigbB2V7+NWPS8JD/Xe2oD7NNIEor
	 EiaTIRWDCS17mV6wkKfjCdyoXvxAuqUBEEa9Og4DPwgIXdtWnBX9tu3DTkSOMZvAYETZV
	 qGBrJBNKEd3DE8IOj+dNrDRhjX0JZpjUF8KFh5k8TaHBVaFlOZj0eCnxV5s28EX0B9raV
	 SxrOKCiUde6V7wtglD8o20lccy1OUBZmOmp4eC+qNk2ZlTlbDwTNMgrMpETRgt2n/gO0H
	 /lDYffR84fYhDXqa8R21f5ANeBv6N8x5jMiVTVgBtSoIfnB65JojPvoKj0cXNSpv6KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vg5vE9eJ;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97820606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97820606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vg5vE9eJ
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso705963a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793437705; x=1794042505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aG7uUgIWZ0oyfHEXG9QJCx6yU4GdFnWFe7KXXLifVuA=;
        b=vg5vE9eJNhVaTMln33GkMcgicuA4inDLsHF5BvImPmEHkyD6jFVW5B3uGrkO1lKCOy
         fkE6Nl86pPiNat/cAwxbPK1mAY0nRI4jH2D+C/ETCc7ZqybzifUFaJf7bM8F7fucQSDT
         /Yrz3uDAK6z7FDHPhaCqOZj+UZG7PK/ptf8XtNQy3EdeOpJxdxJIJ3dQ3IOA9oT1+YrJ
         ErxmzQ1Dcs77K7uuzGdg0ZdLnHS57s600+N9TKEQONeIeW0jSa1cy+6fFFHYwzNsJEMi
         BrU6nsY2nYG9ONNeQyVPhZDcLeNdk+vYJKbagwk0ThAnSaYNVCM3ZFqcKP8ltuqZfB+3
         ++gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437705; x=1794042505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aG7uUgIWZ0oyfHEXG9QJCx6yU4GdFnWFe7KXXLifVuA=;
        b=xE2J6dupYcVdPgusrDoRnkZ48tu6AUqt4yqLSA5SEaCqMIKWpjAsLPMBrwmbAFPsod
         uDlSN8jdFwvpdBcs7AYbgTG7LoFA/Yo4ZcYVj1UoyxcEueJBl+FZpEoz9vzq+zP6AVGI
         7ECex66vuZ0ZnQGUxrpwb39J4X8gOqkl/+fHxjmZGsGmNbQZa80HUqs3/XghioGgt/IG
         pXhgL8XstX2Fd3WNLcrqmwIRPToqpZ8Mt/O1nck6uGdG951KutyuuWODXsIGYUoAAzT5
         mG9coXA4B597coHErj5YRtkeUmFaWc5kOx0uFK7nVAVufkE4YVozjHTlXlrXzXq+wUV2
         mCnw==
X-Forwarded-Encrypted: i=1; AKwUvBxTxf6iBC3mV6dUhFnVa/xEjYogNCCXYfzN3OSqPfabqs8K+azpAgRNO0rNNHLtL2WAEt48/Eqt8FaleUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhZWPxAqJaK/+3f9eyg4eV6E29lS2WetN8JdB1yycjWthoQBZv
	hudc4l00XS+UIZl+Jur189Pr91NnuZjEUS3V7kYY3G7qMfIZ6rp0kxP3eP747Q==
X-Gm-Gg: AYBFou1KOdSTniLQCMoHrXwz1hbYCjvP79syeeXtVSk3CMvec0PTlM6yFPkEPBB+fTF
	EP1GT3N70wokya3fyq0+tmwvH2b2mbxDDcuMl1rqLVqDZCCd2W9emASkFdRPeAFBedNIo6e4wCz
	53j94BQkA7K5u8k7UAE10ZCfJZ2pEakV98PxPPLkD5waABQ7pDyTeozgxqJgN6TtKV1DiaSfbEg
	MftLkuopxe69GJsxTnqmGAa2fK92gR02cIESkg4aLXuBwedqasdz2pQ5SbmaRjnlWtwJ90bFNYI
	vOSmpbpPIdT1tk6vyGWny3BKRMh/OH34Nn5a1x69oWK1K5PzJTXH3UVZ48OuBNAfP/kZttefbgK
	KFATQgh9Y89qMSoI8hIBILh8JuN3xp3AiucJPojBb/3qoayoeQnCDXNQQ1AP/Du3O++B/UZSpaD
	Obcqg4DMvPoHl/1H0aF0QoRO1r7S7r/uzjE2J8C0e4rQmk/QhQNV/0F7W5ro4dJuxBDWdGnlLBe
	s/6mlZtYzogtoSYFY2juzkLNEoQP2gIobYIE4l4OVOzvOwLVG/EW7/arUxV36Dm77Sy1qua+Y0I
	GYRP7hK5cmKv63E2LdBP1zmyX5HZ7ib3xsQrXo32hDvm+17DhG8T3/4dw9vg5oKdkyEMBwMbNKB
	ZBk4xTBwWXvOE6GaaSKnexY+fHpnbtHnolfqqxEuKDLz46rhAkp09WTLInd+zP6JnbOi9CuszBc
	TibTM7dMjBcyPfU9F69i9CDxcarQ==
X-Received: by 2002:a17:90b:3d8e:b0:3a8:86b7:ad95 with SMTP id 98e67ed59e1d1-3ae897c5e7emr4019087a91.60.1793437704316;
        Sat, 31 Oct 2026 02:08:24 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09610f48sm1614184a12.2.2026.10.31.02.08.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 02:08:23 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] rpmsg: char: take ept_lock in the SET_INCOMING_FLOWCONTROL ioctl
Date: Sat, 31 Oct 2026 19:06:50 +1000
Message-ID: <20261031090650.23701-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026100306.68019-1-yuz08559@gmail.com>
References: <20261026100306.68019-1-yuz08559@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rpmsg_eptdev_ioctl() handles RPMSG_SET_INCOMING_FLOWCONTROL by calling
rpmsg_set_flow_control(eptdev->ept, ...) without holding eptdev->ept_lock
and without checking eptdev->ept for NULL. rpmsg_set_flow_control()
dereferences ept->ops, so this is the only eptdev->ept user that does not
honour the ept_lock discipline.

eptdev->ept is torn down under ept_lock: rpmsg_chrdev_eptdev_destroy()
(reached via RPMSG_DESTROY_EPT_IOCTL on a second fd, or when the rpmsg
device is removed) and rpmsg_eptdev_release() both do

	mutex_lock(&eptdev->ept_lock);
	rpmsg_destroy_ept(eptdev->ept);
	eptdev->ept = NULL;
	mutex_unlock(&eptdev->ept_lock);

and rpmsg_destroy_ept() drops the endpoint's last reference and frees it.
A SET_INCOMING_FLOWCONTROL ioctl running concurrently can therefore read
eptdev->ept just as it is freed and dereference ept->ops -> use-after-free
(or a NULL dereference once ept has been cleared).

Fixes: 5550201c0fe2 ("rpmsg: char: Add RPMSG GET/SET FLOWCONTROL IOCTL support")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
v2:
 - Drop the paragraph about the other ept_lock users from the commit
   message (Mathieu).
 - Bail out early when the endpoint is already gone instead of an
   if/else around the call (Mathieu).
v1: https://lore.kernel.org/all/20261026100306.68019-1-yuz08559@gmail.com/
---
 drivers/rpmsg/rpmsg_char.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 550fda2..d8868fa 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -343,7 +343,20 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 			break;
 		}
 		set = !!arg;
-		ret = rpmsg_set_flow_control(eptdev->ept, set, eptdev->chinfo.dst);
+
+		ret = mutex_lock_interruptible(&eptdev->ept_lock);
+		if (ret)
+			break;
+
+		if (!eptdev->ept) {
+			mutex_unlock(&eptdev->ept_lock);
+			ret = -EPIPE;
+			break;
+		}
+
+		ret = rpmsg_set_flow_control(eptdev->ept, set,
+					     eptdev->chinfo.dst);
+		mutex_unlock(&eptdev->ept_lock);
 		break;
 	case RPMSG_DESTROY_EPT_IOCTL:
 		/* Don't allow to destroy a default endpoint. */
-- 
2.43.0

