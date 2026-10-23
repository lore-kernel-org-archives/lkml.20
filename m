Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775398;
	b=cdsg4C9st+yVvlXdKrzlreGImX/qq/9vMSQ7laXr5Xgg+nOtvNhcFeLvtIeJLugh8IPx
	 WNJW5AB6yTX61uUgdMB3hO0TVPLFKDD0ZZE03QZfKt32K5sz9nnFx9jQla2ZQwrnNsL2s
	 ONx9XgHkXcAhr/X5inQopp4f42Na1lQNJbBdY8vE3LDmPxItUJRUWSa2feD3bYY1NSL5/
	 CZtveO2B9T5vcsQqu2d5t0kB+6k5gmz/Hl9lyAKK6w4Jf1JsuH+mjVVfjWNTGvp4xmZOP
	 QwyW+30HQpR1KOB4R1wUmRGuH9+4PAvK30JWlPQNmL2Qb+ZfT2AB3l4B6F2kzxC3Qrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775398;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Status:X-Rspamd-Server:
	 X-Stat-Signature:X-Rspamd-Queue-Id:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=8m4RKkMiiU8bh0E91081ZTnsfbzeWqjKyYPrm7qreTc=;
	b=QHfUqUfnpFpuhuSzHEf/YbmawHJyU7/M67fv9yEl4KRzJ+X0oufKKvN6vxG9M8nqYwBR
	 UGDX2ghtXEd37dkKVf+TegQHrdYRtA2qe9jFeOBDhWodM985pG4O+Y4EtfBIXPklBebtW
	 vrH92Q4dTbjAwSE5tlaoGZENEzfKSUmgOawembMnlDcTzcEWxljbc0w7TWyoecaSp0uY9
	 ze+44sXEnpcbX1G+xZ+tKvfWJLHWcUsgHYxR98DNjNgCe49sg0qER92DudeNbF/YVWKze
	 bpHFV6/9LrBB3eGnnKtfapd3tprUsbU9p+O7xLMNec8cZyja/CX5ZGWBJP2HzjNGofw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=zUOHQ6XH;
	arc=none smtp.remote-ip=216.40.44.16
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73775606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73775606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=zUOHQ6XH
Received: from omf14.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id A2E79C0180;
	Fri, 23 Oct 2026 17:09:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id 45F2E30;
	Fri, 23 Oct 2026 17:09:46 +0000 (UTC)
Date: Fri, 23 Oct 2026 13:09:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jerome Marchand <jmarchan@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Ritesh Harjani
 <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Madhavan
 Srinivasan <maddy@linux.vnet.ibm.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Use raw_local_irq_pmu_save/restore() in
 local_t functions
Message-ID: <20261023130943.775b2b65@gandalf.local.home>
In-Reply-To: <20261023155529.3895393-1-jmarchan@redhat.com>
References: <20261023155529.3895393-1-jmarchan@redhat.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Stat-Signature: dkd49bp7ie9q1ukpuri763w5nzcejt5a
X-Rspamd-Queue-Id: 45F2E30
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/0wX9pO02ZWtXsM9Kya2cXD7k+9fbyk8Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=8m4RKkMiiU8bh0E91081ZTnsfbzeWqjKyYPrm7qreTc=; b=zUOHQ6XHb8k5FmnnTjDdDC3cfTDXs9E6/Ow/oHOFpxNl40ZCyaAIvD9/OHZjWt99Kx13XgneXmdpyWmrYgdTjUHs7WZtaQkuCTpNi/RVnOwc4FsxqNcY8MsBG2NsCzVkzTY2n3KlyjMw9M4K0i+K5cqtZ6s1TbOyNfqfCuAA7NM=
X-HE-Tag: 1792775386-597871
X-HE-Meta: U2FsdGVkX1+KkNW6m+t9S1AvyAQdJ3NdBfSGduko+1ErfnQswKcHgIVurgl/PvL/JYZgmf8Laz9ai/H6APmL94CktNTyzCU4ziuSsE4AoJtKtJPT4o0JpbpQEStgwHWCrfyGHnarg8cpyisnWtMBAXRqYn3ZyHabCoTE6Rg836tC7TeBqxr0c01+lPEdvifHiZoAPB+Pf3gLBa6vsEP6ChfI3/V2TDMZj1k26tGTn+Eerebs0H1aZRWvGy5HjxkDOiFjHmSMkLPoRvR2PRFnJqRpxh0pnWcheDzpmwrgSyHxgD7W2N8g+GWJ+9hX8JzVYqfzayAVNDxQgBEYztu1Yex11WY9JnC1

On Fri, 23 Oct 2026 17:55:29 +0200
Jerome Marchand <jmarchan@redhat.com> wrote:

> On ppc64 with CONFIG_TRACE_IRQFLAGS enabled, the ring buffer code can
> enter in an infinite recursion loop.
> 
> The problem occurs because some PowerPC's local_t operations
> (local_inc/dec in particular) use powerpc_local_irq_pmu_save/restore()
> which call trace_hardirqs_on/off() to generate trace events. This
> creates a recursion loop:
> 
>   ring_buffer_unlock_commit()
>     rb_commit()
>       local_inc(&cpu_buffer->entries)
>         powerpc_local_irq_pmu_save()
>           trace_hardirqs_off()
>             trace event => ring_buffer_unlock_commit()
>               [INFINITE RECURSION]

Hmm, the ring buffer has recursion protection that should prevent this. My
question is, why didn't that work? Yes, I agree with the patch to not have
local_inc/dec() call anything that can be traced, but if this caused an
infinite recursion, there's a bug in the ring buffer code I want fixed too.

The ring buffer has a trace_recursive_lock() that will allow one level of
recursion and then prevents new commits from happening. The
trace_recursive_unlock() is called after the rb_commit(). Why did the
rb_commit() allow an infinite recursion?

-- Steve
