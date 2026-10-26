Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793018069;
	b=xenbLWFk5qv7+zX8qat0zJ3Ckre5+fgeof+/Zsh5fSruAouAaXIspVC3XkZBDq00m5rz
	 y3xngwZ3+YkPK7twSEJTYEyfkNGBn5VDwSMkwn3tvuJYQxduSuEF/u2XJQqjmTwg/AIUp
	 2SintqOrKRdTD5vcC8l3ohHmup04nIufsddf67/Y4NzardkwId0hBrJARVpRvw7KuNwoA
	 zPe3gT7k7GXhCIX9raBIjA8WBYKUjTII+8WFRTbtHHZbDa3+zIU++qLpbM9zvXsxKgY/s
	 +ViUpRLlNSJulnfdjGrysZPf2fVZ9ZEnfY12yizmavUSFEW+Hrgoqw143BvuU4tSH0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SaxBkLbIzbkEbnKAF/XTN2o3bSo+ZWaTXQ9XQ6IuC4s=;
	b=wTCxcuKaxzLQJUABRyfNwdQe5ALlPvJUmgwTof22+93hA0pc5wUaYyF3Zmx6sB6ODOvO
	 lxlrCLwdwEtUEM6HkG0Rv7eGDttJa+PmvSlBLFVm1vV1fcF4+vgte9FdIWxkArBfzyd/1
	 RrQilBtck1JNyAAQFTa50iRR6L1HPW8LNhfoxwYspohb+jAS0f2BqIA7CSa/SYM0cqHiX
	 vd3js7UluKxTmaH/U4xVXzspsI7zS39BG+8JzeYLDp+lnMpRWj3EwtZBOUfvF8lAUjzsa
	 GCGg151l/L7csPy6VqHWPVTt9flJpqCdOjHi+cJOWaRH6gGyxyYZ2XXSAQMNK5EmlQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HdtFncM0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EE7606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5EE7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HdtFncM0
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9995ce866so26870655ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793018068; cv=none;
        d=google.com; s=arc-20260327;
        b=QNuQGT//stl5KC+Mgt3XcmBPXocFsPgLh7JLr1LkzIosEDHp0nTJa6lHbxHdGyez1p
         YJxa1vsJjLQaa8NaxNRaNQp0iP1KyfeSZoz0hE6CNvoyZGNZnWBrkDGRgsFMA535VXsZ
         mc+S1mi9K4mtc8SCn4NNOxp8add4xFKNlHqBtz2/GM3RKZY1sfVP5LfT40DqS1UsvDjK
         Gudv0lZQzGzyeXLP67ph9ym4YkzXuAlADrj3kQC4Cu1nMYeBgIk9YiK6n3adQr38UEf/
         1heNEXIeUEcgHdAAcdLSL85sel8tGmrk2dWACbY/QchlQR7zB1tArdWhCOBLW2xfA3jq
         w0Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SaxBkLbIzbkEbnKAF/XTN2o3bSo+ZWaTXQ9XQ6IuC4s=;
        fh=ezqGscJz0h7xI7hK97t5nRXKWL8lpVAnWUo5KySKB2A=;
        b=IM09LrjFLtcJszjpVjjggHabU48e03FwvwRediblUjFd1mWEfX0jD5yk7jK1O8LMuI
         JLLHKleG/0v8VE52EIvfAXpFw0o3BP5UmKpNJF2nvZujZg3KN/lb0wRvRKhzX5pFP3pN
         qOsNsfgBL7zDfKfXy5gOc7gxSkgfFSlvMlw6A/YQbGvX1M+S3CXSNdsSIaKfDM1ujNri
         rrbNJcmD6OvCmlnyHBxa0396lnkJCSEkYUac2OI5WgobMRBWFuGcvyU5Aq1N8FoJECUs
         sTw247JFDXpemovbfaBbzTN85z19DziPLsp30ZKDU0ddxKS1Q9IncBfpI2eITLsH/FRV
         krFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793018068; x=1793622868; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SaxBkLbIzbkEbnKAF/XTN2o3bSo+ZWaTXQ9XQ6IuC4s=;
        b=HdtFncM04w4/76lIdgLfZLw/0vgYLnhbPuHclib1LzHCRj0B1KxFZekGEulO7gtq0i
         POQFwKjj3LXA2dcopzYhgWNgZVrCWwBJLkmFGbQaQmsO/c6Q1q4XO0ouSL8XC7x45/dG
         um54EGBS+m6o8La2GkzbOUNBl00ocendPMUC4FY8qPvHfiBE14TfsV8EHQymgVVUgUJ3
         rCQ0Q8nLVU2lfnQDMCfYtUF915/7YSDk499Rh45X2gFlBYLHwdKfTlBzUSIQrxjWe4tU
         Bnwlr+e+VjVQX273sUjj3mClGgrORgkouFyUX0sQzGugEhDMrQrX5xTow4oT9R47UA2T
         JfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018068; x=1793622868;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SaxBkLbIzbkEbnKAF/XTN2o3bSo+ZWaTXQ9XQ6IuC4s=;
        b=qTXVxzrmNZ7Y1HAbJm3i/DazW28Gm2HVunjIYzz28lzLbInSQg1SRgrf7gJ1R/6qgM
         EvkzzEKciJbLpOc7H8YVy3Gm6Ea6yeUVbHVoX/TvJPWSotvQUnAL6YKvcOyxouZbHMKO
         /La7wnTfL6nD9L+UtgULGVs9LQEnG9QGU/OuMjClVOAOXxVVvULVnpNu80OzWToGaxZk
         6MwPDlPEPRwXUAJesOpzKwwYPANNsklLtQwl195NbFZojZw2i1biiAjZhYNLv6BlYj3M
         ttmspMszKxunXIhelwajA2VNNzgw4KYZY85Ov8YcGqynIeduyUrsyMx4i+jSY8l79eXB
         FFxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJDWNv1uqmiZXIxggBw+qnEuQPyJuuYdcvZXWqC79rA35Yp7dPmZG7hnwIvopiEuL239Uzsiv34QigndM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2Smh2COFimTlJD+x4j4MxGSRicbehvUlMefrO/dDhqamlk97+
	iSwI0CTqZYKm9UhcpC7OnzKVER5RFqfM4lWkkb8G73O/kPMFFOfZ5l4uKqX+KNQrLqh/JOQxOkM
	bX4jKz/Ns47lQSbIWT53+KxUXHziDAoc=
