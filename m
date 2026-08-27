Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D4E47A881
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844826; cv=pass; b=Q1V2FhavYxKmf1D3Ksvz8gO8M9QmndaM48O/eoyNADvG/ngR8EWI0YM4qJ3DSKXsvjAcyrfxPhN/uV5MPuTNDG1EutPTxo0t8dih0rKCbpJYJ74DkR7L1xFjRYzFotKZbrH5nPP5GNYZhB9kYkgPOWOSkD8/mjhRMT7QP+HMd3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844826; c=relaxed/simple;
	bh=iGw11a7YLe0gPdwQyw3cFTQawIhOPAiGaMOvaLBDnpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EfBkc/NmtENvdQggmK/ufmfheuOLsKl2fl9BMdkcLUfmxJH5G2aT1Jcv3YWN3eo0NB8DOEZ2EmACqjytc8PXlKB5qvijBaIpGGGkgia+Noc2T1NwHZ9gFgOk31TvtFT1jMN2ie57gYT7QAiSEYuyK0V72NEy5QCRprAmtB6bTZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4w4l2hm; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4w4l2hm"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8556ec44e9aso67249b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787844824; cv=none;
        d=google.com; s=arc-20260327;
        b=RAa3uxrKVshBN9R/8ZD3geoW7UsFHLvWhfYLrXWJ0z6XOrm1oQrPEjdPFqJH7XHEXo
         DL7nmpByvyLZiY1PtijXZQHSaerSW7Cr08DM6cI9JQbtPHzbZuYWlwQ3PeG8mJbfSqcG
         LsmBACW01WpsDE7wB5jAFojrYQXh5HoxwvX6mfebXc/yCG1WxvOB5AGrz+VpeY/gFGSu
         WGEe1UqxdEFReJxOJ6gC8nhbITjpQpdNLMSlqo9J5u7dX30ycrHdnId5yWGOlKc1p44p
         8VLpcz9dxz1MsdfxIF8aVopLcHbHiRNO6ZVbW+Dm91aDqjGz/h//nJuyYtsg4fp5FGF4
         +MjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7LSVRo1/iukDMNY3pIO3IMwPa3nnSHwmCJBaTRBGumw=;
        fh=Aw/Fw19WjDPwAAoqxPwwOH3uwJxXvaWbVZ8E/Tzvquo=;
        b=HK6SmdD9wl3bUgMgvvuE1tyr+21WDBFXaIBRqvBjwg0PBZmuKB1rdZxxKtutU7zzYT
         klDCUwJ5XYm69IIJmdKjLag3szLqV5ILvkg924SGMt+bZox/263DwfxhW2w/R9xAeFep
         lNC77s2HsERNt2eupg8ZLDaAAX1hEyzYRhtJmsGv6HKDRqTQ5SmiBPUzCxeTEusJwhAl
         IFEinmVn6eBlkphYHz4WP1YjW8HhwjJpJ+Zi+2v4t+95HJXEP9nKIqlGaSkahDDeCZ0q
         BQU8Uc1EY8FbhSQnb+RqKLD5v5meEC+dmJXXoMKYaW08riBnBalLtT9O2fy+FawLUEH3
         xF5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787844824; x=1788449624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7LSVRo1/iukDMNY3pIO3IMwPa3nnSHwmCJBaTRBGumw=;
        b=i4w4l2hmWbfH34Udk/ZlhJD5hPDchbIcR4oCUJbMzVeKCapyirSvmHsvHgrxd/Ar5L
         pPcGE8/HlP7/LflTJVdLS9dLry7jV6vgoazchHTTjKcj/X0TFAnrV/x1WBNe7tbeFRsu
         aZeI/i8gQo8UbgVroNvGlkUSsPopoP4J+Kr71CueVJp9Q1uvR0xPNoGOxx3ChZPAZk2G
         31SkNapZliZm8nBZ/tUA/yFCl5gfA2dx28dIMulhob1JYLYN01GEWDp9wiY3Y3xFB0RK
         3t5D28aQkSmaaEPGYjGOa10ngzfVKGdib201A9JJ64ndeNL9dXg6m0Si0jG4w0khuUWh
         niAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844824; x=1788449624;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LSVRo1/iukDMNY3pIO3IMwPa3nnSHwmCJBaTRBGumw=;
        b=ZlSsr6rwpbdh076srzVDke5/MqQOivzEwkwX5hzhNVM1fsrPfeLt+Jcy5JAHKOodn7
         bVszm4LkqJNmYIUDuLXK6nWxzxioyGZhCJAZ59QUTvilrz5tWYaqrZoXyeETyWBZ+htV
         jwInyj5u3Fn07xqIAkMwb/PdVax5rcv4O5oT7b31Kx/FTPhM753rRjQUd/hZe+CQ7him
         iHgnmyDcryzl3xTn7SZ+lIFP/N6tFyT/fONLSqPIIb/QRMVakrqSTuj4jPbZudCaMjA6
         d/klriweY6SRpLe4QQCYAug6VsCF+fuKw22LwkB4Icsbqgs7KQVymfljKH3d/saMf7Ca
         xtmg==
