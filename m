Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BB5566C75
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882317; cv=none; b=KkE4NsTxHUxsJfEYtlj1rBaInTRMMeQvPUMBOpUmpLYWU69A7xH7+YalqEel/y72MqblCC+QcRvDbAUIgL1sgMVVjCYOLyA8OYi/2KFj4KGxjyb1Lqj7OWtBRbRCuhdFiLuJShChCFVSDv5KXhw8E8G7CDPtCY2Wpe6O+pasilg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882317; c=relaxed/simple;
	bh=UM1MBT/BJUGhWApI+IfB2Mek7UMuH86ncQOmZxWBn1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=btStwaJ4dicO+lAfDZXWo18Zid8l89WgOsNvB+EEVdLpWlSd0ds8goqAQP+oIWa3BLwNwfwxkpwSbYPxfwpBZJ290WBtjLLV4zf5I2x5U9iOG+eg7C4vpDDIn73+oorhG2aewejE08a+bhIiq65Ks81aYN7Wd0ck0fDXe5bLtSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8e/7D2B; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8e/7D2B"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-86d43cdee51so58403977b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788882313; x=1789487113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WekuzezNfimNZjny0pBl2QWRYC2pvuksOZKhLQ04/po=;
        b=G8e/7D2BAZJ7ZbwPsft1SkfkTeI8xHXImohFWugrsoy/dUC6EFUuGCiwWexcPYwhh3
         kq49Ysul0LRMmXUTiRBdcIBfBjvVh3ghL1SkVIWOzsXAQeheTgeQYuT4qP1s++8bjVNi
         ACxlXd6Fjgx1K7hQubUMDwnlD7bi7B7TXjYwWYztTjJfYYw3z6wnPZLR9s60O2XZHlgm
         nV2r5OU8hu818/ITiUcVDs1SH3k3zkGUwvLrme0oNtQHu8Vq7Ufl+CJEZ4bVVxFEMa7V
         ozbEktrIwMkniMON2R8UHa+4qvtlQG0lTCnCTwUVTLB43KwBgqAHiu8qWywO88JAcpa9
         toYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882313; x=1789487113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WekuzezNfimNZjny0pBl2QWRYC2pvuksOZKhLQ04/po=;
        b=pUW1doS9uZsZ3EvMMiNCTbGo/9PKxarQbky7n0N9h8GsLdwT/aG70imprpiLGK8StR
         7yybfYLBArmHG92EYlwTkloLTaFTlnumB8DU6r1OpPJjxba6RJHl4MGBHRq2clXRGZnN
         jFR8NZhZChNLsPwKLp7+E0B2qIIwsbSC0AgcAPkpuyYyG4QOoc5KRncyrXn2rSkKIc9J
         Nt6uKBDkTKu6JzaBZIFWw5luLotkH51HOg5JSUA8tfQNElwZzQ/cHJFFDHuJ0E7uJQwu
         WXto8tYem2XXnK/eXRgECUwH+3JtT38HoI1/WhpP8rtRkP1x7f2e0Ezrt5obf8q5/Qzl
         jYQQ==
X-Forwarded-Encrypted: i=1; AKwUvBy195ypyo/6yKzmE3zjebgJ9lEcSnrGa2EA04gD93RvXJY+YHDB+Gt2WVXSOQVjICs2M+45Qc7dNhh+fWI=@vger.kernel.org
X-Gm-Message-State: AFuF++mQXDJp8QQka81tATZas5crlgufYRbhnMfJiMN7bAD967ph763R
	X9qcAJZHC02SFtTcJfxc41tOirrFwwaNzawklqw/vzCU/G6d1MoWUPZz
