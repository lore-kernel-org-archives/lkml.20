Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792708620;
	b=xxIf5Ny5PLR8Ry7Z7NqUMMsUkYfrM2jcCdsIAUJQyfDt29m7fQIgJEb2lGBl/S30iQ2M
	 8ENpmFdzV0f11fYoA5fI99I54deB61ZeIK3cmiGK0DRuBYP9icvYJb3Db/zwVYjGPwvky
	 szix6xQO1F7VQKWxm91OVkHegys25LiioK5ic+vjwTQUPEAJBu9EWGsxptbbRu97wib5G
	 opikTP/Z2XiSIAVR9KUdTsQbYI5ifdrVKktoTnnF0OtrwYhd8+uBiDrWfjgrc+EHLZuRz
	 h2UmkdaAx78wytreBhxJQWtOqBohDjn6Lap9hwOzpyiHu/wDas9nvvQRWDvfitpVgiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MH1HzOWc8xmkfAC3/eYTHqPYJe71FCQa1AkNGEWJ6tQ=;
	b=m3SVRzjlVaMGbA9BEZxje1PEKQ8SdBVUxJoS7UHeUBxauKAMZxZkF2GsIkI0ESFVn1je
	 j1SxpujKJiaukZYS7DG53uum0op6eakc+YvMcrO2kkHN6yHyxqnU2/jOIFnyJjWgqTNnO
	 rlVDHt0FlgnXdCbaLOYqivB3OqBiWUzDF+UxLhZ6jDrfa8hMAgzOaiPYA0S7L7TWyvFB/
	 kW9iTrwBKA1eglddEjuJoR7TtKB+fAKILP0vmVBdvhFgkKZXQkTRw86UFh+Si+rHl6750
	 9KThOzZwpgxDMIosy+SR7ST+vaMb5L+feuCOfVkj5c9ZcYLihEalidoVyTYCigmyrtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=NsruxeEz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327AB606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 327AB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=NsruxeEz
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso121443241.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792708618; cv=none;
        d=google.com; s=arc-20260327;
        b=Oig2fpzDplHFLuwHgsjP6IXtjiv1UZTThA8b2jz95jTRiztKWfOf44a+5kCmiht4rz
         Gk5NnwzmBbKDPWz3pT5RYWcqqDsPz8NtHiZzMroNadCyZHpH4dnzu7QovStVNdtaN/ry
         hm9UHPuOktvM/4i/1fLgyfqbgyX6MUyPzT7RuLjO89JLfkYB1Q08s5+1rjP+PmxrMreY
         oHFRtWvKCiB8wrps1Oh/NLDcHKGAsAsyuhfPGhSqJCUY1OmMVo1uWVw8CIjjRIOpf/S9
         REW7+I0otV8c4Pd/NZMHrzf6vLqmYX1qtlB8l3gZBxlR7dSft4q8NqWjj4b6u65kRGGh
         DAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MH1HzOWc8xmkfAC3/eYTHqPYJe71FCQa1AkNGEWJ6tQ=;
        fh=rww6ymGdtqtr2VS5ubqm+/pOKwBJ0LA/42F70kxTJr4=;
        b=k/99D3MZ1wS3EEJ8EOI/d2T+0i3iz53TEj7TYoLj8qNXTPOTv94Mse83wvxRjKC2M8
         Nkic4of+6YqzCVZc5KhQ41N+dvfkVtUILCf8ku8KQHWzXcGUm40M4VKZLrgsflX0tr3w
         2vPhR69Xvk55bmKwvT2hhsRSSqbA9ti7uY8GgdWUY3mPMkaBON5p6LTvVP6EBSQH3HHC
         /exh3kLfOqJTrMFq1uSAmdPRLtj0uUmkyVtoFXZn5T1tZTaZxgAjeM52J1BhK+smI73m
         8lH5PcL9aCMT+BASX2m2Yn4VOV9pGdU6G6e4RSAEWGFE37Npph29IJeUtA6RocT8TnBL
         Q+LA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1792708618; x=1793313418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MH1HzOWc8xmkfAC3/eYTHqPYJe71FCQa1AkNGEWJ6tQ=;
        b=NsruxeEzRlxDlc/Cq/XLpFOHKF6e9b4Ol81RnVTuC4azwcoYJff8QakFO/E+YQISsA
         mpaJsZBNOglprF3P7nX+5PbcMtvRujR6EkPsey+IbejBmtE2ZWEaVBE5icOAa0gCHMq1
         VSZ2K7YSmyfhCla3gOh5b2iw2W/UTKck2VLpq8TRoQPert6/4jOjdL5Zua3+w53Zp8yM
         evI2FiIeOwNK1OdfoHqgwsVMFDaOX9cia6cMYTq19D7tu9g1luMbh6GMP4bsh0Aimj6/
         3mmeIU17zxGuBgUtxqFCbWBkyQBUb0ahmwouw6pGjXutQAG/ienfwm3wykChWz1KcIkx
         91YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792708618; x=1793313418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MH1HzOWc8xmkfAC3/eYTHqPYJe71FCQa1AkNGEWJ6tQ=;
        b=loCom/MvMZ3XmTiO6iixsJ/Hwp236J5TVxFNypoQnst9avSxOwXxNiqBpQ+DMHAeHN
         tYk8chQBBK/eC1Ngc0vZdi7Y6kAYz8gCHuClnlohD+HfB5DD3TZbWIyJvOBT5wypVBk1
         O3ytNi6UUy7QBI8u7PgfJEHbuyuVEZPCtSdb5/9mChh3Zapz5sqebOFGy+KtO/dmAWBn
         lCHaboc8Z5ev4ddJIhL9lKs6jDp8oSGcg8tYgtEb/EZZk75bmSu7Zr9HT5p4Jz/uxKtI
         lg2AAL98F+bDHTaBLZpNHp6xn2MeonMejRHVLDXFHr8Pzrf0dxGhiazD155ASBvJxflQ
         bfTg==
