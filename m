Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28BD4F30E8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534118; cv=pass; b=p9/aIA9hxFhai2A6/JIYmuFHc+YVfZuvU5GPJ8gGbN4SOKW7r1n3KSvG/hxFS8wFNKpqVhQ2xUSGYMnmsMajay6lY24GsQ25g8NyT5luXayMuiOoNpaR9j5beJ/EX2XacVud2vk7N8lKQ+okeVON4a7osDArn8SCmHqPPQo9TY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534118; c=relaxed/simple;
	bh=qawKlECuj94epc81pQ0ynQTh+xHXUx6MRIkhuTgGTUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onVYupp18BVzOt1cGEc1fwW+Hi95ecfIpwT9hl86gc289A+pcTW1/fRjlgtgfJMk3yQzSVN5fiCupsCJRvu+TwhkLf94I+mbC0xExCK/JNx9DswtRZdan26LxQrmioSAUJEGfugdYT7wPb3H1ld1kn1IGe9MhVmFGIA4BaNvqf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=G5Lo9wi9; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="G5Lo9wi9"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4eb488690so57965a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:01:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788534113; cv=none;
        d=google.com; s=arc-20260327;
        b=daG9c80/dANIateg2oJtHwWtefUwGUZhJd/oaBTG65W+4qhSmidjlhkwDHNEyxozZg
         aBWo/cZc7wDBX5F8B6MFwME1dYcVvd1g+nbDglhUgzjDLs/LDh+bD/vm9DG4NLMRZq1S
         4ft0Y1EmAD6Lp9ckCAV4FKyHevzyPAlO/vqtqJ55Bi0eck6qJ9ADk1gFnpq5QS40uTqE
         H2AxHCU7IJo6lUyHrf5tqtihlYmeuf8sWF2WJZMoS2OfwvqtCjMnbm5+tHFF44uladrQ
         K1YiyIn7PbjVoM9b80s944oA4ooN9rRMssMmYULWyai08QZbrH9Z9wEbG1bJ6vwZ/MRr
         UI3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WIcM0Ila/fL0qXdyT+6C5ZW2M8LEsnOQ1TQjy3IHFIY=;
        fh=72UMYCsv+VrBRtzNoCpGRjFKuM6lDVUpaq+bXmoV2A8=;
        b=qX/fcitvvD9oCeClxUrlzsYiQDLrKjfbIg45mFd3gSCnd+vqheUQfjcfGl5IQrkjZL
         9DAvUdiiX9MIocALmItL8wbIl4eDoEhXxK6r5/lEz2JsX32ie983WvaLBXK3dc0WZhtR
         d5peYM429j+njOt9SVsUIud8nePJ2zokUxJZ2hnmW8t1pCTR7hrHDCMMNllT1C5XF8iv
         moZdBZbIgp2CHIuXf3623Tw4aijRw4zlDeWBo3ZwEWbbr9U8EK+KCFHZxRFH5tKKxvFS
         3axG2PHZ/9QYaBRb6CECGWXCJPgbgxnS/ZyFC0C+LW/pQnzS/5ccArh9b7ABVzbQiZd4
         x2GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788534113; x=1789138913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WIcM0Ila/fL0qXdyT+6C5ZW2M8LEsnOQ1TQjy3IHFIY=;
        b=G5Lo9wi9vIz2qelbfApClafU5gpiWJqYajcAx0knOHDbf9UPwEhKxDx+DzDnFS114K
         UsxKBxtA1LRPP6o+ImbJT5FUaOLDHmhhVqDGP8WJSpOGW0pmqTq2B8/M83EjSiqwZ3m5
         SmcOG2p5djz+PNRoLWRtxp5NmhDNrFzLqAsB2l0CLjG50qiVl3C4z6EIXPG7my4iurgM
         yiIjp/99KISO296CxZAb85hdu7SoamDRVi7BOTK07N+Xofr0mm1zxTBCW16XOGJl5gNu
         pZapNW+0iNZqRypO/CgCLyMS9P0SjbOShnsR47dHsflsFpmenrJvQ+VpByn6ksAO+YuZ
         tglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534113; x=1789138913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIcM0Ila/fL0qXdyT+6C5ZW2M8LEsnOQ1TQjy3IHFIY=;
        b=LlUiHxWu4oipsgSelYPe8wFTdWsYmO2SQvanWnDcXDn99wxAS4pODSVOvT1XAJ0vuS
         wCtvimoSurCO9dV1lY/z2cH9HxIQsD3IaGXupniaiT9joPDwkWPQP8OlAtdkE1Oqv0dT
         ph0j9tIUsiefAWMEtsQM7Ds4d0+DvWLVbzQJS/aHqEEIW5qxoHP84UbPNuQZuAZETFH6
         aOlt00r6XcJ5unqJ7mIqoB3UyyKNpZ4tOdWAq4kJkF3iDiuMVEYeG+NRGUp2UPolYyo/
         P05xF8sRnREs4CufiASC6OdrH5gMj7MPhgPBUJ+oFc4+N9axhdZCQxbVcZ1KjKSwN3QS
         kxog==
