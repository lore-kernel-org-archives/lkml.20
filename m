Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD653CEB8D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 04:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788667728; cv=pass; b=MmJ8INum/6dev9GjrjHmBwRJGNCaWFUEodBfjq5YaBHzBACNdCTuGd7BcMv2vjYOR9tGKyy1q8TF0km5GttKQydO8ATEHS52A3S5/t16MRAL3bLZK+/SDZgqxEtKu5v841Xo33i/0l5LWyl7Cjd5igxcGEx12uIAP1ZOajPgSTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788667728; c=relaxed/simple;
	bh=eROzLL0q0ouiSUPHBo2yP9ODMUaFLLh+pXzP/8kVr4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XI1QHrSIMjS0pc6UP/d337/Emd/x24T/tGWDZEFZVCKF/sGS5Ge4a3q4Ba35iJ7hq4B7oMgJGA6sKO5EmyKFcHvvp37ZamAs6pij0XeApKJwh8fx8RMrsc6pFDxA+DOCPzldTcjke631RJN7wtXclSn5XQI8MVlUgd7bYQqoGa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=aUxEkIEf; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="aUxEkIEf"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c95395230so22444051fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 21:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788667723; cv=none;
        d=google.com; s=arc-20260327;
        b=GC8DHAk2ID8/LpO7vCIk1HqPwSCOycuk2fA5u+slkwpr71S24VqMZxAb6wQyis5pXu
         NRj7Sg9kSXMoJodP3TLRAlnm5WOvQtfUZVNqZ8/8LV0Lc79o2GchhZJixvGcE7FdGkL4
         y3BnBb/J9BK0VilGaS+ytJx54ULa3LkuBUL7hYq8D0FjiJJIUqV+azlihfOPihFlrDg9
         ohn0QVdjSJ6pKZE7SSs6fNDYT9z2NJOyO9U29PNDpGNOsybSzziPLv+ASZLwP8tU80g0
         6tzeP8Ahut6qT6asJ6gvf/GPQ/DOBWefjLKCg6+IxsrYeQAikB0EL7SF8YW80iyRe7Gf
         qH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/qnRZ1b/ThxLCDKg+XNGDfO9T1I8FVJXyvQjT9BlGzM=;
        fh=a6S+WDE+onCgLahmPWzakuhRfy5I7Z6TUFLoP5XQyUo=;
        b=c3o0qc0MWu5f+Hr+NKAFvru4SU4lJXSJXCcDcnqQ1+c/20fvUvDxtK/UgkIanacd07
         nABPV3XHpNO+t4XqN4jlG3xmiduW39fvfJx8R20NCNJZx7qflsqH6P8h2IizLoezPAld
         e6wOCeTVn3GTwhpMVMTDE/+qwkYGKVa6piQRTQjIY3Bq2KzDOEumtU6RV2USWtHlpF6b
         ohPSpzvOxBK5HHak+1eh3P3MN04GATNaO3JWMGzqOvQ2R9W7I7dztBNVgoIqxu/cQCyR
         /3mGUfHGwGZcVmxcu9mqkXnQdS9fEeStH7RIJwjAOc/2RgM1Kizok2TvZb+qgQLKWGs8
         FmnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788667723; x=1789272523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/qnRZ1b/ThxLCDKg+XNGDfO9T1I8FVJXyvQjT9BlGzM=;
        b=aUxEkIEfst2969ukf+XsHqcWqNmx8Qv/9mKsnIk5iz65Kpsa/DOkmQ+0ItwstA9oJg
         W94mH/IExfM0KQIuvOmi7e6nG2IixkGIfC+d+kl82pN8sCrXGgvre09ea0jut1cwMFP9
         bVQUn4fUgCgzZz99FnXiqyocLr/CPoinfFZ9Z2SrGuM+6UaXvSH3+eTKenqILIkQq6YQ
         5+aW04f1+zYSl/MMnaAVoECL6P1OoN59Od99t/2sgVdttt/vlFd9S9ZLF08uPZFrEFNf
         Eku/EJTL0qQf7E24aMqXpcDiESceKYZDIjCfDmpwam5uZLUmOVcnxVCM3ZxzdH2+cIG2
         IuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788667723; x=1789272523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qnRZ1b/ThxLCDKg+XNGDfO9T1I8FVJXyvQjT9BlGzM=;
        b=PDzeJQQzTWaHFU9RGkVJduqBQ0unTesmxeD/7CAnSffJUfroMKIji8R7wRDdodnZE4
         AKSWTxaosffNTpaoX42Gt7RNZdfy+OZkzlXRqSxI60MlDnylV/7IYby++KtMci+LyLnM
         1KakXB3qSsj0Dm1C6wNwZ+VjynQRbCeWm5J8rqH3oQm6w8AAj8w0yo80rGLh+hVoeUdg
         LtG4+n9/JJRdvvKdDMDYU6WEugpgys9N3ysULQuEYr4wtSlrlwRNUK5w0Y9ty6STQOuI
         LCALbts0hG5AsFzTbmDQZiB15pkrsTpm1/bg4B1X5HIYEfB3IrnEry57FFYRFgxntY3w
         HP7w==
