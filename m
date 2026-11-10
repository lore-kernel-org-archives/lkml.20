Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342269;
	b=Q0/oJn6P5C2K965hU1WzVFFGHXi8IEsDJ7C+ibpyFYW5DVQiOUIoPdftdKCo/oAiOlal
	 rx7JrjmCBFT/rBjADbJHySxwX0iZ80GrjzZYjG24mXkjIpfzyNLVcSWAEHaPajwG3AlKU
	 TE8XKRFRc6+QRAN0VIhhnLp5BA7BusZlzMSR58poCY7YArMp3JJxyj+w2cKIU75LBfmX2
	 Xh0861QLXSzqJqqKZxrh2s105cqWCATKCIoEcXe4jRTJ8Rz8kvQ2ARUQ41iE3fFqIqHgi
	 N6tuLYeyyImzJCIq/Q0RkGWeacVZ/9x1Nb2+kIiAwm4GVIT3XOdKHA09CQPsFl0/e/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NNWkhMM9mRV69+bDPtzO7ZmhT8HSmB461wMg2BUz4JA=;
	b=GRusp6+T06rGWP0TvonA45Li+MWUmXyTzXuM2UcToLaMcsFod08FrgTaLqoHfVwOJ6xo
	 u3N/Oy+HnMn8osk7I2Tp6r1xV7y3NoyWd+vb9JMx0mopKke54SVrKAMLmO3oZxiIQo57E
	 8BAkgh4JefsH2nTNi0a1KuezleyZcZHECUx/9DHyXVvj2NoIf7+U8S8SBjK31AI55ASJf
	 YQ+wWJmcuryinBvF0bxxFTQdx0r1HQMIYZtYn+8KPsImUkd7T0wjdIQwD5ijxisPOli63
	 JIu65FY0FfvvY1S8/Pm7QvFWItNahA2SpYAVz6fF6YbkU0VKpcEdGTZ2+qrky5uwgbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jcqBjeP9;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD72606A8B6
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CD72606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jcqBjeP9
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so4876649eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1794342268; x=1794947068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNWkhMM9mRV69+bDPtzO7ZmhT8HSmB461wMg2BUz4JA=;
        b=jcqBjeP9L1xp1JklGYM0b1vT5HG9543QwujHEfMVyjAPCMy1Z6a2WjLK/Tl762SFJi
         UfnBKtuHG7xIgvrcmWziQRbrx3Rl1pipPKXO3jAvVYOuhTQKXa2xyePhgc4jFBdyGKJV
         0OveURAQ+4+DKhtsqgMTu+6eiAg5d3BIrjSN4zl8G6KMfMYX5zo9p94MxmLBvOVFsjat
         FFEeM3SLOz7sUsMavU/8NkBT/oDHo1q+OEuEgBY5m1b8YIWPzvPr9EZWFUkvsmeruKGp
         RdTI4f0y9C5oqjnmTfd+7FvunT0vn04W+FqOHN0fvZf8UAAhYAx3SKfSg8Jit5ew2VTt
         +WMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342268; x=1794947068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NNWkhMM9mRV69+bDPtzO7ZmhT8HSmB461wMg2BUz4JA=;
        b=tQI8NxLo60XKeFeQiF2dH5b4IUlfPWBQRJpd9SdfX6EuU9x3cDimncHyED8rsOFI9k
         eZoW15W/QtkiQlDVy/HGLQHb1J+55CsaWCT8jLSwy2XGECOoKxKXulipdXPMJBVzmbkh
         O6YCFvvBy12yaOQ65REL6zmTurqoeoNiRfvoI2yN0hsoNms5Xc3BS1owNow65Ugol81L
         l35c8Mga/PIKMt4VKVkkLf1sQdAAD8XwFCVJu3klcF/wk3NFzmBKWrdGjjVUj23RT6MR
         HXx+GNQs1+LWWPZx+1Wfitb1OUh4rH3YIfLzEYJW+y/z6V5jcOXaut3cQ3WQOi7Ge1uX
         EeQw==
