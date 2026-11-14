Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684880;
	b=mz8VwYnKsUJkjFRRtGxS+5HEywe703RUpB5nCyRolO3iwXVIREQXzrNyUoj1Op+d2+nj
	 CxQ0eU07MiUqI81uvwNRkaQ2Es0z7tBYkoYIBaf5dr1kOFN2RYUu3MLVBdDOKNSsdotV6
	 Ih62SxrapnpVbJ7s/UPYsWhGPX8cr3QPzv0TwMQKYVN6Z3qgqZBx1gtc4sRswEbYBLGUu
	 LRYECFb008YQkcG6XmpNmDfJ/CdUJiJjgIN5tvKeasqHCpM09/jmjoJwEYD8desJ1+KAj
	 0e8sbP65O+VS72szSBxVv7ocNT30gn3ruKpu//1gcsIOPJTtTJ0qToNK2h+4h2aC24w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qn36dnXShc4fUhcrYLZ1Zx2GoiXFD/fDCBgNyF4SH4c=;
	b=quia9wPBmv8Ub7XVpxROknBD2zYbg8eOi5ny3Nla+M7pQkfiJGn+97ImleSsrWfwL4h3
	 t5nJJv1bNWXOKlXpD9EaVmKIHm1hjfvINbS1pYkXTTIgQ+WH5opjsol0d+/lmUXkYbAn6
	 /7cOMghyaiysUnlKnOnclN+Pso97KllIR3JnC8B4/UBSFSLE1EPuNclH2BkGY4LgFuRaC
	 Xcvy33O1C1OdORDLlIrIyxADkQ9nyQxGQ16/Lp5gU/lFypNj4MP4UjCTdT/KMPgmskv/L
	 ePWlrrcJ/e4n10eca8Onoch/r+mYCMuEKFhpTMXwbXWYifEGEz6TMT/u+LGsVt6rr+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rRMlHQpd;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE9606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94FE9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rRMlHQpd
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso2703140a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684879; x=1795289679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qn36dnXShc4fUhcrYLZ1Zx2GoiXFD/fDCBgNyF4SH4c=;
        b=rRMlHQpd3xcMxRzce5C2JT6+g3EWg4pQWv9Jm19FsHZVrZCAk91SHCJ5jWyt3RHY5k
         jTNPEv8N26/vNZ6oQU/+Bm1dl7Wa8AhikSd9DZC2FkP7B5FP7VuY/6pSCinX+YbkuimI
         SI1zOH7nfmfr776cMeRjixgQr6C80Q8okIEGQVdNXOS0vpNJfyDp2ep+lqTkjXtnB9EN
         xr3/XjhVwTRmPyrsZH4B1e1P54fMOKgSziC7w0msS4i4P812CxFJAwSn4Pha2bt4/Byl
         /PljtDcYv59+LPtzQjZVBLI7Q4UO7EluQwPXLsuqMB+wUneTrvsnlw2iK0LAU+h5X2g0
         kb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684879; x=1795289679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qn36dnXShc4fUhcrYLZ1Zx2GoiXFD/fDCBgNyF4SH4c=;
        b=H6THZziqCfrDwVDH1bLPtex/pBozfU++ueJ6qhqGcrEM9ur9Ml7H7reK/Sr9CWlkqd
         RLOMIOjzk0pi7lYTkDmBtb5NNisRchiPBVw6gh0TdUQHEXy52lK+uJ6Tv59b9vCfGehO
         Pw/FZbKp03VfrARWkFH86trr/QeLHItuB5wSMcQAGfM5jVoCNntBNOLDtUuiqnBY2b6K
         pbP9XekbNiX3/GZD0gVnX3S5/GF/x4i5DgnMZB6fd7YECzy/pdRAbcpWVfrbjHqHaLi3
         rfrKpcTgFxs0npvfobkxDJJufODxETwbxPZfuyXkJtnOBUVz/e+DaquzMPSf4s8G/rea
         wv6Q==
X-Forwarded-Encrypted: i=1; AL+hErHdUjhTLCHgeKEW9bkX7/KyXs1gz9s9fruHP5bShXuYiwmeDmxG4PfANdrf3MAfjBVsuBU3+gROoyBRjO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O9ilAhyf9+DZFVO5FzI8RjZ45ryZ7NrPwhRml11XeXB3PZqIa
	j++LlTR0q99IefeVTsxy8upSf7uyiiv4yABopnm6ifJXhjKvJf5CSnmP
