Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342295;
	b=e6Z2w7sAEn5UIEmEt3WYhJssDkH5A2CR3t/h6n6/FdWFYixPdl+Bff1vpx0M3Z2HIy5J
	 UHzO1LDURDIQu6ghVrzMraOeV8/Su077KDeAFZSJfWMHA/Hfx59WS9HRO+bNMMUrcmDk5
	 Yl9BNoROfR2DdVliFtuxQ51PeBRlmwZo4AQGxShHONPkh9FiOp6F0TNM9hj3Br+JROLcT
	 ymoguPJefBBX2WB1xQPZBDYmll+LK2ouEYzBZv8vU2Tua9jJZEYyHLnpc5/6l8h63ezvq
	 8ygpeOp01SS1m931MZnbJYQiVDNTKvl8von/TBPv7DDLqwy0Mp/lDARksfp1ULUkxpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342295;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Infomaniak-Routing;
	bh=JD53r4Sm6V7IRTeFFtDypDCCPUaM7VK8r29zklvgDC8=;
	b=kfCqWqyDjreFs9ZEay8R34XulbPHpaDb0symVvIPvgS258/dSMFAEP43Oe2EkeKmptLL
	 OC2g2TsgyNZp7mbOchUrHvtbMiOyyuK0OzREOI0lPUY687Sknz8wVtpL4PXdWygDn3/cR
	 HCPtA9gFQy4B9oGmTwS6tPYk7NfpsdljKcgwWq4eVfCpUt3OeQkAASNZqRJxm/RVCi3/7
	 EXnucXBECQ9SNrDSSA/mOQ441OWqYbwgbvr35+xrt8viYCWqPEUt57tuDDxuAOSmi1jUE
	 7HYRE29NFy8LxG2JdOi2Q4kHegaWeq56T0vZljzbeqmGgKft3FN53u24BsAbLba64qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=w4LV+iPw;
	arc=none smtp.remote-ip=83.166.143.175
Received: from smtp-8faf.mail.infomaniak.ch (smtp-8faf.mail.infomaniak.ch [83.166.143.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89411606A880
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89411606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=w4LV+iPw
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jPJ6Q2ChqzCH0;
	Tue, 10 Nov 2026 21:24:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1794342286;
	bh=JD53r4Sm6V7IRTeFFtDypDCCPUaM7VK8r29zklvgDC8=;
	h=From:To:Cc:Subject:Date:From;
	b=w4LV+iPwI5QUkGSpoYplLbwRrG+1fjol/dIJ4yDeXLx0WUnbkYBMXeAN59NHxB1u8
	 qrTpHVAfY1AT3ORrQKyg1dDZbZlD9c9UBD8QkmA5HTWIBzXQJA1XiPDpKFKZaaoUHJ
	 +MSsYmUFstS3yPg+T4HogMgtdWVDcr/9XMeyrfOY=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jPJ6N4Kq7ztbS;
	Tue, 10 Nov 2026 21:24:44 +0100 (CET)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Ada Smith <adasmithgt@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	James Morris <jmorris@namei.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Paul Moore <paul@paul-moore.com>,
	Serge Hallyn <serge@hallyn.com>,
	kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH 0/6] Fix Landlock mediation of commoncap's capability checks
Date: Tue, 10 Nov 2026 21:24:28 +0100
Message-ID: <20261110202436.2408244-1-mic@digikod.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Hi,

This is series 1 of 3:

* 1. fix Landlock mediation of commoncap's capability checks;
  2. fix PR_SET_SECUREBITS mediation and add focused Landlock tests;
  3. fix Landlock mediation of capabilities guarding LSM policies.

LANDLOCK_PERMISSION_CAPABILITY_USE, merged for v7.4, denies capabilities
through the LSM capable hook, but commoncap's mmap_addr, capset and
vm_enough_memory hooks call cap_capable() directly.  A domain that
denies a capability can therefore still:

- map memory below vm.mmap_min_addr (CAP_SYS_RAWIO), which defeats a
  mitigation for kernel NULL pointer dereferences;
- add inheritable capabilities outside of its permitted set
  (CAP_SETPCAP), which lets a privileged sandbox without no_new_privs
  gain capabilities through execve(), although the domain still
  restricts their use;
- use the admin memory reserve with vm.overcommit_memory=2
  (CAP_SYS_ADMIN).

As SELinux does, patches 2 to 4 add Landlock's own check to these hooks,
with commoncap's conditions, so they only deny what commoncap granted
because of the capability.  Patch 1 factors out the shared check.  Patch
5 adds tests, including audit tests, that fail without the fixes.  Patch
6 fixes the documentation, which overstated what the permission
restricts and how its denials show.

Two other direct capability-set checks are fixed separately:

- PSI triggers (CAP_SYS_RESOURCE):
  https://patch.msgid.link/20261106120004.90041-1-dennylin0707@gmail.com
- user namespace uid 0 mapping (CAP_SETFCAP):
  https://patch.msgid.link/20261110144205.2404088-1-mic@digikod.net

Regards,

Mickaël Salaün (6):
  landlock: Factor out capability denial checks
  landlock: Mediate CAP_SYS_RAWIO for mappings below mmap_min_addr
  landlock: Mediate CAP_SETPCAP for inheritable capabilities
  landlock: Mediate CAP_SYS_ADMIN for the admin memory reserve
  selftests/landlock: Test capability checks outside the capable hook
  landlock: Fix capability restriction documentation

 Documentation/security/landlock.rst         |   8 +-
 Documentation/userspace-api/landlock.rst    |   8 +-
 include/uapi/linux/landlock.h               |   6 +-
 security/landlock/cap.c                     | 110 +++-
 tools/testing/selftests/landlock/cap_test.c | 535 ++++++++++++++++++++
 tools/testing/selftests/landlock/common.h   |   4 +-
 6 files changed, 650 insertions(+), 21 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0