X-Forwarded-Encrypted: i=1; AKwUvBwM0TVC3hxrycd840GvrA9ikeGPdQKrMS2wRy0wlob9KUhdDksT4PPmvsUc6f/i8LWJIgUN64L5IoRrez0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDUQ4hOiOYj6XXBw4IbgE2xc34Abunpryn+poHwzRIzKY7hmyC
	E6wYlombFQZ3ZWQ+rYpGDiKqViEugY5xAHVPTpFCqqOMbcBkvDG58ASVbbUzjNZIx+CM+wdm0jO
	bBcqmw03YJ6mTRNVXZfPZXzcHtr+FnOBAbj/UVhOg/w==
X-Gm-Gg: AYBFou2rKX09IvaP4JRF1mk9KdH9I7L/KsacSHTjFeAtXrNV0/r6mFJWQe89Am3hgaY
	TUtdx2y210VLm+rH0aZD91mQrRy4mWdWj0VlqF1AYJHfwBVxrcUW6FsXY04rqHXNdtr6K1nMeF/
	UbCnMO02gsC6eDFM3I44xrRKbO4v0yw7HaF2goHa9Z5mKZWK1aB8/yEOEXxF16yCzHtYXfQj9ma
	x3jtKihpAiZqokxsvfL1zvndQ43nigksMXotM4eOethZIAqzhCJyEHwGw8aBf2xW7lqmI37PAxg
	lBI3T/WpIn0oiiJPOxtMeTvOyrRyoMH946j8vtg6YngSh1mNCCUm9VwZ++q1LguSOTM3Z9fbIhI
	s87CHfzIlB3bd8VW3S66vmFsazkCS2epl8Qo9+4NMqHchmTF+a9iKdX3xgc0HosDQuLQlh4v2ws
	QwK6LpRyOT0JtxV3grZl3iU/UHx2OpyYg7vfK295niQc2+/TE3SVXYAGPh5vL3Uoix8bxoQm8/9
	0sksqY4dLQQPSggIWmT4F4G7w==
X-Received: by 2002:a05:6102:6447:b0:7c3:9464:efaa with SMTP id
 ada2fe7eead31-7ccc300c580mr368655137.2.1792708617978; Thu, 22 Oct 2026
 15:36:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019212651.733565-1-rjethwani@purestorage.com> <atiAExld_bpR7sQm@krikkit>
