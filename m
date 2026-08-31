Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4EF3AAF6A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172894; cv=none; b=fdyujJEotPyQpg5LM4UtACDp/oJZQDABCvopTeMlWz1FGL/RtQPv1O15v9bf1OqcP7BSJstIVK8zVTXnBijSeHfWanInjK8nbUcF9uw7sl+0mp+8xEKlImasoHmrVNhWZkFOEeusG463RBoT10dPcyWPjeuWxzMi3QIlJsBJFhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172894; c=relaxed/simple;
	bh=n8nAlPzLuNaNzoYNMqWar7mbTNAmC/pl3V6wSXOs3a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UWFuoYArzR+/P3DkqaxFjIkPOy9+kkO4yI+73uRF3OpMcuPv+CXNFjbCPVuDhXl4QBcMab1EDEN2i/2HtFyLLWYNVFV/XWC4TZFcqG8BzzLHBn804bZrt0bgYCkbgrYwdqsfdiIAmpjsbu2xHHbMgl+FQtQQyuLG0A/9eqdHNZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zn5MyVTS; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zn5MyVTS"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2544ff970dso509884466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788172891; x=1788777691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=469VJ7ggqMApdca55dQKF9LKYksJ6nYjofl8G6D7M+A=;
        b=Zn5MyVTSSGtIcOPOJ8yFj4AVz5fFB2LMUnipCoWjQa+r2bmK3Q/gQFn+kyvyiBUdDI
         9Ye4kkMnhOJwUPjxfTxCFNh61OP947vP1hY1mAN+IT9cquAEUQ0/W8NyY+DR2wknPudD
         WR7rV60sQebo5S0Hw1z7bv3ziF6pgRodcx9Nugs7MmCKjy61dcrwHgoRzC7iwZXWgLM3
         GAyPFirHUS+eL7oDkVX8RYdHnL8wrrrJUkkmjXdc3N2xiqpPtJAWk7Jf4F78bMfe/0xp
         wFr09WUqlUP06UfBYq38VACRZ4ufdU+e771Kd14LDeorWwO/HJ+V+Kp2yTrl+bNlQ5e4
         /KUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788172891; x=1788777691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=469VJ7ggqMApdca55dQKF9LKYksJ6nYjofl8G6D7M+A=;
        b=QiDlFlu8MLYqrUT1h2SQ7Yk8rfMpMDN7o5pL+VyEPqLspZuPySJ3Nf7qKu5Gb/xL0l
         cXEECok4/L5luO7Ewlcbb+sLcPdLEwu8pS7KC9Lam7Sodxu0VdRuWYmYitncQs5KdvjX
         Sk8z/KGWhdGoQuNEwnu9D/kj/8w/zHz7Tv0MhhW8McXBfRSqd8uDJiJi7A4m8Huh8sAo
         ErAZsBLy+Wtyh3KSVW9f9U3X++A/7jJG+ZrMmZfqlUT/ggpIscESZZZU99VSEbdXUOY8
         yLINrb54YPOubnnyhJGrw/meJ21y/gTcV82JD+jRnAtrB3Snk/Q1u07umMe+URWrKqT8
         WEfQ==
X-Forwarded-Encrypted: i=1; AHgh+RoySznA5cjersU+4cN0dtgeo5VZaZsvl9BH6/1RC9Y/kjwUEHONDRalErcTfEFptDiGeYlE7e8Xy6l7KPU=@vger.kernel.org
X-Gm-Message-State: AFuF++mLG5AFCZNtrQvoRelKtxY2qbyljh3Iqk5hWnyRzo934UG/mK69
	FStqGFLuLQl+MI+wsc9/i4LQu/OZTF9S/sX+VOrjxDzb/n7VD1cw2o64OATjDpUeOgk=
