Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E1037E5E1
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540980; cv=none; b=slLmDS6SbItFVmnbnGXx00K2un4RW/0sgjvvinEJb/PVwPQbhWHMlFlntS3Rs+A5aFZ4VtKHroO8k+rXHgVVIhzYcVP9BKXlOACZy9i8jVpd6sfI5gwzyG4YPcTEkTfSspsdnWjaPxHRUjFJ1QLb42vP7Fn4nk+37lw/ICqLDPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540980; c=relaxed/simple;
	bh=CCSZzO/knQUMn7bP6cifPp5sPoP3MnpUcM2KLsQ4hTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6Y0xfbdoY+evGX8GalfO0Gxfa1J0ltuleAZg8QdsWqvlud9muGo5+irMS+cq6fE79ntw+JW5KIkOp/Azcjd2dYs/u+IV80APpkPlWukUrsheER6V3rhy/LbyYTfcidfT4K8KLjraL335RCPR6hSAMPyZUaI7uy0CtWB1wBSFYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qa1A5lL/; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qa1A5lL/"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-985369a13bbso625479241.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540978; x=1791145778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nl+pDpZ/zHEX5u9H3JLRFmOZ4xMUKm7NbKCyuVe6wcs=;
        b=Qa1A5lL/bFiKN6iaDGTe4r6KxGww6TpfZj/cQ5DziMUclzHIYKW5Tna/LeokUljeov
         +r2+AYsRsRjnL3HHvBqrtyYPh7nw+8PJDhneztbPEvCOeg+K0koKayfTG+aqST2U04ws
         a1V3s5qTGY8kDwUf/4bFA92hIb7vYv0U4bIMUiCRgqAjifsRW9CDYj/2NYdoEYsy88KC
         6Rx98QOxBUkEbWVZZglVfbgnXni+L7XYj2Ps9xcni7QyCQZPY8FDafTSiyGbvEhtzspe
         qDO1RJcWykkwmy80527eLyWCFrAry86DE5/S6HfVZmJwSBS6Yb0ZtcsMAMdzjfPVL0Ol
         Xzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540978; x=1791145778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nl+pDpZ/zHEX5u9H3JLRFmOZ4xMUKm7NbKCyuVe6wcs=;
        b=QPXESsBwVK4GqVVXvUptEikh0jVeWmCJZkcc0CAz0tKwUnzxJJd8nP3WHGPiW6LJhA
         Z75n9EJ9zwEzCqLIsRsFM3YTUln8cgVQvnD5g6mq6/VsqM30VEg0wxS0ZD5eNGT0tuer
         EVOCnvO0+l8Q8iCIXwAQomw1UakM8NT7d7NK88kwXkoGEnl1i0Lywrjck/Tj3Z1KJ39T
         YrlBs2GzlpM6iP6nSw2QQ/HEkVO3l1uOICkLR1AUwIZsjOw2hQK9n1zJh2gtp73LwmyM
         Nn/Y1xtlIQ55trlKEo+gCQsv5tK4muvLI52KNuB9lHkeNdTREhNLr/mxw+XqSh0sj4K8
         T2Ig==
X-Forwarded-Encrypted: i=1; AKwUvByO14ZN7MhqrGFhBCkZ6p42aDxAsOX3y7fau0i8aq/Fodt/j7RP1TSUMQLo4ZuuZevE1l8W+Fbg+O7hJ1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMZgLJyjMKeB1PqyLoArg4IZNK/MVyJxfqg+ty1VUzeLsTBLXs
	dcUv/LWkWtwz5Q5XRS9wtF9t1klam8rQmf3wEzujAmetJ3eO9SHNgvl4
X-Gm-Gg: AYBFou28cFWMp2roLBze8bZQAJ5EgEWC2hHgmBrh5eDTvmp1zOiPp0RcXy8RzFtNCcy
	Go5OodBuPAf6GEw3TEfhzRXkuozLZG/DsXERhHYQDO73bDDG7uDnRub8+OCwgjlC8BvaqLedgRx
	Ijp+S0EhP2VMwOrO2/aROHp9P0ta/KRroH81NDaxvki7doF1e1KTHiEx1YsxCOsgKksKbCld5Fg
	4/mG90MY4/1qEgMf3h7ox9Cecug2zPQgmZ8WHm0zxczaNIl+bjoYlxvY+K3ERpivYT3AJVuFGhq
	fB35+eCwlBXV8DGl1OT7aXs1Dr5s17nBKTyX0QJHX0k40zTfKsWiappDbPbAGstukN7AMa+F/ri
	TKfuePtzby4lNOf7QYvZfyXvd2oVEYmeCL/QMu0e8cMlRsl9LBUEuz7201Fv7pU/UCWzOUYwtJN
	nSbTAhOTzN6Uh477kTU57AoLb6yZ7JE8epzjmLeLYQPd9sWFZCApNA36Cra8F7/Jg=
X-Received: by 2002:a05:6102:3f47:b0:798:24e8:23f4 with SMTP id ada2fe7eead31-7af1cfa46e2mr3382979137.7.1790540977704;
        Sun, 27 Sep 2026 13:29:37 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b9af306sm6791391137.9.2026.09.27.13.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:29:37 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: johan@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH v2 0/2] debugfs: fix UAF and double-free in debugfs_str read/write
