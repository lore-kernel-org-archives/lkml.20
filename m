Received: from mail-ua1-f98.google.com (mail-ua1-f98.google.com [209.85.222.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774BE43E08F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290289; cv=none; b=Sel1CGPZXZj9PuiVeDYX6qJRhoLEoCGTOzMANRmcnFjORYqPGx20jwIsl/DDgoGTebeHA4+dHU8+zB3RbP2FvopHatx71mE3rkCg66FY9USy0IZprlleOYwrvISYJHa9bAYmSh3kiz1NSoI+UEnFh901zIczl45Wr6ZyNvvJlKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290289; c=relaxed/simple;
	bh=+UFpASiuqIKcMdnDWDzTtA4Cae69jKZXqzdxrdR7kpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iEOd9ZdyeFqJcJ9bvYoo8taKULHQiBpkUvHTeb1n3cxIXbw/0IZ4GeYV6SVdBn1xP15bKn39ZC3h4V3RcGPc2OF1MJYsm/n+2vfYR1vfI1p89CmBWqmiMKHBz9HgWEMXvih3PVSPneG6w/lRmWCzcVGE2WSv9d+KZwCW89osy58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HNrdFwvV; arc=none smtp.client-ip=209.85.222.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HNrdFwvV"
Received: by mail-ua1-f98.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so91966241.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290287; x=1788895087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h1fswLlcr3+9E5T/YNE7zD1XKjJ+1SuKp8Rk5qajcJg=;
        b=CW/WJibB8vcip18KxAJB9w2SYpvFQstrSfkfhdWpwJtcZrU9NXt4DTBaderFdVnW5+
         6JYju70VELTUeFe4dXt7WLeASzmkQ5qQPDOsA09uXBId0CBU4Qs9/110iA/Dm0IVBb81
         owfPoxMRZu2XH2sVehllMk1ejdAS0jVmRAHCY92gvywe+J7/0fyEpspihSxA/+EMxbem
         zK3rj3Q+37Yrn6DV4amVBcykQGb6nZdKta8XrkxAV9RIKOZP1GCrov6srov/KrtK06nI
         E0HUNYIdO//J5PwkXfZJ1Ik6MXR255JYaWcm6aJlJFIxSc9hOAgLktExz3TxmbhsxoeL
         IaVw==
X-Forwarded-Encrypted: i=1; AKwUvBwzvy9ci1/LfFS1pqUNDnELvmHpRxJLjprgD4dUOVsqGL7/brBEXxwxfl2yT01rV/ejFW2ktjH9eLVLwTI=@vger.kernel.org
X-Gm-Message-State: AFuF++mAXxNrz7ogJob969KZ0cNjDEelqrh7Xo0NO3SLNMJd6b/J1XWV
	FyAOw16EaALoUlVzX55c0v3FBeDwTrNaAfUTPxd5zNkRNfk9I2mFs7W4iNAFc8MURADiCIASuMx
	1HibQPRn91MMKxAsVHF6bSfyOwGj7qYlmTtqB8tdcyY0uPfnxYWEMRQFzfQs/QFnmn6aXGDuyBd
	ShH9ZfBG7vLUaFP66yJaqBmXD0CohLnhH0hWJ5FACWI5ks18QnNjkS11OcpZp9VRxG72L4wyDb8
	HYM6Cbf3O/rT6LUpiLFLtRs5A==
X-Gm-Gg: AYBFou1PPE9V6D+z/H50Vy6cIWFtRkqbaoByQQ875Db1ECaJ8X2t4L3yRvt7UutW+M1
	SZp/U0qSg0k5eksgoiDCDjjBZAUvAdabNjRwWBGm7z05eq64MSCErOPl5dX8gsqpQ8/G+DSQyMq
	y6GnxkpyafusfMJaNKLeJKFjqWVRIBsgFbmiOxoTbUl8YpWcDG89EyvO8CAYAL82UW0XbYeYW5S
	qKNC5yA5nqC6bn9wf4dnK6FSL9jdjBggCrMd5JuN3aEMz5qG68rtkFxUlFKevNlpMOVaodLtXy+
	HXRJNFIxsGN3K8ja33OxMiDFaQ/O7PZPSRQZ6znPWN7YHchPOSEZ9f79YU6aYDfQ+aBjC4faSYq
	PSEESIx8kOjUKYNTAModp6FUMA1un3LfdfwPsbPbJqU+M8xCUOxogLfb3igM1JYDgXiZuxAH3rf
	7Mbby07CLcMiZKp9WN6AgzZY4LnwQ+ZXsTjCxZEobZqA==
X-Received: by 2002:a05:6102:3e01:b0:781:3b9e:2f06 with SMTP id ada2fe7eead31-789fc38beedmr4762690137.12.1788290286866;
        Tue, 01 Sep 2026 12:18:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c7cd72acddsm136093e0c.2.2026.09.01.12.18.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2026 12:18:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so1934775ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788290286; x=1788895086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1fswLlcr3+9E5T/YNE7zD1XKjJ+1SuKp8Rk5qajcJg=;
        b=HNrdFwvVfOIVWfRepMIYF4wSBz+sg70WCDdyfLvn5AIuvCQQVghTC5G1arA3h04ehH
         N7bvmP/j/SUA2j2ONEdiTQnKjrQLB3Zj7XXwVcNSqay1OcPaiLlYU6QJbDFOP38PZRgp
         7gEeuesNJmpsVnjKO0ziUNOT1hK4NezaL26Ng=
X-Forwarded-Encrypted: i=1; AKwUvBxp9LoDn/x92yYSIzoEqLmWZdFa0W0imJ6Yy1cNvisiH0AENVIcAfp5RseJZ6fmRzM6dzwCd7nVTwrWaNw=@vger.kernel.org
X-Received: by 2002:a17:902:fc84:b0:2d8:d4d3:da4c with SMTP id d9443c01a7336-2d94a90e1d2mr152890305ad.16.1788290285785;
        Tue, 01 Sep 2026 12:18:05 -0700 (PDT)
X-Received: by 2002:a17:902:fc84:b0:2d8:d4d3:da4c with SMTP id d9443c01a7336-2d94a90e1d2mr152889605ad.16.1788290285320;
        Tue, 01 Sep 2026 12:18:05 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79cf9sm186440eec.18.2026.09.01.12.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:18:04 -0700 (PDT)
From: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Subject: [PATCH net-next 0/7] bnge: Support async events while down 
Date: Wed,  2 Sep 2026 00:47:21 +0530
Message-ID: <20260901191728.643212-1-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi,

This series lets the bnge driver keep processing firmware async events
while the interface is administratively down, by keeping one notification
queue (NQ0) active across close/open instead of tearing it down and
rebuilding it every time the interface is brought down and up.

This persistent NQ0 setup lays the groundwork for additional async events
in future patches.

Bhargava Marreddy (7):
  bnge: Extract bnapi allocation and cleanup into helpers
  bnge: Extract per-NQ ring allocation and init helpers
  bnge: Move bnapi and ring_grp allocation to probe/remove
  bnge: Drop obsolete bn->bnapi NULL checks in open/close paths
  bnge: Quiesce NQ0 around ring teardown in bnge_free_core()
  bnge: Create NQ0 during probe and keep active across open/close
  bnge: Process async events while administratively down

 .../net/ethernet/broadcom/bnge/bnge_ethtool.c |   2 +-
 .../net/ethernet/broadcom/bnge/bnge_link.c    |   3 +
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 483 ++++++++++++++----
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |  11 +
 .../net/ethernet/broadcom/bnge/bnge_rmem.c    |  26 +-
 .../net/ethernet/broadcom/bnge/bnge_rmem.h    |   4 +-
 .../net/ethernet/broadcom/bnge/bnge_txrx.c    |  15 +
 7 files changed, 440 insertions(+), 104 deletions(-)

-- 
2.47.3

