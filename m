Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D508476046
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769609; cv=none; b=ruFGgxBjX1N2GXVJSHqCjFIIwpAfnmsS6t6RFmdP2aXrSf8itZc8UesL/8Iw6+07jjOQ1GJy/GpYrL1INr6CrLXyHI/VsVrhr8VMH/PpJvFRfF9ezWixkkgK4RCPdhBm5fHxZi2Sl8BSeRs3ULhUmkrBlcmgpU7EuKAOMPNbnl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769609; c=relaxed/simple;
	bh=72+sozTNzPL6qM/e7MU1Iq1+YwNM6lcBjld4FdnEjOQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nbFOxWrma5e+ckf7J8j+CQtcKME72/bRyGdY8TRISAx1SVQRjdiaJn6is0qm3BaboN0yNEPRvsG0S7mqGJ/dgQZCUFNlHZp/x+C9qNkPKh7Y6QrDgdlFvaM77HMRQTTh1+SPiFcpIQql8g/bYeomliGLZb+Vja5oilFt4WltjIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsrJvWNm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsrJvWNm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0151F01576
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787769591;
	bh=1K6QyIuCcHRdKmYm71c24ao2HLuCy603A7W5gB5ykEg=;
	h=From:Date:Subject:To:Cc;
	b=bsrJvWNmlUy/R3TDeGxi2cIheOIxokNQqlAgN1oFWTSWSRpZhSk1fOiUxQr9gYRjx
	 CyFGPlSj9soet/KvQmo5uPb06uBBX2oeijOH5yAj+HBzKcfg25lqZvDZ4juogt3M5m
	 HLtlYb6lv/1S8A6ZKlOX8QDb5UPkxZEiUCtGRfUQ/kD8eD6AAW9sRQdpi5F1K8WePA
	 w3q+w+R59EWVO7nwsqxdpXKmDaBqBu9hp/7zxsqnnfpovCstc3bPprRvlHyxoC6poZ
	 BE+GWxLsPp58MvIAMEwjkYn31yYRso5h3Hq7BROzVfWrrxzuiVRDbNYuPJKv4Ebd3x
	 Et5Qm5+qof3+Q==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a1f628b0afso11684461fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:39:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp34Vn+Ixg4Jz5ZRRBe2LLwaqXjsdLIDO5gyfzFVpQ0RE2SNpHUp8D0NHzgelYCPeReSgokTTQCqKHGSdw=@vger.kernel.org
X-Gm-Message-State: AFuF++ljvMcf8KOuWt3hkbtdK5+wrBFLfzeakKFSfMBomN3ftYtuSYtD
	ob55MVoiSecMtshRYsUT5Jlpa/l+sjT6K9OPb0+zK+8A8jOix+DJrOnCvyBZJ96y0vGVJHfJFJx
	JZxK7PDMcUU2t46hZBd4d+Lee7u4DSDs=
X-Received: by 2002:a05:651c:a105:10b0:3a1:ee15:309a with SMTP id
 38308e7fff4ca-3a1fd63664emr15916811fa.7.1787769589529; Wed, 26 Aug 2026
 11:39:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 26 Aug 2026 20:39:05 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jKcZV5a8MZSDP2saeS59v-qhNv82RN2-CWtHuM=jff0A@mail.gmail.com>
X-Gm-Features: AcwNN1WJwynnF7iwLz8NGLEI36mR0ln-UBF7aYlfdmVLujxF43YSyf0aVzGmhyc
Message-ID: <CAJZ5v0jKcZV5a8MZSDP2saeS59v-qhNv82RN2-CWtHuM=jff0A@mail.gmail.com>
Subject: [GIT PULL] More power management updates for 7.3-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull from the tag

 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
 pm-7.3-rc1-2

with top-most commit 76854b339b3fbbc144f7ad6dd96e7495b94aab62

 Merge branches 'pm-cpufreq' and 'pm-sleep'

on top of commit a5778046a02570fd23bdf0b48dce330237d1996c

 Merge tag 'pm-7.3-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm

to receive more power management updates for 7.3-rc1.

These fix two issues in the intel_rapl power capping driver, fix a
potential issue in the schedutil cpufreq governor on 32-bit systems,
fix a runtime PM issue related to failing system suspend, and update
the intel_pstate cpufreq driver:

 - Fix a kernel panic during PMU unbind in the intel_rapl power capping
   driver and sign-extend the PMU delta on counter wraparound in it to
   avoid misreporting energy (Sumeet Pawnikar and Yifan Li)

 - Unblock runtime PM when device prepare fails that was not done by
   mistake (Shibo Zhu)

 - Fix possible rate limit overflow on 32-bit systems in the schedutil
   cpufreq governor (Hui Su)

 - Consolidate HWP P-states initialization in the intel_pstate cpufreq
   driver and make that driver avoid using the DESIRED_PERF HWP hint
   when the Dynamic Efficiency Control (DEC) is enabled in the processor
   to avoid inconsistent behavior (Rafael Wysocki)

Thanks!


---------------

Hui Su (1):
      cpufreq: schedutil: Fix rate limit overflow

Li, Yifan (1):
      powercap: intel_rapl: Sign-extend the PMU delta on counter wraparound

Rafael J. Wysocki (2):
      cpufreq: intel_pstate: Consolidate HWP P-states initialization
      cpufreq: intel_pstate: Avoid using DESIRED_PERF when DEC is enabled

Shibo Zhu (1):
      PM: sleep: Unblock runtime PM when device prepare fails

Sumeet Pawnikar (1):
      powercap: intel_rapl: Fix kernel panic during PMU unbind

---------------

 drivers/base/power/main.c            |   1 +
 drivers/cpufreq/intel_pstate.c       | 126 +++++++++++++++++------------------
 drivers/powercap/intel_rapl_common.c |  15 ++++-
 kernel/sched/cpufreq_schedutil.c     |  15 ++++-
 4 files changed, 90 insertions(+), 67 deletions(-)
