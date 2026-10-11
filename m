Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBDC175A84
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791681083; cv=none; b=jYl/mskWDT8oL+qVV5pjhnPb2fgON9RhnsNVmTcPtjZc3GwZD7xr0BFP8WEHKskWa1cCHfjhAn5gSKAkehtUJYezcUzUrJGAdp1xCZajMVbfGiPfqZIOC7WrzlvVStnZr32uTEK1yyz3K5rnsS7hdrWiqDINQyTZAcJLj2ZS754=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791681083; c=relaxed/simple;
	bh=DkU1fYd1IIAxte9Pnb9eqIS8jl7Hi3XVnVU8rEsYprY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G595CQwBW7F1oiw/Ud/WGXZN63xsoj5fBIg7KGO+gsGWPlk6CXtlywmDCxhwDk5AxyghRjS/PZN1oDgalonBVxWayNKToNkuKIp20C19GDXdCnAVWcYhXAghlgv2+zh7Ngv4/C3KlD6Hp3K53JRjaDJYOWftdorQ2wYXO46MI9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=B1n7OmPb; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="B1n7OmPb"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ac4806e210so4769187b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1791681081; x=1792285881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kGp/tVc5H0YMoXXk+u9E+QsSAwD4WEME1DUtDG16Q34=;
        b=B1n7OmPbjLcj/1cszyMZax+yEKlgyFbiSxODFLp01EKrZJ0Y6CJB03Gh8R0NmbbeVa
         NMrpgEyd9gArIwisYtIOE8rQK+FF6pBOJDscpICJc9RnftNhJXUkI/6cHViUXT/2j2GQ
         JrhZomiVOnaew7chhdJ3HyooEG2jfb7X0AS6Bp7jQWrtf6MN2iRzciCLy7B/KpJ21IBk
         ZzIOhltdXY05eqyNcabY2e9BnBlQLILguuTxP345yKcRftRNjRPZt1layLdyTNOC4PBR
         /67Cmb5dm/LnP0cRXVpzbYcRT4aOyP83/60I+jbjoBCBsnT1Oi0lYAKCZMKcD1qH8LT8
         YaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791681081; x=1792285881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGp/tVc5H0YMoXXk+u9E+QsSAwD4WEME1DUtDG16Q34=;
        b=XolMzNoGGPsaPiEMDJddqDaaglZWNk7BF2ZmLs1iWr2uY4EMY51D6bJkUI0my99NW0
         gmmF2tMXE9NSf12Q1ZJBE6yeWeEwNpnesD2TmGnBGAOpixwI4Pv4+Mpdjfagq/yG34Fh
         Sc/kE3YBS8Sjriv/otTYk8LfPlQpB2KTxGEltuGY8wUo1vPe54vkQr48kDDBJJayyU31
         nsa1qiv02tEwCHg2ootkYCbAOwlJLnwM3Y6tFyJEhXUaYvcz2IlzilmqfiC7BmKv3Vww
         rEWG1QjvZiarDGFGPAJ5GrrnJ2YVJJDK1Ov/vIHzbhcQR5zZ/axlNgBtq8bzQ7PmTzNo
         KTmA==
X-Forwarded-Encrypted: i=1; AKwUvBz+NaoTfybJe/dOT+Zrr8Bb2ArACaV364chbA+WLWcvRTaLUJHMCVX0k9BepDsWorL1GkUSVmaqiPPW8hE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAYOcPBnp6Z402/wJ0xqis2kd5kje5YU+a91lZOU/uJrjKyXxF
	g98I2OxQKbPu/I2vH06JvE3QPOPPj7FFWOztHJ1AvxHDh0DV5Lug+4QWn83KV1+0dVQV
