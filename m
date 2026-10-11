Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4172C08CF
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791729225; cv=pass; b=Tvbv6NtY4jTGwew42TxDgl9AuotwpeJRvjf/+meYyvotIa/XkmkYrFoY3bLmSSG4/sIx559jUwzJjZVrmsmlN/BsQ2Amcp7Eccl24hiqgxLHQkM610Uqw7BOu0AlO1lCzgfTd5D8p7kIv4fdraNbZHQAicvIYxXKOjRhbMUWIMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791729225; c=relaxed/simple;
	bh=mfpOKnIb2lPxTOneML/VhNInEmWNxWvTH6pPXHsj6Mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xbo5ieixIlKnwlfewI9DHKvlsH8MGD0GjbDjdBTCfYOF7wmdo2DkTZZpm7ZptWyjs9kwJiZW3foU7q7HHAlJ5PVbu/NZC3I1ZGPCxmGkm6T0e7yuxLoruW/Pq+iQ0uCWOnxNwhcm7IrsCORjHMYw1PGjLxfJEpsknwP6gaSNDJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=U3IsH7xc; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="U3IsH7xc"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917c04630c2so17076626d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791729223; cv=none;
        d=google.com; s=arc-20260327;
        b=e+rAhgmbBhTMcobqEwb8bLBGMjOfquszsQHvgQ6+LTqXPWIcViDuSdJfdykoE2wLzY
         R1K6ro7eh1EQZgb3LkfMdpkLb2iRKm6CMyKKjqJFtlTcmC07rJiF9aM5vWzsZhP1+XGo
         4jGVFFoe1T3ux2SRMjO0O/HlVpItFNp1fyeeNDWImpDNHeh3PpNI2sDeDK28mWqYpZbx
         XcHYZz3bAWZB8hCVnj+TtpWlCQa/dJUHNlLvi0+mXRFAb+UeYQx6rPga3V6qeQ6QXWn1
         /21dbFIlBnM2r3yzWJ59CKLHgDlWMiGKyP60LdY9uspbEqaGfveunVeXTDY+pmpjLwa9
         FrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RimT+BJQr+BZd/nBQf4bNoeClkAHtE09xphYwHOsuq8=;
        fh=XTVlaHwCKc9OGjxkkLsBMemXtTI0W3hC6WJVu9q3pYc=;
        b=lijk1lr6YijdNXQ2J38/yUSJ4QqZeZhnZHc7yyWQuLYPTl0qcXMcY1DN4s3ZXaaPru
         mCHP4c1k8ALFCwC7cX0Y/4VXOhCpsKFTL3yeOy1sB89heVPdEymCqShXxitcfEDAfDy+
         fuQBJe6vK8e1ZxiY/cOMSi9coU0h1vx4Mo0HxDrEb5eK+8KS8meuo9atuYePjBUw5FZ+
         BLtzDz8VbLB4n+g2ABsMMW+JtAOmj3Kv1R1fWo1l1lwiiItCkEwifPuTVhwPFC27rG8G
         8w9pQb5QDj5sJTskdaIOTk+aZnXOg+Aporg7U6TcaDBvxA2zLLsjEhzM4S6tBMW73BtD
         SvbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1791729223; x=1792334023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RimT+BJQr+BZd/nBQf4bNoeClkAHtE09xphYwHOsuq8=;
        b=U3IsH7xc4UI1OMR8uEmylufAXs3JQYpiCszNIR7ghf2aMaxaTjeilvwDVJQuSiwC+M
         2Y/IFQ+gQF8qI2Vftb6CdDDk6ca9Srq1MvpFUk32y/jyYY4Bb2GHz7lPGkCIDiW2yvxY
         coRx/WrTRDVXcdInyFcSpdD9dp78yqqpI/mvNHWdqd80B5VlQJjQDmYgNfNTrRLvETGS
         Jq8t8ZiADDV5Gv6WyxByJ2LtWBHNs7HxeTYbV7cBiQIhBYDmPdM6ULf0PLBtO/Pvglm5
         Pe3d6sEx5iKm4sgaKvMTnGyTKbjzbtIU+RD80fcD+o6BgakySPV7CYfl5yanYskipydU
         M3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791729223; x=1792334023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RimT+BJQr+BZd/nBQf4bNoeClkAHtE09xphYwHOsuq8=;
        b=knN1zg1Crm7ClSUpCmbcxZPNZQuoXDBd7A+mkpJ+V/KSolF+mFzldanjsC9kvyNQAR
         nxorjGF5TtHzjtZk5ptJSP+IicUEZEZ7URerp1gRdNYtQ4qbsuHOHCir8Zd2M9bARg05
         26R/bZC4sVMDtLnygXS3EW0nWMkAEWhXmahoYTBTlCmN4YkkxVPQ2yI8cP7mZI9FvKIw
         kVvjJOg7XMPhyLYAwvATpRYPPtyLoEcZa3PBo5DlSKFRDybHcxAhJsRC9A6tzeyiDcmc
         FrgXBFEmo+4wv3kb4uVFdua5M70WdcLpRqMPpVvpt6/cgI64kcrz51CyyKK1pbkIqsCl
         ysDw==