X-Forwarded-Encrypted: i=1; AHgh+RqFGPTQzTeUHreAGXNM35eNmmXwksHdea6Q8TmTYDNZMEA3aBdqZN9MWHU3jzBiIFi4NBD0shBLzCmMSt4=@vger.kernel.org
X-Gm-Message-State: AFuF++nGyti90C5SeAkOmyRcAnP01KtxsNNsqUyfDFkPJ2vwvLWDxatl
	1xU2CDX8/FoZv38Da7AvTSmkkOuzY+lqgdhfvKtazm1orm/rZUpEdDOwmQmzNd6XHB1X113yJZM
	32FWewk+alwBHNdJ+m39ve9rYGVIn2cE=
X-Gm-Gg: AR+sD12yBf1nqt5QWdkNaEMWReQtLCiycm3WDvhZRZ0ySJCOIwUUnH74LjLpcQJG7e6
	rypp/8PcG2S73+zlz5wxHds0SzOX/ErV4KORat2LsaO7gX+w6e2BE2wTUNAufVDcQs0iGpAEKyL
	gCheNQGFvu4u5ndMhkfd7B9gRdgzGKyU3SVyQbK35HJZ/AE0OJtP8k1LOQFT2U/wVYkgVOAkT4P
	Z7y6HIPpI7WnqayReN7lGiOMKz6M5M5eZZU5B1DcVrX/jCo+pm/VraHObBQeicYj4kcaHJ0oJGE
	ju7DvjuOSim+X2lPpWZlEjOzuqIUmgzNkzLW4Pbflc+voTfVGPLuu8AwD8M7aa3bQy70QFTYfgc
	loVaqLBLHPvjHaqJMg8tQkU6xiqaCmsPafmRgag0h7Als
X-Received: by 2002:a05:6a00:3e29:b0:84f:dfa8:57c5 with SMTP id
 d2e1a72fcca58-85374cb7bdcmr27288199b3a.13.1787844823992; Thu, 27 Aug 2026
 08:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826-sctp-zero-chunk-inqueue-v1-1-86769dcc7f8c@gmail.com>
