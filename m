Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794332163;
	b=nOf7vq+9XKQgRGpavPagmR92bcuBdyr2i7MEZWrWNhs0/HseQznzGUSFHFDbBEw0YwX7
	 hWUT0kCWKTKSXj6K1RJrrZuUrJpkzuAi8sz0A1W6hTu2dq9jV9L6CiDyLHwy61+q6m4qn
	 GxsBzhgp+WUtgrZWkELsveyccIO/Z21nrX5HtherFKyIVf61qpfehDJmrr9WI6NDJITkn
	 hvnzT18b7eSd+kC/gDABcQT/AO4cYbxu7hTEsQaf3ZZI8vrRcVzOplXCJ6yjZdFE267Q8
	 CnKqMepCOMaruuNzbJJ1H5bM7/vk9sEUxIJb3a/8xLLTexsMRM8BwbO2U6P09hS7wFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=nILCuq7jMxm7d27HT5TDaY5X6pBpHEWOImzMthFhFVg=;
	b=XD8iMfTGQ6nFiJgIxxCgbn9gnAxy1PjrfnwgrhFEX4w8MZ/nzgQV5gDWWxkBJv+Fe20V
	 9B7A8uVAY5K13/R+RwKDSxrgJxD6PgdIZ+TtC9FOKcZzaGEO1zTZhwN5I0y2ygbzh9NnI
	 zieMHxUyyqG3A2DlWDPo9+Uw095qMsqT0qXM/kfPaXaSyi5t1qaVO50gl+OgIEfPB8N4k
	 K9G5UZ4dul3H5bahhD0TbequOcY+h4brK3YDWgjeDuTL3xI6ei7MLXo4ao4iKblirCxqu
	 JRHzEgES9QX8/cFCylw/wkZ7obTYql7gdvnNspmm7BKhc8dGY2WZHj9qmalWa635NFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gUoU5rnk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC347606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC347606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gUoU5rnk
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4ced671398so289001466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:36:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794332161; cv=none;
        d=google.com; s=arc-20260327;
        b=rTCmjvn4/NP9JJOGfFEVIKxk2VHm/qFpDZRgdaG+DWwqzYermRe4LmJ/QGrQ5CA+jn
         6GT8VVtN/EvDY+exSFvG926vb88hVxDnNTlyJxwGDMDsjv2dtL5rqpFRLMSLBFO+7iXX
         9UXCJNlS02E6pfgE1H2p1U66WgW05yhSssQ9YggEytYnAL9jjryhwpnXS5HTpLoxg3eG
         LyR6k6QoLji1Mk0fwdne7HORwo4A8FaePEu7BsHrYS1BFfYFG5ZihOeuul2qMuPx82Su
         vDl2N1jcpyHgJ8AU+1xBrPD/muoieaPV0wCsEso5aQaK/k7iRolyQVp6ZIeC13RGD84W
         sv9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nILCuq7jMxm7d27HT5TDaY5X6pBpHEWOImzMthFhFVg=;
        fh=dpfzKIz4N71KaeLAOjzc2Ud058LyRnK1LoT1TllygWI=;
        b=c8eCCspr1zXP7S8x/o+NM49Zi8towBvKulB0j3Jen3yqpYUFRwdKJJIVlDzrpNPgcS
         U2mbbcYuKHm5OoX+vGNmTaOCWpA74LTUvgLTW8Dpw4XM8XU6xdnggkjnQ/6mrZrLUi8X
         LQkpcC40sZSYdSHR8BEzxpUocdtkI/y173hnILlk17m4Q6YdLoeeidRmP1YqV4qFOTZl
         HrPuy2+yMOe+3trXTxbRNzK9Ky4iS1Rzd3Mpuecb0J1D8PxMYvB5neuiGYqu9T0KEGhz
         yvgxUNyTr9zs1xcdCwsSCBSB7Ah0HdythdMNBkv6Pp9xmFdM+gEVeb3x9vhv23swWCsm
         OD7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794332161; x=1794936961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nILCuq7jMxm7d27HT5TDaY5X6pBpHEWOImzMthFhFVg=;
        b=gUoU5rnk5T2tZSIumF6DSTL6bWo0JNyZVhXpAjbquAG5R7hOMhSkq4uOA+O8KbW653
         Fts8GrSnaSSzRcbBQBnIWFLylRG99vBCHvgt/0S1H8wsD+Op3Jg5y0W1nS6j/ZVpTzTv
         Iu4hkkxsDO88vyd3oFKaEH6afo0GVjORHAcsNbqZWA21Wr+IaqjoN7F1feirtPAytxds
         Lje+n1D7P2ulhHQ1K9hbyJdBUFdArTkBZapnl14pT8oDkkJEoCBaUJaaM5FzDmy8JVYa
         n6ZaQulYilojEEcng/a0bY6s8ST0DD/qdrVs8iErHBXcbdZaio15Ayf+rj7cLOrJHY4N
         f+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332161; x=1794936961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nILCuq7jMxm7d27HT5TDaY5X6pBpHEWOImzMthFhFVg=;
        b=TCst18fHKiMFHzPUczmh+DDENXbNBvgf0/XLXW4VoXNxxWIVKXTmmiimgb1lUro8Cf
         tN0Inz+KDrkSSCDvbxtBK96eclAevhERHjfPRAkREtAm11A+35PGEWRssC0UNxQRneh2
         vYY584ARaoxAI1+QaNVQhlsm1UrUS8+SEI9WM/TQlRzB+/sTPi6prxej/RjITmD0FHQi
         vhMxA0KKpGQugiGtu3HJIRIlat/OvzZpQiY16I83+hYqqdZZRGsA4yxf/1T/ZUj5WUNg
         afm39srraDEeCNiOjIJqIpkCoQkVrcKNx+BNLt9+njkd4spP7qeYtCJDLgEAdVf0leTs
         9hJQ==
