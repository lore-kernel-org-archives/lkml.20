Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165E1511189
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809996; cv=pass; b=Gtje0Toqw1fLVgA0WwbuFSlt8IZdtfvweVMvD25CDwWpwt+ImoNX3mey1PgQQ7uR0HSl86uESJLGHId1AZ5BB/dS2zlLxjr7qVHK3OmAFFPRg6KseAP7ShytXtF8ExJ0vRnpHcYuCCdADb/tSGDpWvJ8n2BTpKGJuEv+FcpL8AA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809996; c=relaxed/simple;
	bh=gfb1OFy6HnketlAtt5XqTvEazZ7wrq8ZI6YrMsSum2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACo2AbgEVbIPj2ai3x3STeuIcTHXi2v2z9wWcA4VeNJn/HKohvwwUMc32nIWyTdV11WU7jOk3Nxzy8RbYkNBaJ4AHe6+VFjeh8ts89hzc88Oyu2EUr1HO5bDlv7y6vlUGd4y87yCfaNAzExfjsyo5iPjgWfamen8Q5lQqzGLaik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ppLTYMGu; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ppLTYMGu"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4859245e493so1807013f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788809993; cv=none;
        d=google.com; s=arc-20260327;
        b=F2ZkTRq/eYn1Q5/rJb9Nv9AdKOfIBYbAbZiO7VT63u9k+HBze5BUG++SFGe8dgXX0k
         hus5nTCGK/5LTcHggOf7835Ocn5D70v5ztZQmXpw1H6yA1ZxqQb02vHQGLATwCnklJ8N
         6A+pYgNou+HXZR2xv3zLjo7gHSsumpmAdkxNDoYjL+dMcR0IUcYX42uso5exzwgxtI9b
         9PS1GbEt6I5fH7JeGvLmIJ0cC2d3W7Y+IIhiT13X0czD/0XSUMEQl17OTD487jUeXUUz
         8xxGDjq6CvUFlcigJV6e5jY9foHmaL6q+5zhlAO3E50yp00ld2V3knNwezKtQnJJDTjs
         HRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UbTECHpg/c3ZKvu0s3KVwXXekuTGLp53kt2aih8Xec4=;
        fh=9mT6kM5y0LRHiGlT8TzQStLEnFN63y1Y9q2Wkkw6iIM=;
        b=CiECp1R2bEcRZ+/TvfDtDNPFQpsrp5xeFfsSRGDi3LiP3j3mss5tSAvu1+pihBpEyO
         uT39OaoHj6mINl71FUcNaTJMoOaWG7QYCZGT3FLcMo80YCl5m3tczQPuqpmJZqUZ9010
         0luQTSk+5hYbLWGYF+mCRJSQqhigMqtMPr5DAPEsXlt8CdeX9X5b5IAXy/iwywY2l5jG
         UY26p0Fv1S0eQ7aoUEVLr/cGHkataBhDc/Tv0iv1KdgB/qxNz62ckWw4Q3Zxwnj7HyqQ
         nLCPZ+4tO83dKCf9rxEHWoUhsZx0V61kJzoQw1LxDVLhjopePXYYdc4vUhv9wzqvkWLI
         l3zQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788809993; x=1789414793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UbTECHpg/c3ZKvu0s3KVwXXekuTGLp53kt2aih8Xec4=;
        b=ppLTYMGu2vSdw0/65kAKro4AL1aOex0UDW/GtT4vRTKXPAH4lFCzFhLEKjre1vJO9N
         zn9CdtoHfF+eJMyM4cIhjoQG0klhZWCSt0E938vF17zVjHcSx30fBLFSp+EpaFqevFZW
         7X5UjSf22/CcOsAmxyEnVxq75NJR3A7awvZPJ4nlDVpkGHAe4hQmmuOxXFBipVHDPuqK
         NJte8q/uP5b9KhLA7SJUvc9IgokZyhXgcsuS7eVSvLUxIsSFGAhwPwYwMG+Ryp9YTOcl
         tar/3MhjurwOtcou22/8mTkOusDJ7phk3YINcWQUf4I6QnqC02xXvwLwA3+qXcUWxBbo
         W9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788809993; x=1789414793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UbTECHpg/c3ZKvu0s3KVwXXekuTGLp53kt2aih8Xec4=;
        b=caJZ64lc4KoY9hdcRNdFyjwM4BjgA1ZJ1gRBB/z/33Sri+BHY89Tqe3YfiOc3+eAG6
         e4ZeGf+kcnNpU5TkE7agOJ9oWNMQFwnJZSe8qeHo/srFDsMaRfC6jld3nA1Zc1Rwtr6V
         bAyeWNydkwQPg8uorJsmrLFhQSaGOMVVOme1SvPxWVVY6RwnwRxqiM/74J/jIrMvmwlu
         GqlYEVLGxEsY3YSjtE6zEhHiIFxaf1G6129mMUmQSsqAzvzI52k6DasYGp3q5oIS3kFd
         vchKRIkujob9ziWLZ/2ZG7Nc6ZL9+cEuylC5NPKQlntrL6ozBiZ2BR6F8ATy0fuxEJe/
         92ew==
