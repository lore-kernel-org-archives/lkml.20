Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651187;
	b=3hPX+D8/SxVI5sO0jUnjygQU+1+duRrxL2xuXhggE4bhDtph9KwSkdFhxwtRc33UQFs6
	 0ChwMXyJYAZpWJPlpj2cnyRllcjvU9xC4uS/+OY2ZXgsu1d0tHHbjrwS/BwYAk4ya1Fsl
	 caOd6KMxzPMKOcMoIJJJ4e4Hik2yWOc5FpLPo6dp/rnalv5cVyNgl3AhIzJBQOurlLx1+
	 puNLzcOk6qM56PxCXEMcbmXivP4rT+GDL7Z8MUiJKFLO2+Z0tnTZOPsbvt1W/qCvy4uwV
	 4cfGPzhMylWWzG6jRXAkqDk7iVPgQra0dwnwgyj7fRu/HacF4KCvBWmj6aHkxNdNOTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y11+vQFhjlxB59vrk3lIlPH7Q0J3elq3CyLWDXfXi9Q=;
	b=XboJJm6HXGkyqLk6McTGzaz4RRAoeTls0x10C4HTDmubpqDAUhvVX0lXV6Zi4uLMnyFZ
	 /BDD+MskGdY112KszEzQzschQqG0RRmr97gAasVMNS0w99QOjv/hPCUcJTtre/8+eEmaa
	 Ik7HpXZG/8GLcxZhxAuFtsdAVC1Unzk2zYLMz9sr1J02fmuoTedyG3UK+4IPbUNKYtc3A
	 TEQXkJawX0TtDD8eJStt6CkHFNMctCvmRnkoh3r57zvf8ARUy0/njZCZI9xxIikwgCZFl
	 iD60kcTZZD5To1qJMVY/sBj8V6V63VFLjO37P7YhIR/ONPLoz/G03/WkZpYcbF/UGQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="aHs/ahGq";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41D6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F41D6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aHs/ahGq
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so1570911a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651186; x=1793255986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y11+vQFhjlxB59vrk3lIlPH7Q0J3elq3CyLWDXfXi9Q=;
        b=aHs/ahGqZyXXT4FbFzTeZgubCwrmTF9x/WM3CtgJe1RjqeLT/GAHGwu3JDhmBEpPyz
         SYaKQzS/1qziyP2DLcPGGYvukoUmJOYQ4ucM/r9EaFK959YVM5T8NdhuFBzgOBjKW1Vm
         3jjkeofb/uHBoU93cdU7WKVVXWCKpO+DWHCQcCuQ1vFafzySGDPW4CgWqngIALrG1xtr
         GJiUuGN2UfWbTia0MdEU/g4VOaPUiH14BK+oVe9pWzll3o6e4RS3YiHwNPE2I2Hf7z4e
         ayFMKitEjV3MQeXsr609PdJf8VCAguvvifme+HETjTHCAGEWRUT6boqgjw2Wf98GGkN4
         MTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651186; x=1793255986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y11+vQFhjlxB59vrk3lIlPH7Q0J3elq3CyLWDXfXi9Q=;
        b=dTpkEdSigdD0Ry6YD8Pf0+O04Demfq8kp6RfD7ZPMKbxNv8RrG8OvzTAY3zeVWKsDv
         ZXXgWZpF0wMFHnI0YI4qc46hzhcFUlnExP56YCf9W3RvFCLoKL483lJEwR+VLBBy5uOn
         kDdeygQ74pghG+lZKAX9jQF2Yh655jNt8SGGXcthGOTVdQNSA+HMiTVBcy+cMZy1K9FD
         UZfna//fI+DFXRFhs2siDG+dmPkL5GpXRCJTGobrLbVn84Wnnlvu6Lj+BO+tnRGiwahn
         rBcqB8DSycyQmg6N0zKEJK8YN62WJ0//CNSXWz1XYvnq/cGmL0hcYSfpKBbrQ4OU6hNv
         V0ig==
