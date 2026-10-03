Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E255B357D09
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791063173; cv=pass; b=VBDXuWPbUzL9Kp/c+IwPb9Cy6qW4pqT3Zi5vKJ72XICp4NvBIYW3o5Yp1AGwofSwHJcz5FxoTc5s+66eliAdFixUp/IToLMii3zI97EqFCIPW7oXWq+2RtdfF/XMS2eJTP+89cZkZikHBrWuRfaf+PMmosSoXA1L+8x1GaxRYCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791063173; c=relaxed/simple;
	bh=Vhg9CdEH7+btjINehl2B/FEThVqkGiUPVHx1dzpGa+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TQBzQAOh+U0MwgFb+4zGHUxub3lTYa+IwzfuYGg44Yg9QTlpjyZ7hafxoIe5gy5YiFL3C3HTCmhSmoEJ3LdotpKpTOPA1cZgh6XW7IQGg7jujs9hpnx3j5bp73jqPZ8J93vRsKF8HWAXMcXARRncT9nJZLrb3GkxmAXUljm748w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UozZgL2J; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UozZgL2J"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so805846a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791063170; cv=none;
        d=google.com; s=arc-20260327;
        b=mSpD3Gws629GosxQS8a2XJjnjxvvnGJWzWvpN+ylLdahyihUrPAnCFEWrj8a5pIDBh
         monLagUZNEIOtmAVRh49HW86mMJr5GeJxwGOeH9k8NxI6DGdXuQ28SRLl1y1Ery0fwhE
         zcLr7gP9pPosCSH8XIURHFA2YB3Vdr6cUoMweCumLkVaXLrAFOhEhXse/TdkNNkTQVZ0
         AJGiXerEFs68nQlonfJhtS+wAmj9c61mVE/a+QCfe30h4Wsyl6+15UamizJywwLkM7aT
         cz9GQt7fIvpUFmujZk/3kd56fAGaBZgL55r4HlcqIomng91+YObYZMTk/5NdPTdybcdl
         3IZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=af+0t3iUGS2/6SKpeL3Rck7lTZ4b3LAtconFKbgLekw=;
        fh=e2lNyyWzDlKzDnSmp1oz2BFb2g9/U2FnUTlreHjloxo=;
        b=ppmy5aXjDN13T8UxYhBQps4jk1A44VeuxDybn61qvJoRiTAgfJKFg6j6EB6s4zn4Wq
         5wICyjHRIVWrU4YLWw7CszVjR+UyVPCQKv4Pa1M/wtUY7Ef4BQ9zAZblbMvtPplO8upb
         TvxydcI2jkkfOF+uIQGNuTqko++bA1XPEJBVFTk2eYtt5eK3B/c8TQk/jzQrw/0Wpxf7
         IIFJUEqygiidN+TT84NEQyFKzdQDhi64GdgiVqQHfG30GBZbsuCX37rMmLsdM0QON1H8
         kmeE7BFrXYHRnY5Jkp69KhXu60lbq6w/h5KwLqVrz5amgIwTUOpRPS8fnnzSXVR3Yciu
         dUsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791063170; x=1791667970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=af+0t3iUGS2/6SKpeL3Rck7lTZ4b3LAtconFKbgLekw=;
        b=UozZgL2JiWuflMMze8QKvwevHxL6AkoMXRBpPyLxrrLrI9qdGm9P5RPUkz4jQESRUO
         f28vwqCQyCaImI+BgbILgk/G46wcEBf6RlPTkH6oHlZQS+2bS0C0qotqRs+MPe1DKj6o
         oRMJQ7I2VdoNCQPXXgKhe0Ybta+eGXyioazihk8LXi/qCyNZUoOzpJlRr9ncYMEL3XES
         ciXW5KdQOfajwc0+CARD6NUxWIx4WNAuWY63dKDr6vF55t2Xvsb7zNqgkT9EVABKoHhF
         Ocp6FpTjusrpiNsLxkSxqXpzzOQ546bI580BIrw8TEW4QEJcxbhsTg2EtSmtqGoNgJhG
         UBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791063170; x=1791667970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=af+0t3iUGS2/6SKpeL3Rck7lTZ4b3LAtconFKbgLekw=;
        b=QHLz8ppBOLTQn1xLgiA4KpePD60lI7tkbFph6SJKwDy+VfU6a+yNaGNJsEzNh/FSJ7
         Hk/NuO5GM77C1RQ51Oer4OB90VRUhMX6FoqOwlkdAF/KAC/PYOpGiJVQOgQrOIh/NA6a
         OeG859wNDN0eXVoPIXwd4SZ3B0XZrykE7wo5/nH5Nw6PiNqcMmczSmqCVWhQe5byvZ74
         qEYooqwZjpG/05NDxDoQsXjLsVP/zPnWDdH7kRY5Ov9dAeEo3YawLXSraPmbRXqW7QWN
         dcAW3B9IyXoG6Hi356wrORYgvFSFbRF60wE1uQl7mviSixwIzhBPpSVqzO1apkszaQiG
         7quw==
X-Forwarded-Encrypted: i=1; AKwUvBxGky9pUWuTnqMtJ4IqHrlexTcwI9qFgXGWLdDLABHURX+Jh+IFqlH0FGWEUJBJGi1Ai6OeCa4jC+6gZqo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGRlw4u+F8hP36sBCxhRl797mSyliOmKvSKv/+mtcIEkOghr0S
	xqenyZHmHC1OlAJ9jbSmS5YSTbDmwS3/DP6+Ql4z4s0pC2z3NtuFNwP+CVQdRo/yQoFQEISc29P
	mdgVV+KhgNm85MRbQSXF3MbMJofxgyR8=
