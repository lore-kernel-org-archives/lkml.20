Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B5E3DDDC0
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 04:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790829741; cv=none; b=ndhydilrGTUPW5EQMkNsHdCQg4KWFR+o+Cd6FNdmDknkAvLjxCh1gOMKCwtsN6oaPKTYlbR1G8wIM/bXH9ceqGwJTedTE1/H0nSglzlSjAws/PCind5SfNBEUMd2a220N8QhT3zsKBqIbN32uYdiF1RODkQDn9DITlod6WIkltE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790829741; c=relaxed/simple;
	bh=SS7j2Mi3g5GlPry3bUdyss69gJmE53mV446QuvJzBYM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XyXSFeP9ql1aqSuxZXuaryYJXfm8KMTrr3MXUxnpRZSsXK1BZL9J3ku33v4U+3m/GY+qntxsSGCPL/9HUSfSiD1o4PvQJ4tsSJtYKG2vqJEyQXp9Yz5GePSO7QzAJKAYRoT9F4ZZauz13VSguUdjHrAtlLz772Moqm1s+rRO4QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWTeAvoA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWTeAvoA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso15012175e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790829737; x=1791434537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a1VMb1gdkAzPRn13HLN7Aa+0FwFU3dz+Af4Wv7wExRg=;
        b=IWTeAvoAJxpZWo5gWWXPhTGXZGjKyzinPbCyh8WkIhAE1IZN2d3IM0DRRSUtd2M481
         PNicrRfD3jw0xzN1lvq/twOaltIi9/c/4ovlN9JAaf81ssUUac9CgsjHy2/0D2Vg5xNr
         DdSrIzpp3FBXy38p7UyM4Fyom/rxabUOxct1aQWC3dATXgwgLvecCCMtKql4L8FJQBet
         b9FQqFutCMY8rDp+pfi1uM1lc++ODeWSPUP1WVCtQTMb8BzlEv6oAckQWUbOJmE4bFrW
         wg8JOHb0+JiT+ibxscn9oKm1dThoOdaSuINrMzYMRhMdAqB0wEGp0BAGC3/Bh24ZJWMo
         SvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790829737; x=1791434537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1VMb1gdkAzPRn13HLN7Aa+0FwFU3dz+Af4Wv7wExRg=;
        b=ch/6zspGNS2DqM7KGUVllQn9ztbK8hSegGMj8kTg8dfrV+QHcQL3ObXbH6sMxFxa5H
         2SlSw5+d7YakMi+LMTlEwg5H52657y3LJHApx/lp7y0X4kcFiXfeDKS0ct7voy7nx0p8
         R75w+oPyQQq02Hqa9E33M0RPPcTb34mMl5lH+VNUm7GaqpCxDR3afvQAmgnPnRU2JycT
         gmt3rqpMJ4ZCdR60QZdBBmKPbjfdlj7gftQKsayAxceRmUgWDNvrJ/JPmC4Ifw2iasn0
         d/CO+qIsqgt/cLe0RMskoAEb9aPGHW5O5Tk/sLPWOhLE/xOcpIajEYzbCrXxdvc+e7nF
         Uj1w==
X-Forwarded-Encrypted: i=1; AKwUvBzJ9UtmuNDWyxUriOXQJJ50G9jeedWPZj8WhDjrj05U09h+EobfuIG0aQovoruLwFLDecNOVYRgNfclMrQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kFohjJ+bo+7hOuc2VsD7LezffkKScLPJErYwpZINqKe6LXvPoR
	jHxajrFxX92JFZmGt7wvKz4T4hHDZ3XCtcw6EzouWG1yteIygnt3I2CA
X-Gm-Gg: AYBFou06YOK91X3PW3jA1YiF3R9Np+84hpBZdivxjLt7AR1fYuqIIuBo7u62AivhYcv
	SijtrP0uf8QeWx5oSKYSF98TgngEvGM7PXx6bnvE33T/Mios6XcvQq5+op1Y5Sut0D2r/E1gxKB
	zleEzDSvBUhd8UagKP6HCpUF0XblzieG+TSHk4LMWdkwauRl+PuSbchvadEAT03seXt5lMW0twp
	VFPCU6kyzZ795WHwbYfh4fAmOP+lPyKZTonOC8U/zobbjy5n32rBrnXRoAZ2Z6S+PM0hA2UrN2o
	hn+EijrXdf5y1wlxXauG+Qny50Ctx2//ULUvB4bu/2MmeFyGH/QjlSMWbb2O7DjxKVZt4IYgyN1
	HfPLUlhlbL+z+pO3Kaa3Ki9gC++jvM0NIvtCalDVV/cE22TKOaYxHuN4eMQ8/ve9XGOkY/RQ93u
	UOC/Ij++kkIhKsovrJ62/50GB99nhEIF9J/1lDw9jj+WepuaW2gJOEAmJeHAmoKQiVR+ZnEs3cp
	PBsrl4u1CjIwmmXquqtgrPmZsPdMR8VPQFWSEbt675ntsPbPYviUTO+W1B4JjhTnRAbVnn2VQBk
	8zseZHqiy1TOJHv1wjtawIXLdEaRxiLIdpgAMZ0J44InMoyEM1XNvzgCFOUDjrU=
X-Received: by 2002:a7b:ca5a:0:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a01eb19ffdmr17039525e9.17.1790829736713;
        Wed, 30 Sep 2026 21:42:16 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-117-056-101.95.117.pool.telefonica.de. [95.117.56.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6c5059sm32619515e9.0.2026.09.30.21.42.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 21:42:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Alexei Starovoitov <ast@kernel.org>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH 0/2] mm: preserve nolock context through memcg cleanup
Date: Thu,  1 Oct 2026 06:40:54 +0200
Message-Id: <20261001044056.75079-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The no-lock allocation and free APIs can still enter regular locking
through two memcg cleanup paths.

Patch 1 handles rollback after a post-allocation charge failure. If
kmalloc_nolock() obtains an object but its memcg charge fails,
memcg_slab_post_alloc_hook() frees the object through the regular SLUB
path. Preserve the selected allocation mode by using kfree_nolock()
when the allocation flags disallow spinning.

Patch 2 handles the final reference to a killed object cgroup.
kfree_nolock() and free_pages_nolock() can drop that reference in the
caller's context, after which obj_cgroup_release() takes regular locks.
Queue the objcg on a lockless list and finish its teardown from normal
irq_work. On PREEMPT_RT that work runs in irq_workd task context.

These paths were found while discussing the following RFC and during
the subsequent investigation of no-lock allocation and free paths:

https://lore.kernel.org/r/20260919171443.90512-1-kmehltretter@gmail.com

Based on 40288c9206c17. Each patch's forced cleanup test passed on
x86-64 release and lockdep PREEMPT_RT QEMU, arm64 and ARM32 SMP QEMU,
and Pi 400 hardware. The objcg test accounted for all 256 queued and
deferred releases. The series also passed non-RT builds and arena tests.

Karl Mehltretter (2):
  mm/slub: preserve no-lock freeing after memcg charge failure
  mm/memcontrol: defer final objcg release from no-lock frees

 include/linux/memcontrol.h |  1 +
 mm/memcontrol.c            | 29 ++++++++++++++++++++++++++---
 mm/slub.c                  |  5 ++++-
 3 files changed, 31 insertions(+), 4 deletions(-)


base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
-- 
2.53.0
