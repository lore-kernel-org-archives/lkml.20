Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780063C8C49
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776959; cv=pass; b=lUEX/o0nSTvuwSh7LoUJ+VjNbTrl+ZULYyIkn2zAjMGpEy9WbT5SK4DnOd3oQOIz3r72ct/eHhzDyqAbpdh0WsfCPZTOtJ061XaHIR1rCnw5+pDD7jbo69KLuoB/FvdkShwPjCKHboVu/kOz3k82RAqkoSvvwT62ZowVRFMxlXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776959; c=relaxed/simple;
	bh=/pPCcmo1c+POG45z52X2BnuE0gA1n9usXKsFAtkEfko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jkECkVRSwiq4CLlmjHbrITW+Q3A2m3o3tth5jONoKiGqJUHO2H34jGs4FyLT4gJIriWDR8zcDE3RAI5P5zKBjDhwXqZQOdtGluk/itLz7XRrDAgTNWfWv+vnX58ZIYQMxwHjmRtWJ6ss9njjIZHz1iqxWUNJJO+NTWrp7MpeQ/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=PsWOR6uc; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="PsWOR6uc"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso5515904a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788776955; cv=none;
        d=google.com; s=arc-20260327;
        b=d82QZgKb3nGHD0m7Xb97fPAwoTsPUODDpscXXHH6BKMmvOiw7Jv+aHhTUpmv0ZcPUm
         ImmIxIfZQd5bF9eGsddTW7HqlRkiKseSPB+ugdTmqgZ4jmWTXc/HDkVLXxGjrDVRISwb
         A+Fj2K2E2vsNxuUSyqnReAu66opGrlwZEbhrwOiECt1jdxx1FqsabMVBaIKwYVVMlrE2
         bIzYHYQh+9TLUbA95ULFfR9aFGU95Gd37SsHWsJ47b9XQazJ9G/odShlnppgseLsZfEI
         6wkFwbnuEimAPXJkA16NiE5KwInEjp/wR+n80gzDTlzVVyBRBxosqBbk7gvsXdK/VOJi
         Fwcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9774GFxLNjPLVY7G1GzEmZBrWX8xiW+2/RWdji5WoSE=;
        fh=yRlLRGPAONI1NgGm9QcDdxsCFk7Ey2vbaMBnuNt/LgM=;
        b=M7NRTjAW3s/ITrbDVr7RA2AOfBNbRqIeC6rixuD/bWOaEZCBqL1bSE4+Yb+ri1Gf+j
         CqZUZl+jCYJurOfrStTsX9OIy10Al+KoVuWVLXpri91olLtW+chBkHsyUwckvU26NbFP
         ZANjonUv1HEYHUKLW+2/XpbKO+1AXnfg/WXmv4GZf2/tvPkpvtyFgqagaGjyYfiG4JZ8
         DkbCE6R9epu7XPf5qS9nvzE/oKrHtaiM1jeOc+x+jZ4dSZp2VebAydVz38btMvW5i7d9
         YZJqrbBytEpfP7jnIjMJIy9zHNEN5on9XEKd1T/DLdtW7l0isagmsLEdvoTVshhwwkMY
         fktA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1788776955; x=1789381755; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9774GFxLNjPLVY7G1GzEmZBrWX8xiW+2/RWdji5WoSE=;
        b=PsWOR6ucWs5LNiilAtlGMAErC1D8j4USrRdAR5Ndh9HolAQA27ZvKoBb+NIf8hUjL/
         YZhLgdX8YzmlOLFbD0FH3lppfDuU3JSWwrlpWbCLX/qs9LNqQaAdE7qUC7POycAKqNCM
         cuK7x5WfpYTmtmwE0EOlAiBlFDlrCe89Vmbsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776955; x=1789381755;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9774GFxLNjPLVY7G1GzEmZBrWX8xiW+2/RWdji5WoSE=;
        b=e4hI5V4UOzVoASCa9BOKdnmdKVEHLcHXCnhK/Ambhvj6x1WzJVEpQSHth+QJ1He+Fg
         oxdVFP880tP7tpqwLN23/7qZramvUFF96GaxuHir1yenrchguwDec/68ERemZyMMRdBU
         w2bi2353Ex876jstWuyZ5gT9neQg26uyfOw94N+jUcAZGYnsZNGAKcCFtGQo3G47704U
         CMYPvvUfH8riPNuBdGrRnrw3xMnqdRql3wa4SedIPPPkKqhmFzPWBIoRbnpb93mMtzWx
         QAuSVPdx1tCaKijYopsGkkEA5GKe73+ehjsJ7ZBUjam9GlB4wux3tjap+heKuy9IZZcc
         pP/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzC67mNtoYhBTwA5pdM8MsAiLQeHWhby7VXo/n94l6pWFJucR3Asd47ZlABxBeNGBC+tNzNVkEBexUbx3g=@vger.kernel.org
X-Gm-Message-State: AFuF++n7O2uovTPf8p0Hnxj84F0B/1KQMivSLwEhIc3c361P9t89NHw2
	qjdC0YDvyKVVAr2kSkp+4rf6rR3VC1e8Fie3CtdR+P3BEPHni9XgXdz08oBhBbYper2exmo0Amx
	/evIS7B0oTaP79uVrD2lRuvtAXEnccql5XDJ3/Z8F/w==
