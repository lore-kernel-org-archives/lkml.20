Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02A647D44D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912717; cv=none; b=HNSOATFctasstO499J9IO3mMVouzzzMIKY2t9c0SxkjFGSBYBfvxCNSpxZEZK6vBNvSaf1ODXjPmiX0B/JEZSj6r7jcivj5RpQVROjYxuEjlO1hLkXTRVGcbWatRceIRNOhBOZiLGAqkOmXVQhvn1rqpEyXZOCKRsoYElduyQpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912717; c=relaxed/simple;
	bh=UyzJg1CGrCT6l9BIn9xt70V+4ZaVLdHp7djXGtqNNi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VVTKiVt/zqk2yOkKQM14SSCJ8ySrdRb+mcSFqu0IOYIyC2oR3R/WCJotflJzHTude2gThBvvmiyCqAHsOmg9VOFz3sORdDlNmE34XXKv6N2612S3IWo2ZCSXyLvAjTW6MvKGY4wEUX/5DOGpSur3Usy05DK0T8boRdirvJnRNqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=EljJEzoC; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="EljJEzoC"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so2597748a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791912713; x=1792517513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlswUne+avJ8bwCltZgy3YunaA6SJPVFCYyJDSRlVeQ=;
        b=EljJEzoCt96nWwC89w0iF8i7ACQQ+eGmbtAb00YZNq+44PtVj6C6fB0Z0ozedi3VWc
         1dUxuwrFu4ztzD/d/cLZIYCfZBlvkFOqAjqbUwux+b4wh2XrWXGcMMMN9s8kDsPOTrNw
         Y6hsTm5bwPELlwdm8UItaWzyr3zAXKns0YDcLCl8u6GVFuyIxEyVF4brshQk6yvrTo/D
         K1lvCGnazOETlYPmA2XeVWOndaS6u2PVpw4c/R9kGPzg7ibFTDrru+ApdlRYB6TaU15a
         7dQnqXbe1yrXTEt4DczX8RP6qimJ4UZubqTyK4nNCBWq36lxADFyHTSUaKYSoDlZesh/
         bnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912713; x=1792517513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlswUne+avJ8bwCltZgy3YunaA6SJPVFCYyJDSRlVeQ=;
        b=yJ+T2uHrMINs7w7JPzoNjc17JNeytC51aJrV4MlEkyHuWeAJq1Y4PL15UqqHtOAOjv
         6Lor7qUBrT9sGbkiG6lzspd334Y7JmtTpLA3h2mxrd2JpwRzGxayoSs/vlWAE2d1eYlY
         4sL5lewI6m7+2ipIdu8ZoZlWuSrNWxkuJ5Kvdvg8d7SUxVP4mtxCnl/XTFLIVJT14tqA
         Q0IGDRAiJ63ewqS7M6ZaqnWFkCES85gARFhPzz1Mxr0D13rWGXTmCo2HYuGqW8M8qBOr
         PQ0c8nF5Cux+9EvFyDyeg27qCcERpQdCLYa9lqO5W0OZziYG5eue9dzEBYQ1xiLA3PWS
         ErTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhMQ5V0tq88nCkruhCSVTU1PwuXw+XdwTxdz2HSk7QKqR3K5b44hl/ik8K3BVqqPoC9rFoS6cR736sCoA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZhDkVk5KvdCicYKdeX2OFm1sJ7PJwttWCPur/A/diADLfBwER
	TnK4mzOLsGti4qBslFwGr520W9OiEmskSCBj745HueBVz7Irf6MQHw64fnrQptfctDY=
X-Gm-Gg: AYBFou3wvOlcL0yy1vlPHgtRtUft2wfD8gUWpMeTYPi0LRLVtEILuTvNseLwt8Ifin0
	prllEt9PKDkeQo12p+VWJeHBBpnGpBGF08QRPfK8n+TsKH8hperwGg+y7lzGJFBfGjnsgO9lLM+
	HugGtHsPc5ETR11IbxIudmk1t4Ye4E+m6pNg9t0/+KfgJVMn1S1yIfb4qtDzwlT3T3Na4r5zpk7
	1kpGmJuhNGBshZI3bWVszj9Qo84MNW7W/2XNnlDGYNX4xk4lwtMu86Gwac9RmeyD4VWJW3yFrOx
	lw1331I6KdfHfTR4vXKaoiv8iIVa3mobas+vpGH4h9nlbNuQImts45UdbU/qGkJfRam3QtbETWs
	bbRAGU4Bl3ZZ40Mxfjst6RokPwlOEWFKyVNzzWGFZ3qztkwP8yyvZmXQ9Xk8EhAGOt9GPjjGuYF
	JMvmgu56M/z5Z6uJS/HH6GcfziT04XqZXjtQzmSUPTtJF3znXGJ+vZAH1vOaM773CW8EIaGTNt4
	s9CdIj8XzV/BSGf2l2Q
X-Received: by 2002:a17:90b:5830:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-3ab3acea00dmr11915708a91.61.1791912713219;
        Tue, 13 Oct 2026 10:31:53 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6019ca59sm607396a91.9.2026.10.13.10.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:31:52 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 0/2] scsi: mvumi: bound two firmware-supplied lengths
Date: Wed, 14 Oct 2026 02:31:43 +0900
Message-ID: <20261013173145.3412863-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two places in mvumi trust length/count fields the Marvell UMI firmware
supplies and never check them against the buffers they index.  An event
with the maximum param_count/sense_data_length makes mvumi_show_event()
read past the 512-byte event buffer and into the log; a handshake page
with frame_length >= 256 makes the checksum loop, which uses an unsigned
char counter, spin forever during probe (shorter over-long values read
past the page).  Both date to the driver's introduction.

v2: read the handshake frame_length once into a local and use it for both
    the bound check and the checksum, so an untrusted device cannot change
    it between the two (addresses the double-fetch noted in review);
    1/2 unchanged.

Yehyeong Lee (2):
  scsi: mvumi: bound the per-event parameter and sense dumps
  scsi: mvumi: reject an out-of-range handshake frame length

 drivers/scsi/mvumi.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

