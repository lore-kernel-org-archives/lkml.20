Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0B73D1CAE
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452394; cv=none; b=B6wBxg+dARRODX5LnRiqBRvV2wBvPVcXYmxe4hQK6+kO899rgi56T23QFsOl23Qm6BAtmGdkDE4TKWZLpVJLnmEJ8bf8OtNnv531cjoOtMIp310JxaLVPdc8Ls9qqmr02lqy7ajVZ8MUeQrj83YEhtoykIBrrSPkXOGshQjjYro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452394; c=relaxed/simple;
	bh=yt1krHFUizCiyHqPICB6u5BfJy6aereXdPVeh3hzHTU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=chKEPeX+iJ8oQK+7Bc1kmVzExVEapyuNjr+evmB65OLtAc9cWB0FkQ1bY3hujtR7QuSvvzpZYL3FAKk2FcVP8gKQUm4SxKJRg6uOY0o771yB02oavjrZ35TTLdmeo5lp4QllHd+PYTW1FUPPZCZqQaZ0GCmfEwViuHA6VOLpMa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExHxV0Fu; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExHxV0Fu"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-351775aa1c0so943055eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791452392; x=1792057192; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DhD2kC+TgI9jVZahgsNkJ3B3BbFkorvXCqZ87mDIfYA=;
        b=ExHxV0FuzTx+rnLcPKq83SE3g3CF+BW0bOisGBafGWIGQLXhynJSLZX0VcR0rMvwiX
         nP5qUsbe05zWJKpJuunhl2RFZ93RSrmW0QocsJqbxwLr2CuRh83PrXuGl3MjBt2irAJx
         QVganH73EshthWxDMRVoMdVtb4pmT1r4iFSfMNF/+ajXYf+sYDpNB4vTL+DGEaQAWrbG
         HHQmSaqe5m+FI/NyrzCWJvqPama46FKVL7ywD2XbT98pVkQJO7ye6gi1YP+jt0xBugCt
         0cyY7m4+yBJy0SpzdSWocMBKlcY39xDV6rlWc/WWmd/gfrho9/PF5oGOi7iIPYSiCCZs
         PeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452392; x=1792057192;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DhD2kC+TgI9jVZahgsNkJ3B3BbFkorvXCqZ87mDIfYA=;
        b=odQIRT2gmTxGlNbdRD99psTp8ptwJLcn19R1Mm1eMSKX/f4Tkz7+dXeSNSM22W7l2/
         JxigQvDK2UcC3gEJ95M6vARWutWHmekzJO20QzIanj0Vane1OeVNZ8Y5AujmrPfMZ1fW
         sl7tvp/COjleqZ7FZAPjuopycMMVxcwzgQ+ub0uRxXBU0i0waXbtKQj0ZGqF40ikDHXV
         zhVR8mkfqy3KwkfP9z95LTbkddJcIgDXh/qIH9rNDGaEHR3DGxuuvq0KibAXGMWdOH7L
         HRqj8+Kt5LEtde0Qmi4hKsONkDk4ySY8gCbPbaFh+w7EyYwrMmKuO4c3/QPikhbfQfMa
         eG1w==
X-Forwarded-Encrypted: i=1; AKwUvByvmeyIZqY5uZhlawzJt8h0P/41PCcC3AzY1u+ABIEdkqv/+y45jHNGEtany9fO/gprYeFuLtRVRPbFXc8=@vger.kernel.org
X-Gm-Message-State: AFuF++nUFzqH1R0MDiAaDH8kx7S2MbOzPHlM1jGUYf+DI+L57UxfxhVX
	IFgORUyyQxHBZnogXiKLEw7AGQVcYzi6cI2JRHMKVFTLdwgiVxlE3f5Q
