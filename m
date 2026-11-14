Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794624537;
	b=yAW5kyY94+t0XB7dnCt8dCDlg8/EsvBI1htFvuMH8bN6FN3baSKohJBcnDa/H9DvXxXf
	 SlyenCHXAMddGE9FxV8Db73SkmD+cq4Z6JAoSgmIFZkCIKMZWcUwo9jDXPIyfCoFGNgvj
	 41el02u7fHcTQjL5QSDlSWyiD+4vrzgrtruFc63M3x07dV1edaR6+tJ6uXlbRMOzZheMd
	 5IVBHxmI8vR5O/BrUCbekgPZcomSxOxJo8QODAViR+SVxmPUhkeXrUrNaDAn/ecm+50Or
	 pQlQjxobcocGKB7sEXITkaP6F1nP1AMKaAUUwXbLue6m5vrhg85JHJCpFo3FSwAKjnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794624537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=GZZkPVMPsjWcEUjtUrh2GVbJUPQ1+IeVSSnWwxSE3ag=;
	b=RtK/WvOqjw2+ErMFsDWizj4m/JajRhCfsAKaHjb+dLNtptJrvWOO3l4QgHKdwWRHl2fc
	 JBbK498QRLdSmSukKcLceDjx6TOUeUiQ2JcjdUS1hgQrC1VVVgyl6Khuz4MZeG1Fx8Umw
	 JYzQmBRgegOgM8CQ6nggyrdd4upswPyhchgDOHrQbWqLo3txI3t3FpUv8O+0DAMu+yQ4p
	 TmmCC+jTQV2fuMoA6ZNanV/7RhezcxTczv5DPWVjNEeRL3lwpm+o3MeYcxPXWz8fzs+e1
	 pgv+Rh0LPImbJNYv96+KrQ81tHMJ6ybIHN9ElN4n53z078L3GCSWsdtr48O5+k9uocg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=in9iqHN0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59BD606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A59BD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=in9iqHN0
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so355737666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:48:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794624535; cv=none;
        d=google.com; s=arc-20260327;
        b=g+HxUKiwlBJ+tm+wE2ITkICBujxy7jzx3LHBZQiZ+5gr2yRHlzCojPm45/dQnRXFtm
         PbRstZ9KmCFis7HUtpW1FekAvL/3EZLoaxSp2+nOT1O4V4BmcqRoXeKeACpqJWMTXOfq
         0IhvT2Yo01+beHpM+Izn1GZ0nrQRKaHMyNWPcFitrn5nBac7AlRxWXf7tWGA9Eqnc8v+
         fD9yAHaVdO5b+SaN9dV3AjUuiYMl5b7huE1gtH6oqbd8MFJaMnSL8W0x0HwLvxMP7Pzk
         ptmX7Ka7+NHSrbj+X5u1Hd2Bzwa8RW/oeE0c+RK2kEvAVIOC6/AIa8idi53MLmF6cNO2
         B/FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=GZZkPVMPsjWcEUjtUrh2GVbJUPQ1+IeVSSnWwxSE3ag=;
        fh=JJzuFfrFphX5JDQ6hKg9418WSSYuhwGHPjUnlcxeiJA=;
        b=PIAGxAy5xkaqYMebha9EMhNVv+S7W5JoqE/LhwX7+jWforz5mOpKQACPGdrNkSdq9J
         v7h7tX74ns602H7R5xZfAy35wISrIlxBa+JIkK+/M9Dpp/WRc8pmzFFDDTEJj3ANGj+M
         Wa6PnZ8T18tbXaPdXOBZe1QvfjuXyriMYqq5hs6I2dHtPcRvdluAxx+B+kT7JWXoIN+a
         tSORLwvV8cjGYf9sb6oqw5onuBQFU5mYsoKgcDMnTlwj9d4193y/OuSlWs5aurGK9Il0
         Rge0D4FWy1sxCek1J+9VyHV+kpAe04D2vPr9N9PC3HY+RpEdKftc3H610BPT7pIA2ARW
         PNqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794624535; x=1795229335; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GZZkPVMPsjWcEUjtUrh2GVbJUPQ1+IeVSSnWwxSE3ag=;
        b=in9iqHN0nfPCFxFsQ5TcqjdklfVYchkdu8vE/r9wvX8P0g3uakMJLuxNCQFUOEQQJQ
         L0VOp/Qy2aNify/ckUxNqBQYJwG6whjmQ1tgkz4M3G9BP2xN1ChnoBEc827d8U1kYywI
         XxgPaeIDPioKzOec2Yf2Jk4FHeTbj7A1UzgCR/K9mCDWfMrmsY4V0BdLKK+L9OgbErro
         FtkLkUhPgT0DoCkemeeN4gbEy3XOko/DZB3AdRMRkoYBh0YH5IhZYljbEkem4jWJ79IX
         03c37th1nIa+D6tiVN9GakjDl0ge1Y4o8oTXRRb1Z8D20vcwHfuAPREUVz2CY+xSvU80
         D0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794624535; x=1795229335;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GZZkPVMPsjWcEUjtUrh2GVbJUPQ1+IeVSSnWwxSE3ag=;
        b=Ta4ZK7FqkMnDlqm9yvfCs0Y375Pwcfh60JiPKN4ghTmsjl41bykO4IRVZ8OlaJPKjP
         vFiCQv8nZ/QEkxmquoWl8DBgZtVTvxXZyOUSHQPM00kbXD1TfqecpajTgnH2Yv9oXWtt
         +AX+6ZpV9nUwAmtuX9hVVPKX86zLgu35an331ZdBw//FxcVDItioWc4Csyy+poedpkk+
         fccj9O+0KSY9a57LwihC4xDeY8T/XQ8REjshJ/iD6pg9PFuYCElZS74Pv1N6/594zXV5
         b/mnMZnUKZSLq0jt1vP9N7Btm0Zc2cCHUBPTmE++w4dr35jSgSheYpJkAGe6E8whM4zz
         7tiQ==
