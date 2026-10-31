Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461055;
	b=cT5wHInt2O3uUuFPCLZiDnZZ90L4ejHJ/c8vLEjwG6gIhYhk01WZ5x1+1PFqqNquX9pi
	 U87TileHpdQ2kT4L4YmiQFT3A9rCkab3LWSN5vL94FTZTuL4/XdsC/LL1bkANupUcqDlV
	 GUr9N57dS5gBHP0fllwN/6xhDJAbwDkMd9+toDwCYlTQuMO8Av01CQ8mtjWCYV1l9p68K
	 Qh8CW4xvX8n2TJy2ulkAl1ilyDS09hXG/4nlu0fuvR+2FJj+0a9p4fGeN8XX9+Odzpv+A
	 UJu8I8M6QuTTSeC+TmHqT82hu/mXFi/R1HivoY6mLE5987iwfeRZFFXrieqVbtZHWbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461055;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6Jqu9rn/CzM4T20KA7Fgigdm09JFg2/dWVHGbTJOtMk=;
	b=kOizK3Sm65YgvQ7q4avz3Iu69uhrjgT7Z+yyVjY6Im7hNr53fclesmHGdR9dlBFywG9Z
	 ve58SlgNhk6l1DW7IoGpOmR0K32U4l9K3OuORkHQXQjPGt7gSPDCCsXolryxlAOBHo6r+
	 76+VFF6B8CJwcwyOsszhX6LuNGecrLIdQZveSDfetjqy42P+tOpsih1p8lNhael5RZt1/
	 DsNB99N+ns4biN1AGaUkAtQUM2maI19f6qICqom6yF01hbXrybi6pJh7A/qneYjnExx05
	 sZig041G9WHagE34EQHg68YvRkTVZBUrfHsXVuMY4Mq/eLA4NwbtVDoKiyMUv0KOb6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=r56fBCaZ;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF72606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF72606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=r56fBCaZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6Jqu9rn/CzM4T20KA7Fgigdm09JFg2/dWVHGbTJOtMk=; t=1793461054; x=1794325054; 
	b=r56fBCaZxj8+a2CUkBZEWZ1grzZZqPnWA5vfjvxburGyQ3vqX0yMJrX35muwb01cCyvNKRf+2gu
	VG9+cfdyJ+gqE2T3plB+7bFGuXoKXUBaXeyFa809+z9QrpeMhYi1qUBBuTe/roPfRIAAp1iBP5+09
	8LRnM42OiB8+6V9kZqCR4dYRUdXsZYPvUNRw31KC2wDI8rGmmS5cXJPsEWLmldKXcgox2xbArm059
	x+bRuEUGlHIM77PTnkMR1IuVgU5q+kUQP1AAYGX/3h683OKkH603kWYqtdO3I44xfWpiIWIZSv6MM
	BraTbrNMrgWufUyGVwF0vvmFhcrmP/SNeRmg==;
Received: from mail-dy1-f170.google.com ([74.125.82.170])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xNB9B-00EXLW-NZ
	for linux-kernel@vger.kernel.org;
	Sat, 31 Oct 2026 11:37:33 -0400
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3514b90bb89so3264476eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:37:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzmmvnIF6UbeCRiE6CJl+FWLQ9Q748n6QtAovwYRyrW7u2rm2sEoB3TjzGHMqJCmtpnQ8Ce9gTQVmQ2n7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6I+N3fjPXXUc3n2cmB2Hp4mNPYBf1sq3Hq608t99wGLleWOjK
	BaEx8OxuT5Muos1NxviHvlhKsl5cZUMzJ8p49+0hpceyfOfsbc13YgHheYW1pyGCLQ8EDS3Q8vK
	SJSTafK8mV3Yf/KeTzWLNTi7nmcPAqC8=
X-Received: by 2002:a05:701b:271a:b0:187:c940:21b7 with SMTP id
 a92af1059eb24-1ac5c55491bmr6337360c88.9.1793461052770; Sat, 31 Oct 2026
 08:37:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027025055.842038-1-nickolai@csail.mit.edu>
 <auM7-dpXdaNZQFFc@redhat.com> <20261030-specht-grinsen-vererben-aedb50f4c96c@brauner>
 <auXxUSMHCh4vA3yV@redhat.com>
In-Reply-To: <auXxUSMHCh4vA3yV@redhat.com>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Sat, 31 Oct 2026 11:37:21 -0400
X-Gmail-Original-Message-ID: <CADGQE7EWMSsUkohRkT9x4nnL-_Wnh3uKmpavKtveAdhyC7wbqQ@mail.gmail.com>
X-Gm-Features: AclHuK8CGcBEFBjQmtWiP_JeQv-JykBoBny7KQj2qbCxPe0GCdtv5hPTwbj-PWg
Message-ID: <CADGQE7EWMSsUkohRkT9x4nnL-_Wnh3uKmpavKtveAdhyC7wbqQ@mail.gmail.com>
Subject: Re: [PATCH] signal: fix lockup in complete_signal() racing with mt exec
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for taking this over, and for the better fix!

On Sat, Oct 31, 2026 at 9:47=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> Nickolai Zeldovich says:
>
>     kill(2) of a process while a non-leader thread of it is in execve()
>     can lock up the machine: complete_signal() loops forever with siglock
>     held and interrupts off, and de_thread() then spins on siglock in
>     release_task() with tasklist_lock held.
>
>     The curr_target walk uses next_thread(), which wraps from the last
>     thread to ->group_leader on the assumption that the leader is first
>     on signal->thread_head. de_thread() makes the exec'ing thread, the
>     last one, the leader before release_task() unlinks the old leader,
>     so a walk that starts at the old leader stays on the new one if
>     that thread blocks the signal, and never gets back to curr_target.
>
> Change complete_signal() to use list_next_entry_circular() instead
> of next_thread().
>
> Other users of next_thread/while_each_thread/for_other_threads look safe,
> so this patch only changes complete_signal() to make a simple fix for
> -stable. However, in the longer term we should update next_thread()
> or add another helper, but this needs more work; next_thread() should
> work even when signal->thread_head is empty.
>
> Fixes: d639cf4abb4d ("change next_thread() to use __next_thread() ?: grou=
p_leader")
> Reported-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> Link: https://lore.kernel.org/all/CADGQE7EusFrrSoBnhXhdE20tZJrp1EDe=3D262=
3mS8vEMY9hn53A@mail.gmail.com/
> Originally-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  kernel/signal.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 2474507ac92b..bf5518be67a2 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -987,7 +987,8 @@ static void complete_signal(int sig, struct task_stru=
ct *p, enum pid_type type)
>                  */
>                 t =3D signal->curr_target;
>                 while (!wants_signal(sig, t)) {
> -                       t =3D next_thread(t);
> +                       t =3D list_next_entry_circular(t, &signal->thread=
_head,
> +                                                       thread_node);
>                         if (t =3D=3D signal->curr_target)
>                                 /*
>                                  * No thread needs to be woken.
> --
> 2.55.0
>
>

Reviewed-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
Tested-by: Nickolai Zeldovich <nickolai@csail.mit.edu>

Nickolai.