X-Gm-Gg: AR+sD11DOg0dWjl+LFL5PjXPP0mcdUXUHKdrJeDjVeXJwmkxm1C3ukfET+Q8eMXakFo
	Sci/yusgUF7MKnwvTizK8iR6Cb6gNc+fZoYxKSUqCkHaTY33rz1ZW+E/+ASFjs2AUcgPrPkFuBL
	oYjyhfKYHTbKMN0UHQxPPuLxvjiMkoG1fS7B7L4YfVWH9PFCWK2gHdD59sgyW6Lxz4gAuJLTUCH
	HRKH7REVAmYYzYwwtWE1dljZxIUAI3IJAIa0j+AVTgaT3k81SnHkUUlgHqQnEL8UIrd1qS/TJ34
	QKNbrPPQccVxb4CpAc3gvTLB8/+UJesdNwOCitUsTThu3+KCGgj6tFmLEcosvQZj2Or6IciXc5Z
	OEakOo/0oKvQ5IhpV9nK/o7CdN0/Oc96XVQw7BVYeipD1vUglxcTBKHoiokPfaUigrAS0ZSUOVY
	DCHRTx48UfPnr9ZEiiFOBpFeYs3gHExpXBCmZVvb3BrCFCT+ZaeqpRElc6Zbj/YysvEM04CtFPR
	YjnIVDhUX48QAxBrul+AmkwBnzGVymGLIVneklpUcVtUBWmNLLDjA2WQEWnWAuA84srrL3ShyWb
	Ev/JbHoCrwztWzXB0G5G4355K55E/okYybhLIUbj3RZ7myNWDg97zoyhvC5E5nd2H8LcNT0IH6U
	eplxZQDvYN/06CknwhZixjisMe6AWaxvXIwTDj8YeBTvIymhRE8V6S6F9NJsNVA584hGqX0Xawv
	idKjz5amYASzHpLC0qZUIQZnCuhwod1kOidmu+cfOe5jBtsjhhxBfGf69TZEz79U68JkAD3q/sK
	fHGugIJOsuVlw==
X-Received: by 2002:a17:907:980e:b0:c20:f529:2d6a with SMTP id a640c23a62f3a-c255721317amr1543011366b.22.1788172890441;
        Mon, 31 Aug 2026 03:41:30 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (230.182.6.34.bc.googleusercontent.com. [34.6.182.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1facbcsm407675466b.44.2026.08.31.03.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:41:30 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com
Subject: [PATCH] nfc: nfcmrvl: fix null pointer dereference in nfcmrvl_bulk_complete
Date: Mon, 31 Aug 2026 10:41:10 +0000
Message-ID: <20260831104110.1307-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A race condition in the current implementation can cause a null pointer
dereference. When nfcmrvl_nci_register_dev() calls nci_register_device(),
the NCI device is immediately exposed to userspace. If userspace brings
up the device before probe() finishes assigning drv_data->priv,
submitted bulk URBs can complete while priv is still NULL.

Additionally, nfcmrvl_bulk_complete() incorrectly checked
NFCMRVL_NCI_RUNNING on drv_data->flags instead of drv_data->priv->flags.

Fix this by adding a NULL check and testing NFCMRVL_NCI_RUNNING on
drv_data->priv->flags before processing the completed URB.

Fixes: f26e30cc6b50 ("NFC: nfcmrvl: Initial commit for Marvell NFC driver")
Reported-by: syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=59d5e6a8ed04e6a000c8
Tested-by: syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/nfc/nfcmrvl/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index c7f2afe00b93..c22d783718fe 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -61,7 +61,7 @@ static void nfcmrvl_bulk_complete(struct urb *urb)
 	dev_dbg(&drv_data->udev->dev, "urb %p status %d count %d\n",
 		urb, urb->status, urb->actual_length);
 
-	if (!test_bit(NFCMRVL_NCI_RUNNING, &drv_data->flags))
+	if (!drv_data->priv || !test_bit(NFCMRVL_NCI_RUNNING, &drv_data->priv->flags))
 		return;
 
 	if (!urb->status) {
-- 
2.47.3

