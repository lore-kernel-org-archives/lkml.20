Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF034DAFA5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792362732; cv=pass; b=JAAiu4nKXTo2S7yuUL8ndCjJcfgIOEfL2WaEKcM2zYEQ+hk6Gt2xYK4S+FlbFvmpeNeiKJUKav52qXpcUbhx0V7HEcyhANCpqInUtucyKuHv5egU4Y1ekD95WtvTpFm5AAAn+fAlMcA83LDBwTcCVv4O1e6ksOYUBQOumXNF7SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792362732; c=relaxed/simple;
	bh=EpvAQ69oX2PZfPd7/XNk/kWpL7ZP4lCDG9GHkZbyLdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8aVZe0t5V9KwpIL29K7tWQ6yuHr8qM7JohFrxxDZqA3TkWp2hg3K4sm4pdMx2kJgJk4Bm6C5MHsKjikGHIy4T/fNSTD6QGXzil9ICig8OXDkOz/uwC6Pc7stqL+ZJ7ZXGcWYyYTAC42r2v5HzL6sE65OEOluUjLFpkEHI1mYIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=LNoH3+WV; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="LNoH3+WV"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a01cac8733so859110b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792362730; cv=none;
        d=google.com; s=arc-20260327;
        b=cgibGGVblgbAewdbnvhSe47XDyjUSxBfld9pjqEOzDtr46VvbnZgiMYBShs33CRY5t
         4ErZ4AjrxSUavZn7sRDMmRFXIKC9qK7ucWQu8tkz0CMzni3OGbhch0Y3Z0EAaHqcsN6K
         uesLIrRcmUV8Kz21sLo0e8azGwYOBnNIf3JuN1faCckCbJgNwhl4Tb/4TSds+szc+Z35
         0sGm8uSHw0h+0136jAX+jFevUAEy3c5mHgyEh2KD0En7jMKNPzXJ1/1o1+0dBBK5LP9G
         GIKFTDcO3almOPpFT5eplBq0cZi7qpEU1QRgnyRkonKhCjf1CopoV1d1RR9T0nUJGKJj
         Og4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=538lzUoX6jPHx1owv0jysMnR5L7Iq3ebRGIPhVTonyc=;
        fh=h41vOuQbQy33fAdl6y5Y2j8Asgr/888tzqZhXEbmRvI=;
        b=IwrEGZFxQZg0GVU4xQoH+aua3FAdByYtpTnctpzsdSt8+AepA4vNWToZkj04dJNOsi
         KdZMEquqzB7z11uipGxC6WrWKxTBFp/uK4BMsw993LExCsP1DhHUQxZYKe3OKRkAgxU8
         KIhPndoeE527zRbDtvm3cIOmeH5BWkHKZeaGDycb6MGVZdbwA0xgOTkmU/z4iECdFMwD
         iECs49jR5ws2ppnrGx1duUoDByvGx6HGUzjZHJfjzVZntxfZOKh8wIr8GESZZrztXrr5
         9Yc1IjdZdYHYUUWWcBhgQwVwsUKF5hk7U8ajSMYbtdPFowN5Xa4dwaPStUbIphEvYYIP
         CPBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1792362730; x=1792967530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=538lzUoX6jPHx1owv0jysMnR5L7Iq3ebRGIPhVTonyc=;
        b=LNoH3+WVb7kGda3VE5gFJR8BANrFitkoH6oaDhF35fOETpLhewxipz7OjK8rkYwiVQ
         GjQvKysNO2cIfIuxMKvtJekWsPjlEoW4u9lKz6FboKCxGwznA4RHpTYsYUI3SV6ZHRox
         b4Yo6MS5kltt+RWGy8eLAf5CbvK5aEEy37OCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792362730; x=1792967530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=538lzUoX6jPHx1owv0jysMnR5L7Iq3ebRGIPhVTonyc=;
        b=iqHSlIFiNabgPCBNjTv7CEBWww7NJN0POzvtEt1o4wKEdtk7M3yYoI6DQhf+TIz5U2
         JooNU8rAwY+t7METZWts0SxbaYUHH6JfaYscMscl1mpb1/h9Bf90F90P2lF2pfsEWXEV
         2xZeMskCa+8XzwkdBzmIx6SFo+mJNzCRzk+EB4VSyttVrxA6c2ErPUvjp75galGE7Og3
         RRv6iedxt4HKZDl4ATayWuiU0qMWDEsyM++VkP5SmMr2ny31SJgYfyh6WbG1nX/aaI/l
         oQjXOuNQqGzMoE29DgBlw48eExvnHDaoxpvKLPOWYBvrWmW76ztaehlxZIGXwoNjGK94
         HuZw==
