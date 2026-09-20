Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC6E23D7FF
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789870039; cv=none; b=ns1IVAsYrJA2BLe0eUu0YWESjWIJ1mVO7QmXL8ozYUz57NBmEWNDG3tDknY0Z4yethhiqacwNESNTHSEbPcJF4q1bNCoESqx/0wU5bSlRj41DsiOczV91ETdTKPTxAwm3KKGIttz5K8FTQwr3aGTcUIBGzJ3BYBxaXBMa4aCSHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789870039; c=relaxed/simple;
	bh=v3ioTneesQ4IhyYIfJxKV4qgKfus9Larac1jgDv+YKU=;
	h=Date:Message-ID:From:To:Cc:Subject; b=eZPfMTZgaJeW5LRtLyoe0LKBK6y4EKVa6kWyimOLTm2nCKTeAhScgj1Vb5ZcIPycQygrlL4anDB3XrmkViMmKILmzOqhUVMpxbysWHdHFuP+vGQWlRGFwyzTgNmYaTkzbD1SHm2B6cTaRtVsbIkzyqOoUcNagpC7FQaUlE03xyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=f72xp97m; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="f72xp97m"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-910537b51a0so17856576d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789870037; x=1790474837; darn=vger.kernel.org;
        h=subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3+zGNgJRkxBaioG5ib3jA+WMEMkM7qf13aN5UYh0n8=;
        b=f72xp97mARjRcuBps6jbRNZ7PRLKmF96Z0UzNvppBVEZEBzPSfC/be0f53Lmek/qcw
         +oEMAzIY1u5NG+N1dDL5Q5Cx6whNdo/Sx/IQ/+REPfHT4SQAY7qUyM7UD0eISTyFgw5m
         /Mn06FdHxgIZ7y8dpKbTS59Uc/wrC807Gpu95w6NFvKGNNFqpA3sB3WqtAVpcn3UdWYC
         0JUiI1ndhrmFhIM5rtY+0wdJBPKIRRa20/iP0521s/pIkzV2bAp9raYshiyojNaTYbok
         K0SmnYOBG0rSfKcd4u9xTROuaWC7wL/ZyciP+DRroV2j2/bZ0OJW0IoAU6YS0Cjblr0L
         293Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789870037; x=1790474837;
        h=subject:cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G3+zGNgJRkxBaioG5ib3jA+WMEMkM7qf13aN5UYh0n8=;
        b=gzLVM/xc9VGUoI2zN/KwsK6AAaMjHRjQYQdp7pxBHBX2RbVC3zWYYDH/OHODnCac4U
         dlag+Rc9KKcKXY+VAPhSj1jCQi+nqkJuZJ4hg5S0cXzpfxlV27EWo1oF8TCSCADESjNZ
         sh7SOA7lGf/0u0sYmjNKtDz6UdyX8gXRe7kiKhydZi8o/gc30aC9mIJM+G8zhpJvgdTj
         /vfAxSYBuaO71ojGE9D8QHRreBkGQy1aLGwY0OnozmKUFDTNhq68TlFvTbD7JWKsYr28
         OYvRgM7PCrpzl8+9L3TVOZGV96S6ldHHJqEHuXStu7gdZhuu/lrgemxZjV1EGqPfSUst
         OiWQ==
X-Forwarded-Encrypted: i=1; AKwUvByqPvfPQMKQBY1k7rCrpO7H9219GUGAbidbSecW/qEqcutaR/LdEeedRhzb+w3IA6vYSDxJmFT8TSl7Y68=@vger.kernel.org
X-Gm-Message-State: AFuF++lrjO+059CJRjf8gAfeAe6tefqq18izA/GMXb0sZcluz/kEm75T
	6IiqzlNuFzV/4TNYqVu50RhgVw5iX2KZZS4avxlo0uefXUpdoDhQJeBGlXjvdMAUGg==
X-Gm-Gg: AYBFou3ISuOAeMdVgrjpGYO/EBzvzIe3nhJGCz2xQtXIPJLKXHIPLak3Y45nf/TC0Kj
	E/eSJuZyy5RJ3eKlMBbjDa2AIO3BQ3oVLVmhNMHaTxUnnOUgxDdymaVkE7wzqXy+/JoVQa/iQOv
	5a+q0ekrDPc4/HRcQe/CWZPAnrfG8G8M73G9oI9gi4+wUNYEprWS7GsR2eIpvMUbbj5UCRJTWFg
	alwQEB2sXLoo/Srpwe2Ancb84HWWBl+zxuu3PE0L5/ii3/Etx+FnuVubIfSwiJuSAt/67ovNVVG
	/zf6gTU/xKUhuFP/8HvHcYD+6KaDX62qqlMP5NrpeFnvGlbfRpDLpS7u5RXb0/CBiW2EOyYSYUH
	BFAfEn5Yn0B64y5gHNdP4jfESoXSYrs6WoMRfBA09qTAJ3594C+vvtlPagZIk99nFCj069DA97j
	PrfmAfQfqGif79RHqo8lnB7OyTkfK4LvqWqpGjdm1Y7KfSXt+s8vKN1FjXW2/KKNvAGEndt10mb
	wTD19KC8z5Tnq5fFaA74cqrDRK0MHRBMBCejE1EEDOeiUb1RYnaAHIPs3W/OWDKqbAxm2l3Ek5y
	/Q==
X-Received: by 2002:a05:6214:ca8:b0:912:5951:179b with SMTP id 6a1803df08f44-912a8017caemr43115516d6.30.1789870037098;
        Sat, 19 Sep 2026 19:07:17 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260aa1c03sm33242166d6.39.2026.09.19.19.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 19:07:15 -0700 (PDT)
Date: Sat, 19 Sep 2026 22:07:14 -0400
Message-ID: <932d0e418d78fa40b5d18951a34876ac@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] selinux/selinux-pr-20260919
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Linus,

Three fixes for Linux v7.3-rcX:

- Ensure that the cached SELinux access decisions are correct.

- Fix the SELinux overlayfs code to properly track the top-level/user
information on multiple stacked overlayfs filesystems.

- Fix the SELinux overlayfs code to properly enforce mprotect() access
control policy on all of the different layers in multiple stacked
overlayfs filesystems.

Paul

--
The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git
    tags/selinux-pr-20260919

for you to fetch changes up to 78fc54b934bfb2c18aad8154c7302067146946f9:

  selinux: recheck intermediate backing files on mprotect()
    (2026-09-15 23:30:07 -0400)

----------------------------------------------------------------
selinux/stable-7.3 PR 20260919
----------------------------------------------------------------

Christian Göttsche (1):
      selinux: always fill AVC decision in avc_has_perm_noaudit()

Karl Mehltretter (2):
      selinux: preserve user SID across nested backing files
      selinux: recheck intermediate backing files on mprotect()

 security/selinux/avc.c            |    5 
 security/selinux/hooks.c          |  158 ++++++++++++++++++++++++++----
 security/selinux/include/objsec.h |   10 +
 3 files changed, 150 insertions(+), 23 deletions(-)

--
paul-moore.com