In-Reply-To: <atiAExld_bpR7sQm@krikkit>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Thu, 22 Oct 2026 15:36:47 -0700
X-Gm-Features: AclHuK-hRjTDoTYC3L_MNULYjp_mlORTyN-OWMcxmoOWe4G0to44llKlZ5zfS80
Message-ID: <CAKaoeS39Xtrx3NV+YShnx=tOo5qV6tYkgZiUzQDaDi_Cw3x7-A@mail.gmail.com>
Subject: Re: [PATCH net] tls: device: keep tls_sw_fallback() from encrypting
 its own output
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, john.fastabend@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 2:04=E2=80=AFAM Sabrina Dubroca <sd@queasysnail.net=
> wrote:
>
> 2026-10-19, 15:26:51 -0600, Rishikesh Jethwani wrote:
> > A socket offloaded through a bond has every skb validated twice, once
> > at the master and again at the slave. tls_validate_xmit_skb() passes
> > the master-level call through for that reason (netif_is_bond_master()),
> > but tls_validate_xmit_skb_sw(), the validator tls_device_down()
> > installs, calls tls_sw_fallback() unconditionally, so it encrypts the
> > master-level ciphertext a second time with the same rcd_sn and IV. This
> > cancels the CTR keystream and exposes plaintext on the wire. For a
> > complete record encrypted twice in one skb, the second pass also
> > generates a valid GCM tag, so the peer accepts corrupted data without
> > an authentication failure.
> >
> > Guard on the content rather than the device. Offload plaintext always
> > carries the decrypted bit (tls_push_data() and
> > tls_device_write_space() send with MSG_SENDPAGE_DECRYPTED), so
> > tls_sw_fallback() can pass through any skb without it: such a skb needs
> > no offload encryption. complete_skb() now clears the bit that
> > skb_copy_header() copied from the plaintext original, so the fallback's
> > own output passes through any later validation pass untouched. This
> > also does not rely on every path validating a skb at both the master
> > and the slave.
> >
> > Tested on two hosts back to back over a mlx5 port, the only slave of
> > a bond0 (balance-xor, layer3+4), so each transmit is validated at the
>
> As in another patch, a couple of selftests for "offload over
> bond->NIC" would be good.

Will do. The hw offload test these would go into is still under
review:

https://lore.kernel.org/netdev/20261020181147.939575-2-rjethwani@purestorag=
e.com/

Would you prefer I fold this fix and the bond tests into the next
revision of that series, or wait until it's applied and send v2 of
this patch with the tests on top?

> > master and again at the slave. Run from each host as sender, a TLS 1.2
> > AES-GCM-128 TX socket kept open across an administrative bounce of the
> > slave leaked every later record as plaintext before the fix; after it
> > each record is encrypted exactly once and the kTLS peer reads the
> > stream intact.
>
> The wording and verbosity of this section ("administrative bounce", 3
> lines to say "before it didn't work and now it does" which IMO
> shouldn't even have to be said) needs to be cleaned up. The rest of
> the commit message as well.
>
> > Fixes: c55dcdd435aa ("net/tls: Fix use-after-free after the TLS device =
goes down and up")
> > Cc: stable@vger.kernel.org # needs commit fc6d80eb5044 ("tcp: prevent c=
ollapsing skbs across boundary in rtx queue")
> > Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
> > ---
> >  net/tls/tls_device_fallback.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/net/tls/tls_device_fallback.c b/net/tls/tls_device_fallbac=
k.c
> > index 3b7d0ab2bcf1..24fba12febd1 100644
> > --- a/net/tls/tls_device_fallback.c
> > +++ b/net/tls/tls_device_fallback.c
> > @@ -192,6 +192,14 @@ static void complete_skb(struct sk_buff *nskb, str=
uct sk_buff *skb, int headln)
> >       skb->destructor =3D NULL;
> >       skb->sk =3D NULL;
> >
> > +     /* nskb carries ciphertext now, but skb_copy_header() inherited t=
he
> > +      * plaintext original's decrypted bit. Clear it so the bit keeps =
meaning
> > +      * "still-plaintext, needs an encryptor": a requeued nskb would o=
therwise
> > +      * be re-validated and encrypted a second time on any re-entry in=
to
> > +      * tls_sw_fallback().
> > +      */
>
> "nskb is encrypted now" is enough. the rest of this comment (why it
> was set and what the bug would be) really doesn't belong here.
>
> > +     nskb->decrypted =3D 0;
> > +
> >       update_chksum(nskb, headln);
> >
> >       /* sock_efree means skb must gone through skb_orphan_partial() */
> > @@ -371,6 +379,17 @@ static struct sk_buff *tls_sw_fallback(struct sock=
 *sk, struct sk_buff *skb)
> >       s32 sync_size =3D 0;
> >       u64 rcd_sn;
> >
> > +     /* Only skbs carrying the decrypted bit hold plaintext that await=
s
> > +      * offload encryption; anything else needs no work here. That
> > +      * includes this function's own output (complete_skb() clears the
> > +      * bit skb_copy_header() inherited), which is seen again when a s=
kb
> > +      * is validated a second time, e.g. a bond master handing it to a
> > +      * slave via bond_dev_queue_xmit(). fill_sg_in() would map it bac=
k
> > +      * onto its own record by tcp_seq, reusing rcd_sn and IV.
> > +      */
>
> Sorry, I'm not reading all this. 0 or 1 line of comment here, nothing mor=
e.
>
> > +     if (!skb_is_decrypted(skb))
> > +             return skb;
> > +
> >       /* worst case is:
> >        * MAX_SKB_FRAGS in tls_record_info
> >        * MAX_SKB_FRAGS + 1 in SKB head and frags.
> > --
> > 2.50.1
> >
>
> --
> Sabrina
