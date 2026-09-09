Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59F848592B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788989714; cv=pass; b=Qvcmt4zUDfLaV+hc48vVAK/Zo2HgER4+geqdB6DbnQXMg2j6idf9S02VyOPIIk3KKyfmVJH/mgBDr+Ut027+Dj7wLdeL2wZn0M/wfQvQcuL8wMvdxhOZ/tcznrUT45AXDTEWV7O8BIPAulcwzjA93vndlLxvVtpJn2t3+gy7T8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788989714; c=relaxed/simple;
	bh=3oNUmTrYWtNLjHBd0tZgzihnKQzz3N1wdYYyGkA2BrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uTkR88Y08e2Ircalm+DDxJvZEhR6WMq2oXkQd5f19eXxhhGonf5Hu2NqOLQXYUrCh+4ORprn4ijpnV9ARRDwT0txa+BjkHFXPygij/nCCFpXSs9nQDVbXvTsIdHpQuBZX9P/dHNZnVhi35/GVd7aA50YW+mKgDwYyLhl9y8yuEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=au4AayOt; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="au4AayOt"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2938116fefso194307666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:34:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788989694; cv=none;
        d=google.com; s=arc-20260327;
        b=BZCrKDCOvDNTW7a54hOpFya1A8q5aJV91bnqaPD2alIUSWha+KJ4Y48G0MxUnJ0J2Y
         SI2osiYISSe/LJQTlhhksFGmJWyzTlP3pN1spP4UzeIFI7l/E6yveXRmLlUCo6MFW8Hq
         BXp0Us1ab+7a9+VtY+MlfR5ks5ECRmsSZzzXwmHTbIKWmfp3kXJj1h3cPyWluU2KNhx2
         0mnVS/TrSScBNbX+QJZmu3PGBrnHKhzmoKI1DUuUJ0D+808Ge3IHiwTL7QrWzaUJdEDl
         /w515i2r93Flj9cno4n+CkZC6d/MtYsJgc1LRgiI0yspaq87Ts86Dep4ZxpXuJcjmMXD
         AWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v/5kGipgpDimrS6n35sjSMetEnTNyDyUhJUmOMfkSZ0=;
        fh=a+mVaUCgesfacxPPSZ/LWVMdlg6/hIxKshFj2hTPJsk=;
        b=g13f3cscSGTWq4S32dsOnDn+7b+fmZxEQLRoyhF8prUw8IZGCbCxEkc6qyjd4S7lK7
         ZUCfPKMR/0XZLuD4vZsEbaLOHbQKTYGHFWQvep3NhzjmjelxTrEA10ZSSfmHc7neKzu7
         eVWZIn4JYLSYtzznU2vzKqPHmhN/HC9w8uaIls7QNABbItFZKOKEXvC9d+jx7P9jmrtQ
         LcZg8uHedPImZxTbhrN2hI1BT3Z28Uolibt/xpVL7L60BT1L2HAt/5PNOFTIKcIyIn0h
         uyeFPo3N33IpjYg/PFvpmCE7aWnqxmtbwejAi8hl1LBf7NmTv+JUlUz1weygWG39X/Hk
         GNcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788989694; x=1789594494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v/5kGipgpDimrS6n35sjSMetEnTNyDyUhJUmOMfkSZ0=;
        b=au4AayOtRxAKx7VLLvNXC1qGB8insGW0x1xoVE721TOiaMX9R1tFikI6fcGzfjzrPO
         AGAVwVlT1RAxfmUDqjEDkHtNicvREcnCYRxfHmlbIQpCT6432tED7oOaq8qq/kBD7mMm
         eZWo1im8Buzkg/ni94bV4G6+XTJU3zBnBkLbyofy/k/9DpXF6ENJEIQzfD+/hDKrprKt
         vd7COyIZS+kEuQuJF1O0uYaN3QCEsfYClsM7avH0TL3GPfkJuSxNDRUAkYI7SLh86DEx
         I1GCGfpVSIt0Orwx/m8XuIsO8IHQFa76UMG8dbGXcnvL1zUgMRpa587ZHFmQeAahvhbE
         ftyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788989694; x=1789594494;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/5kGipgpDimrS6n35sjSMetEnTNyDyUhJUmOMfkSZ0=;
        b=UIFzPv9/owUkiBSEGT3zgDivEzyodycYxNxf4V0kEtQuhcyCAEh39agBL2LTiGAHqc
         B0LnQdL8XpqgLIKklvUhaoOmiOHZaoOLYU8knJEdyGFKPQdZe+GsnBIxOQcy8OATeLca
         pp4Jlm3qlIHECDCG7HhBn8QRBs4VzyoqRne0/4h4jRx4qr94IcZg8zWB+KXrS0921oc+
         6d8vi7uEfBuQqzNQvgiYE/BXCPoJMvoN2dcqJ6oUoT5+JUOxNds2A5OpQ/D7WfBL9uLB
         Zc/0l//gBVtfO15Kq2HqyRKUZbdpFOQpIlYNUiPYxnP/AiIcTGwAIJz60GcXlOdnkiN3
         RrAw==
X-Forwarded-Encrypted: i=1; AKwUvBzr3Y2M1wQY7VANbSaUbNzfJEQNc88LdynbYcMOBgjmycXve7c5cRqsySKrTOFQ1mvpALbcgryaBqIt2XI=@vger.kernel.org
X-Gm-Message-State: AFuF++njilBuCcGPIINek+1TvLw/t8yZKUfY8NAYWdB194ulv4noMAep
	RA351c2lCz1kEz5Uuq1xHBZsaH5OTUro+JOV4bNUD951jP9Lqn4ZvTjShVHAIuep1Anfh0cyuiY
	ZQSSBeIqVDoUsNLXjuRKRee5h7zuon+LvnGdRUn7F
