Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677655;
	b=KH6C5cvntvxOl4tcxNBjoLDGbxVlLtX0ixbSoDnWvBv/HaLCwl7E3YKJ0b3x+iDljcis
	 vLyOJyVgApTRF2+du62bu2O8CBM5Sc78vzN9kzD2hyMgkwmRuQdZQ6mKFtKItTEgp21VB
	 VSQFMYh/doXrqLhXAUkqRS7bWXs/Ka8tL3Iqr7SiaCYcfi/9pMl5NbwZP53Rwy71t+u6v
	 lkWCI1eBzvSBrr8eM8EDRBMrctkIXhQPwVDvEzD5dIiEJlmSZIDfmGju312xmhm/s/Lbi
	 MdjUOG70xE4Zm/YlRA2aXCxhLE3Vt4qZ9VKr7aJJtGpPnKwrR5HTiaq8NNJhg8p15XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=9igQSf6DxAgHu/mruOqfjXiz0BwnF03dcDyZmMucM/k=;
	b=pUxX+7saPMgZ/s4qAGsqjCwLUQLrFSgIOzyIQwICUFH4WRPBWEaErdCyM9oegbWa7dJk
	 woUCrDWfjvHgTgs/PxzI2M5hjxbJDBFyc6SqFYr7gCXIdoipZ+G0n+sflwRzj/sGEat82
	 A292XigcJZSxoMHnJo5ee/n2naP3qVwZce7XG2DfAfOdY0fVqFOxGYVtThz9d/1ume2WS
	 EJxOfC0NOspPED84XJNWBArx109wQd4BQjcdMG8G9GVNoCtzRmE/WIq0t4ftvJh1XH8il
	 0rl1gnOvckbHQauVEyizXbjF2wMr7o08cqL1TOorLia2IKneluRghY2lrmut09ZAi5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=InqnsJHy;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF6B606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EF6B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=InqnsJHy
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so15324075e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792677652; x=1793282452; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9igQSf6DxAgHu/mruOqfjXiz0BwnF03dcDyZmMucM/k=;
        b=InqnsJHyKWA2U1bNEfbBRmP9dqXEskfN6dtfKd9mMd69DRQgV5kSCx8yCaaSp2Wrk7
         UsxBC8XIN3UOpdqw4niuPfG2TQLTqTwL74trGoO6+f5YmiDjnz9sjS8cwapEIxr7Nsb4
         1HihJMxRCb+t59KQC2pSQhvmc061FQP38dnyqspr9upjbUD0glT+qx41i7MoF8PJSdeU
         UtBoWlbyR6zuEa0YzsSf7p31dH40gshM8Jk/RL2I8Cw04aDIxkQ8HCxkgntnr+xllJOc
         li/X8mLbMXP+JfcbGWyl5gptyGItRTjZYElSAETXkFPMQeOT4vSQkmTTHSFQTB14JCl8
         xHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677652; x=1793282452;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9igQSf6DxAgHu/mruOqfjXiz0BwnF03dcDyZmMucM/k=;
        b=GwQZAtRo8j0t6dd4QDG4YCR6402heXOlXqbp5EhIS9DeSXq8Zj+/y1P0FNobAoWygg
         5nE0rJH74lzqLhEpGHUqXT4NePVDZe1CfU8d0qiFpGdyExDaWCsrDwimD9+XIWVNhsrg
         ryUbqSRIrvxXSsYxT3ns5ogklvW+xSpG/ENjWtGFTWq7UuxJo9Pp8ouVSMhM307B/Uv0
         1/jFm+i/2cmCXUrIx6i+UustZj5NStbVcUy7CW5un3Usc3yHN9d1GT0ymXF7Z+4wCRkS
         pPDNnB6FfOxN82nYrcx5fWP9T/NQWH82jwtQOkHwiNRV9hb4rPmNEIwl4fpLQ+X2aqeu
         QH7w==
X-Gm-Message-State: AFq9FYKEMeL5tTlkpmFMNoSFtRkMUhw6oFH6Tp5QTgnQ2BaowTT5/Zri
	ODQ/DnauL8zKgeC4Gdf6u4GVsPMfx5v8xaFLqCga67J7qfOtQO3VAkkOR/0K1JkcQGD43mDNxXv
	AEAwQHGg=
X-Gm-Gg: AYBFou3si0S/+xHxqz9FRDkoOLPr894Y60ktyVLFOeOt3DvgFnYZs4iR5sqa0F0o/P+
	73XwU3BSbvq/wSgypH9RWxPEAFwQ55pI9NE3i7sjKgh55REc9auHWyMsaGNfsZAgmaN29jYNSuB
	IR+u/10VmMy6X+rYxMSMdIrkBlVi05jbFlQjD0hTyjv4xX6iAml8l8RH2OrPX8DLwra+qCCWOi/
	CGcChKxYlEjrwp1ymR6hb0uSoUWk/nQKzVh6b+0RQsQwgRJzExHCr9dLq/33wVFw+JhmxgAR+vh
	OAduwSz8QUaMDuq7+01M13Gm44Jg9DZHB+p52+OsdHEcIEl0RX7epKik+mTfoseY4mWKmrN/tch
	ec3UpfZAQGTt9hOYRsfOYqtdOzVF2Ui9bO3ayYF3e4C2KgBkffvHh3nlLa6jh/yjR3exPIw4euD
	2LRMEGOlKwiyNdqQI6D84iMYGwDg4sj3zq2KBqnu17hrM3LPiVXIjTkCTDilZSPZ8aBdTobsFS2
	+gsOVWYHEMiV+zagsz0j1dwFUubKfei+byX1IJFjlsPDcQbb/ApqhtRUvBJO1Wi9pcjdyfA
X-Received: by 2002:a05:600d:8646:10b0:4a2:390:712d with SMTP id 5b1f17b1804b1-4a203907493mr40326325e9.33.1792677652321;
        Thu, 22 Oct 2026 07:00:52 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a71f6dsm71111305e9.0.2026.10.22.07.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:00:47 -0700 (PDT)
Date: Thu, 22 Oct 2026 16:00:43 +0200
From: Petr Mladek <pmladek@suse.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org
Subject: [GIT PULL] livepatching for 7.4
Message-ID: <atoXC68mgjNhxhJj@pathway.suse.cz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull the latest livepatching changes from

  git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching.git tags/livepatching-for-7.4

================================================================

- Update maintainers list: added Joe and Song, removed Jiri

- Prevent removing the livepatch module before releasing all kobjects

- Ignore debug messages from other subsystems in livepatch selftests

----------------------------------------------------------------
Jiri Kosina (1):
      livepatch: remove myself from MAINTAINERS

Josh Poimboeuf (1):
      livepatch: Add Joe and Song as maintainers

Petr Mladek (1):
      Merge branch 'for-7.4/kobject-release' into for-linus

Yafang Shao (2):
      livepatch: Fix UAF of unregistered patch kobjects
      selftests/livepatch: filter debug messages in check_result()

 MAINTAINERS                                    |  4 ++--
 include/linux/livepatch.h                      |  4 ++++
 kernel/livepatch/core.c                        | 10 ++++++++++
 tools/testing/selftests/livepatch/functions.sh | 12 +++++++++---
 4 files changed, 25 insertions(+), 5 deletions(-)
