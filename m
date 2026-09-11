Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0510E275AEB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789086349; cv=pass; b=Gyp5VjeUQsU19GIQz0oZE9G9swXdLF18tMsJ0hBAJ3QGJ1IF2fRH3nITJi126y7JHFC2n+fiLPdrCFlcueaZRLuJ8MT5o8+B41Dxnu6h81VRyReBDU/HSyqNgAz+zZeabSf2JoG8n80s/dwNQrXg+pTYIfTx1XB/MX/V//qMWC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789086349; c=relaxed/simple;
	bh=uCOZ0LrS3n3H3n+rg4kATp9ASsY5FD80qLKYusb39A0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vs0ZoUzbcSRnRVEmvQrMYyyX+7rP5qD/TkJKK18DuQ1vOBmBobMP+czFADIkAozIVtj8rLoeDEUBbPeic2NKg51hFUFFtPtpUX3xWSxqGcOWHL75Xm32js3c4mXra2BjbL1LoPl8yXKHB7xX+Kb2wyDB2NwchyLs57jR3FIwOwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWzOrb13; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWzOrb13"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-86959a6f7f6so225023b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789086347; cv=none;
        d=google.com; s=arc-20260327;
        b=OexKC+yD3Aq9ByVHqy0z2eOcQ2hixLgXAflxKVLH+ymRLCW55GqfbcGxbFnySvH9Qm
         cvi36pl8gKMHsI/9qE0soIXw7pMjDnws6Bv9iPwIgrqOEkIy7BX5JkhwG9CNoeJyNg38
         hIWJ/FJfXdaYaGHjo4dvq6iMMkjVtrUC824nNv0xHzmlTzX8PzEunZ3vNrFoqntszwVa
         K0Fyv8CIbc1FJv8IJTodR6WHjKOI8V27cgXd5oRyXWaJzjEC1/zs+eiuoKHbp8JMwtoP
         xRVNMmlZbeGGkPbOSrV1owJIUNscBoe9ZAjvwUiY1SaaZLikd/Pn1IQo3cIBM5sPRJdH
         C5pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6cY2czYH1vDPyw0bwgbm9H8oNJcDXC0fpW3vN39yQ0g=;
        fh=Cm1HqU0GvYxWKj5RIeCHHAaIBKg8RHNA/WzRl1rDenc=;
        b=h19oPNZg5vppsshaf43KdLhysIVWHCEqFgmQNKomQEsJNPUmK+jqrhEJQ8q8nIUtnw
         SUdEeKllcH8K690Cg/g9RdvqEsQS4ZNMAkXvE74GWMaZCRjHcAf1d79Vigkbi44YHHV2
         98sfxWxmskQc3qynULh2uisvqg6YsD/eFWqlXFHOXS70tbHyM9elkzz4hsVSnwzMA9qf
         nnTarpSjkYTPEcn4x/u2ef2iKVGuDiI0RxmkqHFnPGXd9Xq5UncaXxJrFiuuIISmlYKG
         IVcnYxchirO0T7f8wmjjccLsrfYD18mg3byOBDlIEUjG7rdTLH0zgNnwNt4UP7PC6kms
         f0XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789086347; x=1789691147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6cY2czYH1vDPyw0bwgbm9H8oNJcDXC0fpW3vN39yQ0g=;
        b=kWzOrb13cmbYUWa5sQN7/F2vv/IT8LFBB5CXPspowCrhWl+5HIhEb8oU9lGqPLFdYG
         X/1vNU6Bo0seVZYkhzo56Dk6Jb30GDAbOA+d7uU6cxUXISlqk7bEtOCrTwFtBUXQ0lso
         yXNj8tV2J8LcLDMz78xWVpUrBzqTlZdWvlk2hz1EX/bZafmiEJDRGnB10M1aN2WpCe7i
         4rwKYBavbaVeiaYahDigksBmVSjjOFwkD298+FoFstnxn3Q/r5umklVz+TJrKYEHOm7n
         6Pk2nqxaFcnLUC7exsJtjqQ9rbsIWn//PfC4u3CLiZk5azYSyYL82NLa8xoF6hjgfkTQ
         fd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789086347; x=1789691147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cY2czYH1vDPyw0bwgbm9H8oNJcDXC0fpW3vN39yQ0g=;
        b=D5j2QzBJhZ5+lUldFLmSWJwqZTwuA9xt1V8Klb/Dr14jQNCCtHFEhfqrlJ809iwbXv
         b8yZJ5wUNYSjIElA+CX4zjeLRJqGURaY7Qk3OCuvX92tItJH1iRl7CjliCQbs44A9m2d
         rGlV4zNv5hMdQ2s92vT4ek3QNDsgxp4Cw2is0+OR+InguXWMa/Ypy0yU6HoczWSLMmJf
         GZAUhGqy7IPuLTAzrW/HUKAjDmraPoELBhdVVx5MXaJvFC2vJxFfqJTaetIzoGv14F2C
         FpNWkcvqJa8p+xGCOBn3XLZKFeQBkzO+wljQMcMxSPYtN0HL2IoEEl0jK926apQo/EgG
         DQ+w==
