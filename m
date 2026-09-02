Received: from mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB13A439916
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344138; cv=none; b=CyFUGkWHXXAe4AHq4Wl3m0/XbQLgoa7MQCWYkJGIw8kVWTa6GJFQJzp5G0oaDNcB5jd46cSZy/XWWUiO6rbFNR6QRo1blK0Z3hiV7mbyuk3Un+OKU7HCYEfQdMfAib8c+Z3XsaRXC2t/QFq3f0pTHLzPT1FT+nwD7+1gwosUjI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344138; c=relaxed/simple;
	bh=04L/X7xS4hxtsBnAxJ/MGousDzROfCvyRKvzwSCrUzE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mhZQXqhruf5mrO20nbhQ/tTk3jOh5f4sM0zp8sHqn7nGTN+B9glPsNzGJQ8T4dxY1M+U/qnjX171QXKEUjqj6YqJqwNRqthUdQTmyyDKaF22bjldmxx0OhAstJ9PjFZ7W9fhaQB5cRB/G2567xe4flPasPp9zXb9m4wfaHjnIPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=axr7OYgo; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="axr7OYgo"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=04L/X7xS4hxtsBnAxJ/MGousDzROfCvyRKvzwSCrUzE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788344133; v=1; x=1788948933;
 b=axr7OYgoniGjTEMPhDsn5K2Cq4SJlEL4FxrOLHGv5gPzkoj9OxdbMCrzaqUBkqbRATQkPwFx
 yKLKW5BZOJicBn7yVFKM3VIfUpG/2Jn7qx1tG+SQ804LX51qum9z1QjGZtJWIN+zfzNKwTb9V6m
 ZtMHhT+jFY+6Vot7J+VBja6w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cec16e1254e83e61;
	Wed, 02 Sep 2026 10:15:20 +0000
X-Mizu-Trace-ID: cec16e1254e83e61
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 10:15:19 +0000
Message-Id: <DL4R2YXF9J8G.203VBANYFFSET@linux.dev>
Cc: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "bpf"
 <bpf@vger.kernel.org>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "KP Singh"
 <kpsingh@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "John
 Fastabend" <john.fastabend@gmail.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, "Jose Fernandez" <jose.fernandez@linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: Keep progs alive until the trampoline image
 calling them is freed
From: "Florent Revest" <florent.revest@linux.dev>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.17.0
References: <20260819122252.1782790-1-florent.revest@linux.dev>
 <DL27QZ6SEZKT.1CV2HAX4A3WI4@gmail.com>
 <CAADnVQLxi-R1KDUXJJjpq69SpV8UcNJVqBi7uicO=V0WhAvyQA@mail.gmail.com>
 <DL2S878KSOI5.1SZMLIAWMCNUJ@gmail.com>
 <DL3FIBQNP6AU.1HO08FMI292UX@linux.dev>
 <CAADnVQLMm43qJxuiHUuuh51wAL4kH0+fRoaM7YfbZEXT7LHn0A@mail.gmail.com>
In-Reply-To: <CAADnVQLMm43qJxuiHUuuh51wAL4kH0+fRoaM7YfbZEXT7LHn0A@mail.gmail.com>

On Wed Sep 2, 2026 at 5:57 AM UTC, Alexei Starovoitov wrote:
> On Mon, Aug 31, 2026 at 1:58=E2=80=AFPM Florent Revest <florent.revest@li=
nux.dev> wrote:
> >
> > On Mon Aug 31, 2026 at 2:43 AM UTC, Kumar Kartikeya Dwivedi wrote:
> > > On Sun Aug 30, 2026 at 3:21 PM CEST, Alexei Starovoitov wrote:
> > > > On Sun, Aug 30, 2026 at 3:41=E2=80=AFAM Kumar Kartikeya Dwivedi
> > > > <memxor@gmail.com> wrote:
> > > >>
> > > >> Overall, looks good to me. Thanks for the fix!
> > > >>
> > > >> Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> > > >>
> > > >> Note for whoever applies this: please add Reported-by: tag for Sec=
hang as well.
> > > >> Optionally, wordsmith the commit log with the suggestion above.
> > > >
> > > > Hold on. I don't think we can proceed with this fix.
> > > > It defeats the point of fexit jmp patching and keeps progs
> > > > pinned until a sleepable kernel function that were attached to
> > > > will return. Which means that the tracing prog attached to "unlucky=
" kernel
> > > > function that sleeps for an hour will stay pinned for an hour.
> > > > Let's think of a different way of fixing the race.
> > >
> > > I don't have background on the original commit being fixed, but is th=
at really
> > > realistic? Or worrisome even if it happens in practice, since worst c=
ase the
> > > program refcounts remains raised for that duration?
> > >
> > > We have similar worst case for programs too (e.g. using bpf_copy_from=
_user on
> > > user controlled buffer in, say, LSM progs). At least here we won't be=
 extending
> > > any RCU flavored GP.
> > >
> > > That said I will think about alternative fixes in the meantime, if we=
 accept the
> > > premise that we don't want to pin program references in the image and=
 keep their
> > > lifetimes decoupled.
> >
> > How about having old trampolines skip freed programs instead of keeping
> > them alive ?
>
> Isn't it doing it now?
> That was the whole point of patching nop to jmp in a trampoline.

Just to be sure we're talking about the same thing, you're referring to the
"ip_after_call" patching done in bpf_tramp_image_put, right ?=20

My understanding is that this only helps in the case where a task is in the
traced function while a prog is detached. It'd make it skip all fexit progs=
.

But if a task is sleeping in a fexit.s prog for example, it is already past
ip_after_call, so this patching would not prevent it from calling a second,
freed, fexit prog lined up after it in the trampoline, no ? The same situat=
ion
should happen with a sleeping fentry.s prog followed by a fentry prog.

I have a reproducer for those scenarios that crashes bpf-next. I will make =
it a
selftest in v2 like Jiri suggested.