X-Gm-Message-State: APuU4Z/NJOpYwKEf4avZMjAJSvi1i7uC1taOnhCsPYtN9+u6Xcm9ixny
	iqbk9UTgsCQs8+ul191mwZOUG+WBgnEnH5ikoD5vluD5EmQlEPTiQS17zZx3+htcEpEnupTJXCp
	dxUl88yuc9+ay+kf78IPdbRKu2wghlMN3fF0qhXQS1Q==
X-Gm-Gg: AYBFou0wsmk696clV8LyVvmn9VJXNr2dpRnpFjchczUNEZ+/IMp2YzAHnMCiWlDPw8V
	oMJOaZGZprrWDbfX8NIUKxZ62eHkiiWYztjrpnZGbT8jR/rgaMPNEheHQMIvPjX0Sb1rognW73U
	PJQfScy6DEM8b8OHNAbiTp56m2WJAb5HRYMGYJD6xLXYCiGVaxm/AtOLKaIoxGlx4EbriGp/KDq
	l8dJfDG5mGec7WwKfyAmzYtO31h3rtjPicEkqInLt8TmFpN/JCbpvPhK6qUhyXxs8KmGlcCuwun
	Gzu/Ddcohug3TWRkUwilGHWyjxviTRIibYKS6HiwTrcKyJ6c1wKZPmSCx8CIdBqUwMxPlGxxhAR
	Uakn4h52qwv4IpSQC0ook+wXcCz48MGsJ56Q1XyG6NuGPY1hhK0hzro7pCajXZAKhXaRZzQ==
X-Received: by 2002:a17:907:9488:b0:c49:cdc8:10cf with SMTP id
 a640c23a62f3a-c5049647c0emr274411866b.40.1794332161182; Tue, 10 Nov 2026
 09:36:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106160621.347228-1-marco.crivellari@suse.com>
 <20261106160621.347228-2-marco.crivellari@suse.com> <au5RmN37RlOCp2m9@pavilion.home>
 <CAAofZF6_JpSDNSKUuePiJx+74tbRH8vJ4spyNGp9KbjFPrbA0w@mail.gmail.com> <avMdOa44c5qvryuH@localhost.localdomain>
In-Reply-To: <avMdOa44c5qvryuH@localhost.localdomain>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 10 Nov 2026 18:35:49 +0100
X-Gm-Features: AclHuK-jUPcZJAEQdgEP5KvCYJlT0f9Lp6j9m5kPRh-4aU2yPsCfZVUebR1cMJU
Message-ID: <CAAofZF7KAnd0xpOcgKDs6yDL9vmbON3xRAK360BBuzEpwJzu9g@mail.gmail.com>
Subject: Re: [PATCH 1/3] tick/nohz: Re-evaluate the tick on polling idle and
 on user entry
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Michal Hocko <mhocko@suse.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:33=E2=80=AFPM Frederic Weisbecker <frederic@kerne=
l.org> wrote:
> [...]
> > With the hunk, the stopped tick firing for the first timer sets
> > TIF_NEED_RESCHED, the polling loop exits and the tick is reprogrammed
> > for the second timer within a few microseconds; the 10 iterations
> > captured take 0.92s instead of ~18s. Without that hunk, the CPU stops
> > spinning on an unrelated event.
> >
> > So in my understanding tick_nohz_idle_exit() program the tick only for
> > the earliest timer; when it expire, the tick is stopped and not
> > rearmed in tick_nohz_handler() (HRTIMER_NORESTART). Without setting
> > NEED_RESCHED if another timer has been queued it has to wait for
> > another event that set NEED_RESCHED.
>
> Hehe, you're right :)
>
> Let's try another strategy then. TS_FLAG_INIDLE is what tells nohz_fool w=
hether
> to manage the tick through the idle loop or through the IRQ exit.
>
> So why not calling tick_nohz_idle_enter() on each idle loop iterations? T=
hat is,
> from cpuidle_idle_call(). And call tick_nohz_idle_exit() right before
> cpu_idle_poll()?

Aha, sounds good! :-) So INIDLE is set only when really "in idle" (eg
no polling).

> Then you can remove tick_nohz_idle_restart_tick().

Should we remove only the call or also the function and its declaration?
I'm asking because the call we're going to remove is the only one present.

> Just be careful: tick_nohz_idle_enter() and tick_nohz_idle_exit() may now=
 be
> unbalanced. If TS_FLAG_INIDLE is already set, tick_nohz_idle_enter() shou=
ld
> return early and tick_nohz_idle_exit() as well if !TS_FLAG_INIDLE.
>
> Also IRQs may now be disabled while calling tick_nohz_idle_exit(), so it =
should
> use local_irq_save() and not local_irq_disable(). OTOH tick_nohz_idle_ent=
er()
> should always expect IRQs disabled.
>
> So the purpose is to move cpu_idle_poll() outside the dynticks idle logic=
, then
> it's safe against nohz_full timer management, the tick keeps being stoppe=
d if
> possible and it's only restarted for dynticks idle.

Ok, I think it's clear.

I've already started implementing the changes. I will send v2 with all
the changes.

Thank you!

--=20

Marco Crivellari

SUSE Labs
