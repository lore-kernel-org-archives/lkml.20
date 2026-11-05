Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913857;
	b=FHDEhYmWK6G32fGhxw7pfeXfqDXj+ehhn6UJ7z1A0NCFBZ5ZgW6cNn/PGOIl75/XFxNR
	 fwtFNFpTVgXfaDk77Vw0ydDH3czW+xPR+GgfgPan9gYOswdHFWskcyjWSM4OnF631tHaE
	 UPgRlG/V3XL8sxIAZSWNFepKzE0Xhc+mtytF5DxrI8qkDgWnI9Zt8V1JBM81Li42YpNBJ
	 5ILPvRrgKsh4b8oIvkwjuoVV8rUBqryaKObbpIgcaq9/jNCJU1Z5sdjws66UBt+CDczh7
	 ME7g8EKrxLiAu9nP+qIjuctSdknHzuer3Q3UGHiHZRUExBvjJmuUMxrzGFG2Oesd9HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jXM9i0x2nDS9j+rZWPBPawv/gGcnm2DhRQRnMf6xoMc=;
	b=xJGJHt+mDJZLNvL7ldWLnUnQzcVQD/eW2NhtLeU06SWJJstGY27NFImQJ5EwtF37fLJK
	 1FFs1CfGUqC8akTl9sv0oQiG78bKVJ88PsKkTy/SESwt/enoEOPbQUMQVMV4v4kYDPNQc
	 fnxdVHLwVA/LSrdbRxiHZG3EmsS4lC+R1s8if9Z9/MNwtnpzQYLmPfuJXezR2CjVifbSy
	 dlSv3N/Uq+epydpMvZRgzEO9Uo/wy8OEIDFhg7NQXgfeAtwhV//1MvV3r1Xua53nGyVNx
	 9GgftzwCXSkXGSrvfF9jXLChtvzL34fEvAEe6Eip5/KC5JOujbsE72zcGYm5yABtrRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=fKiUei81;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09377606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09377606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=fKiUei81
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f84a55cc06so19416a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1793913856; x=1794518656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jXM9i0x2nDS9j+rZWPBPawv/gGcnm2DhRQRnMf6xoMc=;
        b=fKiUei81luLqDunXx0uXFyfzq9l+RZI+4d7jsR6KRIGot9KXcyMSJK2FTExt6HmKcc
         XntdaeBJc1d6fqQJnymjqu8PKa8fc4nYa4fqG7eX/JsMdNMlJnBVy852Gh8q62ybyEOb
         mZVzq9KFeNtxxmgR8LbklUU+QhZ8ilj9czecGgSv+H09YZU9A32RfbQqILHXzIh4e9dh
         5dR32UkV6vDAqKEp9NyMk9BcmFHAH2R3cEK5NXPu0IIf8stJlAoD184ByPZS/ZR04p4Q
         VKvSyERo5fEQrYpfPL59OccEBoQY79qRWWj6eXQqoBCRb04YtKG9ffKtcUyypXJntSkr
         schQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913856; x=1794518656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXM9i0x2nDS9j+rZWPBPawv/gGcnm2DhRQRnMf6xoMc=;
        b=vXsWdRt6FMft/u+qn8OJnupIl+wqE2Lx+p20IVMLFRC9xPqLtA9BzE/bNvdvPKx5cS
         fqvzN+ywsy8oe4dq4OUmr43WiUBBOLBCf0IsfzvKVKa8uWLvzT0AcnGj0gUSwTykl/cT
         UlqdSjPRUJkytRYEraYsc3/ZBJGjXrC3sXL/WU4yYYkCf7rYXNgGvNU4cA5wGVgbzZ4G
         LWr1cdZzaiOO9mE6Q2kSaJz+w3WZVwr/CA+8dephAhRloRroexUGyFDUz4eV8FnEyzih
         tGt2Uiyf5Iwau7PNpXhhXRXVpXmgZa0KrLwl7yaua1pS++Fb5qb+Ncdjsp6pidNb9bLn
         GPNw==
X-Forwarded-Encrypted: i=1; AKwUvBybGW5scihDkZvaXFl+9bzg8BTp25H1RiinDKsKj/JlJAJUGK1uD39zaQdgTJL8Fql0l/SHDo/FU2n5hBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z92x7N3qvfv6jKNm8yeJk1F/gI+J/lMWQLGso8i98DnSTBhcawI
	nkACZHsf2AMg/b4aekomFTJKaTGyBzR+JBr2RYU21l3tLppzXhcChwlxea08xn0JwLk=
