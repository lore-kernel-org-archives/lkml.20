Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294023B9950
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792210480; cv=none; b=rDouLSEbKAmBig8DgKzL/9y7MjcfXZZh3T6Gu55RF425uEQINOo9SvsXX9WUr8V16dylHU0w4PRlbMWRHTjM3PkO0/gSZ0E2yqHlnTDarAkrXao7DUZHof6QfVoPITEfTnT6liPgA5OzVGrZ37tGpZRYepSZNYYR28MA540u+vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792210480; c=relaxed/simple;
	bh=BriZC6DxZrhy5N7Op3EpDAZGaSlOcuqXDcaA1Y4+xCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uAGf+xeDI/voNmM+W4m6MMlnfjfAKx0leyi2JzrqC7d0Eh19vYZ3kuwbtYgZlLcr2ZmbQNMgZVqRp+dVG9I318hocycv16B6nxS5AqKgaoJRv4/j4Swq2s6uYSuzT0DkEKORriSNMjp6Yqq1wp4IxRK38+9IZvkKfakVZOkrrV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=PGcCkczt; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="PGcCkczt"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc147d86bebso400586a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792210476; x=1792815276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OgDC/ta2AGryucvreeu/Kd0cvPv9S+G98Vpr8co/uPw=;
        b=PGcCkcztfa5r4uN7V6QPvbDFLghssh2OuFlAn4J05CUR91MWPaKo1q6rwRTERkeaLg
         MeCJ9cAF51qR71En2k5PJ7qm40c5ZkLEBtnfRY65lm4EWR9ndAYdzQdf1US/8knN9H7h
         qiGrG0ouUaEy6kKPNdT5Ye+KfM7BJNvyMXyfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792210476; x=1792815276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OgDC/ta2AGryucvreeu/Kd0cvPv9S+G98Vpr8co/uPw=;
        b=mqJ+MMffreHY2Q9R2sFl2+sRWvGKjiZjT/ALvoo3rnPH5l5gGp+gXHvKRV4lxn+Ndz
         DIC/GQmMtsMnPsCxZqU7Ru8fusNJDp4lbO3KKllbZnXgLtdWbG8Kvlxh0YYPAwsIP4Ur
         k28XUIy//1/Vj/noJaGkAaX/LUmHLL/+iIGX+QdsDR9oHxIpqsVINkT1V9bup4CLN5CS
         jUVL4hF7ggUiO0IAPLeLX2092H735/voaIcZNTCxaSFN0IPNvY7ABte6ZL8ZEKcxrA90
         e7fQTOnn6LkriWsx923lKa3Nxfjc831R6hHElZVPZfFOzZpF6chzRrjhYdgaS04Qv1KS
         e4rg==
X-Forwarded-Encrypted: i=1; AKwUvBwYATPRkKr/Doofzn5x0CAj9Baq36mXpDi5cvmxFW+dR2vZu+SJCrOfr+YQRXV/qbz28G8Vc9URRXaSwVY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZy9bmptbX+cau/4NF75gCPtQNULHh4UIrqnk5u/u707BE/DPt
	+B4EsXxWH+qilpmocOnB/r2hbOK2Od52eQjK2782gNXds7V4hTFBHMMIjL+wmwe3+W6MvstUpL4
	tmgjd
X-Gm-Gg: AYBFou01hoUSvggAcCS3SBd8A14O4cXQQLv8dGg1nZ2V2+Qjgn68DPXDJMhUrvk0P3a
	vvWU54uHd39yPHqYqT8C384vhmLfIgfkQZIACIXpgO5pqIhGDoaDKPLQI2ypodkPs7ZB7GQLZre
	pDeB7eXga5nTKNfzVnnAFeW2UJcKbzLpxsfRl1+FwL5YcLxsjNJNs39BHkDmpZvw8iEfqAjKl7r
	gdbAX+HzAO577YbwsGqh7XnphphaeKQ/xEeS4KDHn4WGclpL3Vky83p0IcbgHZHWyxwv/fqTesP
	uR3lTcxC5g1b/npw0PjpNLsJeGKMFsoEA3SgkvITXYsQ06cbv9ELSlC2nmTFSFqnLTOlJg7wcK7
	oNnufB+roz7zOLiZ7RzEcll+QMLOxStXC5nINlfrdVDBox7r9VolqW3S/Cq2r8kZCaafTop78bd
	mSIUhif2zttZ7KtiM/Dp1cgN+Kr/R7brPYkLU4+EMX2RQPH0R+kbd+pCQLW4fk2XVp2beP88sUf
	VFfI7Feb7ort9ARhFyHLYjv00Caw6IOOsCk34Ic
X-Received: by 2002:a17:90b:4c92:b0:3a6:f6b0:30ce with SMTP id 98e67ed59e1d1-3acef55d641mr1125765a91.36.1792210476334;
        Fri, 16 Oct 2026 21:14:36 -0700 (PDT)
Received: from shiro (p1722188-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.166.142.188])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ac945e72c6sm11609714a91.5.2026.10.16.21.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:14:35 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	dlemoal@kernel.org,
	cassel@kernel.org,
	linux-sh@vger.kernel.org,
	linux-ide@vger.kernel.org
Cc: geert@linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 0/2] sh: Fix IDE on landisk
Date: Sat, 17 Oct 2026 13:14:17 +0900
Message-ID: <20261017041419.311921-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I dug out my landisk to look at kexec for Geert. Since I'm lazy and
LLMs are good at fixing bitrot I let my LLM work out how to get
it to boot again.

There are some other issues (perf is apparently borken, there are
some issues with the decompresor and big kernels..) but this
seems to be the only thing stopping it booting with the defconfig.

Disclaimer since we don't need to give LLM tags anymore:
- LLM debugged the issue.
- It has been checked on real hardware.
- I have checked the IDE driver patch, cleaned it up and
  cleaned out massive walls of text that LLMs seem to like
  to add but I have left its summary of the issue in the commit
  message.

Daniel Palmer (2):
  ata: pata_artop: read the ATP865 mode register through pci_iomap
  sh: landisk_defconfig: enable PATA_ARTOP for the ATP865

 arch/sh/configs/landisk_defconfig |  2 +-
 drivers/ata/pata_artop.c          | 12 ++++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.55.0

