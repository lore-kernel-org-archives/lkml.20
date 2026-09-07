Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5803C0619
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816232; cv=pass; b=PU4tdqtf3w9vbdEA3T+aUt+am4e4GF1NOiYXRThx0CXiB5iFQR0oFQRmqKRBUkIPSI3zMwlUXnyAltRKU6H7378ZfJZp8THgO/tiDwgbCusS6J0PriKuDorUu67ktV33VQFMjjao0LcQ+GjqaQ4AB/6TdMGRuP5b2BIp8+VFY2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816232; c=relaxed/simple;
	bh=19/8aQ8d3WRQPVmOABUgfgBS9WSqvPRbfyGSQyZrvXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wm3ZHxtGk1r3iNdEpj9E1WsFLoxNjIc4fRrXt3KdvTnVS2O8bm50nit52Lt57jPvR1KNRh9XIc/RVZhoBTij9YjNKajyNL6KwaJSdlqKU7US07njAzTMrlOp3bnab8c0hBe9TgNWi6NW6dwlFRkKq7Hv9n/nfFpzflPJOoIPVmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+MX10c6; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+MX10c6"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482e4998d28so3149901f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788816228; cv=none;
        d=google.com; s=arc-20260327;
        b=g+AHHP65NLzkzg3osCqrZGiFR5RQ0GdKWfOEcx9F0sNnhTmcWaHNqz79jontsUQdHC
         kTuDtte2uDw3Wyp62y1JuIdxSwEKHM/iiNsZJlVGuiXlUjrsLcVymj/nJNUwuxRTiwai
         algyRlttRi2B/lwksbmwH1ep4dpalTLmVJIUbuFzg+92XoNLNO0Q22bkX2LYpn3U6det
         aFvfZB/Q1Af9dSw2NH6CtDenfC+8tVx1VPNIw2h0mv4JmwxKNGhPHZ6R059WRNKMbw+N
         r2G0ca9gteVZmSM+0WMgnBtCBDEmyasSfV6klzB0t02J/+3zDENj4M9DZYgR6c5ad3QI
         vXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wuA9AOewcEEJ8XMU+DUU/y8C9hklGB9rqR+cr/+jZjY=;
        fh=fD00RfbI7n4/BC1CvGHmKOiiFnM/sMA8zUAyn+0q3V4=;
        b=aSahiniRENnvGIG8B2qdK1QVbQvbwoQuBmGBIte5V3Vbf3ASdd2j8PmYvwHwg7oikR
         MhqzY7NOBVaDJ52vnhsTnqs3VBmn4drIGiQ/JBsMjCEvJ1tgAYhpAuh75XCzKnvCJWId
         8F/5ELQiINUERKqmaFxMAE+6p8RCOk1vKPsNanwDFYl2OICJct4mkzbZ1l+MfIQXvtEV
         FCWvrSMnZ+kAzt6H9U/kU5GOgoobhVlQGJAjBLu/fmzGPhqPGPJxXso48o8Jn5mWzomo
         4GiemToij9gx6REFXBrA3E6o5Go9YIM+ZN7EoigYINaFKm6YFLq0eQxdYVCE3AnGUxsG
         s76w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788816228; x=1789421028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wuA9AOewcEEJ8XMU+DUU/y8C9hklGB9rqR+cr/+jZjY=;
        b=X+MX10c6MQhhUHNv/JZ8+iqWZZ8PJVfINv8g286mpS1G48IrG5p7zJqc4RE9w5c4T3
         AvxZwPlPauidlIkE4iwka6Duc0MBMMrHjl5xX8xJE+QFTRUps0m4WuplFB5HAzSEU6r1
         iT3fEgDB2uW7ORy2N+dzEJ6dpFL8pjhFgkM4ZOKoqUJzCEWw4z0Elok02idwv84ajWBi
         mJ8IJqCGeYGQM/rZj2EKG4x/eoaXPPaECCggNWmrL4LbuPRXPeY1wuh/BrZW7Y5pZmpA
         jY4LZV9zCFJ9VM80l7fHUvTHTMRJBJ2xCywPZHz3rdWcYhqiYW9kvlT2ohOs2bX31Aon
         X7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788816228; x=1789421028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wuA9AOewcEEJ8XMU+DUU/y8C9hklGB9rqR+cr/+jZjY=;
        b=IxojecW6GBT4GPLMtUx0R3w3u81HZwUgZI7+mX/RV1QH4sQeBXvWr1kodj93or03iZ
         6h7OwGQ/xRXpUVJ94NXv6U0tCrOfACCbQuOaJH5awPP6As6K9gvEyqPqOA2Ut1MixgMm
         vDw7g+kAB5RQ1R9MqRwNMpcHFuDwFrI5LJJd8JJmbDgwx3croVq66KUps7XHTaRKeBVw
         jb83JvkC068KOX0fhbX7yuxrC5Pep6y6W7w25nMzc3Z4XOfBzHSihaWoss/twEbQaD9R
         yaNgc+ef84xze7Sj1zuh8Yec/drGlqL3k9XRSgTBgH+c6HhhY5doSrXxbV0z5iZt0YEd
         UR5g==