Date: Sun, 27 Sep 2026 17:29:27 -0300
Message-ID: <20260927202927.2059816-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092726-posh-handyman-43a0@gregkh>
References: <2026092726-posh-handyman-43a0@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 27, 2026 at 06:34:44PM +0200, Greg Kroah-Hartman wrote:
> No LLM was used to generate the patch?
> Again, no LLM for all of this?

I did use Claude Code during the process, but I want to be precise
about how. It did not find the bug, produce the analysis, or generate
the patch for me. sashiko.dev originally pointed out the missing RCU
protection on the read side. I then manually traced the pointer
lifetime and the write path, where I found the concurrent-writer double-free.
I used Claude Code only as an additional reviewer for spelling and grammar,
minor rewording, formatting, and as a sanity check for obvious mistakes.
I wrote the patch and changelog myself, and the technical analysis,
implementation, KASAN testing, reproducer, and verification were all done by me.
Given that limited use, would you still prefer that I add an Assisted-by
tag for the LLM in the next revision? I want to make sure I disclose the
tooling correctly without attributing technical work that it did not actually contribute.

My background is security research -- I spend most of my time auditing
code for memory safety issues and race conditions, among other things,
which is how I ended up looking at this code after sashiko flagged the
missing RCU protection.

> I'd like to see the userspace test scripts for this...

Sure. Below is the reproducer I used.

Result without fix: ~3900 "BUG: KASAN: double-free in
debugfs_write_file_str" on 7.3-rc4.
Result with fix: 0 reports.

In-tree callers of debugfs_create_str() with writable files
(vulnerable to the double-free):

  drivers/interconnect/debugfs-client.c:165  src_node (0600)
  drivers/interconnect/debugfs-client.c:166  dst_node (0600)
  drivers/soundwire/debugfs.c:361            firmware_file (0200)

Read-only callers (drivers/opp, sound/soc/sof, arm_scmi, i915) are
exposed to the read-path UAF but not the double-free.

== debugfs_race.c (kernel module) ==

// SPDX-License-Identifier: GPL-2.0
#include <linux/module.h>
#include <linux/debugfs.h>
#include <linux/slab.h>

static struct dentry *dir;
static char *test_str;

static int __init race_init(void)
{
	test_str = kstrdup("initial_value_1234567890", GFP_KERNEL);
	if (!test_str)
		return -ENOMEM;
	dir = debugfs_create_dir("str_race", NULL);
	debugfs_create_str("test", 0666, dir, &test_str);
	pr_info("debugfs_race: /sys/kernel/debug/str_race/test created\n");
	return 0;
}

static void __exit race_exit(void)
{
	debugfs_remove_recursive(dir);
	kfree(test_str);
}

module_init(race_init);
module_exit(race_exit);
MODULE_LICENSE("GPL");

== poc.c (userspace reproducer, gcc -O2 -pthread -o poc poc.c) ==

#define _GNU_SOURCE
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <pthread.h>
#include <sched.h>

#define PATH "/sys/kernel/debug/str_race/test"
#define ITERS 5000

static volatile int go;

static void *reader_fn(void *arg)
{
	char buf[512];
	int fd = open(PATH, O_RDONLY);
	if (fd < 0) return NULL;
	while (!go) sched_yield();
	for (int i = 0; i < ITERS; i++) {
		lseek(fd, 0, SEEK_SET);
		read(fd, buf, sizeof(buf));
	}
	close(fd);
	return NULL;
}

static void *writer_fn(void *arg)
{
	int fd = open(PATH, O_WRONLY);
	if (fd < 0) return NULL;
	while (!go) sched_yield();
	for (int i = 0; i < ITERS; i++) {
		lseek(fd, 0, SEEK_SET);
		write(fd, "AAAAAAAAAAAAAAAA", 16);
	}
	close(fd);
	return NULL;
}

int main(void)
{
	pthread_t t[16];
	int i, n;

	if (access(PATH, F_OK) != 0) {
		fprintf(stderr, "Load debugfs_race.ko first.\n");
		return 1;
	}

	/* readers vs writers */
	go = 0; n = 0;
	for (i = 0; i < 4; i++) pthread_create(&t[n++], NULL, reader_fn, NULL);
	for (i = 0; i < 4; i++) pthread_create(&t[n++], NULL, writer_fn, NULL);
	go = 1;
	for (i = 0; i < n; i++) pthread_join(t[i], NULL);

	/* writers vs writers */
	go = 0; n = 0;
	for (i = 0; i < 8; i++) pthread_create(&t[n++], NULL, writer_fn, NULL);
	go = 1;
	for (i = 0; i < n; i++) pthread_join(t[i], NULL);

	printf("Done. Check: dmesg | grep KASAN\n");
	return 0;
}

== Makefile ==

KDIR ?= /lib/modules/$(shell uname -r)/build
obj-m += debugfs_race.o
all: modules poc
modules:
	$(MAKE) -C $(KDIR) M=$(CURDIR) modules
poc: poc.c
	gcc -O2 -pthread -o poc poc.c
clean:
	$(MAKE) -C $(KDIR) M=$(CURDIR) clean
	rm -f poc

thanks,
Aldo