X-Gm-Gg: AYBFou3wpMGuA0ublPfyAiCuhBUabzapGo76HJBlGCgpbcNVLUMsXsIUNlucYmcvcCC
	gXEu9ksL6LVB1PY6SOene77H3XIlBx0wU8r2UatHbs8rWN9C8rjgxPQU3ZHboYeUaRk0K2duNW3
	1Y9kjzRzTTkbKH9gzGKnYxBHq6OIrCVNjH/w6hY5ML/kwS521SNFloOIsxNHi1P/Q8xapE/8ExC
	N+b4hqN7kc6/NSWIprn5+B96GCG5cxRst8Mp65ajiauAMq40EIzwP/3ptK3l6Mo47Tz3qs+IVv6
	ip6Yj+40xnMF1UaPZHjXqTCy3LcEfe3FOwVbrIp94UH3xs9mZrRcG8ln2cFWX288ctZtTJj24hz
	r4zJErYApc0dApfJ1oa9KQpuA5mPl0SfWZwTtLhZ9GQhg3wbKdIUADjUmiqGCCIoiSk34HJRXAj
	KV5VeNb1aeQJ6u5HmVNoTopX5240qlU+RjbXqeR1Tx+wcWt2KVzana/F0+BqO/qjynhqr/nZIS2
	mkTncvkQFaNrMrGDMRRj8dp2DDm2o5icfn8yanDnvMdxC9mHgU3G4/CEdSl/SQdHphfsCxJufg5
	o7PpZg9GtBmr9C5N86RGWinh6vPSybS5iw==
X-Received: by 2002:a05:6808:14c6:b0:4f3:6c2b:5f22 with SMTP id 5614622812f47-567e105f241mr438912b6e.29.1793913855869;
        Thu, 05 Nov 2026 13:24:15 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm5349897b6e.3.2026.11.05.13.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:24:15 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@google.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] PCI: of: update endpoint ranges dynamically
Date: Thu,  5 Nov 2026 15:24:10 -0600
Message-ID: <20261105212412.591931-1-elder@riscstar.com>
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

This series fixes a bug in PCI devicetree handling code.

If a PCI endpoint function is represented in devicetree, and it
implements a PCI endpoint bus, its ranges property must be created
dynamically.  This is because the PCI function's BAR addresses are
assigned during PCI enumeration, and a static ranges property cannot
assume a particular static BAR address matches what was assigned.

The solution is to dynamically generate a ranges property for PCI
functions defined in devicetree that implement a PCI endpoint bus.

					-Alex

Note: this series depends on the patch "PCI: of: drop the reg_num
argument to of_pci_set_address()" found in this series:
  https://lore.kernel.org/lkml/20261105153801.435566-5-elder@riscstar.com/

The entire series (based on v7.4-rc1 and including that series as
prerequisite) is available here:
  https://github.com/riscstar/linux/tree/outgoing/dynamic_ranges-v4

Version 3 is available here:
  https://lore.kernel.org/lkml/20260924222444.1351466-1-elder@riscstar.com/

Between version 3 and version 4:
- Dramatically simplified the description in this cover letter.  See
  earlier versions for a more lengthy explanation.
- Dropped the first patch, which allowed a null pointer for the flags
  argument to of_pci_get_addr_flags().  This wasn't really necessary
  and didn't really add value.
- Indicated clearly that Andrea della Porta has tested this series on
  the Raspberry Pi 5, which uses PCI endpoint bus for its RP1 chip.
  The current statically-defined ranges property works for this system,
  and when the necessary PCI quirk is enabled, the dynamically generated
  ranges property works correctly as well.

Between version 2 and version 3:
- The ranges property for a PCI endpoint with an existing devicetree node
  is only updated if its ranges property has an empty value (i.e., it is
  "ranges;", or is not defined)

Version 2 is available here:
  https://lore.kernel.org/lkml/20260910021919.3421449-1-elder@riscstar.com/

Between version 1 and version 2:
- Included the first patch (which was previously posted in a different
  series)
- Modified the last patch so the ranges property is updated only for
  PCI endpoints having at least one "pci-ep-bus" node
- Rebased on v7.3-rc2 (and the prerequisite series)

Version 1 is available here:
  https://lore.kernel.org/lkml/20260813220717.1394644-1-elder@riscstar.com/



Alex Elder (2):
  PCI: of: introduce of_pci_build_prop_ranges()
  PCI: of: introduce of_pci_update_endpoint_node_ranges()

 drivers/pci/of.c          |  97 ++++++++++++++++++++++++++---
 drivers/pci/of_property.c | 126 +++++++++++++++++++++++++-------------
 drivers/pci/pci.h         |   1 +
 3 files changed, 173 insertions(+), 51 deletions(-)


base-commit: 8c786803613eb0d3352417509611d1db877c65af
-- 
2.53.0

