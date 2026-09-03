Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1673C13F9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788415757; cv=none; b=tE6dibXktPBlvyXTvwzfCwNfczT+sr+jq6USBvaN6UDfFduumR236KezDIPH5OZHuYQiDHdsqgxsIimut6gNGa1OlFdpaUYjgodERBLC0fJDyuNhiI30zdCllilgbdF53AEO1hkOfeXQJhx85raWrkoy6AZEAUNzrmedibNgubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788415757; c=relaxed/simple;
	bh=AEWaUTj0ohz5L4VnhuhLAPtEaJn6KL0nD+IIbhwrDaQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y8p/DtqaiHrefVTiMpbmnAfGY/a+Z3KFzAS/RL4AqlbvM735krBovR5GAgakZ9FpKpRYqfT1eKMHVAOxynQOgjzgIze4RpjVmId0GlehaIsEHMZUauC/j1kCi/Z6MeoKRpPWvFjv7oT1KOZ8teZZwgn0n1S/zCB/TYJg44nNMNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gf5oeUxW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gf5oeUxW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8581F000E9;
	Thu,  3 Sep 2026 06:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788415755;
	bh=JlH3anHxxhiinmKQ3qyWPXzjtgV4WsEMc47qE17uzw8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Gf5oeUxWSppyOZKBRxEXSrKJO4CQdFbbwD1g1OgwbMG2xW7ai/SJTTIfbAjyHiiex
	 ZY6NTSj8iyu8x2IhhMr25Fa7wmrs+l4egyRCEU4jolCVr+zT18fZPWewVnE1U7IvdW
	 Tm3aOyN53S+B/WchiHY6RT48PcNM1QeJj7G34pNg3LE5c9nzqRyoTLxKQ19ys6LRLN
	 jXZPkYJ1lfzrrKt+N6o713R625HPQwdJSRVTDtihSuGA1/l/YCR0UHe/j4J/DP8Tt8
	 5og1Syv58Iaul7aJhtN3rSi9+OZra/CHO26+IINoJbmWYgNFgF0VYnrK1+zCxe+DWQ
	 45mhm4jwMx9Bg==
From: Thomas Gleixner <tglx@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Frederic Weisbecker
 <frederic@kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
 brauner@kernel.org, peterz@infradead.org, anna-maria@linutronix.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] signal: Prevent exec() race
In-Reply-To: <apf6XyStCiwJ7CSM@redhat.com>
References: <87mru7h09e.fsf@email.froward.int.ebiederm.org>
 <87tsofdvf2.ffs@fw13> <871pbfeaiv.ffs@fw13>
 <87zey3fep2.fsf@email.froward.int.ebiederm.org> <87pkyyd39l.ffs@fw13>
 <87h5kad0mx.ffs@fw13> <87bjaie2gc.fsf@email.froward.int.ebiederm.org>
 <87wlt5aybr.ffs@fw13> <87qzjcdh06.fsf@email.froward.int.ebiederm.org>
 <87ecfcbyt1.ffs@fw13> <apf6XyStCiwJ7CSM@redhat.com>
Date: Thu, 03 Sep 2026 08:09:07 +0200
Message-ID: <875x0mc1do.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 02 2026 at 12:28, Oleg Nesterov wrote:
>> @@ -1990,6 +2004,9 @@ void posixtimer_send_sigqueue(struct k_i
>>  	if (!likely(lock_task_sighand(t, &flags)))
>>  		return;
>>
>> +	if (unlikely(tmr->it_pid_type == PIDTYPE_PID && (t->flags & PF_EXITING)))
>> +		return;
>
> this lacks unlock_sighand().

Bah.
