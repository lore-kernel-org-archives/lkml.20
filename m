Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688331;
	b=YhGzcQssqjH+2piFsKpPQ6BLnBN5gspJxF8AobKka1SARLPD8Cd/oCm4ZL0uPHiMXPMd
	 NX4lTDhtTkHeGHBf5YLUwvc2HQKYYjx9DubyubRkdsS9MZJ2+U2AocUyOq6rBGVuAwfLH
	 laY0BfUMFxMluN16zoKdZ8eWPJ+6iR+YKLc2rMdYeVyEY5UL7e2qwmxepXmKm7uXYrfDm
	 IDKzDpy5j98mTs51cUl3z6vtuUsjg3YdN+x1SZmObLHD2LjOcBidNXwFG2/dfb+4LAUI8
	 upAZBxvlg5u3wjg1STpNkMANmoKskLs59XLWwBcAF1K2Qhae+juXRBCGeV2WwAQZHfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kpOt4UmE34zQC/DX62zHDyPBfP69CykHM4P4Um1qwuM=;
	b=raORgPc8dR3Ne0kzqDtzkUzY+DqEH6r4YLXUGoReJsf98KdP4Z9luW+S7Ytls0xM5a4r
	 RPIs+a523v/i34OWp8HztahWyH7NDCQci2L8n268sOgGpjiXJ8mvHDQHWQjvVgWdanqgN
	 s5+X3RD7FQ6O82/xRxLphMcD7GBFcaOBRn8QaiYjWXiUuBacsxQAzpHdbsUhzGqrL0a/s
	 dIsE315EAW+Uev9PiG0tSTu/79wWFiT6XGQ83/mpnzdI/ehLsYu5qI+dBZzrrXlYPMH9m
	 cBOcDxFUvZhrtkyuTvKtNzN6gyGzVzm0IucZEMnYSjezV6QM6iDgtXjPKwR9TuxG27Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=eQRcHZvR;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22217606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22217606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=eQRcHZvR
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1931ff67a29so2702790c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1792688330; x=1793293130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kpOt4UmE34zQC/DX62zHDyPBfP69CykHM4P4Um1qwuM=;
        b=eQRcHZvR2vd9ZIlpOH12y640m9H2xfPxm9TswHnMTQdHUoqdFjEZvYpAfUxySnpznM
         Ct1fnWck5tZHcH7DYwVIplagroS9AML3MEcIMtLvNhXbYfkcpdb7rSh0KVyGspQsNq2I
         iiN6n7n0TPoO3XUj79+oKa6ESqi+hbfz4hGZTfsEpJR4tdT5TpvgXioAab2N8zXDW40q
         Cx7vcalkW9o7vGWXWChDD5/FTlp28bUydovKVNvaL6aoBmTh5fYbFnztkjeldTE9vk/F
         lzcSi8cpTvUBHeomTbKmOAqhZHRxjDlRPZ9ZOPiaiGUuF1+8XSRXz0V7WjCKA6ugdwSZ
         m7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688330; x=1793293130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kpOt4UmE34zQC/DX62zHDyPBfP69CykHM4P4Um1qwuM=;
        b=iR+nXf/E3Epf/My48U8TQKPe4BIfrj/apUarIzf9uU4ZgK7VLqQ+8nz1FkzE+yJyo1
         tv6wUNtCoUg38w7EPT71RnEzR6wed7C8BJxLszN/VdD1Woi/nok4iNp6lozmqhoNuvMo
         ZtTyh0P0RQy3m+fbmDqRmqm6+E1zBf8AlhFFU/cRF1LX61cjIQfMtqBFAA/E+qqWfiiA
         4XFGR42qxKPCnyO49dlKQoWXhmhwZpTshCWcoF33TpFIuNQVJGnr73S1wD7U9kbuFeqO
         6VNDI1Dk4Q7EEoRljIZlillXUMrtNFMYFyIKSQr4FlT0yaOAdA4ohI1cT59rBWwcOXBn
         EViA==
X-Forwarded-Encrypted: i=1; AKwUvBykszmVyKCkc1JXSNegiGQS/xVFPbw27RO4ssG4UA2EEnStxyi2B73oagmaUm46AF6fR7YoCPJ2++JiENY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVYtlyN/WIDc8gK88HMbrBc9ta8Ikbz4nxVBVy84m1BOLlqGNi
	NUewRfSy+TwlAulHFzTGZaT/+ILYAKcwiAABEtjnbVdTMyj3tVkLbVY1GfN7m/zDvQ==