X-Gm-Gg: AYBFou1UY1+uqaveR3MRmh7b3ecFqgq1A80l5M0E/4NVfoYKIOherQB/RV8SwDlX+WV
	7mpZTEBmhWAMgjyMtOhLlDl30QbHSOjOlgZFaTqVUtRYNp5lyTmDem2CTSbTyJqE5aEJM6/nmwJ
	LGWUXWNjZl/iJPdppkF06d1P0UeOyu+RXiIbvYTjmyOsBAYgPauNjXcawwoaVlz2yfT+fa9Tg0X
	zUPmF7vDbEbkSgV0TIK88XS4ciMrCF11in+XUq7fvs3F7gul3OZuP+6RmXip+XNSCx0oCKJp60i
	MppTF21qlAdvuWKBzfvnxXQ2Yrp9SMWq9PKk3sBTZAduJus/FE+k+Eq/Se+WVQlWB8sJrU+enac
	Z9NkRp2tRkGlHPM8WDLGOFaN/F7M0OtqAGBN9iyAMTlMcfxupFVQfczJVoGsVVCi0TC15nUe6aC
	bAInYVC3Sqrz08GFfhg7Dr5eV69OFFiUL6lGHLBSIgVDBtgJj3axHjvg9VeJyoLbvweGYzUYw8b
	LKmqx+feJHPWGrxfThTpb9GTqkfgeeClr6pxTNt8kVggscFh8FLw+jqD3JbkVJIhnQ3CVNjCQ==
X-Received: by 2002:a05:690e:1244:b0:66c:707b:60eb with SMTP id 956f58d0204a3-66fb5a149f7mr8100296d50.23.1788882312712;
        Tue, 08 Sep 2026 08:45:12 -0700 (PDT)
Received: from Ammar-PC-Fedora.tail72f32.ts.net ([2600:1702:7bd1:29f:8000::1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104049d30asm120779386d6.0.2026.09.08.08.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:45:12 -0700 (PDT)
From: Ammar Ratnani <ammrat13@gmail.com>
To: linux-rdma@vger.kernel.org
Cc: Ammar Ratnani <ammrat13@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Paulo Alcantara <pc@manguebit.org>,
	Stefan Metzmacher <metze@samba.org>,
	Tom Talpey <tom@talpey.com>,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org,
	Ammar Ratnani <aratnani@nvidia.com>,
	Kechen Lu <kechenl@nvidia.com>,
	Mithun Maragiri <mmaragiri@nvidia.com>
Subject: [PATCH 0/2] smbdirect: don't hang on netdev reconfiguration
Date: Tue,  8 Sep 2026 08:44:25 -0700
Message-ID: <20260908154454.10966-1-ammrat13@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When I mount a CIFS share using SMB Direct over RoCEv2, I observe a kernel
thread hang if I "configure" its slave network device by taking its link
down and bringing it back up. Attempting to just `ls` the mount point in
this state gives EHOSTDOWN.

I believe the following is the root-cause of the hang: When the link is
taken down, the corresponding GID Table Entry is marked as pending deletion
and has its slave ndev set to NULL. All sends on RDMA connections still
using that GID Table Entry fail at MAD creation. SMB Direct eventually
detects this and tries to disconnect / reconnect to recover. Unfortunately,
disconnecting requires successfully sending either a DREQ or a DREP. Since
neither of them even post, the connection remains in the RDMA_CM_CONNECT
state, and no callback moves it out. The SMB Direct layer never gets the
RDMA_CM_EVENT_DISCONNECTED it's waiting for, and hangs.

Fix this in the CMA. If we call `rdma_disconnect` on a connected connection
and we fail to send both a DREP and a DREQ; disconnect, and thereby send
the `RDMA_CM_EVENT_DISCONNECTED` event to SMB Direct.

I tested this change in QEMU using RXE. I ran Ubuntu 26.04.1 with a
mainline kernel. On commit 9f0346dcbea3 ("Merge tag 'driver-core-7.3-rc2'
of git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core"),
I reproduce the hang. With this patch applied, SMB Direct immediately
disconnects and reconnects when the slave device is brought down then up.
Listing and reading files from the mount point also work afterwards.

Artifacts for reproducing the hang and testing my fix are available at

    https://github.com/ammrat13/linux-cifs

There, you can find: logs from the "bad" and "good" kernels, the kernel
configuration, the VMs' configuration, and a playbook to trigger the hang.

Ammar Ratnani (2):
  infiniband: force disconnect if DREP and DREQ fail
  infiniband: trace force disconnections

 drivers/infiniband/core/cma.c       | 41 ++++++++++++++++++++++++++---
 drivers/infiniband/core/cma_trace.h |  1 +
 2 files changed, 38 insertions(+), 4 deletions(-)

-- 
2.55.0
