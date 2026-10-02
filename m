Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E6418359
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925941; cv=pass; b=VGIlzcpQ+1RiDCKTCNWDuLgOrct4l3pv9KIewB4513QqyIl+Dqwb+SDpemPipIBadTNLFl/oC0FBM2dGtL9Sdl0P0O/y/WdyeZFI4XaTkIoLmekckIoesy3PTkixiyYkUwsmSNxqHKorFkLX3NIC/vnYtpKhFaN0YPwLhWXRL+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925941; c=relaxed/simple;
	bh=vkuQVJtffJ8fMkOsTmgLQ2DxIsx+cCdeSaJrYf8laNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=duY0UUF7MUySis3KPNB7oJiUO3VzBZiUzoGs4Da0m+sGnNMzIL9FGyyzHSgPMrj9J3RybuuTRvNQp0HP+4p/t8ccEV8BsLc4Xx1fdNScDa6buYIppYIW6OZugmUrY4FF26kzY7/oVbJDzdGLnT+7QPVGgvPeKbcGj7i8vJgkg8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=omgi8R3y; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="omgi8R3y"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso2427730a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790925935; cv=none;
        d=google.com; s=arc-20260327;
        b=ipfO7ixtyaO1InxARk+kQD75ljARA4WKCYLrUKNz45f7aud2sE/QXsaaeafcFWeuPJ
         oYlaCYi2YJKfq8ePfy/A/sUYuXYBSRzkvkQyTS8MX1M7ETT9BS+KZ1XNcDFL0w0reyRU
         IuBeWoFrL238CVgIou6F9p5PsNthzo2OTGWgW1OwkH9qMudhzcLsirF/2kRMikOvtcxe
         x7M88yVRluumNZQE+9PZMAu/Oy+TbfFybk+wT0R95iNf2yFegRdkOr4eOXvjYJB+065d
         44pMxzFFWmenH6Yc8BAfclegLdDEE3T7mpKXbUvO2Z7mzzzHAbql3Y2+PCnoNxF07EEU
         lXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x59KLtPfuG4aN7iW1gUsYPP/JvC2giQpEEdn897TLao=;
        fh=Pe5TuPkHkYX83ao8/RA489Z6/DDSaRbCwdCAVXG1Eq0=;
        b=FEyuvMxhzqx/tZWyBA47SsjV/RWjVNMjmiz/UTRP0FTSXgHjeAe/rKreIkOXYF9N1u
         pqh0vz152nN6rGMGvHv3FTCmfnbW6hzoq7iZKcLm6xpvawQ/iVE0NMU2+O5qOxDvb3xY
         zAQkrlnoHTVMAQWj5Xy66Nd4WzO8uxEnQvbD6iZPiZ08aNg1Q0kiqnksyB0QStDbR3b+
         vJpVJLDssU4Jw3B1TG3WM352SZGTyXMLMPPD6oMYvwULWhwsGPSdz3eUaYOImQWaURuL
         IbCAglyaOwVasuDqPYj4qa98UveRNwzmYaZjJ5NIltTnigQlBVR9Xj7yoaeoajB0g+C1
         apmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925935; x=1791530735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x59KLtPfuG4aN7iW1gUsYPP/JvC2giQpEEdn897TLao=;
        b=omgi8R3yfw60wW9HSxa7U3Nd3Nx3Shy49ga07pOfBmsqrEbG8IaZtNCYWsrPt7y+9e
         UGEYEdx3cGP9Jw4mwh9AN3wWWIcjmISU5j7fK5qFBs+9Nz2yNHYMHCZIJUZXFvDT2AjS
         xo6+xqllnqVKumR2zF53/G1LlubFimymku7zlBH/DVPf/CfZGZKYDaRPC3IR1fQAHj4U
         b9jCXzMQ9y9t5aJ4wSKHF+fps1mzeMcF6VchH3hoT2DGy7NXT/Rmb/Jj1zhY3+N17WM2
         drXc2cLfEMIFvEl8vEOyfTthw3S+OKuzfmPzPAvNOYj/E0DUlgzpj0KA4VL+w2hskYus
         VaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925935; x=1791530735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x59KLtPfuG4aN7iW1gUsYPP/JvC2giQpEEdn897TLao=;
        b=VnbKlpB69tTATIroHNbUewHiHEvxptbTKCZfYgPtzCff4hs5y6cJAChA2wvijTnEGq
         PNx4iVzHjnjt1IZIldH8FyMLaiG/c1gAycL1aE40BQuQwdPDm4HvH6jjA3oiSvE+nnIl
         7m9aukRXI1sN64hBKP9N3BurCOp8DfJOwRpo1bRcGqPd7m3xaXrVAy2W0VlkgVVjNvMr
         abZMBVTTGZXsP+2rbawbk6IsuTSBmEX3tzTi2dFNAfdCM6HMwFtQbW3D8TLgW9JB/bZW
         DIj0+3W8C2oilkl4HC/0ZW0HjqB0ZFL0WEpadBbG5uLVzR+KaqxTcLb+lrCLbkBXVEkq
         MaYQ==
