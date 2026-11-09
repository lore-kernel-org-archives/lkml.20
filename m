Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794232176;
	b=qadr6xoZA3WeCE+ERwlzefR0h7Wv663ENpfaKnyJMtJZ12h5hQnSxA7BOhQmynkJdC4Z
	 YrkLnQofJ4sG+ikcn+1Zbx0ZlSuzqhIYHD6fWm3CT4sNp00CoLao/4G1ID+qVZmhk2p6x
	 7hksjqUCdDEdvRMblyHyvvw7GmVMhMT1MJ6u4wNsEwLjYT4WdqcP5JNSX7dJUkSqOPZEc
	 r73iz//0hqquuZ14IrO6eQ4TRcJg1a9yrtonbZr4W+C7xIOyPT7g4T7pogEyRBt73G0E2
	 EM/adVz7Cq51Eh2W5UvYQjEfweCr1Xmj02tlNullT2m+0dImqvFGGO+iKbothi0/iOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FyAr9qqHmbSkkVwj13RsrpvkaRMjPb3WgaMEGtmY00I=;
	b=D0c/lGv37vxI6JNnAuoQ4g2uoOsxo8DW2Okf7s9Rzc/kdvYOLfjaDl4Yj0Jy7ZBCXvc+
	 cYqWCQ2001t2EvGWTeBZt7tJLnXo8fCUJEs3YYm8cwBkaZpIe7lR7dKATaikeGv9l1n40
	 LifqhUlA2+Is19YhYJ1keqoBk6zWd/ss3kpLMp+m7Mp/sUAOYJpvdwiDkch889/53bn1n
	 wDwLH7v3PbMqR1YA/SemRXaYaqRvlfC1S1ugHVKxHUAPvyrNPA49Yl9VjlCZmm47mBByn
	 +ipFSYqEfgjxOWeBFcSpRWWn/xOUwk2Bij0I8+ryJn5aASZJqDaSdmDZy8L/t6CELDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WgJJzWlB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45827606D806
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45827606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WgJJzWlB
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-7143451981fso562168eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:49:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794232174; cv=none;
        d=google.com; s=arc-20260327;
        b=dGCk2GvxzwRib+V8Kr/O+D3f04NwZDewOE8BD4Us+doYNIB30ton9c2d6dgzzeOWJ8
         Zfwub4gBd/MzCKhgOKA3k8vzKYmo7LzIFsfMu1cqXMqJwxxAoQ9XeHgQcls7mxQlxG03
         IOBpO8O67iHynPflwmljf1WJt43KdUNUhwqRUCWUjerzUlG7nWXzaBNIC9BFzF9U/jO4
         5LmpBDCukBp+8q97ws8t8yGYjziYd86hWY7Gn3jM/xAIOlrq0vnk0BWG9UiIZTXG11cd
         dqdTYey+k+S1wAHwac6B6V++aQOHNCBhnwQ3SrNquZvZY4DkswCxcW5gQ6N22Z1nXBM8
         BpbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FyAr9qqHmbSkkVwj13RsrpvkaRMjPb3WgaMEGtmY00I=;
        fh=RKzO2RMO7ndZ0XixjqfG6EPyjSg3dEyXIzU8Uqtddhc=;
        b=B2DO+31pnMtaoQk2qnfwbKhs++2gT83wV27IHuJcjES6AOGdXxMCCg4SC50jv2d3ei
         CEOfcRgybS3bYekYWSuOttAMegUvTQJb6nLOSOspovCln8D6psFbbhQAx+AmdWR3QQ1m
         7MJ0BIaZZPFolXbbPr5nbYOjSF/WY03vY5nIBESGQwUPtaYrgVyLtJdcAjCT8kiBRt7L
         Lh/3tKNs8mq/mYoD8dUUAfq6w86NdjQx5pCtzf5QyLREZazCPp4hVtPEXtc1Dz+NZLXM
         p0kKeU16AA8IZmI3gTDbYfIg/DQ4f3vjB3yFui120MUOvGgzAPDKPPyVEZXfUtejmOfj
         h1uA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794232174; x=1794836974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FyAr9qqHmbSkkVwj13RsrpvkaRMjPb3WgaMEGtmY00I=;
        b=WgJJzWlBGW0QGA1sGDaR4dReBHws6qZzcznwiC3J28Cf2fm2aUCfd4N3xGGwVvjhEk
         gRujHUIfPFeSym2H8iuVlX1pKOMv9epJIu5RXqKnveicuiv0sF+D34dHLoSiP5QlKEy0
         0v+mmmaz0/2DUanYcOWBiTGpigVfehFyyaLMy9KaABZligFsbSomPUpcOPSFA1vSJ5Jr
         EpCnls496FfhuszBv7Lc/oljV9jOpFY2PgOrBmj0xSDcGTCCWy19nSHEQ1rJx1dH1Ued
         fW88Fd/AgjxNJUNHA64Z6z3Cbr0g3uaRpJj76BeNMyT++eXXfCql1898Bf5GEMH90Dyu
         PXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232174; x=1794836974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FyAr9qqHmbSkkVwj13RsrpvkaRMjPb3WgaMEGtmY00I=;
        b=0AdZSuNO8UKNB9KjB/WPCbWiauxAPZXjdX85Ag90U7Nlwul6tZYzjzpIHZDOCm7NS9
         5WbwZsvHhdKzdbX7z3jnBFqG8pULJvRapQONEwJVqXUd4zy1kMcZxX5r/Rqgrxf4siVL
         Febvj8HRfRSergtN5EcJ17WVr6R9PF0hY28SKg8NdAFgxzUZ1YCA5/jjYremNrykROvk
         8j/+eWI5ZtvyUCaaD588/dgbHERHw32OuweKgnzvX6i5pxGvZwSvlolWn54vBVfk+owA
         1LYdLy9T0TO3NCXkafMPIxqfSMnhiFptKqRi/5UOI9Ik28YaZfjorCMvmgz2C9Rh2eWE
         QKFg==
