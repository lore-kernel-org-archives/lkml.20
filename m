Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EED84E50D5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611292; cv=none; b=MBIg28NuzavEWTb8xIVWVRdJGNsxhK9A6DO7C4K1W+/jzRx2PWWA8yfDXejfGc5woYyKgRN9J7Pt2rgechPueH2lb9bdzYiaz+Ey9Wq+n+AjwlLPGT6NdFJ3FToN7L/NwmNQoITTrbAC7qtAutf4J8CSjkjpaQ/LtADQ0twtnQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611292; c=relaxed/simple;
	bh=Fv8XnK5WCN7eV0DQaaWOcaHLnKI55rjDGdONGhecXhw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L325K571n5O1YWS/LTiX/iRnPy6YKFHVoELYI6QNQcj5gsxPDOmrOM2fgs28Iwjy5Ao5pDBZHUV5z0sa64DdioNtDcxYw338suPYWMPkOclQRmrm+JLlcu0YJZngwPCR+kpmn3+0XzKTZOFnseU47mIgrrF6XEziyYcVfjYkg3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=fDiXpyNk; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="fDiXpyNk"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93c5818c4a4so189676285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790611289; x=1791216089; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VGma3cu2c3yEsc5fJWd/7eqGv+CXXOFaMIKpvSIhYLg=;
        b=fDiXpyNksp/DLcq5R7R3XsTOsspHQLUvesZyKMcAPt+cB/J/CKaBAbLMHVdEFiXF6k
         UJUm3XkKcfWFW5KKIc5KN3ColLyENh5mXdyExJEBHyEa2VMCOrwicMmEf+gqgHNjS+Os
         2NQWyz5fnR8OUt51lv5KnMy9Q93oRpPnbMz/aFHcOd7VHa/+RGSNt+5u6MJKcuS5NlyY
         iauq3GlP2ufmSVRVKWjAYcPQkcn7Xfli8AsCOFwd6q/olOvRSgqMgh9XNBVVuJvUJQjU
         UNcOJmabqoPFou1SFHfA3Z2wAdf5sDKDP2J0p3p4AzFDRzNcG/Nw+R7Yxe5Sa6ejbIFy
         nKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611289; x=1791216089;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VGma3cu2c3yEsc5fJWd/7eqGv+CXXOFaMIKpvSIhYLg=;
        b=igooVhwH77qBVXIuI4K3K9XZZbnEpFnthjxi1OK0ofbtfLdOk16t9FvHLntRbd8yf1
         ke4gbxlBwPLAOVIY5fh+HAggqfLSKYjy+JBJSVL80/VRVgDGKge3p8M4IC645Bb97B7o
         geWwSCxK6jjRbISIDdmrqb2q9CmfHXT6hZ/kD0L+BoqxR6jUQdYqBwhI9urbWvFz8k7m
         hYG2e/g287dqzt0SJq8v69ut3VlPonDmqPYp3O3u8HjbvBFYvjDdd2OKDpCk/KtYVn7V
         n23WmGIwZSR9f4yQnXL8Ye/y0w66F2r8LppfRb+U01jTcPMIvA6GCBdZTaJnMnfEikAt
         IzKA==
X-Forwarded-Encrypted: i=1; AKwUvBwUjh9cLRuKxjx5JPHHcZQ3fj0GIfmQJgOBolFhnFwJR9qcZo8EO9KhWtKs6+qvGJ/dMeuOnlWkXnUwP1M=@vger.kernel.org
X-Gm-Message-State: AFuF++kegceYBXVEq/HY6ObFhgrxqg1eSmdbSagMz4pnL+nrJJU+Al2U
	aJYCUb6SEutV4wNn51c6m4x3UYM80kDpkEdwoD0ttNdG/I71bZARHEdB9aXWRxRwudg=
X-Gm-Gg: AYBFou3KC+UN2BUdeRPjGvsFVbiQadgOKtK8HtbH7gf5AFXM8+HA3ce89V3QM05LVqS
	GtKwT9GMEUUcuWj1DCzSD+lGHCqQdd8MT6wxNheE57mnb9Wgp6oHgvtyt1Yz7A7lmWSvsCGkhBQ
	EibdL4S4DUpwz+tusGrFvA7jcaaLa36YkFSVreFjx+wFXVOLmUOboQEkHUDy+wNpMJ8K+Y1R6b0
	w7vc+wRZIs74oD0MuMMLpk7UijNnW0hLVsP/aGr4UR8M4IpAyS9TWo/0O9tcvU8brJajWMCMOWY
	20MYt7SbUL1Y16//YIexjWmRD9k1lXKPHNTdgQ/2IJqat1EKwHdrbqv4TOazbYf5LZXCsP2WQdC
	o/XcFytrRzEH7rJEqp5rt0Uz+KkCM/ePSRAYmhXqGmyEwyDhfNVoOwzg4jx1vH0/IUXzhUAf1NS
	p1yjgMwUJcHTp6kxErzaRtP9woyedbDTPEDLqnbpJNH2uXQmItVa9BcuzjFM7pjsUFdwp7A6TjZ
	a3HDgQZWKJeVqU=
X-Received: by 2002:a05:620a:7004:b0:93c:5f3c:f482 with SMTP id af79cd13be357-93c5f3cfbd3mr1548872685a.33.1790611288926;
        Mon, 28 Sep 2026 09:01:28 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c815a47a6sm178125585a.47.2026.09.28.09.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:01:27 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 0/9] ublk: fix dispatch to canceled io commands
