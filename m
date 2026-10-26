Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021996;
	b=ygd5YvVLQ1EhURhuv+Y4ZmVta3aNYPU9sk0XBLDWgNveFPQjW9p7G/3gnLw3UgngDNG+
	 UDy9dlNlDfAj/F0BB8XC9f1D4PQ9ZWziu8tcWeIoo4VoLEcdGIrFnrP2XiZE3aBBX7NFv
	 Xfd3+ZCojYKTPQsuZXeosp+DndaLig/wFm4VbnbWvSNNznP/mPgPswvEkJN5/exBCzGzy
	 UxSIP55BeNp8d/EDVyjVJD5G2/3yk60x0akBYj08iOXN0E9l0JkrFsLIBqrnuzpklRDOI
	 1wtmC9UlbuuHgEDkGfYaeBftBlxWIRSdcLyIZHUR9B5dynjLiEAiiMm6Gd0wvZ9nhDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021996;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=K0EgAn/iS3oX1S1qDwDndGa2W8rY3Do1MLbVlEO2dA4=;
	b=Ht5I0B1qFyaTDK6VmKn7MmJwr1SND4QgdeZp1XLxFHAQx6ZI793mhNPjja5/mXA7qTXz
	 5tfhJfzlt/IoR3CtaqkZFk1h1EbbkznKpkCP8R4S0IJLupgppJrM4Hax/0P3S516sOZiB
	 L26gIYTGyjhyCGpP5fbfZLtKjt8gP2wRTLpiOi7wZq/lpjPfulznecEHaafpfjH6J5WZs
	 QjpzMBZoAE1Kz5GKzpgqnRlfWypWAH302sS7+92FuAcUX5QhFka/gIkAB8dHXNncrjhIJ
	 ivPG0s0VhDXzSZiS3ntc9FIfnPAXquuC6101qC3B3ukYmFlnOxX1Ag2kVjOOQGDkZjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=VICiHtH3;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C01C606A339
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C01C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=VICiHtH3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=K0
	EgAn/iS3oX1S1qDwDndGa2W8rY3Do1MLbVlEO2dA4=; b=VICiHtH3kySmSTPARV
	/QDWh9ewGKZvfJOzpK7kIKb6LhXf8r7hQxwkr4X1YAiA/GDPOKjSVqvdJRZZQBm4
	X/za6gTXR8hfX8WxgWJBjAQ8ZX2xrKbQ5EPKojODoPKWUcT8toN12Qp+GwgH6ydv
	eWguT/vJpC//yg+P+vSDGKb0w=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3V6HYV99qdQdwDA--.26919S2;
	Mon, 26 Oct 2026 21:38:32 +0800 (CST)
From: albin_yang@163.com
To: kprateek.nayak@amd.com
Cc: albin_yang@163.com,
	albinwyang@tencent.com,
	bsegall@google.com,
	chen.yu@linux.dev,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated blocked donors
Date: Mon, 26 Oct 2026 21:38:31 +0800
Message-ID: <20261026133831.4111227-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <72a6eb77-0461-477b-a0e9-c06a486e3e0e@amd.com>
References: <72a6eb77-0461-477b-a0e9-c06a486e3e0e@amd.com>
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
X-CM-TRANSID:_____wD3V6HYV99qdQdwDA--.26919S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryfZr48uw1rJFy7Zw43Wrg_yoW8Ary8pF
	98Wrsru3WDGr18XFsFyr17WF12yws7GayxAryrG3WUAas8Cr1jyr97KF43XryDArs3Za9I
	vr4qg397ZFyqya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUpCJPUUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbCzhieQWrfV9h8aQAA3m

Hi Prateek,

Thanks - using is_blocked as the single indicator is certainly cleaner than
piling up exceptions.

I rebuilt your diff so it applies cleanly and gave it a run. I'm afraid it
does not work as-is in my testing - two problems:

1) sched_info_depart() now calls __sched_info_dequeue(), which no longer has
   the "if (!last_queued) return;" guard. A blocking task has last_queued == 0
   (sched_info_arrive() cleared it at switch-in), so delta becomes
   rq_clock(rq) - 0, i.e. the whole uptime:

     cross-cpu: blocked 169.80 ms, run_delay delta 169047.52 ms
     same-cpu:  blocked 168.70 ms, run_delay delta 185515.00 ms

   The control is affected too, so this is not proxy specific.

2) sched_info_enqueue() now arms only when t->is_blocked, leaving ordinary
   runnable tasks with no counter at all - my sanity check went from +39 ms to
   0.00 ms in every iteration, including the control. I do not think either
   polarity works: is_blocked is still set during the real wakeup enqueue
   (delayed sleeper: inside ttwu_runnable()'s is_blocked branch; donor: cleared
   only later by ttwu_do_wakeup()). So it can gate the charge side, but the
   arming side needs something already cleared at wakeup - task_is_blocked() or
   sched_delayed.

The delayed reproducer shows 0, but that is easy to misread: it measures only a
delta, and the bogus depart charge lands before the window. Its absolute
run_delay is polluted too. (The 0.00 ms sanity figure is from the proxy
reproducer, which carries that check.)

For reference, !sched_delayed && !task_is_blocked() gives 0.01 ms on the proxy
case with the sanity check intact (+39 ms), and 0/20 on the delayed reproducer.

Happy to retest whatever you come up with.

Thanks,
Wei Yang

