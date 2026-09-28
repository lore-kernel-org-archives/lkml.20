Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7805C3932F7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597888; cv=pass; b=lm/jhfyTSPTB2aVqBABeZg4PtDmPUN0NyUJLjsJiUkF4685J0QCcBrWCUnOvYbVkhwnTvZH8zOrEl6yP77vJP/Rz2GOxiv6d6W829ftF6zFcM400JlPWPSNG3bixC7l/5onvWssPhNSfUHOc0UUgopqXG0P+UCQUtSdDkv4XoNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597888; c=relaxed/simple;
	bh=rYxzzzNY1AdcrXh0ozl1mR8qkdvj5gJ0d5Mjvk9s7Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMHY3w1czJLia1Qd7u9oS8cBh1QfFqkpBxAV9bDvWR5XbBrFyhmAQ7/2PZ3YlNvFSlOrZ512ZsafbUcKeidQpe1SNeaCXR/r88LSgrZlARV6blV6JLpUaRpCjQYXUXQkv4kPONLfqMeAWzDwj7g3WtjZktTIEADKJu4UljsLczQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWFaSmDt; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWFaSmDt"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-672f4b7091dso1475221d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597886; cv=none;
        d=google.com; s=arc-20260327;
        b=Ksmf2m1xLt/hbzOlfBDNeuH+3AKmyVJDUKNwv4iI1oYLzUzzJYZEcdPZv7pXaMXg2U
         x1ge0FW5k6CDaQl6BYhOzj1yqfhiYfIJtHt3G3iNKhSx9ywrTEw42lC2oF7IANCPnQ2g
         tdJ3mKjGin6NI1gllMxYrMaf+ZffOhR+u0Be0zkRI+rcPJ/0vKzJ77QsIiyPQ25zrNMi
         oafsBoFn7GKhtAwGGNIMCi6HTuFrJzDufOrKEDfifkRoLO8MCrLYxPxXUW17ntiqap5P
         0wZwODBdJTUjz26/yOrk9Y5iRBjdXllZ0fbeHfUtcVepXXWA0XveqK6LrpsZj9d0AB4Q
         R1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3eARHhkh9oYsXbPpbvCkfwu69vuTuYl2b/LL/+ePPlw=;
        fh=ur1oyDMGo2mG+SJ2rMeE/8OXTJFNDzTaoZHYEFfWU8I=;
        b=h+eInxn5ua/m+gm7DavXaEfDKCtIA9yftT7TANHzq7bpbwgAKFH/6KunkulQ9Bshmy
         Ms8et+8cctO0XsemPysgAiGxuevCu1dE55rmLXHbkrseUIGCsN/j878m4AI+D3V4v+o8
         1yTKElUGa7MWU6GIwALkv4iCRuvRnrdwbxlqpV0JWMgQbyjPGTfWslOLkJzX6CqY28CO
         XKoMVf5Cfr8Xw1p31kgb9eNg5QKPFZ/zLgLV+mZ+PRF75tEURxv/zp+lwJx9j2lFJTI1
         1YvZjIdnD9CISkHuxnS0WOwHmK5E9jWyJ/xuaeuvOIB8ho7QK2ZMgegs1ixtHhkTyXzy
         Ntsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790597886; x=1791202686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3eARHhkh9oYsXbPpbvCkfwu69vuTuYl2b/LL/+ePPlw=;
        b=eWFaSmDtXggX2AKjWrH+ThjoFOTE0Nfr35+yO7vDDasQwgE6Y4Vqn7MvPnkGJ30ngb
         BJMn3PHcdSBX8qCd+0qAcaRmzAgatWyIeDGKh0dQOZpNDGnl21I9kwAl8N9EmBBQEqLj
         bx9AXlNtFEiCG1cDUbKtBYLwUzIohXOfG6SxO9dMNOGTtgcfimWFp7Nn+umyefdwhkdO
         8DYwZmYY9nkyt+T/srEcQsI7bu2YXrJ8wLLTJppvuY0mS7+aI1kzNJL9QyIm1xlsdwRv
         vXePt2oK+lCyRAYQx+ccX7y01TgRWwPM2b4SjZ3Sjt+tJckUsKStsHus3fxQCjmlknlH
         Wm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597886; x=1791202686;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3eARHhkh9oYsXbPpbvCkfwu69vuTuYl2b/LL/+ePPlw=;
        b=N0PlsS26xzItykfo2smK6qJtDkC823JGCbr38Ker06+ZWw09oKPvbFwTR+2nRsbxlw
         oPsfR2T42oAXWLlED8elkAYas7Pi6JXIbRQ7IY8XPsAZK3q2JMHjzMJr42ZM1XL6fPGl
         /d2/diu5y0z6e5KYvoMMFKhjBjAoX9BykKA1kxG7UMYwhHE2nicuWaFB59wFyictvi4e
         chGmrXPSuoo6zh0WX3Rzkc+42NqJ+eMGGpH6vaDxVmuSixGAI2Os6M+BvEH3F+4Ddh9P
         g+fH8JYktgWAr+uy1Y0tBH3rT1vN+nmZz0miDMgDMLp2AmMaP1Q0JGBmMw2YlFMUHeIb
         Phdw==