X-Forwarded-Encrypted: i=1; AKwUvBx0YjsGrdSmFLPYJhKL5QHf2IDPX0WRpPAPI+naTIJq8VPYfcUcqdbI1KLJEU5Vl8QnRep8cMcTVLiCNgM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBQNdSiBDY8zjTkIvOzhp6O5Ry59H/e7ryTjiEFmgrZF8fAMTB
	tpbeP1if1eXVCNUZedfjxAxd8R2eCv94gkDck/LMEecFNGq+4usojvNn
X-Gm-Gg: AYBFou2wGpbj7D9VYlVrO7iw5gHXk2L7/y6JC2vrMTlG0mWvbYsALKKxCKCInjyDhgL
	x+qjGd5sSmqmafEpAROurd4MJ3XeESIN9Bons+nvRxb/HiIUJjJrAkYZAHlxcBfSNUFkyyZB+TO
	e94H+jKVx1IsNmnq2rkI2b9xYyizD8ecgsvbp8q/TIh7DaLNeAGr0quJW4oUz/NK0F+xHCSZf6e
	NqRgEjzgNEw4cM0WkZmrAScIF6kg0FDu2PrXxqu4sPP3k3aDtt3yZD0juTukDVToQfOiX8GfHzV
	hKbU9kiLAKMOiIUpnA8oh1/oE99Rqj5V32/i74ct2OcEuGryz0YlrYP9cPJk4Kl28rPFrYjxQQW
	rf8FyBCatvUBsx5QRdpqM+nuwZkEwPqMuYz7rCwWrPvBwlzcCWLmFYmVUBEpZ/FHbIj0p9+wFIh
	95fFSw/yxzPCUUjATLz7Q1B80/bamTT4oRSjhUNHh27uNwLaqh2JIVeux2fnN7iG0mkx0RzL/7J
	9+jduVCo12bbg+kc1eaX8NTp6RzODLF8Bgj7vWnQ2cueUhrSP2I9WtqSXt6Oxd2+E1scQnIej0k
	T8CQa4bpv/NRAls=
X-Received: by 2002:a17:90b:5390:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3ad86cdd7a6mr3323349a91.67.1792651186185;
        Wed, 21 Oct 2026 23:39:46 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm2784741a91.2.2026.10.21.23.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:39:45 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: glaubitz@physik.fu-berlin.de
Cc: dalias@libc.org,
	ysato@users.sourceforge.jp,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	Artem Novak <artem122novak@gmail.com>
Subject: [RFC PATCH 0/2] sh: Add Casio fx-9750GIII board support
Date: Thu, 22 Oct 2026 00:39:34 -0600
Message-ID: <20261022063936.472520-1-artem122novak@gmail.com>
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

Add initial board support for the Casio fx-9750GIII graphing calculator,
based on the Renesas SH7305 (SH4A) processor.

The series introduces the board Device Tree 
and minimal SuperH machine registration.

The Casio board Device Tree binding
has been submitted separately.

This RFC depends on SH7305 CPU and SoC support,
which is not yet available upstream.

The board Device Tree passes dtbs_check, and the machine vector compiles using
Casio GCC 14.3.0. The two patches also apply cleanly to Linux v7.3-rc2.
Hardware boot testing with an unmodified upstream kernel has not yet been
accomplished.

I need comments, they are obviously welcome.

Artem Novak (2):
  sh: dts: add Casio fx-9750GIII board
  sh: fx9750giii: add board support

 arch/sh/Makefile                        |  1 +
 arch/sh/boards/Kconfig                  | 12 ++++++++++++
 arch/sh/boards/Makefile                 |  1 +
 arch/sh/boards/mach-fx9750giii/Makefile |  2 ++
 arch/sh/boards/mach-fx9750giii/setup.c  | 14 ++++++++++++++
 arch/sh/boot/dts/Makefile               |  1 +
 arch/sh/boot/dts/fx9750giii.dts         | 15 +++++++++++++++
 7 files changed, 46 insertions(+)
 create mode 100644 arch/sh/boards/mach-fx9750giii/Makefile
 create mode 100644 arch/sh/boards/mach-fx9750giii/setup.c
 create mode 100644 arch/sh/boot/dts/fx9750giii.dts

-- 
2.56.0

