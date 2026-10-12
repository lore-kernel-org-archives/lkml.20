Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05F43537E8
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791783818; cv=none; b=In9fl6yEjT3/NbgcgIo0h4fVfscvD4fNGZz4DL3XceNTFeWlBZbhDsqwyxxPBrXHSOIugyWeerAlWNKp+XS2tb63rfyQHiFN0J1ZEh0nmnWCsmaU8+lbF1vPtpXd7TKP7ePfWFJoFi9z+8Wgep8BNvepCx8EaNvyhsOeFmk1qvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791783818; c=relaxed/simple;
	bh=Llr2ksnMb8axoaOAofkdX4V28G8NMHhtNXPZ59eRpIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jS4iRz/8bRurTW+DYiC/4/YcsbuifQq6PML86FLgEtFzF9rO5dg33mQVurx4L73IiXImimqg+HCkigUfRggb7tVnmr7Rnp2HR/jQ5CXsUecFiJhYqbJv4FaVWLBQ8svxA4MYlnlIBK9OB5LqOW5CwLF1FSVJaMDfaDx0Qs3XsqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QVTWjfbN; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QVTWjfbN"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2e608cd460eso7413915ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791783817; x=1792388617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DrTHSJoQR86XwCgavEnbXSD7VtbrpPm/c0zcBwcD0a4=;
        b=dn5nOaA0xcDzUx/gwGZ6ziBRFrimfY9UUW3jw+a994AOsYKG+fYSWJLBkn6yr/ebEj
         n7b/ShbwdwRgq5kS79VcBLVMSfkzIVMzqbXEKwnU+C2X8s3q4tA5IxN22yoP0EvS7Uae
         Ft7/2DJCC2SELNT0oPwA6mRvHhrVCKZ+GmgcB9eOmFybF2rKTpFvJJss8TdBee/NA7Ps
         kRgYtEYkxw7f9up7yLZYD4EDRcDBakagzZY6MMfhL9xY6FN7hkzQzTnpClpE23U1JHUQ
         /5RE6cO7A+7gH615vMqqbb6AIV0PtCTkUcydE7oaAgFeWyftzWTs4/e4+8yHxgidVztk
         A2ag==
X-Forwarded-Encrypted: i=1; AKwUvBwNoSszB0YE4JtsMauRLC+CL2OHhEJmUAPFYf/kwiiKn2a20CsICtcdrri6oAgXKToyjdBziLK/9XtzQc4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ37DgPvICYyL6NGsA08/B2C85UD4CEVwqZtadZGlJ51wPFZP2a
	zxeBLOFaFTwaYPL/725KHoVqak84GKHUz1x5Jtx7YI2LhCDahySNpFraPoD4Z2I6Lfcdpyvy01R
	0mBOFM2xTkBoprW82TWH1q2puxJVka7qubl7l380VqV98IZfONcepMgxzNZrFCAYIErQYOB6s4L
	NAkRC4dUEqTza1Li8C+noO98dtRqJg5eIV+YXb0WMd6AjJ7r3s4UKxs67a73ZiIxAQrWyWVNALm
	IeZ216zpskgSUhAOg==
X-Gm-Gg: AYBFou2NjGSG5W5o2/vhqz8uG/zQFNtnCcGzcN9KHgZ5HC5KZfblhYcw2Q58yopXGii
	CaIelyZ6ftCkOodjpVFojsCMFf2BPTUKwis8uBx89fZeeh4BDRnP+LsGEP+aBFzAf/aX7jzvdYV
	IvdPMQ9Bt04VpLJhE5C/K32jzDB+v2dMHm2ssUjDNlo4rj0MKtxbE2eVcho1TGcNw8AqIskEIOQ
	Vv0ok/4Oweu0kjD9yBFJcVu6c/tmzCLXyXoxrxROt5jXmFEjAce4NDBhRRJozmVSRQYGL8yAAIb
	vssEsN36JXeNi7g9NfjlK9HxwdKhorXSRJ+mqtOHQvWDyRk/XUYp2K/zuHP7sVji/0KHaSPi46l
	d78YsBgWbR3WAZrhw54LSxy3njukxnyHTqExIgsR5rCtTNdsrX3n8yH/L7Jvb3H5hb2moLQP9IF
	RS6k1CaUy9rKh7dPcO0+oCflW+yJ2M66KMdgX/
X-Received: by 2002:a17:902:dacd:b0:2dd:ad73:5b6f with SMTP id d9443c01a7336-2e8429ade93mr68967035ad.31.1791783816894;
        Sun, 11 Oct 2026 22:43:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2e84218f688sm3357005ad.37.2026.10.11.22.43.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:43:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a8ae5154e7so1305922a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791783815; x=1792388615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DrTHSJoQR86XwCgavEnbXSD7VtbrpPm/c0zcBwcD0a4=;
        b=QVTWjfbN8zvnAUjtpIKB3A8lr5xYM0GwyoAIELekK1cRNtRNjCE2kdSY18kmeBmdWE
         b+CqXWZi92JR2TUlVyPBmrLWWILUQ/sPkQqcTP99bXJqLJWBeOpw7Lane96ydh7rjNzo
         eIE8eFr50fZ1PbbuqjBZ3IJ7BbjhockYC1r+o=
X-Forwarded-Encrypted: i=1; AKwUvBzMe2qxuML8Fzj9PKqGWLIP6SqpukmagwI7yRJa68Eabdr6Mjet9lMFLr6S2Bd2Ll/GNeTSuLls0yE8D1Y=@vger.kernel.org
X-Received: by 2002:a17:90b:1dc1:b0:3a0:eeda:39f3 with SMTP id 98e67ed59e1d1-3ab3aafac4fmr5914886a91.24.1791783815050;
        Sun, 11 Oct 2026 22:43:35 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc1:b0:3a0:eeda:39f3 with SMTP id 98e67ed59e1d1-3ab3aafac4fmr5914869a91.24.1791783814589;
        Sun, 11 Oct 2026 22:43:34 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f8277bsm14615587a91.11.2026.10.11.22.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:43:34 -0700 (PDT)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net 0/2] bnge fixes
Date: Mon, 12 Oct 2026 11:13:23 +0530
Message-ID: <20261012054325.1782819-1-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi,

This series fixes RSS indirection table and context sizing for large RX
ring counts. Patch 1 caps the hardware RSS context count and RX rings
to the RSS table size, preventing out-of-bounds writes and an oversized
memset(). Patch 2 fixes the indirection table sizing so rings above
the table size still receive default RSS traffic.

Thanks,
Vikas

Dharmender Garg (2):
  bnge: fix RSS table sizing for large RX ring counts
  bnge: cap RSS contexts and RX rings to the RSS table size

 drivers/net/ethernet/broadcom/bnge/bnge_resc.c | 6 ++++--
 drivers/net/ethernet/broadcom/bnge/bnge_resc.h | 9 +++------
 2 files changed, 7 insertions(+), 8 deletions(-)

-- 
2.52.0

