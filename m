Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793382450;
	b=J5iIsvoWVmntWbeAaKP0EGepOGJTfppG7CME3gYwYEVGT7gCvMfJ9fK71WkXE8b57zw3
	 440fQVqMFYzesxiKmuxjkbfVPRvJfFyagbV4EUoPjpCZWt2tgKjH19hjM6MFL5wLoMd7m
	 nO0Lo20IWbzbSPMOOP0CBkjF84o36D4wgZWv6F80fCQl5IPQK9aWZuaPu8azQ+a6Y/bG6
	 rYxnM6zY3gsvIMtXNT6oEPtpn6mY9BWzvZHYE7WK1I3QLqpKj/AV7e+CXC13dzz7FX4M6
	 Jghv7cZHdSacRHQzpyz3P+Eydwtb2YuvpkI5xVwOcd/x+P8YPK5LKspoO8dASGuYdmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sIhxZYiznvT7xWI+IfdwWWUWBk2bBwQUSMlQVrH0t28=;
	b=y5zwASUBSz6CKdNDHX9uvM9LPQgbiK+euwfQaohMMpbvcRUi2QHJBErxqV2rGhZTPk/q
	 wxFgHZsYIV7VnuWvIE9hg8NvnodOcvQfQiiA8ByI7yGGpxCQbm8aPWcfJ765wzRWT275F
	 /iINvyWJGd1TnAeim8/ezgWlRT9996FN/KZhU6d5DUbw7YGgGbkkdYOi1/Nb2UvnTAiwr
	 8CTHLu97cOmwK+59Lr5x/kWvJcJTF+LfmRAlEDRtSYPUl2/VDOxrN/fp3pekwRt34VErL
	 INV/f/M8jGPiF7vmyOUpeZW69p2FPuubQDRYdl4BCud/i3PSJ7Hd8HYbC7YewBx2giA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XiJOZf2q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BADB606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BADB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XiJOZf2q
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-886e61fa30fso430442b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793382450; cv=none;
        d=google.com; s=arc-20260327;
        b=XABj1bRoZ2QfaHTKZZbWXBPXNkMW2dehJf3/c8B1JIFVkIy3iSBz0mH0W5UBz9Om22
         rkxHmjLBjBriS8AoT/qX2X4rPcwCsI+lqobuCJZr9iqSddla3p+6RjZZgJqCpPFFnufj
         mIx42+NCGHPvxO2WUCFDVfItpxLrq6L+fwO3UZaYGbFRE9Qb6C84Cj26tYWvuslak30R
         YDvPenDefSoMso6gl1U1wlQw+MGUHkkGRh9Zu+TmXR4e+lvz2fTMtfDdxZXuVQDhrWhP
         LvPD7aynKSorHmUOFyidBzNgoL+gnNPQFMwZSkqRwmksC8KjdoImuNHhw6dtr7SCZ1Zo
         7t6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sIhxZYiznvT7xWI+IfdwWWUWBk2bBwQUSMlQVrH0t28=;
        fh=CEq3yyDlPiaU2qMH2oCoASs6V/BGoBgDaswr98EDgL4=;
        b=ZWbjR92JRQ8hVyezwkyy88Q3TRGf6tFfWKjolgSV0zUJ1Lg4pVwVpyNRYtNYnp6cSb
         4OBPcRFvvTD5gYs94VwQ0z0dpwkoeGCbZ3gzoV8w25mjK1jmg6GCnBUvoIZ2/bahx6QM
         HJghUpeiQlwssiHSls+F1p3KSS1IubbRQf92T2QhkCfkMJFtLdDB2kSQOPwsLueEVqUx
         5AYSi6L5OYAOPxu95j1QMeYPVQp8Oa2QVEo1oswEgwNK150S4njUPuiR4WNpIPBuYk+9
         wieOPwvrOhMnzmrnkvnccvQZ8WriMJ+YQH62BCEoAh0YbzyHjnrF6URgMAyt8reyFB6Y
         t9FQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793382450; x=1793987250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sIhxZYiznvT7xWI+IfdwWWUWBk2bBwQUSMlQVrH0t28=;
        b=XiJOZf2qGnVvMOKzdKKgRpWoyWi7lo7RmWu0V8WqgQ1k3lzoL0/Dv5fQACqCRG6kM1
         PDsgKhCrs4wpWVvAYSFUP4vK7JaU/AJH9EGqZzKU82dbSRjoTp4O90spiuLfMo+YIHHM
         HaSLbVBL77GBIbulXUBDdFNIUrME8XK6DSOB1WKKJD3EZtLWKCPWxXTl7lZ+/+6tyYv5
         lVX69+D53vs8zH6azIL0M12NDNgxtlMKZXOtIaFgeKUewfILzXlkRBiV9y65ySTvgRak
         QVcOFQipiM98Snkj9OKCPpgX0q7tQgblxQkMG73TN6DbZaMN/diAXX0h4MtTjo7hF/xT
         DP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382450; x=1793987250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIhxZYiznvT7xWI+IfdwWWUWBk2bBwQUSMlQVrH0t28=;
        b=mYTrx24Vy1lF9T7SOiwG2rP59nsrEQD/DhWU6mSRdSGl2ijW3+K7jCCkAcZTwQLotZ
         eoWg89kvmzKJy/jWhRwd4Rz3RTYn7alxFljlhqsUTF+Ad3pVAAMJID+say0FiSmFHjT4
         NPYPmO0NONAxm/VdcF769R808QgFu7xJj0hv8s4cd8oyPipWBw2U52ay9POszoxAMqgO
         Q/tHKAH+ErpNSnYwRManhsFOK/aEXX80fYQAeURHTEsVFxdyKf4pcweVAKHPSjJxt1Cu
         QoDeezkk/rbS+H4Vz5Kxy78DumjNkCnjXTd9efnXo/br13QRuA1YjCaKNoeo7rC45e4E
         qu2A==
