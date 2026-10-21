Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585916;
	b=JHDX0mBJs3FkjzFeBrDPcgK8qs+uZEyaWzR5gxG85S2PT4LkqHXJnq59lKPtAVP9AkDt
	 MBtIawcHbL/9zaafA7p74TXIiOTtAmYWxXwAyovJuwzMjMXkY3mvt0o4tjM4gSeuiYtsF
	 DE5R5Z2depoFDDWrZ+aOSItOb8RTAd+H0iddrXr+FjXnkW4CnRz+mYJUyodOYBgzje0vm
	 OAD3Vm6H8M6WzNrbR+WhVmAjOmnrniogStUMsXqs3FSQ1hqn3qvD0AKvqey7zwUui4N/O
	 ivW/srC0Rz+kL7C+cETIp4BUBGb2tZPHujH+rfe7RXFJg5AN23Q1G/Xz/bA9d3klRmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WCe2h/c6J0K15hd2wKQCLcyUixtVEx4iPn4ngkUBYj0=;
	b=sFt6BK6YvwzoGtORIqeW34Dv56DuCXHZyyZtX6HTl7tdEdhUqvqNDSPlh5O8N2zn79HN
	 mEMstxrrPdbqBjcjVivR4XWhRuxGbjIw7gAlkjMopDmJS/c1bpvLabfSMwyMybFztdNCa
	 X7PT/FxtHnzKHlNMHPYDlOkglPxPTCOZ8huut/X41Idi4NPG6+DkmU4VpP3gcLnQ0cZi6
	 3QA0YkPmpPYQkEzH7NcODcbmhARL4XxzznS/ss0dRJ2iHxAsX0wUxD9tIbEYgqDYFYhe9
	 El4LRc0mcX7ifQIlemz8lryWb/ZF1XoGJd0k9DYcFGwi8Ho7+iGV9ghJoNQaVe69RZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DMfIYGgB;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E967606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E967606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DMfIYGgB
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac63aee1ecso195903a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792585914; x=1793190714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WCe2h/c6J0K15hd2wKQCLcyUixtVEx4iPn4ngkUBYj0=;
        b=DMfIYGgB9fbpKyyVc6Mtp7dPhRk82hptsfy89WqLYIEnWeyqCgU+tsajJpsR3hXbYD
         csD7yG4DJM2J4ygwJiFVBrV2icf7o6MO/f1mCNcxeLhGSWYlWt3yA14hl1UK/pXcNV00
         7SdlNVyap1qx/D8oZwnrLodLrs7jVs8YOAsSw3SbutZg7BOTjrbCr3d4OflEPDGaF7WT
         yvzIG2HqRHkgkGw+tfoLck8zV6aCJBYw2BVb7LOKi8IsooIv52weIuDt7rEult1Jt39K
         IsUrD2pgNzyFSLIpjSbCCcexvn7rMZnxv+TBpNrdwjb1/VV6klzew0P9N4gNt2LT5dFg
         09Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585914; x=1793190714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCe2h/c6J0K15hd2wKQCLcyUixtVEx4iPn4ngkUBYj0=;
        b=e4ARgvtCFNqfQQGtdRaRKhIpbJiYoKqZutaOkU3eXL5kxskfjDfjcTsMKDBv8y6MHi
         YQTyUGtI+HO0Vnb+CAGnYQUBZrgYZtQYSyMaUfHF8XmsUQqw4IhZs3QzI63jVupbaA9I
         RkT96Ikr9lkxmLkI8IKyzubg+FeWD7VxZcBNI//THOvmz/rnLPV13fTE4/5pzp2VZ1id
         54XQZTgD7ZWPhDdEtSL151PC8d3c+6imMak1r8ruvWfO8Ntp5PDbp5KkHulTcGNDAA4q
         Tb7lsWDy9RXQHX4EdrhOtWzrXE8iDRQCiftbxcBrf3ytjv8FwDR2cTVh2pA8HyoTZFBF
         kdUw==
X-Forwarded-Encrypted: i=1; AKwUvBwJTqx+QA9yAkZDSh0r1sddKCYi3Z67qvjgoXXBd1LqFuosmHYVQ6FzLlyjVv5GyOhZSH8E+HkPlY9eYxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgCua1xahGgzkdZJd6vEWu4g7ryqYS5NOIVd5QAsIY1JDk2PUJ
	iolB5RJX42xczoFVpPYRwwwDcWp+eNIVLm0SwBPoW08Bq3jbVKbCYf4r
