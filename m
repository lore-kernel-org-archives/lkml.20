Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F58B345ED3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 01:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791337429; cv=pass; b=cuofsPrYysoxRa6LfjO1spr7x5nsNgGTWv1hWnu3z/GHcYcmvpQUyN2tyh1alOGWMYVh9g6m1REVcvXl3cR5cAJWrAmRrkfhMXf4UBJmVbBegFXn5pgSr8+by/wNlg6LNcPbDgv7jDtYG/vsB+3z4YWtMk4ip6JLpoxs32Hqe2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791337429; c=relaxed/simple;
	bh=MBWdR1GxlvvVqaEyNujZIDbcJb/clAS5HIycWC0LYf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cj8yTO5CBYS7nrvwsUKaz6WaDrwtxnVOuB4yu4B3B1ZlttBEa6g0JtoDDid4oLom27q04FD54u1oja7NS8Zq+zxVMMtwW08FHY5s7S/Jcz0ZEdHJQiqy6LTEONCW7e7sck6aEI78X+4AMygksIVLwsXPHwnQAgPUZoRj/VI92Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=VIy4kl8K; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="VIy4kl8K"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a166199820so7970075e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 18:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791337426; cv=none;
        d=google.com; s=arc-20260327;
        b=sd6xry1gaVRbEINNEkQnR9763iDM5tttpjQ7OpagQeCL+mNA/wxNSbUGsorwGu4GjK
         qSwkNU9WMc4bTt1ymTin0MevdfUE6NsNm8v6FgnihiD7cocE5/9eFr50W+nJVGLzIOGe
         EjD6wU/znKMYssn8PlbNWhKChdv01JTATpmQxcw+TMd8g5kvPoaftSz4Y1zD6nIA+goQ
         VmOkw0mfcH2JeZmwHQwwlrln/MFtP2vtzr1VuWK0CNtlKtQxh6s4rq+qLVYOEfgfVtb3
         Ns/Wfm3OHpRSIRPQHpN0VybPP6ISHYznRrl8Pth+KX8epiRiLLMZQ8iSKzEyAVf6hkzR
         Yvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z2R0isuQWmYfjmDBBvPENUql08JMDQxxwrQkmjzWgTc=;
        fh=zkNahtoXRBpxgtI8GUcT3ygoXqIdt/j2Mo9YmpCw/HA=;
        b=gnlgY8XkuDGL/0Uho+TJjYz5Vk3DGJVPy7zw1tlMkBESksr4/suqU9aBt0JJx8GC2w
         y4rphqs4wFutK2j6oCTJEZPNaLXQfqUdDZloLzBkXiTCmmzjwBfxFsJ76pL/DtXfal9T
         zYTzjU8EYagdYYnuPjz/UO6Dl+tKyTRltbCUQNIUMhRJDZCMsblPgosqDuFx5XE8hag0
         MqHqM2yeoAL9IpFl0dS+StFj5gm7wV44RVqCscN4uomz+AVvzYJZgwKFvjcggXYKUFxS
         N5Jxa59NIJLV1vnTzt43W5nDwFmyf8YNEL5bef5zfRmXHrYqkZMHIfPX/eQsB7nsDvP8
         7Ycg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791337426; x=1791942226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z2R0isuQWmYfjmDBBvPENUql08JMDQxxwrQkmjzWgTc=;
        b=VIy4kl8K9nyYoJ4xTaIvuOA3XJmxtego6NP/Ovxz2YwHq14dsATF9Xh4SapdlJs+CQ
         /x09sWIL4C0wt3+QbNVyKeMrZziS2GNd/ysyZG87MI5kC/yRzi477L5C3V6tCTwvleye
         X+wb+N2Ala64VzrjYlOCm+rToIPHHRhctloxc93rgGhabklyurVXeah5ZJpfg8l0nPJY
         y+h8I8t51fp8wJj4dhBV8CVjtPZQY3YUeChHLeJ0q2KDG+3fxuM5qyyyUnwuxJuHSGOF
         wAbWM7BiabaQjuWnhDnfVcBuoDGOcBr7PSdFMjFFtxU0cQbfZjEH0tUhAqAbrM4TPksA
         9sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791337426; x=1791942226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2R0isuQWmYfjmDBBvPENUql08JMDQxxwrQkmjzWgTc=;
        b=aR4HTOwxLGesy5ifbHDp3qcx26iO2p2tXEFnVeIQ4wBu42duEG0X79UkrLKx++g28k
         yT2NJuBfAdtkKdyTInFicrYPZ7PKlzDJlJSuI2T7RDNveR1YjI9CIiT+3JKQEuhEYRPM
         OpLejuGSgBGIJJkwyS+wrNeDaTLGImRdEobPzEFwhMx7pyeaG8/YOUxXDo2JS2MIz6eO
         huCI9OtCOGW94IuFK2oh07UDa7xaYxJOr2Ev5UhV4c4HgM2k7pvWZvvq+wh+xSjd9RWd
         hUtsDFlsz9DjBzkk2LLZOQnTpMVICS6TF+1IZ3YwEW6X5arWiMQ9I3/2Wy4CvoNNY4Nd
         FmiA==
