Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B7936F8E5
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619881; cv=pass; b=EjLH7NmVNU+cQnAoalMz25yk4mrw+wjnyOXRhq/gfMryxEBes+MwyXx60TosPtjXkxWXcLa2TLPddvan/WVKuO056a0k6rrmerZTtLdzQBKdaO5DhZYtuuI7OALl+u2jcvmqqez7JGSFhvYMgySO+7ucANqSCXWiipw67Yw+sYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619881; c=relaxed/simple;
	bh=3Y/fF6+yWSNp7n7WrJyW9ic7hhZX15xNpxqUx5k4mho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FdUOTuYE45ahh62puYyU0b9IaRpR6CoQ/+HYlwRIoE64kphPt9FyQdTMGJN76PKY/6fSnCFgMwDbvKMYspv5S+wVvm+Yzte4L2Psd6s6GSQHOVx/2QI5bcmJp20etA9TwZHS+hUYau0eOSgehtzEfuVf37/lbDNfnLdmFWnVPlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgKg0Osd; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgKg0Osd"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c31988fc977so86571266b.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791619878; cv=none;
        d=google.com; s=arc-20260327;
        b=X927Dz7a9+BhkqUr+lvxiM1KVyUWFqhq8vzoleXbNvNpr1ya2XAi957OWFIeiLQ66A
         9WWSGTMynw0wE9EfEgBJIGkf3vBpXsAn3ffk7XDcJ9K7feu/NOsompkrDvz0twKYnmiw
         FedcC1XQtKq5bUqsEhcZ4AoYrdykRYwOJrkI05PcDvbwPKxG79hKEFIuiq3tLkfBSVfu
         vARJBlkreBNpb57RZf+xhwCoBRWQ4bfxaIhcnydw2WfDSTwZ/yl37WumOLZPL1PZV5sp
         eX0VR9MQFttroowg13vT+79gO/J/wkUnwYJb5xjQIK4U1ylq1KMu5Oi+M7iOgTWptMki
         1yjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Y/fF6+yWSNp7n7WrJyW9ic7hhZX15xNpxqUx5k4mho=;
        fh=e8damtCHh3IWc8Jnn5KwLyNNtH7qw7GbZePI766EPOE=;
        b=oTKRppwqE6YAXQFhGHLyz71axUuVHsfzrdCV1Lk9SCGpYZZ1h95sL884CR+0NsC4Xu
         MSMkSrJnhWLuj7IwF7DcZsm9LCQmgoJjsctvTfC8tApDmnyqItTMf5jNwukRL++Sctfa
         7seT5KiA5Ols65Gh5MonXVOWCuPU8rQf+7+Xorj1T4ChlTMs8AfML/8BlcSWlPZw2PWj
         e4eLWiuw8cQoJNdstyN9WiGM2ZLkna1Uf17myt7dGB7VomOlRIcFUZqRvd0hrPIyEsT+
         hpFcJVxM8pd1+JLsbUDvmyzA/duarwY3t/5aIHbnLV7BikLfDvw5LmTGWsSKpiQiGuxA
         w2aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791619878; x=1792224678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Y/fF6+yWSNp7n7WrJyW9ic7hhZX15xNpxqUx5k4mho=;
        b=NgKg0OsdU/Za3gEPX3nXLxLPAOaH+SfzqxcRzsVU18uNYiDCWR1QnMU+xloBEpCIxV
         jU0PRb0KvDF9OdduOT+qKILQZhhu1IYBLkyPOmmVCaB7rFX1mbP+7nOgBFonLGdsbIQH
         USaA3JSnk7cK4ANbASBr0LvZcGA2Z6X7aqomFySr9SS1c00PviIF8DSK/Ygfv998sk4n
         1bfdlBbwdpHE/8Vaw4ZS/P6A4vY5VujyM1npVj1KeLEDLhkJs+pMDrkBS6lqQsq5vqcZ
         VbvaIgoZhfCZ+JlfMouPpK25GB+Jy6lPP+XTTtOJI7avI/R+FvqPyaKhm9j+E3i8D/vL
         UdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791619878; x=1792224678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Y/fF6+yWSNp7n7WrJyW9ic7hhZX15xNpxqUx5k4mho=;
        b=LfgzrZqIFERU4ifPxOWbk2Yk/zKWwkZMhKixr6bsIRmcSsKVRBHCngDwZCIkvl1u5g
         +nus5C/3ddRkQ6IJdeZ/1TKbtouHqJuImc6O9KSGmjqiXHAiuJ1q5WrNDNY3SMILGrbM
         ENPJBRYCHlaUMRu+Gv4HKOctVHr6XzPeIWktQEXmeVz0Hc+er78D/e0sLF8FFRYfhbeG
         /lM5UYgFioQVq1w1pZs6mxZ+ldHPdGUKYUloI35TizVjHexCe0+afTMzzvXIZHmFvgfE
         ZqLyUj7neY/J3W2wKS3Nvk6Uxo3CY3R4zcU3TqrvE+SRbVbimLgtLf8vh67+5GVGCqXC
         T/yA==
