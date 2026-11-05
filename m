Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793879658;
	b=DzlIvophn+KWKn0wDm+2akw2TflDsKNjotUIhnhL/l5wf1VtAeZiM8xptj6QWPnZZ5qX
	 B+ZnI/YuGitX3OOcsBAQIb4FQjn1/2CqPE2sI0EV4uJsEw9t4pCnGE8mFXXCFGMl0/w7B
	 1ltHyyZbv70d2QL60QjMTzMB7K1NSoaoqiA+4xsZMAp6GXy4ZrbNYkjRFXj/ko9QxaLa5
	 JIflQ9EOjsv9DwzoSCor1km2XBzfbMfQZs11trqKO4P0hqVdYkwv6nPlAuGj8p4ukBzRc
	 YtuJ++M+ERLIeOH/Y7mVua1Zo5xva1lIRFnvpELqGipE07WVe1YRANZS9Dnc7ohUp2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N+3m3vZOzUEGlHuUM9OVDnQH8LQ3Rban+sBZHH4tE00=;
	b=wWtBEnCuv1PkPEIM5JiFwnIyRybdpYz9GHg1CyQpQcMmRj745em6NmGPLNFDw5VJ5l1l
	 Qgcjr3P/0MwbI6RyobTGXQ9uyItFmy7I8bZjWJNtNUo7dKMURCj0AkgFCEUBau2LrFMhI
	 u8ZX4KD0JjmFSV36mx3Ffm/IZyfbXdJf6ZY7ZEgU9Ua+kJ0bciNuTi8oH/RcZquLdE1WI
	 XHLVoIWVOxV0Ud8aYHKUZTRozMUfndmbkGheGyXS0+XUnrKtoUGbbN42StmVlFVwswn6W
	 wNqPhdTc6K8bFVJu/VbTGQdBvSB46MnV2KeB5abZn036r1pOeZE/UmeL0DNYQmAsNKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DCdUCa5x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF10606A33E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCF10606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DCdUCa5x
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so1870475e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:54:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793879656; cv=none;
        d=google.com; s=arc-20260327;
        b=H/uuHEPoby2H4SeuJjFqWEjDy1gA8eB1zgGi+3A2tgiunoNkI5TYAH4GewtJXw0R66
         PlRQpR9GbW2vV/kWsdkrk91oHUFrNV/qOCA36XdRnDmXy8cLXrK+h2FFN/HajU4HC7fA
         CJdf/WyvldOuR5XMePpysdYMQI4S/E5QbfxPP48k00nRFXgIDzAiCCozSVuOrCT5jFrt
         eUsJwpEB2lJ8cPaLipacOOtlIKZ29MeMYo0pMcDkVvZeT5asHNlRg12fk8wM5BjvP4aK
         gESnXKFTtdMWJd5uyQduDgvwZ2ZWsrtaPuz/cHIWUf++WnK2pVGsi33fSXxMs7iuZSpx
         SBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:dkim-signature;
        bh=N+3m3vZOzUEGlHuUM9OVDnQH8LQ3Rban+sBZHH4tE00=;
        fh=EgojdHKx3I6aE867KKpqySnigYA+dmFaaM+L0C77Hf0=;
        b=k6yxd7MA1AbFK7baRdSBpC3/9Znj5ipuy8UP9prPkHQNMmpZ7QOLQj1jaWvmVq3P1K
         tshlQM6Rr9q1Co7U1+ckN03Ir1/gLcNL0EmWbf2+XEAchyKUZ/euNjOY35rPlYgVHKIX
         QDgPGE8Unegb51OgqGl7hH6D3zXRp5VHoDz3ymGmyVC6YR3NFLzMBFEGlS+ts0FC4Ji2
         eDnaOy/Bh8qT4BIIcnfNrpZQQGLI9sE/I/kE4AwUqecHtNGflnNLatSP0MJ8e/Z/qCxA
         v4vZP4H7H8Z2ADz+Qj5K5/Us4yWAOP1HlfG76O0ywYPmCH3NyknyZeUaCN95CDUMMs9t
         tjYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793879656; x=1794484456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N+3m3vZOzUEGlHuUM9OVDnQH8LQ3Rban+sBZHH4tE00=;
        b=DCdUCa5x+yRyAT31lbAmXtahG9EYq+8GeSZ2wi+IICNAOBf8dX1U6ipm+s/3EOWK6U
         5QJpiGFoERvOY9EG8R2CO91TqBTxi2u9/LDA2LvEbZMW8Ghx2TN9MZO08C2KSZ2Z2ROE
         Wsp7/FjKDIojzbRGUXD2Q+waYDYnIzUzDCf8uJsINq8cy6gM+n0IKGgqVBQXxp6k6voT
         OyWTC1xUYlfTvXUv5yGFRx5JQ3dUuuCoxSuepwClZSKVki4+nRPrLcR4oSc8Vp1XXAaU
         Pk8jPE0c0hBm3oVXvLGO9Z8ssVKs1D4rljEjFvjpeqIux5npT2Yy7OuB2IwG/mWDQ8BR
         hRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879656; x=1794484456;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+3m3vZOzUEGlHuUM9OVDnQH8LQ3Rban+sBZHH4tE00=;
        b=Z7SJjIjkI0Bxv/N5afi+W8kcWKkZ95et62EKD79ditMCFqCiMNxROOWrn/gFgeG4jI
         ra0hwD6XSx2n7XYssjg3oJtVe6Jq4um+p0YSi6R7V8a4p5c8btPQuHRmAArUKmIgCfZ+
         IphtJTWngo04BOq/WhE+4Cwi3SFbjeEEsN8lqnBoYW11jbSBxU0QWCno4XKvkH9Jukop
         EoZlRQ2bBQ7PbpIBUr0JhiuVqokrTVvUmqm6VTmvM+ZQVmXIhSmshBHLmISb/z5FEsu1
         wWvRb6RsFjgM4FCWfefgPswCpG/BmFUUbGL5Y7Rb8hjxATKejJV311KQGnscef0BUz3E
         H4AQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWg8k0N/rNaTOB2yJW3R9oQEigmy4Yv0k/WH/+pJGt+6OZQMWyL6WeQsv1lsE0gvSovTcmxnRol8+j7EY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JqyWsfBbxtllXKKaHY7F4/JvRMlTfPOJ0gPsrOLpoljf09BAR
	Wv5iD6HXJOFSLmM3d+C1ySI/aLrbI7G/ZcN6sfkNKHH+D8+L/9NRpok75hlujs4Eey1b2iHrb14
	Gjjyf4jgVpXc7Dp12279kSSD99w/n8z8=
