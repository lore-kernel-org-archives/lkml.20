Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB2D346A02
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787813789; cv=pass; b=LkPrlwRTKOdjDRecTpeAJcGf5mLfZ5bXCm98202dXPgIisgmVAs5qr6zOdeCoCf3g50+VW7qw9GjN/oEniyvyzhyErAS5QMWaQhnE+SFaaBA9MCFIP9uZt41/zA3vfAc45tfoFVjorTuFT6QTt4crLtIemLJMiyrv85+Ir7T4ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787813789; c=relaxed/simple;
	bh=g//GFZ9cM0kV6wz/WYWiImy9dNDXGkjbp+4scPbPmBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/7a5KHVj9mUDKKVcpXpEg6xq37Id6t1N0jwjCH7djAs0+Ka+iaMciT1nru3Qgr6rCTxzHpQpEiv8yzHjlXijkOURUcaUGnlIVPGLWkI7A5/rdNnXyicJajmnsYfCBSQHP9gX0tdDlNTeOTmJcXukzB1fdzY4FWRjI5wNk+OQ/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LL9OAQQq; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LL9OAQQq"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-52d8748cde5so1831641cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787813787; cv=none;
        d=google.com; s=arc-20260327;
        b=i+gP0ZctXBBLnEVjUYW+c70CdfRFSDZdD7PDR+HUk3XSyyAuEaNP9+EGDHDuFac7OM
         eUqrZM47l1zcNGMoOG5TCB0ZwbXp5GtEU41WGC9xWjWX1hpWdzGjJ6LMAcLdeSrcbVmx
         zO9sbbTuX4b/lVBS+jMaYBCLKPfjec1wXVyZlg45kKm9bOfvIr/V6Om3NUHRe0xiiUAK
         fGgcjGrkpz80NtEqTGNNhrK7VfbLdrAT1cIPQ3AXNR8H1P+flopdCcDjKliuL5Fz+O0g
         NGdyKzM/RbA9FVIGKJFLH23vVawwswdZBYoRfV4582liV35GXiQih48t0t/VcnS/ros6
         yX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AHX7loaDyxgrVmCP38AFUSPhLffvrEaHlcGJr9fqpWw=;
        fh=NLw3bkOGxVVUEwj+7PGmMoMOO3zPh/CTwoWc00Fv9KU=;
        b=CpUg3a82KDN3UQ3uLvjbfCy1WCbU0eJat6TiRGHStFXpndIpTwZ8QpsXMiafgwPbr/
         sZrIJY68hchwjwooVrZDtj0RIKwn0e3urI4fsgjNo8NsqM6x4ZOVEvPZS39Q+IRuvH2p
         ncaspwRMdJrejmjP4t5xU6Wd7cDtzDgzXOrCGiGqNjpASGIF9TExZDGtfeaQi/LHQJoO
         tLVcKSt2zVOAK9AVEah5CFvzeousjiw6CcDRK20C/dv23XdVJL4j5lJJHAHH6SfedH96
         9zr2t41D27Cg8V1uUYF+Fxp8RyABGNYATNssTLAYfQciDqR9ONM28bbtW63uwvLvf7ZE
         6wsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787813787; x=1788418587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AHX7loaDyxgrVmCP38AFUSPhLffvrEaHlcGJr9fqpWw=;
        b=LL9OAQQqnjIBWUSB0tffSHhLoQ3IB7f2bL234mC2VHKOZABoPofaB7BVVw2R5lUeVb
         xOMLTUD/2+p9LS1+lWvtR6W0oLJw3vVNpgtccpbflGmE8wYf/7v83HPU+VQ0dA7S5Zu6
         zr0WsR69chaQu3hQoLDYnm3CukTXrekULWo6cFR//jtTVfjQL0h05kiT9WQjxBcZRSC3
         /JZJ5qr27dw17TUqMkYfV0aWuFE30Yrbz401eGCbHyXwU00MnumXxrNkNqnqUhcsqOzB
         qymwQ30+IahUOingeDllRGh5/q+L9ZGh9a9caZn3bUEpJVqZX3/hRap2XgsjlZKT+MFj
         5IQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787813787; x=1788418587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHX7loaDyxgrVmCP38AFUSPhLffvrEaHlcGJr9fqpWw=;
        b=WeouYEYM8cX/Q7Fkx//QbZKyHCUuxjCmdFPpDgef0OtoKQSvfv14UJyCOiWH6PM4lf
         t5Gsj/16bQZl5fK14KPOBDFzecgH6JHT6aFXfdVf6Ghi2MuOI+MsNj8lQc0IP/vHAGAC
         taMGtr8F9rsoPAvlKOXE//o4rU+6rNxeTgl7Bk8qYqw3LkBYrlLvMI4Xb8EYoH37oAxl
         OCLOyiUacSIyINBFMseoEtL+6bxh+lsO/or0gdJ9aSRE+0vIEsnM3lOQ17DzoP/dVyhV
         M+wScjvXPdOhpWdjh1ywDX/xR7VvWeoEtu5PonXHQ0i6A1Ge+M+uDoZZM27L2/+g4Nr+
         toPA==