X-Forwarded-Encrypted: i=1; AKwUvBzaJ1RU1oquK8/JHEbL74kcCIS92bXdfhYvYgdaC85GpCvO49E/iJ0UyQfXSPqyZzMYcZqItwc8yAkwbiw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVvMDDbJSWRcauiJ9qSyQG0/extASbah/5kv8fFYvvsgDyrc6L
	/GInM6QUo56Nr+ZyfyZNB7xo+SRzw1VGZxp4vqj82hhZQl0M0ACec7qeSq0qvpaqJq6VU+HJyId
	3kg9o19vNYdl1Q/PGkQBtoejp5+xajb4=
X-Gm-Gg: AYBFou34ab3dYRUWsA4MBVhz8AXEEf6Qk01B8TorjWNZvOdgX4tfEAmuDUsj8rTsheD
	M438dzSxjXTo5pmIDlWzCWpfBaonQAUrO0j3vU3yycXDooQIUiznDadFkwHMJ7wBpR7LRgmipPf
	BEDXziqYXpUtCsZLXt7v86rXndCzOZmCoU3yBgOwJD06GLH4qRHSAJBRalvXFFM63EqcUAmew9n
	d856kWKd/2tngSl16+/8Yt83s1ipzFVfgqOPDcPvQ3w6X8T63VQBd4Dq0DHfBjtyZZDaRzOTTtB
	GcfBZFrdcz7XzfKFhzX4NAMuDAuSxmNO2VIax7g3oRP9KQRwB3Cdm2rTRBYS62LStZ8iIdBt41r
	I0bPRKXjYSr440OWF+k12dtULuI16mLFXqrUOvkcMHN0Bfbt2pVAeXmHfnPhY8IlJpjmtFIMZ+Q
	wRwcSt0t9l3l30kgW7mx5y7qNabEpyR5W4G2n9
X-Received: by 2002:a05:6a21:3b45:b0:3e2:325f:576b with SMTP id
 adf61e73a8af0-3e928a71e94mr2185777637.65.1793382449721; Fri, 30 Oct 2026
 10:47:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027082405.1297-1-shengshilingmu97@gmail.com>
In-Reply-To: <20261027082405.1297-1-shengshilingmu97@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 30 Oct 2026 13:47:18 -0400
X-Gm-Features: AclHuK_iwRZMverILPQ6aqdRr0bJylTP3g7Evr_UNs3S8h82CvZ8DH_nxsbSAhw
Message-ID: <CADvbK_eGiwO13sCNqpqHeiTLkQgTU_6Dt+Q+EVZ-CQ6WvRB9mg@mail.gmail.com>
Subject: Re: [PATCH net] sctp: account for chunk padding in sctp_init_cause()
To: Masafumi Suzuki <shengshilingmu97@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:32=E2=80=AFAM Masafumi Suzuki
<shengshilingmu97@gmail.com> wrote:
>
> sctp_init_cause() accepts a chunk when skb_tailroom() can hold the
> cause header and the payload. sctp_addto_chunk() then writes 0-3
> bytes of padding before that header so the chunk stays 4-byte
> aligned. The check does not include the padding, and the following
> skb_put() calls skb_over_panic() from softirq.
>
> Count the padding sctp_addto_chunk() is about to write. The cause
> length on the wire stays the header plus the payload.
>
> Fixes: 8914f4bace3f ("sctp: add sctp_make_op_error_limited and reuse inne=
r functions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Masafumi Suzuki <shengshilingmu97@gmail.com>
> ---
>  net/sctp/sm_make_chunk.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
> index 84a4c97d0f75..8933caadcdb6 100644
> --- a/net/sctp/sm_make_chunk.c
> +++ b/net/sctp/sm_make_chunk.c
> @@ -133,20 +133,27 @@ static const struct sctp_paramhdr prsctp_param =3D =
{
>   * cause codes will be embedded inside an abort chunk.
>   */
>  int sctp_init_cause(struct sctp_chunk *chunk, __be16 cause_code,
>                     size_t paylen)
>  {
>         struct sctp_errhdr err;
> +       int chunklen, padlen;
>         __u16 len;
>
>         /* Cause code constants are now defined in network order.  */
>         err.cause =3D cause_code;
>         len =3D sizeof(err) + paylen;
>         err.length =3D htons(len);
>
> -       if (skb_tailroom(chunk->skb) < len)
> +       /* sctp_addto_chunk() pads the chunk up to a 4-byte boundary befo=
re
> +        * appending the cause, so account for that padding here as well.
> +        */
> +       chunklen =3D ntohs(chunk->chunk_hdr->length);
> +       padlen =3D SCTP_PAD4(chunklen) - chunklen;
> +
> +       if (skb_tailroom(chunk->skb) < padlen + len)
>                 return -ENOSPC;
>
>         chunk->subh.err_hdr =3D sctp_addto_chunk(chunk, sizeof(err), &err=
);
>
>         return 0;
>  }
> --
> 2.47.0

Acked-by: Xin Long <lucien.xin@gmail.com>
