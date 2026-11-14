Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650030;
	b=t4tAmiA0hNauMBYO2BIb5EOOi13/Om6eZoxTIQLS68SfPc+iquGjUNUNlwdRqgcnCctc
	 i5CvAqDIMkDbqiWAnsPyy5ylLwFFw4It0+vVxOdbpkdx+JRrIHMIYTlGZif9nEKPLqfd+
	 3wfadZ65HIjmnN54sf99klp2BJ+E43BR5LcCo0D6Uy86bPf0VRokIZih4O0xfqoRKuOSv
	 Yl3Z7Dg/CNECsbW7MEniwjFzC7xjXws6kfPF/0Q0OKz+iEwH2kO/lngy2KMWl21s5VKpE
	 CQjfofVyM1YIDSvyQlA0wW3IDAJg11djuq7DfaORHCWXLsnHYE9Ql7Wepm2LOp9iy6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f7twjAGqTefNetbUPu09hDc/iSPsogMXjZV3p18saLo=;
	b=V8y9lTDXambrAlISrE11pjr3P9HFSLz7IYgGO0aiYrAhMHeeHayLZUZvgt91D8AIfMr/
	 pGEnxBHpi5hjG/1D/zH22pRjyQ1jobdfIhPPuvHzoQGQrCYl+bVxAYKwOKIsjlg8pwEjA
	 1hIrIToUb1Z+MdeQyWX/yQmpyY12vmjF9ZtuTulBeJZ01BKe+DinQcSrjvYvuKDknlXpQ
	 8QH0kAbRK3uKYoIQXCPYoFjmwUPWZAVxio4C3rSC+Q5srA5f58re5V22Qf/BgaD2FYYP5
	 T4vBzCt03/DXYmAK/vyH50mUqU7cFXrQsWmpJ0eevIbkJTBWwOetXoAHnPdgsEYdICw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L3fEDOUK;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A287E606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A287E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L3fEDOUK
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50aaad19fbso106714166b.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794650028; x=1795254828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7twjAGqTefNetbUPu09hDc/iSPsogMXjZV3p18saLo=;
        b=L3fEDOUKUrMGN+T6AX+4RQ3VUn1y+jH6+iefZneP3H1ilEigPd0NTSzCv/ELLZ0Vpp
         VhlPfN+sVbGWgNzewj2RPd9WO/sHZMTkdY4rxGHqVngCkNOM3PlGxnr8mglE7RQnLNaV
         hbOQgCV+/mghOd1j1KvGLEjNico4uf7QCu6nCSZApBFdLh0lxTVJIuN4v7nV/eQunOdE
         ouiy10wlvDA9vfn9tXFqbwyTC7hLIgCpi/JZLYskMyjmrh/f79682k3OPD3vUk3aHYIv
         6MXOUK0ioIHmwJpF2qW8UBojR4zEfM/+xqZWIjwxdBx+Y4mcORDRzY1DlUMYcwyO0d4R
         x5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650028; x=1795254828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7twjAGqTefNetbUPu09hDc/iSPsogMXjZV3p18saLo=;
        b=bHSgNC679NAS5isGsIi1xPAQJWiqMaRY1f9ubNIEvtVvi3inm8j0FcIVmKQU6J/aSC
         ssGwXwJwg/7fSKlmgdAYTErjVdeKqQ95iUj8lwKs4juoF0B+QOM0+ZGAF5RorIZ44tdX
         A2Rf7mYP3F3I3x6A4ADuVoIP1tHlKFk/GAqkSLl5fEsXP1C0Si5L3NVJoLBaZK81NyGY
         L2asuGJ7sicBOv+W3Q7gNMgYQ9ZkVLaytViC1NnE8TBu8catvA+djcvRBn/5RkTdZnjI
         YU7BgUQZ64MXLoAQfq/Ax8ALzFUtdPrCq8WaQLfMCmObnxt2bGha22VaFElvp5FbANch
         0UXQ==
X-Forwarded-Encrypted: i=1; AL+hErErFELhrO9RCNizHWpDPAm44qgoEckdNFPXT5g+3XlwxC3UTZ7w7W6B6Ba60puStyeIKrptCf6m5Bqbs1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e8mx0LwWfUpwO4OLJVe12aNFerEAQbH16WtQwdb3B64tLEenA
	5UfBMqNZF1FG1qgzlE53Aiin7IfUq0N14zUe8lTyQ5Y/vhajYQJ00dnEOdcm3FDe