In-Reply-To: <20260826-sctp-zero-chunk-inqueue-v1-1-86769dcc7f8c@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 27 Aug 2026 11:33:32 -0400
X-Gm-Features: AcwNN1XAMiVsoB5EBb0lVJPWDu-w2mSOB7apmLRA0eGGSOgdyyJIgB72PmiEmJI
Message-ID: <CADvbK_d7mOaNRgHEbVAUgT28sy6jHr5TTvE8+dsymOU-UJDoEw@mail.gmail.com>
Subject: Re: [PATCH net] sctp: validate chunk length in the inqueue parser
To: theminershive@gmail.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Vlad Yasevich <vladislav.yasevich@hp.com>, linux-sctp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, security@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 9:01=E2=80=AFPM Charles Vosburgh via B4 Relay
<devnull+theminershive.gmail.com@kernel.org> wrote:
>
> From: Charles Vosburgh <theminershive@gmail.com>
>
> SCTP chunks always include a four-byte generic header, but
> sctp_inq_pop() currently accepts shorter declared lengths. A zero-length
> chunk leaves chunk_end at the current header.
>
> When ASCONF is covered by the association's SCTP-AUTH policy,
> sctp_assoc_bh_rcv() can continue before the state machine performs its
> normal chunk-length check. sctp_inq_pop() then returns the same malformed
> chunk repeatedly and the receive softirq can lock up.
>
> A remote SCTP peer can trigger this after establishing an association on
> a kernel built with CONFIG_IP_SCTP and configured with
> net.sctp.addip_enable=3D1 and net.sctp.auth_enable=3D1. The reproducer di=
d
> not require application credentials, a shared SCTP AUTH key, or
> net.sctp.addip_noauth_enable=3D1.
>
> On commit f967455fb2a5 ("seg6: reset IP6CB after IPv6 decapsulation"),
> one zero-length ASCONF caused repeated
> watchdog soft-lockup reports in a two-vCPU KVM guest. All 3 pre-trigger
> health probes succeeded, while 36 of 37 post-trigger probes failed. With
> this change, all 37 post-trigger probes succeeded and no equivalent
> soft-lockup signature appeared.
>
> Reject chunks shorter than the generic SCTP header at the shared inqueue
> parser boundary. Mark the packet for discard before either caller can
> continue processing it, while preserving the four-byte generic minimum.
> Declared-length 1 through 4 controls and kernel-generated ASCONF traffic
> remained healthy. The patched sctp_hello selftest passed for IPv4 and
> IPv6.
>
> The complete private reproducer and validation evidence are available
> directly to maintainers on request.
Please share the PoC with maintainers.

>
> Fixes: bbd0d59809f9 ("[SCTP]: Implement the receive and verification of A=
UTH chunk")
> Cc: stable@vger.kernel.org
> Assisted-by: ChatGPT:GPT-5.6-Sol
> Assisted-by: Vantix:claude-opus-5
> Assisted-by: Codex:GPT-5
> Signed-off-by: Charles Vosburgh <theminershive@gmail.com>
> ---
>  net/sctp/inqueue.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/net/sctp/inqueue.c b/net/sctp/inqueue.c
> index 5f988b3a8814..12a46868165a 100644
> --- a/net/sctp/inqueue.c
> +++ b/net/sctp/inqueue.c
> @@ -212,6 +212,11 @@ struct sctp_chunk *sctp_inq_pop(struct sctp_inq *que=
ue)
>         chunk->chunk_end =3D ((__u8 *)ch) + SCTP_PAD4(ntohs(ch->length));
>         skb_pull(chunk->skb, sizeof(*ch));
>         chunk->subh.v =3D NULL; /* Subheader is no longer valid.  */
> +       if (unlikely(ntohs(ch->length) < sizeof(*ch))) {
> +               chunk->pdiscard =3D 1;
> +               chunk->chunk_end =3D chunk->skb->data;
> +               return chunk;
> +       }
An early return of the chunk will skip the pr_debug(), which may not be
what we want. Also, I don't think we have to update chunk->chunk_end.

>
>         if (chunk->chunk_end + sizeof(*ch) <=3D skb_tail_pointer(chunk->s=
kb)) {
>                 /* This is not a singleton */
>
Maybe you can merge if (unlikely(ntohs(ch->length) < sizeof(*ch))) into the
check here, like:

        if (unlikely(ntohs(ch->length) < sizeof(*ch))) {
                chunk->pdiscard =3D 1;
        } else if (chunk->chunk_end + sizeof(*ch) <=3D
skb_tail_pointer(chunk->skb)) {
        ...

Thanks.

> ---
> base-commit: f967455fb2a5a2079b9eb5823e9ccf359174bf9f
> change-id: 20260826-sctp-zero-chunk-inqueue-b478dca552c6
>
> Best regards,
> --
> Charles Vosburgh <theminershive@gmail.com>
>
>
