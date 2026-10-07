Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411BA37E5DA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 23:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791416901; cv=none; b=MhT1DVkFKp578GcYVDTM0u740VXZshDRfJi1htdFRAwmnJP9pRSwzh3HE4GoGzDFd/rkj8QtFSOGDpE1TGPApld+2U82oiFRAYMfmbpYq/vFMz+v19UlA2eHcxwkOlWisWZINCiJEsgdD3oAfGuyYnwcx0OVTJQqVLyU5hDtI8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791416901; c=relaxed/simple;
	bh=P352MQ0w1qgm2BzPcNWiQb1rh8hqEdm2IZRAobTEiYo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mznBTpZ+5ckTGbZMVD0BwOb7hAbDjoE4iz6Lx9PWDUI6RJp6xyzjqCtz8ND0xFB9mcRj8j1E8XjhMxkyTBn70td4UWXVntgjeSDiISRInd/bvztDCYUpfWK1YSnkibQ3MmR2xDQzctZ1mW4FPV9osmhk/szG2Hj780yME/yJtjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y/Cc5pe5; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y/Cc5pe5"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d55d8cd938so68585745ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 16:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791416899; x=1792021699; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P/qZSRXDmeAvjD0DisYEACWhpixTZPSAh00XBTPdWmE=;
        b=Y/Cc5pe5dx5mvGYGgxjbuPAF9K4OuRA3IUWplDPzw6LIMO+buu9e5MZzpLl8veKD7t
         YWY9ep6QnyUFFMJWc96wSzIaT2cE6C0S8qCUsAhOdB2nEb5xa4ZtLH5OOcPh+dzQc8kQ
         Er8NQtYSNELk9z3PARIjgE22KLV3iaM42tR7+AKPu9Tl1sbYmKLeoqPzIaVWFQWU0PCc
         M+7RmS/ru4aOPYevviR0mm7deaJIkr/DK/qe9d91FNMhOIbLyI2WTpzD+TsizrnipbFB
         H4gn4CpnUZnoNTwb3GdbMbzGIWc6JjfWVd+YrVrFdlK1pd/NQwsBS0kLhi0BhsBE/32q
         N9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791416899; x=1792021699;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/qZSRXDmeAvjD0DisYEACWhpixTZPSAh00XBTPdWmE=;
        b=gEa5+4IoNHJlTCP7yuvVRZJhuEUA8REji8Jznsdp9ho0mx6fL3txJZhPXSpAQJW9Rs
         fq97/bWZrr0uOhQiZ6QSvZJg+oJup2cDvq4KDIIjrjL+J1Z4IKVtiEWJW/VRR0b6in5c
         7XHPHoSyFBac/TIX+O/m2juYqct2vCqjdlweh2s+iLOTJwE1zjFF2r2zSvEgdSIf2HVo
         1IhapfpXH4yHSRe+2E3cYeXK92HNJ8X+Yc/t5ShNrVnHeLwBsXOTsKFCqvkdX5CdrV+p
         QpxbBTQ5ydVvgaGhZ0NIMzshFf2hAoJ1IRabWcKt5Ue0G9jdR0UuQcR7ItlauYYFqSoQ
         OtGg==
X-Forwarded-Encrypted: i=1; AKwUvBxJjg3DFOcgRcz869IZXCPgY048kGS/+SJytIGvKg9gYm28dRf43kn2y44Ev0gUxy3llGI9uyHqL4Y8RyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpH+lQMt50HABQm9qo88DaggoUs96x6RhQwUlV0MhG6iJLjYSO
	IFYsW0iwi6ALTbExTthGTeQKtQkvzuQ/nh1IwisolCBRyzHT//QY2FQalFNSvVZk/jjXA5XmLm0
	F5jp+ZmwSluAMfQ==
X-Received: from plbh2.prod.google.com ([2002:a17:902:eec2:b0:2e4:28f9:4cef])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce8b:b0:2dd:c053:9c6b with SMTP id d9443c01a7336-2e60d24eb52mr28956665ad.33.1791416899244;
 Wed, 07 Oct 2026 16:48:19 -0700 (PDT)
