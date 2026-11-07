Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062094;
	b=xWlvvQ2WxHin2k0oMQWan0B9rosoIwPyaIkhLwao07zyypWw4wfTTWHW8SiB4okYdCkf
	 aTvv2qqP99AKK2uDwawmS3lJ/iQr6Qk+Zu4wX2WOSYAA5W/XdaqmYedfVVRYlIRthblzV
	 ViecDcB8jU5zI294hNdgFg6h3dw3SsndpV2qJNMHO8rU6L16ChAhmme41a6rj4uu+wO40
	 javSebD2luzPXXsYTROoSAMcDuwTddNyYfRH+jHDXbiABnqkd+WkZT3Arx6SF/ql1u2Eo
	 JS07jcFvYoljWRu97onqqlJ9FJ3cPVNckOWE9dZ6aZ42lSuALB9NNPmO5INqeLTMcBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062094;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T975+iticyQ43pbdCFWCmxpz2zgp1+Kz8Vd5SSvSzjs=;
	b=QqPaFBFcxckEsNkEXi0InekUN5484rimGJiWYzYWUuVXuZg/WVFYPVEUSEV9Q7hwHVEP
	 +OsLz8w2/+jhqgpkS8LfPMXdvo2qPhgYacOC5ZMKHVfFWqRzFVXZ15Us8uI+2A8RxY33v
	 Wtuou2R6mDG1jI8HYP/Q5luT1xO/5GLMxj3JyWdg8Cg5yHLgZRzQDCuegEjD0GNMwyTC4
	 wqnfcuLzC1dUaV/wmq8rykprA7mqyzTbW/sIxNZ1lIvIqZ8i8oMqCNmvSl3ZkiuETRL57
	 +jjJaFcAxMRhy5Ze8EX5fyl+n/53Wa+mF99t2K/dDOHVdXaPzgdX8y4MiyMYzUY6b3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LhDIGgoj;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9B5606D827;
	Sat,  7 Nov 2026 14:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C9B5606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LhDIGgoj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=LhDIGgojouV4gbEwJ491L7jcmNwqhYo6M38d2xZ8EwfbHptSEOOVHGw/nPa5GM0dJdj7UFYwFWOyT
	 ppZDaah8Rga/soIAD3BkWh0mMYe0+eio29WwsxQfefPYS54zSOi5vg/ocU+wHoqwTQpxBn/KXSSceh
	 UQZphbf5rkST1lLE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86aef36fe377-572ea;
	Sat, 07 Nov 2026 22:34:48 +0800 (CST)
X-RM-TRANSID:2ee86aef36fe377-572ea
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[112.0.144.25])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36aef37054ea-47ae0;
	Sat, 07 Nov 2026 22:34:48 +0800 (CST)
X-RM-TRANSID:2ee36aef37054ea-47ae0
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: samsung: i2s: Fix runtime PM usage count leak on failed trigger
Date: Sat,  7 Nov 2026 22:34:45 +0800
Message-ID: <20261107222508.1067-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <179397691069.3231166.15159234758356297627.b4-review@b4>
References: <179397691069.3231166.15159234758356297627.b4-review@b4>
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

Hi Mark,

Thanks for the review.

> This mixes scoped_guard and goto, that is prone to breakage.

Understood.  I reached for the goto because pm_runtime_put() may sleep
and therefore cannot run inside the spinlock guard, but jumping out of
the scoped_guard() body is not the way to get there.  If anything from
this patch survives review, the locked section needs to be factored
out into a helper so that the error handling lives outside the guard
scope.

> If the subsream is not linked then the core will unwind th start which
> does actually do the trigger() the commit message said won't happen...

You are right, and this is the bigger problem with the patch.  I went
back through the trigger paths and the commit message claim that
neither core issues a compensating TRIGGER_STOP is wrong for the
non-linked case, which is the normal case:

  - snd_pcm_action_single() calls ops->undo_action() when do_action()
    fails, and snd_pcm_undo_start() then sends TRIGGER_STOP to the
    substream whose trigger failed, since runtime->trigger_master is
    set by snd_pcm_pre_start().

  - The ASoC level rollback does skip the failed DAI:
    snd_soc_pcm_dai_trigger() with rollback == 1 only stops DAIs that
    carry a trigger mark, and the failed one never got marked.  But
    the PCM core undo then calls soc_pcm_trigger() with rollback == 0,
    which runs the DAI trigger unconditionally.

So on current mainline a failed START on a non-linked substream is
followed by TRIGGER_STOP, and the pm_runtime_put() in the STOP path
already balances the get_sync().  This has been the behavior at least
since v4.19.  With the patch applied the driver would put as well, so
a failed start on the common paths would call pm_runtime_put() twice
against a single get_sync() and push the usage count below where it
started.  In other words, the patch trades a non-existent leak for a
real underflow.

The compensating TRIGGER_STOP is only missing when the substream is
part of a linked group: snd_pcm_action_group() only undoes the group
members that were started before the failing one, and the failing
substream itself never sees the STOP.  That is the only case where the
usage count really does leak.

Since the two action paths disagree on whether the failed stream gets
undone, this looks like something to sort out in the PCM core rather
than in individual DAI drivers.  Making the group undo cover the
failed substream as well would fix the linked case for every driver at
once and would spare drivers from having to guess whether the core
will unwind for them.

Unless you disagree I will drop this patch.  If you think the linked
case is worth chasing I can prepare an RFC for sound/core/pcm_native.c
(Cc Takashi) instead, so let me know which way you prefer.

Thanks,
Xiangwu Lai