X-Forwarded-Encrypted: i=1; AKwUvByFIF778yR7stU8Lbgu7YNufg5y5OTs1cpSTPdC+sBZBMIJwbRmzSa1u79CEHflCq0PSvDQo6QrCTfDRTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n0+j7VFz+YibP4ft3oEtGWysAF673xF1v9vAIwChlsN2zXNwiu
	EAuFZYO1hkLZ7h7aTdbfZuivZh5GjboiPr2WInQSbhg1vQB3kTETj9RHzKYIRuotNU18XDugn/6
	xrhVwbguvdZuM21gFTesPzCPJrQoFHtE=
X-Gm-Gg: AYBFou16J+/eK3LxsuyEvzkI1cGwfjX3PDAr4CY7njwWgy1q/8sqOKxHvCPSWBbSx7v
	pPl1XSq//GguOo1yXXxOZWnffkVeICVCCZGFsGEbnwdN7E9QXpi503elmktFTR8vF2d6ZvGzZ2k
	ZzJyQ1JxTwUJq9AVx8RDETVkX3t3NtPZU/nlLulyRBjJRboqn5kgXOhzIknMqTgljUZo9V8Z2og
	Xmht5ekMBlz/QslQ4szYaXPUban/SdZHybhKPt+n9cMv6HtaxAinCPO+EGSUk7+MgcYVYozAVYP
	qsJY0u30g1S3HHEs116bM8VBiLitzFuOL8r2kMs9QXD74rMPUTRgB9ndGIVEQHQuQG1NuW9FRyf
	mr1xPZZON5nwtrtjW+KFSFuSH9cf9g+wj
X-Received: by 2002:a5d:6f08:0:b0:485:8a47:5b8e with SMTP id
 ffacd0b85a97d-4858a475d4cmr24045312f8f.43.1788809993301; Mon, 07 Sep 2026
 12:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzn1-miic-fix-array-v3-0-3f7dccffaf5a@reliablecontrols.com>
 <20260902-rzn1-miic-fix-array-v3-2-3f7dccffaf5a@reliablecontrols.com>
In-Reply-To: <20260902-rzn1-miic-fix-array-v3-2-3f7dccffaf5a@reliablecontrols.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Sep 2026 20:39:27 +0100
X-Gm-Features: AcwNN1WqIPfZI7d2ltyP8smilE59YQ5lZz8X2iBCgOL-jJlaLFlqC46GZV_NYfo
Message-ID: <CA+V-a8tOLKxFEKF+yZ0Asf_KYb=_hrFuJagkdzHPxZ_zf3MNRw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] net: pcs: rzn1-miic: Verify port number from dtb
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

Thank you for the patch.

On Wed, Sep 2, 2026 at 7:55=E2=80=AFPM Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
>
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> Add check to make sure port number is in range before writing
> to dt_val array
>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index c50b65d064fa..3ee40eb9d545 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -692,6 +692,12 @@ static int miic_parse_dt(struct miic *miic, u32 *mod=
e_cfg)
>                 if (of_property_read_u32(conv, "reg", &port))
>                         continue;
>
> +               if (port < miic->of_data->miic_port_start || port > miic-=
>of_data->miic_port_max) {
> +                       dev_err(miic->dev, "Port number out of range: %d\=
n", port);
> +                       kfree(dt_val);
> +                       return -EINVAL;
> +               }
> +
Query to maintainers, what policy should be followed? Since the
dtbinding check complains if the port is out of range should the code
also check it?

For the patch,
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>                 if (of_property_read_u32(conv, "renesas,miic-input", &con=
f))
>                         continue;
>
>
> --
> 2.43.0
>
>
>
