Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793429911;
	b=ArtlzQMHV3VIAoMVo3phePdIf+vhv/4barnwVHzLMNGa+ixVTFr1rKrg3Wr+15TWxX40
	 Sujph3xLzT7rbnRkwjZCDmn5dXOQwpn/K5pAwQ+dasKHdjYVqRpQ/rzztMCGdbb3Wc1Fn
	 ssTscNWj8uLLYOqGNcwfISsWb0wN7qxXuAUaHmexHeGgBwpi5jm5VIP4lpRWLnX0bB6bc
	 1kbCg4ATLKxWXQXwunWVzAKZTIt2Mj4RDONrU0JLt5vvHhFB6DCWdRyl4Kq3taMa3tI9e
	 /OousSefVoKDjp4X2zzZ8f1A7ZeGMDP5k6NYtzRT9jEJCfcfIl8wS94Wi1CHXzpAAAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793429911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z+ERvyGFXJrTUdts7nrzpMlW3VnG47UNvQJMV6QYWbo=;
	b=4TZJ/g5VbLsSqwOhQOcI+lrYdJvLgIPEvUTtAE7AHhqlSVqNUywFJ/hRyNiVfzyapQLi
	 Z4Wg6EkmFqqYiP9Yn9SwiQAGf56UdoxoA6dnn2xeRlE9XNJTatW4w57/qS2LFz3Xc7ipg
	 5yvKkf63ORNKsN1HTbUDxqYzge7GlZiaT0p2F12y3uNmJXWL0nL0QQLdD3huUdEWBMZMe
	 GmlAXeoRg0rQrYrdRM3AiVXphEYSVfgXx8VcLPbupYNBfzTzZM1qSaQ2aDbB+J6Je3xKs
	 /zbrZVpZqkTObGi/XZJmX1ef6+mB5bwoUFracVw+WFSnvyjpgt84SfwYG/a0NInnvfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NM90WPI8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919FD606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 919FD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NM90WPI8
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso1333950e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793429908; cv=none;
        d=google.com; s=arc-20260327;
        b=I5jm9WOwLGg5LDadwyRfBLaXqxN+yOwXtKNe1zUCA3xygFld+8HbpC7ZiO66MrIJaU
         ViskXK3b8BA5h5bSN7LyaOjyDbdjgXwzAE0tsnGQDvfh/Eiw5wJasRqX1A640sfUw74i
         d59B33wEQPLLJgSdf1GvTa8KE8FY91RSKddkWTKxpLIxJdrc6tD/Weph3DvJb4i/F4h8
         mnXZRoXASBxS9I5es4BPDE2zQtK+yEy76JQKoJt5PZ3ZAlScMBnnz1BBF2NbpDR5sx8D
         Yeje327ePz2BgVBo+wEUbMSl4UVACbKeCxXyGIpojU9JdY50qizXzEjnzOdiZM9maDVn
         f/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z+ERvyGFXJrTUdts7nrzpMlW3VnG47UNvQJMV6QYWbo=;
        fh=gI58w0U5xpOHN9obkjMWX3gT14vNLwN/wZ3cby7sGRs=;
        b=HvPjkXuA9EyGl6JaHwRuMExkz4D976q+OertynkAWJhNzWjtjW2mmqj4Hcv1PaiykJ
         LYl+IoMEArM60vOsZ4uU00qdsVp6Hbwt+VxG5zntThsnybUxnDawlSV+vj2izCQ2BrYI
         bZ5FjatFnn0aPK2/+x9eWBq1HbVDyDTSwLfcCNjkOwRsu0QhW45t9TYaoi0Yr6Z4NUiK
         HRdx4X3j2/pKu00+qw/5rXXr1mydVXyOt+AQHfRvwx5RpleR2vvIeJEx54r1SkZVji3G
         RQclua0Zcyb7I7bHZ0uhLUdudY2Kh8GZvRNHKQleZ4PHf3bOIohhJ2FatSfF61ZW4aBn
         /zOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793429908; x=1794034708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+ERvyGFXJrTUdts7nrzpMlW3VnG47UNvQJMV6QYWbo=;
        b=NM90WPI8YAaCMCqbEkAT0Q+XVe2Ic6hF7MD9jz36BcAKlkd3tqG3RYwvZgK5w1kkOl
         ouAY4xgR8RAHJNda13HvjQzH1H4If9gNGS1KjZdqZIsS16QJa1nV+A6ZdxXiZ1gCTKhx
         MKjqhRePsj1yNeYOzokLrRpcSrO7DUHGM+BEWqWWN1kTpbmZVpEsx7wjt6/6j5jnGEtJ
         DLUT7WqHY4j5XC9UW3V4Y1ZjhwZInup+AMU0MqaIIpAa+3IZ6GGngfvA/i87YEpZnGB4
         wyJOLS3n9Zuy9QTpfw5y0YE5GWzhqt2c1O6m/alSiglj4V5v9U0Jl6uGX4SZLCtlmdKg
         xaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793429908; x=1794034708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+ERvyGFXJrTUdts7nrzpMlW3VnG47UNvQJMV6QYWbo=;
        b=xwvHhFF3KibQpj7YkZwXV0Mi/7JhWZvmfrp581bhKAVoFD77S5E/JfIJ4CWUMYHSOE
         NgcSNEW9z4aNHfLUrHsrmHgL8O9qXCtpmo/hGYyrnUTeS0oOQfr15ia0IBfCeufhD1K+
         2Qy67SNepPAnTA5JC8fkKJJsZufa4Xvl3Hny7zdY7latVs2a36iTU1/1aXl4raLP3Yvp
         QgxeVx8XiaqNzic5x7wblBulLYyacZVS/CuzZ7CxinqaRivom8FWucITPQBXgVRe2Hux
         hpKh+IjBKFjFw73w91oL+/3VHzb4LvddtTsZxlwyaYsonTo99sv0WC12D556nI2ycPEO
         WdHA==
