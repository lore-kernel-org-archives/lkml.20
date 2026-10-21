Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792549534;
	b=ifbqkBKUcDlaBxBeK56v9j6Q1owH0rCn6HyfO9/i5/8VGpRm7EdeuU33aps3+lAkYbTz
	 Kf73XphZSnlPK9C2iId8Y1LtCAUwqQbnEI7afFWd4MwAPaJkJwwRysxFMVWgGf2D9V2AM
	 RzYj6DmOW73rVdwSnEj8zW+flCR6Fc3tQ2kq5fT8bfpr71mAOPwNMArdyXukZIOW4+GZu
	 S3Bx8zps7BSVs7iptoHlSljMDDE71bZyvFRynXW7oAtDBW5UF2G+F5ZadKH12ald4+VnU
	 Nzw6EJzMoo8Or68EHbzs86CIANkb1h9QJap8YMXisreTr8ULT0rtWj8gNxDqFDhoqnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GVRjqnqrO1TkJYy/+KOYddRQ6BdsaJ0o8sfMv9oU1Tg=;
	b=iTUtXMMJUpJvIZVVyg4uJQZgHMJf4K4KH84kfcCOv6sty+suz3UJebz8bFGfRVvWUYDB
	 ccEd/zCBcfTEV0J1OfuWwOHmInEXwxa91fvxnj9XAzhGwGK2p9n7s+CxdwOQTlji9xllQ
	 /GQljBtOqj52I6elAAX+OkGLvoVnPnpFG+iatiTxuvo80UHwwsAmNbq/794t241Zu3/dt
	 ixenY2eu0RAWAjIdMI0BZywCvoocBdzO/TJeq5BHm2mNPqNW+hfO9NcrMJ9xAnkKBpI24
	 LC5GaNOLT2fuepwWGhYE2Trl8FpbH6AS0/JqmE874OPKU8uu7MbzzOfhTUbKAjs18TQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jlEKSHfU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6457E606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6457E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jlEKSHfU
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d0so2126831fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792549532; cv=none;
        d=google.com; s=arc-20260327;
        b=Y2dMk9+wHcSm2s33tkv1Fthf6f0SLBBi2GUCTmDg+KFVn2/bzKs095x+cis56mEEYW
         Qx8y+hVr+LjDULG6XvCeSmnx+muzMX151EBm9XVPHtFqExA6s54+4chm+ByO1f1ij6h2
         P+NWCw5lI16QhGw8drsFBfyNn67HidDS7KLLTzO5q5U94289z+zGVbTgFaJMW9Mi54+y
         BcO6h3+MTkDSXmMV/SWOuYSZAafB048+PBGFzrY0fUZYn/JHgUSAO7Qvpoz22D/RiYRj
         MwkEC/2DTdEH9BE6BkiuR3tZrh726ChCQR22LCM7UJithA7UGjh1Hp2O1FVA3+e8tfeF
         29Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GVRjqnqrO1TkJYy/+KOYddRQ6BdsaJ0o8sfMv9oU1Tg=;
        fh=oXd8hkTyIzEf0cNMP/iJ+Gw3WfCmj6FwOPlalGCy9/4=;
        b=BOk4hqDmMSpw4SgExFumIoOaC/E5is+pzRhAyfXqGzzdHWx4igbGf3kMuRlZYB27RO
         rb+FZggJAKrJzuwyLWIJwqtNAemTAAhqRYltRrBreOnrEFKMxkEDDf+L/w2Uf9IyU9sT
         Vk58T1EEgYhdaCjEYlp8w/4uMuFI1VgcoDGKviwoc8I2DDuNC0nuU7atUVbycfOJBmSC
         JQfJt1xjFA28f/y7LQpto4tffgqxPzdv0RSyPXYE2J1XkvC5+miBGIAcJr4ielLlIfHC
         uxaGF4V+CKWfObDrO2nLyeYct/M2cpZNOSzJUzQQLzbefcqAUm8M2oA8ZC314t4fCo1C
         Qc3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792549532; x=1793154332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GVRjqnqrO1TkJYy/+KOYddRQ6BdsaJ0o8sfMv9oU1Tg=;
        b=jlEKSHfUzDaU2aIXp7vI+X3ST5g/eOC/d0xVQlixnmhH7uOedsgkpMYdnsRQdN3D8t
         guMQMrZ9GfqdV4kS1JjF6suFiIB6B6a8+lh+TKJs+gbrxiyCb11TWCbFB4XnEM3qkY2q
         BU4vXuNj2RBvutSiMizZQ8is+G4ngrKbdeQcHVxwGxzsSoYltbO4AP7DbV53NHr7fo+l
         zIrsBBO7ysoZo7+Ys/3XlddEqR5X8AulGJGqTBy9uAfnC1okMlyFOYGX/455IPeFNgZ8
         ySN7V+ZRcrcm2e8hECWjYLt4zwCy76DltgONvGmpZcAVaPLkUy6AOsh70je6+TL5+9Za
         d+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549532; x=1793154332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVRjqnqrO1TkJYy/+KOYddRQ6BdsaJ0o8sfMv9oU1Tg=;
        b=WLwM/1hXRzYY0ptXT5CXuv9yR17Xr7BQWgRvO0rzoSneM/Wnm7kOOSr3IWGJKdn5vL
         wmNkeX8PAYGX8iXDFkZ32m6xXnNM4oGjHaFB31RnuHr1HT9agiIqNxenycVf3vzUlYoT
         OHTrjatbzxqXaQka8c6RE8Bt/+/nDe+HPr8kjUnJDM2lrwZjt8cECgZhtyCGVIJNRk40
         agQXZIzkkU/fPrE1754lFcIbl4lZRfBBZcmHJJSLMmp1lHSOBIxRs8YewYhtCp8mCRzT
         7nWCL+auC5CWuif10+RhzYV74hLMZ3pd2VWGL0kDVKYnvA2mj01hbalVvvIV2N1Ez97z
         qiAA==