X-Forwarded-Encrypted: i=1; AL+hErHbqHQmFHWJA5egx7lFd0dkddRFTs/Zdo5/tKYOooOom/2H8FGFPlLkGi5Y9GO1w1mmA01foOHvrA+hxow=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7HTmYz6TRI321M0AeHVcNTMbUTliaatjlfUjq/TF+4h6scZPy
	Sl8E7+zNO84Mu05JDUcwbY+sBeXU2DPRhpAEnCctRiBvsGzf5SqGqce2+Zo61yK1cA6aZDlVEL4
	t7uOeuBQOkoO/4QqaYOgHJr3iiVHPRQk=
X-Gm-Gg: AYBFou2jKsyHmNsvp20fZ1TrbJbgRK2qZDeXjWeGis4nHf4YFj8byChFo92dleoUK13
	MyUjbYdXkjBQMKs5wuLGh6t2ryDJa+bGBDo5IthrpnWmUHX4HdZwdDn7oEq8K9oqiyjDnRGqNMD
	sfuXf6UuNQc9ypYgVr1IkcdXLlvJ5q4iVypWSRLL9C2gL/eCYt+jb1XQduO8t6h+QlhK5YN5nK7
	va3ZNuBa4Kk+EDPJdquFb96v/j0BQ3DmuU7YAHutCXF/bh6MT0bSIjFu1NZUSrUYyQhI4jGc/5W
	Wu+GKqrcymhFko55vTiwVos30tH18AryzMgGtX8FYCHkkJwwqu/HRAD9FpMmQslR9lA0NifM5Aa
	LBUr3z9m+vKS7dDqsf62yuc/0o3t1Aetxpe50gaXBTIRB6udoTriQI1WBjg==
X-Received: by 2002:a05:6820:55ca:20b0:716:d48a:ee93 with SMTP id
 006d021491bc7-7170f26a5c0mr1420360eaf.61.1794232173953; Mon, 09 Nov 2026
 05:49:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930150213.799245-1-anup.patel@oss.qualcomm.com>
 <20260930150213.799245-4-anup.patel@oss.qualcomm.com> <CABb+yY0gLY8VuY0pDKKm4EfS3wp3buLgF=waajaA7JD0UX-VwQ@mail.gmail.com>
 <CABBgwmsU9S2kf+RL53G8Tk4ar3=6f1zMTss_HmE42fxiwxVFpQ@mail.gmail.com>
