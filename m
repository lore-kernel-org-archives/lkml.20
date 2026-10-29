Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297755;
	b=W5V/c8H0T51uVVp8OVjU2RENCyePs5Xzuo3AMK+Bp/TwmZdvrt8B3fBx47hjsuvhsjLP
	 aUSzsP/mcKR4KBdmWbqVeVxIvz6H2wSJ5S19vZ8C/4f5SrirhzJq4NLRg+tlRD9Ti1m/T
	 kEfZZi8QJ3mP3dRSDcEDIoOpNGPl7yXmWocm8odHLXpo9Rcq8MYaVo0/QOUVzFvgRkihW
	 i9QNS1DXhxRftTgjYBsPXiCCeyzSALjw5qiZtI+CHxXfSJghrtBFN4NV3bDCQo66Vg91+
	 uRyB+BYTRMl/FbuN+2Ty7v8t6rOn9X3HFxPsEzGy+XtRmZ5Oy6PmQx/+qbWML2CUqww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297755;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:Content-Type:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nm3DyYmQwwN8ivVQeFLvPuaFwX0wAYrPypwdIL897m8=;
	b=enFPPYWf8JMd2kgkQSMBBwV+uKY/7XaooJrTbdS21V6NCedkYV+woNYUDOELzfzMqAXq
	 6Hpz/dQoPCQoX/qpNfbCtv3p39yOla+7hXyBq8hn4ZsVT0pPN/1A5ljofrOqbMwL86yH9
	 dmGEpzj0EBinxEldQTN1Py9AijDW2a37IPNQZ+KHtG6fZUW2tfHONWtrNvTJV3GLbxFnj
	 0CetJKeTPoa29GTHPSH93nm/Xb9MawcArsWQ0jJ7Kx5itGU6dSpwmiJHjcTRdLYXUFMFv
	 k9dp0J/hJNq2eRAw23ahpya9QzNk/FlIopA37EA+SSsrzZQaxlxWHO73phpLv9w9b7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ayd1Ybew;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=e3aHGZMu;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92002606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92002606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ayd1Ybew;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=e3aHGZMu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793297753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nm3DyYmQwwN8ivVQeFLvPuaFwX0wAYrPypwdIL897m8=;
	b=ayd1YbewfmFCYJwG/zuJWlTC6F1wwTlluCsCsvByfiODH3dBCpzBkCWLD6ddWeSzfZJLw6
	fP1OrkZccmIh0AF7wdrvdCHRCRCa/pgzRrBj1IGVWLJ0URPOFiJJi11oRQaznGmNro6e8d
	gwnO7pwrSyBn2Zt3qMtu3km0yO7wiD8=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-NQ3e_bTeOey_ZVLD7fziFg-1; Thu, 29 Oct 2026 14:15:50 -0400
X-MC-Unique: NQ3e_bTeOey_ZVLD7fziFg-1
X-Mimecast-MFC-AGG-ID: NQ3e_bTeOey_ZVLD7fziFg_1793297750
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a26fe9521so979483eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793297750; x=1793902550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nm3DyYmQwwN8ivVQeFLvPuaFwX0wAYrPypwdIL897m8=;
        b=e3aHGZMuFBYsLWALbK2afwadqK22umr0GncxNAs5pKEs2kv/+jYtF9NLwKn6fv3gxE
         BuFaFe53Bt9CxNGbDZriSgnJEXz6Q8C78TPR9va8QzXPD4PZf7bVHoh0pJs8TJWqGJBG
         7EGmBClfeu2ibH/frUXTCiE1N19LPCGJa5dvOr6+ZafBTwKEortjxkspXN4ZTpLgwW7H
         MTrGwK7c9p30LB9qTUAoT7Qj1dIX7naVvvQ9xPfG9/WiJaLDvrcooBSgSb2y8jWc1yrO
         ZRNb1jTQCTy6Jc4WV8n2AlAq7tF+/zVm1slDaEKTMS3p8tY8nnQP9mV2Fgk8dmeaJk0g
         W+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297750; x=1793902550;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nm3DyYmQwwN8ivVQeFLvPuaFwX0wAYrPypwdIL897m8=;
        b=UwXdoj0Ofy2Yq6c09oRz3uVbx0sP8wEXDPYqO77B31ZbIgdKRToqYtZCWzsWnm63PZ
         4KquInsfO6W2//e+HgHsGHJA5HOMajJ3GgjkUl7iUSfM/C4CYdvs0AZGVTii/s38SoYn
         J/IGJmPjjWnpHs4DgTHjURtfjEqXF3Y+8EPfPF+T8dFV6pcD/8eskXY5DByvuJqMF3BJ
         WyG6bEPtsuRyfAPnR9f9wJ46rM2nmfzjmttyPuJVV13B+AaZM3wOyDeBphgwIuiENYI4
         8XfjCbuqOeNfd4oKfkltWBS6WiDgjZAD+8hUhb03rgpHmXeYvVcBvC2DIqhnCoYqJo/R
         3AXg==
X-Gm-Message-State: AFq9FYLBfnvtoTirYHkc4GH3DhJBPVzJtmfsdqBBilpoKmbWBdakg7pw
	5fMYRcair3Yo0y6KMb9NbM56cKf44DUF34vVMQRH0FIZYWP4o6psNog5a/Bb5aZD+yW3BtnM9of
	bQ+oyvAUSEL2SWW/B8BtdF5yV7ItGLdHj3K8RM00vm7OuESFEgF3oz5PmhzaDVR8cY0q8mRCojE
	gX8DXnbQygFmz5zqQh5aZutVWZLkWOnCUigjEgFCqlwGOrkkwl