Date: Mon, 28 Sep 2026 16:00:36 +0000
Message-Id: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACaPumoC/12NQQrDIBBFrxJm3SFWJGCvUrpQMzY2oqJJWgi5e
 zXddfn+/P9mh0LZUYFbt0OmzRUXQ4XrpQMzqfAkdGNl4IwPTHKBWuCq/YxGBUMeyxITjoNgykq
 rpLJQlymTdZ/Ten/8uKz6RWZpqtbQqhDqXB1Ti3zqTXzHPFPuz9P/CziOL8CjpdGrAAAA
X-Change-ID: 20260924-b4-ublk-cancel-stop-d640af9fa9af
To: Ming Lei <tom.leiming@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790611253; l=4747;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Fv8XnK5WCN7eV0DQaaWOcaHLnKI55rjDGdONGhecXhw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIDP5VCB4B1NEqIg/MBiBQuSHhWm27DjTvAT1L7BxI6iMSUS7G/xOdwa4JvCuHuhn3P7tKEhQrT
 EK3sHYeScsQg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

ublk can dispatch a block request to an io command which is completed
already, and the kernel oopses in ublk_queue_rq() on a NULL io->cmd.
Before commit f7700a4415af ("ublk: fix use-after-free in
ublk_cancel_cmd()") it is a freed io_uring request instead. Commit
1133b93fc7f6 ("ublk: set canceling flag even when disk is not
allocated") fixed the io_uring exit route before the first start.
These are the routes next to it:

  1. STOP_DEV on a device which is ready but not started, then
     START_DEV. ublk_stop_dev() cancels the fetched commands after
     dropping ub->mutex, without marking the queues as canceling.
  2. A partial FETCH round whose task exits, once another task
     completes the round.
  3. During recovery, the task of a queue which is ready already
     exiting before the last queue is ready.

Patch 1 keeps a queue canceling at its ready transition when one of its
commands was canceled after the fetch, which closes route 2. Patch 2
clears ub->canceling as soon as a queue clears its own flag, so that a
later cancel marks and quiesces the queues again.

Patches 3 to 6 prepare for the control paths claiming commands while
the server still commits requests. Patches 3 and 4 put the switch of
io->cmd in the commit paths and the reads of a cancel under io->lock.
Patch 5 has the issue path complete a command which a cancel took
before io_uring put it on its list of cancelable commands, and patch 6
splits the claim of a command from its completion.

Patch 7 makes ublk_uring_cmd_cancel_fn() mark the queues and the
command in one cancel_mutex section, so that the ready transition of
route 3 cannot come in between. Patch 8 marks the queues and claims the
commands in ublk_stop_dev() before ub->mutex is dropped and completes
them afterwards, for route 1. Setting ->canceling there is not enough
on its own, the last FETCH of the round can still come in before any
command is marked and clear it again.

Patch 9 changes behaviour and is the one I would like feedback on. With
patches 1 to 8, as with 1133b93fc7f6 alone, START_DEV brings up a disk
on which every request fails. With UBLK_F_USER_RECOVERY and without
UBLK_F_USER_RECOVERY_FAIL_IO the requests are requeued and never
kicked, which leaves the partition scan hanging under
disk->open_mutex. Patch 9 makes START_DEV and END_USER_RECOVERY return
-ENODEV instead. The server cannot fetch those commands again anyway. If
that is not wanted, patches 1 to 8 stand on their own.

UBLK_CMD_QUIESCE_DEV has problems of its own, which this series does
not fix. Its one cancel pass skips a command whose request is with the
server or still started at that moment, a COMMIT_AND_FETCH then queues
a new command on the canceling queue, nothing completes it, and the
server never exits, so the device stays LIVE. The path is the same on
for-next, but with this series the hang shows up about twice as often
in my testing, roughly 4% of quiesces under fio against 2%, possibly
because the claim now takes io->lock for each command. Sent again after
a new server fetched its commands, QUIESCE_DEV can also leave some of
them canceled. I am working on those separately, tying the cancel to
the server it is meant for.

ublk_batch_attach() publishing a fetch command before io_uring marks it
cancelable is not touched either, it is the same on for-next and I will
send a separate fix for it.

Tested under QEMU with KASAN and lockdep, and in a KCSAN build: a small
io_uring reproducer for each route, with restart after a server exit
and a full USER_RECOVERY cycle as controls, the ublk selftests, and a
script racing ADD_DEV against STOP_DEV and DEL_DEV and running both
under fio, on each commit path including UBLK_F_BATCH_IO. On for-next
the reproducers oops. With the series they end in -ENODEV or pass.

Thanks,

Josef

---
Josef Bacik (9):
      ublk: keep queue canceling over canceled commands
      ublk: clear ub->canceling with the queue's own flag
      ublk: publish io->cmd under io->lock in the commit paths
      ublk: read the io under io->lock in ublk_cancel_cmd()
      ublk: complete a command canceled before it was marked from its issuer
      ublk: split ublk_claim_cmd() out of ublk_cancel_cmd()
      ublk: mark queues and command in one cancel_mutex hold
      ublk: claim commands under ub->mutex in ublk_stop_dev()
      ublk: refuse to go live over canceled io commands

 Documentation/block/ublk.rst |  15 +-
 drivers/block/ublk_drv.c     | 394 ++++++++++++++++++++++++++++++++++++-------
 2 files changed, 344 insertions(+), 65 deletions(-)
---
base-commit: d70609a2f68c9c89231fbce6600c90feca65e262
change-id: 20260924-b4-ublk-cancel-stop-d640af9fa9af

