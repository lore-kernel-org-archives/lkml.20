Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602021;
	b=uQARD6Dhr/nrtr1VTI/jlYYdVPuHn+O+c3AhU+qnFprLvMviqhENTFmQRT/FgtfX/YhG
	 yZKs6fd7mYJjC4rGGEI05nNBQxtnNjKoLavpXzv1vYzOpfYSvmvJ0UrS4pGkkZ7PNNCsp
	 e+q53gYzPL2jJI5OueI0GYlwXawE4cDu9pg1MBj7PkhBoQAdguF0FPKv5qbPK0C0iNV+6
	 NKEfYDv4AdCgrMDD2Hcn1FgcHGtlUONi0xDdYvvQA9N+O/XrS909uc7xK8ZXg/R6k18GL
	 x7ud4ksy3j72RuNAg3odaAnlSfnlG2LjnN92ODg/6DEgrHsPVzuaME7K7gemZ9VFjdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602021;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=0OsjdM0NG82VrsvgjNyYKiZJaDnLzyogGoOyzCq1L2g=;
	b=hvFAnSG3P5N6bQMmOox1sGJEdFefnbpD5OhSkwiEicTIHXBo8u3eoMjChLe9y+rG9cqz
	 1AwnDf5vCAL7Ro/yTSEhrdz11raZTbcJIVFu5db7JFHK1QPLXjDhSdf63+SaQVqhnMI2r
	 jpdsfXXazCj1wE8kMyIw90nV8+a5OEzLJ7mASry3Y6v+QADWXC0Iiw6KHvQcEPjnBVQoE
	 ORr0eHqrx6AzZgYLMzWjBWO3HG2DZYW2XwDTvuWc4uMxA90qAk6O12LGm7k4YDDfBiv+W
	 wjgrny2DmojJBnqfxBEOe5PUFaG99IXwpBylCc8s/ixlSlEbRmSsAO12sMTzTzU0ccg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BAai4WZl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0CA606A891
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BAai4WZl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACB31F000CB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602021;
	bh=0OsjdM0NG82VrsvgjNyYKiZJaDnLzyogGoOyzCq1L2g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BAai4WZlNWwzT9+2xAyLlroczosJHzv7Crz8ma/56YbZo06sPtNX7pW9RLd1VYwsr
	 fkKXQI4yllqPat3kLn1cUytuFkt7wgO0URiUw/G4Y0sAjMjNHrcoyaojoSsFiqNNl4
	 g5lVMcnX9IgFe3XlTPoH5sgZqvzvghkyP+uOrdnX90D77FbHMvxJA5ozZrhjK2dfvI
	 TODcpGiuJeDg2mp3uKuWkl60E06jcVTniQiIL1DMxm+lshRetxVIEXwl3J2MUB6cLx
	 W5vK/D2XwCCixwFrA2owonq/VRq6Vf8+FUtqT9tGEKYJRZ+ztQjzkkIb1PnzSUPiJF
	 RM9E//vFQsu5g==
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-94937a33cfbso203179985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:33:41 -0800 (PST)
X-Gm-Message-State: APuU4Z/6Mmc6xD/VmAytPjuJQb1paiK5IWumkhbOLWZbB2E4rhdrTh4z
	vkMScLp9FLXjJuUa+wufdCXuKLw45g+RE4U9SIXsHOLQV3QGPZn/cErMkZXlU+/qn/eYZkW2K+3
	A+iiyd7zytNWHjNYGhp1b/iH/jPAYHqo=
X-Received: by 2002:a05:620a:6f0c:b0:93a:1b82:4962 with SMTP id
 af79cd13be357-9494bc846d6mr601897885a.47.1794602020285; Fri, 13 Nov 2026
 12:33:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023011049.1164625-1-song@kernel.org> <20261023011049.1164625-8-song@kernel.org>
 <20261023093256.20d3e300@gandalf.local.home> <CAPhsuW78w86tV3gwRWQMOdWUK7Rcc8dSsp==XypKdB5BMP6QiQ@mail.gmail.com>
 <20261028210844.105c431f@fedora> <CAPhsuW54Tco1Y_khWHeomq_ZTxvDoHFuX77w9cqojuXCrhGKWg@mail.gmail.com>
 <20261029134721.66bb584c@gandalf.local.home>
In-Reply-To: <20261029134721.66bb584c@gandalf.local.home>
From: Song Liu <song@kernel.org>
Date: Fri, 13 Nov 2026 12:33:28 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5t2OqERqVm5LDCGDjae17LNpijqRgB3mbi8Mmv41P2RQ@mail.gmail.com>
X-Gm-Features: AclHuK_QviZ6vy2B9azKKn61eNt7bUleWDksUblkFaiXDohfL6g9U7WqxoxsBwQ
Message-ID: <CAPhsuW5t2OqERqVm5LDCGDjae17LNpijqRgB3mbi8Mmv41P2RQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] tracepoint: Mark __do_trace_##name() notrace
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Thu, Oct 29, 2026 at 10:47=E2=80=AFAM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
[...]
> >
> > I think this should go through the ftrace tree. It has very little to d=
o with
> > BPF. We discovered the need for this change when building live patches.
> >
> > Regarding ACKs, it is a bit tricky. For the code we touched in this set=
,
> > there is actually no behavior change at all. OTOH, the real change
> > happens to "inline"s that we didn't touch in this set. If such a functi=
on
> > was left out-of-line by the compiler, it was not traceable before, but =
is
> > traceable after this set. How should we approach this? Maybe we can
> > just ask ACKs from the maintainers of all the code touched here.
> >
>
> OK, I'll just add it to Linux next around -rc2 then.

I haven't seen this set in linux-next yet. I guess we would like to queue i=
t
up soon so it gets enough pre-upstream testing?

Thanks,
Song
