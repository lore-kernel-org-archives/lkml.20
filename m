Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757283;
	b=hg3Mgju/mYVgefiRmQV0VV4JEnKCodR6HBALAbyZRBuMnkko/KhlegJgvwB3lJeFblef
	 l115WrReweXy/lSEhysWWJ75NOulJYTd33e5J5yX4QgFTdUWWvSjqkbFHUAfqPlafGM0/
	 VYfuVKW7fF0WZ8YCO3jLE2tDOxCjAnM6cqqgddVCALyOobVY1jIXSQXebBCfzFn/Py0Ef
	 Mh546W/hGoRGppIfX+qYNE5eV+mrkRBkh1vlLdfQBzVn4vvi9JPmdVFW9zaiuQMFvXbd/
	 +ktNK/FaJ1fnik0GnOo2R5ir74zq7Yf6aKhL7xsks4k7K4UuyFd7Nu5VejzQC2E+hPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RdXJI0x7HsNY2cGNP3WXBwk0wIy56kzCps1jgvgyMwQ=;
	b=KiRfUkh6agaQQYoN5QHOifpgzdWwWChQAcdkHAjlV6YQ/O0BXs5NsAVBUQU24iN5Oz7d
	 HQUVx+uYCcOwFogpDrkILXt+YBn1F1U9mAnQgg31G7gNZL/0kLLhDuCjYcZfxNmq/OCr2
	 J30DFCo4Eknitj0aNogGCOvx2HL06GKDPu/+sTRZqZuOfZB1e4jSWyMRn4pdKzXR4ylw4
	 KvgmnuOZlf6LWfxuFC92qgHyBIfeeeLT+/uc0WZK50S4uKReeyE2wYkSoUILGoRyrZ1Vk
	 OyCqnbxH44MS1KzbSf1b0QqUBQXEFnFIqQ0TvkLtAnmPZklYovtR8BlqJy2qF3yF4lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fq9jNBy7;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741C6606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 741C6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fq9jNBy7
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so3521665e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792757282; x=1793362082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdXJI0x7HsNY2cGNP3WXBwk0wIy56kzCps1jgvgyMwQ=;
        b=fq9jNBy7VQCVOPP1Lmy75+Xjjtus69mYqfyB2DOr4z0dQhPOWCJhqx3VGXG5EcWKRd
         BUlUuCRfr85TT5U9pG9X54OQB+XXAQ8eutJxzi8H4MY5r8NG5KR4Oj+iUFIMNQB2Vk8T
         lM8MXSEd80Hsh+XbhJkwteVw4cLT5U/N9iKA/KOVbTVIhic4jvpJqR5ue6bU9bGsJVtH
         XdC91w/IQGECN+ush3zJFzgS9j8Vq2BUuyXQ7NWIt0sGQHHA7CHyzu1WPwCK5ibQqiBw
         TDAvgEqKa696/FwUfBGgSW86i1Xc+10d08dwrxjbL3gOeGuC91dE/wGDqVjbMcUlsXLI
         dOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757282; x=1793362082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdXJI0x7HsNY2cGNP3WXBwk0wIy56kzCps1jgvgyMwQ=;
        b=CHqpkpqY2dvPAnQCUHjTeFCofDsuC2P7Dcs4RO1RFKkWiM0DDvn9hGocNTN6D/naxC
         t0Sbo2rT/94q6iqtORcBcM55VQsRRI+Wck0awGSl2xm/42WeR0dhhEyARykSP96AHiVe
         +Q5LtFDWsN4Ax9a5S4bDK4/5GYaafpY/5N5lKLHXhSj0zZsJckQpqXb8WCLAnndmRkAu
         etw/OzLkGyRmhRSPvhsa7wh9iL1hYPMAUQjDYAhv/xy+nRIhKiBsQdsu/9RkqNw2raWc
         V4OVwoZsFpoZSAxzfGkROZX+QWUOYKLxLZHJz1C04Fe5DK2QKNSaCZ5nrmoieVE1w4JR
         INvw==
X-Forwarded-Encrypted: i=1; AKwUvBwxUAKvAFlYX+CWUqdE9/b6XQvC4VKemSm0Tl7GewVFvXAsyHsxBTr43D0iwwHV+asnt5nx3xUr3L10vOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwLQd5s8Gsq8DAZ6GRJeflk8H4bz/4GzCqMNJMNHugcAZRUsDW
	D0qFlVA6/eU+9nWecMr05zOYrsXcHDhtd6+SJWmH5nazN8VcGzspzJM0
