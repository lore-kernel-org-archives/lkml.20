Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794823240;
	b=KI2F2SLAwh5g3dcNygHImyC01qXE2pFG65F9KytyF0Yr9d6XJunQCgJknzkSpuL+vSmk
	 6kGEwRQMIGPvlaXgmEi7KaPWiQPlRlnu9jzUbVAJWhZWj2A+fPuh2FDUTgtXXBJjsXeHT
	 6U2jua79FB5ME6ge3VFH3LDHuHKGYW5ZX/az05z/K3A4/j+8EioZ3QotzMSCAIVQbi/+Y
	 1g2GeL3Rs3/nyxcvkp3L17F+jf8TTzU6bQsa/bKtJPqszmePYbTU1STtBTRfSwVZ1Q1fI
	 lpTDnmPYZssUhoAhfdmyrs91zVRAixY2W7CWksJn+NRuvVzCw3V24U/AMWSp33iV/JA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zO1mthCUeUI7sxjtpBRWuN6hGRiK+7MjuWiOZt6OBig=;
	b=X6P4W2f+j412SI0twyRlsScEcgr1q7z8MgFgeEf+P2gFmM/s09JF09D5sX4hrF5FeTtz
	 d1BwSgNl0xgjMVMULOK0MYlALof8X/WOugvMYJkDO/lQSSOJAVyxJfzIf7ZvvQUwut609
	 OoS2vsUcCMZI88hVW5VkiB3CwPPv/GZHaUxcE/CgPzoLhfLwWtq75BUqKZG0VxZbo8Z/I
	 iDyUQXJWY2BxcU2/fKxkMfbxRYhwMIDCSPIvZfbBTFcuKCl8IjFQk6lJb2TVIeX5RSKGv
	 Mn39fFhkyS+JSMVUP8EFyrQ/YvSUMZyoG4e8dXQ4ftiO0KPPAZipoXpSLXpdlbS7zJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVZT4EIU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DB3606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7DB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVZT4EIU
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so5414009a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:00:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794823238; cv=none;
        d=google.com; s=arc-20260327;
        b=Hht7UloOcZeGRFjWuTiFsAan/9923jwtxW9sn2u+mOr2rGZMnmAED+NZz1yjCgYi5X
         JtqkdvfYTm61XCg3RNUpJQ8nq0fUQ8b/vLO1cdAHhKT4zrqBc0jnxnhCtRIYSl809ECW
         otPla+PPjTz1th94ksaDt3Q0a/7dMvAp7Eu1SCsW2bk54yAN1zsaEUQ+89vUNoLCfdkl
         Iz8jm1xpLEAHzsbXzByQVx3J9kW8rt+rtsnP30Bh3xxy2C1dDEyd5JdIrEt38jl+VUf1
         SpUvBUaClsTFpf5LJsr4c3hpYu8oLLAbepOwsKWmRVORTkI7/tudB/+Xx313JlTwdUQd
         Bsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zO1mthCUeUI7sxjtpBRWuN6hGRiK+7MjuWiOZt6OBig=;
        fh=loQHSvVWoGuT13TpYC3hSWWprH82TX95+SvDvGKSBxE=;
        b=Z/PuqFp0vLPr7MHglv/oy6ldnnU3RV4WieFZFYBW2IIKSOoxVA73BhdRZ0qDG0Dayj
         Y6NhIFtTXBUY95ECaGqUNG51PMJgnv8I0Iz2hLn4o22OZLeopFqm4W9+ZCpfxE0QJi5R
         KuOpZSgifeoaocl+HvUqMEubRalOoyjnVhBfxB4HUaGdxLUmot27e6V8bGBTmjkQY9v0
         LPSOC5qaOwBXOPS5RGEc/I1DfR1Yt05m++rZYe1jMnxVspe92UfL7eNU8HtskYAejlfx
         QhO5DIM0wEWETXwMwbCbkv6iVr308/hx9o8A4R7b4oYQp6fjqYlZx0hoBkxDWlsQXt+W
         KqZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794823238; x=1795428038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zO1mthCUeUI7sxjtpBRWuN6hGRiK+7MjuWiOZt6OBig=;
        b=QVZT4EIUkONNa2Ln6k8aRDzfViAq/D8qVQNEY9OkEP5BvCzOTqBaMc4a6fiMArdzg4
         2n+86+bP3u8tvuBmTcdjgOBd7KVCk+DWaxWtkawa+lWTZdOMjWsPkYMaiKjLS3fx9fJH
         fTl5k8AvBGxr0tPINszFzHL9GykG5zASUebd+u6Z9+Gqd7xyYA2BKp0QVxRoDHlDUUx1
         0Ghsg5UE+kwAOZ2dZJylq+fn4wCrR52msYs2n56iBUcVvU8TKyY2myYeXsQSUD+OiCpd
         dUNagIDLx3Z9Z8ZJVPKHA9IqGDlY8KNbf7H9s39IasyuiLg7LLLVrYMXnh7vB20wqU8G
         cKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823238; x=1795428038;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zO1mthCUeUI7sxjtpBRWuN6hGRiK+7MjuWiOZt6OBig=;
        b=1t4MkBAFxDklVzAjrO28VDz7LM2HViY3cYkMCUacbfaP/gqKVUZVxb2jQFZnPkAUdm
         gl134A9XwT9ThPSqM29w0Xn+4IW/4vOqcY7qQKYKBOgcD/uvlzCaTytbUQsDWdjsl2o0
         E7ImK9sBqgYUD5VAtiKvEgtcN+1meaFQv0dbJEoE6qpG/YK+zpd2hivSQ7a57dthM2m6
         CG8GzOf1LF0wlS8n/UrOimRs51cAU0wY0t/9wwrOOPUabOZe4TZlV3W34hua+W39OIgv
         CXYJk7iQJKwJ8D0+RAUUP5c8Tk8UTJvVjaBg1/ZxGhnprefr/wwL5r+4Ks3SZ8rWyMxi
         3XLA==