X-Gm-Gg: AYBFou3sGueKR1+uEHadQvg22C2T4eqzDZGgriCGQEfPV7qALsbjB51p+3mXLjsceX6
	VXbrM/ejaiCsLYJjOdYfkTrviy7Yd2MU5T/xMlMDpPK5e+t8O1pgs7kPRPc471zUGQ1WXPSbuB8
	CrtrPfjv5IScCpoOCTJNCzaJeOlf66XsQMJWAfvBRLCjgV7ItV+Pw6g+8z67A7bpz2g9Fz74yhv
	ZNpGLtoFBoFJO/Kfo8Olw/XDAYQVZpHgPJyARX/JNDmAtFF7mJyvGQjA52o3s1DjEg3UQkWA9PT
	5p3dZNkmClBCCmj+Yk0mYkGX5JQFe3AEXdKr7zJFw2D/xjDSX9DfPp1aDwrUFA6ZQGi2OZdKA/f
	qf0JyVoaM3K9Ca4Suez3nSFEaMlpcFTkRb3hQkWxmrqsRZowglZb2cSOI23J1++NPv2BjQ27S7k
	WVRBeUCfecSx3rA065lvRWh45i31jADfSPthcRYobhpCw3kjMqK60Ua96OYzrRrQbxbDT5bs9n8
	k7kco2IK2uWUoihq4fMj79N2U05N7zKkYCYUeGvNiPOfVennMk4S8Z/MyUa14xJnUIudpwIRog9
	/uieY9aUNX8/A5NOwoPzp+4mXnVQt9/aNKY=
X-Received: by 2002:a05:7023:a81:b0:168:3243:c911 with SMTP id a92af1059eb24-195a0effa19mr34185c88.37.1792688329950;
        Thu, 22 Oct 2026 09:58:49 -0700 (PDT)
Received: from yurypm-home-4hjc6.sjc.aristanetworks.com ([74.123.28.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d3ae06fsm15951151c88.19.2026.10.22.09.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:58:48 -0700 (PDT)
From: Yury Murashka <yurypm@arista.com>
To: bhelgaas@google.com
Cc: rafael@kernel.org,
	lenb@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mahesh@linux.ibm.com,
	oohall@gmail.com,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/2] PCI: Add boot options to disable DPC and AER recovery
Date: Thu, 22 Oct 2026 16:58:40 +0000
Message-ID: <20261022165842.1463451-1-yurypm@arista.com>
X-Mailer: git-send-email 2.51.0
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

On large modular systems with a complex PCIe topology, allow userspace to
inspect uncorrectable AER errors before Linux attempts recovery and to
opt out of Linux DPC and EDR support.

This series adds two PCI kernel boot options:

  pci=noaer_recovery  - Retain AER logging and correctable handling, but
                       skip uncorrectable AER recovery, including CXL RCH
                       callbacks and recovery of GHES-reported errors.
  pci=nodpc          - Disable Linux DPC and EDR participation, including
                       ACPI negotiation and EDR's DPC-enabling _DSM call.

Firmware-owned DPC settings and firmware error recovery remain under
firmware control. The two options can be selected independently.

Changes in v3:
  - Patch 1: Check the recovery option before dispatching CXL RCH and
    ordinary PCIe errors, addressing the CXL callback bypass.
  - Patch 1: Preserve current GHES cleanup and device-reference release.
  - Patch 2: Add pci_dpc_available() and use it for DPC services, ACPI
    DPC/EDR negotiation, and EDR notifier installation/removal.
  - Patch 2: Skip the entire EDR registration path before its enabling
    _DSM, and prevent native-port overrides from defeating nodpc.
  - Clarify the Linux-only scope and rebase onto the PCI next branch.

v2: https://lore.kernel.org/linux-pci/20260709185429.627968-1-yurypm@arista.com/
AER review: https://lore.kernel.org/linux-pci/20260709190616.DF0CF1F000E9@smtp.kernel.org/
DPC review: https://lore.kernel.org/linux-pci/20260709190730.E19A11F000E9@smtp.kernel.org/

Yury Murashka (2):
  PCI: Add pci=noaer_recovery kernel boot option
  PCI: Add pci=nodpc kernel boot option

 .../admin-guide/kernel-parameters.txt         |  9 +++++++
 drivers/acpi/pci_root.c                       |  9 +++++--
 drivers/pci/pci.c                             |  4 ++++
 drivers/pci/pci.h                             |  4 ++++
 drivers/pci/pcie/aer.c                        | 13 ++++++++--
 drivers/pci/pcie/dpc.c                        | 24 ++++++++++++++++---
 drivers/pci/pcie/edr.c                        |  5 +++-
 drivers/pci/pcie/portdrv.c                    |  3 ++-
 include/linux/pci.h                           |  6 +++++
 9 files changed, 68 insertions(+), 9 deletions(-)


base-commit: f4319f548f7d8cb595ac1c91bfd459876399eeb3
-- 
2.51.0

