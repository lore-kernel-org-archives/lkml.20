Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482270;
	b=OOz/tUoh7yV42SU+rO0g1kk+TjUgFM9IxhorVFxK8dSxKcipoosxr9PoN7pfIj2wLH+M
	 jCMR3UPO+UWQZaC3YxPyacQCwkjgBoAkxiYnywhkfsYzbIX4klj/xoNaxYvWaMg2w3UKK
	 yKQtCttHlct0tAakJpi08v7njBAPrl4Ccn932HkBhq2ZNT+zJbP+xpq6I6v/wu3pqI4mU
	 ZDXc5VegIGEDzRcqsUgN0TfPRW2DE/+fpQj7fMlMtLznNc0p3XPcIM7dxy3LHWw+JMsyK
	 Z+TU6nqomMdOCbKOI9j1q4Wyii4/TT7JH5yMQdgcnBvElG0O+4sVtA2mHmQQ+PzPNcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tR3skobAr2sMjA6rolhmHaYXFJaHuy9h+iD9zoIL62I=;
	b=l3kxtkFk4AdDFiHUY0rvVM1rjrJHQ0xVkT7DAMBziLE3Qv5eOgR+ote40Y3F8GwawDaW
	 l6uKt+LA08PmNjEjw0uBNYuTru1UYjPRQeezPzmCc92MudHAFXSrE3fDSTdnQ2wRexUPq
	 3fnCtoBO4ne2amQW+P25zXamlTgeqNMcbpX45cHMg0zOCHXAx5FIv1rJ1PtAzqANYJNXF
	 kpAkWyVlKjEiwL8dAXtGPhFct0uHIqyy7b8HUXtoeKOu8jwTHln9gPuwzeQ+jOTGk1WSh
	 Qke1innMYHPsoPBXnCuxLHwBJYzJxY8Vf1eSdiWxDYDpg318ayqSidMLkYSwQVv0S+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=GPZHYsQn;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D56606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D56606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=GPZHYsQn
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f3c89594cso317945785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794482269; x=1795087069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tR3skobAr2sMjA6rolhmHaYXFJaHuy9h+iD9zoIL62I=;
        b=GPZHYsQnIlFOia1laiYlcQuWc76+tu+NFBvZ1ns75K1PPcu6dRv7LfhFgko9dOLLf5
         SON1kfue0V47sPzCBPIKn60Ylres9661af56ioKIc90wQmwD690Vhdfk5dtvlIfcrQg/
         mCSW5cI1hS+0tO8PfqjVupgz26ygMR/GOEvPYCrzcuVyndSjPOkOyl8hwIkXt5z86ZFL
         xfeN1fgWP3vnDczTdrtUpLere4HvHit33PbUMBicCF7VDrFZW20QTm2jiSMBYfSXFif2
         Vz0CrH1p+I1vWQPUScHbHfPmp1il+5/NiuMDjM13usmJY6jIfYlxLPEUIGL/TKdlVlUT
         cVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482269; x=1795087069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tR3skobAr2sMjA6rolhmHaYXFJaHuy9h+iD9zoIL62I=;
        b=fvhh2+DgVOcU3mDAlKQIOZyq7UOhzYOTeg9588kZIS6NHMEPsJO1wHpYmXSTcezOcI
         7iuRlg/VL0T2TcoCCsU4oamiO6FkhGef4r4Km/bvDrMmM/Qg0W4BrTc5eUa4MJZJcsyo
         xOavFN0tMV/jm8FtzW1NnuVvAevtmxap1dQ/wyDoUp923Ixt8LU9NRW5j37DjAAmgiq1
         Pf1cBRXAytzWANptDBkUoTz3DXAGtazyMqt3d+DuQASqZwktKqiMvuCj6uqUCTehg582
         Py3Bqqk6lyciP4JHHyRnBOYDGLKl/5Mp4wPjPc81DlMi0jDtgG+nE6WbfPa3J1eV8wBs
         yc4Q==
X-Forwarded-Encrypted: i=1; AL+hErFRu69fWkPDcM+MNvLx8smtNZ4535tLzCILaNWTs60YUy7CDjGNiQ2BZ3lEAHmLVII5eC/D1K6fqHAhuZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KDf6HWL+tGIFy58SiQ/mCb2cbB4ZNlYMwj9LJFcH+TFGBa8rc
	PFM0ignwm7Jf5+q/HUBO7AkwBrt5b4DBLAWmGQ48R3wK3v2/N1rhPwxskmPB1VImzw==
X-Gm-Gg: AYBFou0ZRRpvl2852pZnsIBh5xsBtMDCeJ85+ZbiKA+LHKCnn/7ivrsnUkXlqfJejkW
	cuudYiOC0EpfPHiLEndlVRlSjCgYfGG/diaq3GV8MepB4IWMONbgOBWgba7knpNQeOZbkdiBatI
	9nOocZULHLjn9fM6Xwjev69EB/XsQnYZB0wVC+Hxw6GnFgVomsPDgQ83tL+/jrtwDC3b5TCIZy8
	FU5hR6x7TtC0nObLsAqX5r/EQOsFJOHuaLnyl9XelBpf3XulwucecbE6Li/Vb5SgrZb9DGG+SVd
	lvA+mmMMmCt1givFBKo4Ip+zVYNnM2/AuvVGVPlpskE8eDwBsBXZAvbdiqSbxpf23mBHx/G1pi1
	34PyVnmS9XP2Qu9Anr04cwuaxxY4edo18j5pbQx0k13Ll3qyDQE1U4hsJBOuccMUFPQLVEWBAOi
	w54x8UV9k8qYgUzIXubeTFaC6MDAxBmPG9HMJDF1jgbc7joWCvXvEaTF8U77QDtMD/KRaL1fHrH
	ZatKkatsmOiU5SV84+1fQrY5xpzSNjF8Kt9H70lqC+b3ddKipJ7oLHOIfUP1txnGX6+eXIPthhB
	ROgeru1p5XvZ/JUCAdIbydjcEom7TTlg70UkbszcYzjp+SfgyIlH
X-Received: by 2002:a05:620a:4712:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-947b000ce09mr893234785a.80.1794482269108;
        Thu, 12 Nov 2026 03:17:49 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73c3ddsm710100585a.15.2026.11.12.03.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:17:48 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/2] hfs, hfsplus: do not end readdir early after an unlink
Date: Thu, 12 Nov 2026 06:17:43 -0500
Message-ID: <20261112111745.4094283-1-hengyul@cs.unc.edu>
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

Since the readdir rework in v7.2, HFS and HFS+ end a directory walk
early when the caller deletes the entries it has read. Both filesystems
got the same change, so the two patches make the same fix.

Tested on hfs for-next with KASAN and lockdep. The reproducers pass and
generic/637 still passes on both filesystems. A run of 30 generic tests
gives the same results with and without the patches on HFS+. On HFS,
fsck finds the test volume inconsistent also without the patches, so I
ran generic/013, 028 and 637 on fresh volumes six times each: 013 fails
and the other two pass, with and without the patches.

Hengyu Liang (2):
  hfs: do not end readdir at i_size after an unlink
  hfsplus: do not end readdir at i_size after an unlink

 fs/hfs/dir.c     | 27 +++++++++++++++++++--------
 fs/hfsplus/dir.c | 27 +++++++++++++++++++--------
 2 files changed, 38 insertions(+), 16 deletions(-)


base-commit: 34ee5f8c2198db9585da6c181c50869d2eb43c3a
-- 
2.53.0