X-Forwarded-Encrypted: i=1; AL+hErEjahR/AxtpsTidFoRj/XyJCzO7g/fWNQctHnCttgBHc7G5Ydjaz1ZltC69ao1RP7+kiglyty9zFqdgh5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OAlURBfU+RVuZfXHZpVSqY7kAI8aIaCKhwDLWMaDR2w7iVCxL
	syalWCrd9bTXBJ0nNjGuEMqhOUjxKSvmkD4ONcfRgGh4vMdVNuIlYgNpZAlHN/juxbDTPMnKXgc
	as+FshS4NB6JrW9MplZRlvMB9Q+vSnNA=
X-Gm-Gg: AYBFou1Ru33/GiUefPPdsPOoDM6X9MQB5ExCnMCRqkmCcmMAlgjXD08nibasJGKKYw/
	mEis4tPJWwnTWSTTGAl1Zrt9NDv1nr8YXB8BiXh7yHG8ExLPY8OT216OT6N9Kp+IdnaaJSDttbt
	pcevAtph8wF5YiN9d5mszpizEw4bumTK/0xIEtPpJb/zeYGPFSz+vVIlU+VNwv4I2cz8AgDlmtx
	VXwsJwV4VmBHuDbw7uxVY7Q57GKes/T6zUh8ZcjTPBjxs24BRxngg6BTNXyuV9sdt6LzHTi8L7e
	O+cZI2997oIykXXXUAVSPRcf0h/5bYpQZWwLwSdqqewneB4+9v5o1NfB6u38ju8ybuGkOq/fAEf
	Voz0QuRei7pXAVjci7EipMfor5S45ETo7QK6pRrfc61cm13GQxw==
X-Received: by 2002:a05:6402:28ca:b0:6b4:16fb:b9ba with SMTP id
 4fb4d7f45d1cf-6b7c0c4c21emr6648394a12.36.1794823237140; Mon, 16 Nov 2026
 02:00:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115205408.99849-1-vitorhg20080@gmail.com> <8df779d7-eaa9-44c4-a0d8-e9187fd8819e@roeck-us.net>
In-Reply-To: <8df779d7-eaa9-44c4-a0d8-e9187fd8819e@roeck-us.net>
From: =?UTF-8?B?VsOtdG9yIFNpbHZh?= <vitorhg20080@gmail.com>
Date: Mon, 16 Nov 2026 10:00:24 +0000
X-Gm-Features: AclHuK_TnfPqus-jqI3eh4T6thU-sLqYrsYSrMSfCIt7QocN7bjxeDrmmxB1TXE
Message-ID: <CAOhXrFdg41Rwepx-YN0i2z+tmRCTppKV2sdGTMCNOeuuB4RC3w@mail.gmail.com>
Subject: Re: [PATCH] watchdog: intel_oc_wdt: Add INTC109C ACPI ID
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Diogo Ivo <diogo.ivo@siemens.com>, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you!

V=C3=ADtor

Guenter Roeck <linux@roeck-us.net> escreveu (domingo, 15/11/2026 =C3=A0(s) =
22:39):
>
> On Sun, Nov 15, 2026 at 08:54:08PM +0000, V=C3=ADtor Hugo Silva wrote:
> > The Lenovo laptops with an Intel Core 7 240H (Raptor Lake)
> > exposes its OC watchdog as 'INTC109C', leaving the device
> > unbound, because this ID is not present from the driver's
> > ACPI intel_oc_wdt_match table.
> >
> > The firmware selects INTC109C or the already supported
> > INTC1099 from the same CWDT object's _HID method,
> > depending on the processor signature. Both paths share a
> > four-byte I/O resource at PMBS + 0x54.
> >
> > Add INTC109C to the match table to use the existing implementation.
> >
> > I have tested as a module on Fedora kernel 7.3.3-300.fc45.x86_64.
> > I did verify device binding, timeout configuration, start,
> > keepalive, explicit stop and magic close. Register reads
> > confirmed the enable and timeout fields. Expiry-triggered
> > reset was not tested.
> >
> > AI assistance was used for development of the test harness
> > and 'peer-review' the patch.
> >
> > Signed-off-by: V=C3=ADtor Hugo Silva <vitorhg20080@gmail.com>
>
> Applied.
>
> Thanks,
> Guenter
>
> > ---
> >  drivers/watchdog/intel_oc_wdt.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> >
> > base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
> >
> > diff --git a/drivers/watchdog/intel_oc_wdt.c b/drivers/watchdog/intel_o=
c_wdt.c
> > index 0b012aeb1..a78fe1e5f 100644
> > --- a/drivers/watchdog/intel_oc_wdt.c
> > +++ b/drivers/watchdog/intel_oc_wdt.c
> > @@ -215,6 +215,7 @@ static int intel_oc_wdt_probe(struct platform_devic=
e *pdev)
> >  static const struct acpi_device_id intel_oc_wdt_match[] =3D {
> >       { "INT3F0D" },
> >       { "INTC1099" },
> > +     { "INTC109C" },
> >       { },
> >  };
> >  MODULE_DEVICE_TABLE(acpi, intel_oc_wdt_match);
