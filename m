Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311340;
	b=rMVUMaqlOMCQkuPZXYinkXIV1p3wq3G+ya/n6LnldHB31zT5GitxX+++O54viz0ofKap
	 OI8uVRE5DtFVmie6bj+mouGiE1pHvrz6UCrfLH9BBktX6bUWy9mDYWw+uL3pcxRjawsOX
	 YPdQZS0Tu6KJ4jP1Wpo/byGqDF6PaV4XluJX3yMTiy4zUqE197HhEJELE2Pq8B7vajj9p
	 LJvOFZxBhFbBG/vtk4xY/HKPmy2LKZVdCFiy+HXZkSDr1Te01S5E7FxVSrWQWqBhUO7Qj
	 AswIXrlXQTaEZkOJsmoEpfvTFxadHVUnmy2vDN5rhVWL/JxslZhAvDa5Qw5+YE1Pjhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311340;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FY9iXHfyXaaVg/92Tb3VUJlWn6Qi4Smqbz6v6O2hb0w=;
	b=wWinhr9qhuXmmOnXUXVYMnMPzZ0vlxttXhx4Ef+ZA0PKcgUw470RF4puxkoaMJImBVgb
	 UbuCem9l1iEVjNeAg+571ewXv6J9mzxYgQL3zIROPzh0jA1KLhNKuO+sRVaDIWIsrO9vI
	 zolM+repnWAH7XuGA3pHLFPwhCwz2AiqXRb+ReYqthDkQ367SOCkIlmbD0f5+Hrd/8S8R
	 Aj2IwX62BULk33nfnWgxf8gxqF3CG+eVSWJO8RiCNy5Asg3fKqjbj448TSDKXBliLzPcy
	 9GaDjV2FgbrL9jLu8cl4czYbuFCnEWRFYtjV1WO7rhtXoQmXXvdgPB7ILH9NdwEmRKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gaxFKizM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D320606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gaxFKizM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4CB41F01816;
	Thu, 29 Oct 2026 22:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793311340;
	bh=FY9iXHfyXaaVg/92Tb3VUJlWn6Qi4Smqbz6v6O2hb0w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gaxFKizMfxH7zMrGMF7mrksWh+Jso41v96TvUdmzY8/Gxj8v+1cUy0mdRAVgZhZ2m
	 c0DUzveJ8ljnve2nPSeHultxhWhbSjQyLl6s8BnTzT7aPoXW26xzZvkBa9kVs8JHmd
	 pbkwZmzy7JiqgrDq/u3lVuy4iyNvWJ+3rlTeZUn/QJUGnY0Yvh1xw2Chbl+1havW0Z
	 GvYPYDsVj1LYebovQMvWR6enCNgswIi2hv+pMwXqLMhu4JFhhwJ9iyVAdpY9M4pGQj
	 UhBGph7/08yAgQnEy9Xp70L0GszlVePkxj5cMx4/royKsXrIvjVd/SNLyucq5465mV
	 kxe8aJhwi1yNg==
Date: Thu, 29 Oct 2026 12:02:19 -1000
Message-ID: <cc76808cadf384b5ce9441f21b65a9e9@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, David Stevens <stevensd@google.com>,
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>, Suleiman Souhlal <suleiman@google.com>,
	Andrea Righi <arighi@nvidia.com>, Metin Kaya <Metin.Kaya@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
	Zimuzo Ezeozue <zezeozue@google.com>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>,
	Xuewen Yan <xuewen.yan94@gmail.com>, kuyo chang <kuyo.chang@mediatek.com>,
	hupu <hupu.gm@gmail.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>,
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su <sh_def@163.com>,
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>, kernel-team@android.com,
	Johannes Weiner <hannes@cmpxchg.org>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v33 1/7] sched/psi: Preserve sleep-persistent PSI flags on off-CPU sleeping dequeues
In-Reply-To: <20261023220431.1106611-2-jstultz@google.com>
References: <20261023220431.1106611-1-jstultz@google.com> <20261023220431.1106611-2-jstultz@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello, John.

This patch also fixes a trigger without proxy execution, through
switching_from_fair(). A fair task sleeps in iowait and is delay-dequeued.
sched_setscheduler() then moves it to SCHED_FIFO, and switching_from_fair()
dequeues it with DEQUEUE_SLEEP | DEQUEUE_DELAYED. TSK_ONCPU is clear, so
since c2ae8b0df2d1 ("sched/core: Fix psi_dequeue() for Proxy Execution")
psi_dequeue() clears all of its psi flags, TSK_IOWAIT included. The wakeup's
psi_enqueue() trips the check:

  psi: inconsistent task state! task=1318:python3 cpu=3 psi_flags=0 clear=1 set=4

Tested on mainline 4dd16e31135e with CONFIG_SCHED_PROXY_EXEC disabled, each
run a fresh boot. Without the patch, the reproducer below hit the warning on
10 of 10 boots within about a second. With only 1/7 applied, 0 of 10
sixty-second boots hit it, while switching_from_fair() dequeued a delayed
iowait task about 3,500 to 16,000 times per boot.

Tested-by: Tejun Heo <tj@kernel.org>

The reproducer needs root and a block device for O_DIRECT reads, and takes
[secs [cpu [blockdev]]].

  #!/bin/bash
  # psi-delayed.sh [secs [cpu [blockdev]]]
  SECS=${1:-60} CPU=${2:-3} DEV=${3:-/dev/sda}
  PY=$(mktemp --suffix=.py)
  trap 'kill -9 $(jobs -p) 2>/dev/null; rm -f "$PY"' EXIT
  cat > "$PY" <<'EOF'
  import mmap, os, random, sys, time
  if sys.argv[1] == "io":
  	# spin ~3ms so the entity runs past its share, then a 4K O_DIRECT read
  	fd = os.open(sys.argv[2], os.O_RDONLY | os.O_DIRECT)
  	nblk = os.lseek(fd, 0, os.SEEK_END) // 4096
  	buf = mmap.mmap(-1, 4096)
  	while True:
  		t = time.perf_counter() + 0.003
  		while time.perf_counter() < t:
  			pass
  		os.preadv(fd, [buf], random.randrange(nblk) * 4096)
  else:
  	# flip the I/O task between SCHED_FIFO and SCHED_OTHER
  	pid, end = int(sys.argv[2]), time.time() + float(sys.argv[3])
  	while time.time() < end:
  		os.sched_setscheduler(pid, os.SCHED_FIFO, os.sched_param(1))
  		os.sched_setscheduler(pid, os.SCHED_OTHER, os.sched_param(0))
  EOF
  for i in 1 2; do taskset -c "$CPU" bash -c 'while :; do :; done' & done
  taskset -c "$CPU" python3 -I "$PY" io "$DEV" &
  IOPID=$!
  sleep 1
  taskset -c $(( (CPU + 2) % $(nproc) )) python3 -I "$PY" switch "$IOPID" "$SECS"
  echo "io task pid $IOPID"
  dmesg | grep 'psi: inconsistent' || echo "not reproduced"

Thanks.

--
tejun
