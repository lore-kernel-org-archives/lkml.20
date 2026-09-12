Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C235238F649
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789242963; cv=none; b=eeZO7yPXLFqaXlOklJTsZCUVlnX1qAOrB1pcmHCP99aQpw8UqFSK0NlDEBe4IJ0+PCLs9AdAUIfWEYM87c5ozBpNiD5YpgSCUSVjh/JkmRqxDOUGdHJ2oiLzbiFrvS0lXlp+S2jZEaCMfWJsEXT2hWucdAppb5fuHNqyahHZM3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789242963; c=relaxed/simple;
	bh=ydcLswhKfW/cDtNkOWt8BaQY/wFqG2LFzkg1wf5qWnY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZxI17iqSjy9mjF1AdctUznEYBFKvdYZM0YmT/Gn6qHiKWJ9c2zKPVm2vi3+HM/safxOYRboBB75IK8F2HzIyzjgq3XcjOKe5tZldqihJVctK7D7cmWdyruue/J7xeA/jxZ5IckDUAztKNqgjdw/oZoeAhOmiQY5ue8e4+hIXxFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXPnXHyq; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXPnXHyq"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso6385085e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242959; x=1789847759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YxuvUQU/wvk/5tAU7GY5bOYjzHhQjt27KLZg5QIEMsc=;
        b=OXPnXHyqT8TSd6WHO1Sh+BRX6B5gnM0LoQ3fTaQi60uoI3Z+pS3oHpKNFeQctabaCD
         jPjw9ydOVI9x1mzRh5dyNCrtGJPUbt4e1bUdXz9Lar+4LEGvt5tdFQCStMU0rNp01SvP
         D0R4+/jZ0mQ/RLikXSU9BFrKI0a0zDNPCN/Klbl2oncgzcuvMCqqMoO4YI8QUX6/W0Hn
         Kku3ETDBEUjYhFbr2c6fFJHIP8lOHwRIkKH8iEgCNX0349JEK8tFgVlAIhqO3Itxiicw
         0p48WH/KRM6sykqU47xIPE0w/ySTwaQlpvjeoZOEGvk3PDDAcucb0N+aNlOIhjUq+tnf
         JCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242959; x=1789847759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxuvUQU/wvk/5tAU7GY5bOYjzHhQjt27KLZg5QIEMsc=;
        b=fyJAaDQqGcxlMxWB6wTTA07rl30G+XDbbbXXMVmb73RDkgt+wzWmQwDqQ6MWgv05wB
         mMkFpBe1cTMjEe5aUh0DMgnkTLkV+sNsSUodc5sb03x2pisBke539iou4dCi+lTMo9bH
         FXH68v8JS8v4JI9BGNNbB1jJk1yRjMAg33ezgub4s42iU7mNwx5EDOAmHhogH/+JPf4g
         S1QNFbbwbqaVgRKBVTb116PItsbbHaeMuhIehZ859wIO0dShO1wE//O+vRmdHg8HL/VZ
         wIFn/51Kq4bYq0aNkYTmeoAkazETp5PCVBtEHRGyNQQzTVGHlELSoTB/nqa5FvgWV7dk
         p7YA==
X-Forwarded-Encrypted: i=1; AKwUvByOqMuJ/sp3fG2pApX/Zi56mjCooxfF4JoMu/pL/AkNdTN1v12cW+FXhxEFfyGd+4Nslp2yCD4A9i+WkXo=@vger.kernel.org
X-Gm-Message-State: AFuF++nyBU94tWF9hrdKTPrL913AjFzgoCtuQOn2wpfvbLkrVcrv8iMN
	FGAmBR1woklkGgWs8A4OcH+DRq/npRcrP+r2TsXlwe80QUiy/VJW+63b
X-Gm-Gg: AYBFou2jFIvFp7laxDMd+hbKlC/3oOI1icPbbmrEbp74dU2g3o2kMM/6QBe+ShReW3D
	JifLX/6HSxbVyKvRY7jX+M4Sr5gEow2wRhXxZGD/oTCuhKHodlrsiRTIOzd10AdaHBBoFig1rBa
	gdanE3hWuLZp9OoyJMHHwiOdBwn10iBJxfm+mf1drsGJcmeN29+y3osoO+hQZMmHD9Fk4KBIAnT
	OI1nHlT3LV15yeRGGnu2ggecLKLFr32iqxhnJMj5rNx+OVTEqCwQEaDiA6MVaJl740RRPhAw8EE
	6WmBZyKDGIAXE1PvBcbCrygOVwAFFvLJFySXnvrNzbwm/LcgNqKGAj5mIeP3MUF5wT0dIr3TMHl
	W3i7sti4usZ9Q0dCHnnysms5/5+txgLbZ0LLEqpg8dgOWFtv6ippgJht6h6HPjax6gJrCb83s37
	kBgMQy42MJGwd4tiuWrSVhYbJ6XML6d8vADsQgXvHKctXPRuIX25jf/1Z1gxM0q9nU/hMh3DMxW
	ahDfPVwvFVZ+ft0eGDERvsdj4CG7TksHsGgQhX57JmK0LGc+MYeDrcjYn/2DWebq/CiXWZ8O8vR
	LQmYWlZ1b0nz+6YFgYmEIZ2/+nsHKvC+uJY49S3+6OJ3xNMLKIoStTC451uLu+QA9Vp3y6ibLAQ
	mgrzEFUpxHBJAXRGxyQ==
X-Received: by 2002:a05:600c:5249:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49e6caa782cmr34402295e9.5.1789242958359;
        Sat, 12 Sep 2026 12:55:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm267089045e9.14.2026.09.12.12.55.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 12:55:58 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Radu Rendec <rrendec@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/4] ARM: allocate the cacheinfo early to fix the PREEMPT_RT boot warning
Date: Sat, 12 Sep 2026 21:55:48 +0200
Message-Id: <20260912195552.76673-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves ARM cacheinfo allocation to the boot CPU to avoid
sleeping-lock warnings during PREEMPT_RT secondary-CPU startup. It is
based on 5225b8eec4c9 (7.3-rc2 plus one day).

Patches 1-3 prepare for early allocation: bound cache-leaf writes,
include external caches in the allocation size, and guard CLIDR reads
on older CPUs. Patch 4 enables early allocation. Please take all four
patches together for stable.

Tested on QEMU virt (Cortex-A15), vexpress-a9 (Cortex-A9 with PL310),
and realview-eb-mpcore (ARM11 MPCore) with PREEMPT_RT, plus non-RT
virt and vexpress-a9 builds. Cache sysfs output is unchanged for the
normal platform DTs, and CPU hotplug passes where supported. Additional
checks cover DT leaf undercounting with KASAN and ARM11 DT cache
descriptions.

The full series also passes on a Raspberry Pi 400 with a 32-bit
PREEMPT_RT 7.2.6-rc1 kernel: the boot warning is absent and all 12 cache
sysfs entries match the baseline. CPU hotplug is unavailable there.

The series applies unchanged to 7.2.6-rc1 and v6.18.

Karl Mehltretter (4):
  ARM: cacheinfo: avoid out-of-bounds write in populate_cache_leaves()
  ARM: cacheinfo: count external caches in early_cache_level()
  ARM: cacheinfo: guard the CLIDR read in populate_cache_leaves()
  ARM: topology: allocate the cacheinfo early on the boot CPU

 arch/arm/kernel/cacheinfo.c | 49 +++++++++++++++++++------------------
 arch/arm/kernel/topology.c  | 13 ++++++++++
 2 files changed, 38 insertions(+), 24 deletions(-)

-- 
2.53.0

