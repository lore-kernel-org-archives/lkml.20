Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6523CB8F1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 04:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790829948; cv=none; b=N4oJ3JhrPegXhdYb8vKyHyxFxnsGrCzSVS/pXVWFAD52GOeKAS3BVuMEawFzt+tBsd1KFPn3rqQiLf3ZCb9eoZ/ZB6B/f2MUKAHc+sgCx0SeT7E5HMj0PMdUQoc6SvgDb7jLdH7/S1cViOB1SLwEtNLIEDVgJzUQ7j2Ltr5wRnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790829948; c=relaxed/simple;
	bh=eEl8QR+rB9IOMQDWRHcUt7vIZSR3LbsxWeksxBhbqT4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hb+RyNuGSvEWlvu+zHXDUVQpPbpEAg93JltOr1GKSQQSssnbZj3yJv9t+wzMgljnLAPtarcogdFakA4W6nlGH7UBjVKC9Y13CkGzOxwG/rsSA5iRDldvWYSjA1NnstedhKNT94JLaruWf6TIbKiJnkX85Vl6/QDrITVRPWW0bjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKwdPYAl; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKwdPYAl"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so5761671eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790829940; x=1791434740; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dXeIZLOIAX5LEZkoUbZIMdBzX/lThU3KbCUVJA49llg=;
        b=PKwdPYAlXPiSlFk20xReaHE3QR43JnVDuiftO1UPVb39LbVHRXKPuQpT4rA1RLzVrb
         v/1DyKyheNKvN8rKIXiwmp0XgcoM2rR3QxFWBk8vgxkoD32iSAzfIQUu625kpZZl8JI5
         Som3Na6DFFQ0QdooXQwvqy8wCoWLvOU3v0RZyhBDFnPKGgglkQ/k2AtUERgDE3Ph8q+h
         YqZb9Upon88FeNvw1Va+EutyYjIahjd5QqukSvTETYDWR4NNDtv10V7V9lVVtFqlJ9hs
         jgpSEMLtx7NWwFaCdHhO5IfdiTsiHM5+rdRX5Y6vmkggwCNzjHC2AJXZce2wQE0mPxvO
         8mXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790829940; x=1791434740;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dXeIZLOIAX5LEZkoUbZIMdBzX/lThU3KbCUVJA49llg=;
        b=MIlBBwT85TiEmFE5zcVkG1Cxxvr051YRdZIDkvKwy4Jwz64x7rh7UECehuL2HPIUGu
         voUg2d92jzgM6Lr8ITqnlq/zNmmoaBAt/w9evufVHvMYm3BwuG59BxRHUQnBxEgv6dIR
         EnWaq1Sfv5FIra10utoUbw9YWidBcxsUU5HPDmMrjDXtyHmnKQfgsGFXv12XIfytM/QG
         umyiey5KfUpcjXVX1VQeQ5/zZ57C0/jtP1qigbthN+bC/jPLststGbwKGnbLePF/jKKN
         B/dyr7bjaZWJ8t9FMrLzKI+f44HsrQsuzXtFYRbRIkVxa4oZjrp2kWesaeEuPie1o8eA
         PxcA==
X-Forwarded-Encrypted: i=1; AKwUvBym7TjX+XfCjVOBtdXylWc91blWtq0UexSHQ36laV+YrZnQgmfX+iWKVSaanTAztuzkDASj72now9w/sJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgoxJg7G0izaeCRY6exzAuftdOgqW43uhDdnHQUsciQwsHdblM
	yCOZXG9XWD07AcIiLeJ18nASUUCE6SDMvgCZXsOHXib2L+rtGY2usJh8
X-Gm-Gg: AYBFou1RQ4+cXyg5vC1vN17YbiDwxFgPNwJwDbiJPLQyvlGiWTHEyqGBx2Ka5oDUbsm
	SQMfyAkzn76am5rn57dZk2wJ9AOTxGvh84yOB0x5Br6mQ41RNqV7HyfcSNmQRmL+wgaftFJQEYa
	V9jMjsvqBAgIW624x+aPW+j5ojBskrLVNw7GqHhH38EEUc3Ibcw6dp7H8HOLRTv86pH+0x79DJT
	lAM+L3iUp9j/2wfnBc9cUqN1oys3+bprNkMyq7TMjNbcdWJPY7CjMlVBCeH8frtXnrA3z6dMOZo
	M7apfZhWfUltn6PF7ctoHasOLUFWpcHh0mVEdHa81yh90fFKR2TvLcWPs/puk+Apg/SFf5NhHUw
	YklgHsdzjalC+XApMeCg2/BX2gxCCfApGOi1yrHyXV7mTaOF5UhqYR+JANYhcTMK6SUwVmF5NOS
	vQprN48ghOZBAYXoQ5oY3iI7rVHzR3+xICwQCz/jSjI9muXpisej2BJYp4YE6mv5JVWcBxlTEpC
	HwGC/lXUsw/E2ECN1D0YCdR0hgkXsn5dvFluWM5tnoG7Ngwq0xXiFlbvWDY5r0=
X-Received: by 2002:a05:7300:5552:b0:33b:e3c8:aef4 with SMTP id 5a478bee46e88-34cd6100ce9mr3727853eec.0.1790829939700;
        Wed, 30 Sep 2026 21:45:39 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9835:e0ad:476f:74a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3e3414asm3891332eec.19.2026.09.30.21.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:45:39 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/2] wifi: carl9170: revert broken devres conversions for
 input and hwrng
Date: Wed, 30 Sep 2026 21:45:29 -0700
Message-Id: <20260930-carl9170-reverts-v1-0-7033b5716c14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGnlvWoC/yXMQQqDMBCF4avIrA0ksY2kVxEXSZzqSLEyoyKId
 2+qyw/e+w8QZEKBV3EA40ZC3ynDlAWkIUw9KuqywWrrtK+0SoE/3tRa5TXyIiqmR6yiCybYJ+T
 bzPim/Uo27W1Z44hp+XfgPH/Mq+UMdAAAAA==
X-Change-ID: 20260930-carl9170-reverts-bc4b3b6a1a25
To: Christian Lamparter <chunkeey@googlemail.com>, 
 Kalle Valo <kvalo@kernel.org>
Cc: Christian Lamparter <chunkeey@gmail.com>, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev-6c14f

Commits 23de0fa0d2a0 ("carl9170: devres-ing hwrng_register usage") and
87ddb2fc29f1 ("carl9170: devres-ing input_allocate_device") converted
the HWRNG and WPS button input device registrations in carl9170 to
devres attached to the parent struct usb_device (&ar->udev->dev) and
removed the explicit unregistration calls from carl9170_unregister().

Because carl9170_register() runs asynchronously from the
request_firmware_nowait() callback after probe has returned, and
carl9170_usb_disconnect() frees struct ar9170 immediately in the
interface disconnect callback before devres_release_all() runs, both the
WPS input device (along with its ar->wps.name and ar->wps.phys strings)
and the embedded struct hwrng remain registered after struct ar9170 has
been freed, leading to use-after-free bugs.

Revert both commits to restore explicit lifecycle management in
carl9170_unregister().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (2):
      wifi: carl9170: Revert "carl9170: devres-ing input_allocate_device"
      wifi: carl9170: Revert "carl9170: devres-ing hwrng_register usage"

 drivers/net/wireless/ath/carl9170/carl9170.h |  1 +
 drivers/net/wireless/ath/carl9170/main.c     | 42 ++++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 5 deletions(-)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260930-carl9170-reverts-bc4b3b6a1a25

Thanks.

-- 
Dmitry