X-Forwarded-Encrypted: i=1; AKwUvBw46tPx3Bsa4CYPEQKnHJl0U8rOGiQbneJSwpPEIHmH2oHdX8OLeDiKmZ45TLoDwp784U3MjkJNXDrlhE0=@vger.kernel.org
X-Gm-Message-State: AFuF++nKgrw4JJ1bK/FAsKTloNzRMOsuviMWaVpJYXn+TdNG07+Vei/w
	SI2EYBwDESAz+TFe1XeHJWNLgfpfh22DtRHz8ESkgDHVB359wK775ESKbLxhuE2v+qPIGp7kqyZ
	YyvAsoYyy8uOU2TVTjXURq1ZsTiMyuxOi6BJAnf9n8A==
X-Gm-Gg: AYBFou0s7nq/tP75pVNHIhF1YBY38DZAuLQRcnZdryQ8Q8Y0hSvpEMlQWt5eJF3zFX/
	MDv/MA8EGgrYhnVF3HxGOgHBlmMc5g2d6lo8CbtftBFftplIwmC/ugP+1dEHFxKmtm+PPd51Vmm
	ErTbFux/reqalvOVYQjoNvTIng/SSWQGm9baQGcqN6uKrlmT7cBF8wZ03ezb5PbsIZDqrk5OqeR
	9lCX2AEKc1IXqqFZdYkSr9++JCSXbLUd8oIpmhYm4tL8J+RgqSq/JHrPoDa4nIVHfdfYKoCvlmG
	ewGZ5EqIZloVKtcp22gatWTRjRSgfIZGPC2Pm9ofAcargW6+gg+031jObzvU94Mxj5koY3YYwrm
	j38KgNVIa+aOjd4tQWE/WIjyLq/GtgF6/bGqdJLoavPE=
X-Received: by 2002:a05:600c:3f0b:b0:4a0:ec5:46d9 with SMTP id
 5b1f17b1804b1-4a180080187mr8701305e9.0.1791337425901; Tue, 06 Oct 2026
 18:43:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006125720.81227-1-shubham@octane.security> <661e8b900c97d701382af26462bead7277eaa41f.camel@kernel.org>
In-Reply-To: <661e8b900c97d701382af26462bead7277eaa41f.camel@kernel.org>
From: Shubham Antil <shubham@octane.security>
Date: Wed, 7 Oct 2026 07:13:34 +0530
X-Gm-Features: AclHuK8z21OahSGKxZJkHHl4QwGCa6UFLpgcI58u5NRwTzLJWRTQgLKYVsOlN_Y
Message-ID: <CAEBzjKEFZdKWHa5puYH6dKvaesCf-KGmZ+Z=fFECRi_0PhiY_A@mail.gmail.com>
Subject: Re: [PATCH net] net/rds: ib: drop fragments shorter than the
 header-declared length
To: Allison Henderson <achender@kernel.org>
Cc: netdev@vger.kernel.org, linux-rdma@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, Giovanni Vignone <gio@octane.security>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Allison,

Thanks very much =E2=80=94 I'll carry your Reviewed-by on the next revision=
:

Reviewed-by: Allison Henderson <achender@kernel.org>

And no objection at all to crediting the earlier private report:

