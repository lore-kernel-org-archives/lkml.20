Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879268;
	b=iXbzYwmn24nFrFau1MhdXtNJaCJuUn8susUNiPXGkYOsTFk0mrbt9ucHUZLMvjXt/wC3
	 ii1joc95zY0sllhG/YKvQpjxlaVrJBtu4STP0JtT/GF8sRbHZyT79X6W78GQ3Qwkz0kg2
	 wOky8l2s4DtlQrn5Rxy97/JyMhsWP+Cy66AoBXgLmgTHkOM6n1dLRbnCduKziuhg0fdsE
	 2GuFYP0yTwoZwi5VTdlqGIhqgR8HCzZXIiEIWzhjHsWGLGk4ChJytzim5Npi5A9M5JxdT
	 yKGQldrBs50cPV9yENpuFtCvMBniWpo5s6r/Som/J+eqnVYbvqmXk+oduFXey4tcP7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879268;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6NFvMXt49n0aMhQ+tPrYzjCU429v93v4p/pcosygBN4=;
	b=s82O7R31op/OvteO8qyA7gefOxS5P9wia+ekroM6jxkYYFlhGCBuF8VyPlMBJhyeYHED
	 2lSJZgwKdFNAk4R5pg65dN4ctSQuPpKqwAcY2YDTMeNTWisQ5KyDik9gJv2avJnQbmQ05
	 0HdAe2itPEyF7jHU4FgpdmslKZiX+aLnauGQ7V0eNnHTY3/oxTCVxlDv4RMH4MalLAsKr
	 Jnh47qrQVxo9ooMT9xb59XU/k1+WcBdewoawPOEDSNa4LG6kTCIPE4OFnJsQ/Zf76IBfm
	 paDi/P9pBPNaLiBxSkPPiR/gxbeJVgIg7I+xqq11615gHXol3E6x24V/w99zxKb8/iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TXyO5odc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB9B606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TXyO5odc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3CC1F000C5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794879267;
	bh=6NFvMXt49n0aMhQ+tPrYzjCU429v93v4p/pcosygBN4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TXyO5odcsAp87+zayuxVviAd5mVihReFEhyekjHo/UnS0k0+VPdXzGwVjFDNLN6Bn
	 RYzRcIVIS5WhSh6hOqI1qO2BkY4cGsMpYm3/tQXY+wgtxDW/wAAXeuwV2q+UHg3Dsm
	 20RUhPHB/6HK6gLQys1EbpJfGQfrJx8snGqz4ZqRKMLUAboBZqQpDE54/1RWytJ9hY
	 BvWnqm+BffC8Wnnl+NZ590ly+bia+USZKVL1G6kP48uHNG2UOxxXJufuDp+AJxOkuJ
	 9usGjjazXJR4mz0y81QovlVKWhjZLxkXYFBNYlP50Ts/QdX2lCfa0OfkTFZidtGGMp
	 H6HT8lMBi4g3Q==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so126991a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:34:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHAZeUj+v+nVh1c+KhBUAwRV/gOjBiRN9+D3thN6llYym7OaeLnfzlB9uXRMRZb8nDjG8USMjGfUOZU82s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9f2t6ocfWnDtOxeuyVYWufUiw3FsnVGdQSM20oAPnagqKUxNhs
	y0lr3vWwrpyGIZWNwkBTu1RWfPAolzpD/GuGw6BFf1nOru16RgARcW8+f2jy07RLBk5hR0qMppG
	B8vgCQtCMo6abZqc8kToS0AD70DfG3ec=
X-Received: by 2002:a17:906:c14d:b0:c50:5cd7:2901 with SMTP id
 a640c23a62f3a-c509640bfa8mr990170866b.23.1794879266573; Mon, 16 Nov 2026
 17:34:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116074849.475815-1-stefan.chulski@broadcom.com>
 <CAKYAXd9KT=1vLYsnRKxmiM6pLJQNACXuodD8wNQzb8S5apiuRQ@mail.gmail.com> <CA+Fu+LPL7xqpV_vjjjehedOFtuuBqgZHZTSqJ+FgweUpYo2uBw@mail.gmail.com>
