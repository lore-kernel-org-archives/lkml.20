Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7864F30C1;
	Tue, 22 Sep 2026 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060828; cv=none; b=MfACKt42CexIuHiwl+DxK7b2TbwxYhADVVfWQtORHsPINKl7KEbft5tqwsJGKsPIxZM3yvkMam3pSGfgB2gy4ik4myoC68xmJdrTJYqzTTSVuL9n0tixr7rL525/FM9oV9Afl3rfpJkyF60L7AjekwIlNjw2sM7gz4b1UpYGiZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060828; c=relaxed/simple;
	bh=c0p2lXoFYXsW4S/YekiSdYU1ewx7gAxopyP2B03FLo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gf7d+XNhWYl6S5KBn3afDkbYm2f9qDz+a5sx+fXveRshsOl7D4iJj5ahVTfu+SWXg5ukIlBjVZfgZhngucLL/bvG94zJaqXIb8erqJ5m5fwVuGAa/u0xg6XoZbUx6uYCHv31fbtOGcv7jmLzEKiIbolyW3cZzEVBAzc8zLfL1zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ww/K3iLi; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ww/K3iLi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=c0
	p2lXoFYXsW4S/YekiSdYU1ewx7gAxopyP2B03FLo4=; b=Ww/K3iLiq6isLjzkuA
	Bc1w/vQrW9p745o8/p+MCTHh/nneQhBDDWHGcbCN7Ipen10LzOzwhQH+eBcdy3RJ
	5F9XE4Mlxfcgfl+vrRdPWvJOuAlRfiPZNj2AKghukjnpqkt1cXyyx5uPQ/0O/mvO
	+Oep+pisZ2jgKD4JrhUMs8j8Q=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnTVH0KLJqbxULAw--.34964S2;
	Tue, 22 Sep 2026 15:06:29 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com
Subject: Re: [PATCH 1/2] sched/doc: add a preemption model overview
Date: Tue, 22 Sep 2026 15:06:19 +0800
Message-ID: <20260922070619.70145-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921113050.lwG9IphF@linutronix.de>
References: <20260921113050.lwG9IphF@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDnTVH0KLJqbxULAw--.34964S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw47JF1ktw4xJryxAFW7CFg_yoW8GF1Dpa
	yYg3ZrGrsrZ3yIkw1vyr17GFyFyws5Jr45Kryrt34jy3yYgrn7trs8tay2kFZruFWfur4a
	vFWUWa9xA3Z0yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUrpnQUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC-xWOBGqyKPVYFwAA3q

Sebastian,

Thanks for going through it that closely. You found real errors, not just
wording, so here is what I am doing with each.

The "Measuring" section is wrong and comes out entirely. A wakeup does not
send an IPI to every CPU with a runnable CFS task; it targets one CPU. The
rest of that section reasons from that false premise, so there is nothing
in it worth keeping. Your point that a freshly woken SCHED_OTHER task is
not required to run immediately, and that timer slack and preemption or
interrupt disabled regions add their own jitter, was the useful content
and I did not have it.

The rationale is also wrong. I wrote that lazy exists to cut IPI traffic;
the point is run-to-completion, so that in-kernel work finishes before the
switch and no lock is held across it. I will use your wording for the
model table, including the part about real-time tasks not being delayed.

The tick promotion and the idle-task case are implementation details and
go, and so does the debugfs section, for the reason you gave.

That leaves the four models, runtime selection, the note that this applies
to kernel code only, and /sys/kernel/debug/sched/preempt as another way to
see and change the model.

Both patches are held. If what is left is too thin to be worth a file,
say so and I will drop the series rather than post a trimmed version of
something you did not think should exist.

Quchaosheng

