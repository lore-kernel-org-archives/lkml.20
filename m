Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64715346AC5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787946794; cv=none; b=XGmQ6keZ/A0MefgrQBc+tP/1u8HZie8HQDo0pXY55MTQw4jLsMbNofp0feOwXVxzJ4GFMusVy0rnK4F9G9m9cxDjjboUDsVlz2hLr2UfdsaoNle2M8CaakOpOQTQYBptHQCERONVNctGUhLXUhVLaIRamdIpUk99MbVhf2XZDA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787946794; c=relaxed/simple;
	bh=hNjOBPZoCVJ2OUnZZXpfjdQn5Y2nnmtm2v0BD/Bb49g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UAG4lRZGe36xFduZlE1X8WE2Y3QceVBGhpvxKUT7KDpYCEVpLL5yNJsAFC6iNsYVgimIbMSpzE720zj/8mLulvKE+cHvckdorODQxy7HsWdg9dJNVxSdC5PPAVeAUOiipm4fMgQ7ADt2cacSbJRhL4c5VQtVRQ4OVApDX7AWbQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=fbD44l+L; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="fbD44l+L"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2227861a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1787946791; x=1788551591; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQau5ozp4SJ2fm62wmHYMvhDYt9grc54B+joX4EpITk=;
        b=fbD44l+LC3l+gtoa5sYmtdmLAhFLrd6IppXJOlYYTJRldKZHIarBZeyxPotHTkSdqF
         slssAfQNcHNyqg9CA3Uzu/jNWsu2wQE7qA+d1tBX/THi7FAROUePav8b/PO+/F63uyVd
         5JUlTdIE/4CdaDXT5MbhN/SYW14bPwJtnkUgzqHorBx2IxiIG9mOuEkpCtNUiM0lkMZo
         VlOtJ+DqAcI2r0q2B7snJTZf6hUifq677uKYNAemnNm7Px2AdHVt0CEgrOD1eVofGfYv
         7pKIdN15TpleojyJq0X4GcOEGL1+/t6TTsVx4Clv27a/GNw2CbWBkvsihJaz01G0dr7+
         IgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787946791; x=1788551591;
        h=content-disposition:content-type:mime-version:reply-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hQau5ozp4SJ2fm62wmHYMvhDYt9grc54B+joX4EpITk=;
        b=k+iFwM0RPi3RiIf+Fj9+1kHzIx6k+SfC++QeCp5gMB360QBL7p6z/XYb6CbEK3jXUU
         HlFuNVYMe2QVa7pe6UA8PmFOjDN/JJfBEQI+fWrYI2LC1pUVoOcE9wvSalQuCXyY9Dfs
         pAGw8/m82O1d7KyeCroBMy9OeqrpHfVeFaEnTvwuOKFndAQWmg44mSXgKYYu2uyNDG4A
         m3kAH8l5Ey/xU6pCpHJTCdW7zP9ZUdcCOhkv8BJj+0qZj9u/ZFs7LgrxtJc0BczAGXyR
         f2USCtgrLQC198tY32+0UWEZHDNdF1afjy0sDmsARfq/CeqlaCXYUWmurjR0FaV5ES+K
         5RNw==
X-Gm-Message-State: AFuF++nSjDcIlvBvJaDyPVBtzM+vU5a0VLCMe3AOkoPr9Ev8XGLfaXso
	2I0kN/QlDDIbmGj1L6jwjNrL+joitWUf/hF1ydQTyYRqgmzW8OpuhwlGYaED/f5lPeQ=
