Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246061;
	b=5B1hNTk4dfRMG8bTEkou2GnR0r8TB0ksiMppqNOJRUILwBJV6ShEEMAiqtkvZGYBZE5z
	 JjDEuNmqbJygSeIsM40DYMOrUQaVE5QRFOTpbg9WOJ0kHMxDYK+F3XmcDCJr9MzwOXou/
	 qQ4tJCGR49lLCSN27pOx+ACf1NdTMH/uR3mGx795+Xy1takV4IfjN5QIpPBVapMZRrh0M
	 Y3hOeFDQmeZs0slai+6XjNyIMOr1VKFJMP2zaLEdm9HUGmpOV6IcPxHTVanxlKQJkHg6r
	 1p5UR1YJdgVxgFwN7Cm1qs2xu3N3nxGvPKHLvuJR8Wj9sTgd5wJttbFIUvknXekLMkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246061;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GCRdeDN62FtM+yUKFqnoHrimE/0T6e/08Vo8UYITXVc=;
	b=s/FfuAJacUbq0JnxLoS4G/2XZ632cy6P+Eg+HbQ3HWmj3W2sfQ4eVOauAwdn+51L+mbt
	 sdx8viATX8XIy+wCv8xrdZ3VoxmvK0RiZfn4HCsXvWpNFLqlbl1gXOUjfKT8Dn9dzGZdD
	 qO1Eb+i3T90TLxqwBKfqky39dNOj2NHYqqbhrzONaCZJkoqi0Tf+E/RvUR63E4YmAG0Yc
	 7Ac40o7uSskEOauH58KeoZdePA2La9HQ9cE2n3og5vEvzmTQiWIlvNXGk/D48AeLi3etn
	 CSptjB92X9BTST4x34++2xR8jL0jwCdQArqXsM9ZyJG+TSZ75pJinDxlznJ6xJ8O64A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foxmail.com;
	spf=pass smtp.mailfrom=foxmail.com;
	dkim=pass header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=jLDKTZQo;
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ED1606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03ED1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=jLDKTZQo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1793246056;
	bh=GCRdeDN62FtM+yUKFqnoHrimE/0T6e/08Vo8UYITXVc=;
	h=From:To:Cc:Subject:Date;
	b=jLDKTZQo3hony35N2hVGdYpjedFzNno/eqLVSi0yhdh5UycrAiVLQcLFvDRprHwaD
	 QINfcNYRsPR0f6Nq3Hvvhy/+JvAu36M5TkOduzJ8NpHD8uV2UkoAd/7BoDs0GUIRiZ
	 eh4TdeuPJxKV/MjrUFQhZtwDaG9Otsof7u3YgWpE=
