Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F2049158D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789759103; cv=pass; b=k7c1cezlspI4jPu3qRkwsjyaJ4uJEm9EHc4xIEeXZFOChwEdxsqRpTFi10QoRmfUAsN0Ts6FgUx33/8BnUFhdTN/zUo2whhIUIApt9pROsDTj5qIIy/2xIoXSaQDid8oqbRC0X0dhKYVpQXp8uaK3p1IHVVPnmT62KFrcGaxCcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789759103; c=relaxed/simple;
	bh=d+XJY6IjEfDw6B+KKS046I9YvRYsBRFL5fcv5i6AeZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hEiaiA8md4eT26lMG3ErEhsjqXpt+aldWS+qDxANB2I2cWSVRsZLI43JePZ/zIdZ9rOam6HrI8DxU2M4W2F56NagE2Q5xly2RoQCTZ8rHQ11kmK5x7WQfX3X8y1IrU0IHa9xskb3gaGvXbIL2LMVNjAEGi3NkivbWyI11moyNkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2Pw+oiv; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2Pw+oiv"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b355ffso741804b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789759097; cv=none;
        d=google.com; s=arc-20260327;
        b=diqnt2BN7BWX2HkOdbnMQ+9UrLQOcI9H3mjF8gD/UuKytqgHBYPCMxbVT+M3vz4oZI
         3YX7nd7zDIbVHOxERngMU8eDbpyvoTIGEIoer+xXCz5O6qTNxYrCyi155xS3DPEnqdB0
         EBjOt/EzQpuOIBfBcI03eIzclLa8YBt5uM1W27Yv17awgUoRl4BeJblaGzlIjiKNnarH
         6NixoM0TRHdaHn/cGCbl6uB3v31wplyuaCR/xYrQywNBqMFmY4vc6KvpTHw834qCCdPl
         v3EUmdK93CvRv5OKPVFAtbulE+t3j16br9Z25by7IsxbZ8LhTkZ/NORshsGCsTwDSTFl
         65fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2troVCYCbvQMPjyP8m9Thskq3hQDCRWw6lGuoi8DN70=;
        fh=NMuhB4e+Xi5+2nvtd3gsyNPOIY8wxQdiKpyAwNJm0+s=;
        b=EZv4yt9f+pskJCvF1eanThTQ6SnQuKQjPwgs41pvKCEGMg4VyrG4EQZ7uqL7YmYQJo
         BdNtWTBUvBa7sJnl40sphY7v0PYLD9dywn5gldigSuc4d9R1P74wZ+vtOTV0OEjdIPik
         mEXDs9H4JzEevFS5CcLXiQGSg1fQ3WRAeAyy/+3jrPjc01hf3/uyCLvtNJIrRqwzpHHp
         IkuCSnbScmLHYL2WGK27qZQSs7j2d3lulZlpIG1POR8T16PNFlHSlZIuYrpqH3Y3YOJX
         4XGaCHuydn37+tJB3cevQ0mnOhjZMqon/7YO3h/SPRu5K7Wl0B8QAxo7Uo/OoR24LvTG
         lg4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789759097; x=1790363897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2troVCYCbvQMPjyP8m9Thskq3hQDCRWw6lGuoi8DN70=;
        b=i2Pw+oivlDpwZA9WTvtnw+0/1M/n7/s5NjSEjRRbghCeabioGNa59ZCrMZ7Mbv1Je0
         FgXKpuS1E2A1LyIfN/QdEIKFh6qVX7VmE2GCllCGWkqqBZcqEZbOg9fX0dZ1PSAvkz5n
         Om0U0sJOmZoWDnY9nV6RJxQlxCgPj7jeKJwcmOpgajwi2LfynleHOOw5NCfBLATqTrNH
         e39v8RySMTRWQcEF04tDvUmhA++WWH/eYWHOmTs1I/6iKR3haHNE9qE9LWSm8n1zzXVq
         RoUis+EGa7GW0t1IvGlNCghW7Ssl9si39ErvYThos18K21NQdlMcydlxhoxlXxiQlncd
         2uIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789759097; x=1790363897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2troVCYCbvQMPjyP8m9Thskq3hQDCRWw6lGuoi8DN70=;
        b=185UjyJSYts5v2Cv+J0taqeO+jkByh5wtQLh/rG7qSTlMaKPnwjuqBebuIGaqB8HQ3
         DZR3imI8e7XDOVe1WHrLJxBiJHEuIEJE+JDF5PTxKhQnVgUPq+r+axt1ALjcq4kk8YJ0
         GWnpj7m7HIrP3RuFUSNp/n0drKyaNJP3AoFGcjd80Xga+RFCubOyeQUxR+b+xJQGNT+r
         iQ68ysa0RweVyjDYon0MGmNfQxWl5QKNzdWKQp4Oit0neRkaWoumqBJZwyWlay6f792O
         9rXi8NOBPimnzfzP8ma5ePlRnjQi1epYH0GGwfqw+b+XD8FNNTlq5x7u2vZYyCeYGALo
         lLxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdrvH0LHrfL+1fmYf01YHZqHQmv5WbZBrVkR4zhfRWM6V5SA4FgZifCmv/nPpakmRZK9KplNeZUMu2+VI=@vger.kernel.org
