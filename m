Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793894269;
	b=YrCrxjnKGfBd+q+ypAiGHOMgEQtu4Ub5kqidnt0tRkqWs+lt6XDohMs8Us+zJQJYGqwZ
	 QMOdrL4YnkoSLjL/rC8FpKMPFMw17FhXddhCJr7si+AgKyw1ItZDEXSFzUfK8mdqw5ojR
	 2fqabH6H5mItRkMtOx77nGXTXxY7utIgm7pLuH0rXQHJfuTvn7Ar8/Rh+ztdqdO0hRusJ
	 IVms4rxTta7mFpIcXO5LkhkrM+R8J7dWdW1S9GKlqM4FiJCvH42WyEXZVikAxbILIMmMn
	 EHsr+Ohxgicf7KTLDKAoVY7U6VGNjvMashMlWNazJMfKdXYJbdOOtBhB8IoA0DR+XLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+QzyelSArYy7hz0DLVg2HvT3P2ld88WZrMke4YQyrAA=;
	b=RaOFudXJJEKnWZ6h7+3BrUSNqtIHgjx+3pO25d7GhaE0bdYCOPqo3roLM5HkXhIibRFo
	 /DETeiPvgclYTN8eGksFXnX5k6L6EbwtaaV6vhiLqLeCdALADN3I7PRlkhV6BSlg2e8Gn
	 1LJsqfE/R/pbLbPFVYqWqFRF0NBcNSGsn4nsB3qBAYu2mLMEyTkTr1SLi27ozlZMNgiTn
	 VPUuCEZNVIufJroHNOFEKTaSGJeyUn/ZBsFpN5IP3mYuNLWOFcZwuhPg5UWWGQ+LX3L6q
	 SlsXb5VrU/RWn7rCP7/E6eOPkmKUOGuyCr1hkmXP5Z3jcOVzBZcj0aoKSA8dA7aBR/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7dSkidk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8D8606D837
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E8D8606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7dSkidk
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c450ab1483cso342020066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:57:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793894267; cv=none;
        d=google.com; s=arc-20260327;
        b=V2cbGmAmchd2ntC5xoaz8OzRoyajLVKAPveJ/FZE9UG3BatnJFr1IGb1aQ13pMtyMI
         nQ7GXSaWVBUx3gUFqGt2m51o1TxgK5tebUhct0n+3W/Teg7VdjMGiBTj+0jWLVWUfAcb
         i5viKefTq7I01T5Riyl+Yo63HnlNYm1FLukuxUTLT7SyMAZM5ef6MXS7FFrW4de7FKc3
         TOIKqQ/XqdSd5aX71Go+SVXFSqutIFG4RHJzfsts+KbBy0YNS3H/Eg0Vwao+AH97czY8
         Y1O/Jffd/VzkLCxIA26x/qMTbVmP17PtFQYYKmx60fXLn2Xm9Dby8v3aLxY1ZXZtHBpT
         6dsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+QzyelSArYy7hz0DLVg2HvT3P2ld88WZrMke4YQyrAA=;
        fh=dCFR3iTybGKh3KwlAOM8DoJaRRs2IjOF96tbi7tTkvM=;
        b=VC5JgjKAgTwDizNSNRORd7T1Iinf7OKN2I2KWYPqB9MIzBIEspC2vqoRvOv+ZCb52W
         QKrsq38kw4myVjPhFIbUVtjSHTqccVLCQov3WUmpTOqLzK1m7u4IEvqJGv3K1bcuczk/
         yI6U857MYRBMwd5kypkUGOZaS8rVqkCSeQMC5hducuHuzocvM1hl5e5g6s+tPFxk7qw2
         Zx3WvIQHUrHr1IFawBS5yFwhLI8vHBx4pZr31ZW3zoYfIT/fe0zsS9+bL75Io2jEdIPm
         zd3+/xsykMJqzUAw0z0JuwraftqraXzjzMWgY3rSFV86t5v4uixPcDru9pQVThr4Iiet
         oYGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793894267; x=1794499067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+QzyelSArYy7hz0DLVg2HvT3P2ld88WZrMke4YQyrAA=;
        b=X7dSkidkFL66xaTqpxQSaiYiX+ka1neIyQ2xzDPUsCe00qoG8dNfvQFvW95Rno1fCu
         7U2holMfYt8WbIDfP43B3SIHwIamQbQD8tW2QJm2fDkca0ZfxOALt3u4qAil82tadsj8
         u/TRjSkWXtfDZX7yeKsCss9kVTge/QE+/9ei73snguAcoHhA/bx9PcPUs+5T6xcRCzPk
         fCwPGbAGdqqmW4INuhN19Q2edkfXGD70Yq8gLeBav+yy4gA0cbOqWCJTPWq7+6cH7XmG
         TtC4Gr+H06LY2dsyaNWNe8bAuFAK3xJQ23Phjh7LQUS5FoIzTpwmI4e652Hp51tAWoSI
         NcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894267; x=1794499067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+QzyelSArYy7hz0DLVg2HvT3P2ld88WZrMke4YQyrAA=;
        b=xSU6wAOaBDnbvkesmKI9OjaV8OqzvYSX+stfS9jVi5Say5E5SQX+l88uboOYWUjaSR
         Tl5DKUaMxY/UoPyBp4Qiol0xqwmuoZCeTXvi4romc376/4ZjgtqVHnQU5HmgmnGSErrr
         uzVL170MuyQ8NV6c7tKl2sJpRzaYwTWSg0dF7nU/5O1jgg0AV0TtHZzni5dko89qfSyT
         4cMZZ4bCpaDF4Nm8FqKNLJ94+PBWlVav0Px0ZDTB6DWoKoFEywm/pDn5lw6FSc8zdu4b
         qflyEYbzBQY4Ln2kVom9i/A0WL5KWoXjpZPxxrqY4/7wybRfgFhLAQsJgl7OeVYnQ1B1
         ZKtg==