X-Forwarded-Encrypted: i=1; AKwUvBx4XU5ux2PznPcrcR5AcLMjv8KBuM29msUJpUd17B31axThUBwV0iJUAQS6GiA6XZb9TsYmi89QgKWJ9po=@vger.kernel.org
X-Gm-Message-State: AFuF++mt3BgxksihK33voNZAKe78Uh3CIsm7NGR32pYcgKyJBUqqggXB
	C4nbUq/D8MzLLBzm3LQpsOEcM+FN838DwPEi1dlIgriSt7xf4Z/kQSs6kuZ7nGktuP01WHdwDys
	9QkkHwM0sQ4nwHehHJaUrOGtsjbwFMNc5hcBzfX8F+AA=
X-Gm-Gg: AYBFou3JPzmhluHYfPl9M8w+x2mGiQziI1SYyyqoyFQWhQuv4rTkxjnMG/FZlBhGkzi
	HsONISpYBvM+c3uG5SmLKebOXaNI0I7aNDHvDgLW9MB8IeQeJg5VlkNiujuLmhoisfizYACHmhd
	vfRCwzsQiul24HKkhEfW/On0R1K7Kjn+KpKYzOI0+NV/GDZl7RjlYDLYen8pLf/Q8DUKkiFavPn
	iH4t6MhxJln35iSC0465mmEmM/HtfkEUR0N0l6MrxmOBb8zJ1IeCw3b59mJ/jv73i/CyQY/tk2I
	7jPNLpo8PTdNFsFE1XE4Iy27l5UapZkRd5F922uqpwrF157TqdMR30qdhcUSL8eMBqgqVhpvz3A
	=
X-Received: by 2002:a05:651c:2205:b0:3a1:4b92:76b0 with SMTP id
 38308e7fff4ca-3a371b5a644mr16405391fa.5.1788667722643; Sat, 05 Sep 2026
 21:08:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <133b6aee9e2c908c9da37d5585b3d2cd016906cd.1788187473.git.zihanx@nebusec.ai>
 <20260905151227.75099-1-horms@kernel.org> <CAANe3eRpVGnYpygfiQTsXd2VmBO43P-P1RfREkdDypgXBZB9Uw@mail.gmail.com>
 <20260905190217.GE40544@horms.kernel.org>
