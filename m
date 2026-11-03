Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793685707;
	b=lNXQnVVRnClivZsrTABKzvP2v0vWfbgKaSN4LMe509oB+1oboLBPW9LkJN1ob31wRyTs
	 qlgzdSr/kxDX4zQ7haEXFRI3cyEkSLZ0z1RnYzDZOchn/a2FNj4aw+beww0YvDpoO8Qxe
	 TQpmt7Zrk2X7kQXqiI87RvRBVbn37Q3E9UBnJb49cy0E9vV/nxZequks7Q8096SVxmn+I
	 0rw3PHgSmiG49Ny2gcVAHLTXyXhfOz3RcTxNX2JPPZs7jXthC6E801Lo+/dPs/DjDaPQd
	 bsC0t/jraHJ78PS4EacKL7l8sRvTxzW9aeSAW4udK9wx2uWjrvO5dqdrEKOZ1cziImw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793685707;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=VeSiyzhTEFSngB/FIDUMELWE/5YFBIOR5Tfd40y+TCY=;
	b=CC9oKYu8Xm3FUbWfoyMFRLvl3AQYYGmwPdzIIDPOCquPyT2QwTHR9xABrByA8jab9P6Z
	 9B0HmMpPGVjj4Vfg+CfVVE0vw5o1sDxd3/iLhcKz87KDl9aF9CG2gAYqac9aq9keSSzI8
	 64WV6Bp8FguZ0sM8c1zzG0fqjSL3Al29Wvxr4CJ9vEgOkLHR4uxBbioqYO9/5vofVqhDr
	 HyWJWJ9+A+euVwSo8WIkPSi3EVufb8gkcoPI3b7TB7Fv5RJpthtPda+6biuU38FnzlfXo
	 v2AtqRoew9QDCPpyU71emQRdVEv8s4qjfAjhN5Q6g7LRrB+H+pB7A9iCz2c+COq6uHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=X+KQS2eM;
	arc=none smtp.remote-ip=203.205.221.202
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A971E606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A971E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=X+KQS2eM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793685697; bh=VeSiyzhTEFSngB/FIDUMELWE/5YFBIOR5Tfd40y+TCY=;
	h=From:To:Cc:Subject:Date;
	b=X+KQS2eMuuQZnWqh0YMMGqq9roTCyuQAQG3z2VOjC4273qwifOQ/3bt9nLDVclmIP
	 50QsO8hn+7roxawA0gXnT04G6g653kJ7bsVJTBhV3VZOeixV3IstFtJMSDaLYEiFjQ
	 u6vo1BWWcLVdeLC/vpIZX+7JSQYLrAv3uSUGQcKM=
Received: from [127.0.0.1] ([113.208.112.234])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 62A70E0; Tue, 03 Nov 2026 14:01:34 +0800
X-QQ-mid: xmsmtpt1793685694tfx1qi2nx
Message-ID: <tencent_6CFB6E9B26A308DC2800D4059DF93FEC9706@qq.com>
X-QQ-XMAILINFO: Mpd2mWiMiheJHZPKR8L/8u6XxGTUkKqWWpxrEOsRcoMgvKbBBq+HiZ6/xDQEAF
	 egO8UgysroYtiJni6G0H73raXq7GLAJetsmbLsZwGTFSwpY3F3oz9Fq7DAYVQIyU2umXuvVqyIZq
	 plNTMJo1bJIVRNSFS5vxMf7HCHPK10atGf7ohpxPQOVF/okRLZYe/alZeTVdrZpV6/xeA5pJcT+F
	 4XScnVhCyqOaSM5uY9B740DURpf1/YXJeQDgrUBGOD6n/zerxl4HwLd4YzHC+0pAK9L1qIeEzsHY
	 dEGzHSIQ3CWj9qKZbFezeFS1tbdRndZPQeOxQuzgAwTawPxt3qqKQAroDQZD9AhxiXriQW5j5dpT
	 JyKSkWeiI3QiE4bvfN18xXgrpPgTuXqUUu2EZqObbbqqpdJLR/qCuh88VYKQhEhvcPKJcoAmLpw6
	 61YZ1/dwh8SZoiiBAjdh/O9wQg2utiRY7x+UxannwnqAwt/9IVywzhN1lwRafmEXZ954JrAPIC4P
	 0uLrJy9I+lbisWQDYEAoQfZXFYXYcu30mTi1F4FUUVOkNbrebDwHB9zuJ2Qz+zsmvgW2LfABmvzQ
	 fRTGbqnJhH9a2ftYwMFeUDRAi48H73OS1t0zMQcjFovcY5cR+qYzIWmlU/mCUpC7K9bcd3wL0+vN
	 ExdQXBFkqHwN6By7Ck20D9mEKAK32i5XWHbYoknyHVt3D466cz4Pdj58iW4dRbbcTpwkeQGUFmpI
	 q68S20OnNd/o2z/4SSYDNxt2sZbprehBcoOCPYDrtEDGgmuf9u4kUOge95ROZNL4wpuoPY5rK5Ir
	 e1vRtr+FiQDEPE0P7gb992AJwP5XFV42dfdN6dIGE5htGE2xJ/7P9yjP5PVNV0TCB/ZsuMdl6Lov
	 QYHeWPHvSDjFE6VMgwgleyJKfVxi1LkNDF/PKZstVqlWdtKtQonEfEGHyg9yAsVo97c3kZ4ip0bj
	 n/sJuNb+xaK87bVebazU5Ouf30YhnecaGOnXZHwCTFGK8TemH2yBg1E/1cmaLOBIBfbzoTzfGGmk
	 iNkyacCA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: kiln <806144828@qq.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Balbir Singh <bsingharora@gmail.com>, Yang Yang <yang.yang29@zte.com.cn>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