In-Reply-To: <CABBgwmsU9S2kf+RL53G8Tk4ar3=6f1zMTss_HmE42fxiwxVFpQ@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Nov 2026 08:49:20 -0500
X-Gm-Features: AclHuK9ZpOtwMmKrK6lvy0K3xqP_D3JRQq0vMpVANN7aLErFYx3-QsCqINQknZs
Message-ID: <CABb+yY0SZuCQoLF65EGY0=R4=p7fO3SU53pPhT1cgAj26u8gNA@mail.gmail.com>
Subject: Re: [PATCH 3/4] mailbox: add direct synchronous send support
To: Anup Patel <anup.patel@oss.qualcomm.com>, Doug Anderson <dianders@chromium.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Rahul Pathak <rahul@summations.net>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 7:27=E2=80=AFAM Anup Patel <anup.patel@oss.qualcomm=
.com> wrote:
>
> Hi Jassi,
>
> On Mon, Oct 12, 2026 at 5:52=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.=
com> wrote:
> >
> > On Wed, Sep 30, 2026 at 10:06=E2=80=AFAM Anup Patel <anup.patel@oss.qua=
lcomm.com> wrote:
> > >
> > > From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> > >
> > > Some mailbox controllers can complete a transaction entirely within
> > > the calling context, without going through the queued TX state
> > > machine or a TX-done interrupt. Add a synchronous send path so their
> > > clients can request one and wait for the result directly.
> > >
> > > Controllers advertise support via the new send_data_sync() op and
> > > clients opt in by setting tx_sync when requesting the channel.
> > >
> > > Channels bound this way must not call mbox_chan_txdone() or
> > > mbox_client_txdone(), and mbox_send_message() and mbox_flush() now
> > > reject them, since only mbox_send_message_sync() is a valid
> > > transmit path. The client remains responsible for serializing calls
> > > to mbox_send_message_sync() against mbox_free_channel().
> > >
> > Seems like you want to use mbox_client.tx_block.
> >
>
> Apologies for the delayed response, the past month I was travelling
> followed by the Linux-7.4 merge window.
>
> We had tried mbox_client.tx_block method in the past and we had
> found it to be not suitable because the mbox_send_message() will
> use wait_for_completion_timeout() which crashes when called from
> an atomic (non-sleepable) context. Our existing mailbox clients (such
> as system msi, clock, etc) do mailbox transfers in an atomic context.
> Due to this reason, currently we set mbox_client.tx_block =3D false &
> mbox_client.knows_txdone =3D true in all our mailbox client drivers.
>
> Using mbox_client.tx_block =3D false & mbox_client.knows_txdone =3D true
> still does not avoid the spinlock serialization enforced by msg_submit()
> function which works fine but adds unnecessary overhead and prevents
> parallel message Tx from multiple CPUs to the same SBI MPXY mailbox
> channel.
>
> The SBI MXPY mailbox controller driver simply sends messages to
> higher privilege firmware upon Tx using SBI calls and when the call
> returns the response data is returned with it. Also, there is no Tx compl=
ete
> interrupt. The higher privilege firmware may forward this message to a
> microcontroller over RPMI queues OR it may context-switch and forward
> this message to a secured domain (e.g. OP-TEE) to process the message.
> The higher privilege firmware takes care of the serialization and also al=
lows
> parallel SBI MPXY calls from multiple CPUs.
>
> The MBOX_TXDONE_BY_RETURN and send_data_sync() callback
> allows us to avoid the Tx queuing and "chan->lock" for SBI MPXY mailbox
> channels since this is already taken care of by the higher privilege firm=
ware.
>
1) Your clocks can't really expect to be atomic  -
rpmi_clk_enable/disable are prepare/unprepare callbacks which can be
called from a sleepable context anyway.
2) System-MSI is a good candidate which makes me notice the shmem is
per-cpu so currently a wider-scoped channel lock is protecting it. If
you want lock-free access to the channel you need to guard shmem
access with local_irq_save/restore which is anyway what should have
been doing.

For the system-msi case I think the framework can be modified to
support it better. Instead of a prolonged back-forth I have drafted
[1] support for a new lockfree api and the semantics documentation,
because I also know how other platforms may benefit. Please either add
pieces from it, or even better own it, adapt it and test it before
submitting (even replace my s.o.b if the author wants). That will be
the least effort for all of us.

Regards,
Jassi
[1] https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git/l=
og/?h=3Djsb/rfc-synch-xfer
