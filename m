Received: from mx0b-00256a01.pphosted.com (mx0b-00256a01.pphosted.com [67.231.153.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FE42BE656
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790642756; cv=none; b=XspR7B/xSZ5YyCUbDrggzNM14SEllBERDZAVG00cymzl0GHYOjaY7Z+AzQ1SOXWtpMnYH3U1Qmcxgn487ZJOrEQm6rpRfPqIos7NjsmdQFksAWQLPa7BS7AYwda0eWa8bd/uTUNv+pT0mOKVYp/uJJ3q1VsRLJKFXvU5baO6kKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790642756; c=relaxed/simple;
	bh=Sc6B/LNjsW2P4eo1apjanbcfJFhHR1I9fnaSFJ77sbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KdXOB9znRhXzH28DklnQd4LQl5PqQ6pg0lWv5w3uRtJwH8wlvPfvPaGjbi9x8FXf01hBnZcd6eVAh/ILS9H25vpeG9ostXC3r/vq3z5q0hJk3EGBqDFVzhFHLKudH7nxsofWiIOJBc6FduIOT2HZTT1dQAQsPrT+9HYCHyp2MeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu; spf=pass smtp.mailfrom=nyu.edu; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=poJoXiiP; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=L+CpYa3J; arc=none smtp.client-ip=67.231.153.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="poJoXiiP";
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="L+CpYa3J"
Received: from pps.filterd (m0119691.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SLfLsw2400835
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=20180315; bh=Y5kiEK+5yijCN+GrhEmUOii6QxUi1ESRYSOq
	TD/Fb60=; b=poJoXiiPqy+J/el0cYDyqK8Ze2Cum7LNM4/g7VG7bXAp0Yr1hxi7
	c8D8EncRNEIusvz2X23KFc7NGNgCIQX+zvlC5WKZaqvI3tbva7GlsncBz/ea9L7Q
	UBt2Sh99RRdhPsoSfyRACCSh8be0r8wLHbcB2DCTK8tXrE1OwKGSVLkf31URCxH4
	wCkZ6ewkaR1IITHFKnmEd8szTbfrnGIZM0hnV5dTGEzWwODX1z1LmU7TmqPm/dxQ
	NtXj5025iY+gFtD37sQ8IyV+IEnb+au6vInEdI9KDzst00rVs2C8g1mceBlUYn1H
	imi+EZb9P+cucHiKg6iTDP9BCSV8T3hM0Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4h00ccst7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:19:19 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91789a9107fso2506996d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1790641159; x=1791245959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5kiEK+5yijCN+GrhEmUOii6QxUi1ESRYSOqTD/Fb60=;
        b=L+CpYa3JiDfksyp6gdoHqeA53Y6qqWGZ0ciHegEmuLi1wbyUcONEv3urexHEPBn8jU
         h4O5bp9e3a9JYwsxLTc+vFPvD2eOK0ylf3QBAVj3lOvk6u2I88izMrHzq/T0pGiT3Jhz
         DvvhP834LLUDVefhxxSkX3u8cRRebhfdQYp+yix9yYXLv3moHMTfjf1PJUXHbHi+DOjQ
         tdeP95Z0OP9d2Cb+wV4cBw2tqB/KYH8+mVlVeg5vPoYqu5H5kSetmldMZFSCiBreOIkZ
         CMDfS1Fs/aJouhlEX/MMNMcLwMiaRYRhheRwNQqo3tg482Ia+nFycEVWRyT1nkmfU6aW
         TMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790641159; x=1791245959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5kiEK+5yijCN+GrhEmUOii6QxUi1ESRYSOqTD/Fb60=;
        b=ZG62hi0NCmWiiWlD8qDrAdwnBT3caoDs4X2EDJ2aHOuiVzTZOLft9DXLS/9YfWUX2F
         gmAI9jgOF8jla5dTzqVlT79DA/dkkFhXo1XEJ/nAV71j+30ksIk9tu4amPxHuOVaS8iS
         2keu72liZaKY6ZCrQMbW8HfNBhNZSqJEdWbBSTh2GHlMky3dsdJ8RRTN1YGfrDkifxKh
         E0qz//SbqBerXMiRJJ6ARHUm12X01VWaasehKkH1kOsZ/a9j9EXUaUfdHYnOJ0aPW1xK
         DvzgEDOFZKKiEKybsvt11sez0UdCEmxVLBTHSzmF0yxLUc1Ar3OQe8YXZlIDOkoqv9Mk
         IdMg==
X-Forwarded-Encrypted: i=1; AKwUvByQTQL8K+KhkksYK0M7BD0vYmk3om5ethyQzNr75LflOiiHDngop4TrrBlQBiJaeFVi1mKzTkXIcHIJG+M=@vger.kernel.org
X-Gm-Message-State: AFuF++nbyY3rLbTfBRHVaEdrPyhzLUUeH1fDeNrSDp0vIBeyirj15+jx
	6W1KollMixDt5yZ08N7UvwCJ47ruPoDmFNb0DMPWLqjE1BvsuWoSsr98f6THMkrUpGz/3abp1Pw
	/KctwIXmL8Dvu7ObRSVCW8PdT6T1rS9EoBZS1gk1HlnmjmblcafeVoaCykTo+4GKMMUrfhjsw8M
	2H
X-Gm-Gg: AYBFou3tPqmlpUUb0f85QtBmVri671/RFN1uSloJDf6VEqVGiwp9tzRfLCleOc0GEwf
	+nlbpw0lii+SZay/eWXlLzjguxHtJJkI6K5BCE62usRzeyw2VqXXTF35TXRQeu2fEQ4BZmthny5
	NHHmezTa1w3GV7nTJ2Btz7D+8spNzuPclGXXP4g8zTKTyBF5282rwL3ivuaJr9z7KzuwsZgcEGP
	r3ED/4/lhOTXA6DrAbS2z0j0UJAPzJOG1tCQux6GtxwroGLmkEWMympfpxXYtZXheaq7PUSCNJy
	IKQ5XO2RMbuxNFF5tzPnrWhP3D0E0w0+rPJk6vF139O4EOd+XmDNES894v00VyTr958uAGr6wVM
	BfS+LYmyW0Z0oGnZ3FwolVg/q8pZUGRjYVgQ=
X-Received: by 2002:a05:620a:6c0d:b0:939:de6c:cb45 with SMTP id af79cd13be357-93c43d159a1mr2514689785a.47.1790641159263;
        Mon, 28 Sep 2026 17:19:19 -0700 (PDT)
X-Received: by 2002:a05:620a:6c0d:b0:939:de6c:cb45 with SMTP id af79cd13be357-93c43d159a1mr2514686685a.47.1790641158775;
        Mon, 28 Sep 2026 17:19:18 -0700 (PDT)
Received: from jerrythepro.nyu.edu (216-165-95-162.natpool.nyu.edu. [216.165.95.162])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c813fee09sm270338085a.24.2026.09.28.17.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:19:18 -0700 (PDT)
From: kj2864@nyu.edu
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        co+6a04efcebe0fc0ce@bugs.sh, Kaho Jiang <kj2864@nyu.edu>,
        stable@vger.kernel.org
Subject: [PATCH] media: em28xx: fix double free in em28xx_alloc_urbs
Date: Mon, 28 Sep 2026 20:19:04 -0400
Message-ID: <20260929001903.158767-2-kj2864@nyu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAwMCBTYWx0ZWRfX8/sMHUBE3A91
 23SC1ltQMHTi2ejPVAOVpDRCD0wp46o1c/iDRj0UO2nZe6QrtaJLxHqC0OIZnTSHKOZhW5yWrYX
 YLk675nOMfkVoKqVLXU4N8XK8YOBHRHVfqw6OH13CDrVjcrj/Djb3lBa5P7onl8Snod1Vk6HdMd
 gPHEWCUt9iwQyZmjBIzaG/gz83e3jWyF+xbHrui3xOxM0sfF8Npb3A7186pQpCZgQ481z2zIb/e
 4OKaRcsljubQwQCmmTrkLuWvBpvCRTL+KYBka2l6aVtlWY91eNPQLDT63mZTWdNuiPNyAluc+O6
 PwVbPetvzyPiPTy0zc9baWQUcnoLuTPELgrF5ayaW0NqdVHghjKeUoSN+fqzk7zyadKvwTksocM
 DvRljCAT2N7ih1ddfOpSFtdJxZMKYfOWcn1tjCSqFjlnRyu87/LELh/zNH7sH6PvmIik3PSmivh
 sCHj20yiNdRiHMMSxlA==
X-Authority-Analysis: v=2.4 cv=OYMNnRTY c=1 sm=1 tr=0 ts=6abb0408 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=QttKoHjxDjZciDcJ6FphuQ==:17
 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Se5WoFf3ZZRiLcel0nel:22 a=tr4woWNwjDflhTIOjkZU:22
 a=VwQbUJbxAAAA:8 a=kj-zqgMp3CcBJFKlVqoA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: rGCUjCLt7vKqyPsIPnwJycO9rfg42SLH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAwMCBTYWx0ZWRfX6h1Urvw0sFsi
 1iTtk4Me7BOz5FLGsqy3NzHfK4SugFX6emyqvwfhAMffpgmRTdQiEO8sARK35XaXxFS/FEqE1ej
 frQAqtkN/+NBzjx6kLArsJ1UTt+Garc=
X-Proofpoint-ORIG-GUID: rGCUjCLt7vKqyPsIPnwJycO9rfg42SLH
X-Orig-IP: 209.85.219.69
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 spamscore=0 clxscore=1011 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290000

From: Kaho Jiang <kj2864@nyu.edu>

When allocation of usb_bufs->buf[i] fails, em28xx_alloc_urbs()
explicitly frees all items within usb_bufs->buf before calling
em28xx_uninit_usb_xfer(), which also frees these items, causing them to be
freed twice.

BUG: KASAN: double-free in usb_free_urb.part.0 (drivers/usb/core/urb.c:25 ./include/linux/kref.h:65 drivers/usb/core/urb.c:96)
Free of addr ffff88802fd37c00 by task kworker/1:2/1182
Workqueue: events request_module_async
Call Trace:
  kasan_report_invalid_free (mm/kasan/report.c:557)
  check_slab_allocation (mm/kasan/common.c:235)
  kfree (./include/linux/kasan.h:199 (discriminator 1) mm/slub.c:2693 (discriminator 1) mm/slub.c:6508 (discriminator 1) mm/slub.c:6801 (discriminator 1))
  usb_free_urb.part.0 (drivers/usb/core/urb.c:25 ./include/linux/kref.h:65 drivers/usb/core/urb.c:96)
  usb_free_urb (drivers/usb/core/urb.c:95)
  em28xx_uninit_usb_xfer (drivers/media/usb/em28xx/em28xx-core.c:964)
  em28xx_alloc_urbs (drivers/media/usb/em28xx/em28xx-core.c:1076)
  em28xx_dvb_init (drivers/media/usb/em28xx/em28xx-dvb.c:1734 drivers/media/usb/em28xx/em28xx-dvb.c:1698)
  em28xx_init_extension (drivers/media/usb/em28xx/em28xx-core.c:1248)
  request_module_async (drivers/media/usb/em28xx/em28xx-cards.c:3685)
  process_one_work (kernel/workqueue.c:3396)
  worker_thread (kernel/workqueue.c:3479 kernel/workqueue.c:3560)
  kthread (kernel/kthread.c:436)
  ret_from_fork (arch/x86/kernel/process.c:158)
  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
  Allocated by task 1182:
  kasan_save_stack (mm/kasan/common.c:57)
  kasan_save_track (mm/kasan/common.c:78)
  __kasan_kmalloc (mm/kasan/common.c:398 mm/kasan/common.c:415)
  __kmalloc_noprof (./include/linux/kasan.h:263 mm/slub.c:5414 mm/slub.c:5439)
  em28xx_alloc_urbs (./include/linux/slab.h:995 ./include/linux/slab.h:1312 drivers/media/usb/em28xx/em28xx-core.c:1081)
  em28xx_dvb_init (drivers/media/usb/em28xx/em28xx-dvb.c:1734 drivers/media/usb/em28xx/em28xx-dvb.c:1698)
  em28xx_init_extension (drivers/media/usb/em28xx/em28xx-core.c:1248)
  request_module_async (drivers/media/usb/em28xx/em28xx-cards.c:3685)
  process_one_work (kernel/workqueue.c:3396)
  worker_thread (kernel/workqueue.c:3479 kernel/workqueue.c:3560)
  kthread (kernel/kthread.c:436)
  ret_from_fork (arch/x86/kernel/process.c:158)
  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
  Freed by task 1182:
  kasan_save_stack (mm/kasan/common.c:57)
  kasan_save_track (mm/kasan/common.c:78)
  kasan_save_free_info (mm/kasan/generic.c:584)
  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
  kfree (./include/linux/kasan.h:235 mm/slub.c:2748 mm/slub.c:6508 mm/slub.c:6801)
  em28xx_alloc_urbs (drivers/media/usb/em28xx/em28xx-core.c:1084)
  em28xx_dvb_init (drivers/media/usb/em28xx/em28xx-dvb.c:1734 drivers/media/usb/em28xx/em28xx-dvb.c:1698)
  em28xx_init_extension (drivers/media/usb/em28xx/em28xx-core.c:1248)
  request_module_async (drivers/media/usb/em28xx/em28xx-cards.c:3685)
  process_one_work (kernel/workqueue.c:3396)
  worker_thread (kernel/workqueue.c:3479 kernel/workqueue.c:3560)
  kthread (kernel/kthread.c:436)
  ret_from_fork (arch/x86/kernel/process.c:158)
  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)

Remove the explicit cleanup loop and let em28xx_uninit_usb_xfer()
handle the cleanup.

Fixes: d571b592c6206 ("media: em28xx: don't use coherent buffer for DMA transfers")
Cc: stable@vger.kernel.org
Reported-by: co+6a04efcebe0fc0ce@bugs.sh
Assisted-by: LLM
Signed-off-by: Kaho Jiang <kj2864@nyu.edu>
---
 drivers/media/usb/em28xx/em28xx-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 5bbb082dbed9..86c74c55908c 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -1080,9 +1080,6 @@ int em28xx_alloc_urbs(struct em28xx *dev, enum em28xx_mode mode, int xfer_bulk,
 
 		usb_bufs->buf[i] = kzalloc(sb_size, GFP_KERNEL);
 		if (!usb_bufs->buf[i]) {
-			for (i--; i >= 0; i--)
-				kfree(usb_bufs->buf[i]);
-
 			em28xx_uninit_usb_xfer(dev, mode);
 			return -ENOMEM;
 		}
-- 
2.43.0