X-Gm-Gg: AYBFou3NsmU0f8JbKsMOF2gJ5tZKQ/XWRDo5l3DZGOubZhpviHy4NKRE3Ega1UPZxWJ
	2vYx5ZM7vWKqsLRYfNcTIxqrveCb5eztNU6aEyM5QwKXxRwxpckoRIkonwZUsmBgUw0CDfGjV93
	Yg42liNerrPt1TJlImEchaRJT8SShiTreBPMNlHksa6aEd2/KArdTIECBGOkV1RpEDzyspST2ZM
	qfbL0RdXDlJrzQMKlvZROXaBvjx0BsRSdKEH/CITgFu0j3eny9I2l+QPWlm+gTTLD/72ebmsXd+
	GOYUt7FCVUJu/MJ4PkMG10Le4G7sNNnAC9GnN0QUojp2HcPBumnQ7Vb/LIVujcAjzff5m18TMxI
	t2mQqByh5iGNV1HcvnFS1AQ6B6ZRQvHGSdneJNZ0o9CI3dGihDDlsk5hQ4mvDVYxZmXqeFpoCFM
	lmzrAMQ/xHISdE8SQ+v/Ce+0tmgZxO86+BlhRSdbBXPw64SXfB0tL4xo8icQCiHUcsyQ==
X-Received: by 2002:a05:6402:460a:b0:6ac:62c2:bd35 with SMTP id
 4fb4d7f45d1cf-6afad8bd818mr2550666a12.13.1791063169767; Sat, 03 Oct 2026
 14:32:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925181530.52953-1-rosenp@gmail.com> <2026100157-unleash-anime-e2cf@gregkh>
 <DLTSHPPY40S4.1G7I24UTEFX9C@gmail.com> <2026100212-massager-hardware-db44@gregkh>
In-Reply-To: <2026100212-massager-hardware-db44@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 3 Oct 2026 14:32:37 -0700
X-Gm-Features: AclHuK-g7Fqct_KQ4yY2h0ysuh8vENWPp09pevlntRadjvfUbDGiPGme2jGtvE0
Message-ID: <CAKxU2N9SVNL3747nJT-FQgis1O7iBrWzS3XGfXcyM78mUG7fGA@mail.gmail.com>
Subject: Re: [PATCH] serial: cpm_uart: use irq variable for platform_get_irq()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 10:54=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 01, 2026 at 01:38:15PM -0700, Rosen Penev wrote:
> > On Thu Oct 1, 2026 at 1:46 AM PDT, Greg Kroah-Hartman wrote:
> > > On Fri, Sep 25, 2026 at 11:15:30AM -0700, Rosen Penev wrote:
> > >> struct uart_port has its irq member as an unsigned int, which does n=
ot
> > >> work when platform_get_irq() returns an error.
> > >>
> > >> Use a local irq variable to handle this and write to struct uart_por=
t's
> > >> irq member when platform_get_irq() succeeds. On success, it returns =
an
> > >> IRQ >=3D 0, which is representable by unsigned int.
> > >>
> > >> Fixes: 831603b3e8aa ("serial: cpm_uart: replace irq_of_parse_and_map=
 with platform_get_irq")
> > >> Reported-by: kernel test robot <lkp@intel.com>
> > >> Closes: https://lore.kernel.org/oe-kbuild-all/202609251916.1XlVHLwd-=
lkp@intel.com/
> > >> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > >> ---
> > >>  drivers/tty/serial/cpm_uart.c | 10 ++++++----
> > >>  1 file changed, 6 insertions(+), 4 deletions(-)
> > >>
> > >> diff --git a/drivers/tty/serial/cpm_uart.c b/drivers/tty/serial/cpm_=
uart.c
> > >> index 39f54bb7b485..ca0acccd3dd8 100644
> > >> --- a/drivers/tty/serial/cpm_uart.c
> > >> +++ b/drivers/tty/serial/cpm_uart.c
> > >> @@ -1517,6 +1517,7 @@ static int cpm_uart_probe(struct platform_devi=
ce *ofdev)
> > >>  {
> > >>    int index =3D probe_index++;
> > >>    struct uart_cpm_port *pinfo =3D &cpm_uart_ports[index];
> > >> +  int irq;
> > >>    int ret;
> > >>
> > >>    pinfo->port.line =3D index;
> > >> @@ -1524,14 +1525,15 @@ static int cpm_uart_probe(struct platform_de=
vice *ofdev)
> > >>    if (index >=3D UART_NR)
> > >>            return -ENODEV;
> > >>
> > >> +  irq =3D platform_get_irq(ofdev, 0);
> > >> +  if (irq < 0)
> > >> +          return irq;
> > >> +
> > >>    platform_set_drvdata(ofdev, pinfo);
> > >>
> > >>    /* initialize the device pointer for the port */
> > >>    pinfo->port.dev =3D &ofdev->dev;
> > >> -
> > >> -  pinfo->port.irq =3D platform_get_irq(ofdev, 0);
> > >> -  if (pinfo->port.irq < 0)
> > >> -          return pinfo->port.irq;
> > >> +  pinfo->port.irq =3D irq;
> > >
> > > Why did you move where platform_get_irq() is called?
> >
> > So that platform_set_drvdata does not get called on failure.
>
> Why does that matter?
To avoid doing unnecessary work.