X-Gm-Gg: AYBFou0ordTyObOjjNIiHzimbS33s5/xf9+meUh/OwqJOAfPyXSK5PC3n9HopwoWTY0
	I27c9MddTyPnH8MG3pnuNgl+X+d39lRQvRd3cX/XtLdaPU+2Q4aMQxm60SArk6RxnfysoeZJDww
	VLKikJxj3NFz5yjDyPKV6Cb0tfO/HtJ/nruCpzdKFxPdat2rj366XGHpjzNVKtEHIYeVv4PXrFl
	hLL9n3MLqkn3mxPVGJjV0e6+9+z77LR+OFQpbssKgKe0NXWEvfgz5MpZUP1m5359gquO6Vrb8qT
	Os3SYdiyyvpHElWf3i/PhE/PiFy66hyhLEVXZ430V30cYpWBRnmHWfZCyKx9WgCEu4JRn6Qxvav
	mz0edL7Y5GOS5nTg5aQJgLHUYrqgLjyHlaWyTR1Y=
X-Received: by 2002:a17:903:3ba5:b0:2ea:33eb:7375 with SMTP id
 d9443c01a7336-2ea9c7fb26fmr60059095ad.45.1793018067828; Mon, 26 Oct 2026
 05:34:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024091256.17918-1-testwrzwrz@gmail.com> <20261024141157.59301-1-testwrzwrz@gmail.com>
 <20261024141157.59301-2-testwrzwrz@gmail.com> <at82NLzM7g8HGgum@boxer>