X-Forwarded-Encrypted: i=1; AKwUvBwMLFYmPPVpAW/W1N2hyNaPfXseqxp5I21UYvLIF6VuYQN8YiMfCMav77Gr7dUVkcPZ/n9/S6Y8W7gJPyE=@vger.kernel.org
X-Gm-Message-State: AFuF++kFg9LfHFvdI+CIMpqTiUkERfvtoko0a3vsdKIBLiE2BOAm25m+
	Wgj95oDqzZQbZlxkl1qMm2gm2LUbr4JyfMV8XdEh8JhofBB3rwJnSNKt5kPrI1bgHVHWQd+1Zf5
	GMJXa4jEovd988fZ33ElBkTwGNNKx5jc=
X-Gm-Gg: AYBFou0fwUDdCORKgMgJoHzBYmi3g9XKITqWHKBmBArh6ERLFW+DUJyJdtKapbj03j8
	MX4rKC8SDpOxQnKVbzT1214YeHzlXdT9NdLWmnbCsUaf0es10Tw6t2WRJcilcJIifiXWexClVfS
	3W1ErlABviubgrr91rVcxXMSdCA8RgZZnMftvc+XJ9DS/MP7Ay7S5kC7oZ1A29fbhcmYOPhp/H8
	8N5JFtTTi4SbbVs1ucQquXVwKPVTZry88YRfiRW8InvBYbp/qw0Os2vy04qgftvcPexKcsmRF0n
	ieEt5GcXK1wDAj/U38fLf0nDEqNPniecxSdA9zMWMOYoC3TaVrJYAQiVHAy7bqV34NIPHJ7/6eo
	gl313RuZu+j6vyL1wYG08irp18e0OZsT3RiJizPlELVD5W430rFnCFc04tZ6lOl3Y2g==
X-Received: by 2002:a05:6a00:3a27:b0:869:9298:ba50 with SMTP id
 d2e1a72fcca58-86b2aad0ec4mr2473923b3a.0.1789086347093; Thu, 10 Sep 2026
 17:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADvbK_dFoagLs1c4b-3aFqsbDueu3VO0t-8S93+6GgevuoRBLQ@mail.gmail.com>
 <20260902025206.phbpyxmpf4zrtdpx@sunyiqi-llm-kernel>
In-Reply-To: <20260902025206.phbpyxmpf4zrtdpx@sunyiqi-llm-kernel>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 10 Sep 2026 20:25:35 -0400
X-Gm-Features: AcwNN1XUuVVtdAD4rJUmZCOIjcTX3a30cN5AS0GEJXKtJi13ZMB16vRmNezrcKU
Message-ID: <CADvbK_e-7_aLVKYUr1hogQLJJPGEOCG_HqrTE2+6TFC3Mg=Egw@mail.gmail.com>
Subject: Re: [PATCH v2 net] sctp: avoid livelock while updating retransmit path
To: Yiqi Sun <sunyiqixm@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-sctp@vger.kernel.org, 
	marcelo.leitner@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 10:53=E2=80=AFPM Yiqi Sun <sunyiqixm@gmail.com> wrot=