X-Gm-Gg: AYBFou011Y1ZYcdcJuYf1ndrBme89je+vAZmSJdDiG4XE6XEVtC1vU5F/ZOywHcjtbf
	axHEQXPDw86gtNcbDocMDE8fx/NEbq7LFgg/ZtPTvO/4b8FaB18043L1IkKV0p++EDvpml0mQWZ
	IvZNf29gH2gBZJVv4l8tSR3r6mcQH2Qwql7VLLJCEbrUT1soQrWLHRaZ/GO4BjNy43FkBEw12R8
	4EDI3LXefoKM+zMyWnAQrpWhhSmwMXTbosQGFBTWXxyX7EgtskvEu/6NEq3aqA55/Kb+RFcGcXM
	htXSIVzvGdBIzNY5OQiGhjrn5MxZ+YfV/eLLDl6d+NPWgx+s0Wn1co7FbUkT89EG5Obp+uSRW/f
	wrjnrjM1HnmtfqKti+H6e37U4dNkifkxpw4xn70k/tlz76i1OOibaCgkHpwtQ3IU6Q7VKBOhFi0
	km1oATSX47h/Edm1didZlbvuh9TTAxAnd6+MyJaQG0ujoI5ClFmuUS6vnrQtgUdqFBZFuu+teUa
	mOAiQ5BZZeBYHsQNwCl1VtQMBnC5B4vKNm9hzFuoQwdpWpl6lEtO6CjYVf5zAwgvOgFJowDbYaH
	aNroWhGpcL7CZ2W2l8cKxZvgGAGKzsBVM0yWlMDNAFh6RjSEFWFBnd4PMK7bOwhXL4PQMeM=
X-Received: by 2002:a17:907:1c9e:b0:c50:93b6:52ed with SMTP id a640c23a62f3a-c509654e2f8mr451033166b.40.1794650027938;
        Sat, 14 Nov 2026 01:53:47 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b236d4sm197311266b.18.2026.11.14.01.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:53:47 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v2 0/2] alpha: enable DMA CMA support
Date: Sat, 14 Nov 2026 10:53:15 +0100
Message-ID: <20261114095335.1283016-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This revision addresses Matt Turner's review of the original CMA patch.

Split early parameter parsing into a prerequisite patch. Use the generic
DMA contiguous allocation/free helpers, skip CMA on the GFP_DMA retry,
and use exact-size buddy allocations to match current helper semantics.
Remove the redundant highmem check and preserve existing zeroing.

Reserve top-down below the direct-map window and usable RAM limits.
This avoids preferentially taking low memory with bottom-up allocation;
it is not a strict exclusion of the first 16 MiB. Explicit cma= address
ranges retain the generic override semantics. If there is no direct-map
window, skip the default reservation.

The configured default is 16 MiB; cma=0 disables the default reservation.

These two patches apply independently on for-next at 0b4cadbe7c39.
The ES40 test kernel additionally contains jump-label v3. The combined
kernel, boot image and modules cross-build with W=1. Both CMA patches
pass checkpatch with no warnings or errors.

CMA testing on a three-CPU AlphaServer ES40 with cma=64M:

  - Reserved 64 MiB at 0x7c000000, above the first 16 MiB and below
    the 2 GiB direct-map limit.
  - Ran four allocation cases on each CPU (12 cases total).
  - 32 MiB and 24 KiB (three-page) GFP_KERNEL allocations used CMA.
  - 8 KiB (one-page) GFP_KERNEL and 24 KiB GFP_ATOMIC allocations
    bypassed CMA.
  - All buffers passed zeroing and CPU write/read checks.
  - CMA allocation/release counters balanced, and available_pages
    returned to its pre-test value after each allocation was freed.

The initial harness compared CmaFree immediately after freeing a small
allocation. That was not a reliable per-allocation check; verification
using the CMA sysfs counters confirmed that all test pages were released.

No new kernel warnings or faults appeared during testing. These tests
exercise coherent allocation and freeing, not device-initiated DMA.
GFP_ATOMIC was tested from process context. Boots with cma=0, cma=4M
and the default size, fragmentation stress, and no-IOMMU platform
validation remain outstanding.

Link to v1:
https://lore.kernel.org/linux-alpha/20260219205514.4434-1-linmag7@gmail.com/

Magnus Lindholm (2):
  alpha: parse early parameters before reserving contiguous memory
  alpha: enable contiguous memory allocation for coherent DMA

 .../io/dma-contiguous/arch-support.txt         |  2 +-
 arch/alpha/Kconfig                             |  1 +
 arch/alpha/kernel/pci_iommu.c                  | 13 +++++++++----
 arch/alpha/kernel/setup.c                      | 18 ++++++++++++++++++
 4 files changed, 29 insertions(+), 5 deletions(-)


base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
-- 
2.43.0