X-Gm-Gg: AYBFou0ADkwxdIZK3WQ0Xxep6kjG8WlvpZeJEV5PZV/TOEGUs6i4EYovnizGVV1PNie
	F58Tl81mHDXaYdjaSu0UfiQXtkdnAdKvlkhyHxVAp2VjQ3NHN5kcBUEDkfxnUCJK4gnqb8JplyZ
	u+csLHudsiiuvJIlWgZlFwHyfz1St/r5VHo9+KSySlF7xnb3xFrvS7NP0i4XDNj/kdxV0SMPgNQ
	dEAISJHjLKzJQnoOtDbESPQInmkR6DGMSyZtfHV1RJiFl70cOI8Ar/heVc7Hky9icK6In4jEZQU
	7zh9Z4FdIwsOr8wufuSG/8WqrPei74F7IYVPnFQSAskbkrHAS0lLpCv1O63AX66VokOi/N8VpC0
	QaSIAB17MupvJyiAoRYUnP4jrAiRC+x+Psef6iEIkO2Rousju7t2X1WX7JGTLJH1LUohbbWvRBX
	NwLpBD2wPGQz/2IUKD7OIWPlf6GAUWuCZDJNGzd0/qdj8AfU9dRzCPc834Dg2GLxHlrASZckH2P
	yymjEvr0dKHg4zn5FR1teYh2X7F1QfTV3Ez8vWX1ThvCaBkR/UR1Cr2SGewuXPFva8ymi2Ss+3/
	dTyjwVA0RQ==
X-Received: by 2002:a05:690c:95:b0:8a8:6fac:1525 with SMTP id 00721157ae682-8b07edb158dmr24589047b3.46.1791681080997;
        Sat, 10 Oct 2026 18:11:20 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (119.20.221.35.bc.googleusercontent.com. [35.221.20.119])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f263bc8sm21311817b3.45.2026.10.10.18.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 18:11:20 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: Tatyana Nikolova <tatyana.e.nikolova@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jmoroni@google.com,
	eagleshaw@google.com,
	David Hu <xuehaohu@google.com>
Subject: [PATCH rdma-next 0/5] RDMA/irdma: Add support for ioctl
Date: Sun, 11 Oct 2026 01:10:17 +0000
Message-ID: <20261011011022.1445352-1-dhu@x6u.co>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Hu <xuehaohu@google.com>

Hello,

This patch series introduces support for uverbs ioctl queue creation
(QP, CQ, and SRQ) in the irdma driver. This series makes progress towards
modernizing irdma. This enables 1-step queue creation from pinned UMEMs
and shared dma-buf heaps (system_cc_shared), providing RDMA support for
Confidential Computing (CoCo) guest environments where memory encryption
otherwise prevents standard host-VA-based queues from operating.

Historically, irdma relied on legacy write() commands for queue setup.
This series modernizes irdma's queue creation path by adopting the ioctl
infrastructure:

1. Plumbs uverbs_attr_bundle into the irdma QP and SRQ creation routines.
2. Registers irdma's UVERBS ioctl namespace definition for QP, CQ, and SRQ.
3. Implements 1-step queue buffer creation for QP, CQ, and SRQ using
   UVERBS_ATTR_CREATE_*_BUF_UMEM attributes and ib_umem_get_attr(),
   configuring hardware Page Buffer Lists (PBLs) directly from pinned umems.
4. Adds support for driver-specific shadow area UMEM attributes during CQ
   creation with CQ resize capability.
5. Preserves backward compatibility with legacy 2-step write() path
   registrations when UMEM attributes are not provided.

User space rdma-core PR: https://github.com/linux-rdma/rdma-core/pull/1766

Testing:
Verified with rc_pingpong, srq_pingpong, and dmabuf_pingpong over irdma
devices in Confidential VM environments.

David Hu (5):
  RDMA/irdma: Plumb uverbs_attr_bundle for QP, SRQ
  RDMA/irdma: Register irdma UVERBS ioctl namespace
  RDMA/irdma: Support UMEM attribute for QP creation
  RDMA/irdma: Support UMEM attribute for CQ creation
  RDMA/irdma: Support UMEM attribute for SRQ creation

 drivers/infiniband/hw/irdma/utils.c |  12 +-
 drivers/infiniband/hw/irdma/verbs.c | 347 ++++++++++++++++++++++++----
 include/uapi/rdma/irdma-abi.h       |   5 +
 3 files changed, 314 insertions(+), 50 deletions(-)


base-commit: d2c08575500145dc5cb55075cd9b177626531613
-- 
2.56.0.385.gd3acb90ef8-goog

