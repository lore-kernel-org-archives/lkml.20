Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794706500;
	b=km2hqpveayKkWtqF5TeZQ+dWmOZyTrF12nBK4gP4e6Ksl6fjt56Z7iOBKi6khsxUJ0Oe
	 rgIU8RAde8d9K4hE0b/3bvSw5ne8FhQJZ7z/QmgGO5vWNaxjLG/nCfI+Mz/b+L+aJ2sw5
	 Quv+wvhMWgk4fk0AacfSPKXlwJwuK32nO3XH6du+Gx5bGKoa0GA3tb3VIiuBNOzJnEXbS
	 duURmyNjgGbKSpU/4mstiHddyqB/+18P0dBuO4bWzSDk9dBrgbyTEolPfvsk4TU7wP+dp
	 yYcWXx+n1EE97Z6F4V+aBQJHtHpEfDbuNfqo7tMOB+hJUhKp/JD9Ah6ks2yaSiH4iLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794706500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OczTFag+4rrpYiC7SwR0JFMdaa1DWemeh7STu5Jts6Q=;
	b=okDpBwrXl+Jjco6szYrvPxhv2D2CxzzU1QLXoKANEHBatKinyEUNFdcq9FRyHtD59p4i
	 bSE8TssIFby5UXpR+uDMDrr+ErkN7zr+g1yHtv9fbNZFKyUen2NznJzJR0znjH0wjfNKp
	 wLUK8w8nF87w3Wt0UdELgCXNBYa/s8ejB+PoShMovK5qphY0480XMNJXorRiXdQzrc20W
	 tiHGUwTY5MVgEMNlRpKWt5NSpTvv962hv0QW+IPABw9KKAw66a4kHi7+FKy9xUjmjcVJs
	 WMNi1GOKV6jf2cXLF2e9HZMVSo/J2kalb/Fkp4xlsCpTLZiTF4i1+IFjystw+Zr/cww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eRMikMdE;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C184606A33F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C184606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eRMikMdE
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e987a2ba0cso12383335ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794706500; x=1795311300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OczTFag+4rrpYiC7SwR0JFMdaa1DWemeh7STu5Jts6Q=;
        b=eRMikMdEzKDARPSpg40y/hYEod3qTu+9jV9ibYgtAcaPEeQb+6r4XjXEr1rR5DUmKJ
         UN7qX/dL9Q451OFC206rCvr0htXc8ihh8+CIunjseBO1Qj+uSofuJlXFHQCj3n51O4gB
         Wa1wiQKAWB4fRd6QqPQ4AJ6TJ/GDj+zlMxatLqlmecR95yi7C5OxcIC9mzvfO0vp54WZ
         egrXTmIgFN57tkACvP/M9BYaWgj/pJ5agFKdRdsy8MQrYNP9TxFKVjhAujikujSI1MdC
         DRzHm51qMfW8DbqBlhMwHILziOHSrrSQu2XfogXU86g14xv1jM6UHcV8XZ+pdoGwgDMf
         bbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794706500; x=1795311300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OczTFag+4rrpYiC7SwR0JFMdaa1DWemeh7STu5Jts6Q=;
        b=LwzMFTQKKEOZ3QmoxBgDR8+YX42s6vIXiZLmEhWxRN+g0PqSV3v0EZB89f8V8sZf7X
         TuLMY25g8QUh1ch3wX2qgO1G1zIJl+y1FgAtqPxumYA18tQhiM0u64HiZ3ipjGkQf3Zg
         J6PbvoYXBOprtzMpSbd6cjecJKbhYCwizW6OpeMz0tO46ieXFVUmHoY1XwfPgNOj4Iq/
         2rFZ3Jf5cDAqjOjmU4Vj/qtSuW0bf12I1m4a85/LY2dPOAxuogSdwGVsOLGBw7lGyfzx
         3dH4YAe8C6R9oEtLJ+IcR1VGUUQJ9XMwkTxQ3XV6ToFke0KxkjvTG4MnxVM6cwF/mlWO
         E3wQ==
X-Forwarded-Encrypted: i=1; AL+hErHz5F5IwUXqG2o1WVKXe4mZhfbo5gR/2AN2oVPzIx8qY5/rLErhU6PMYEbfiaKmxyF4e/U/o22GD4ijrl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mhw3mnuJeJDKAqyFb49fpreSOb1IqZw+VFls5FW5uEIodVlRC
	vaZJo1IhEtPS9MmPm4D2Cwn+xw38ZZME22kPTqcgqL3ZAgj8dbbCih3Z