In-Reply-To: <at82NLzM7g8HGgum@boxer>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Mon, 26 Oct 2026 14:34:15 +0200
X-Gm-Features: AclHuK86Nf4MoOy1SZ-DK_sdM59j4Q0Ek644A1GPV_2QYD872VpQvocWDHsm21I
Message-ID: <CAJ8uoz0bU0ETmEp0Nv9V4Q-H272D9dmyuK8vFj+B_un-rA4VoA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] xsk: defer software checksum until the skb is complete
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Rongzheng Wang <testwrzwrz@gmail.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, stable@vger.kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 13:32, Maciej Fijalkowski
<maciej.fijalkowski@intel.com> wrote:
>
> On Sat, Oct 24, 2026 at 10:11:56PM +0800, Rongzheng Wang wrote:
> > When XDP_UMEM_TX_SW_CSUM is used with multi-buffer TX, xsk_skb_metadata()
> > calls skb_checksum_help() while only the first descriptor has been added to
> > the skb. The checksum therefore covers just the first fragment, and
> > skb_checksum_help() sets ip_summed to CHECKSUM_NONE, so the remaining
> > fragments are never included in the checksum.
> >
> > Move the software checksum calculation to the point where the last
> > descriptor has been added to the skb.
> >
> > On a checksum failure the packet is now dropped instead of being returned
> > to the application for a retry. This path is not reachable with the
> > existing metadata validation, but the behavior change is intentional.
> >
> > Fixes: 11614723af26 ("xsk: Add option to calculate TX checksum in SW")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Rongzheng Wang <testwrzwrz@gmail.com>
> > ---
> >  net/xdp/xsk.c | 22 ++++++++++++++--------
> >  1 file changed, 14 insertions(+), 8 deletions(-)
> >
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 33475b180ea6..65be2a368325 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -1011,14 +1011,6 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
> >               skb->csum_start = hr + csum_start;
> >               skb->csum_offset = csum_offset;
> >               skb->ip_summed = CHECKSUM_PARTIAL;
> > -
> > -             if (unlikely(pool->tx_sw_csum)) {
> > -                     int err;
> > -
> > -                     err = skb_checksum_help(skb);
> > -                     if (err)
> > -                             return err;
> > -             }
> >       }
> >
> >       if (flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
> > @@ -1030,6 +1022,14 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
> >       return 0;
> >  }
> >
> > +static int xsk_skb_sw_csum(struct sk_buff *skb, struct xsk_buff_pool *pool)
> > +{
> > +     if (!pool->tx_sw_csum || skb->ip_summed != CHECKSUM_PARTIAL)
>
> If i am reading this right check against ip_summed is a way to tell that
> first frag had XDP_TXMD_FLAGS_CHECKSUM flag set.
>
> Agreed with Jason to preserve unlikely() when checking pool->tx_sw_csum.
>
> Regarding skb drop, I am leaning towards this, I don't see much sense in
> retry when packet is malformed? Not sure how this could be communicated up
> to user space.

Do we need a new error statistics counter, e.g. tx_malformed_packet or
tx_invalid_packet? We do have one for invalid descriptors, but that
does not really apply here.

> > +             return 0;
> > +
> > +     return skb_checksum_help(skb);
> > +}
> > +
> >  static struct sk_buff *xsk_build_skb_zerocopy(struct xdp_sock *xs,
> >                                             struct xdp_desc *desc)
> >  {
> > @@ -1275,6 +1275,12 @@ static int __xsk_generic_xmit(struct sock *sk)
> >               if (xp_mb_desc(&desc)) {
> >                       xs->skb = skb;
> >                       continue;
> > +             } else {
> > +                     err = xsk_skb_sw_csum(skb, xs->pool);
> > +                     if (unlikely(err)) {
> > +                             xsk_drop_skb(skb);
> > +                             goto out;
> > +                     }
> >               }
> >
> >               err = __dev_direct_xmit(skb, xs->queue_id);
> > --
> > 2.39.5 (Apple Git-154)
> >
>
