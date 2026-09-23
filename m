Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C8353B322
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188434; cv=pass; b=VdmIm2vTdct262INTuHUFwTJw/WQSDjcpihU+9a4lIufyPwOZcLKTV6e+kpe8oGfFxG3W8a3fIq6qEXm6yFvAEfmSCjJ77cDlkbE1gGWg7LSIu3ts9CSicqgiHtktawECom2z+tR6pfpbUmiosfSDjmhJWnCklDndEIaqD9jp8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188434; c=relaxed/simple;
	bh=CElcEHTV8j9fLleWJFKVU60iC5Y2Vn5eBcn2vHfWwRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uyGSxXgnqh2ojwD1m905IUonMcNg3J2sQA2L381ivDHrp3VXD5IkFYTf3ugiKO0uc34pKocH+51rk1f/SVedEshrqw5/0S8iGrtSRtCSomj+G0ieHBXI7EYYc3fR/djMRlPzpkaY5L6eCbZy23eqye9fhI+HiTwLiceeq4nwZFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISOlrzXW; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISOlrzXW"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a985fba28bso1740092a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790188431; cv=none;
        d=google.com; s=arc-20260327;
        b=rqkdEsueeGDQ+Ga3zpvtZhEIJWs8PJNNp41O4xArPVZt0u088pwhZAHZ8dE8w4NRPB
         ieJeNa3shJAmduO79pYN6Z+bq8OEI+adBKnVKATMy+Krhz9m6qxqo3lKlup0MA87b77C
         e0RJIErvgAlr7SmPpwFt8+o6EnfvYsIRE7eFaYNkKE5dg7Zl1sv38vPpgGHctpdjEhaN
         8A0Jp/o9Mx5a8sdmACztK7UL0hLSJHvt+tELcFCIo45/htvvdknUzMyr26naPNazfvF1
         Vi0TwaXVzvcYqvyc8GeZlBLt4GqXlcyUkNith/cpLYozRE4h4jrT8cbiXZ6FZEOZPVqK
         ldrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xWLnpLG+/xCQzg9TUwjuoEhhJm7Z/sPAqn8dxe76jpM=;
        fh=hyX7jqlUGLauFw6yjkZDN9sW8fwf6oo6++N4X2+NzEY=;
        b=kmolAnofhmOpTrGa+Q4rZc4m2XtupG2TwkYcOKYhNc6z6Y0o3XEXsLDcNuE9V3Nrfp
         NaCUoL1TQWb8aoQH/IeSvrs+gVRIYXCbjG6F9xUziZnl0Lb9xS79AbBJhxwxlMlXftS3
         i9Bs10RhOcWuMQ1xodP2z13Ms5UDWZo/CyiNMFWYqBccLAveepGZEZ2JiXd9wFsDnyXk
         DRTi3II7cGbeK+mieuZVyS+UviGM6s3C6qJDXAfqnA5JyS/iHydQSaz1YRAfqe7acmNk
         6GIp0Xb18mozQquHQhVURBmWiizZn1X8IqZdXLj1cXHOov0+o27QpumkCQp4UroBxRiV
         Lm4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188431; x=1790793231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xWLnpLG+/xCQzg9TUwjuoEhhJm7Z/sPAqn8dxe76jpM=;
        b=ISOlrzXWsccaU25hNuSdFL0u52nvkxBpHw44C+Znba6emZx7ibOrDHPdSktH7iLTnr
         0m4OjmYqoL3j47ONYuS+Jgwdj/ClZcN76i+OD7O36Fpw0GKviz+3DVwgkvLoXd2ZF03S
         47t3YyXiExjQo+//K5m89otBMrzt0tcGlEAEenRHjIr/zZikgFXoEFtJUYUAYROlVwqr
         AUjGUlUrwB/AdW7QBWGclSB0UxaAoXxPNQKmGFnZmFAvsqw1DIAPjgjngXX+J0Cv3ANC
         xqBAcsPocVcEUPB7SglKSaQD4KlVm+15Pg6jayskF+jBBeRKIoAArSjEQHnSQszTueIa
         H7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188431; x=1790793231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWLnpLG+/xCQzg9TUwjuoEhhJm7Z/sPAqn8dxe76jpM=;
        b=Vr7IZ+LHGTPnGrCwoVnjZK+jFKenBWx9mrWXfghgGmRa6qISpwIStle3OH3g53cXYe
         CS/JqqTyZPV761vdzedqWaddKPr990ckspdFNr7QBQuH4us3XrwZRXVn7Tm13iIwyxdE
         2txCUuO9tUS/IKqos1uUV1f9H7RAn+b9e0CsOqIJlpXpLhaTenYDbf1lXO/nwpyIxUF9
         zJuyGrtVdaIBZR+IUDpTxRl2Bnb6S2lAr+djtSYvhPrevri+d5+zrs8LHFM6wnw+jND3
         ggJIKYwowOx+oPAPyYprVkb5lH3WwM2eTWzETk+GxGCIEBPNSdewAa10MzedptVxH+I7
         IF9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxGSNQJNA9XRIzP/YBWjNwc1xIq7+9a4uKbiGmSsNRKtmrKIwJHLCiZElZ9SXjEeB9Gb77QdoPCjp9JO/g=@vger.kernel.org
