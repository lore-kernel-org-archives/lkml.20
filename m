Received: from mta0.migadu.com (out-77.mta0.migadu.com [91.218.175.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F2B38E106
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788209916; cv=none; b=ImKt+YiN4CgZNsk7nPNM6/nCHI9bBVt25T+SFr9inJoSbYnEOxLm6NxP6bwdRhI31ZSenPjMjNyxGLZECWFjFJeRQ8i/QKmCGBp8DeL9EESGFnUtbd25eU9bDHqUYHWFzdxgRJL1A3P1zD5OJMN0ovl3eVtOeM0KEkgweE6TETE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788209916; c=relaxed/simple;
	bh=P4ssAPIr93jDaP0gK8av1LC/knMPc/5tVkS1Bfhdqgg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=scMYeJJ4oQg2hxw7rZ9YxyL3qrnu7LfcvGR/I3lrFO/p+amSMwKKNG69iHhJxPPauQLkgxutO1XGmYeEWidbOCBio0NZUny065W/DqEnPP9P9/Vr78Mj7KUsnYTXrvlDCRnlHl4yjkSJDeXjRRpZJBdRqYyp2x/j38qJtU0a/68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gWqM+OAF; arc=none smtp.client-ip=91.218.175.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gWqM+OAF"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P4ssAPIr93jDaP0gK8av1LC/knMPc/5tVkS1Bfhdqgg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788209911; v=1; x=1788814711;
 b=gWqM+OAFy7RMCJOjzN3L6BqHgCsTEuntO5mMKlQnDRf19G/HGanQOpvgq4J/Al6MSyF/kGTR
 q6ORFrnE2GCNJkTIgyOrzD/EYGzZ5dgUXXlRbiRUaxMPH1mSoQKzCIx4adFrVg82b2MFaxOWXJq
 JUpnVYc6BitQFnZSsSg2vCv8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 704f2c154292a1ed;
	Mon, 31 Aug 2026 20:58:30 +0000
X-Mizu-Trace-ID: 704f2c154292a1ed
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 20:58:29 +0000
Message-Id: <DL3FIBQNP6AU.1HO08FMI292UX@linux.dev>
Cc: "bpf" <bpf@vger.kernel.org>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "KP Singh"
 <kpsingh@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "John
 Fastabend" <john.fastabend@gmail.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, "Jose Fernandez" <jose.fernandez@linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: Keep progs alive until the trampoline image
 calling them is freed
From: "Florent Revest" <florent.revest@linux.dev>
To: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Alexei Starovoitov"
 <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.17.0
References: <20260819122252.1782790-1-florent.revest@linux.dev>
 <DL27QZ6SEZKT.1CV2HAX4A3WI4@gmail.com>
 <CAADnVQLxi-R1KDUXJJjpq69SpV8UcNJVqBi7uicO=V0WhAvyQA@mail.gmail.com>
 <DL2S878KSOI5.1SZMLIAWMCNUJ@gmail.com>
In-Reply-To: <DL2S878KSOI5.1SZMLIAWMCNUJ@gmail.com>

On Mon Aug 31, 2026 at 2:43 AM UTC, Kumar Kartikeya Dwivedi wrote:
> On Sun Aug 30, 2026 at 3:21 PM CEST, Alexei Starovoitov wrote:
> > On Sun, Aug 30, 2026 at 3:41=E2=80=AFAM Kumar Kartikeya Dwivedi
> > <memxor@gmail.com> wrote:
> >>
> >> Overall, looks good to me. Thanks for the fix!
> >>
> >> Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> >>
> >> Note for whoever applies this: please add Reported-by: tag for Sechang=
 as well.
> >> Optionally, wordsmith the commit log with the suggestion above.
> >
> > Hold on. I don't think we can proceed with this fix.
> > It defeats the point of fexit jmp patching and keeps progs
> > pinned until a sleepable kernel function that were attached to
> > will return. Which means that the tracing prog attached to "unlucky" ke=
rnel
> > function that sleeps for an hour will stay pinned for an hour.
> > Let's think of a different way of fixing the race.
>
> I don't have background on the original commit being fixed, but is that r=
eally
> realistic? Or worrisome even if it happens in practice, since worst case =
the
> program refcounts remains raised for that duration?
>
> We have similar worst case for programs too (e.g. using bpf_copy_from_use=
r on
> user controlled buffer in, say, LSM progs). At least here we won't be ext=
ending
> any RCU flavored GP.
>
> That said I will think about alternative fixes in the meantime, if we acc=
ept the
> premise that we don't want to pin program references in the image and kee=
p their
> lifetimes decoupled.

How about having old trampolines skip freed programs instead of keeping
them alive ?

For example, bpf_tramp_image could hold one RCU managed prog pointer per
prog it calls and we could JIT trampolines that'd pass that slot to
__bpf_prog_enter*() instead of the prog itself.

The enter helpers could rcu_dereference() the prog under their
rcu_read_lock()/rcu_read_lock_trace() and return 0 when it is NULL.
Would that work ?
