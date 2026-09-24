Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744763AD517
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248751; cv=none; b=cT002zp405uMAxL6joEx//n0t+EHhMf/gxM/pCw9TO/gnNXxsZ9upSCBCQmQsk6RCCrGN7OShqissk1nBC3mwv1qhTe2KJS/GTvQ0ICcrNV5TbONcBwjICGRT3FUBBPsm3gzr54rCb+DF8vKTLkfLhWRCF1Y4bT4NvdrgUspkz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248751; c=relaxed/simple;
	bh=CLS9B+9lh4IbJB3wLue7CooZ1P+HJ0GtbcrV+OO8OSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SMoEttu0Zgbws6ZouoNCjw6vwSLiE1mLuMJ8AfDuzMrh5R6fk9bm2+p0SBKUoYt3OLkmGF4Xm5Wc8sW9zp/pTAgkEY7l83j5tNxhf4kM++rULGvVXjbxFTZM8s4ulTuYhxC4oUnfcnDyCKhhvZN+p3QR/+yTmzhDUHsHv8+Zxtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=PGsAylr8; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="PGsAylr8"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso11592045ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1790248748; x=1790853548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FV0VdW7HwixvjdTRE0p4MejtpY9br5Zjd0AQ97dpeNs=;
        b=PGsAylr8BWLxQOLywSpZifxnTqYmxT2Njgb6Slq5wOPntIj1sEdKna80Uw7Fd2DgN6
         6pNOAOH6biv9LgL0AhGMx7sHIe6cTlvW5390vNDx36WUo/Tjuw2+JBbqRCtj+sYpb4jj
         +OFyriAeHy4Uz93C68nZq4+M7X3fr4y7PNTXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248748; x=1790853548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FV0VdW7HwixvjdTRE0p4MejtpY9br5Zjd0AQ97dpeNs=;
        b=yFmYVCbEbud8DfxVsluqShA+8SNHwiCAOEudrugpHKDs9TPeOykDDjHmpyx6m6FLMu
         R/kmpbS5jowBe+x3aGLHf3FKB4vaRdtYxp1V4BvZ1Y2Id4V8LwxnQq81OpDVJ40Llez6
         q0MAlvTdkPalrfb5bK1ilb8av4SxQ2lNWOIvrbqPwXYWEJ1xiaLAKhCjt3r1qb43aOgt
         /3YI9AG8DgwkSxh5jlF1p5JAFWxtjSNRHF3fFkaKg/CL6THHC4SPDBZQGUScPdReErIZ
         PnsIeIa8JduEQlL809tMs9OF0OHnwj0ffXL9VJXbi5EYu0fshfDd/8ZRW9IDnFOPZhwT
         fzKA==
X-Gm-Message-State: AFuF++n4dFleMe44xe9HubhhoXdC8XnXoIRMx7hnc/skGfyrw5JgRkG2
	ulKJPu41k7xzHn5iVDzWbmeISul5936jYIEKIm13481if0Na6K+aq8nrKM/9eFm5yAdg6LfNhBz
	2x9q3gLI=
X-Gm-Gg: AYBFou2kSBYvWZRWFNERWDFbCVcHPt9koVhqSgWCu1Dm/dcsTAXAjLbCmQauBJgVrS8
	8inZJiApcik/vkeU8+VacnzTfOE2b0RDnvrZ04GmDCi8ebbxyHyCgauOuVR5jA6n9LbrGK2QOzF
	jHGpcn9AHR2qA/ixdhdMbcRCzmVqUCz/FEvTnfgK2MxElvC0PGdUWOEZFmUq1Y+Bpbm4uRoB2/p
	GKUz3kaR9Ab49fTrlBl2rF0WFfZy228TetsxOyhCEb9XeSBWFpu1aUh/povT6W44Ao30iHv/DI0
	CZyaP5IXuFqSfdcHPPA61GC8HHsbPjgCufVvxPGzmxfb+Ui5fMMUQzRLnrhRy7QAfIBqO2kVKZw
	4FVHPTdfbHoHfRMT1uNnPutEIsnoC+CRQr4AMYVPm5aIp3g/aGw+ZXF/5zdjgzO4TZyXOLMys28
	mvIGncCSTem5xLWkapsvJcSp4auEdnEi0QuuapWojRybnTSTMqh4F3jPrXT3mmeYB7NiWlVEtI9
	rRXF47rH8XH0OuWgq9UWRHQ/gsCEu+oK/pUGto=
X-Received: by 2002:a17:903:984:b0:2dd:c100:4246 with SMTP id d9443c01a7336-2df7e13c585mr17844415ad.42.1790248748593;
        Thu, 24 Sep 2026 04:19:08 -0700 (PDT)
Received: from shiro (p1935159-ipxg00g01sizuokaden.shizuoka.ocn.ne.jp. [153.129.99.159])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2df6a5c18c1sm24683465ad.36.2026.09.24.04.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:19:08 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: sammy@sammy.net,
	geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 0/2] Make sun3 work again.
Date: Thu, 24 Sep 2026 20:18:49 +0900
Message-ID: <20260924111851.3501100-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Short version: Have a QEMU fork that can emulate all of the supported
m68k machines via the magic of LLM. LLM also fixed the ones that had
bit rotten. This series makes sun3 work again. Commits are cleaned
up but I have intentially left most of the comments intact as the LLM
debugged it not me.

Longer version:

I am reworking some stuff in my m68k tree and have added SMP etc.
I wanted something to test I haven't regressed all of the other
machines so I gave claude the qemu and kernel sources and told
it "emulate all of the supported m68k machines, try to boot
their native OS first, netbsd if there is a port and then linux."

It took a few weeks from what I remember (emulating 030 macs is
hard apparently...) but it was able to do it mostly. Some of the
natives OSes use the MMU in weird ways and it gave up trying to
model some of that in QEMU. It's pretty sure it can boot Linux
on anything with an m68k CPU now. It even created Palm Pilot
emulators and tested the 68000 Palm Pilot support.

While doing the QEMU work it also fixed up some of the machines
so they work again. I sent a patch for Apollo a few weeks ago.

This series fixes sun3 to the point you should be able to get
something to print out over serial.

With some further patches to add a real serial driver and
it gets to my nolibc based userspace:
https://gist.github.com/fifteenhex/e97322216d5e85e7a54a2adfcba08e32

The real serial driver is a lot of code so I have kept that
out of this series.

Daniel Palmer (2):
  m68k: sun3: register RAM with memblock and set the low pfn limits
  m68k: sun3: add an early boot console over the PROM

 arch/m68k/sun3/config.c | 46 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

-- 
2.55.0