X-Forwarded-Encrypted: i=1; AKwUvBwm/LFd99UAh7DcleKKJccT5jEkhy/hjxM4oyIHdRQ8t3Moffuxu3wJ38C9w5E0/9KJK9PM3Wb9kLOspeY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB5UaJ0DRZhAbvZvgyQI/gc90gJzlQgKLpD2Tzm+bOCS0fV8K3
	dwlXjt579kqkN/6Nag1PQSFTMJrFvvTkyLfiLEndPPQlj/MucwxYq4hEuwHKgeqDtjgxKn0x60e
	cPv6AhFrieCgetz/0gozSrQdEAaxqEaU9N/AQTTdMNfIVbtA=
X-Gm-Gg: AYBFou2nNdMnXCKD6xPqFG35eyG+iF7CQiAS1ZqnQWAY3ZngUYc7q9R4AunryayOIYy
	9JpuRK0FOeDZktiZdUunLjxXo10S/eUINmMRspcipJctAl6IsRWGRS4p78sEVmkDY7sm0JVtUk/
	JnYi28nvSLCEJ+on7L63Hf1DXvpyMxp1wegJDFYvC4oCJV9D5M83oRm3Im/HUf7GR5TVv5jZUga
	tgB7NIsYoZcAFfk+3iZpyk/F3BKW2fqlI2WhoqS7wGipP2efys6f8YPIncZpqrmL2Ov3j9T1mXI
	lc5vtMQBObC1vn1B5XvknlqMh3cU5dtWgORZADubIX23IVs1y9dLgEK3lWIyxj6oEExq9DmQgR6
	Rpz+w6s4enO4i3gxPEt7lWgCh5YoH3Yu9z46X3uy51Aly/FEwD1r2XFsTvMJ80MqnzQlLRH8sPz
	eDNXWf+7WjjMDqfNUsuA==
X-Received: by 2002:a05:651c:a10f:20b0:3a9:740d:51cb with SMTP id
 38308e7fff4ca-3ac441641c2mr1409611fa.14.1792549532251; Tue, 20 Oct 2026
 19:25:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020234434.318-1-rand.sec96@gmail.com> <20261020181122.53fd0c79@kernel.org>
In-Reply-To: <20261020181122.53fd0c79@kernel.org>
From: Rand Deeb <rand.sec96@gmail.com>
Date: Wed, 21 Oct 2026 05:25:20 +0300
X-Gm-Features: AclHuK_0eTtTegQTW-Jyoth0ZOCcpaLSxzE2h0YEB9H2Dv6Vkek-tei8FaPf1fY
Message-ID: <CAN8dotn+f4Cpf6WPzzRhxmgRjViJp10c+qK6TSQWLhtreC9Qdg@mail.gmail.com>
Subject: Re: [PATCH net] net: sundance: fix sign extension of the octet counters
To: Jakub Kicinski <kuba@kernel.org>
Cc: Denis Kirjanov <kirjanov@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, deeb.rand@confident.ru, 
	lvc-project@linuxtesting.org, shda@confident.ru
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 4:11=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> We don't take LLM slop fixes for ancient hw

The change itself is a simple cast, so I was surprised by the "LLM
slop" remark. The same kind of fix was applied in 2776d2320ac1
(net: dsa: fix unintended sign extension on a u16 left shift), which
you committed in 2020. If it was the commit message that gave that
impression, I can make it shorter next time.

The issue was reported by SVACE static analysis, on architectures where
ioread16() returns u16, the high word is promoted to int and sign
extended when it is added to the unsigned long counter, so
tx_bytes, rx_bytes end up wrong on 64-bit.

The issue is theoretical and the change was not tested on real
hardware, as I don't have the hardware.
If you don't want changes to this driver without hardware
testing, that's your call. The issue is real and the fix is correct,
it is not security related, but it is still a bug on those
architectures.

Regards,
Rand
