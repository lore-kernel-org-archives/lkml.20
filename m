Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1B238F92F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065754; cv=none; b=ueCnnV7JAZuO5k2OZdi8LIyhWGGT6uAn4idso0S3YdHJTSIidwT1aLAn4qaolIXinY2emm9rAhO5APo4l9uDVrlsHPNg6Gotrfd4T1+7up/S+kULHBB2EYQrFdwT8upTGVLgrFdvGpQawrymtnQ0bS8U1U9BPaIXJT3+8K2MJTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065754; c=relaxed/simple;
	bh=xoHLfLtCU8cfG34PqstwBdoLWKC9uaAGc0ToltQONdw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=N9L61bVXBLfeJw4Nwk7ifjbuWdHtUQ8AAI/z5IdOEmRyKrmkgjVbllwcLetOAW9Im9FXV/jurCoX2JxgoMiEzkJjQ98I4VmWtwxBStBO60KMHFgefYVQaK7Sgeh0EdgtZMCrW2EaUFbPT8IQMrM9jwuV9AmqxXE6YKMTlwOrtZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqJ3u0Tg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqJ3u0Tg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994171F00893
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789065749;
	bh=RQou6JyZBnOfwD812nmhze1SFAlyxVhDq1QrDIIJaR8=;
	h=From:Date:Subject:To:Cc;
	b=fqJ3u0TgrDZG0A7UGe55A/TDolmrzLaf/Yxfng3bC3XeSYNcLMMA536SNvhmPnP+T
	 qQBQGQagn7NFfGRCbLBacvvRLY33Iz3fmBmG5/e7Ac2iEmDJ6gJVvujMPWRBDt3H3Q
	 4MioDrRFBD0/wVCm9UTkuvY/B8KHuwfI5EGmVhUBtdMTL+8MOp//wouoGAeOk6GZ3S
	 byNG8sFmXlTVSlxcd5Op1ILeWXxQeExHCSxCDvMTplzKfwG35Pwg4VgF91UnofQkj9
	 ojAwGErkdX4VSP/USUyGt3/xxyV+3G88q/r41eba5b+TukVksqRGTGO2y1ThaZ+O05
	 IAEVFrnhfhdIg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b6031cbc6bso119162e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:42:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByXNVX5t62k3MuOQZ2utXY0uu6mXTGLpWGL2oaLneCwVb0nyEOU51ZVhN+ztCPEFNDWPWpS/ncmNMAkGV8=@vger.kernel.org
X-Gm-Message-State: AFuF++nvEWhbMh7B7jA74dUrKLpnx8UDkjI6ZSXGuuNOeec3AaHxn7dZ
	ff6PvDYKi9dIAr6VornYH14Z9AvaxGZcCjtXbiMhgk1CYObY3zzlu36jA/T5aVgEF6MUXnWJfA6
	TP6BHu6jK01MoDtgXhVr437cgNW8PwlE=
X-Received: by 2002:a05:6512:31c2:b0:5b8:997b:c5e9 with SMTP id
 2adb3069b0e04-5b8a030ee44mr160877e87.48.1789065747955; Thu, 10 Sep 2026
 11:42:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 10 Sep 2026 20:41:17 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0idsbo5VDkhmZrNJVz9=XnpYSwCntiD_YoZ6NzGwTZubg@mail.gmail.com>
X-Gm-Features: AcwNN1X4l6YwG4eiUlvaTbfluMAcV1ER0ueLDphA-DLhbv441TA9j7UgfQrWlrQ
Message-ID: <CAJZ5v0idsbo5VDkhmZrNJVz9=XnpYSwCntiD_YoZ6NzGwTZubg@mail.gmail.com>
Subject: [GIT PULL] Power management fixes for 7.3-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull from the tag

 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
 pm-7.3-rc3

with top-most commit 13b3dcbcfed1d0c8c1d3b5dcfe306f9992452ae9

 Merge branch 'pm-cpufreq'

on top of commit df2908090cda368b01ff43709f51890076c56157

 Linux 7.3-rc2

to receive power management fixes for 7.3-rc3.

These harden the cpufreq core against races with sysfs during policy
creation, fix two issues in the OPP (Operating Performance Points)
library, and make OPP print symbolic error names:

 - Zero-initialize the policy cpumask and initialize the policy rwsem
   before exposing the policy sysfs interface (Runyu Xiao and Zhongqiu
   Han)

 - Fix potential multiplication overflow when calculating freq in OPP
   core (Colin Ian King)

 - Fix use after free in _update_opp_table_clk() (Peter Griffin)

 - Use %pe to print symbolic error name in OPP (Sumeet Pawnikar)

Thanks!


---------------

Colin Ian King (1):
      OPP: of: Fix potential multiplication overflow when calculating freq

Peter Griffin (1):
      opp: fix use after free in _update_opp_table_clk()

Runyu Xiao (1):
      cpufreq: initialize policy rwsem before sysfs publication

Sumeet Pawnikar (1):
      opp: Use %pe to print symbolic error name

Zhongqiu Han (1):
      cpufreq: zero-initialize policy cpumask before sysfs publication

---------------

 drivers/cpufreq/cpufreq.c |  6 +++---
 drivers/opp/core.c        | 30 ++++++++++++++++--------------
 drivers/opp/of.c          |  6 +++---
 3 files changed, 22 insertions(+), 20 deletions(-)