X-Forwarded-Encrypted: i=1; AKwUvBz1nxSUKzXYXg1am88NjT14BWFRwHVwdoexk5cCwfZULDxxPmPSo85Gp9+hR/9MtVGKhLgtr5dnWjMxkao=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+RSlo6IAAY++dic3A/4gnkihRmTkCcczPIketTHG3CRR7mu8D
	C9NwIAmtlRtatlTL7xj7ruMgaWLEYXbCd1gDbxUukaLxjGmCjamFZ7cLm2tVyjEOZVUF0nBKYDW
	2/K+pD0KA1NXdLIFYX15+bAYIam9RkSTqcf2RVXQK
X-Gm-Gg: AYBFou2wEia+M7iJUV14GFrotcewLbz//X9egO8OLPjvft+yxXEEjjPdgJojV8Vg/16
	Bkqhg6QEAhe78juTCkqnKAjhFIgy6yIgiGUimTdFWGauXHUSp3qpWA53iBXI3sImxbibfMZQODF
	dgxEXRHNbOGjn9IpfIdByh7Uot0BddQ7aQJUhG5c2YHwC0ZKQCC+E9sK+Bn0x8SReabv2zM0Bfj
	Pj0Z5fapSm5J0/9sBOrmUpt476r8xheaSaZo6mHM2UmXdpRrzRIbY3YyisOdDnvBKdNyHuQbY0m
	BzF5h7XucZnUlZC3+Ny8ludI9l0MJ4nu8WOc3FnIPOFyLAhgkT2vOpU=
X-Received: by 2002:a05:6214:ca4:b0:91b:5d3b:4ac0 with SMTP id
 6a1803df08f44-91b5d3b4e68mr123540436d6.53.1791729223287; Sun, 11 Oct 2026
 07:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009143506.2507607-1-jjc@jclark.com> <20261009143506.2507607-2-jjc@jclark.com>
 <af97fa4b-d817-4e8b-bbd7-aaefa23d4d7a@lunn.ch>
In-Reply-To: <af97fa4b-d817-4e8b-bbd7-aaefa23d4d7a@lunn.ch>
From: James Clark <jjc@jclark.com>
Date: Sun, 11 Oct 2026 21:33:32 +0700
X-Gm-Features: AclHuK9eexRlWA5M879Crhtnp6jM6vwO493yA7pfOJjE5VhMdHya6ZQFlGC7FHo
Message-ID: <CANz3_Ead154hG=5H7fmnamUDbhEv==sGMHdiY+jUhjzYLRzLaw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/5] net: mdio: add timestamped write operation
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Nicolai Buchwitz <nb@tipi-net.de>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Conor Dooley <conor.dooley@microchip.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 9:03=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > + * If @sts is NULL, perform an ordinary write.
> > + *
>
> Please don't do that. We don't want drivers calling this when they
> don't need to.

Agreed.

> > +             if (!ktime_before(now.monoraw, sts->post_sts.monoraw))
> > +                     return 0;
> > +
> > +             /* Cap the wait at 1 ms, which is more than any single
> > +              * write's delay. This guards against an aux clock being
> > +              * disabled and reenabled, which restarts its raw time.
> > +              */
> > +             if (!ktime_before(ktime_get_raw(), deadline))
> > +                     return -EBUSY;
>
> A bit banging MDIO bus might be slower.

The comment is misleading; I'll fix it. The 1 ms doesn't limit how
long the write takes, but how long the core waits after write_sts()
returns. It allows for a driver that returns before the transfer is
complete, at worst as soon as it has started. A bit-banging driver
returns only after the last bit, so it doesn't wait at all.

> Also, i've not thought about the mux case, where the write gets
> blocked until some other operation is performed on the shared hardware
> of the mux.

In the mux case, mdio_mux_write_sts() takes the parent bus lock and
switches the mux before calling the parent's write_sts(). So any time
spent blocked on the mux comes before the lower bound. Or did you have
another case in mind?

> > +     /**
> > +      * @write_sts: Perform a write transfer on the bus,
> > +      * with system timestamps bounding its completion. Set only
> > +      * if timestamps can always be provided. Must not return
> > +      * -EOPNOTSUPP.
> > +      */
> > +     int (*write_sts)(struct mii_bus *bus, int addr, int regnum, u16 v=
al,
> > +                      struct ptp_system_timestamp *sts);
>
> I suggest putting C22 in the comment. At some point, somebody might
> need C45. And that gets complex because of C45 over C22.

Agreed.

> Is there any need for read_sts?

Not for this series, I think. The BCM54210PE captures its time on a
write, so a timestamped read isn't needed here. I'd leave read_sts
until a driver needs one.

James