In-Reply-To: <CA+Fu+LPL7xqpV_vjjjehedOFtuuBqgZHZTSqJ+FgweUpYo2uBw@mail.gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 17 Nov 2026 10:34:13 +0900
X-Gmail-Original-Message-ID: <CAKYAXd--x9UajLQwzRUwxRZ7PFW5T02xyHdSAnThAo326p_kxw@mail.gmail.com>
X-Gm-Features: AclHuK-kfPqc8Bh37Jzng9-4IO0zn_61dopqd1mYNeZxWXG2ijut7JfpzpvArRM
Message-ID: <CAKYAXd--x9UajLQwzRUwxRZ7PFW5T02xyHdSAnThAo326p_kxw@mail.gmail.com>
Subject: Re: [PATCH RFC v1] ksmbd: add use_unbound_wq module parameter for the
 ksmbd-io workqueue
To: Stefan Chulski <stefan.chulski@broadcom.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ilya Lifshits <ilya.lifshits@broadcom.com>, Huiwen He <hehuiwen@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 9:52=E2=80=AFPM Stefan Chulski
<stefan.chulski@broadcom.com> wrote:
>
> On Mon, Nov 16, 2026 at 2:10=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.or=
g> wrote:
> >
> > On Mon, Nov 16, 2026 at 4:49=E2=80=AFPM Stefan Chulski
> > <stefan.chulski@broadcom.com> wrote:
> > >
> > > The "ksmbd-io" workqueue has always been per-CPU. Commit 69635d7f4b34
> > > ("fs: WQ_PERCPU added to alloc_workqueue users") only made that
> > > default explicit as part of the treewide transition to unbound-by-def=
ault;
> > > it was not a ksmbd-specific decision.
> > >
> > > Per-CPU work keeps request processing on the CPU that queued it, whic=
h
> > > is good for cache locality, but it also runs work on CPUs that were
> > > isolated from workqueue noise (isolcpus=3D, nohz_full=3D) and prevent=
s the
> > > scheduler from placing blocked or long-running workers elsewhere.
> > > Which behaviour is better depends on the workload and platform.
> > >
> > > Add a boolean use_unbound_wq module parameter. It defaults to false, =
so
> > > behaviour is unchanged unless it is set; when true, "ksmbd-io" is
> > > allocated with WQ_UNBOUND instead of WQ_PERCPU. The "ksmbd-break"
> > > workqueue is already WQ_UNBOUND and is not affected.
> > >
> > > Document the parameter in ksmbd.rst.
> > >
> > > Signed-off-by: Stefan Chulski <stefan.chulski@broadcom.com>
> > Hi Stefan,
> >
> > Do you have numbers comparing the per-CPU and unbound queues,
>
> Yes, on our systems we observed up to an 18% performance improvement
> when using the unbound workqueue.
>
> The primary reason for this improvement is that with the default
> per-CPU workqueue, ksmbd-io work can sometimes start on a CPU that is
> already heavily loaded. Because it is bound to that specific CPU, the
> scheduler cannot move it to a less loaded or idle CPU, leading to
> bottlenecks. By using WQ_UNBOUND, the scheduler is free to migrate the
> work to less loaded CPUs, which significantly improves our CPU cycle
> efficiency.
>
> > How does this compare with the earlier following RFC ?
> >
> > https://lore.kernel.org/linux-cifs/20261022092514.2590010-1-huiwen.he@l=
inux.dev/
> >
> > Thanks.
>
> While both address the underlying scheduling limitations of per-CPU
> workqueues for ksmbd, my patch introduces the `use_unbound_wq` module
> parameter rather than changing the behavior unconditionally. Because
> the optimal behavior (cache locality vs. load balancing) heavily
> depends on the specific workload and platform, this approach keeps the
> existing per-CPU behavior as the default while allowing platforms to
> easily opt-in to the unbound workqueue when it yields better
> performance.
Could you provide the benchmark setup and actual results? If
WQ_UNBOUND generally performs better across representative workloads,
We could make it the default and provide a module parameter to opt
into WQ_PERCPU instead.

Thanks!
>
> Thanks,
> Stefan