X-Gm-Message-State: APuU4Z8tG/kcYYJGoE8J05mAHLCcCaRTVrZzC+b80Q4M6IrzbvjsFVwC
	K2zmsu0Qrk2F2LXa+1xDUZIHcSA0wqnFtU+PoonITvvB0QiZBupRs5xymyZp7EvAQj5fx4m2egn
	8QKwqGN65hOo=
X-Gm-Gg: AYBFou1ndMDAeFtbxygsj0YI17hd2TZbcYIIg5lZLnFqE2Xud18U/cRku9l0H/80kx+
	GBsmdC4OkmI2tZpQwPzF+gSYR3ZVUksewIvfYQz0cgNkKMS/Ui258Gcmv050PBFThGEBuerjR5z
	F3gjVQx7ECDhbHLjA6/4tXnAWpVG+w/JQrT/t1mT84ksF9MZ2540aK5FU5M+tTySzGadz6hKZJx
	e5aGqSdrTTOnvKvAMTCSYkZRw+rceTejKIsv8MRxnMkyOdHvb4eb4xZfHBCb2oKQyC7UoF3E/hH
	e6A+Qy4JV62RZcXy7anyzudKPXS8nMNwrt1C3aGTewLW5xZiX5BqNUqSeXEm9rrbEX1MWDnqgwF
	cgufpbGHzuwoO1yIBj3qVdGqu841gUm8Ay+5iqq6JHE2wac5hpu3oc2Pad9MbRmoDnczG1fA7bX
	jVKfWen/03KkY5+ak82aWGCA7vaDiLtbyk9uZ8RKiC7Adlm2vXEkSBo5GYGiglubt17itKsLBdp
	K7ohNUstWt/BN6NgAfTT/ci69lCBP5u5jcO7X30aI4z8hpH1qSVWinLXnjJ4q6uwRcqvQ/k+CHo
	oWSVKm46HmN5PeJDpZxghU11PLVM1gsn40XR9g9DKZACrpUl6JXpVJVyTeS+fmWSuenoV6/Jsw2
	RKscAM0waLYTcctmxHZvxFeI0StOftcZnUjk3+twynTCsabnvxRZdEQ==
X-Received: by 2002:a05:7301:488f:b0:376:2859:5b2f with SMTP id 5a478bee46e88-3768675d705mr516619eec.25.1794342268101;
        Tue, 10 Nov 2026 12:24:28 -0800 (PST)
Received: from localhost.localdomain ([2409:40f4:147:2742:6545:702a:2431:7dca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe29fsm10076615eec.21.2026.11.10.12.24.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 12:24:27 -0800 (PST)
From: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>
To: linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>,
	Kees Cook <kees@kernel.org>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mel Gorman <mgorman@suse.de>,
	Suren Baghdasaryan <surenb@google.com>,
	Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ketan Bhardwaj <ketan@armoriq.io>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	"HARIHARA SUDHAN . R" <harisudhan@armoriq.io>
Subject: [RFC PATCH v3 6/6] MAINTAINERS: add an entry for the Kernel Assurance Plane
Date: Wed, 11 Nov 2026 01:52:46 +0530
Message-ID: <20261110202246.274-7-harisudhan@armoriq.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110202246.274-1-harisudhan@armoriq.io>
References: <20261110202246.274-1-harisudhan@armoriq.io>
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

Add the KAP maintainers and the files they look after.

Assisted-by: Claude
Co-developed-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047a..0946d15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14118,6 +14118,16 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/radio/radio-keene*
 
+KERNEL ASSURANCE PLANE (KAP)
+M:	Ketan Bhardwaj <ketan@armoriq.io>
+M:	HARIHARA SUDHAN. R <harisudhan@armoriq.io>
+L:	linux-security-module@vger.kernel.org
+S:	Supported
+F:	Documentation/ABI/testing/securityfs-kap
+F:	Documentation/security/kap.rst
+F:	include/linux/kap.h
+F:	security/kap/
+
 KERNEL AUTOMOUNTER
 M:	Ian Kent <raven@themaw.net>
 L:	autofs@vger.kernel.org
-- 
2.53.0