X-Gm-Gg: AYBFou3q2VmDNPSOZSm6LQMiQ8Gds779sz7SQFgc36ejwm9xUUwOw2D6sl9M5k/xVzo
	uauRS9JJ9paR4x0zd5UmSYSpGbVzRdI6es1Pc+F5ywCKzYghWlzm1Cd1SGzXGtFydrwj3r6A2Qb
	VPkD2xGUZj3h202X9tf+E1gLd/gYEgANV9pC6Byp3obVlxQhHkyDf/DH8NA4bJckoQHcRyj7FeQ
	lPfhFD9VSbD+sN66k3m6Rn5OMZl0VpbBy0Rfggc+Qvh20mI35OrQPFgUTWf8YEsgTmm9u5gZGZ5
	+Q2IoBKRmFeTUkPmHWwiKqdheHV+CxM8fZ/KwaeN9foKMFbA+3/8BJ5qJtpMVuq57aw+iYpEd+Y
	ChVIMNiRlQEaVNlOgsiEM+261HqPMSUwRswK4qvNnk70pJMoAwAM9rEv7H2gqYpRP0MDDeM+FXT
	3NRo+Yk6S+xDkeBpmrR4LR4PBz1ye83mS2IMaRG3VEXuey4KgPHg8+u2wZaq2Uyw3uCR1V4k6ay
	vzXEv+K6lUOoZpnEexkNCfWi5sLxiUqjo7+g2zy/g+18SuxJK+lFFIqQLUCdC78sonN4pQuXhe0
	YEWzzipJS0adViE4uqtdc3ZvFtRZU9M8gCpxvzTQMdZeUBMi2G2EQQbBzmkvw+xmIVB54eD1O10
	8AlahhimVKgFl477u1hCTAy2rP3rOhJXzcTU6QAYwFbhUHtCZXAIlQqGxZAfNDqr9aeKwzL0csa
	3Prba44XBeUnMAjb0MrtRLDBTejtgl+qLdLrnKhhVu7qVcC2wKJ95i+L3uvpqddg==
X-Received: by 2002:a17:90b:548e:b0:3ac:9df3:6b07 with SMTP id 98e67ed59e1d1-3b1b0b8c31emr6819520a91.24.1794684878851;
        Sat, 14 Nov 2026 11:34:38 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm5093969a91.1.2026.11.14.11.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:34:38 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v2 0/4] tpm: Cache ACPI TPM2 start method and gate tpm_crb_ffa probe
Date: Sat, 14 Nov 2026 19:34:30 +0000
Message-ID: <20261114193434.117714-1-sidchintamaneni@gmail.com>
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
absent or invalid).
Patch 2 checks tpm2_acpi_start_method in tpm_crb_ffa_probe() and
returns -ENODEV unless ACPI advertises ACPI_TPM2_CRB_WITH_ARM_FFA,
skipping FF-A probing on non-FF-A platforms while keeping modular
tpm_crb/tpm_crb_ffa loading intact.
Patches 3 and 4 update tpm_tis and tpm_crb to use the cached
tpm2_acpi_start_method value during probe.

Changes in v2:
- Expand into a 4-patch series caching tpm2_acpi_start_method in
  tpm_init() and converting tpm_crb_ffa, tpm_tis, and tpm_crb to use
  it (Jarkko Sakkinen).
- Move the tpm_crb_ffa start_method check from module_init into
  tpm_crb_ffa_probe() so tpm_crb.ko and tpm_crb_ffa.ko still load
  cleanly on non-FF-A systems when built as modules.

v1: https://lore.kernel.org/linux-integrity/20261112233807.70664-1-sidchintamaneni@gmail.com/

Jarkko Sakkinen (1):
  tpm: Cache TPM2 start method

Siddharth Chintamaneni (3):
  tpm: tpm_crb_ffa: Only probe when ACPI TPM2 uses FF-A
  tpm: tpm_tis: Use cached tpm2_acpi_start_method
  tpm: tpm_crb: Use cached tpm2_acpi_start_method

 drivers/char/tpm/tpm-interface.c | 21 +++++++++++++++++++++
 drivers/char/tpm/tpm.h           |  1 +
 drivers/char/tpm/tpm_crb.c       | 19 ++++++++++++-------
 drivers/char/tpm/tpm_crb_ffa.c   |  5 +++++
 drivers/char/tpm/tpm_tis.c       | 18 +++++++-----------
 5 files changed, 46 insertions(+), 18 deletions(-)


base-commit: 912c3bad2eb993eb3e83c2689cd4e17361ef087f
-- 
2.45.4

