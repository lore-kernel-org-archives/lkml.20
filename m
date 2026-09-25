Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF9233936C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790366453; cv=pass; b=nhTHv2K0DDzX8hJ1crKfg5O9vyFWR5VY7BwDX/Auf+BFaBzvNucoRrJzTE2aokWnYvHkX4IIvpVU/FP91muFJn+yu8LBJnDm9BSZWWskZQNzSbojriNwaJOcJUXyq19RNqGuLTskIc3iE2emncykXFAC9AjBZTpZke067NBitAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790366453; c=relaxed/simple;
	bh=4FQImKMswil5Yf4qU3iL4HP635uKtAuGj+q4LcLbdU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nd6PK08G0M1Xj97mnlazcY8BfREBFv9aBMPDSkWyxlLLH9TyGiw2zd/MFrMjmYH7DAPjYYiqnXDU1sZ/QcO3epLgRrs1P75GX+0ROYJHLy443WybB6gpNJyEjBDpnrh2M64QcN3CIycZvFGI4/1Vo/+loE0aCCnSp4RKsFzVOSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=ASggcdiF; arc=pass smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="ASggcdiF"
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A6A283F289
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1790366443;
	bh=wG/i9tiTp8ePesopRc3qMjTf5qhlfbVXuwOQ1MTUCQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ASggcdiFfS70gaeC/3v2waOXAOULhbL4KLEY8m+KX7faUgunvnCQfOpJ8fgg9JKCv
	 oFS7SQ2/Z/biB6PDPslnRniAcdAX4G1ZpbTFEKfS4F7vhy6Zszeu+2ni8PQeSvKps7
	 OZjgaxnn3u1IFf6T38QCq9xkvywsQUz/E1BsL4Q5YLRWCtoPVVgPQoLwePErkQA3sK
	 RPODYvweQDkXBr0hC9Fye6Ivmpvl5AGDTG55SjlGP0khnlYeGvg51byih0Dv2lmZL9
	 XLqPNPDn+o9uw7Itb4M17TNiGyPKHAI/8T7vkDY+ptvHFszHKJrRqACZOWTBWHoctf
	 7PFvITiiHdhBQ9CeYEiMP+GttIfX8GmKZq6P/OXEIQ+6a60UQ6jKvP1iJxKaKRIcBl
	 qlBH9xDpd1PjWpDi8NQfAW9npwITC8kDD+TVorcAbgCBvQ8eaUPCjg6TSCAp1oA05v
	 BfjqUHnpcdVC5uYkwIpcaSCLC2d6Fpd5tD5CWHdZyupiJuSVdo9SuuBCJdJTjzodUj
	 yFtbRiFvEp51sVdGkICrS/31Aj56xw19kfhRL0Yh29pL75IInPeZr4AAB61XeLyuE7
	 pdVD7msH19/o8yakJ1munNwu73SX6YJHsiEZ5rsAAMkUjFbRzXRVxSV9RRr9pfAZni
	 BAmuv5E8oz7lBrisCDCo1oOc=
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67415fd800fso1034468d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790366442; cv=none;
        d=google.com; s=arc-20260327;
        b=A7eJGAwNrxI4xEJ//UBCJQcwSB/Pf1oNhSy1ILIQoa8gxTJ2ZoM2xml75SKDCi760i
         Sx4Fl+uRdSUAIHgtWrJLtoCc+L6qtP2gPgfX25+uQ4zk8N6yLtwa0odE86RrTBR77ucG
         bXixjlpHTfYECia2yAS0ct7cjxT1AqE/T/9tKpOCfhKjJYxQGlAlcivXl2K8jaZBc3Gf
         CkfdznMFkbiK7CrV2m1gcOYO6ax0uzcQZvAfN4/NkmA6Xoc5q5IzlMeQKOYcnO4MXmDu
         71XtPC2kE734//s/jPLzfe+uRcoo9FCaxSX8JnjJ1SqVbxE5lGqa7aSiHPrE1vMamLpo
         L0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=wG/i9tiTp8ePesopRc3qMjTf5qhlfbVXuwOQ1MTUCQ0=;
        fh=atmOkczZp+mahHwtTIa4YIYT/nU1bH06pTONpzf0apI=;
        b=o2Na64y7PQAH6xpTtznM/KhWhGYMd2atvvfImmBJLUd9LwMILraMv9MqRmoLlUfe1I
         /r/QtWyN/EkmtiVbXzmAHZyo0S9YPAg0MAiqH42I/79i3EqJXWzQOkf+5B+0oWZO7lrg
         umlkhyZthcqjI1hHXh5Dw2h5OjOPf/rdacvC+Z1Erwm19Gftf8C5fhU1jJO1oNxYrqfV
         f/3ITN4vJsU4kYrknDFT6KMOM+vrPCtgFUhG7F50swX7bADRac9eBu3llAflslnTjAiV
         SJzMge/7LspcDXsweuwmNroiAxlEvHYfJegD/GcSVWxDCOSdLhBygU1clJhRv26FQZWf
         rAjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790366442; x=1790971242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wG/i9tiTp8ePesopRc3qMjTf5qhlfbVXuwOQ1MTUCQ0=;
        b=wpSkMnylk4k9e5Iq3SZ0zsh/H40JNgXDxKPYxfh9/wmVOyztkYsz8TzuhMLG05wN43
         HI1ol/qf6N4OHB0+axzrtcvX0RKKTP0pvhKjjKkIS0yZLL9tM06U8WTco45DeDbxMr7H
         0hQurwdNHPRnVYrPpqr0Jl/VfBugSnK/+P+w05sCPxWzz7YpChnWzSFTdNNt1m/T97Mc
         U2TJEF9lrql8veco+107ZhjsHdnUNV2/xb9LaXUBUxBe/XmU0rZ1hKRf14Z4BhnMb3Qp
         oHBlHWl3X7+FArOntKTt/p8JaWJ11UF3pVt4RgVG7sGUTLeWArqiYZX2dzFksteQ3kOq
         fS7g==