X-Gm-Gg: AYBFou18D2Lbv1PnZwc3piCgw8vRipuMNJ5f2GQj4agH/ETs6pFJ/I8fBZQuIkVxtB/
	b0WAiYGvpxfIoStK3HlhoL0OLuMpaVluzvc5SnIgS6ttFs/OhNl9r7DBRkVruf50BYBV503gKeS
	+RlXpE86kIe0fhaTwrvhL+uYYesDe2VCJ7UcrPegNf3CuYl2Yl87E5yn8PLTaUUsBZt4bmuWDlP
	gHBew7vo8HRE/Hh6LYVI0VVY12HHtmPlwdm4/4YLS+XR99n3XD5xIDzFFz80Fy45I0Dx+9d4E1O
	7i3hK7f/Lws8jRLkqgGot7uVmNq4hH9y1hzDgwm+LjJxhxgHtdEBW6tJmzptw/13I5YCJh2+ERk
	=
X-Received: by 2002:a17:907:c705:b0:c25:62db:772b with SMTP id
 a640c23a62f3a-c260c8b141amr822489666b.7.1788776954579; Mon, 07 Sep 2026
 03:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-work-unix-passpidfd-v1-0-70cbfda0c7ba@kernel.org> <20260831-work-unix-passpidfd-v1-6-70cbfda0c7ba@kernel.org>
In-Reply-To: <20260831-work-unix-passpidfd-v1-6-70cbfda0c7ba@kernel.org>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Mon, 7 Sep 2026 12:29:03 +0200
X-Gm-Features: AcwNN1WlWJvrJ2vB2H7lv9qLS355J43HWilCGyv40E-X7Jm5rVAZmAIMZ0pzCnI
Message-ID: <CAJqdLrqS==7gt+bshJ8DzyaqVek_57fqUnT8EFCAboZF1ufcCA@mail.gmail.com>
Subject: Re: [PATCH 06/10] af_unix: record the pid of the connecting thread
To: Christian Brauner <brauner@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Mo., 31. Aug. 2026 um 13:21 Uhr schrieb Christian Brauner
<brauner@kernel.org>:
>
> Currently only the struct pid of the thread-group leader is recorded.
> The identity of the actual thread that connected to a given socket
> cannot be retrieved.
>
> Add the plumbing to make it possible to retrieve a pidfd for the
> connecting thread. Nothing uses the thread-specific struct pid yet. No
> functional changes.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

LGTM

Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>

> ---
>  net/unix/af_unix.c | 30 +++++++++++++-----------------
>  1 file changed, 13 insertions(+), 17 deletions(-)
>
> diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> index 335abd23c9bf..d01ee76c8026 100644
> --- a/net/unix/af_unix.c
> +++ b/net/unix/af_unix.c
> @@ -743,51 +743,47 @@ struct unix_peercred {
>
>  static inline int prepare_peercred(struct unix_peercred *peercred)
>  {
> -       struct pid *pid;
>         int err;
>
> -       pid = task_tgid(current);
> -       err = pidfs_register_pid(pid);
> -       if (likely(!err)) {
> -               peercred->peer_pid[PIDTYPE_TGID] = get_pid(pid);
> -               peercred->peer_cred = get_current_cred();
> +       get_task_pids(peercred->peer_pid, current);
> +       err = pidfs_register_pids(peercred->peer_pid);
> +       if (unlikely(err)) {
> +               put_pids(peercred->peer_pid);
> +               return err;
>         }
> -       return err;
> +
> +       peercred->peer_cred = get_current_cred();
> +       return 0;
>  }
>
>  static void drop_peercred(struct unix_peercred *peercred)
>  {
>         const struct cred *cred = NULL;
> -       struct pid *pid = NULL;
>
>         might_sleep();
>
> -       swap(peercred->peer_pid[PIDTYPE_TGID], pid);
> +       put_pids(peercred->peer_pid);
>         swap(peercred->peer_cred, cred);
> -
> -       put_pid(pid);
>         put_cred(cred);
>  }
>
>  static inline void init_peercred(struct sock *sk,
>                                  const struct unix_peercred *peercred)
>  {
> -       sk->sk_peer_pid[PIDTYPE_TGID] = peercred->peer_pid[PIDTYPE_TGID];
> +       memcpy(sk->sk_peer_pid, peercred->peer_pid, sizeof(sk->sk_peer_pid));
>         sk->sk_peer_cred = peercred->peer_cred;
>  }
>
>  static void update_peercred(struct sock *sk, struct unix_peercred *peercred)
>  {
>         const struct cred *old_cred;
> -       struct pid *old_pid;
>
>         spin_lock(&sk->sk_peer_lock);
> -       old_pid = sk->sk_peer_pid[PIDTYPE_TGID];
> +       swap_pids(sk->sk_peer_pid, peercred->peer_pid);
>         old_cred = sk->sk_peer_cred;
> -       init_peercred(sk, peercred);
> +       sk->sk_peer_cred = peercred->peer_cred;
>         spin_unlock(&sk->sk_peer_lock);
>
> -       peercred->peer_pid[PIDTYPE_TGID] = old_pid;
>         peercred->peer_cred = old_cred;
>  }
>
> @@ -796,7 +792,7 @@ static void copy_peercred(struct sock *sk, struct sock *peersk)
>         lockdep_assert_held(&unix_sk(peersk)->lock);
>
>         spin_lock(&sk->sk_peer_lock);
> -       sk->sk_peer_pid[PIDTYPE_TGID] = get_pid(peersk->sk_peer_pid[PIDTYPE_TGID]);
> +       get_pids(sk->sk_peer_pid, peersk->sk_peer_pid);
>         sk->sk_peer_cred = get_cred(peersk->sk_peer_cred);
>         spin_unlock(&sk->sk_peer_lock);
>  }
>
> --
> 2.53.0
>