X-Gm-Gg: AYBFou1lG5Eunf16m8QxPQwyipFpv8XTvZa/z6X6l7oA0wk/dfAlQKMUccOt9rNp9Nk
	yUbE2w1lWX8VZNgxcv9QYJfZiMqHFU/1DPM3j9QEJvTWA9l9Yv0p0Oq5Ja7gELYc+Hw9URXgYGi
	Xzs3y7Z89ZYDLSaHi2F0t9OkltwzJsPkJkVH2ErZdKxdKitXu8ihk7vC49W53937I4lQBZNyPll
	Hy5Tk/A0vv68f6jvuiHVaHZumV3j2wXwtHpQ9JiGKxJegFCMZDGLk3Osn7LZ53anQKagOe800bb
	KZ6MEv/Yn0UjOxY18IzQ1Psys1gF7k+k2cizHf2amaPAkD/b+afi5GuKJa5635SbasG1guvZMQS
	CBiNH9Xl+p7jm71WbSx5hVJCQtbyJWms7tfdyKyj/S14NJ2NII5epyLOpb7T5i9RK1o3ILCY50V
	4wgaG6i5PO8TxGNlYfzOJnXxS03GBvqdccnP7Rt8QhSWSv9fIi7p/5B1G0D8HdMv7UWkcZEjkNB
	T+yAWUCmCx0EYyHov+0lBnQ4/W0RjgIQRYezrmdLqI1rbxjI541xgJ8SQuNMtQ=
X-Received: by 2002:a05:7300:7314:b0:34d:96cb:d75e with SMTP id 5a478bee46e88-3515de9ff53mr9040330eec.27.1791452392170;
        Thu, 08 Oct 2026 02:39:52 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3002:e11e:c053:ebcb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm6873252eec.17.2026.10.08.02.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:39:51 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/2] wifi: carl9170: revert broken devres conversions
 for input and hwrng
Date: Thu, 08 Oct 2026 02:39:41 -0700
Message-Id: <20261008-carl9170-reverts-v2-0-3ecb12089797@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1kx2oC/32Nyw6CMBBFf4XM2po+eARX/odh0dYRxgAlbW00h
 H+34N7lSc49d4WAnjDApVjBY6JAbs4gTwXYQc89MrpnBsllzVvFmdV+bEXDWbbRx8CMLY0ytRZ
 aVpBni8cHvY/krftxeJkn2rh3dmOgEJ3/HJ9J7N6ffBKMs4YrZapG1FaU137SNJ6tm6Dbtu0Le
 Fk7ecIAAAA=
X-Change-ID: 20260930-carl9170-reverts-bc4b3b6a1a25
To: Christian Lamparter <chunkeey@googlemail.com>, 
 Kalle Valo <kvalo@kernel.org>
Cc: Christian Lamparter <chunkeey@gmail.com>, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev-e6826

Commits 23de0fa0d2a0 ("carl9170: devres-ing hwrng_register usage") and
87ddb2fc29f1 ("carl9170: devres-ing input_allocate_device") converted
the HWRNG and WPS button input device registrations in carl9170 to
devres attached to the parent struct usb_device (&ar->udev->dev) and
removed explicit unregistration from carl9170_unregister().

In carl9170_usb_disconnect(), the driver calls carl9170_unregister()
followed immediately by carl9170_free(), which frees struct ar9170
inside the interface .disconnect() callback before devres_release_all()
runs. Furthermore, devres on &ar->udev->dev is not released on
interface unbind or registration failure in carl9170_register().
As a result, both the WPS input device (whose input->name and
input->phys point into freed memory) and the embedded struct hwrng
remain registered after struct ar9170 has been freed, leading to
use-after-free bugs.

Revert both commits to restore explicit lifecycle management in
carl9170_unregister().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v2:
- Clarify commit messages to focus on the teardown order in
  carl9170_usb_disconnect() and the error path in carl9170_register()
  rather than request_firmware_nowait().
- Link to v1: https://patch.msgid.link/20260930-carl9170-reverts-v1-0-7033b5716c14@gmail.com

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