X-Gm-Message-State: AFuF++mgDjKBQhfRvaNZ1eboftaV6/85rl5k6+eABAjMN509ZaoK5GuQ
	nNzBtx9KClDkX5vuNs6vqKvLuezQJKDA0ve54lzWHAMN1a0Z3kTn/wtWKHWucLG0fiRYZ5+f58L
	svF+wOfPjpBahsg99c4xhPsjNup/kIdM=
X-Gm-Gg: AYBFou3gGH2I+CZfD1xhb+3aVswlib7vVzvdqMhaQ3td7c+D63IYkoBbIl8emjQTc5E
	sIJ9bsai90qzxIgQC1JRB9EtNBdTbcNkqD/JAZjn9kIeYNcfjYQqcUr1DBzYyCjeiakVaXSZd+x
	Zh3Na6rKA/+3snERCNJ9UtwcWPg+fEYbu6aTVN6MkthU4JvcBnKpssFvz8h0xM3N4b29b2w3c4V
	YtzJUd39CmQnymDWJ5PeVzANI0XM3IxS3KhmwYMu/DdCkTszLoj2ebm8I1j1Toqd3KV3nuOJ26Z
	5Cai5A7pOQCArUmNCSRpovVYecBwzH03jQZgn6eiLVqdURok/q4ZrBMjO/r8ZpFcF3ie3U+eq5I
	XlqG0sKWNpNwEdEhMKHZmsidMNmuyPvX9DZlz7YZHO0CYCNmqmp81lUkK
X-Received: by 2002:a05:6a21:a382:b0:3d3:ad3c:49aa with SMTP id
 adf61e73a8af0-3dd8c5161d0mr8117225637.24.1789759097369; Fri, 18 Sep 2026
 12:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915095017.942213-1-sunyiqixm@gmail.com>
In-Reply-To: <20260915095017.942213-1-sunyiqixm@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 18 Sep 2026 15:18:05 -0400
X-Gm-Features: AcwNN1X66cAUN51FSkageQ3G0yykNkwaD2lYLObSNsrm0QVEPTOJRupGwVR0DZU
Message-ID: <CADvbK_f2oTzRA4x5+5QsTkKeXAmodgD3Noypi7sULf3-7MKQPA@mail.gmail.com>
Subject: Re: [PATCH v3 net] sctp: avoid livelock while updating retransmit path
To: Yiqi Sun <sunyiqixm@gmail.com>
Cc: marcelo.leitner@gmail.com, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	stable@vger.kernel.org, sunyiqixm@hotmai.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 5:51=E2=80=AFAM Yiqi Sun <sunyiqixm@gmail.com> wrot=
e:
>
> sctp_assoc_update_retran_path() can loop forever when every remaining
> transport, including retran_path, is SCTP_UNCONFIRMED: the state check
> runs before the wraparound test, so the loop cannot observe that it has
> completed a full pass.
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
> Changes in v3:
> - Post as a new, independent thread.
> - Drop quoted review discussion and the reproducer attachment claim from
>   the commit message.
> - Link to v2: https://lore.kernel.org/r/20260902025206.phbpyxmpf4zrtdpx@s=
unyiqi-llm-kernel/
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
Acked-by: Xin Long <lucien.xin@gmail.com>