X-Forwarded-Encrypted: i=1; AHgh+RphtZbiexS+GyWQlUgLohK3SpaR3LjeHamdSXkWH234mOJuKGodW/7JdhEcwEbRghwBvQUjUFOTsVTVHyM=@vger.kernel.org
X-Gm-Message-State: AFuF++lm1895yYEHyoaUMqgdwTZr8+ZbNBaSR9BhukzM5ivWJgCjfuuS
	TXsBx/pyRbReATurIiW8T4w4YNWRYY3932WCvgjLBFxrKjLZ/xM/qBZGjkBN4yzzn7ztXgCKNYM
	RQezxZNlskrBvF+vmJbuaDSXU0nzL+vIr5vnXTJ+Q
X-Gm-Gg: AR+sD12CtdlJwYoa7bUU3sTRV0xWfId4IgjdVsq7NsfI1VB/h4oXfiynF2ls97aHfFD
	insvijVb2uLJ2k/68Y5UsojxwxA8myoHc1tPd0sfI3k7v70XQXRZrGTXbeY10l3r3AruhtemdXq
	TBDsSxr44jx3H9tMv5gsmwOS0VWOguhiTOPXdMmDJMJhvYozF+pVoSM8FsVDMie+4vsluqWgxfL
	2mwH+oKzUUifn8jfPJLH+pIMVmMmD9q4xVp+4ne5V46z31qI5Hvx+7OB0Jofa7jrYI9gWQ70mlK
	I2yGvdi3dDlGMExBjN4GGzmJMiSie+MZ6yQx/jExFgs+HziVf75agkKETNe5Ty6WPj3tdiAcyGx
	PpNJdwZnz/5dUxxAIV1mkmHhA3mzx7cHf4Vlup0KGJlLBrfU8Ub4E+dgdTNc=
X-Received: by 2002:a05:622a:11ce:b0:52d:8256:ac33 with SMTP id
 d75a77b69052e-52e42338b0emr122054891cf.28.1787813786180; Wed, 26 Aug 2026
 23:56:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827052219.290380-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260827052219.290380-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Aug 2026 08:56:14 +0200
X-Gm-Features: AcwNN1Wwd5VXxt_7HGZPZSSG3-Va1mnw1t3Mzy5OgF_-m8qrD1p8495iU6XhNj0
Message-ID: <CANn89iKK5jxVa34F7QMPjp5wormMQrZgoK4THJCqVp76Tw1NNA@mail.gmail.com>
Subject: Re: [PATCH net] net: fix refcnt_tracker use-after-free on netns
 creation failure
To: Jiayuan Chen <jiayuan.chen@linux.dev>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: netdev@vger.kernel.org, 
	syzbot+d3f912a2e30e2079a512@syzkaller.appspotmail.com, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Jan Kara <jack@suse.cz>, Qiliang Yuan <realwujing@gmail.com>, 
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 7:22=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> The copy_net_ns() error path tears the net down via net_passive_dec(),
> which only exits notrefcnt_tracker. refcnt_tracker is exited in
> __put_net(), which this path never reaches, so it is left alive.
>
> Since ref_tracker_dir_init() started registering a debugfs file per
> dir, that file must be dropped by ref_tracker_dir_exit(). The missing
> exit leaves the file pointing at the freed net, so reading it walks
> net->refcnt_tracker.lock and hits a use-after-free.
>
> The missing exit has been there all along, but before the debugfs file
> refcnt_tracker was just an in-memory ledger and empty on this path, so
> skipping it leaked nothing and did no harm. Only the commit below, which
> gives every dir a debugfs file, turned it into a use-after-free, so
> Fixes points there.
>
> Exit refcnt_tracker on the failure path.
>
> Fixes: 65b584f53611 ("ref_tracker: automatically register a file in debug=
fs for a ref_tracker_dir")
> Reported-by: syzbot+d3f912a2e30e2079a512@syzkaller.appspotmail.com

Missing `Closes:` tag makes analysis cumbersome.

> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  net/core/net_namespace.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
> index a91d2b58aadd..0c3f169d9afb 100644
> --- a/net/core/net_namespace.c
> +++ b/net/core/net_namespace.c
> @@ -591,6 +591,10 @@ struct net *copy_net_ns(u64 flags,
>                 key_remove_domain(net->key_domain);
>  #endif
>                 put_user_ns(user_ns);
> +               /* setup_net() failure is not routed through __put_net(),=
 so the
> +                * refcnt_tracker (and its debugfs file) has to be releas=
ed here.
> +                */
> +               ref_tracker_dir_exit(&net->refcnt_tracker);
>                 net_passive_dec(net);
>  dec_ucounts:
>                 dec_net_namespaces(ucounts);

I am a bit confused. I thought this was already discussed and fixed by
Tetsuo Handa?

f85dc137aabf ("net: add missing ref_tracker_dir_exit() to net_passive_dec()=
")
should be fixing this?

Tetsuo also followed up with 3220b62fbb8a  ("net: fix a resource leak
in copy_net_ns() error handling path").
