Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662806;
	b=Ov9KFMIewIcBciVLo3AHVx2T+x34hOC+3SpxJFuBOklmcZ4SZ8PK6WiS8ZVsKQaz7+d5
	 ISUtTaK8wnLXY84NGehW9so2nHuUZVz6/z7Y+dmZFdkGmlXKZ7lPTyZb3ljvlxGzSTc8O
	 UFbg1js2jaia1sGEgNgGoIdM2uu0X+uSyREHTToU31iyqwTkiChhYI1zolisYxaSPC75m
	 dfz/DI9r/pc00tM5zXh/ajW6kvJHp9oyguYDvDpe0yX+EQ1CfkLFDfMqv+ryppZM/3Wdj
	 ynRH8q/Y23KKehRtu/OfJ5bZOjVhoWhRFFBYnrJ2m45s2MKIrjtEVuT/uuIVOJR4bTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wkqW+5Euu+lzjmS0CVjZUfm8oW70hhcplY06jZYK+zQ=;
	b=pbUWRZifae1kghNfBkUZkxbrEWhyLAtFDZFRSTnmcpPluR0v+mAl69KeabCnFpigpU2v
	 DUuMTxeUX8+euhFDQwLfeRQSELzTAxKskMDY15xYuDP6RiMtaEqQAHJdRNrHL45QlPvUH
	 WkM+wRDtEaAjW9tAl3jdaP3hXMZNLKiSvFEzZsI0l8tlRncCqcxHfXkIxr5v/a+Fa5pCn
	 nSqfTJ6jKMMhJOMsjcIM16MBjHiEnQKcsuH1Qq/Y7R3o1gxsZ9V22ZY4KRhAdxJiOrN0p
	 E3p5FejdE5aMc+gAf7WMdMtfMzgK3V0++TebissX9SCyEVpnt6merXURPTgMNXP59MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b="DXvWpG/o";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE01606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DE01606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=DXvWpG/o
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3791619605cso3938033eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1794662805; x=1795267605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wkqW+5Euu+lzjmS0CVjZUfm8oW70hhcplY06jZYK+zQ=;
        b=DXvWpG/oi4wZHGq45MBwFoLCM2dRdgJaaGbx+niU5qz2fELPtPIzb2o/zug4Qph0q3
         Y1hGesWjxXf6WCfY/jtXWuB1Ik/nKYEUpK/yKWma1EP6bsCHY9uWymcN8mUvmO5sQlom
         /A3XLK4z56oRaIRBImH3XVE8366GUMA0rShTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662805; x=1795267605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkqW+5Euu+lzjmS0CVjZUfm8oW70hhcplY06jZYK+zQ=;
        b=aM6wUx9v/doswsOGvf9O9aNIiMXgj+9m6oOdP6CauhaZntLiNprjjGV5e8HXbFIKhO
         5sP8pzIp8h4HRRuyE44vSvhMmhA2zVmeqfrgYkBOi3SralGpg6lCzXR0eZgrdnIZYjRn
         prOcZUF8SMLgkiY1YTJcPxUsmg5KA1L3k0PpmEY106a/SJBT/Bk632gUGj1vXmq7gcbL
         R7E2Rk07ZHdKfzzLnNSL6BU11+HoECyp8oa5b3zyZAtDtl7LltrjqpDXrAVdQdxBysVn
         ngkQUkFA58roTbX8mTldJO9fhfVa4d2bg+sti38IfKu5lBRok5XcPwU1Dndk8tzgymAF
         rOZw==
X-Forwarded-Encrypted: i=1; AL+hErFnIPgiGnmDCQ5gbJc6pr54vKPzhd4aOYu22SIElWy2dVMruRU60IY9ZB2a4RasCWS+oeuw8CPKjPcA3RE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xo4lu4BpXzY1NiQJt/ZqEqOWm0CakYbr05C5fXmigftv/nH0S
	srN2ESDqrcTTmo9KT5bT5l609LYuKY+KqhjQ8vekgG4IEuDYRUSmO5HsLRFRQULdcLo=