X-Forwarded-Encrypted: i=1; AKwUvByWs8bvxXGa8FBpHDCXyCOvf7tlrnxnOKet3i1vEMYojow+pB91zKGA5D0qdSNcSaK+DWGpfGs5HkOsRTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQkVZjEw2yiwhkSD8QrcF98rIcxf5gO7lungaMZuZ7jbKZDpKM
	jgIZeiedTJd4BvUrdJ361SWShbcuLNdUyzNQYf/Zir9TKBJhcFXvyFZHWgNMjpP1hkcLCOVIqCP
	N+17LP/cz6pCyq7qh8Pq924O2T45XTKE=
X-Gm-Gg: AYBFou2jg/70Xlxog66sPtpXbDeeTojfw902ZdJIYB9RGDbNI8OTIXUUAmGjNpBnDRe
	jT0y5UagfrquWCJcMbMhDj8vQCPE7+XHKRtdEG+9b9ykAO7j872i4IC5crs6PVNr0+84gNInnJM
	aq2Cgq82Hjw2Vff1P9bz6JaYspIFquZ75KOoq+O6ZcCHUUpOLPWCPBxraiI8EWirQU0BVUxNo0P
	1vDSFwsEfENEn8Qwn2MRGtVZrPlkgLArOAuALp3Rn7Utlz65BpymmcvQo2WkSsd5Sy1pvgAxiIp
	adUKiDntY/FitinhBfP2EcGRrPWCPFlbvROqpXv16pUvsEmGq1Mbx+6MN7vKfB5jtfmVcJ2DDKd
	j38vQk4phNQwg+IllL/0RATq/M+B4A6x0JaWo8GDH2f8TZPg5UIzxxMLBIaL8s766KsmYBiU+ss
	0TndfsUpqTl9A6zIcgalLw6TFa1+zP+LhDoG2UOlrz/QfL6j5RgQBwh3FWs3sjn87+0w==
X-Received: by 2002:a05:6402:5165:b0:6a9:8863:ada4 with SMTP id
 4fb4d7f45d1cf-6ae307e5667mr2995775a12.3.1790925935285; Fri, 02 Oct 2026
 00:25:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925183050.56839-1-rosenp@gmail.com> <2026100129-unrest-cleaver-6528@gregkh>
 <CAKxU2N8Z-CSxki5mWQvJCEiQDmy00WLJqPEMgujOA0LQzbHHjw@mail.gmail.com> <2026100211-unturned-scam-fd80@gregkh>
In-Reply-To: <2026100211-unturned-scam-fd80@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 2 Oct 2026 00:25:23 -0700
X-Gm-Features: AclHuK-DIP7WjK3JYUzQGXnqA3_qOSSMeSBRglKWf3j7RwahMAS-EdxikdQir5E
Message-ID: <CAKxU2N_Nm3rRnXEg9+-iwRSHXrvV-0rgdDQdmhn2MojTneFU7g@mail.gmail.com>
Subject: Re: [PATCH] serial: arc_uart: Use platform IRQ helper
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, 
	"open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 10:55=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 01, 2026 at 11:58:05AM -0700, Rosen Penev wrote:
> > On Thu, Oct 1, 2026 at 1:42=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Sep 25, 2026 at 11:30:50AM -0700, Rosen Penev wrote:
> > > > Avoid calling irq_dispose_mapping() by letting the platform_device
> > > > machinery handle it. Also enable possibility of handling -EPROBE_DE=
FER
> > > > and other errors. Handle as early as possible to avoid doing unnece=
ssary
> > > > work.
> > > >
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/tty/serial/arc_uart.c | 8 ++++++--
> > > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/tty/serial/arc_uart.c b/drivers/tty/serial/arc=
_uart.c
> > > > index 3988e5958896..b46b057a181b 100644
> > > > --- a/drivers/tty/serial/arc_uart.c
> > > > +++ b/drivers/tty/serial/arc_uart.c
> > > > @@ -30,7 +30,6 @@
> > > >  #include <linux/tty_flip.h>
> > > >  #include <linux/serial_core.h>
> > > >  #include <linux/io.h>
> > > > -#include <linux/of_irq.h>
> > > >  #include <linux/of_address.h>
> > > >
> > > >  /*************************************
> > > > @@ -571,12 +570,17 @@ static int arc_serial_probe(struct platform_d=
evice *pdev)
> > > >       struct arc_uart_port *uart;
> > > >       struct uart_port *port;
> > > >       int dev_id;
> > > > +     int irq;
> > > >       u32 val;
> > > >
> > > >       /* no device tree device */
> > > >       if (!np)
> > > >               return -ENODEV;
> > > >
> > > > +     irq =3D platform_get_irq(pdev, 0);
> > > > +     if (irq < 0)
> > > > +             return irq;
> > > > +
> > > >       dev_id =3D of_alias_get_id(np, "serial");
> > > >       if (dev_id < 0)
> > > >               dev_id =3D 0;
> > > > @@ -607,7 +611,7 @@ static int arc_serial_probe(struct platform_dev=
ice *pdev)
> > > >               return PTR_ERR(port->membase);
> > > >       }
> > > >
> > > > -     port->irq =3D irq_of_parse_and_map(np, 0);
> > > > +     port->irq =3D irq;
> > > >
> > > >       port->dev =3D &pdev->dev;
> > > >       port->iotype =3D UPIO_MEM;
> > > > --
> > > > 2.55.0
> > > >
> > > >
> > >
> > > You forgot an Assisted-by: tag here :(
> > No LLM used here.
>
> Then what tool was used to find this issue?
git grep irq_of_parse_and_map