Received: from HAPYCAO-MC1.tencent.com ([61.151.228.151])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id D8E8B299; Thu, 29 Oct 2026 11:54:14 +0800
X-QQ-mid: xmsmtpt1793246054toafabjvx
Message-ID: <tencent_A595E3D79A2F77C2BA5A45A9874C46D55508@qq.com>
X-QQ-XMAILINFO: NzvgoOffVB4juEhLEFihLMH707naN8V3KpzDpqzqNjQYFUULDkSLrugGjog4v4
	 yAZTHzQFbl/jNdfIYXGZRAtXj6U1kRGh9rpLPq7mGJ2PIX1S1qmaO3ZLIabnRN3GKfpBe0SjgsLZ
	 G3fRYNU5PEfcpe+12VIm5Kmaxa5FJZqSD/wCe3nRv374La8XNTnPXdkx2lB+xkIrimMrfe/disDb
	 26YaOQ4lWiicIFSIkaV9q4od/2gTAMRFswnXWpH749L3a1fNMMZEHDGle8VvigWWSgrFuN63CLsd
	 9JVeyHwPilXw5Uixca+UmJOfrfoO4Et8ibfeLQvvt06IunVZAeJW7eAy10iGgyBP+58nnCVS9+7J
	 1ngCwhNloF4OQsnWG/5HfsdUX5w6k1oIFmk6IzBh8wCuoSEsh3BnJs8Jcxa11W3Gh/mUmcF5J4AE
	 yr41wma7wnrYhn5wDDy6rl2ToUZzSg533MWKdTnNIhkDxgmrs9KKSzyvMkJgINg9aQ08UdrYSV6I
	 PPOt4ILE267hCzdsfjPAy9XxTkhr+WfD1Z4L0kqe2jX4fpZE6NS00h+gqorbRlG12Dtt4ZtFfYnh
	 Nsm37K2SZUfUZXrhWzlLggytnVrPYwRvx6yZ4Iw+LFs3mQU3ipo4MsTwze+SwTgyDssQLuKUvLiQ
	 mg3CrhkwtNpG43N8xxWqlkLE3ID4tCXY4mrDjo/VTNSBTGxQ7Rfh+CwKV1VeTJBt4fdvBg+Ha4e5
	 seDyFkXeGmQBOokjVEs3kZiNpXtMlldk/PSOUZRWfYmUa7MnfMRM2+V1uzRmSMMuNk/j05tds7rG
	 WbqOL7cJ8DTUjAvOHQk9NH/IGjCydc7nxqOHVyABI/o+DVMZ4IsQVYfoHbbmopOGkiunq8Xcw1tC
	 LteqEW9ddlWaIsGDZaHjOfRviWEKmSSwhRZAOfax5pD6ZO8yy0XNJ/7tivrc9NojI8p4OR37y2xC
	 Z6jUCnev9ckJp8FQlcLUuU/KjNSWHFG6utL2KZ9JXzFhHiFPX55TS8p5vNoHQQDgyfz+n6m+GBbG
	 a2ppMymPFswYrm80JHiHahYqztXZ9pkrE/oJ4oUu9vTG4yvNBes+NLOR/UIOIfv8u845AVRyh/xO
	 M1HM9OdkUc4e1ATaY4j+eyd7fm0NY6Qz1/lvfXrmAjAOno5vz55Kigf/UIdD0gFhGmEPQHk6+w3Z
	 Xlg8w+5XSepWzyVw==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: bo cao <treebacker@foxmail.com>
To: linux-kernel@vger.kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bo cao <treebacker@foxmail.com>
Subject: [PATCH] char: uv_mmtimer: prevent read-only mapping from becoming writable
Date: Thu, 29 Oct 2026 11:54:13 +0800
X-OQ-MSGID: <20261029035413.46318-1-treebacker@foxmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

uv_mmtimer_mmap() rejects writable mappings but leaves VM_MAYWRITE
set.  Userspace can map the clock's MMR page read-only and then
upgrade the mapping to writable with mprotect(), gaining write access
to the UVH_RTC register that the driver explicitly declares
read-only.

Clear VM_MAYWRITE, as fixed in vfio/platform (commit 420bed9131db),
drm/vc4 (CVE-2026-68445), drm/panthor (CVE-2024-53071) and
ptp/vmclock (commit a5edadbae57e).

Note this is defensive hardening on two counts: /dev/uv_mmtimer is
created with the default 0600 mode (exploitation requires root), and
the driver only exists on SGI UV systems.

Fixes: fbd8ae106850 ("drivers/char/uv_mmtimer.c: add memory mapped RTC driver for UV")
Signed-off-by: bo cao <treebacker@foxmail.com>
---
 drivers/char/uv_mmtimer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/char/uv_mmtimer.c b/drivers/char/uv_mmtimer.c
index 956ebe2080a5..98b9c85c6529 100644
--- a/drivers/char/uv_mmtimer.c
+++ b/drivers/char/uv_mmtimer.c
@@ -151,9 +151,12 @@ static int uv_mmtimer_mmap(struct file *file, struct vm_area_struct *vma)
 	if (vma->vm_end - vma->vm_start != PAGE_SIZE)
 		return -EINVAL;
 
+	/* Prevent the read-only mapping from being upgraded with mprotect() */
 	if (vma->vm_flags & VM_WRITE)
 		return -EPERM;
 
+	vm_flags_clear(vma, VM_MAYWRITE);
+
 	if (PAGE_SIZE > (1 << 16))
 		return -ENOSYS;
 
-- 
2.39.5 (Apple Git-154)