X-Gm-Gg: AYBFou0HXG4aarQ1SWhfX3nrg+AtFPljGh6MAJWiZ1mzLsgPMO5+nr+X30gzlFS79WO
	piWvZAR8qMryTsA4hXtL+S8QmLXoa9hDwGT1G1tWQ4t20La3GUHKtHHkpDk/r9VGQLz5ItK6qVw
	lhgRSbp4GTkh1Mlg6a1jfvq5RB48XNLT2gsRU3yw5mXjhr28PkeAkhRNyeNVehMZKYnWM+5jvdN
	txxlX/q8+StjRTRLHLYdUHTq7UAoTK9573L+W+MEyb/8GWunFH8Q99KOfmkx9U08oDDTxNf1ZiF
	ar6G62gg7U/lJJ+JlZpSeEr9WQzuc4LpR+z1+RfRCZcCHIZjDVGoZ/8dhd2k10P4zbGdgPBZbiL
	VNINYllqVl543BXknqaHaUJ5wPVK0wdqhvulZel9F9ZTfHexEGemCNAP/lT24w/jiwfhFqbgUkW
	nKhLQXkcTuP4PsZNP4FwFDCEmsc7YnJXGNdaV8XJXSm64u7TLSjEyVxdejlNuYWkRD5OSSCkf4Y
	Lfu3zWBqPQ5s3oyquwSOLvf5kbn/wBl+ah6bfYHHaxds+nmeiebQZPzmxI5j84cCC0zAdMi2XwV
	29aOOVAkLU0LAiC9wMHwIGWkZ85P8yo39Ip5U8C574bftH/hQLHd5X/afGfp7ZnGpsBG7xCz0no
	F5iPkdlsKiS8uqbd+n7iPzzR489xdhaagfeVW5ZeAQ6jmy5XbmfNXaeoXsrWPLkzzA7Mz
X-Received: by 2002:a05:701b:4508:20b0:163:c5eb:d42f with SMTP id a92af1059eb24-1b503060401mr5705261c88.5.1794662804586;
        Sat, 14 Nov 2026 05:26:44 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm15712003c88.12.2026.11.14.05.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:26:43 -0800 (PST)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: krzk@kernel.org,
	conor+dt@kernel.org,
	ruud.derwig@gf.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	nazim.khan@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v28 0/4] crypto: spacc - Add SPAcc Crypto Driver
Date: Sat, 14 Nov 2026 18:56:18 +0530
Message-Id: <20261114132622.690129-1-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
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

Add the driver for SPAcc(Security Protocol Accelerator), which is a
crypto acceleration IP from Synopsys. The SPAcc supports multiple ciphers,
hashes and AEAD algorithms with various modes. The driver currently supports
below

hash:
- cmac(sm4)
- xcbc(sm4)
- hmac(md5)
- md5
- hmac(sha1)
- sha1
- sha224
- sha256
- sha384
- sha512
- hmac(sha224)
- hmac(sha256)
- hmac(sha384)
- hmac(sha512)
- sha3-224
- sha3-256
- sha3-384
- sha3-512

changelog:
  v1->v2 changes:
    - Added local_bh_disable() and local_bh_enable() for the below calls.
      a. for ciphers skcipher_request_complete()
      b. for aead aead_request_complete()
      c. for hash ahash_request_complete()
    - dt-bindings updates
      a. removed snps,vspacc-priority and made it into config option
      b. renamed snps,spacc-wdtimer to snps,spacc-internal-counter
      c. Added description to all properties
    - Updated corresponding dt-binding changes to code

  v2->v3 changes:
    - cra_init and cra_exit replaced with init_tfm and exit_tfm for hashes.
    - removed mutex_lock/unlock for spacc_skcipher_fallback call
    - dt-bindings updates
     a. updated SOC related information
     b. renamed compatible string as per SOC
   - Updated corresponding dt-binding changes to code

  v3->v4 changes:
   - removed snps,vspacc-id from the dt-bindings
   - removed mutex_lock from ciphers
   - replaced magic numbers with macros
   - removed sw_fb variable from struct mode_tab and associated code from the
     hashes
   - polling code is replaced by wait_event_interruptible

  v4->v5 changes:
   - Updated to register with the crypto-engine
   - Used semaphore to manage SPAcc device hardware context pool
   - This patchset supports Hashes only
   - Dropping the support for Ciphers and AEADs in this patchset
   - Added Reviewed-by tag on the Device tree patch since it was reviewed on
     v4 patch by Krzysztof Kozlowski and Rob Herring (Arm)

  v5->v6 changes:
   - Removed CRYPTO_DEV_SPACC_CIPHER and CRYPTO_DEV_SPACC_AEAD Kconfig options,
     since the cipher and aead support is not part of this patchset
   - Dropped spacc_skcipher.o and spacc_aead.o from Makefile to fix build errors
     reported by kernel test robot
   - Added Reported-by and Closes tags as suggested

  v6->v7 changes:
   - Fixed build error reported by Kernel test robot
   - Added Reported-by and Closes tags as suggested

  v7->v8 changes:
   - Fixed misleading comment: Clarified that only HMAC key pre-processing
     is done in software, while the actual HMAC operation is performed by
     hardware
   - Simplified do_shash() function signature by removing unused parameters
   - Updated all do_shash() call sites to use new simplified signature
   - Fixed commit message formatting by adding "crypto: spacc - <subject>" to
     all patches
   - used __free() for scope based resource management

  v8->v9 changes:
   - Updated the software fallback implementation to use HASH_FBREQ_ON_STACK
   - Corrected dynamic allocation of statesize and reqsize in init_tfm
   - Fixed synchronization issues in the digest request

  v9->v10 changes:
   - Fixed unused variable warning

  v10->v11 changes:
   - Removed the redundant crypto_alloc_ahash in the init_tfm function
   - Removed the redundant crypto_free_ahash in exit_tfm function
   - Removed the redundant crypto_ahash_setkey call in setkey function

  v11->v12 changes:
   - Removed do_shash() and switched to lib/crypto API in spacc_hash_setkey
   - Dropped support for SM3 algorithm
   - Improved multi-device safety by encapsulating handling within priv
   - Added memzero_explicit() in sensitive paths
   - Minor code cleanups and style fixes
   - Algorithm registration cleanups

  v12->v13 changes:
   - Removed all the sleep function from setkey function
   - Added shash implemntation for aes algorthims

  v13->v14 changes:
   -Added fixes based on the reports by Sashiko
   -Removed the spacc_is_mode_keysize_supported call from do_one_request

  v14->v15 changes:
   -Added fixes based on the reports by Sashiko on 19/jun/2026
   -Fixed styling in the Kconfig

  v15->v16 changes:
   -Added fixes based on the reports by Sashiko

  v16->v17 changes:
   -Added fixes based on the reports by Sashiko

  v17->v18 changes:
   -Added fixes based on the reports by Sashiko

  v18->v19 changes:
   -Added fixes based on the reports by Sashiko

  v19->v20 changes:
   -Added fixes based on the reports by Sashiko

  v20->v21 changes:
   -Added fixes based on the reports by Sashiko

  v21->v22 changes:
   -Added fixes based on the reports by Sashiko

  v22->v23 changes:
   -Added fixes based on the reports by Sashiko

  v23->v24 changes:
   -Added fixes based on the reports by Sashiko

  v24->v25 changes:
   -Added fixes based on the reports by Sashiko

  v25->v26 changes:
   -Added fixes based on the reports by Sashiko
   -Removed the additional fallback
   -Added the CRYPTO_AHASH_ALG_BLOCK_ONLY flag to the cra_flags
   -Minor code cleanups and style fixes

  v26->v27 changes:
   -Added fixes based on the reports by Sashiko

  v27->v28 changes:
   -Added fixes based on the reports by Sashiko