Reported-by: sungbyeongchan <tjdqudcks0424@naver.com>

This bug was found and reported by our team at Octane Security. Would
it be okay if we add Reported-by tags for the people on our side who
reported it along with the first reporter in the V2 patch?

Reported-by: Shubham Antil <shubham@octane.security>
Reported-by: Giovanni Vignone <gio@octane.security>
Reported-by: Robert van Eijk <robert@octane.security>
Reported-by: Paolo Gentry <paolo@octane.security>

I'm happy to send a v2 with everything folded in - your Reviewed-by,
sungbyeongchan's Reported-by and ours. Just let me know which you
prefer.

Thanks again,
Shubham Antil

On Wed, Oct 7, 2026 at 6:43=E2=80=AFAM Allison Henderson <achender@kernel.o=
rg> wrote:
>
> On Tue, 2026-10-06 at 18:27 +0530, Shubham Antil wrote:
> > rds_ib_process_recv() accepts an incoming RDS/IB fragment once the
> > receive completion reports at least an RDS header
> > (data_len >=3D sizeof(struct rds_header)).  It then trusts the
> > header-declared total message length h_len: for the first fragment of
> > a message it stores be32_to_cpu(hdr->h_len) in ic->i_recv_data_rem,
> > and rds_ib_inc_copy_to_user() later copies up to h_len bytes from the
> > fragment pages to userspace on recvmsg().
> >
> > The number of payload bytes actually received into the fragment page is
> > data_len (after subtracting the header), but it is never checked agains=
t
> > the amount the fragment is accounted to contribute to the message,
> > min(i_recv_data_rem, RDS_FRAG_SIZE).  A fragment whose header advertise=
s
> > a larger h_len than the payload it delivers is still linked onto the
> > reassembly list.  The fragment page comes from the per-CPU receive cach=
e
> > and is not zeroed, so rds_ib_inc_copy_to_user() then copies up to h_len
> > bytes to the PF_RDS reader, including the uninitialized tail the receiv=
e
> > never wrote.
> >
> > Reject a fragment that carries fewer payload bytes than it is accounted
> > to contribute before linking it onto the reassembly list.
> >
> > The issue is reproducible under KMSAN with two hosts over rdma_rxe
> > (Soft-RoCE); the same reproducer confirms the fix stops it.
> >
> > Fixes: 1e23b3ee0e94 ("RDS/IB: Receive datagrams via IB")
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Shubham Antil <shubham@octane.security>
>
> Hi Shubham,
>
> Thanks for working on this.  This patch looks good to me, you can add my =
rvb:
> Reviewed-by: Allison Henderson <achender@kernel.org>
>
> Also, this bug was found and reported privately by another contributor, w=
hom I had
> counseled to send a patch publicly before I had noticed this one.
> https://lore.kernel.org/netdev/20261006205204.1322102-1-tjdqudcks0424@nav=
er.com/
>
> I find that patches equivalent, and this patch was posted first. But I wo=
uld like to apply
> the reported by tag since sungbyeongchan was the first to report it.
> Reported-by: sungbyeongchan <tjdqudcks0424@naver.com>
>
> Thank you both for working on this bug!
> Allison
>
> > ---
> >  net/rds/ib_recv.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/net/rds/ib_recv.c b/net/rds/ib_recv.c
> > index bd6cb3ffa..fee77b6d7 100644
> > --- a/net/rds/ib_recv.c
> > +++ b/net/rds/ib_recv.c
> > @@ -949,6 +949,15 @@ static void rds_ib_process_recv(struct rds_connect=
ion *conn,
> >               }
> >       }
> >
> > +     /* h_len must be backed by the payload actually received (data_le=
n),
> > +      * else the unwritten frag-page tail is copied to userspace.
> > +      */
> > +     if (data_len < min_t(u32, ic->i_recv_data_rem, RDS_FRAG_SIZE)) {
> > +             rds_ib_conn_error(conn,
> > +                     "fragment shorter than header-declared length; fo=
rcing reconnect\n");
> > +             goto done;
> > +     }
> > +
> >       list_add_tail(&recv->r_frag->f_item, &ibinc->ii_frags);
> >       recv->r_frag =3D NULL;
> >
>