In-Reply-To: <20260905190217.GE40544@horms.kernel.org>
From: zihan xi <zihanx@nebusec.ai>
Date: Sun, 6 Sep 2026 12:08:30 +0800
X-Gm-Features: AcwNN1VTRejeC3BkfntBUh_MIrPvKzSvYUZPlMcVAjoUU_1YeMmnOwv8v11Td5o
Message-ID: <CAANe3eQ-N3fse+6hTJfEjHQT+y=xkZA6eYVeD--+k+fdhZC5Xw@mail.gmail.com>
Subject: Re: [PATCH net 1/1] udp: diag: bound bucket lock hold time
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, xemul@parallels.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, vega@nebusec.ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 3:02=E2=80=AFAM Simon Horman <horms@kernel.org> wrot=
e:
>
> On Sat, Sep 05, 2026 at 11:49:05PM +0800, zihan xi wrote:
> > On Sat, Sep 5, 2026 at 11:12=E2=80=AFPM Simon Horman <horms@kernel.org>=
 wrote:
> > >
> > > This is an AI-generated review of your patch. The human sending this
> > > email has considered the AI review valid, or at least plausible.
> > > Full review at: https://sashiko.dev/#/patchset/133b6aee9e2c908c9da37d=
5585b3d2cd016906cd.1788187473.git.zihanx@nebusec.ai?part=3D1
> > > ---
> > > udp: diag: bound bucket lock hold time
> > >
> > > This patch limits the time the UDP hash bucket spinlock is held durin=
g
> > > netlink socket dumps by collecting a bounded batch of matching socket=
s.
> > > It takes a reference to each socket, releases the lock, processes the
> > > batch, and resumes from a preserved cursor.
> > >
> > > > diff --git a/net/ipv4/udp_diag.c b/net/ipv4/udp_diag.c
> > > > index f4b24e628cf8d..18cfe0df654dd 100644
> > > > --- a/net/ipv4/udp_diag.c
> > > > +++ b/net/ipv4/udp_diag.c
> > > [ ... ]
> > > > +static void udp_diag_dump_done(struct netlink_callback *cb)
> > > > +{
> > > > +     struct inet_diag_dump_data *cb_data =3D cb->data;
> > > > +     struct sock *sk =3D (struct sock *)cb->args[2];
> > > > +
> > > > +     if (sk) {
> > > > +             cb->args[2] =3D 0;
> > > > +             sock_put(sk);
> > > > +     }
> > > > +     cb_data->dump_done =3D NULL;
> > > > +     module_put(THIS_MODULE);
> > > > +}
> > >
> > > [Severity: High]
> > > Does this module_put() introduce a race condition with module unloadi=
ng?
> > >
> > > When an active netlink dump for UDP sockets finishes, inet_diag_dump_=
done()
> > > invokes udp_diag_dump_done(). This function drops its module referenc=
e using
> > > module_put(THIS_MODULE) as its final step.
> > >
> > > If this was the last reference, a concurrent rmmod udp_diag operation=
 can
> > > proceed and unmap the module's text segment before the thread executi=
ng
> > > udp_diag_dump_done() executes its return instruction to return to ine=
t_diag.
> > >
> > > Could this result in a kernel panic due to the CPU attempting to exec=
ute
> > > unmapped memory?
> >
> > Yes.  If that module_put() drops the last reference, rmmod can unmap
> > udp_diag while dump_done() is still returning to inet_diag.
> >
> > I will keep the extra module_get() in udp_diag_dump(), and move the
> > matching module_put() into inet_diag_dump_done() so it runs after the
> > callback has returned.
>
> I think that the fundamental problem here is that managing module lifecyc=
le
> from within the module itself tends to be unsafe. I'm not sure your
> proposal addresses that problem.
>
You are right.  Keeping __module_get() in udp_diag and only moving the
put into inet_diag_dump_done() still lets the module pin itself.

> I think one possible solution is to move the module_put into delayed work=
.
> And another, is to move module lifecycle handling into the core.
>
> Possibly the first option is cleaner as I think that only udp_diag
> has the need for this.
>
The extra pin exists only because the dump kept a socket cursor after
inet_diag had already dropped the handler.  I will drop that cursor
instead of adding delayed work or extra core lifecycle state.

v2 will bound the bucket lock the way tcp_diag already batches, and
leave module get/put in inet_diag_lock_handler() /
inet_diag_unlock_handler().

Thanks,
Zihan