X-Forwarded-Encrypted: i=1; AKwUvByYFUJPwUm8iRu/7KBa8viRgSVQrPP4MvOrIUlsl8fyNJKDrNyE+3Ly/hav07QySurRM3XK3fcE5sm4Ph4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHHI0DyXAzBpw8vAEo62YAiRQ0Ekire0Lb1a+SnnIedshyaL3m
	7IHTfZaOetWpPZbb6RWxrGKWlt0H5881zWgBtxP4iG1PIgMBEywzadXkCZ/l3gUQlDivP3BvMCK
	7mMuOaXvKyCGfp3OLd6FdjHQ/mnYIqTw+ol/mjdOmRg==
X-Gm-Gg: AYBFou0Q3j4c9zOK8ND/9Fh+CYdm9crJWray2vSwBkZPUmugDBWOVzzpS531umDEvKa
	ShGJ4VRk9FUYTwukD0sg7RoQ0rUQt9eYzR0uEJe8Ug0pFT/USKzvbHNOkhuh1kzNaWtPFDPcOid
	td04lR0LvERXuaJAelsuMWofFtZTnvjEVey93YDQaVRV6N9Lz4f6tY1kp5CZ1zTPa/KwEJXJxpJ
	TYJ2gVizZlZ+qofQYwlFWx8Pnq4FhOqmiG2i2HegxPyilKxkyGi7sWfV6wUvdJ8TBoUvCsb5v3M
	Faxzoy2SjSmH+yg7ZHdtM8YRdKZGd4+rW4wMsNX5/1OIflv/oWRyWekaf94LlkFZCMff/N9FwzV
	Un425C6XGE7IU3WqTzT6jKvm1yIrnPdMnaG5YhdzxdPek8zcE3hsA6XOFhOD3VuB3C8cUyqGxE1
	7W35jmnm4Phfd/bNMJMnPzTsHbaWkHytfLBXugH/k=
X-Received: by 2002:a17:907:d0b:b0:c2a:f439:f028 with SMTP id
 a640c23a62f3a-c31aa062933mr436250066b.24.1791619877631; Sat, 10 Oct 2026
 01:11:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-aspeed-vuart-v1-1-d2be17c99cd7@phil.gs>
 <CAHp75VdiO9tPX2vLqsX2-omNvs-YjkWWD-HOiqyDSzpJrrZ_5w@mail.gmail.com> <60996F21-A12C-4FCC-9D5E-9D188A4ADBEA@phil.gs>
In-Reply-To: <60996F21-A12C-4FCC-9D5E-9D188A4ADBEA@phil.gs>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 10 Oct 2026 11:10:41 +0300
X-Gm-Features: AclHuK-dIO95E4MKMHhfgONiaVmppwEdlr0lng2Exqtg0ehIlNhsjdfo0t3-x7w
Message-ID: <CAHp75VdmMwXRQFKLG8c4yAsVA5=eFZA3jagtMGb-qVswcQ88Wg@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250_pci: Add support for ASPEED BMC VUARTs over PCIe
To: Phil Rosenthal <phil@phil.gs>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Corey Minyard <corey@minyard.net>, 
	"openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>, 
	Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Ninad Palsule <ninad@linux.ibm.com>, 
	Andrew Lunn <andrew@lunn.ch>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 4:45=E2=80=AFPM Phil Rosenthal <phil@phil.gs> wrote:
> > On Oct 9, 2026, at 4:57=E2=80=AFAM, Andy Shevchenko <andy.shevchenko@gm=
ail.com> wrote:
> >
> > There is already a driver for this 8250_aspeed_vuart.c. Please, do not
> > add new quirks to 8250_pci.c.
>
> Thanks for the review.
>
> As far as I can tell, 8250_aspeed_vuart.c drives the other end of the
> VUART. It is an OF platform driver (aspeed,ast2400-vuart and
> aspeed,ast2500-vuart) for Linux running on the BMC itself: it depends on
> ARCH_ASPEED, has no PCI ID table, and programs the BMC-side GCRA/GCRB
> registers (VUART enable, host SIRQ routing), which the host cannot
> reach.
>
> This patch is for the host side. There the VUART appears as 16550
> registers in BAR1 of the BMC's PCIe function (1a03:2402), and nothing
> binds that function today,

In the comments to the patch you told that ipmi_si matches it.

> so SOL goes quiet once Linux starts. I don't
> see a way to reuse 8250_aspeed_vuart.c for it, but please correct me if
> I'm missing something.
>
> Understood about 8250_pci.c. Would a separate driver be acceptable,
> e.g. drivers/tty/serial/8250/8250_aspeed_pci.c using 8250_pcilib, along
> the lines of 8250_pericom.c? It would do the same as this patch: find
> the VUARTs the BMC has enabled in BAR1 and register them as polled
> ports. If that works for you, I'll send it as v2.

What has Pericom to do with all this?

...

I will look into this deeper when I return from the LPC 2026 trip, but
what you are doing sounds really wrong.

--=20
With Best Regards,
Andy Shevchenko