X-Gm-Gg: AYBFou1m21VTuB9kKrgBo4gwiV+AZJYyjKUC83yr178dYKiBcqxRf+GZYGX2r3cD3BG
	sBw7BPQSMWg1ZP8qTsoUI+ppNy6riA9yJQ2lY9cUB9WQc2sTqAGvQYLD0dxjyJ3yN2HnZFVdcu/
	ZMdaW6prtdAjThgmhC7hKlTK9L2Jmk7jXb/U/JBz/A1LU6ABPPklQ+5oenL+j3gkwZklekwADae
	gEQs/OT5bxSAKqVfnJk93BLPHGIf5lJ5XdQzxd3TehAhOmk5Ny3Wl/oN1n5O5iaBBrOvjON95vH
	VKdpZX/nSzELTGCOZvScKVbXrzOTI7uRcZ51UYcknykf3Xk3VZPgqh7wl9Y5eGL4kQFbF7A6oZX
	0yTRWikm5Tu2Wy40L4K1a3evl4nYRUdL8go7TRuysowzyUrvqODrTv2/u69anist5dI/RimN4f6
	GftNIVAKh2agvVdwPzEeRN+XDYdDyUrhSeHasYpH3A0kZaHyIikXKmIe7LtfE3B8jgJzg5m3XI9
	g6EbiLdJYh4TqTaao075QiGUa9LBbliLa15fiQFJEUy0EBGzQ4/15L0vW0cQvHHB/+WBO+gfMhH
	3a7j5mzQ1ZU5iHzBloknHF7UGNXrwj64VjyHA69bK1L1m7JlbOlKCwhmlzNGhP7LEGG4NTfscBl
	ZKz/piArnGFM7dgBXuEwdNM5jTy3SkyOylmngDjIpuEAZDZ29kV6DgbdQIHA+1o1MpAgpcNug5N
	4nG6PIeJMQFe9wR8lBAv82O12HFj6VZsWhL1zlEGpG5CZgJx0qH0KV72COtj0+Fg==
X-Received: by 2002:a17:903:3c2e:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2ee0dc05bc1mr66811655ad.42.1794706499678;
        Sat, 14 Nov 2026 17:34:59 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75dde9sm23671935ad.22.2026.11.14.17.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:34:58 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>,
	apais@microsoft.com,
	rachelmenge@linux.microsoft.com,
	hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v3 0/4] tpm: Cache ACPI TPM2 start method and gate tpm_crb_ffa probe
Date: Sun, 15 Nov 2026 01:34:52 +0000
Message-ID: <20261115013456.212141-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series caches the ACPI TPM2 start method in tpm_init() and uses
the cached tpm2_acpi_start_method value across tpm_crb_ffa, tpm_tis,
and tpm_crb.

Patch 1 caches the ACPI TPM2 start method once in tpm_init() into
tpm2_acpi_start_method (defaulting to ACPI_TPM2_NOT_ALLOWED when
absent or invalid) and logs it when a TPM2 ACPI table is present.
Patch 2 checks tpm2_acpi_start_method in tpm_crb_ffa_probe() and
returns -ENODEV unless ACPI advertises ACPI_TPM2_CRB_WITH_ARM_FFA,
skipping FF-A probing on non-FF-A platforms while keeping modular
tpm_crb/tpm_crb_ffa loading intact.
Patches 3 and 4 update tpm_tis and tpm_crb to use the cached
tpm2_acpi_start_method value directly.

Changes in v3:
- Log tpm2_acpi_start_method in tpm_init() after acpi_put_table() and
  use a single-line acpi_get_table() call with typeof(tbl->header)
  cast (Jarkko Sakkinen).
- Remove check_acpi_tpm2() in tpm_tis and open-code the check in
  tpm_tis_init(), dropping dev_err() and returning -ENODEV (Jarkko
  Sakkinen).
- Remove priv->sm and local sm in tpm_crb, use tpm2_acpi_start_method
  throughout, drop the probe dev_err() messages, and return -ENODEV
  (Jarkko Sakkinen).

Changes in v2:
- Expand into a 4-patch series caching tpm2_acpi_start_method in
  tpm_init() and converting tpm_crb_ffa, tpm_tis, and tpm_crb to use
  it (Jarkko Sakkinen).
- Move the tpm_crb_ffa start_method check from module_init into
  tpm_crb_ffa_probe() so tpm_crb.ko and tpm_crb_ffa.ko still load
  cleanly on non-FF-A systems when built as modules.

v2: https://lore.kernel.org/linux-integrity/20261114193434.117714-1-sidchintamaneni@gmail.com/
v1: https://lore.kernel.org/linux-integrity/20261112233807.70664-1-sidchintamaneni@gmail.com/

Jarkko Sakkinen (1):
  tpm: Cache TPM2 start method

Siddharth Chintamaneni (3):
  tpm: tpm_crb_ffa: Only probe when ACPI TPM2 uses FF-A
  tpm: tpm_tis: Use cached tpm2_acpi_start_method
  tpm: tpm_crb: Use cached tpm2_acpi_start_method

 drivers/char/tpm/tpm-interface.c | 21 ++++++++
 drivers/char/tpm/tpm.h           |  1 +
 drivers/char/tpm/tpm_crb.c       | 82 +++++++++++++++-----------------
 drivers/char/tpm/tpm_crb_ffa.c   |  5 ++
 drivers/char/tpm/tpm_tis.c       | 45 +++---------------
 5 files changed, 71 insertions(+), 83 deletions(-)


base-commit: 7e52fc165aa50e70e8df3c879d04fc0ff1673d4a
-- 
2.45.4

