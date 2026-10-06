Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E06141A575
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291009; cv=none; b=XsFXwPlAW2m8fBqEjgVgspQi8bRpBROJ04RK/GJyJL0r/eE7ZFULB3UIBjpdcdFj32mrSU55SCKDPH1iIEqJp2DjAziHhtT6Zzt+ZZypXmXJb66M84+hDXuKqvvxvohg6FSF9mjIdDzEGrWZa/V2exn4peXWp0GRladFHfvykF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291009; c=relaxed/simple;
	bh=Yj0CJu0cTezFzA494Z/lD76Pdm3vlF6yfr0DbWTWl6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E9g3+8q6Hi1UT5xiroD9zyQ7fqQxSjPCu9tX3Q3GduC0IYyDyxnljArSd/gEE75ypz1uffZ/3dPmVseOMd8WGwRue5bsEdF5jcu6gdSZ1UeMoqscp4/YaQmwL2VDkI0yl740bcdXTxp8QZTemiB0WbYRYyF+Uq3pqpK6wHht0PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/iOCMVr; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/iOCMVr"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398a5aad413so2154053a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791290995; x=1791895795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1m5R0v4bzaEG9q5h5fbCPMd2vUE3+sYABtiEkaFp90=;
        b=g/iOCMVryz3LrPesTT9tCh+a/fhgUf0rIDZqgGiIZeNIeODMLnL5oHA3sRxHvx/PCo
         83kJV1pAxq+EiArv10ek2XnPQdWnc7pwvH/LW0RIMj/sV283V3YNRlRyfrNMEZ795iLT
         8fxquAbkV9YtX2lZWFnTkhk6AXgL72bvLz/qnd3Vvnhx1f82DKBckqC50zl8YjtpW5XQ
         XB2hohhdoieBMBcM7oTQeV2xpAMI+MXstU15dP3KSoHpy4+9J/qhnTF1BtKTsauprcIX
         XYjk0wYJEShUJB6Cb8LZ4GzFd46aFt53PTeA89jrcEN64G5cgx+qNNPVSNnjjgJx2no6
         DlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791290995; x=1791895795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1m5R0v4bzaEG9q5h5fbCPMd2vUE3+sYABtiEkaFp90=;
        b=ONDc0r9GYB1JzL2Us06hoL8czIs73n2EJB9n+waaXgvbOjfMm8FQqtLEdzsqr3NI+3
         03H2348nNQOrZdXbBWyCGskJmKoqDvvVQnDJ+0z408Q/dqOCUMdzXQbqOJbiJLZIbLem
         5EOLtfMYdnfqIASSZctanZTKlD3X1nONcWV9Hk9xtiL4Plle1bKBHv2oemnUum7H2ufe
         FlaQxBjUiFOVD7gLrhOiF/ebHpyTRMQpKZb6JWRLzog0+h1asj095lAVB7eqEnBs0BuI
         /XIilUGCi9AqQnrF7ZRZa0F3+zo2SggwTr/fgM3UaMqzzro/uTazutbyEfJ+NGRVxQyu
         Kdiw==
X-Forwarded-Encrypted: i=1; AKwUvBwvrr37Exr1NnhDBDVbOGKiwAXJT5Q4Tz0n7UJ4zD1QMPcp3F8ffQOXrP5n+KYWlz1oJpCHpQCJQjCWMZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmAHMxBn45tmDfoeMGcglDzaBDcsLQPksA9T+hsNI1ojovu19W
	Qoef2jVVovzuKojJMyU0tdqccTavMfCosm0jp6uemAneaESGABwHLnhQ
