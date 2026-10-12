Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F484718E9
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814377; cv=none; b=MIFiKohAeWDek+GwqQdGo+h+9oxbtYNVFL4KJhTjtUgekZ3W/E6AIuK1M6xe31eNk93lbXMTjqVbvjZUnrN4tsHHGb9d4JnmUo1IckThgb/OUlc/GZBNMpWr/3qPNaZH2+kzMaUspiOXtJHV1mAeJFQ6liRcPLhOfawFWb9Wps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814377; c=relaxed/simple;
	bh=+P+5IuqZmcHbKdwheJmWecoGHwPlG5Cd02+MDJ/K9H8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kmasvVh4iFzOGRbgAZ20vRjFrWg0+XxOxM5GJ4SYnQGjWA6QvZVL16hkDtnkZesk51rCazu801xEOV7FWY0suJQiAIJ3nvEKXJ2H+fOqz4R7JS75g4IaRcZ283RNINiccAUIf09rrnm10x/ZdjAtjBijtKApBJXdqWqpl2swxHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oR4pUjtl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oR4pUjtl"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1880696f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814374; x=1792419174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LMBzO7OLXXuEGs3hvtSdM4niUS4jG81WbBB8rl+DCkQ=;
        b=oR4pUjtlPNMsQ04WL8xETo6HNuXcNFzJCMFRA8dnxZl7K08Pc0HfLw15N84k7+WcxS
         /omLmRBt29+UcgGdF6qFMK4xkxHnC4qhTF8cvN8RizvBUxMELG7bIPduXKpI4Lofn9fw
         cL6sTYAw+bS6RqyXiLU2U8eQc+HxzFqbSPTERJ+bvC041YyZCq6uy0aD3B3Fh6uw0+kw
         H8qYBhyxs4Sj70GmZKMjWhhXDhqjqo6LI9TENvLCmFyr/e2vh7si6BM/YfHWPqzOchw0
         xGJw+vlHM2263acWsTi+ZAtKY+YCmsWSjGYDQYq8KdMomVbiBDA4HOhl5fFgpTeQvzRT
         qNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814374; x=1792419174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LMBzO7OLXXuEGs3hvtSdM4niUS4jG81WbBB8rl+DCkQ=;
        b=F7SmHX2j2aIKEARzq9qEJrX40qByvjMZbtVpbZ1dBzv4KjB68Iq3OQ3y30+9V5YyqM
         kkCIDPkyxAWlyFDnHuN6/r1ISt/4+b9bgEYTeoCkVQ5vMyVLVrNs7ayPsYkWsd1R6Uqh
         lLoeg0Igv+FUVAqZK7Yq+YRauBfdxAeh/mmdn7T/ie1VNQIoA+rzabKncVeYIO28rwkf
         gb32JuvGiW3C9ELTUfqeA+ZAIZ+75uZ1am80rS3xeaoVm2+c2MQMpnzSMindV/Pumefu
         oz1Pc1lDe+wE+LONxySkSp/5O8TiTjEDZSLB5Sd13lSqAwmsskD4+9gijM8Mc92CS0O0
         2kuA==
X-Forwarded-Encrypted: i=1; AKwUvBwKx6drNX0xBRv+fptBk604mRrpZ3u4JZWvr1mkMVxZRUVlVTJ1dtxblPwpjKdImZx2n60aizovZch81kg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsF3CJvGDRqI3RIWr7riOdUwaQBDSVXZ7RQXWQeW6nHYZ1rjAw
	RaE6BGU9gJ/kJLbk0qLL2Ez0351ewuv07X1N7QCfBZf+Q1cIMQnZvRg0