Subject: [BUG] sched/delayacct: blkio_start recorded on the wrong task when a
 delayed task is blocked from pick
Date: Tue, 03 Nov 2026 14:01:34 +0800
X-OQ-MSGID: <179368569477.3784133.15264728802144097127@qq.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

I think there's a delay accounting bug that came in with DELAY_DEQUEUE.
__block_task() calls delayacct_blkio_start(), and that helper always
writes current->delays->blkio_start. That's fine when __block_task() runs
from __schedule() for prev, but when the task was delayed and gets
blocked later from pick_next_task_fair() -> pick_next_entity() ->
dequeue_entities() -> __block_task(), current is whoever is scheduling on
that CPU, not p. So p's blkio_start is never set (or is left over from
an older sleep), and when the I/O completes ttwu() calls
delayacct_blkio_end(p), which adds local_clock() - blkio_start to p's
blkio_delay. For a fresh thread blkio_start is 0, so the thread gets
charged the whole time since boot in one go.

How I ran into it: per-thread blkio delay (taskstats, and field 42 of
/proc/<pid>/task/<tid>/stat) on some hosts showed threads that were a
couple of seconds old with ~7,070,000 s of block I/O delay, which was
exactly the host uptime. Always freshly created threads of a headless
Chrome (ThreadPoolForeg, Chrome_IOThread, Compositor and so on); Chrome
creates lots of short-lived threads that soon wait on ext4 journal I/O.

Kernel: a distro 6.6.102 kernel that carries the EEVDF / DELAY_DEQUEUE
backport (Alibaba Cloud Linux 4, 6.6.102-7.alnx4). I have not reproduced
it on mainline yet, but as far as I can tell the code there is the same:
__block_task() in kernel/sched/sched.h still calls delayacct_blkio_start()
with no task argument, in v6.12 and current master.

What I measured with bpftrace while starting Chrome a few times
(roughly 70 s per run):

kprobe:dequeue_entities    { @in_de[tid] = 1; }
kretprobe:dequeue_entities { delete(@in_de[tid]); }
kprobe:__delayacct_blkio_start {
  @start[@in_de[tid] ? "from dequeue_entities" : "from __schedule",
         curtask->in_iowait] = count();
}
kprobe:__delayacct_blkio_end {
  $p = (struct task_struct *)arg0;
  if ($p->delays->blkio_start == 0) { @zero[$p->comm] = count(); }
}

With DELAY_DEQUEUE on (two runs):
  from __schedule, current in_iowait=1:        11081 / 8691
  from __schedule, current in_iowait=0:            0 / 0
  from dequeue_entities, current in_iowait=1:     50 / 61
  from dequeue_entities, current in_iowait=0:     52 / 103
  blkio_end with blkio_start == 0:                 3 / 10 (all Chrome threads)

With NO_DELAY_DEQUEUE (two runs, same workload):
  from dequeue_entities:                         0 / 2
  blkio_end with blkio_start == 0:               0 / 0
  starts vs ends: 12057 vs 12056, 9612 vs 9610

So on the dequeue_entities path about half of the starts land on a task
that isn't even in iowait. A kernel stack for one of the zero-start ends:

  __delayacct_blkio_end+1
  try_to_wake_up+1509
  wake_bit_function+57
  __wake_up_common+118
  __wake_up_common_lock+129
  wake_up_bit+127
  journal_end_buffer_io_sync+48
  end_bio_bh_io_sync+38

This looks like the mirror image of c96f5471ce7d ("delayacct: Account
blkio completion on the correct task"), which fixed the end side the same
way. The obvious fix would be to pass p down, something like
delayacct_blkio_start(p) setting p->delays->blkio_start (checking
p->delays rather than current->delays). Happy to send a patch if that
direction is okay.

Thanks
kiln