X-Gm-Gg: AYBFou1dJvn9rnJBRa0SQCBANzCzjMgWPNPFKe7xN2Q6YQpdjTV9sESUtQ8SqDM7u0N
	UJ7iL9aydjQ2v1Lhllo4J/mW5QbQd4U/X9akGD9rjPOhDnzyAUR29Fwl4cCQv15+/sP56jvo21Z
	OxRReVn5Jyn6fRdWmQ/U6vSZoZ7HaWInlJ/lIDql/guWGVdTkUBIqYW+QKFeuYIG1EOUNhyYI8y
	hY9ibQEtHLWwZ/W3Tp69T6pkOY3Tju8upn84xA9yjlP/3X/8X0G0L0bmPpzoQOr1x0pqNUC6Zt5
	E1DtB27cZfeYwuS4zNDfXbVbOKfqd5v09HY9bqkf+BlxMu4N1xWthp4YKxuAxja3clZgGtYzlfn
	KkgatSA7RRRY=
X-Received: by 2002:a05:6402:42c6:b0:6a7:fb24:264e with SMTP id
 4fb4d7f45d1cf-6a7fb2427d6mr11476660a12.34.1788989693583; Wed, 09 Sep 2026
 14:34:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909193719.518517-1-utilityemal77@gmail.com> <20260909193719.518517-5-utilityemal77@gmail.com>
In-Reply-To: <20260909193719.518517-5-utilityemal77@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 9 Sep 2026 17:34:31 -0400
X-Gm-Features: AcwNN1VsK6p9PaFEMp2PujAdfTIJTXAYr2yXrUJqn7w6sJuHfrRDFgEKLUlYFeg
Message-ID: <CAHC9VhQHZ+ngFdzKqmnzBh341CGEg-jexu+QYU8=1qXK=u-x-Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 04/15] lsm: Add the bpf_lsm_policy_release
 kfunc and policy object destructor
To: Justin Suess <utilityemal77@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	kpsingh@kernel.org, matt@bobrowski.net, mic@digikod.net, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, kees@kernel.org, 
	casey@schaufler-ca.com, gnoack@google.com, jack@suse.cz, song@kernel.org, 
	yonghong.song@linux.dev, martin.lau@linux.dev, eddyz87@gmail.com, 
	memxor@gmail.com, jolsa@kernel.org, m@maowtm.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 3:37=E2=80=AFPM Justin Suess <utilityemal77@gmail.co=
m> wrote:
>
> Add security/bpf_lsm_kfuncs.c, the home of the kfuncs exposing LSM
> policy objects to BPF programs, with the first of them:
>
>   bpf_lsm_policy_release(object)                KF_RELEASE
>
> The kfuncs are the LSM framework's own BPF interface: there is no
> per-LSM kfunc and no intermediate security_*() layer.  Each kfunc
> walks the matching hook's implementation list and calls the one
> registered by the LSM whose lsmid the policy object carries.  Calling
> a kfunc for an LSM that is not active or has no policy object support
> fails at runtime rather than hiding the kfunc at verification time,
> so BPF program loading is independent of the boot-time LSM
> configuration.
>
> A policy object reference is meant to be handed over through a map
> kptr field, so also register a destructor for struct
> lsm_policy_object: map-held references are dropped on map teardown,
> possibly from a context that cannot sleep, which the
> policy_object_put() hook contract accounts for.  For the same reason
> the kfunc is not KF_SLEEPABLE, and the filter adds no per-kfunc rule:
> releasing a reference must be allowed wherever one can be held.  The
> filter itself is needed because BPF_PROG_TYPE_LSM and
> BPF_PROG_TYPE_SYSCALL, the two registered program types, share their
> kfunc lookup buckets with other program types.
>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: KP Singh <kpsingh@kernel.org>
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> ---
>
> Notes:
>     v2->v3:
>         - No change.
>
>  MAINTAINERS               |  1 +
>  security/Makefile         |  2 +-
>  security/bpf_lsm_kfuncs.c | 98 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 100 insertions(+), 1 deletion(-)
>  create mode 100644 security/bpf_lsm_kfuncs.c

While not a new concern, it has been a few months so I want to mention
it again to see where things stand with the BPF crowd: are the BPF
folks still opposed to BPF kfuncs in security/bpf_lsm_kfuncs.c,
similar to fs/bpf_fs_kfuncs.c?

If the answer remains yes, the BPF devs are not able to tolerate
kfuncs under security/, then I'm afraid this patchset is stuck.
However, if the BPF devs are willing to ACK kfuncs in
security/bpf_lsm_kfuncs.c, I'll add this patchset to the review queue
for the LSM tree.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6215fcb07770..ba816d7ee127 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5081,6 +5081,7 @@ F:        kernel/bpf/bpf_lsm.c
>  F:     kernel/bpf/bpf_lsm_proto.c
>  F:     kernel/trace/bpf_trace.c
>  F:     security/bpf/
> +F:     security/bpf_lsm_kfuncs.c

We would need the maintenence of security/bpf_lsm_kfuncs.c to fall to
the LSM framework, just as the maintenence of bpf_fs_funcs.c falls to
the VFS.

  % ./scripts/get_maintainer.pl -f fs/bpf_fs_kfuncs.c
  Alexander Viro
  Christian Brauner
  Jan Kara
  linux-fsdevel@vger
  linux-kernel@vger

--=20
paul-moore.com