Pavitrakumar Managutte (4):
  dt-bindings: crypto: Document support for SPAcc
  crypto: spacc - Add SPAcc ahash support
  crypto: spacc - add spacc autodetect support
  crypto: spacc - Add SPAcc Kconfig and Makefile

 .../bindings/crypto/snps,dwc-spacc.yaml       |   50 +
 drivers/crypto/Kconfig                        |    1 +
 drivers/crypto/Makefile                       |    1 +
 drivers/crypto/dwc-spacc/Kconfig              |   64 +
 drivers/crypto/dwc-spacc/Makefile             |    7 +
 drivers/crypto/dwc-spacc/spacc_ahash.c        |  803 ++++++
 drivers/crypto/dwc-spacc/spacc_core.c         | 2540 +++++++++++++++++
 drivers/crypto/dwc-spacc/spacc_core.h         |  862 ++++++
 drivers/crypto/dwc-spacc/spacc_device.c       |  340 +++
 drivers/crypto/dwc-spacc/spacc_device.h       |  178 ++
 drivers/crypto/dwc-spacc/spacc_hal.c          |  349 +++
 drivers/crypto/dwc-spacc/spacc_hal.h          |  113 +
 drivers/crypto/dwc-spacc/spacc_interrupt.c    |  366 +++
 drivers/crypto/dwc-spacc/spacc_manager.c      |  657 +++++
 14 files changed, 6331 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
 create mode 100644 drivers/crypto/dwc-spacc/Kconfig
 create mode 100644 drivers/crypto/dwc-spacc/Makefile
 create mode 100644 drivers/crypto/dwc-spacc/spacc_ahash.c
 create mode 100644 drivers/crypto/dwc-spacc/spacc_core.c
 create mode 100644 drivers/crypto/dwc-spacc/spacc_core.h
 create mode 100644 drivers/crypto/dwc-spacc/spacc_device.c
 create mode 100644 drivers/crypto/dwc-spacc/spacc_device.h
 create mode 100644 drivers/crypto/dwc-spacc/spacc_hal.c
 create mode 100644 drivers/crypto/dwc-spacc/spacc_hal.h
 create mode 100644 drivers/crypto/dwc-spacc/spacc_interrupt.c
 create mode 100644 drivers/crypto/dwc-spacc/spacc_manager.c


base-commit: 8ba9044ff0bf4a5789216496019fad614eeafd45
--
2.25.1