X-Forwarded-Encrypted: i=1; AL+hErHtanRifUe4A1weAZTdJuguwU+mcjDhm7ir4vFtIM88iDMOnIqDceU7HJjJ8wcv59bUh/Hx91DCzmk28xw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UOPaE5ELzLOTerZR0umwAOsW4Di1S2lYAF+juFADyAmZ7jw8z
	+fzN6NU+9WYNwYO8pklQ/K5fGAe/tOYyHQbCU0NSd2s70TmSOA1/HckHYbdiVatNfQ/bNZ3IT2t
	CcZOV2NqY0q7hVeA6Jjw/8ugDdDccZEY=
X-Gm-Gg: AYBFou0kK2sERO9OJ4m491MJXebM2C7vGRMyN5pD8GCQCk7vLMTKrjeVTngZAv+pG6k
	EVg79iWaA5+wZw5QLq7udeZeSJ86162Jud8dUQIVhqqX0xS9UUuFqiFf306tz2mSIZhdBNWNm2w
	II5HS8G4n8ckv9kSdUfMQtoguNsBoFOHZLRrg68yDQPROElJOPxxiQ+guN4xEpevJnfB1ravAo9
	CG8APYf30JOdJkwbFrRt4br9VwF4qail0S3ftHU/g6VdyOQHB7yHpeYCyLGuWDw6u39XmjO8lUm
	5OXAwGuTKT6d1frqOqAkYOGf4gC8xyg4ukFBQ+zJn7BviXtFpMZ3U89kDdm9ZuZ1RUSyPSTLq5t
	MQoqf3/uTmlWIIyZOtyGI6ci+SWWe+Y93azxCko7Mu+OGxEPsIzrCp3e1T9dftLNKbaeT6A==
X-Received: by 2002:a17:907:7b9f:b0:c46:50c6:f737 with SMTP id
 a640c23a62f3a-c50963778a5mr365074266b.31.1794624534763; Fri, 13 Nov 2026
 18:48:54 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 14 Nov 2026 02:48:53 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Gustavo A." <gustavogyn@gmail.com>
Date: Sat, 14 Nov 2026 02:48:53 +0000
X-Gm-Features: AclHuK-wVQEDVo4vdvK4r_U4Z-9Vz8_5cDsq9x7tFLxwC8PVNZtFxwhW28bWALU
Message-ID: <CAPZV9qUk3-eKOGEjVc7f0QzZcjb3L5QwUceAEUV0nuCdo90eGw@mail.gmail.com>
Subject: [RFC PATCH 0/1] vfio/pci: Wait for GB202 firmware after reset
To: Alex Williamson <alex@shazbot.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, gustavogyn@gmail.com
Content-Type: text/plain; charset="UTF-8"

On the affected system, GPU passthrough worked with the CachyOS 7.2.10
host kernel. After upgrading the host to 7.3, the guest still booted but
its physical display stayed grey. The exact triggering change is unknown,
so this patch has no Fixes tag.

PCI reset returns successfully while the Firmware Security Processor (FSP)
is still initializing. Restricting BAR1 to 4 KiB mappings masks the problem.
Waiting for FSP completion after reset restores normal output with stock
KVM and verified 1 GiB BAR1 mappings.

The RFC question is where this wait belongs. It currently follows
successful resets in the VFIO enable, reset ioctl, PCIe/AF FLR and hot-reset
paths. Would a PCI-core readiness check after state restoration be more
appropriate? A device-specific reset method runs before BAR and state
restoration and does not cover all bus resets. The existing reset_done
callback cannot propagate errors.

Validation:
- Local host and Linux guest: 7.3.4-1-cachyos, QEMU 11.1.3, GPU 10de:2b85.
  The physical display works with startup tracing disabled. The submitted
  readiness code adds only an IORESOURCE_UNSET guard to this tested code.
  A focused check fails without the guard and passes with it.
- Rebased onto mainline 97d73c825122 (7.4-rc2). Full W=1 builds pass with
  GCC 16.2.1 (VFIO modules, PM enabled) and Clang 23.1.5 (VFIO built in,
  PM disabled). No VFIO compiler warnings. Unrelated warnings remain.
- 79 helper checks and 51 reset-path checks pass using extracted source
  with modeled PCI, time and locking. The unpatched reset-path baseline
  fails 22 checks. The hot-reset model covers completion and unwind for
  three devices, excluding ownership validation and initial locking.
- Strict checkpatch and kernel-doc pass. Sparse 0.6.4 reports the same 17
  diagnostics on patched and unpatched code, with no added findings.

The rebased mainline kernel has not been booted. Runtime lockdep, D3/resume
and repeated hardware reset cycles remain untested. Hardware testing covers
only the device listed above.

Related FSP-ordering work:
https://lists.openwall.net/linux-kernel/2026/06/15/1402

Gustavo A. (1):
  vfio/pci: Wait for GB202 firmware initialization after reset