X-Gm-Message-State: AFuF++nE64xjBz//wz4ZFl2e3T2P45h7uwo/nPGEtIVETyWIY3fwUlBW
	ggYx+l8/YaepqR/6BgadbRLSvFx2na5W9SmLroGkkrB0hiopMlymKvANN/8wU8qhZRPYJMSdPuf
	/fTMRR9JpkpgeVrlSfx09sd/pkyBEUOM=
X-Gm-Gg: AYBFou3RKIto/n65q0D1lCQsRqkiOOme0SutaaJUjXJiXIt46zyXZyR2SjDaViL3dqi
	q9FaVJpeLTa/t442dfbMVxl7jUuRZcrDbs+4aDxY0CW4Y3bRDBL9wr5t0VPigJbV3vag8XlKtJ8
	lqmP7hczd+VSKwngZoKpmAAkg14c/h2eQbKt669A/i/9Avfj+gavudk3h5R16o0o+QxtTdZ9R4X
	CFB53rckQ7bNaACVXnWBDMXJMrZEOsrtqzMDKlty6UZp3bEIskaRlQgkLwx2DRuJ/s1EYrblJyW
	3Il2/UtygaIxZyowdcuZKtweY8ND1wx+MSw9kjpClHs69/d2SxA47r9ZDPeBL2AxtiTcLiSrgQk
	wC8LifWW/n3Q1VL+4VpbZEPdzoQyyEnb2KwViaCwDTkw1PFPyaB7ipuorbEBCLc6JhaCVjEhjbm
	2aEI/G0wIPKZZlGGZ6+J11rzplObNR6G6jHu4wrHAMWIoFkJTOIt7RPNkW+Y0E5i+Oxvp0tulkT
	W+Y
X-Received: by 2002:a05:6402:44da:b0:6a9:232b:ec6d with SMTP id
 4fb4d7f45d1cf-6aac90c176amr37825a12.41.1790188430470; Wed, 23 Sep 2026
 11:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902221709.340393-1-rosenp@gmail.com> <2026092326-python-dugout-7b05@gregkh>
In-Reply-To: <2026092326-python-dugout-7b05@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 23 Sep 2026 11:33:37 -0700
X-Gm-Features: AclHuK8NujiV0_j5LaQJveo-PMbdxd-TdSj89jEnHI-dYfRz6WNVHLu2U9RoDK8
Message-ID: <CAKxU2N8nYJVWftvmPaOytxj2Cd97kKS9-LRcJ-sWzttibqYJdQ@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250: Add Armada 38x earlycon support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 5:22=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Sep 02, 2026 at 03:17:09PM -0700, Rosen Penev wrote:
> > Register the Armada 38x UART compatible with the built-in 8250
> > earlycon implementation so stdout-path can enable an early console
> > without adding a generic ns16550a compatible to the device tree.
> >
> > Keeping the vendor-specific compatible avoids exposing the UART to the
> > generic OF 8250 runtime driver while preserving the DesignWare driver
> > Armada-specific runtime handling.
> >
> > Assisted-by: Codex:GPT-5
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/tty/serial/8250/8250_early.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/tty/serial/8250/8250_early.c b/drivers/tty/serial/=
8250/8250_early.c
> > index 44ec209f37c4..265d49850e15 100644
> > --- a/drivers/tty/serial/8250/8250_early.c
> > +++ b/drivers/tty/serial/8250/8250_early.c
> > @@ -175,6 +175,7 @@ EARLYCON_DECLARE(uart8250, early_serial8250_setup);
> >  EARLYCON_DECLARE(uart, early_serial8250_setup);
> >  OF_EARLYCON_DECLARE(ns16550, "ns16550", early_serial8250_setup);
> >  OF_EARLYCON_DECLARE(ns16550a, "ns16550a", early_serial8250_setup);
> > +OF_EARLYCON_DECLARE(uart, "marvell,armada-38x-uart", early_serial8250_=
setup);
> >  OF_EARLYCON_DECLARE(uart, "nvidia,tegra20-uart", early_serial8250_setu=
p);
> >  OF_EARLYCON_DECLARE(uart, "snps,dw-apb-uart", early_serial8250_setup);
> >
> > --
> > 2.55.0
> >
>
> How was this tested?
This is actually a bugfix to avoid having to add "ns16550a" in dts,
which arose from a dt bindings commit asking why "ns16550a" is even
needed.

Anyway, the actual earlycon functionality was probably tested on a
Turris Omnia given the author of 62480772263a
>
> thanks,
>
> greg k-h