X-Forwarded-Encrypted: i=1; AKwUvBweafzNnpr+tvlpsCe+4gVW+qkputK1aTwoxZgHsfqh0DazkbTKlUDnHudI9nQtotzNCpfFJTttFHnDW74=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9L5phXCQj64/fUTag5ZbQMIxl2ihHmjXDa8Kc/6wJ0hjbYky2
	8jErDCq8nOFadkPXZ8Jf4l+3AqmqGI8EXL9eVSKluoiC4e/mxw8foT/fVa0zsLwNaaf7BB5GrJW
	s4U91rZ2lnHkR8LM2hT/B1BUatA14154wCNjFzvxJ4PPFcD6UKAhCA5vGBj0etUJ5RgGeRQnKsF
	W4uXBXbsB5nLOmWigyLkQ04oeQBKo29rtUzZoullgx/JuovWTobFHx70s+
X-Gm-Gg: AYBFou2qec2rc7QJXfkh3xnLCEbmFzzZjpt+5zzqbjNZu+VxX19EUohseEmSJUU6xDu
	wYDLM202YXiJr0VwbA+U6d2pBOFtbcKLCxm/CS8Wlg7sa6IesvctBbsRpaZTWcJ1CzqYfO5ro6h
	NXwTFVKr5T45+fweA/klZfqLZr0tkAhyOAc95R1GdBLMgG8CiIa31JFjMZayCuDQl+jZywP926U
	4bUeckcZRQiesmRPUyWz1RE9UgCakHXH39comF61sQ=
X-Received: by 2002:a05:690e:1349:b0:674:1e39:446 with SMTP id 956f58d0204a3-6741e390a77mr479899d50.39.1790366442333;
        Fri, 25 Sep 2026 13:00:42 -0700 (PDT)