X-Gm-Gg: AYBFou0+nSh6ON0rTBTVAFRYlDIL6Oo4CAF0FZnJVbMer8aIKN6DdvyfXnaB37tnwhN
	0mT3aMEcf5Ng56BKyrPS93g0ITwnF6hm/7Mu/r9O76Ab/QvOUQo7LS2aDWLJwXPP1Z4ZPcvx4Bt
	3etDTW0Su1lHSmkiN0SzS3Un2e5wI2JUmPBYcqK1twcnpPBKEx/xMuCeLLVek7v5KW2DA7R0PQT
	imR7spv6T2cNk5qN8+4RSxeUyNtgEjmzxPVBEH2moIfmvIdprbhOJcIbXe7BY94GbzaNNfKBlcj
	mnYiGaehHZ7y4K+fb1IiqiwUp3D3xHHGi4vUqfwmDi17yVsPdDtTgmak+2qfc4+aWygi5s6PyUY
	mCTZRHYUBrnxUsztJ65TSQVdR4lQ7Z/e+bbLaCSq9DLNwM5ShSoWWtc41kXiwwiwL5Fd4OaxePe
	NiK5YxIoqqFBTdRSFxDe9cQjG2dKXqY+Go2d6wQ8McOcKUjDsvGgt4kgXYm5jhNR8o3uTUbf+L6
	OrEaB7hZwEk94ZmeNOD5eQpq4UhoC79cpZEKKS9YfsCdALniPaisGS2GlZdiNr+BYDf4/HpV84H
	XxXLXIScYFSbJntQkdQ=
X-Received: by 2002:a17:90b:4e87:b0:3a8:7242:e8d3 with SMTP id 98e67ed59e1d1-3ad86dcaf42mr1503660a91.7.1792585913894;
        Wed, 21 Oct 2026 05:31:53 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813eb9casm4229523a91.15.2026.10.21.05.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:31:53 -0700 (PDT)
From: Shihuang Liu <shlomojune6@gmail.com>
To: linux-input@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-kernel@vger.kernel.org,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH v2 0/6] USB: add usb_make_subpath() to replace strlcat() in input drivers
Date: Wed, 21 Oct 2026 20:31:40 +0800
Message-ID: <20261021123146.17202-1-shlomojune6@gmail.com>
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

Several USB input drivers build their physical device paths by calling
usb_make_path() and then appending "/input0" or "/input1" with strlcat().

In preparation for removing the deprecated strlcat() API [1], introduce
usb_make_subpath() and convert these callers to use it.

Patch 1 adds the helper in include/linux/usb.h. Patches 2-6 convert the
joystick, misc, mouse, tablet and touchscreen drivers, respectively.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>

---

Changes in v2:
  - Add usb_make_subpath() as the first patch in the series.
  - Use the helper instead of open-coding strnlen() and strscpy() in
    each input driver.
  - Link to v1: https://lore.kernel.org/all/20261016170411.51025-1-shlomojune6@gmail.com/

---

Shihuang Liu (6):
  USB: add usb_make_subpath() for formatted device subpaths
  Input: joystick - use usb_make_subpath()
  Input: misc - use usb_make_subpath()
  Input: mouse - use usb_make_subpath()
  Input: tablet - use usb_make_subpath()
  Input: touchscreen - use usb_make_subpath()

 drivers/input/joystick/pxrc.c              |  3 +--
 drivers/input/joystick/xpad.c              |  3 +--
 drivers/input/misc/ati_remote2.c           |  3 +--
 drivers/input/misc/cm109.c                 |  3 +--
 drivers/input/misc/ims-pcu.c               |  6 ++---
 drivers/input/misc/keyspan_remote.c        |  3 +--
 drivers/input/misc/powermate.c             |  3 +--
 drivers/input/misc/yealink.c               |  3 +--
 drivers/input/mouse/appletouch.c           |  3 +--
 drivers/input/mouse/bcm5974.c              |  3 +--
 drivers/input/mouse/synaptics_usb.c        |  3 +--
 drivers/input/tablet/acecad.c              |  3 +--
 drivers/input/tablet/aiptek.c              |  6 ++---
 drivers/input/tablet/hanwang.c             |  3 +--
 drivers/input/tablet/kbtab.c               |  3 +--
 drivers/input/tablet/pegasus_notetaker.c   |  3 +--
 drivers/input/touchscreen/sur40.c          |  3 +--
 drivers/input/touchscreen/usbtouchscreen.c |  3 +--
 include/linux/usb.h                        | 29 ++++++++++++++++++++++
 19 files changed, 49 insertions(+), 40 deletions(-)

-- 
2.43.0