e:
>
> On Thu, Aug 27, 2026 at 3:50 AM, Xin Long wrote:
> > After removing the continue, I think you can keep using
> > if (trans =3D=3D asoc->peer.retran_path) here without 'last' needed.
>
> Yes. The v1 'last' variable was redundant once the SCTP_UNCONFIRMED
> path no longer uses continue. Drop it in this revision and retain the
> original wraparound comparison after the candidate-selection block.
>
> The reproducer is attached.
>
> sctp_assoc_update_retran_path() walks the association transport list
> from the current retransmit path's successor and stops once it reaches
> the current retransmit path again. However, the loop skips transports in
> SCTP_UNCONFIRMED state before checking for the wraparound condition.
>
> This makes the loop non-terminating when the association contains only
> UNCONFIRMED transports at that point and asoc->peer.retran_path is also
> UNCONFIRMED. One way to reach that state is through ASCONF wildcard
> DEL-IP processing after an unconfirmed address is selected as the
> primary transport. sctp_assoc_del_nonprimary_peers() then removes the
> other transports one by one; when removing the current retran_path,
> sctp_assoc_rm_peer() calls sctp_assoc_update_retran_path() before
> unlinking it. If the remaining candidate and the current retran_path are
> both UNCONFIRMED, the loop repeatedly continues before it can observe
> that it has completed a full pass.
>
> Fix this by considering a transport only when it is not UNCONFIRMED,
> then checking whether the walk has returned to retran_path. This makes
> the full-pass termination independent of the transport state while
> preserving the existing fallback selection semantics.
>
> Also restore the NULL guard around the retran_path assignment. In the
> all-UNCONFIRMED case there is no eligible replacement transport, and
> installing NULL would leave later retransmit-path users and the debug
> print with a NULL path.
>
> Fixes: 4c47af4d5eb2 ("net: sctp: rework multihoming retransmission path s=
election to rfc4960")
> Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
> ---
> Changes in v2:
> - Drop the redundant 'last' variable as suggested by Xin Long.
> - Link to v1: https://lore.kernel.org/r/20260827075006.3979566-1-sunyiqix=
m@gmail.com/
> ---
>  net/sctp/associola.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/net/sctp/associola.c b/net/sctp/associola.c
> index c0512c827d0f..4521be3bd85a 100644
> --- a/net/sctp/associola.c
> +++ b/net/sctp/associola.c
> @@ -1289,18 +1289,19 @@ void sctp_assoc_update_retran_path(struct sctp_as=
sociation *asoc)
>                 /* Manually skip the head element. */
>                 if (&trans->transports =3D=3D &asoc->peer.transport_addr_=
list)
>                         continue;
> -               if (trans->state =3D=3D SCTP_UNCONFIRMED)
> -                       continue;
> -               trans_next =3D sctp_trans_elect_best(trans, trans_next);
> -               /* Active is good enough for immediate return. */
> -               if (trans_next->state =3D=3D SCTP_ACTIVE)
> -                       break;
> +               if (trans->state !=3D SCTP_UNCONFIRMED) {
> +                       trans_next =3D sctp_trans_elect_best(trans, trans=
_next);
> +                       /* Active is good enough for immediate return. */
> +                       if (trans_next->state =3D=3D SCTP_ACTIVE)
> +                               break;
> +               }
>                 /* We've reached the end, time to update path. */
>                 if (trans =3D=3D asoc->peer.retran_path)
>                         break;
>         }
>
> -       asoc->peer.retran_path =3D trans_next;
> +       if (trans_next)
> +               asoc->peer.retran_path =3D trans_next;
>
>         pr_debug("%s: association:%p updated new path to addr:%pISpc\n",
>                  __func__, asoc, &asoc->peer.retran_path->ipaddr.sa);
> --
> 2.34.1
>

Hi Yiqi,

Could you repost the patch in a separate thread without including
the discussion below in the commit message?


    On Thu, Aug 27, 2026 at 3:50 AM, Xin Long wrote:
    > After removing the continue, I think you can keep using
    > if (trans =3D=3D asoc->peer.retran_path) here without 'last' needed.

    Yes. The v1 'last' variable was redundant once the SCTP_UNCONFIRMED
    path no longer uses continue. Drop it in this revision and retain the
    original wraparound comparison after the candidate-selection block.

Thanks.
