Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675787;
	b=yVPkexAQUO5QangF3tk9RsehiX3uNYuNDwNgnpdcJqX5mcvw99fLnBjxxOXjVROGYwyk
	 Qf31LAix82VZBMGC2QlF14qdpxH/w+DE8mhJjJS3pB1eq66aW/Z4KpwLDxvWFIUmWrhhT
	 tVVvar7krCGKNQ3TnhSAhE1P+v6lO4eNhOQBRvWrZaC9DnzdAjkIcFMGQ7+ZQ46Eyee4B
	 gmpqliFzBKVsUZvL9FVSHDKSLTHp0SZXgJkFB0gnzzu56rjKBQ0c8ZeXK1892Jz8l3ZVV
	 scG1Qfm4Z52HgmvE+sJzbI94VpwQc7yPqyn57k5sJBg7gSVj+Jg2wa9dneaqUWjhGbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7cc5rs2PtzGFHpoWnnvRux4DVgA7nFFkTqB4lwRugTc=;
	b=euqHb10ovl6V5LCDp+Mpjz8JMn1IKkj+PKFn3YFGUYPjuw6d7cS9ex6Lq33U8NR8/qcf
	 w5/SE0iMge5H0x3h941kWk97aYY7FJhlfAcvA7pjKo0d0G9tCLkENeKKL2TXs8NAFb8hM
	 R13PP8ePUlOCN1u2uhnm5ceEh/08cmCMG1bpMQccnQ7kttEgC+390G3KoMjapiltKZJqh
	 rdLtOJNYGC9+mwxnwoeT5rgXYvG5MuW5KyglPCNwRfOl98A/7DUq6c6y7DF0EcKAcxJmX
	 +orQKxijebTKKWXy97bzhrHUavumj9mQNWulHqYm+xe3jS3Airdjrvb30cf2/iFziYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="j/2HIh5v";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6761606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6761606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j/2HIh5v
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so13230735e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675785; x=1793280585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7cc5rs2PtzGFHpoWnnvRux4DVgA7nFFkTqB4lwRugTc=;
        b=j/2HIh5vfziQybhrnpk5MvyfQDLixqq3QVno4hs0aimdL1ktQFrR2Fh6kvGAeKeqsm
         klnG9mbf9ZPvijekIa6t5xfZJwFl35eRCUC6FevQMn/2BKCe8dRGlG+na9bbtf2hAA6T
         5tWo8mJIZQBgbJclrFST/GeohmZPgXqLETOg2tMEsgVzzsbAa3yKpy3iJ7deEkgdq0aW
         Se//erJOKF0QwcqXrKQhDAJp2bU+GGmCXAKRSh14sEFLE+9ps/7FPBtZoA/QB0c5Wjel
         vTyjUfzRuJ1t6hZ46v70XiPhSyh5KkLl0mRDHJNSP/xhNGK6O3uueuMDT93wb6OVrx88
         rfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675785; x=1793280585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7cc5rs2PtzGFHpoWnnvRux4DVgA7nFFkTqB4lwRugTc=;
        b=tY8eU8XHc+kRHpiEsZ5BxDurKWBGFhe1P5uwL5cF62nKmqT5k8ZLzKty8OGXhNnahR
         smuLa/3/w6giussdRyzooJgo3zURQK0Ar4oTQwl3Lq0dSwuWK0H4w0UoFcQuxHLBUjMX
         eRVIlEoFgPKu3pJb0HZvq3VaX1ye2YDVbcoc98kKpxgGayCKno498hSCAV4K68zkQh+j
         3ZQjINbZ79g3tKixQ4vgNioEcsDX1lsDL8FmuVXlIdsgGykzHt0JcGHN1nbjYRDIMrwS
         +xtJuBv2Xsnb5FVcXBbQq5naw7bRK4FTP46PVadEFSeem1gydfTKBjpwM/cMXsYUBxRq
         mxVA==
X-Forwarded-Encrypted: i=1; AKwUvBxu0mqropaMuoOyv3yWTEQBeETR1r8+JmiTNffj3GFMW5s3sDzCTiy7HyD3yVjbIizl0OkOkQ3mfbOj2no=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyUsWluy2F3aaIkZEoBmWy/1p/dgTpIMMOq0zZcqBrzpLo3663
	/Dd2OOwhnegXDC17gtW8yld0NDfIYjzM76fr1THVJQwAw6wQK2WRufUT
X-Gm-Gg: AYBFou25IOuc+UQyjLRmn8Wqr9ghu+rxrk46U+DpsTe3EwMx29Ds9fAhrFxgJjiiR8A
	mLXXkSnR+ZmRszeTZt8TqKsGHYJwA6k11hjcz8mPc6H83FjxWz1i8ckq/mD8Yxngdtj2DndIIyq
	K+4IqsQpT6vL/gL/zfJFl6WQllq/835+FSy3xUAUk+nvDSFDR+nqxN/MPOaQIuKmphLzqbe9V1i
	DJ6SeMGpF1BJRM3wNJSRyLREU0/Qfu3eJVRgYSmpFBdI3Zz1jptfnWMqKcZwJ0obrCw6DZSFwCq
	/S8+AqemZsHagfp7K89Lg7R3IApgJr5ohnRwy9LaYW+8nkx0+b7cnECrUYnEbl5n251cPHTqo1e
	obt+lN0yh9+ws3C0blb67vpnbsX5XFi0RoJMNoJRMPr1CubHo5dtZtp/a3/iUU9b8hb1Uk4tw5/
	ojHRIQN1FvcTHRhphcqvOY6rSx7031ShPbQUQTkpnFZ4wfhJro9IDll2DcDhaxdGwselyG5LYsA
	iwD/NnbC+fdbBy0W456KxhutRHOeYLXMKr1JtnlwacyGRjhA/4bAflPnubmzOz4YVnWw/gcTYgl
	sDJrnhIrZ4etU1apk6X1Pj99