X-Forwarded-Encrypted: i=1; AKwUvBz3SI59xV116zT4nHgCqqMQK1AQhp9PXhU0U45gUTdbwfpMGElBvi3uxx096rqlITlO9M9e74RdVykhcQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGD/uYbRoaAW4AP26aFi9KybkwdAG3uajRS6KzqFVo5KzNYuBB
	/S6mhruGM8NXgvy56GaUzbgcz/R0qMQRCzrZ4S2N8UXFyLe0Km1VtyW6E+TuPTxXJC6olZg5rJ1
	nZcX/vf5aEqLwdiiOCL3No3LVQ0QdUUc=
X-Gm-Gg: AYBFou2s1DnUf4wUf8vSe086LP6ogE/+TICQsIAHZeTGYV/NJxcrwBhjNcfz4/AwFw/
	0jpalheMwRaflNSJOzXNrsdYN/GIxEqC8zZklKFPIkQyzT6RMFgn+Yv4LcmOaqrDO/TQ8V9qJgi
	L8egsi+LGKSyVpBchod5QpVi6jySrJQskGDiEoHOJSBQf/BXyKnkOjfctcFRUqp9Y1YEC9L5XmZ
	xevGxK9I6rU2txdfeyxZHE2Vd7FP6MtMOTQBVsDa+MfAIgA9gZTZvyetPEFjQC4kDKfT+oKwIx2
	MvF0DlSJN/lvbWs3OMnjfYf6Sn7ymCh0+caPKGORF5vjwCLcFNgT6U/BgdVwUgXHkkqTbi5y3vv
	drgIzY5EAa5Ke1/8X52oPWtLvE9UhmYmg7Wqabfx2n24uqWt2LQxkZXUi+mmvh3NGo38nTnnfBv
	DrL2Y4E9Ce5lS/EKWS1HmpZPv+nll8+Xz/H+aXsvB66L7EgcRgy9h96sKQwqbPaRVHnejoisxTO
	FMg8eHY0SM=
X-Received: by 2002:a05:6512:1087:b0:5be:4792:82ac with SMTP id
 2adb3069b0e04-5bfd956f142mr1539518e87.41.1793429908173; Fri, 30 Oct 2026
 23:58:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029054200.97234-1-gyutae.opensource@navercorp.com>
 <9024faed-854d-411d-96c1-7cefd4d68dc6@redhat.com> <CAL+tcoAmq0WfSzo01xbAQ=g8OtE+GpJ5+RGs1G1SdNPdHx_eZg@mail.gmail.com>
 <2026103018-gothic-sheath-5c34@gregkh>