X-Gm-Gg: AYBFou3Uw4e9tP6Golw0CClGfgfYn8E7FVKNHa31L9FhZHVOgT+5u6+eNOaMYEOknkE
	B6mciIcJ5igOxwWDFiqye8N8o48nq6Sp9dU7Pb8EaCygDx9066PpEK2FNmTlc2QQJPtmDWyQdgU
	hmyfT1Q5Ufxw7JPHAi+KNFSSs+QdofQ55ECdDOaOs7PJchkhgf1Z1TTUFtFU3dyq0iXsVwySQHH
	VSSWol97IzHMzwa8yxmuBs5yfBd/56vyGal1NC0EPMNAsUQPIKKNIlb22Oey5vDZQuQ85X9384R
	V+FpU28eijZR8qGMqDchrVu2XQ1Cp5O0HNqpiYYdmNZ5slcoYF3k45IHz4IWwbYNrp88uE+/u2Q
	AmlYcWp4I9TmuqDnNNFaF1Khfb1sLgJkMvKlsPQKKTjr4D2J4intAdi9yctW4QuRPTzdArQhZ5V
	4OCJGDxqeZcoHPT5lczltPClLi1CgHMflN29aFoO70b8GPaBQC/RNS6zHvmNqqsWjZI731kTqFb
	yM52EGaBlrh0nT8iPF8dgSeNx5gwsdiKlcNpsd1ghQA
X-Received: by 2002:a05:6000:454c:b0:487:c3e:8df8 with SMTP id ffacd0b85a97d-48dba77cf87mr12555139f8f.5.1791814373901;
        Mon, 12 Oct 2026 07:12:53 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.59.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac02cfsm18703035f8f.39.2026.10.12.07.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:12:53 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	James Smart <jsmart833426@gmail.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] nvmet: fix stale data exposure and ZNS validation
Date: Mon, 12 Oct 2026 16:12:27 +0200
Message-ID: <20261012141239.156408-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A connected host can currently receive stale target memory through three
nvmet paths.

The FC transport sends a read buffer even when the command completes with
an error.  Some errors occur before the command handler initializes that
buffer, so the host receives data left in the allocation.

Zone Management Receive writes only the Number of Zones field and the
descriptors returned by the backend, while the transports send the entire
requested buffer.  Reserved header bytes and unused descriptor slots can
therefore retain stale data.  The handler also does not verify that the
transport data length agrees with NUMD, allowing a host to increase the
amount returned beyond the size described by the command.

The PCI endpoint transport allocates each read segment at the length of
the host's SGL data descriptor and sends every segment in full, even when
the descriptors describe more than the command transfers.  The excess
reaches the host uninitialized, on any successful read.

Patch 1 makes the FC transport send read data only for successful
commands, matching the TCP and RDMA transports.  Patch 2 validates the
Zone Management Receive transfer length and zeroes the report before
filling it.  Patch 3 rejects NUMD values whose byte count wraps the u32
length calculation instead of accepting the wrapped request.

Patch 4 fixes a related PCI endpoint bug that patch 5 depends on.  The
transport reports every error it detects itself as a successful
completion, because nvmet_pci_epf_complete_iod() reloads the status from
a CQE that only the nvmet core fills in, so even a write whose data
could not be fetched is reported as written.  Patch 5 then makes the
transport reject SGLs whose data descriptors do not add up to the
command's data length.

Patches 1-3 were tested over the loop, tcp, rdma (rdma_rxe) and fc
(fcloop) transports, with a zoned null_blk namespace for the Zone
Management Receive fixes.  On the unpatched kernel, a failed Identify over
fc returns data, zone reports carry stale bytes and accept a transfer
length that disagrees with NUMD, and a wrapping NUMD is accepted.  With
patches 1-3 applied, none of these occur on any of the four transports.
Patches 4 and 5 are build-tested only: no PCI endpoint hardware was
available.

A tested reproducer for patches 1-3 is available privately on request.

Andrea Parri (5):
  nvmet-fc: only send read data for successful commands
  nvmet: zns: don't leak stale memory in zone management receive
  nvmet: zns: reject a NUMD whose byte count wraps
  nvmet: pci-epf: report transport errors in command completions
  nvmet: pci-epf: require SGLs to match the command data length

 drivers/nvme/target/fc.c      |  8 ++++----
 drivers/nvme/target/pci-epf.c | 30 +++++++++++++++++++++++++++---
 drivers/nvme/target/zns.c     | 17 +++++++++++++++--
 3 files changed, 46 insertions(+), 9 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.53.0