X-Gm-Gg: AYBFou2viBlz33OluwOijyaNYXeGtz68DmJdOBxfUPsCqEwtk9hyRh78O3/eqnZoqE7
	7P5ZBtR9DhzZTF6I7efs7zvQX5TT02Rl63xhEOScVoeQGUI2MSZRlaeqFEBllSy9k3zxX/pkzHv
	xEQtW3ybDODKqAeG6WQolGBNooLkUXxI3TbNNTuPHPj2nSER4YomOQcFfjgblKONtHxpdTICxWD
	4NAcnTnXwKwH/PK3VGWgGptBTbxEuSWt40st7VghajcxFfe30lPtj0kt1qlxQdKBAk6T0RSh8L8
	x6B2noetrCpLGIsrSy+OSLmB3K5TL+ay44PxVewQSP94dloVUTxc/cIjhKZH6Mvzpnk7J+PwOTO
	B+Fn38Op2vUe5RvDzvsaeHw3eLGVSQ9DBzqTEZAEIk6tsaxftwKGFECnI24/jQFyshLYmo8aJqO
	CW3XCX4JQnb6H6UkESE7JsLY8lPhsTgSPLyY8oBp/HrArxn2LGRlLocWiRtLxhWEh6u6AaxwnRb
	i6RaUoJcXBz6uJB5h929F2OqT4YZqAJviCb58aSZ3QxEQSuTKrPkG6XvDt85ii7kg0u6/HIx+Sh
	Yfhtr9zWKLY=
X-Received: by 2002:a17:90b:518e:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-396d0d2f6d6mr19540352a91.1.1787946791415;
        Fri, 28 Aug 2026 12:53:11 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:7fe0:aa86:24c5:c587])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm13657932c88.4.2026.08.28.12.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:53:10 -0700 (PDT)
Date: Fri, 28 Aug 2026 14:53:06 -0500
From: Corey Minyard <corey@minyard.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	openipmi-developer@lists.sourceforge.net
Subject: [GIT PULL] IPMI bug fixes for 7.3
Message-ID: <apHnIj7efxcTH8i6@mail.minyard.net>
Reply-To: corey@minyard.net
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 4edcdefd4083ae04b1a5656f4be6cd83ae919ef4:

  Merge tag 'bpf-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf (2026-06-25 14:09:26 -0700)

are available in the Git repository at:

  https://github.com/cminyard/linux-ipmi.git tags/for-linus-7.3-1

for you to fetch changes up to 05ec76cfbce653e07cec19b9b8b20e33449d5d87:

  ipmi: Fix use-after-free of cmd_rcvr in _ipmi_destroy_user() (2026-08-25 18:55:02 -0500)

----------------------------------------------------------------
ipmi: Fix some minor issues, add async init

Several cleanup on error fixes and a missing RCU wait and proper
validation on a received message in one place.

The biggest change is the initialization of the driver can be done
asynchronously on a work queue.  That saves significant boot time.

----------------------------------------------------------------
Corey Minyard (1):
      ipmi:msghandler: Cancel work cleanly on an error

Michail Tatas (1):
      ipmi: Fix leak in __ipmi_bmc_register

Michal Clapinski (1):
      ipmi:si: Add async init to ipmi_si

Pawel Zalewski (The Capable Hub) (1):
      char: ipmi: use named initializers for acpi_device_id

Seiji Nishikawa (1):
      ipmi: si: Fix NULL pointer dereference after failed registration

Yifei Gao (1):
      ipmi: Fix use-after-free of cmd_rcvr in _ipmi_destroy_user()

Yousef Alhouseen (1):
      ipmi: ipmb: validate write message length

Yuho Choi (1):
      ipmi: Remove all sysfs files on registration failure

 drivers/char/ipmi/Kconfig            |  9 ++++
 drivers/char/ipmi/ipmb_dev_int.c     |  9 ++--
 drivers/char/ipmi/ipmi_msghandler.c  |  5 +++
 drivers/char/ipmi/ipmi_si_intf.c     | 79 ++++++++++++++++++++++++++++--------
 drivers/char/ipmi/ipmi_si_platform.c |  4 +-
 drivers/char/ipmi/ipmi_ssif.c        |  4 +-
 6 files changed, 86 insertions(+), 24 deletions(-)

