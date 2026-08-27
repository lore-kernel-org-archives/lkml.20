Received: from mail-vs1-f100.google.com (mail-vs1-f100.google.com [209.85.217.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178F64D90B4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787857069; cv=none; b=qA8toNFOvYJ4cPp3UAQeLg+GwZL+FMGXNqus6nqyPX3MSRIdM/pDjzjr6nOP6SbPDPiaDS3iHIMChj+XwiieyVjN9e4r8SHYmmm+Qh22UnlkJXNJ257sOXB1u8NxMup3vK+7kRL3uiPRDRsNV+4f/C0iX4pJnVrNGkYaEpnLaeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787857069; c=relaxed/simple;
	bh=LC382L91Fjmkvg3DzrJyfTe6xYWA++BUDclrQpsPZnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aYXXjgn/gSQWCSr9D/AMPXy0Lb2Objr7HsDavuJKEKUfmyuIhX5xPbKYf0InFnfmlnk924ntYyFa5nhTIXN82kY4o99jfaIni+81avbuYnisgpp4UuPLHsGup4TnTnMtXbGZvb6rEJIE/o5OAPnZCM/WZwgNcCzsYDyaMH+Wj0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=aosQXsxG; arc=none smtp.client-ip=209.85.217.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="aosQXsxG"
Received: by mail-vs1-f100.google.com with SMTP id ada2fe7eead31-737d7440b6eso10179137.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1787857051; x=1788461851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i10FjmX67zefyeXKozkB0Kmfyho0gXqWl4rPPjjJZ9s=;
        b=aosQXsxGzXAlVch2OV7h96Ps25/3SQ5OcOfmOjiAnoQPNuimPx4xO+VqRcS7UjhTCv
         yp6oKwGtfw+Kp8COsFuceOxA1VNLj0YqS+zVDRX/J5SlNGkUezoPgoqV0imVXUwS6lmp
         Zk3AiSipFgKtCkTCzF8NszkcjOwJlY5SMcbmjQ/sWxCLdBzjXb+ZqMxHj9PCoa/sA0v9
         syQLejkZj2JoUKRtYkczz9dnbSdeb8UqCrSI9xm4TXWs0uBPOO/80ctDd1h/EtUm372q
         A5KD7XSHQRmQLSPp1d+O6jSmgLU6dNmAFO9V6gEARJ4/YVUkqMusr4yW/sIQiulkX1YI
         ih8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787857051; x=1788461851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i10FjmX67zefyeXKozkB0Kmfyho0gXqWl4rPPjjJZ9s=;
        b=TcTTTFTSg/SWuLt7MF2/sWVCzr0SA6ERcaCNL+33ppDQ9kasyt9psIDb9fSTnGfuGS
         QQcszD7scAN6UnzkVM6YVcB5l6d0pAQSQLlCaqgH0caZBzEes6LSC4kr5iskYqMkEPYv
         fYudqOSnND2k3hWdVjI//FwijOT6sCFSVA5iGGx8IW7of4QHtuKyZVoErQKKUXOLT2a3
         JkJqiJa2tZ20sog/+fHUAj10I5kS6NHKF0u67e32z/EOr7468PrThQf7BKy436TuchR9
         N99UnUKVDAoNiv8AwR3ID5OZQQx3m+WDtxKr24Pt2TOQEon73v0KiCgT8xK3uM1jXQ98
         OYSw==
X-Forwarded-Encrypted: i=1; AHgh+RqCzevaPIe+JKCF9OsJjcNvulKw+AAWVFBz6iNNe53w7dtFekhhJvhNh0siJ/LesDBKvu1LzQYcol5qVak=@vger.kernel.org
X-Gm-Message-State: AFuF++lmd8r50CIyj2eMfNTYbr1UpckfAko4QwVK4vmH5bNPQAAb6Vc3
	z/4emE4QrsWivnrqrVPZdP+IXqMFMrDfOOOcBQivQGcAG51/9DEdCCeCyedCg0kth1/yl/kh+TF
	6VRs8feSzTXI4eEq5yfL3Vyt+nIoiJtbheXA+jOPoBCUwoa6oVr54
X-Gm-Gg: AR+sD10vWN4k43SDsvQe9h8vmlVhpqUBML8zC1u17508amvWnCdk6OVfaOMemLg8Ug+
	V6lHPYElgO5oIeOD0oyoxsuBDA4ztIk/JUSkZtAXNWDyqVo+G6wPW7YBY1plNcA/J3D5mbo+9Sk
	1LxMI6TRCCsBXmqVbxk3mvlduWRk6JOSmuEwiIxF87XEYvBfJ8BxpUODkP60ah0pcDoVCxU/Dmb
	AveXqHtm+lCm61dS7mFkrQ2P3CWZD92LkKYQOm2yGZjRy0cBbNQkA+5O4D96lhgt+keawhydgrK
	eE87l8RGo3lIhFBx/cX0tIBnElEtExNf7F6uybWlzBlNLil7oz9f60jgV6zwdum+dCCZ7QjgIui
	H2QXC13Su94asDqhm
X-Received: by 2002:a05:6123:593:20b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c680feb0f7mr218849e0c.1.1787857051036;
        Thu, 27 Aug 2026 11:57:31 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c6600147edsm1730496e0c.8.2026.08.27.11.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:57:31 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.12.104])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 64D774013B;
	Thu, 27 Aug 2026 12:57:30 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 5A653E404C2; Thu, 27 Aug 2026 12:57:30 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>,
	Ming Lei <tom.leiming@gmail.com>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 0/2] io_uring passthru: set result on blk-mq request completion
Date: Thu, 27 Aug 2026 12:57:19 -0600
Message-ID: <20260827185722.3234622-1-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_uring NVMe passthru currently receives the NVMe status and result in
the blk-mq request completion callback nvme_uring_cmd_end_io() but
doesn't post the io_uring CQE until the io_uring task work callback
nvme_uring_task_cb(). The status and result must be plumbed through
struct nvme_uring_cmd_pdu, taking up 16 bytes of the 32 available.

Store the status and result on the io_uring request in
nvme_uring_cmd_end_io() instead of nvme_uring_task_cb() so it doesn't
need to be passed through struct nvme_uring_cmd_pdu.

Caleb Sander Mateos (2):
  io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
  nvme/ioctl: call io_uring_cmd_set_res32() in ->end_io()

 block/ioctl.c                | 10 ++++++----
 drivers/block/ublk_drv.c     | 26 ++++++++++++++++++--------
 drivers/nvme/host/ioctl.c    | 19 +++++++++----------
 drivers/scsi/scsi_bsg.c      |  4 ++--
 fs/btrfs/ioctl.c             |  3 ++-
 fs/fuse/dev_uring.c          | 15 ++++++++++-----
 include/linux/io_uring/cmd.h | 29 +++++++++++++----------------
 io_uring/uring_cmd.c         | 34 ++++++++++++++++++++++------------
 8 files changed, 82 insertions(+), 58 deletions(-)

-- 
2.55.0

