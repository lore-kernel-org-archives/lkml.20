Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198271;
	b=U7zMA8ZdCyjoVq4zI9BDOozvps6gGGJzQTkQZNYTjMK+L0DGsrNR2FbWp9KvmYWn0cFW
	 iarpE8JyOyTb/3E/ubo/hqewe4jmVqDs/KnH7ukOVKHZKBMFXLz9XOYpr/7QxJ7NUWNic
	 Um00bS/vpJp3cAsMaQPHEYpx0vrqgnHOjptUmk/pERiSRdFYDTCee6qY+qAMxuXjujWg/
	 upfXxlNfkHYrrHxsVbE7ERqU408f3Ft4YOY46mUaOSRG2To4Zzv7hriUPN2sqgFPwxLu5
	 RpYPqqMx31qD+cH5JIcI27bmchITKpL4HlcZ2c8FD/fMES3g7hU80nCsm3negOsigAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198271;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=jBh0Z3eG8czEfWA/x3AlhkMcKX6/aBn69UtforplSNM=;
	b=3cf0xt8LUrDfF99Zys0Q8VRdHzGZCAX01J3aVmIzXTtN1eCrQGe/UmQm1pCTgS7tPfyr
	 ToTSx6QP6la2hwQ0CgfRmC+l2m4BAML5w4/pZ90hFxMRI/XNmQDIeCAnSfK8fELiQ2E4T
	 jUYYdQKUvp5SGo7qF0gwQ62tfnGQBa9Jwwj6fAXKkrj/qvyI8UWyvKGYdcvBFCZT9aug+
	 Url/sEpJBhDkxWEmEutu4NlNdk78CxklTjLg+djGH4opW//5ODVVpjHgVpA2LhaYsyGXU
	 tL/87ZgNV/Br7WZRBbv8cr1vzdeL3Go1krjFG/mEQ0tBwUMk7lJsxv/HciMeaIh0U5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wvYpzppf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5B1bArYf;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9F2606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB9F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wvYpzppf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5B1bArYf
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793198263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jBh0Z3eG8czEfWA/x3AlhkMcKX6/aBn69UtforplSNM=;
	b=wvYpzppfu2pjUcbK+h9L5O4a2oLH+WOJrgKh1DxnyhKsHMiW9wSHlJTMfjQjWz2khWICvs
	6fkDkhz30GaRnAXTO4BvW0ALRV4aUNacpo8oqtRSGHHbsMgE9DS/1g4VdVdYhVE5gOB8mg
	YZRqQlHrQsIhw7wodLwX5CaKye7ggeao6iyfM6qYeMhTxLZMfcfGfSHmwzh9gJYcxR+6Ay
	Gt000x/F4789akHax7lrIDHFGdnZEJzFvbZBIIFF3y2e0VRG+cV6m0l380EMImrz3FiauU
	prKgfoS+abeFdqkgz9O8yh9l53yMJoFDhEPrcWETluHNPkOIQIPeDM3E3b0pSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793198263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jBh0Z3eG8czEfWA/x3AlhkMcKX6/aBn69UtforplSNM=;
	b=5B1bArYf/y0L39Zx5HlKPIpGYO2COdfCdtdsawq2msXt0uWMEnYtEsOFoBxT2Q0BepK/x1
	NNOGXGXOMN7UdUDg==
To: Breno Leitao <leitao@debian.org>
Cc: Petr Mladek <pmladek@suse.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Rio
 <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
In-Reply-To: <auHNz09oyGFJPTKg@gmail.com>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz> <87bj8kkfwk.fsf@jogness.linutronix.de>
 <auHNz09oyGFJPTKg@gmail.com>
Date: Wed, 28 Oct 2026 15:43:42 +0106
Message-ID: <8733tphow9.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-28, Breno Leitao <leitao@debian.org> wrote:
>> *** WARNING: Now we get into my brainstorming, which could be rough. ***
>> 
>> Rather than a big hammer option, I see this more as a per-console
>> configuration (similar to how we want to go with the console loglevels).
>> 
>> Netconsole is a bit tricky, because it has its own format separate from
>> console. This would need to be addressed for the per-console loglevels
>> as well. Maybe it should be extended to something like:
>> 
>> netconsole=[+][r][src-port]@[src-ip]/[<dev>],[tgt-port]@<tgt-ip>/[tgt-macaddr][,options]
>> 
>> Which would allow things like:
>> 
>> netconsole=@/,@10.10.0.2/,loglevel:3,unsafe_panic:1
>
> This cannot be per target, given that netconsole has multiple targets
> (as remote hosts/IPs), but a single registered console.

Well, actually there are two. I can setup a target using extended=0 and
another using extended=1 and then I see both "netconsole hubs": netcon0
and netcon_ext0.

> As of right now, all targets share the same remote, and would have the
> same unsafe_panic priority.

s/all targets/all targets of the same mode/

As you mentioned in the replay thread [0], maybe we should consider
registering a console for each target. I would expect that may even
simplify the "netconsole hub" dance that the netconsole code is
currently doing.

This change should not require any changes to existing netconsole
usage. AFAICT the differences would only be visible in
/proc/consoles. The advantage would be that each target could be
additionally individually configured using the generic
/sys/class/consoles interface for general features like:

loglevel, sync, replay, unsafe_panic

I am not suggesting removing the /sys/kernel/config/netconsole
interface. That works well for setting up the netconsoles. (Although
"extended" should then also migrate (or symlink) to the generic
per-console interface.) The /sys/class/consoles interface is
supplemental for the general console features (and maybe both could
provide symlinks to the other).

>> This would also allow to specify that consoles should _not_
>> perform unsafe flushing:
>> 
>> console=ttyS0,115200,unsafe_panic:0
>> 
>> And it could be used for ordering, flusing from highest value to lowest:
>> 
>> netconsole=@/,@10.10.0.2/,unsafe_panic:2 console=ttyS0,115200,unsafe_panic:12
>> 
>> (First ttyS0 is unsafe-flushed, then the netconsole is unsafe-flushed.)
>> 
>> For consoles with CON_NBCON_ATOMIC_UNSAFE, the default would be
>> unsafe_panic:0. Otherwise the default would be unsafe_panic:1.
>
> How do you plan to use 'unsafe_panic' order exactly?

Currently at the end of panic() an unsafe flush occurs by simply
iterating through the list of consoles. That list ordering does have a
fixed algorithm behind it, but it is quite hard to follow.

By explicitly providing an unsafe ordering, the user could specify the
order of the consoles where the backlog is flushed unsafely. That
ordering may be based on probable reliability (maybe the chances of an
unsafe netconsole flush hanging are less than the chances of an unsafe
serial console flush hanging) or priority (if I only get 1 flush, then I
want it with the netconsole, so try it first).

And the feature could also be used to disable unsafe flushing so that a
particular console _never_ unsafe flushes (maybe the unsafe flushing
with a particular console driver is guaranteed fireworks, so it should
be avoided).

John

[0] https://lore.kernel.org/lkml/auDETo3ot3enCEv_@gmail.com/