X-Received: by 2002:a05:690e:1349:b0:674:1e39:446 with SMTP id
 956f58d0204a3-6741e390a77mr479884d50.39.1790366441838; Fri, 25 Sep 2026
 13:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925193842.1208132-3-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20260925193842.1208132-3-Jeremy.Jean@oss.cyber.gouv.fr>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Fri, 25 Sep 2026 13:00:29 -0700
X-Gm-Features: AclHuK_mOIA3FwKExSadHRMkzyxNL4pwM7I_MYyeQT-_8dlrK5CScnNC01wdXIw
Message-ID: <CAKCV-6u01ARuWLn3snV6fo=k-3LOVNdEkMux3NQmcj4X+vYprQ@mail.gmail.com>
Subject: Re: [PATCH] apparmor: check connect permission for SCTP
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: John Johansen <john.johansen@canonical.com>, 
	Georgia Garcia <georgia.garcia@canonical.com>, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 12:40=E2=80=AFPM J=C3=A9r=C3=A9my Jean
<Jeremy.Jean@oss.cyber.gouv.fr> wrote:
>
> SCTP can start an association through sendmsg() or CONNECTX. These paths
> call the SCTP-specific sctp_bind_connect hook instead of the normal socke=
t
> connect hook, but AppArmor does not register it. As a result, a profile c=
an
> deny connect and allow send or setopt, yet a task can still create an SCT=
P
> association.
>
> Register the SCTP hook. Ask for connect permission when SENDMSG_CONNECT
> or CONNECTX creates an association.
>
> Fixes: 56974a6fcfef ("apparmor: add base infastructure for socket mediati=
on")
> Assisted-by: LLM
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> ---
>  security/apparmor/lsm.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index d502ad0ac26f..dba078c73abc 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -15,6 +15,7 @@
>  #include <linux/mount.h>
>  #include <linux/namei.h>
>  #include <linux/ptrace.h>
> +#include <linux/sctp.h>
>  #include <linux/ctype.h>
>  #include <linux/sysctl.h>
>  #include <linux/sysfs.h>
> @@ -1405,6 +1406,18 @@ static int apparmor_socket_connect(struct socket *=
sock,
>         return aa_sk_perm(OP_CONNECT, AA_MAY_CONNECT, sock->sk);
>  }
>
> +static int apparmor_sctp_bind_connect(struct sock *sk, int optname,
> +                                     struct sockaddr *address, int addrl=
en)
> +{
> +       switch (optname) {
> +       case SCTP_SOCKOPT_CONNECTX:
> +       case SCTP_SENDMSG_CONNECT:
> +               return aa_sk_perm(OP_CONNECT, AA_MAY_CONNECT, sk);
> +       }
> +
> +       return 0;
> +}
> +
>  static int apparmor_socket_listen(struct socket *sock, int backlog)
>  {
>         AA_BUG(!sock);
> @@ -1823,6 +1836,7 @@ static struct security_hook_list apparmor_hooks[] _=
_ro_after_init =3D {
>         LSM_HOOK_INIT(socket_getsockopt, apparmor_socket_getsockopt),
>         LSM_HOOK_INIT(socket_setsockopt, apparmor_socket_setsockopt),
>         LSM_HOOK_INIT(socket_shutdown, apparmor_socket_shutdown),
> +       LSM_HOOK_INIT(sctp_bind_connect, apparmor_sctp_bind_connect),
>  #ifdef CONFIG_NETWORK_SECMARK
>         LSM_HOOK_INIT(socket_sock_rcv_skb, apparmor_socket_sock_rcv_skb),
>  #endif
> --
> 2.47.3
>
>

Could you also add a regression test to the upstream userspace repo
(https://gitlab.com/apparmor/apparmor, tests/regression/apparmor) to
exercise mediation of SCTP connections?
