Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910337;
	b=MRz8Kr7Q2vxHKHZO3D6NGhQTN1TJhIeDlmCXYQUkzXxliqHlW9usSFikpCyWYP+jhQ57
	 kJBWkYS3CcdpZMQA3yXYPIAoJ+fnez4SnJuD/YD4mtCNjYA1IlBK8EA6JJqc3i1uNdYvY
	 b1lyEFFVObRLDhjdxRXz8i9MQtXlBb087DbFqdD6uPMpbf/MmqKX5bTYgvRYD6h7thqmI
	 jJwSeCDFL9LK1OLQbAwegJh6ntVjSSJYlv54CCQiWLh7HCOTCpLHY3WGkVS4mQEGUUOJd
	 YkjRB038DYUyBU1hy0v41hurg1Y4fgGPgGcg1AcI3SupiG7Apnm2zOdXHyEvMwMcMPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Infomaniak-Routing;
	bh=gyRxjx+N08McOgkiPKprbmzlzILJehlh93QhGWzUcJ0=;
	b=u2pk/dA/g/KdxReslngTU7DNcPgcSTNhUWdoMkr6Hh94wwymjWGzJlCGTXc+vwScTCRw
	 rOCu4A7EC6its08CC/w1KGkgv7eqdT/7nFWJ3a8fpQveeaS3jc1jiMJOzvbQesgQ7/1ti
	 x4NQLu15ICIWL1NH2dgarc1mRz8AeGGxpmWYDzmfd/z8yeYQWgg+Kg16ydFVmWKTwFZmV
	 GahE748uUA/jJrzHi2lgPy3TmviBKmZN0MrZml81JJ78MllyAl7NavPKLfTGN5hQGNR2i
	 G1BIOkaipZxBP489HRTWjZHwh/p0hxLz5EMFAyoidDssmhNS3W4ADESyXkeSzaZmqIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=nHhOxJr+;
	arc=none smtp.remote-ip=45.157.188.8
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD837606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD837606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=nHhOxJr+
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jTLBG5hrfzw1s;
	Tue, 17 Nov 2026 11:12:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1794910326;
	bh=gyRxjx+N08McOgkiPKprbmzlzILJehlh93QhGWzUcJ0=;
	h=From:To:Cc:Subject:Date:From;
	b=nHhOxJr+GK/f4yDEX29tGjMPr8epPdaAJcBdA0eBWY8l6HqTeVxNg536PZQNw+tqT
	 cxZ64jOrhq2RI5RKKqaSoeNTpcX9bw7JvOnsnXP+Y5Itu6V8/f+egqCFI50qk5btHp
	 RG3GAU7M2M6nknjCtYHdm5BFUmxDEprBZDRFJbvk=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jTLBD5vtcz999;
	Tue, 17 Nov 2026 11:12:04 +0100 (CET)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Ada Smith <adasmithgt@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	James Morris <jmorris@namei.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Paul Moore <paul@paul-moore.com>,
	Serge Hallyn <serge@hallyn.com>,
	Serge Hallyn <sergeh@kernel.org>,
	kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH v2 0/6] Fix Landlock mediation of commoncap's capability checks
Date: Tue, 17 Nov 2026 11:11:50 +0100
Message-ID: <20261117101157.2520463-1-mic@digikod.net>
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
5 adds tests, including audit tests, that fail without the mmap_addr and
capset fixes; testing the admin reserve would require changing
system-wide overcommit settings.  Patch 6 fixes the documentation, which
overstated what the permission restricts and how its denials show.

Two other direct capability-set checks are fixed separately:

- PSI triggers (CAP_SYS_RESOURCE):
  https://patch.msgid.link/20261106120004.90041-1-dennylin0707@gmail.com
- user namespace uid 0 mapping (CAP_SETFCAP):
  https://patch.msgid.link/20261110144205.2404088-1-mic@digikod.net

Changes since v1:
https://patch.msgid.link/20261110202436.2408244-1-mic@digikod.net
- Replace the admin reserve test, which changed system-wide overcommit
  settings and was racy, with a comment, and fix the mmap_addr tests on
  32-bit ARM (reported by Sashiko).
- Add Serge Hallyn's Acked-by.

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
 security/landlock/cap.c                     | 110 ++++++-
 tools/testing/selftests/landlock/cap_test.c | 336 ++++++++++++++++++++
 tools/testing/selftests/landlock/common.h   |   4 +-
 6 files changed, 451 insertions(+), 21 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0