X-Forwarded-Encrypted: i=1; AKwUvBwwp7nSeJilQTLwtEca4RfO6ZSger9142zPponiGS6sSj08AMfRWYeKFHOyhfhs/5/lXJEIoPXuWdpJwhc=@vger.kernel.org
X-Gm-Message-State: AFuF++ljLSQJrm3R2ICswe/6GUXXddmhXL9kByQysOzV94dsxkvS30di
	OnXTEQWgSVJfhHrnYR8lv5dYKbqKBHNvVqsVcKW99rTySEQDjG0rZUHyZprXlpYwzq2QuRpYS5i
	UTp/BaEjDe0QlBu2IcV3p4ZRoMdyBusY=
X-Gm-Gg: AYBFou2BYcrnMRli93G9Wk4Pcyh2JrC5aFURQfgH9Uvj4QeWEcjhJjegLLNoSC21yEY
	aj4Zv01iwBqTOf6QeQsUFwZHH4sf/qvB5aodS+yP/o0yJgOT+95ygLhPHigAa2aZk3sWhkbi6If
	eBipZp3wbUqJHkHHUSdyLCK1MN0SJMW7qy6WE6P4OdzV0nrykhSXf+tTINV6gSNARGsX34XozaL
	ZM8xWtehvUvwAQVzvOU0PcvS0tYDt40meYavZsQALuqPxjVCEP6PaF/JlavrMsJuRJKdndXAZqo
	CMQqas34upq4dM/CHXeHNPDeneWMnUeIiCROQ39X8nr7AVzMeax4XOmLc/xxXGOmjU7zaciRUmP
	VLPl2NPoDVlUvMQ2w8ll+B4omrOo0Qn3t
X-Received: by 2002:a05:600c:8706:b0:49d:191b:88be with SMTP id
 5b1f17b1804b1-49d191b88e2mr11604605e9.0.1788816228283; Mon, 07 Sep 2026
 14:23:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzn1-miic-fix-array-v3-0-3f7dccffaf5a@reliablecontrols.com>
 <20260902-rzn1-miic-fix-array-v3-2-3f7dccffaf5a@reliablecontrols.com>
 <CA+V-a8tOLKxFEKF+yZ0Asf_KYb=_hrFuJagkdzHPxZ_zf3MNRw@mail.gmail.com> <81f2b455-7df7-4aae-8b67-d7cc9a7039d4@lunn.ch>
In-Reply-To: <81f2b455-7df7-4aae-8b67-d7cc9a7039d4@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Sep 2026 22:23:22 +0100
X-Gm-Features: AcwNN1Wo_8wwvrgt5LhiUMun9fC2pDJoIDFWLjv37XoCXAfNGC83f6MaStO_uN4
Message-ID: <CA+V-a8t9C5D+YeV4Qqiw5zKjipE8zLmDAQ_rSqDmw6VWPOBfUQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] net: pcs: rzn1-miic: Verify port number from dtb
To: Andrew Lunn <andrew@lunn.ch>
Cc: khendry@reliablecontrols.com, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Mon, Sep 7, 2026 at 9:49=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Sep 07, 2026 at 08:39:27PM +0100, Lad, Prabhakar wrote:
> > Hi Kyle,
> >
> > Thank you for the patch.
> >
> > On Wed, Sep 2, 2026 at 7:55=E2=80=AFPM Kyle Hendry via B4 Relay
> > <devnull+khendry.reliablecontrols.com@kernel.org> wrote:
> > >
> > > From: Kyle Hendry <khendry@reliablecontrols.com>
> > >
> > > Add check to make sure port number is in range before writing
> > > to dt_val array
> > >
> > > Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> > > ---
> > >  drivers/net/pcs/pcs-rzn1-miic.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rz=
n1-miic.c
> > > index c50b65d064fa..3ee40eb9d545 100644
> > > --- a/drivers/net/pcs/pcs-rzn1-miic.c
> > > +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> > > @@ -692,6 +692,12 @@ static int miic_parse_dt(struct miic *miic, u32 =
*mode_cfg)
> > >                 if (of_property_read_u32(conv, "reg", &port))
> > >                         continue;
> > >
> > > +               if (port < miic->of_data->miic_port_start || port > m=
iic->of_data->miic_port_max) {
> > > +                       dev_err(miic->dev, "Port number out of range:=
 %d\n", port);
> > > +                       kfree(dt_val);
> > > +                       return -EINVAL;
> > > +               }
> > > +
> > Query to maintainers, what policy should be followed? Since the
> > dtbinding check complains if the port is out of range should the code
> > also check it?
>
> Yes, the kernel should check it. Running the checker is
> optional. Crashing the kernel because of an invalid DT blob is not
> something you want to allow.
>
Ack, I'll make a note of it.

Cheers,
Prabhakar