X-Gm-Gg: AYBFou1FOqRH+IYy416FlDzag+yDQwj9AHI8luUKV2aCcIbkFlXRQij7V6eqysm8uW1
	+FW8ho0PrCm+qCEYfqPgkvAKdlE5nyeRGTnrXa0lTRDiiKEToDpteays/jaMMhO3rLsN/rj0m5m
	fTtIV4Dwnv7fx5G3OnVxG2/TT2M3vHgIA9hCiqQoFy+N2USdeqxMIn49s3EVraXcS0P1Ar0EQ0W
	amNQSwtcfmtJb4E41QLTTd8WcsiEV4BEt14Qv596er203czYxDJE7gdwpnH5asdvpK+20gwSwTV
	ZiX7HsBCbb/gMkZuKqLB8A6SuYEkCjCyLpZoxwP5aqhfpVoWDHjGwwjzF2QjpRZKynsB+hNEB8Y
	mjWetLZVncjotLqm7nEobDhxHUy/w8mBx/i83eNZyb9Z1RE8cQY5b2gzMKoMcI3oGkW6LBCYOgh
	nT9TtLdQiaEmgtOg==
X-Received: by 2002:a05:7022:f907:b0:145:ac96:3917 with SMTP id a92af1059eb24-1a94a3408aamr3771867c88.21.1793297749346;
        Thu, 29 Oct 2026 11:15:49 -0700 (PDT)
X-Received: by 2002:a05:7022:f907:b0:145:ac96:3917 with SMTP id a92af1059eb24-1a94a3408aamr3771818c88.21.1793297748355;
        Thu, 29 Oct 2026 11:15:48 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm259163eec.4.2026.10.29.11.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:15:47 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Peter Huewe <peterhuewe@gmx.de>,
	linux-integrity@vger.kernel.org,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v5 0/7] tpm_crb: Add command and response buffer chunking support
Date: Thu, 29 Oct 2026 23:45:34 +0530
Message-ID: <20261029181541.99505-1-armenon@redhat.com>
X-Mailer: git-send-email 2.56.0
Content-Type: text/plain; charset="utf-8"
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

The new version of TCG TPM v185 [1] supports sending data/commands in
chunks for the CRB (Command Response Buffer) interface. This is in line
with the initiative to support PQC algorithms.

This series implements the logic to send and receive larger TPM
cmd/rsp between the linux guest and the TPM backend in chunks.
Currently, the TPM CRB driver is limited by the physical size of the
MMIO window. When userspace attempts to send a payload that exceeds this
size, the driver rejects it.

This series introduces chunking support. The driver now checks the CRB
interface capability for CRB_INTF_CAP_CRB_CHUNK. If supported by the
backend, the driver will slice oversized commands into MMIO-sized
chunks, signalling the backend via CRB_START_NEXT_CHUNK, and finalizing
with CRB_START_INVOKE. Responses are also read back in a similar chunked
manner.

If the backend does not support chunking, the driver retains its legacy
behaviour and enforces the standard size limits.

This feature also requires the QEMU to interpret the data in chunks and
forward it to the TPM backend and subsequently dispatch the TPM response
in chunks back to the linux guest. This is implemented in [2] and
already merged into the mainline.

The whole series applied on top of for-next-tpm (including prerequisite)
can be found here:
https://github.com/armenon-rh/linux/tree/tpm-crb-linux

[1] https://trustedcomputinggroup.org/wp-content/uploads/PC-Client-Specific-Platform-TPM-Profile-for-TPM-2p0-v1p07_Pub.pdf
[2] https://lore.kernel.org/qemu-devel/20260601215410.517009-1-stefanb@linux.ibm.com/

v5
--
- Split [PATCH v4 06/06] into 2. The preparation patch separates the
  no-chunking send() and recv() from chunking.
- Fixed block comments to respect kernel's preferred multi-line style.
- Added citations to the TCG TPM and NIST FIPS documentations. Explained
  the logic and newly introduced registers in brief in the git commit
  message.

v4
--
- Rebased on master (or for-next-tpm, both point to the same commit).
- Resolved one conflict in PATCH v3 05/06, as TPM_BUFSIZE is declared in
  include/linux/tpm_command.h.

v3
--
- Split patch 2, so that the code is cleaner.
- Re-order the buffer size adjustment patch.
- Rename crb_trigger_tpm to tpm_crb_start.
- Add dispatching logic in send and recv functions. Chunking is
  separated from no-chunking for clarity.
- Increase TPM_BUFSIZE in the common file include/linux/tpm.h following,
  [PATCH v9 11/11] tpm-buf: Implement managed allocations
  https://lore.kernel.org/linux-integrity/20260125192526.782202-12-jarkko@kernel.org/

v2
--
- Add size checks before copying memory.
- Update TPM_BUFSIZE to 8KB.
- Commit messages updated to indicate motivation and logic of the change.

Arun Menon (7):
  tpm_crb: Add register definitions of TPM CRB chunking fields
  tpm_crb: Split start method into a separate header
  tpm_crb: Add start_cmd parameter to tpm_crb_start wrapper
  tpm: tis_i2c: Use local 4KB buffer to limit memory usage
  tpm: Increase TPM_BUFSIZE to 8KB for chunking support
  tpm_crb: Factor crb_send()/crb_recv() bodies into helpers
  tpm_crb: Implement command and response chunking logic

 drivers/char/tpm/tpm_crb.c     | 226 +++++++++++++++++++++++++++------
 drivers/char/tpm/tpm_tis_i2c.c |   6 +-
 include/linux/tpm_command.h    |   2 +-
 3 files changed, 189 insertions(+), 45 deletions(-)

-- 
2.56.0