In-Reply-To: <2026103018-gothic-sheath-5c34@gregkh>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sat, 31 Oct 2026 14:57:50 +0800
X-Gm-Features: AclHuK_yKmoKPeylNNTwvOCcmLXjE5Vpfta5mEI4e24EAoe6XTOkLL75-ZO1HLk
Message-ID: <CAL+tcoASLs8jfPgs+OSbjy=aEJjor_wK2qPWnOvBAD1vuroT-g@mail.gmail.com>
Subject: Re: Backport request: Revert "softirq: Let ksoftirqd do its job" (d15121be7485)
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Gyutae Bae <gyutae.opensource@navercorp.com>, 
	stable@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Minsu Jeon <minsu.jeon@navercorp.com>, Jonghyeon Kim <jong-hyeon.kim@navercorp.com>, 
	Siwan Kim <siwan.kim@navercorp.com>, Gyutae Bae <gyutae.bae@navercorp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 10:15=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Fri, Oct 30, 2026 at 02:16:57PM +0800, Jason Xing wrote:
> > Hi Paolo,
> >
> > On Thu, Oct 29, 2026 at 4:33=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> > >
> > > On 10/29/26 06:42, Gyutae Bae wrote:
> > > > Please backport the following upstream commit to 6.1.y and 5.15.y:
> > > >
> > > >    d15121be7485655129101f3960ae6add40204463
> > > >    Revert "softirq: Let ksoftirqd do its job"
> > > >
> > > > On a production 5.15 PREEMPT_NONE node, long-running overlayfs
> > > > getdents64() calls prevented ksoftirqd from running.  RPS IPIs
> > > > continued to arrive, but NET_RX processing on that CPU stalled for
> > > > up to about 3 seconds.  Over 15 days, the node logged about 1,000
> > > > bonding ARP monitor failovers, with no link-state changes recorded
> > > > during that period.  The failovers stopped after the workload was
> > > > removed.
> > > >
> > > > On a 5.15.27 PREEMPT_NONE test node, we used a livepatch to make
> > > > ksoftirqd_running() always return false.  This removes the same
> > > > softirq deferral checks as the revert on this build.  Under the sam=
e
> > > > load, we measured three 10-minute windows: before patching, with th=
e
> > > > livepatch active, and after removing it.  The number of HTTP reques=
ts
> > > > taking more than 200 ms was 17, 0 and 11, respectively.  TCPTimeout=
s
> > > > increased by 25, 1 and 21.
> > > >
> > > > We verified with patch --dry-run that the revert applies cleanly
> > > > to v6.1.190 and v5.15.223.  Both already contain the related RCU
> > > > fix 1dd1eff161bd.  6.6.y and later already contain the revert.
> > > >
> > > > The original commit was intended to prevent user-task starvation
> > > > under a softirq flood.  The revert's changelog points to threaded
> > > > NAPI as an alternative, but it is disabled by default.
> > > >
> > > > The revert was merged in v6.5 without a Cc: stable tag.
> > > > Syzbot has also reported bisections to this revert [1].
> > > > Paolo, Thomas, Eric: I would appreciate your thoughts on whether
> > > > this revert is suitable for 6.1.y and 5.15.y.
> > > >
> > > > [1] https://lore.kernel.org/all/000000000000a249880603717c15@google=
.com/
> > > IMHO such change should not land to stable lightly. It's a behavioura=
l
> > > change with subtle side effects. The threaded napi feature is disable=
d
> >
> > Technically speaking, yes, it's actually not a bug but an optimization.
> >
> > > by default for the same reason. Also the revert has some soft functio=
nal
> > > dependencies in napi threaded cleanup and improvements landed into v6=
.4,
> > > i.e. 6bb218b5a6e3f3c5e2e76faf8fc976f3f6f72496, likely more.
> >
> > Maybe I have a slightly different thought on this: since I really
> > received/noticed there are not a few reports showing the 'issue' in
> > the older kernels. It's not easy for some people or company to upgrade
> > the stable kernel. I'm wondering if it's still possible to land it
> > with more careful consideration in the patch if Gyutae volunteers to
> > do so? Please feel free to reject the proposal :)
>
> Given that 5.15.y is about to go end-of-life in a month, that's a
> non-starter.
>
> For 6.1.y, you better be planning how to move off of that _now_ given
> that you only have 1 more year before that is gone.  Anyone hitting this
> issue should be moving now as that gives you an incentive to do so :)

Right, it makes sense to some extent.

Thanks,
Jason