X-Gm-Gg: AYBFou3cd0SI+1gqfA3J0vksD6iCxQSXtbC4C0+YuGOC248HZIty+r4/5Yip0yBClfT
	hKuT93n7srjJq9RjeKHsyw//mkMqnH2KgXlNa5Sc9xquKiR5FzuyO4Pi9ekC05P2OXuqIhJxktx
	C0ZEgVra1D+B1GTnS/aIiKvpfVWQAhb8JFCQBvCH5s9vWlelhEk1P6nFBXZl69zG/WUM3rtyBas
	C5EOORRhew4i4FOMBvD5RVvSBQbPp8bbqgt920U9o4pv+M9r1ORB5kV0yMd0d6VQHNpL22iGJxz
	p866m+c+SsBWPw7v3oXftTxNzZmNhSoqdMZdttN+P7JEiBKqAHJZrEiT2EVWVYV8LaY6n5n/ib+
	e5jaYywWsbaNOAu/oYtFeWWqGU6nQnWwIMJNxC1ZLuO0CS3ptQMJNbVko4M0d6dswMQ6m2CkO7m
	R3Esawt59/r+8VMYDkXw6uw6/dfenK1J0DSsRRRmeJ1Hatu5bRG62kQer4Xlu35pmKCm+ELWJCy
	G+b0X60dEwN27lOPiVStjxI6BEcAYC4eZPPjdNwAg/7ajuD8YqGTQYX9o+rzabpoiKrnW1FvH0E
	MUeVblRuKji8DrC6DfHGcNw9
X-Received: by 2002:a05:600c:64c7:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a211bf21f9mr31104145e9.4.1792757281607;
        Fri, 23 Oct 2026 05:08:01 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.51.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a29cdc74b7sm686225e9.14.2026.10.23.05.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:08:00 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC -rcu/dev] hazptrtorture: Release all deferred hazard pointers before stopping
Date: Fri, 23 Oct 2026 14:07:54 +0200
Message-ID: <20261023120755.2463384-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <579683e2-ee2a-46e8-8bf3-f7ecc5547581@paulmck-laptop>
References: <20261019162005.12888-1-parri.andrea@gmail.com> <3e7abe29-df1f-4cb6-884f-dd0a70c5311f@paulmck-laptop> <20261021090652.20333-1-parri.andrea@gmail.com> <45a6159e-1bcd-45d4-af25-baddf729ac54@paulmck-laptop> <20261022125556.3559773-1-parri.andrea@gmail.com> <579683e2-ee2a-46e8-8bf3-f7ecc5547581@paulmck-laptop>
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

On Thu, Oct 22, 2026 at 03:55:44PM -0700, Paul E. McKenney wrote:
> On Thu, Oct 22, 2026 at 02:55:55PM +0200, Andrea Parri wrote:

[...]

> Then let's please keep the torture_must_stop() check.  Yes, there is
> still a window between the return from torture_must_stop() and the
> call to torture_hrtimeout_ms(), but maybe that is something to take
> care of later on.

Will do.

[...]

> Yes, agreed, almost:
>
> o	Keep the hazptr_torture_do_pending() do-while loop as it
> 	is, but add the for_each_possible_cpu() after loop exit.
>
> o	Stop the readers first, stop hazptr_torture_do_pending()
> 	to flush out anything left from the readers, then stop
> 	the writer.
>
> However, for the "almost", note that the "while (!torture_must_stop())"
> needs to become "while (!kthread_should_stop())".  If this change is
> not made, then hazptr_torture_do_pending() will exit its do-while loop
> as soon as hazptr_torture_cleanup() calls torture_cleanup_begin().
> This will of course defeat the reordering.
>
> Does that work, or am I still missing something?

do_pending does leave the loop then, but the final pass goes after
torture_kthread_stopping(), not right after the loop:

	} while (!torture_must_stop());
	torture_kthread_stopping("hazptr_torture_do_pending");
	/* The readers have stopped, so nothing new can be deferred. */
	for_each_possible_cpu(cpu)
		hazptr_torture_do_one_pending(cpu, &rand);
	return 0;

torture_kthread_stopping() sleeps HZ/20 at a time until
kthread_should_stop(), so the pass runs only once
hazptr_torture_cleanup() stops do_pending, after the readers.

With "while (!kthread_should_stop())" and the torture_must_stop()
check before the sleep, do_pending would instead spin without sleeping
from torture_cleanup_begin() until it is stopped.

> Alternatively, you could keep the current do-while condition and place
> a loop around your post-do-while code like this:
>
> 	while (!kthread_should_stop())
> 		for_each_possible_cpu(cpu)
> 			hazptr_torture_do_one_pending(cpu, &rand);
>
> But changing the do-while condition looks cleaner to me.

That loop would spin too.

> This code will also need adjustment when something like a call_hazptr()
> is added, presumably along with a hazptr_barrier(), but we can worry
> about that when it happens.

Agreed.

I have been running this version locally, with the rest of v1: a
30-minute PREEMPT run, and a 30-minute NOPREEMPT run with
torture_type=hazptr, pass.  With kthread_do_pending_ms=10000, the
shutdown still takes less than 150ms.  If it works for you, v1 will
have it.

Thanks,
  Andrea