X-Gm-Gg: AYBFou3Nc+IFzdw7ggVLjMOsl4I1ylK2d3wP1Il/h3VYSOLfMtugpGc+7tGUPBc2McU
	8kHPxolAHH2WiSW+gbQXTdHlESHDwS2Eh3ehSDKtu8i9UGBGmWQ9KHTFrI9luDcEm8GRu5bQ7vK
	OxKHqWcWxfXK5kFQf6Z+sueJsljd6tFMHtxP9FQ3ec2wlD2u1lzn7giglq+9vmF5lLIWD2y865q
	t2qOCVA99M9fy+/Xqi/r3I2jKSC7+Ipb7B+Qb2Sjmc75zuXmcPQ+jlTczI5iuM8Pc4hTxZEKARx
	fbniMOce+oTaTlXJUzxK2JeYCetUXwy/EWJn1lyLm8AbUrffnqkeqTicLomf6gli9gJctgD4QB/
	LvMnFy9o55wXCM7Fqg62yOsRIG2mbHCSdaglTkZhoh7Jf0RvVh+Q4hnI7IWBQNHWTsVXi8qoJVQ
	JzKrmu9RCW3wGCSQQ1kwA0lW5KouK1l83mZHLFMMtRvkjfqTf9sfa6YouMPMiUkn3jnoiaM88rS
	oonBZZyjUtLIu/G3A==
X-Received: by 2002:a17:90a:4cc7:b0:3a7:b260:9ced with SMTP id 98e67ed59e1d1-3a7b260a03bmr4414827a91.58.1791290994945;
        Tue, 06 Oct 2026 05:49:54 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([2401:4900:900c:ec20:d139:f8fd:7043:7eb2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85d51825dsm3875556a91.12.2026.10.06.05.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:49:54 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+c6d8091b47243f2023b8@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] mmc: vub300: complete the pending request when the device is gone
Date: Tue,  6 Oct 2026 18:19:38 +0530
Message-ID: <20261006124938.1861-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vub300_mmc_request() hands the request to vub300_cmndwork_thread() and
returns; the work is what eventually calls mmc_request_done().  But if
vub300_disconnect() has cleared vub300->interface by the time the work
runs, the work just drops its reference and returns, and the request
is never completed.

The MMC core waits for it with no timeout, and vub300_disconnect() then
waits for the core: mmc_remove_host() cancels mmc_rescan(), which is
the one stuck on the request.  syzbot hits this as two hung tasks:

  INFO: task kworker/1:2:984 blocked for more than 143 seconds.
  Workqueue: events_freezable mmc_rescan
   mmc_wait_for_req_done+0xcd/0x3d0 drivers/mmc/core/core.c:408
   mmc_wait_for_cmd+0x154/0x200 drivers/mmc/core/core.c:645
   mmc_app_cmd+0x170/0x340 drivers/mmc/core/sd_ops.c:64
   ...
   mmc_attach_sd+0xb8/0x3d0 drivers/mmc/core/sd.c:1854
   mmc_rescan+0xcd5/0x11c0 drivers/mmc/core/core.c:2316
  INFO: task kworker/0:5:5709 blocked for more than 143 seconds.
  Workqueue: usb_hub_wq hub_event
   cancel_delayed_work_sync+0xd1/0xf0 kernel/workqueue.c:4642
   mmc_stop_host+0xe9/0x400 drivers/mmc/core/core.c:2373
   mmc_remove_host+0x15/0x60 drivers/mmc/core/host.c:681
   vub300_disconnect+0x12d/0x170 drivers/mmc/host/vub300.c:2387

Fail the request with -ESHUTDOWN in that case, as vub300_mmc_request()
already does when it sees the interface gone before queueing the work.

Fixes: 88095e7b473a ("mmc: Add new VUB300 USB-to-SD/SDIO/MMC driver")
Reported-by: syzbot+c6d8091b47243f2023b8@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
Built with W=1 only; not runtime-tested.

 drivers/mmc/host/vub300.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index 2dae474dcd06..01fa7f9e9659 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -1739,6 +1739,16 @@ static void vub300_cmndwork_thread(struct work_struct *work)
 	struct vub300_mmc_host *vub300 =
 		container_of(work, struct vub300_mmc_host, cmndwork);
 	if (!vub300->interface) {
+		struct mmc_request *req = vub300->req;
+
+		/* the core waits for this request, so finish it */
+		if (req) {
+			vub300->req = NULL;
+			vub300->cmd = NULL;
+			vub300->data = NULL;
+			req->cmd->error = -ESHUTDOWN;
+			mmc_request_done(vub300->mmc, req);
+		}
 		kref_put(&vub300->kref, vub300_delete);
 		return;
 	} else {
-- 
2.55.0.windows.5

