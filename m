Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54AF4F55BD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794082; cv=none; b=UBcB2Ca9cO0gPw0emv2iUfVngtPhItxPU8Ph21qX0+4LOS8V8Ur2i7rzPfRTDjpNHzzRAwnNTCEEdMF4oG+wTUD/yCiD3dGDyxgORYonI4L3R3TLFEq+YTwuTuQA699SisW5MBRsnRGelZ484tNDKq7xSYLxqXPpGfU3K23rFzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794082; c=relaxed/simple;
	bh=mNjpd1tQwWKdzKUEeAZaOMlQ8clRHjCrzGoa5fQ5e0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GZ11SiSh0lBlXdhZJU/6kVWIXH3Xkl1Sq/JBix9D6Zah1VTayYc6RCMPW4LwmvPtNEXifBDMLOzQBUrHlAErAEzDkXbPHxkqXqMkgxbh5eN+NRVLYwvrlcz3S9+zxl0ReGWhUoWJqpRTu0UaBYzEwxbzvKIA2mdtYt+3yH0uC0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YV+b6MbT; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YV+b6MbT"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97e96666dd6so2209734241.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788794079; x=1789398879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W9HwXQlNGS9bLvO1Kv0B3vOGIHhTJMb9BOvcgiHRmOU=;
        b=YV+b6MbTdU9we3rDFifWyokV2UArQSoXeTUTrP/4pcbgkrBxwpkzTLrRsF9e9wIg0h
         T7pffIMDm1TEv2IzMTbzbzlORyx1OURjcLi9S/8gJ30XJ5uXDYBq6XzrU+9l+dVHPEfs
         LxwYnjxrUQ3WwLVu4T/lbYMnCfgST6DNXDLjNaYrLEhJZKET0tmOb1GtLJFHKmTGpPyA
         mO2JZPz29+ToEroXDaA95Y8MDcLoOYWgnIb01HVgG6MZeYVP30XVPnRa2HFzZTkFK5H4
         WheiyG8uhDXcifr2pcbv9blNGtwqVUXAT8nenpbF1V7TJPF27lfcmlZcGCIdAvM8eF6o
         KnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794079; x=1789398879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W9HwXQlNGS9bLvO1Kv0B3vOGIHhTJMb9BOvcgiHRmOU=;
        b=lSCExZSqr57F0BoBAhkCxxm8NFq/jzAYL94i1q58J0kFUkTchkM3khBaMU3twDAFk8
         kb8GmL8s8txPDBhzVDUH0mG2KEqBak4N1oyE9eJ1NgNh8xnq59g5d4nV16CLR/gfCYqG
         QE43OyNF0SLsLDXvtxmtieZSsHTIgH9YAVuo981vdK8JNrmXEICjYPLYBLzikODD85zH
         X/VsFZjzVMGeg1OT2GzmU5GDoSmHQlXinPHTxXRvV4bkjUCaMEm6nuiixWkaz5isi3L1
         Rw81SETZhDnbh+uWMxrPeX2LvEMUpfLzjNnnMZRuLJhDI/JxjvaGLQj7MdlDcahecjeb
         3iuA==
X-Forwarded-Encrypted: i=1; AKwUvBzuPI+GRgdjvTr4i5t54MbOoldbtUa86y6sxA9Qxxv29mKu6kkgurmcRenpQQwYDvhlraU3a5jUUecEZMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lVNIFOkiqICVxrCcTvB4roBO0gnN84otPYaUI7VkDdlvPhU2MV
	d1+oKVNXwPa4qJQK6F4bbsusCiA9bIXx5H9B4oTNmUFzcOoqbKse554z
X-Gm-Gg: AYBFou3dTeJuDaYgw0qh4vSV8t/JsAVRxSkhloON6lE+UBtLLP+4qg92Fuz/dNEpSgj
	nRKkxAAn/yakMVDv59bGXE66a5KK1q3jQJVCdYf7ZDEpLOq8W+IWVCLd9oVW1q7ufwbaVkDtx3b
	bkimO8tyYe+wh0snnHfCmBvj0OnIv9ByR2fila/FBKspspZOmp0aTusX+zZlZ5avCU8BsRy/kHc
	M1ZFdztzs7WUkwu0u0Eb8qCXc+M99xfJDGDXxhK6+nJmigoFh5e7fFwOwPEH15Xy1Xh3pYkSTgd
	CscR+5bqJL5tvIaHe86yHUe/Lyx7dPlDP7+cQQuQecA1fMZ4rF9wt5h06/gzio+XkyP7Mx/cVrW
	PdhcpA1TajC23dy+IJdfX9nLvp2Pho+Iw6/WDVeSHkmXjbztTPL1gM+Vojv24pT9MNhJ+tN4etl
	0TsUNHzBN4hw9wPoh+H3a/nRSeMdKh1uWo9jz6Kj0IzD2M3k84GDJbNyME2MbcVOQ=
X-Received: by 2002:a05:6102:80a9:b0:786:4822:308f with SMTP id ada2fe7eead31-78a4a9aea5fmr9223898137.13.1788794079271;
        Mon, 07 Sep 2026 08:14:39 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-980d774ad5dsm607088241.9.2026.09.07.08.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:14:38 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>,
	syzbot+f312381a95cc080992fd@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] mmc: vub300: fix use-after-free in vub300 teardown
Date: Mon,  7 Sep 2026 12:14:28 -0300
Message-ID: <20260907151428.643841-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not dereference mmc/vub300/udev after the final kref_put, because
it can release them via mmc_free_host()/usb_put_dev().

Fixes: 8f4d20a71022 ("mmc: vub300: fix use-after-free on disconnect")
Reported-by: syzbot+f312381a95cc080992fd@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=f312381a95cc080992fd
Cc: stable@vger.kernel.org
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/mmc/host/vub300.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index 2dae474dcd06..a1a6aa1aafdb 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -370,13 +370,14 @@ static void vub300_delete(struct kref *kref)
 {				/* kref callback - softirq */
 	struct vub300_mmc_host *vub300 = kref_to_vub300_mmc_host(kref);
 	struct mmc_host *mmc = vub300->mmc;
+	struct usb_device *udev = vub300->udev;
 
 	usb_free_urb(vub300->command_out_urb);
 	vub300->command_out_urb = NULL;
 	usb_free_urb(vub300->command_res_urb);
 	vub300->command_res_urb = NULL;
-	usb_put_dev(vub300->udev);
 	mmc_free_host(mmc);
+	usb_put_dev(udev);
 	/*
 	 * and hence also frees vub300
 	 * which is contained at the end of struct mmc
@@ -1794,8 +1795,8 @@ static void vub300_cmndwork_thread(struct work_struct *work)
 			construct_request_response(vub300, cmd);
 			vub300->resp_len = 0;
 			mutex_unlock(&vub300->cmd_mutex);
-			kref_put(&vub300->kref, vub300_delete);
 			mmc_request_done(vub300->mmc, req);
+			kref_put(&vub300->kref, vub300_delete);
 			return;
 		}
 	}
@@ -1946,8 +1947,8 @@ static void vub300_mmc_request(struct mmc_host *mmc, struct mmc_request *req)
 		    satisfy_request_from_offloaded_data(vub300, cmd)) {
 			cmd->error = 0;
 			mutex_unlock(&vub300->cmd_mutex);
-			kref_put(&vub300->kref, vub300_delete);
 			mmc_request_done(mmc, req);
+			kref_put(&vub300->kref, vub300_delete);
 			return;
 		} else {
 			vub300->cmd = cmd;
-- 
2.51.0

