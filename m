Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CEA3F927B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977148; cv=none; b=cSf/lWw29pLmmLtbwL61yowBvi1DXj8Typ3vUkgsF/8BR/s0sAO05HIQsGOazpEwX/J7im1Lm7gdU6Ppukparyt9TPT24WGbxGUCbR38CMykczzu9hF+POld3O6u8d7kQl5J75NUAH7tZp1HH8fDj4NykXLZmWQOzgdyBjLAulY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977148; c=relaxed/simple;
	bh=5vd8q+ytIU6xQ6GKIb6K1ydTQBfPBNpTd3XztTCXMUU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EoZEFZIhK56sg/IHsmmwXHhifEhPMkc4wHxwDarMErxEJyG2Qon+OlhEhVrLimxkLRZ5fQonpmT9cj90Rmj8N1C3bI2NC5IEnp+rAHHHx2T91I1+RVNOsbpOWD1IjpFa99qeKv2JjQUfnysUAmwoATgVphsycFcVS7Z/asvUGLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i3Um32Cf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZaRU+eV2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i3Um32Cf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZaRU+eV2"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789977139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5vd8q+ytIU6xQ6GKIb6K1ydTQBfPBNpTd3XztTCXMUU=;
	b=i3Um32CfJ4kCdFvl21sHrxUYmoyuf3ek45E0oKA3PHQHVhisTHoECyeYg+S4Pz1+IhjTfw
	aLGQg9aqHtH/1yZAKMNWdzFjJzujLkk9oKYGCGOdwgr9of6rXPRaFeNWfBXM//ge41eEFD
	NXxrNYbhRHAvWmJU5GAjDgig1KFN6HPhGthx6l2iOoi+Z6kKFa5fHyTqDF4UUzxqZs7Oqr
	Jq8WqjCm7MPHZ/npUM2p1I616p2bcDEYfRZkLvC1AgIQIr6W2M4qOp1GkXi3mUvtsmqsaC
	yIHNQA1j9EFkLWIaeIofENXGW8LJR/JXA057cOmzDrIskIupIqJI6DGmxcAm2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789977139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5vd8q+ytIU6xQ6GKIb6K1ydTQBfPBNpTd3XztTCXMUU=;
	b=ZaRU+eV2MDgKp9It8mttx2g5I3QUALSMkMvJGDPu77rxo6+QDqGgVVulCdPE0v9MXDSqxs
	DjymCMSqHQlRE2Dw==
To: =?utf-8?B?5p6X5r+s5ZOy?= <m18667909625@163.com>, Petr Mladek
 <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org,
 m18667909625@163.com
Subject: Re: [PATCH] printk: fold consecutive duplicate messages
In-Reply-To: <20260921050304.73440-1-m18667909625@163.com>
References: <20260921050304.73440-1-m18667909625@163.com>
Date: Mon, 21 Sep 2026 09:58:18 +0206
Message-ID: <875wzzoxcd.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 2026-09-21, =E6=9E=97=E6=BF=AC=E5=93=B2 <m18667909625@163.com> wrote:
> A kernel bug can flood the console with thousands of copies of the
> same message, drowning out everything else. Fold consecutive
> duplicates into a single "last message repeated N times" summary,
> flushed when 10 repeats accumulate or a 1s window elapses.

Do you have an example of the _same_ message flooding the console? This
does not sound like a real-world case.

> Known limitation: dedup_lock is not NMI safe; a message from NMI
> context while another CPU holds the lock will spin.

printk _is_ NMI safe _and_ lockless. It needs to stay that way.

John Ogness