X-Received: by 2002:a05:600c:5308:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4a20047b7bemr81252445e9.32.1792675784917;
        Thu, 22 Oct 2026 06:29:44 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.51.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm108832715e9.5.2026.10.22.06.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:29:43 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Justin Tee <justintee8345@gmail.com>,
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
	Niklas Cassel <cassel@kernel.org>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] nvmet: fix read data, status and length checks in fc, zns and pci-epf
Date: Thu, 22 Oct 2026 15:29:29 +0200
Message-ID: <20261022132934.3592924-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A connected host can currently receive stale target memory through two
nvmet transports, and ZNS answers a Zone Management Receive whose NUMD
byte count wraps.

The FC transport sends a read buffer even when the command completes with
an error.  Some errors occur before the command handler initializes that
buffer, so the host receives data left in the allocation.

The PCI endpoint transport allocates each read segment at the length of
the host's SGL data descriptor and sends every segment in full, even when
the descriptors describe more than the command transfers.  The excess
reaches the host uninitialized, on any successful read.

Patch 1 makes the FC transport send read data only for successful
commands, matching the TCP and RDMA transports.  Patch 2 rejects NUMD
values whose byte count wraps the u32 length calculation instead of
accepting the wrapped request.

Patch 3 fixes a related PCI endpoint bug that patch 4 depends on.  The
transport reports every error it detects itself as a successful
completion, because nvmet_pci_epf_complete_iod() reloads the status from
a CQE that only the nvmet core fills in, so even a write whose data
could not be fetched is reported as written.  Patch 4 then makes the
transport reject SGLs whose data descriptors do not add up to the
command's data length.

Patches 1 and 2 were tested on top of nvme-7.4 over the loop, tcp, rdma
(rdma_rxe) and fc (fcloop) transports, with a zoned null_blk namespace
for patch 2.  Without them, a failed Identify over fc returns data and a
wrapping NUMD is accepted; with them, neither occurs on any of the four
transports.

blktests nvme/072 and nvme/074 cover patches 1 and 2:
https://lore.kernel.org/r/20261022130927.3583166-1-parri.andrea@gmail.com

Their results in virtme-ng VMs, on v7.3-rc4-108-g551c722f4080 without
the fixes and on nvme-7.4 with this series applied:

                   loop  tcp   rdma  fc
  unpatched  072   pass  pass  pass  FAIL  failed Identify transferred
                                           4096 bytes
             074   FAIL  FAIL  FAIL  FAIL  NUMD 0x4000000f not rejected
  patched    both  pass  pass  pass  pass

Niklas Cassel tested patches 3 and 4 on PCI endpoint hardware with fio
over SGLs, with no change in performance; that exercises the normal
paths, not the new error paths.  The pci-epf side of patch 2 is
build-tested only.

An LLM found the bugs fixed here and wrote the fixes.  Following commit
1e035297ffda ("docs: remove Assisted-by references"), this is noted here
rather than in Assisted-by trailers.

Changes since v1:
- Dropped commit 31b8a6af19b7 ("nvmet: zns: don't leak stale memory in
  zone management receive"), applied to nvme-7.4.
- Patch 2: check NUMD at the start of
  nvmet_bdev_execute_zone_mgmt_recv() and in nvmet_io_cmd_transfer_len(),
  before any (numd + 1) << 2 is computed, and drop the over-long comment
  line (Christoph).
- Patches 3 and 4: add Niklas's Tested-by.
- Patches 1, 3 and 4: no code changes.
- All patches: drop the Assisted-by trailers; LLM use is noted above.
- Rebased on nvme-7.4.

v1: https://lore.kernel.org/r/20261012141239.156408-1-parri.andrea@gmail.com

Andrea Parri (4):
  nvmet-fc: only send read data for successful commands
  nvmet: zns: reject a NUMD whose byte count wraps
  nvmet: pci-epf: report transport errors in command completions
  nvmet: pci-epf: require SGLs to match the command data length

 drivers/nvme/target/core.c    |  3 +++
 drivers/nvme/target/fc.c      |  8 ++++----
 drivers/nvme/target/pci-epf.c | 30 +++++++++++++++++++++++++++---
 drivers/nvme/target/zns.c     | 12 ++++++++++--
 4 files changed, 44 insertions(+), 9 deletions(-)


base-commit: 2e8e30b3cf9f165e1a1d079331543cb7f2ad0e0c
-- 
2.53.0