X-Forwarded-Encrypted: i=1; AKwUvByI9jBdcK3GzeaVtjpg1Dx1SlzszdYu3/+vN6/lWYhOzWbbScel536g8gIsnG3eNcaYVUXsi3eNqa6le8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9E4JcUL0G8Lka9hIKKFEKyrQP5/0m3sp+cflW+WQf5ZoRhScaD
	QPC85q5H/AbhKf1gw9ZPSmtsnwPlKHcBbY/eTWJ7obLOCmtxWJ+fSmxZRJbcwFRHOUyZuEBlV7b
	A08/3q7HU5Uc9vcdwJigwv5b5d8tVLo4=
X-Gm-Gg: AYBFou21wzd/n/PPvW6B73VCM6AWnEJUcSyzItGWP8ZbQiMcecxkbabLcKptUmZmMwA
	p0UOw0mSiQwzOlTLoVVffOvnRQMLXj1u8+GRDF5b9065RmLJDjaZVl1kKJtjL0a5CeEHGFV/dQd
	FtdBht9/jtgodwkk+0TKfjF0ghomdwtsNMwI30YADF1sw2Rgt5kD46eH0NUlMXFGGt+VUGSzL0g
	GuKQcXV11seXTnu8DiJ2Tc5xlQrfD116my9UM0JcL5UU8WWe0F/oqBuXxt/HLJMHLq14ssuso+f
	0xwcioW0hujsgMhvZFlpQKu3ubpI62ByV1ukg7TjPrHhOjYdUiMfNQnOvZaHzVSIOyRlfrYMbF+
	77tkEK6DLIEFXbmcD7qEbbXv71l1pHqURk+wdd325kmVmlfmwpBg5IrhrCa/PKT35UUW6/Mxp19
	J7si5AdDdtjcqFUKHMmOqmGCIlhNg8
X-Received: by 2002:a17:906:9f92:b0:c41:5970:2360 with SMTP id
 a640c23a62f3a-c4ca7ad1d1fmr1680110966b.41.1793894266551; Thu, 05 Nov 2026
 07:57:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202611041404.befe64cd-lkp@intel.com> <20261105-trommeln-einspannen-radius-ccb4e174e407@brauner>
 <auygOHcuBba_o132@gmail.com>
In-Reply-To: <auygOHcuBba_o132@gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 5 Nov 2026 16:57:33 +0100
X-Gm-Features: AclHuK8uwevQcSqxti_mw-yTSusmg_LuBdQex7a7cWEVSFUXj3Ulzz1Lj0cR5z8
Message-ID: <CAGudoHFpNbxL13ZOWiyyLSPpmzXcB=e=RBZ8ZGk+Oc58Aad9pA@mail.gmail.com>
Subject: Re: [linus:master] [fs/pipe] f7f4665dc5: lmbench3.PIPE.bandwidth.MB/sec
 18.5% regression
To: Breno Leitao <leitao@debian.org>
Cc: Christian Brauner <brauner@kernel.org>, kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:28=E2=80=AFPM Breno Leitao <leitao@debian.org> wro=
te:
>
> On Thu, Nov 05, 2026 at 04:04:58PM +0100, Christian Brauner wrote:
> > On Thu, Nov 05, 2026 at 08:38:45AM +0800, kernel test robot wrote:
> > > kernel test robot noticed a 18.5% regression of lmbench3.PIPE.bandwid=
th.MB/sec on:
> > >
> > > commit: f7f4665dc520fd8bbc1db20e59945773e03744a0 ("fs/pipe: unify the=
 page pools into a single per-pipe pool") https://git.kernel.org/cgit/linux=
/kernel/git/torvalds/linux.git master
>
>
> > @Breno can you reproduce this?
> > It's something we should at least investigate.
>
> Ack, I will check it , but not today unfortunately.
>
> I will come back to it tomorrow, and until end of week I will report my
> findings.

I figured it out.

The test at hand has multiple readers and writers using the same pipe,
with 64KB i/os.

Prior to the patch each writer had its own private pool to draw from,
guaranteeing no allocation will happen under the mutex.

With the patch the reader exit also drains the pool.

As a result tons of allocation ends up happening under the lock again:

-   94.88%    94.88%  bw_pipe          [kernel.kallsyms]     [k]
__alloc_frozen_pages_noprof
     94.88% __internal_syscall_cancel
        entry_SYSCALL_64_after_hwframe
        do_syscall_64
        ksys_write
        vfs_write
      - anon_pipe_write
         - 47.46% alloc_pages_noprof
              alloc_pages_mpol
              __alloc_frozen_pages_noprof
         - 47.42% anon_pipe_prefill_and_lock
              alloc_pages_noprof
              alloc_pages_mpol
              __alloc_frozen_pages_noprof

I don't think multiple high-volume writers vs multiple high
volume-readers is a realistic scenario and I would not bother fixing
it.

However, should someone want to address it, I think the patch should
be reverted and the resulting state tweaked. The patch at hand came
with some win for throughput in one reader vs one writer scenario,
which I'm pretty sure stems from postponing page deallocation until
after the mutex is released -- the kernel prior to any of this would
still put_page on the reader side under the lock. This bit would have
to get tweaked to recover the loss in that scenario (not to be
confused with the loss reported here).

tl;dr i think this is a EIRRELEVANT kind of a report