X-Gm-Gg: AYBFou0F6gXcZ98ZzqKJkOYqWBt/TCUqXNAcxO0RAiWTmpBfq3ss+pu/GWul3Q4CyrO
	XnPVyJ8R6jVg9rjlgMmBAVeCZg4K9QDJe725F36SOKML31B1ng0uDSozKkIbNYvg8crV/JX8EEp
	1JysuO4qaKGlrkxY1zKL+Dx+HOJJfMaYH9GjQxEicrlzKTWpN4x7y0oIa00Ba8wY5J1kCgNfUiM
	ZzHeI7GYsFCyNQuE0k43r6DPlZesexgtaRJiOEJub79stpJ6HY+WjHSKs8kw3BIAHLiBs9Gse9h
	zvtW8ZVKl98J8LQToz6MlW3q2Sivid8cZi+iMBsxm35YhtzwxHv8UN+HZR91bZtzoiTQJjVN0LV
	L7a17wzH74wQnXleyAyhj+KBb7da8QMv+aCyO9LtVTNRZYd2VkTCYVXShVerXg/S5rA==
X-Received: by 2002:a2e:a809:0:b0:3ab:4a7c:7a65 with SMTP id
 38308e7fff4ca-3acb7883d20mr40938051fa.0.1793879655702; Thu, 05 Nov 2026
 03:54:15 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 06:54:15 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 06:54:15 -0500
In-Reply-To: <179387271921.488856.11043838083216323158@kernel.org>
References: <179378590950.74297.14503648624087894519@gmail.com> <179387271921.488856.11043838083216323158@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: zhang san <shunsheng1218@gmail.com>
Date: Thu, 5 Nov 2026 06:54:15 -0500
X-Gm-Features: AclHuK_PjOfwrGU7V8tuY37Lm8UZo8c9leNmigz8_H-PCKcm9vybXrcGuzeOckY
Message-ID: <CAGTEBTZztQcrwJC0pECO=vmn5xZv-cY_OZnSLVBL_9Kt0OzfVQ@mail.gmail.com>
Subject: Re: [PATCH] nfc: rawsock: prevent TX work requeue after socket shutdown
To: netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev-bot+sashiko@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I am resending my response in plain text because my earlier Gmail
reply contained an HTML part and was rejected by the netdev,
linux-kernel, and oe-linux-nfc mailing lists.

The issue was identified during AI-assisted source-code review and
investigated with a KASAN-enabled kernel and a deterministic
timing-injection harness using a virtual NFC device in QEMU. No
physical NFC hardware was used.

The High-severity finding on v1 is valid. rawsock_release() set
SEND_SHUTDOWN without holding sk_write_queue.lock, allowing a delayed
completion to requeue tx_work after cancel_work_sync() had returned.
In v2, release sets SEND_SHUTDOWN under the same lock used by
rawsock_data_exchange_complete() for the shutdown check and
schedule_work().

The Low-severity Fixes-tag finding is also valid. V2 uses Fixes:
d793458c45df ("nfc: rawsock: cancel tx_work before socket teardown").

The timing-injection test produced seven slab-use-after-free reports
with the v1 locking and none with the revised locking under the same
conditions. We do not claim that this patch eliminates all potential
data races involving sk_shutdown.

V2 was already sent as a separate thread:
https://lore.kernel.org/r/20261105113812.969651-1-shunsheng1218@gmail.com/

Best regards,
Yaohan Li

pw-bot: changes-requested