X-Forwarded-Encrypted: i=1; AKwUvBw5/QSrEV32aK0ic+bCTzymg9v7PQ0BQ//yHetM2/D9KO/w6FMNCIrRP0bEEbw1dIkhP1QgALy2rLgIz/E=@vger.kernel.org
X-Gm-Message-State: AFuF++lwQYmgDTAmZjGhE2rkuzza9liUZdTZdXPYwaN1VQTToiXTk5/K
	kaWaQ2vyOGgb3p+x7nGlUJX7jcBaVQH3ijRFt5cvsQSXXW354RFpkqUYRkfhtWirIK2nDpWTNfD
	duvh7sAxm8yqqE7iUGS2WN05UoxHtWCk=
X-Gm-Gg: AYBFou1myjkSRpVqOpIRCltaaoeQOCPdjIMylT46zqyAisT+Iuzrr7lyQpE4EbGM2AS
	/tkXlkfbMlhRUxxgzpWuPAUzDt5RUmJ8znVKm8b6/TZkfky7K7XWkhuWa/8afxgYG7QBTk6e2be
	hGQZG+gyzPFLb6i4hmx3UpdMt9kH6/kBmv12/TYbsJBOm/a7aYXMCphfLhAaw+0Tfb8YQShrzjN
	ROdMGe94lSkVoAKXxY2Sw1zKpW/UZc4LAa2iBH/5vqtx3wGqitsRfHcwzew5BFb7Gv75izVQy0g
	Tn1eDBceqhzTrbCBZGDxEHNTSKchVqx2wLV0Wtkd+iiyaId5QsByZFgzXqdIgPkQxYsKky3eyId
	KvcHimg3zJ4SMNJUbhReHDoyMcVjKcqN0PFop+TWoxlQ=
X-Received: by 2002:a05:690e:1c1a:b0:675:449d:3d72 with SMTP id
 956f58d0204a3-675449d48eamr1275888d50.32.1790597886319; Mon, 28 Sep 2026
 05:18:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918054851.26083-1-kartikey406@gmail.com> <arey7Lyzlb2lq09P@extorris.mess.org>
In-Reply-To: <arey7Lyzlb2lq09P@extorris.mess.org>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Mon, 28 Sep 2026 17:47:54 +0530
X-Gm-Features: AclHuK8LDR3Ng5m5rYWshr-m-9JpiY_F01Ux4P8GgnE55sFSsBNXD1fPs72yo1g
Message-ID: <CADhLXY4j4hFhhf0Kd8xPKha0mnb-H9bNYjMrXjGBoSeH5Jt70g@mail.gmail.com>
Subject: Re: [PATCH] media: imon: fix use-after-free in display_close via dev_dbg
To: Sean Young <sean@mess.org>
Cc: mchehab@kernel.org, jarod@redhat.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 5:26=E2=80=AFPM Sean Young <sean@mess.org> wrote:
>
> On Fri, Sep 18, 2026 at 11:18:51AM +0530, Deepanshu Kartikey wrote:
> > ictx->dev is a raw pointer to the usb_interface's embedded device,
> > cached in imon_init_intf0() without taking a reference. On
> > disconnect, usb_disconnect() can drop the last reference on the
> > interface and free it while a userspace fd for /dev/lcd0 is still
> > open. When that fd is later closed, display_close() dereferences
> > the now-freed ictx->dev via dev_dbg(), causing a use-after-free.
> >
> > Fix by pinning the device with get_device() when ictx->dev is
> > assigned, and releasing it with put_device() when ictx is freed.
> >
> > Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
> > Reported-by: syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D9bfac891bdd42eb708fc
> > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > ---
> >  drivers/media/rc/imon.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> > index 049a73b5f882..9341dbe03b57 100644
> > --- a/drivers/media/rc/imon.c
> > +++ b/drivers/media/rc/imon.c
> > @@ -502,6 +502,7 @@ static void free_imon_context(struct imon_context *=
ictx)
> >       kfree_rcu(ictx, rcu);
> >
> >       dev_dbg(dev, "%s: iMON context freed\n", __func__);
>
> The dev is only referenced in dev_dbg() here.
>
> The debug statement is pretty pointless anyway so why don't we remove
> that instead.
>
>
> Sean

I misunderstood your last message.

The reported crash is in display_close(), and
ictx->dev is also passed to dev_dbg() in display_open() and lcd_write(),
which can run after disconnect. Removing only the dev_dbg() in
free_imon_context() would not fix the bug.


Do you want me to replace dev_dbg from all over the place ?

Thanks