X-Forwarded-Encrypted: i=1; AKwUvBzsOQvhM+K1fxXTXSkoO41Nd95ZPFzTLaGqIiRF8oxyDA7BGiF9rLaJg5JFH6m1m615T1E4tSL3cFg540I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzI6q6y82zuM5Y9OSCfZJz5aX03Y/BTOTUCoNIWivyVu61rqmB
	kXS9RYIR7rx3gRx7mTgxi3Fa1xRq9WlAeRPTbP182IO2nu0CFz+NU+zzLAofcsTQ/D7hp1atwgV
	jT6HzNPTjgAtNtSgiT9/yUkbEg4TB4WWakmMjeCWA
X-Gm-Gg: AYBFou2h/j7U7P/1hxT4FLYII430lTrddWm40EnrtLheE0uLS8+HH4O3F9qAO9O3u8K
	0XcVwniVGXHwGgGPC3+JAmpTTk0pIifH+yc728c3A8BH3CbwBNgPdsruKWhlOF4rvMzBSQQputx
	hjw0a2gtEa4bipXFIyzgR7bkp4rXLYAfWpzSQck5ODI/JW7naND2Cpm+SSPZtrmdmHU/uLU5qqC
	uCJZa91iO1KP68BYo8qhle2go0WT6aseBji8q33J1ff1VzE9+IIJFmRNphwa5J4idDKFLcSc/Ta
	1X2XS8wXs6I6gPGkoZ3eyy3o/OUKiThk3RV59SlpgjStyAys6V6Bp4l9uELQwlErFXVyNJu+s0+
	a8cn2HZ2T71hS/ls8ic7bH9/wbuGZekCCVw==
X-Received: by 2002:a05:6a20:4310:b0:3de:80a3:cc30 with SMTP id
 adf61e73a8af0-3e225fe03f2mr4804348637.19.1792362729717; Sun, 18 Oct 2026
 15:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_2D4F4848C75F5AE9E26589170CF60CC4DD08@qq.com>
In-Reply-To: <tencent_2D4F4848C75F5AE9E26589170CF60CC4DD08@qq.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sun, 18 Oct 2026 18:31:57 -0400
X-Gm-Features: AclHuK8Fr-SvjE7bV0jfcKnvIZEK1eXgf_dfYq6_pa6v26cqsECV8L2OQiffThk
Message-ID: <CAM0EoMkBPWyMKBem2pjvL9Ko0zwpHvBRt7JB7H1rg7L8+zc25g@mail.gmail.com>
Subject: Re: [PATCH net] net/sched: act_api: collapse duplicated slots in DELACTION
To: Hang Nan <2122295973@qq.com>
Cc: netdev@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 12:58=E2=80=AFPM Hang Nan <2122295973@qq.com> wrote=
:
>
> A batched RTM_DELACTION takes one reference per slot in
> tca_action_gd() and drops them one by one in tcf_action_delete().
> Every slot also calls tcf_idr_delete_index() with the index it saved
> before the put, and that helper drops the IDR reference as soon as
> the count reaches zero.
>
> Nothing stops userspace from naming the same action in several
> slots.  With N slots holding the same action the request takes N
> references, performs N puts, and calls tcf_idr_delete_index() for
> every slot whose put did not reach zero; that helper drops the IDR
> reference again each time.  From N =3D=3D 3 on, one drop lands on an
> action that has already been freed:
>


Nacked-by: Jamal Hadi Salim <jhs@mojatatu.com>

See: https://lore.kernel.org/netdev/QDISC-K1TH.v1.r3.20261012134653-1@mojat=
atu.com/