On Thu, 05 Nov 2026 09:58:39 +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The fix is still racy, so the use-after-free it claims to close
> remains reachable.
> - [Low] The patch only works on top of commit d793458c45df2a ("nfc:
> rawsock: cancel tx_work before socket teardown", 2026-03-03), and the=E2=
=80=A6
>
> --
>
> nfc: rawsock: prevent TX work requeue after socket shutdown
>
> The patch makes rawsock_data_exchange_complete() check SEND_SHUTDOWN
> under sk_write_queue.lock before it reschedules tx_work. The goal is to
> stop a delayed data-exchange completion from requeueing the work after
> rawsock_release() has started tearing the socket down.
>
> > diff --git a/net/nfc/rawsock.c b/net/nfc/rawsock.c
> > index f7d7a599fade7..efdbd512d4600 100644
> > --- a/net/nfc/rawsock.c
> > +++ b/net/nfc/rawsock.c
> > @@ -168,7 +168,13 @@ static void rawsock_data_exchange_complete(void *c=
ontext, struct sk_buff *skb,
> > goto error_skb;
> >
> > spin_lock_bh(&sk->sk_write_queue.lock);
> > - if (!skb_queue_empty(&sk->sk_write_queue))
> > + /*
> > + * The release path sets SEND_SHUTDOWN before cancel_work_sync():
> > + * once it is set, do not requeue tx_work - the socket may be freed
> > + * right after the cancel returns.
> > + */
>
> [Severity: Low]
> This comment relies on the SEND_SHUTDOWN / cancel_work_sync() block in
> rawsock_release(). That block was added by commit d793458c45df2a ("nfc:
> rawsock: cancel tx_work before socket teardown"). Before that commit,
> rawsock_release() did not set SEND_SHUTDOWN and did not cancel tx_work.
>
> The patch only carries:
>
> Fixes: 23b7869c0fd08 ("NFC: add the NFC socket raw protocol")
>
> The lines it changes date back to 2011. It would apply cleanly to a
> stable tree that lacks d793458c45df2a, and there the new check would do
> nothing during release.
>
> Should this have a Fixes: tag for d793458c45df ("nfc: rawsock: cancel
> tx_work before socket teardown"), or at least name it as a prerequisite?
>
> > + if (!skb_queue_empty(&sk->sk_write_queue) &&
> > + !(sk->sk_shutdown & SEND_SHUTDOWN))
> > schedule_work(&nfc_rawsock(sk)->tx_work);
>
> [Severity: High]
> Is this check actually serialized with the release path? Only the
> completion side takes sk_write_queue.lock here. rawsock_release() sets
> the flag and cancels the work without holding that lock:
>
> net/nfc/rawsock.c:rawsock_release() {
> ...
> if (sk->sk_state =3D=3D TCP_ESTABLISHED) {
> ...
> sk->sk_shutdown |=3D SEND_SHUTDOWN;
> cancel_work_sync(&nfc_rawsock(sk)->tx_work);
> rawsock_write_queue_purge(sk);
> }
>
> sock_orphan(sk);
> sock_put(sk);
> ...
> }
>
> Release only takes the lock later, inside rawsock_write_queue_purge().
>
> Can the following interleaving still happen? CPU0 holds the reference
> taken by sock_hold() in rawsock_tx_work():
>
> CPU0 (rawsock_data_exchange_complete) CPU1 (rawsock_release)
> spin_lock_bh(&sk->sk_write_queue.lock)
> queue non-empty, sk_shutdown =3D=3D 0
> sk->sk_shutdown |=3D SEND_SHUTDOWN
> cancel_work_sync(&tx_work)
> tx_work idle, returns at once
> schedule_work(&tx_work) succeeds
> spin_unlock_bh()
> sock_put(sk)
> rawsock_write_queue_purge(sk)
> sock_orphan(sk)
> sock_put(sk)
> last ref, socket freed
>
> If tx_work is neither pending nor running, cancel_work_sync() returns
> right away. __cancel_work_sync() also calls enable_work() before it
> returns, so the later schedule_work() can still queue the work.
>
> rawsock_destruct() does not cancel tx_work, and the queued work holds no
> socket reference. When the worker runs, rawsock_tx_work() would read
> freed memory:
>
> struct sock *sk =3D to_rawsock_sk(work);
> struct nfc_dev *dev =3D nfc_rawsock(sk)->dev;
> u32 target_idx =3D nfc_rawsock(sk)->target_idx;
> ...
> if (sk->sk_shutdown & SEND_SHUTDOWN) {
>
> Would it close this window to set SEND_SHUTDOWN under sk_write_queue.lock
> in rawsock_release(), before cancel_work_sync()? Then either the
> completion sees the flag, or its schedule_work() ran before release took
> the lock, and cancel_work_sync() will cancel or wait for that work.
>
> Separately, the unlocked read-modify-write of sk->sk_shutdown in
> rawsock_release() races with the plain read here. It also races with the
> plain store in rawsock_report_error():
>
> sk->sk_shutdown =3D SHUTDOWN_MASK;
>
> KCSAN would likely report this as a data race. The rest of the
> networking stack accesses sk_shutdown with READ_ONCE()/WRITE_ONCE().
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/179378590950.74297.14503648624087894519%40gmail.com
