Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793454311;
	b=bsVVKVqeKfW+2XzXGoS4CKBIUxKahGfOwvYnUq0ZYdhg5P55EK4iAQqQDcQSH4lBRTBR
	 6uHRNOYZO0iTRUUWln6zhe16fmGzoPUG34ZVD0YB5SgpBDJ7c7ccseU4kkctq8I4Xp+g6
	 NPI+JMeXOamDyRok4W/rjB2DE7lXkP5QHBG2mvN1r94e2JgHadAAFBL/9cZl9DuN3XyA6
	 3nJeC7xGMmMkJuf5J4L0aotiPPF2PNAKKkBi4myCJmyqz5387ICIYP5FqJIp/Fkcv6FgX
	 5tfW29oeL9QPARAgxw75qnKGILvUFMdOfZqkx/kNkelHUbg1BObNPeRHmvsE08mdQAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793454311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ydiuw2JFoGviRXfS/1qoEyS58uTjOZNZXXzHRdS4SA8=;
	b=Ajpum5IKPTxqwdq7q0KmLZmAECayqJF+nGEPNV6JTpRBqHrrQ+tO2/Gi972U3+guJFtZ
	 5an/+kBwSCeZoAMrOYKqJdXeaAy9bQFgJiHI92RCSulBwXU63DVS0A75Q9YDV29e9HvoG
	 x8CaMv0QSupqU4jVGOwTObghC3j4NSQ4hTFDp3WvDIaEfhjvo2t7J2C7541rlcVylLFHA
	 uinSRWR2AiU1d+5R5deHl0IL9y0kpr8n25Mofl0OHnXooPcKX3q2Q20M/peFWDMI3lxQt
	 SMCFR+4Ed3XhLWYKjN4Rv3rcg9oOZStvVMx8EbJd1UQHzZfgH2sVRtKr41JChTtEOKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1CbNOxg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BAD606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BAD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1CbNOxg
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b413b0a974so2398162a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793454310; cv=none;
        d=google.com; s=arc-20260327;
        b=FLrg2uQQyrPpq9Fn1Lu8Dc0ooeIgAlFwmD6rW6rLhfPXEmyKH0CZPlUru2GXTjlEIM
         P8Rx/RTsfKn2ASG3IaAZtHJtM82A44OWGUZiifpqfzmD66+SrNtAPdj+q0hlqfPwCuUX
         bOlYKvUfIYGoDRCjyWMbfXQp1a1v4/bcLBUFhmPsGm+lcbZkZjS2fgedh44Dha12AiZ1
         rFLFufArb04a6hxV4wXB22HT0i1al9QJvhWztlZwa2o2aJ9A+qnLBt8o1cNG9TW474h4
         PA0Dh+azSqzrH3r7qR/ll1vCMvr1ZlqMUa4oJmEjJJzZIGniSvKJgSgjZ4hbFRdGcaL+
         9vdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ydiuw2JFoGviRXfS/1qoEyS58uTjOZNZXXzHRdS4SA8=;
        fh=rA++95uj3Z+gmrdS365u0rAPkEaMKpVqUuE5Km63hPI=;
        b=EF6sj1STU+uA57XyPz3fAlY9yhjXf4/V9T+bD3TMvnA8+4ZihhlY6slkW5J08R45ZD
         pjgIPcnifSXZL0VWb6xeJ1COU5baw6YorPwoYOA6JZBnE+G38JC48cFHL4op44hwOTWx
         ydpjTfUzzR0fnpDi424Oo3VolhA9F4XvRV0jzrmtyKTmg/Wml5l+DlNLNmEoPjM6yi2m
         neBPC0p1KbecAjaqcbZMv9leh212qfzKUEyIzneANh1lXteu8RSbc8Z/hQPJ0lWFHJMF
         A063fXj4N6fpFbxLOZGPdgQcqUxeMV5SFBaPtNBAdxoL7ugZGwEPXpkP9xI1rRD6Z6xb
         yEGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793454310; x=1794059110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ydiuw2JFoGviRXfS/1qoEyS58uTjOZNZXXzHRdS4SA8=;
        b=h1CbNOxgyw+hpQJtd6f107k9Jr7eTRpY7s5wNEukKTRX8dgBrYA2wfAwECF6uhHUv8
         TK63MbmgAkGBNAFJ7zK9KiFGeYc3oKVgxY0GSsOWP7Jp5lwDBrHaH/ByaDt2vSYCYV8N
         dfRQEsJyZAMTGK7AkPvr3rQIpQrAx4vjyMQTzLLld8ZS938SHHZNYV06dqi61zv+L9BO
         1tqUzMtkBSLucnsaI8ncxcGWacThWVI/LZPgAHBaig5AzOaJcb7MOR8KIJjpMxEH9Bao
         5ARS15jFwp9Ol8YnJOo+atsdimimrpeg6er+oZ5pRvMKEoEezrfoNqWszIeXEnLaGhE4
         3iBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793454310; x=1794059110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ydiuw2JFoGviRXfS/1qoEyS58uTjOZNZXXzHRdS4SA8=;
        b=en8EtwvfKAma2ajjwFbsweITd+lZx6Lnu5nbDEvFAxv/BQpVgPVUoauVj4b9uBuQBF
         NAdLLMbICApTLtI6lszaztRwh2dMYoUypE8HyGDqdF9gpSs9OG+szyP4dBtqeVVijo6H
         QPyRFIzFF8OkSWB/+udp+IqX/499z+X4wqLywmVtP76hNHanE3lf5tQNnMSm+AhDaPz3
         /DVIJIcWxqlJFjnNxkolciexzbgjdL8d2pAECoDZZpjUHsslNQBk4kut4LciEXC0dXhP
         TobQOZ/v3hAojtb2jVGCjPKMqZ+LU3skYLpkk9RoO8YLT8x0DAHwvVsrra05pV2nyW1u
         k8Yg==
