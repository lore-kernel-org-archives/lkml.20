Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414697;
	b=tYE3j7QQ0g1OIrp4AXaTaCaKgPCZ3Y2vuVFJEuT0ENzYmWZh1bwHbL/GVD1Iw83KH25/
	 snt7HgqU9rrG0RT6GkmsklUKlouNpWfold0fq70PTW/8CfzMjdh5B/StFFm7dM9kt8H7d
	 fsM1Zkzeg8tmWkwzwmmFuEhioJU21L0uM+DMXmreYxTGg8jKAE2KCRptannF3DHndK+4o
	 JzMoJcP2kiNsx5ZhV7374axh0BguIUwFCq8Ud0KO2kl35/gANl72OtSr6gqqGTS1VwI7J
	 WJmPcjWRsrxFDZL7BfF1a6wZ4X8/nDxfC2s8w2+ieObCYarhmg/b3w1tkM+nDA/kDWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414697;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=APZI7CiU6LomQhDhdPfDm5AIR0g7StSMHorYfLj9NFI=;
	b=YVdF7mYRIU3JOAzi8Ejc4YinXliMUnMNqWCwEDTpzryTAGs/EPdeK0bMiGh4vcJBJ3/b
	 lRFXEP68N5HvRZ+pR8hITSsCJI8LOqmgGg4/5E3+seTRqSdYisc1azwCiQDwoR+8YM5uh
	 KUtBv2Q+qK4rBNYeqAj0BZx9powrRMZkKqWTx7hH4wSdH24U437A/hqmUMg1dNGfRQFH+
	 DUlMI6I6H6d+wKvbxhLZpAaErMWVa8ay1KsXSlgjT6Xhm04IAKl/ECSlHDQUN0dgjoXAf
	 A1IQEUJsA+I0c19BaN5FnGi57tA39njqEp87JHi36KGdk0ZlaAYeduVu19Nm2Wo/Xug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MjJKuKR8;
	arc=none smtp.remote-ip=91.218.175.168
Received: from mta0.migadu.com (out-168.mta0.migadu.com [91.218.175.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70AA606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D70AA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MjJKuKR8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=APZI7CiU6LomQhDhdPfDm5AIR0g7StSMHorYfLj9NFI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794414694; v=1; x=1795019494;
 b=MjJKuKR8AA2qE80ni2BQOis510+8i8823B8WV9JsRvMixHdGn+FU+Nkn0s878izMiEfRkSaB
 K+JLhrE5VEgZ7VhzDEiOF9kYl/FWNi+XJe/R8hkHvJMMl3SUj+cPrLJjjXlPv73K4UwI7DJsdLy
 6+loOYentyuGsWIocRNq6Ogs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4647fe6a3e7ecebd;
	Wed, 11 Nov 2026 16:31:33 +0000
X-Mizu-Trace-ID: 4647fe6a3e7ecebd
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 16:31:31 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: radu.m.toader@gmail.com
CC: anna-maria@linutronix.de, arighi@nvidia.com, bigeasy@linutronix.de,
 boqun@kernel.org, bpf@vger.kernel.org, brads@mainlining.org, brho@google.com,
 bsegall@google.com, changwoo@igalia.com, dietmar.eggemann@arm.com,
 enlin.mu@linux.dev, frederic@kernel.org, haoluo@google.com,
 joelagnelf@nvidia.com, joshdon@google.com, juri.lelli@redhat.com,
 kmehltretter@gmail.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org,
 mgorman@suse.de, mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org,
 sched-ext@lists.linux.dev, tglx@kernel.org, tglx@linutronix.de,
 tj@kernel.org, vincent.guittot@linaro.org, void@manifault.com,
 vschneid@redhat.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3=5D_softirq=3A_Treat_an_interru?=
 =?US-ASCII?Q?pted_idle_task_as_idle_in_tick=5Firq=5Fexit=28=29?=
Message-ID: <19FFF394-CD37-43DF-BCEE-594179867434@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Wow, the changelog is huge! Could you please shorten things down?

Other than that

Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>

--- Thanks!
