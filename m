Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295670;
	b=sdcawdrlAfOs+4KIkl9YRNy3BOC/Tdmmq/hFJtEI1y/xMzHi5HHmTKh1kfiRzPNHdeow
	 qhKyio3E/Fc3o3SiU3d0jCPiTVY0W7LhWiwe2a0Igv0qmbh58k838UsngLboPg5uKh2+5
	 L6tl4/xG4GkyPH1C0fVa/4hPOE8PWAtek/Rep2L1zt+JU6tFcxBP0njgfeAeRXFg+qc30
	 8oDKmBiol5jk2dR9eSXDWe7R0PLHUwHCAKhmt4VTn472WVqWAbwFOMkOV5wtIPYeAuaZW
	 mY5XNdZwETtqxXf9uXuWludRHVuiSwygU1AdvW/vcS1fKtx9n786MJKaMyh8wOEe+QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295670;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=w4MDwkoXI1zATkJgHvVo1zXWArUgOESYKVJ2mYTk7qI=;
	b=jb1dnRmB1N4VRfcoxu3lNoDCWp30brYocLlHqJEwBUV1DFmAv9antlmw3ZcrnEXCTDJK
	 /xmrVUbXGPlK1lJ9SmbmcxwiCDCr2Rmy9A1kyopZpqUaZXAX6K3cqTOdfQrDxaCAW5ETr
	 G14By94f2HKyI5aIKxzOecL3lqOKL/fZy7b4Tqb+cVUa6kzcSLebwhfOE31XJ+9AeOpMt
	 i0tDRnqsh/C77NAxsQl9eqt9THJhHXu/QgNHpAf3ywwV3Q671nwo8jbH7xS8NF4B+rRJw
	 iLvngJNUsZ7Dv7aLIZ3RtteVWf0clNE4DRtmfN1XtXpQCXVzAs4pxWwdkkNtIXQED4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A4KQ/1qL";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD78606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4KQ/1qL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7701F01816
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793295669;
	bh=w4MDwkoXI1zATkJgHvVo1zXWArUgOESYKVJ2mYTk7qI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=A4KQ/1qL7mHlTs+aFc0e345VDHgTW/F2b8hoyvsBnB9B0xv8Wdjyt0sDuDGxxfmrQ
	 iHz/N6MwvneetlwuyEmsaU7gBxiV+xr4iJWavIv0QLZ8Ux+adpp7YQu5NNjcoXOt+H
	 ePND6EnvGAc3bgYj8GXWGK95G8rpiEp7M+Kcv/Z6zRC2xsRd5M/Sy4ijTwMEcsBeZZ
	 J9TqASsM8NQNxIMdqrJLJoKDa64AagErSpnBITiUuVxMYLWzAYqAmXptg7zxsS9u6r
	 Sr6phKZRLYRtwvJKmn/dX6Eo1LEg1MODNP9jbVFPK7a9TkrIeNzA1JDd9X1WwpSx2v
	 oJeZQXy6aD7cA==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f2f2edb19so217547685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:41:09 -0700 (PDT)
X-Gm-Message-State: AFq9FYK3NtxSodciZUqDfhKcxGNVhIehj4bv7kfGwNYM0Sz24Ng9m8MO
	mgi28RsTmzaiyjfEp2EB6M4yN2YOyjfXV1F54TWNEGExJh3elCAVOZEmdbXBEMPIz6Kvg3LJI3j
	1jeF+dGLNWMewycTEMN7W7jClwxCsNis=
X-Received: by 2002:a05:620a:1729:b0:93c:2726:77ec with SMTP id
 af79cd13be357-94408930698mr938682285a.5.1793295669104; Thu, 29 Oct 2026
 10:41:09 -0700 (PDT)
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
 <20261028210844.105c431f@fedora>
In-Reply-To: <20261028210844.105c431f@fedora>
From: Song Liu <song@kernel.org>
Date: Thu, 29 Oct 2026 10:40:57 -0700
X-Gmail-Original-Message-ID: <CAPhsuW54Tco1Y_khWHeomq_ZTxvDoHFuX77w9cqojuXCrhGKWg@mail.gmail.com>
X-Gm-Features: AclHuK9fjwvJ3Xp1aqzF-DTK4K8-TXgRFJbKPS9ckUc2Nj-YxqUVgClutpWoo-0
Message-ID: <CAPhsuW54Tco1Y_khWHeomq_ZTxvDoHFuX77w9cqojuXCrhGKWg@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] tracepoint: Mark __do_trace_##name() notrace
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Wed, Oct 28, 2026 at 6:08=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Wed, 28 Oct 2026 15:20:37 -0700
> Song Liu <song@kernel.org> wrote:
>
> > Do you plan to apply this set to the trace tree (after the merge window=
,
> > I guess)? If not, how should we proceed?
>
> I can take it if we get all the necessary acks, or it can go through
> the BPF tree. Either way is fine with me.

> If you prefer me to take it (as I do have a lot of ftrace specific
> tests), I'll do it. But I'd like acks from maintainers of all the code
> this touches.

I think this should go through the ftrace tree. It has very little to do wi=
th
BPF. We discovered the need for this change when building live patches.

Regarding ACKs, it is a bit tricky. For the code we touched in this set,
there is actually no behavior change at all. OTOH, the real change
happens to "inline"s that we didn't touch in this set. If such a function
was left out-of-line by the compiler, it was not traceable before, but is
traceable after this set. How should we approach this? Maybe we can
just ask ACKs from the maintainers of all the code touched here.

Thanks,
Song