Date: Wed,  7 Oct 2026 16:48:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261007234815.4026028-1-jmattson@google.com>
Subject: [PATCH] perf/amd/ibs: Clear stale IBS_{FETCH|OP}_CTL in
 perf_ibs_start() with CTL2[Dis]
From: Jim Mattson <jmattson@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: Jim Mattson <jmattson@google.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Manali Shukla <manali.shukla@amd.com>, Sandipan Das <sandipan.das@amd.com>, 
	Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Yosry Ahmed <yosry@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit 1b044ff3c17e ("perf/amd/ibs: Avoid race between event add and
NMI") makes perf_ibs_start() reset IBS_{FETCH|OP}_CTL before it sets
IBS_STARTED. Thus, an NMI from another source that arrives before the
event is enabled finds Val=0 and does not process a stale sample or
enable the event too early.

The reset is a call to perf_ibs_disable_event() with config=0. A later
commit changed perf_ibs_disable_event():

  commit efa5700ec0da ("perf/amd/ibs: Support IBS_{FETCH|OP}_CTL2[Dis] to eliminate RMW race")

When IBS_CAPS_DIS is set, the function now writes only
IBS_{FETCH|OP}_CTL2 and returns. It does not write IBS_{FETCH|OP}_CTL.
On hardware with IBS_CAPS_DIS, the reset does nothing, and the race is
possible again: CTL still holds the previous sample, with Val=1, when
IBS_STARTED is set.

Clear IBS_{FETCH|OP}_CTL explicitly when IBS_CAPS_DIS is set, as
perf_ibs_disable_event() did before CTL2 support. Everything in CTL is
stale at this point, so it does not matter if this write discards a
Val that the hardware sets late.

Fixes: efa5700ec0da ("perf/amd/ibs: Support IBS_{FETCH|OP}_CTL2[Dis] to eliminate RMW race")
Assisted-by: LLM
Signed-off-by: Jim Mattson <jmattson@google.com>
---
I reproduced the race on hardware with IBS_CAPS_DIS. To make the window
wider, I added a debug-only udelay() between set_bit(IBS_STARTED) and
perf_ibs_enable_event() in perf_ibs_start(). A throttled ibs_op event
gave about 1000 perf_ibs_start() calls per second, and a cycles event
gave NMIs from the core PMU. In 60 seconds:

  - Without this patch, IBS_OP_CTL[Val] was 1 at every
    perf_ibs_start() call (60003 of 60003). The IBS op NMI handler took
    the stale sample and re-enabled the event during the window 17
    times.
  - With this patch, the handler never took a sample during the window.

Without the udelay(), the window is only a few instructions long.

A related question for AMD: with IBS_CAPS_DIS, perf_ibs_stop() now
leaves IBS_{FETCH|OP}_CTL[En]=1. APM vol. 2, section 15.38, says that
IbsFetchEn and IbsOpEn must be 0 at VMRUN of an SEV-ES or SEV-SNP
guest with IBS virtualization enabled, and should be 0 for other
guests. Can the hardware set CTL[Val] or change CTL in any other way
after CTL2[Dis] is set to 1? If not, perf_ibs_stop() can safely clear
CTL[En] with a read-modify-write after it sets CTL2[Dis].

 arch/x86/events/amd/ibs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 3531f9c23b8c..3a5475006b59 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -580,8 +580,15 @@ static void perf_ibs_start(struct perf_event *event, int flags)
 	 * Doing so prevents a race condition in which an NMI due to other
 	 * source might accidentally activate the event before we enable
 	 * it ourselves.
+	 *
+	 * With IBS_CAPS_DIS, perf_ibs_disable_event() only sets CTL2[Dis]
+	 * and leaves the previous sample in CTL, so clear CTL explicitly.
+	 * Anything in CTL is stale, so it does not matter if this write
+	 * discards a late Val.
 	 */
 	perf_ibs_disable_event(perf_ibs, hwc, 0);
+	if (ibs_caps & IBS_CAPS_DIS)
+		wrmsrq(hwc->config_base, 0);
 
 	/*
 	 * Set STARTED before enabling the hardware, such that a subsequent NMI
-- 
2.56.0.385.gd3acb90ef8-goog