X-Forwarded-Encrypted: i=1; AKwUvByJzwWSgR1tTW2iWcyIbDFIunMhjopTbt6gj3tAZOBvUwucSGXt80QO17ZKeOK4kVUQt1GlAOAsUac7/r0=@vger.kernel.org
X-Gm-Message-State: AFq9FYInBjd+Gb7e9wO23+Q3Gj4TSP4s+mfhvzMka8ca1+RMLTWWAFL5
	edz9rd8XjyArjLrueiLHlMZGFw7SmeNdJ8MVNkGtiiHqPsm5RUWFqIp5i6Yzt5O3HjRNvSTHHZk
	rrFcOhiWaTE9VdmZ/mU9Ttw+gmysIOlA=
X-Gm-Gg: AYBFou00pPqKcQbYfmWtx1wsqoDbKZruAqxtg4hmnOwHnEx5maq8dBA+QPcGhtI62yp
	0qHMORF2SkveLOcUgCzKvfADP8q3r8EihpYzVEm1xLT10S71xmbCUzBHESL7U5a9N0CR1Eaopdz
	9qQdoSUbpolmxvIC9ENvrcE+IA4YFBuBIdTsMFjt4xP15EaZonBHcNFesg/5SVo250S9uf89bfP
	z5tx9M0uSY4Bg9WFfMFBoyhLynwT8eoW2Du+Wq7fvW7mIEebT1DI+jKOIh0YEjfjw+7Fm3dQ6AE
	KE9ZHjFMNTgPeJlq6+pAmwfFQHDTIUC23yIY6HvbYpFY8old3g3sV5pRzKLVyRINbdkEvLIAkbn
	XlR4rG4W33PyqEIDaSuWrjI/B06iSe7vTKM5mR4Wvd0uVP0DcrDtUFR7yGWGxHiuP2+R8B1M=
X-Received: by 2002:a05:6402:1ecc:b0:6b3:d0e9:2e87 with SMTP id
 4fb4d7f45d1cf-6b4ee0e1f24mr1392387a12.5.1793454309714; Sat, 31 Oct 2026
 06:45:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031005425.3351240-1-samarth.colleges@gmail.com>
 <20261031123749.3783352-1-samarth.colleges@gmail.com> <2026103143-alienate-subduing-50f6@gregkh>
In-Reply-To: <2026103143-alienate-subduing-50f6@gregkh>
From: Samarth Narang <samarth.colleges@gmail.com>
Date: Sat, 31 Oct 2026 09:44:58 -0400
X-Gm-Features: AclHuK_UZoL4ALbG8OiocStKAY43wgTppT1vPowuPmaCkqxwveQ1ulzoHGIddAk
Message-ID: <CAAbz3fR3DxTL66-0MJVsoWq5-FhypwdDn6=A5iyLUKY_LyOD0A@mail.gmail.com>
Subject: Re: [PATCH 0/2] serial: keep the flushed TX buffer mapped until DMA
 has stopped
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Greg, I will address the findings Sashiko found, would
appreciate someone with hardware giving a stamp of approval!

On Sat, Oct 31, 2026 at 9:00=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Oct 31, 2026 at 12:37:47PM +0000, Samarth Narang wrote:
> > This series addresses the DMA buffer lifetime issues in amba-pl011 and
> > fsl_lpuart reported in the parent thread, where flush_buffer() unmaps
> > the TX buffer before the terminated DMA transfer is guaranteed to have
> > stopped accessing it. In fsl_lpuart, the buffer is unmapped even before
> > termination is requested.
> >
> > Since flush_buffer() runs under the port lock and cannot wait for DMA
> > termination, both patches request termination while holding the lock an=
d
> > defer unmapping to a work item that first calls dmaengine_synchronize()=
.
> > The TX completion callback leaves the cleanup of flushed transfers to
> > this work item, while shutdown, and suspend in the case of fsl_lpuart,
> > waits for the work to finish before releasing the TX DMA state.
> >
> > Both patches have only been compile-tested with arm64 defconfig, the
> > relevant drivers enabled, and W=3D1, with no new warnings. I do not hav=
e
> > access to PL011 or LPUART hardware with DMA support, so testing by
> > someone with suitable hardware would be appreciated.
> >
> > The imx driver also needs a fix for the issue reported in the same
> > thread, but requires a different approach because its TX completion
> > callback unmaps the scatterlist unconditionally. I will send that patch
> > separately.
>
> Again, these need to be tested on real hardware.  Not to mention the
> bugs that sashiko just found in the changes as well.
>
> thanks,
>
> greg k-h