cheers,
jamal
>     refs =3D 1 (IDR) + N
>
>     slot 0: put -> N,     delete_index -> N - 1
>     ...
>     slot k: put -> 1,     delete_index -> 0  (idr_remove + free)
>     slot k+1: put on the freed action        (refcount underflow)
>
> With two slots the second put is the one that reaches zero, so
> __tcf_action_put() returns 1 and that slot skips the
> tcf_idr_delete_index() call; the accounting stays balanced, which is
> why the bug needs three slots.
>
> A three-slot RTM_DELACTION for an unbound gact action (index 0x1002)
> on 7.3.0-rc7-00245-g32c52ec87d62 reports
>
>     refcount_t: underflow; use-after-free.
>     WARNING: lib/refcount.c:28 at refcount_warn_saturate+0x59/0x90
>     Call Trace:
>      __tcf_action_put+0x7e/0x80
>      tca_action_gd+0x439/0x640
>      tc_ctl_action+0x10a/0x170
>      rtnetlink_rcv_msg+0x14c/0x3f0
>
> and returns -ENOENT, because the IDR entry is already gone.
>
> Collapse a repeated action while the slots are being resolved: the
> batch keeps the first reference and releases the extra ones, so the
> IDR reference is dropped exactly once and the delete succeeds.
> Comparing the resolved pointers is equivalent to comparing
> {kind, index} and also covers actions that live in a per-action
> IDR.
>
> Fixes: 97a3f84f2c84 ("net_sched: remove unnecessary ops->delete()")
> Signed-off-by: Hang Nan <2122295973@qq.com>
>
> ---
> This report was produced with the help of AI tooling, so per
> Documentation/process/security-bugs.rst it is being reported publicly; th=
e
> reproducer is not attached and is available on request.
>
> The two kernels were built from 32c52ec87d62 with the same config
> (CONFIG_NET_ACT_GACT=3Dy) and run the same initramfs.  A batch of two dis=
tinct
> actions is deleted on both.  Two duplicate slots also delete cleanly on b=
oth.
> With three duplicate slots the unpatched kernel prints the warning above =
and
> returns -ENOENT, while the patched kernel collapses the batch and deletes=
 the
> action (no warning, rc =3D 0).  Each kernel was run twice with the same r=
esult.
>
>  net/sched/act_api.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/net/sched/act_api.c b/net/sched/act_api.c
> index 9eb1dec..dc51ccf 100644
> --- a/net/sched/act_api.c
> +++ b/net/sched/act_api.c
> @@ -2021,11 +2021,28 @@ static int tcf_del_notify(struct net *net, struct=
 nlmsghdr *n,
>                             n->nlmsg_flags & NLM_F_ECHO);
>  }
>
> +/* A batched request may name the same action in more than one slot.  Ea=
ch
> + * slot takes its own reference, but tcf_action_delete() drops the IDR
> + * reference once per slot, so a duplicated action must be collapsed bef=
ore
> + * the deletion starts.
> + */
> +static bool tcf_action_batch_dup(struct tc_action *actions[], int n,
> +                                const struct tc_action *act)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < n; i++)
> +               if (actions[i] =3D=3D act)
> +                       return true;
> +
> +       return false;
> +}
> +
>  static int
>  tca_action_gd(struct net *net, struct nlattr *nla, struct nlmsghdr *n,
>               u32 portid, int event, struct netlink_ext_ack *extack)
>  {
> -       int i, ret;
> +       int i, ret, nact =3D 0;
>         struct nlattr *tb[TCA_ACT_MAX_PRIO + 1];
>         struct tc_action *act;
>         size_t attr_size =3D 0;
> @@ -2050,8 +2067,16 @@ tca_action_gd(struct net *net, struct nlattr *nla,=
 struct nlmsghdr *n,
>                         ret =3D PTR_ERR(act);
>                         goto err;
>                 }
> +               if (event =3D=3D RTM_DELACTION &&
> +                   tcf_action_batch_dup(actions, nact, act)) {
> +                       /* The IDR reference is dropped once, by the firs=
t
> +                        * slot that names this action.
> +                        */
> +                       tcf_action_put(act);
> +                       continue;
> +               }
>                 attr_size +=3D tcf_action_fill_size(act);
> -               actions[i - 1] =3D act;
> +               actions[nact++] =3D act;
>         }
>
>         attr_size =3D tcf_action_full_attrs_size(attr_size);
>