X-Forwarded-Encrypted: i=1; AKwUvByIm0JuP4FAGdvGovjBCMu2GUM4b9aF8agnGfMIsCEcNwklTSZ8ZKp5f/zkVQWXivZdQ04nMLMGsMwM7yI=@vger.kernel.org
X-Gm-Message-State: AFuF++l/pO2hWcntXIT1Ko3ZMaUIkyhL3yNvxYcJEdHcCd4hZrTIc4/N
	MbqPGg4l5Ay/Oy6OUyKE8TgL06Jy5gBbovWkVwr4zqSfVR6o0FMn8HM8NQk310/mHJzih6QNv1o
	fYiHqbgQnmyRD4/zj42t0LaM4yP1qRJ1VBcBgx30H5w==
X-Gm-Gg: AYBFou3oIDkKVY2/jLGeKarQxiV9AeJ8p1j5USuLlhugRI9wUwtGpsYQA8LigQwJEMp
	SYiMRa8UezG0+gDWBDHnDfLqFW8W6LhS+Ln1g0caUTQZuoC480Sv7rjFDonaq9Uwuzd3ZlKI7Gr
	s1aEa8UDE/6l+dVnzinocoF0M/u8vqmBGJa4eIVuToavSLxtIsMy5xqv+daTK9SxEIqv2r3dVhB
	sWBxzM5lfGi+cdRqqLDZTgybR3rTPhvrESiE1hiPoj5xN17PlxvWdHHUvAKXTB+j9WV3EwljDJf
	qBKabvNpAJTUODj2sibShxPQKcpxRCs/TW6RxlaHdlSD
X-Received: by 2002:a05:6830:668c:b0:7e6:6f9f:7445 with SMTP id
 46e09a7af769-7fa438c3fb7mr2967139a34.3.1788534113297; Fri, 04 Sep 2026
 08:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902225708.2379840-1-csander@purestorage.com>
 <20260902225708.2379840-2-csander@purestorage.com> <CAJnrk1Z=JgOGH3m8aMRcK0fBRtnHLQutHGc5aqht3OU3uMQ_qw@mail.gmail.com>
In-Reply-To: <CAJnrk1Z=JgOGH3m8aMRcK0fBRtnHLQutHGc5aqht3OU3uMQ_qw@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 4 Sep 2026 08:01:42 -0700
X-Gm-Features: AcwNN1Xah8sd8LB6WNip_SsEfqly8NYatZhdOo3fb9Luj2iVfa_QtBKTXyBpkbU
Message-ID: <CADUfDZp2K5_E=PZ6rcyOzRPmRWSboKvTADmNT_L4W5mqoguX_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 11:11=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Wed, Sep 2, 2026 at 3:57=E2=80=AFPM Caleb Sander Mateos
> <csander@purestorage.com> wrote:
> >
> > In preparation for setting the io_uring NVMe passthru CQE results from
> > the blk-mq request completion rather than the task work callback, split
> > out functions io_uring_cmd_set_res{,32}() from __io_uring_cmd_done().
> > io_uring_cmd_done{,32}() now call io_uring_cmd_set_res{,32}() and then
> > __io_uring_cmd_done(). This allows __io_uring_cmd_done() to be made
> > CQE-size-agnostic, with 3 fewer arguments.
> >
> > Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
>
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
>
> > ---
> >  include/linux/io_uring/cmd.h | 23 +++++++++++++++++------
> >  io_uring/uring_cmd.c         | 33 ++++++++++++++++++---------------
> >  2 files changed, 35 insertions(+), 21 deletions(-)
> >
> > diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.=
h
> > index 331dcbefe72f..67f2ef700c43 100644
> > --- a/include/linux/io_uring/cmd.h
> > +++ b/include/linux/io_uring/cmd.h
> > @@ -50,19 +50,21 @@ int io_uring_cmd_import_fixed_vec(struct io_uring_c=
md *ioucmd,
> >                                   const struct iovec __user *uvec,
> >                                   size_t uvec_segs,
> >                                   int ddir, struct iov_iter *iter,
> >                                   unsigned issue_flags);
> >
> > +void io_uring_cmd_set_res(struct io_uring_cmd *, s32 ret);
> > +void io_uring_cmd_set_res32(struct io_uring_cmd *, s32 ret, u64 res2);
>
> nit: it doesn't look like anywhere else in the header omits the param
> name for the cmd, so maybe worth also having it here (and below) for
> consistency?

IMO the name "cmd" or "ioucmd" doesn't add anything on top of the
argument type. But I can include it if people prefer it.

>
> > +
> >  /*
> >   * Completes the request, i.e. posts an io_uring CQE and deallocates @=
ioucmd
> >   * and the corresponding io_uring request.
> >   *
> >   * Note: the caller should never hard code @issue_flags and is only al=
lowed
> >   * to pass the mask provided by the core io_uring code.
> >   */
> > -void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 ret, u64 res2,
> > -                        unsigned issue_flags, bool is_cqe32);
> > +void __io_uring_cmd_done(struct io_uring_cmd *, unsigned issue_flags);
>
> Maybe worth adding a comment that any caller using this api needs to
> set the res themselves before calling this?

Sure, that's a good idea.

Thanks,
Caleb
