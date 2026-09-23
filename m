Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80D8486B8C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178511; cv=pass; b=hUEnulFx4j3Bh9TWfLlweGgRAqrBoG2Au6hDMyWq+9XbizXN+TOoG7LCy0un6VDxK5RgiKroctBEz2HZ7EvyVyR3G+CcWKHGjM5yNU3o9S+1RwHD4HMTrvGAYxARpJFubuctS+UVrKhj93Cvp9JfHWfWgARGEArTWlnbAgnAqSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178511; c=relaxed/simple;
	bh=l2pmTaYj5bsjg/VqjbuilhgmiwEDlikpvuksfpHs4aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePKWh/pK2XVqwE+/EV4iPlV8baq4zYLAA8qf1EJDRFmdEODpDcgF25nru6VEc+3S8+b3a37YDccnHg5w6JvIKN0KUcqnCBvprJOVhFyTz8AdbdcQQ3cv/pNlgP5u6vSebEOTTcknNmF++73dCbGmN8IRFgSlmCkVz67KtbN6WoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oGI8e8Ch; arc=pass smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oGI8e8Ch"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e2ff27bso688715e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790178508; cv=none;
        d=google.com; s=arc-20260327;
        b=HXB/eMzjqxtZJA0jAmbMOOFaRc0ccGC4TOZG0w6xdejaJkZsn7IpQaH03DtJxtjNXX
         4W0XkcLm7sgNY2TdlrPiENB+60N07hZP8ULK9gdInpWBkegmTuhnC/P1KtScCn9riA/I
         3gPjoGGnoOPS1rtdwEGPBdB/NGxp528jrwgPYksC7eWFPWtsIrb3ZcU2c/E7sV/N9M8c
         IWjpFx+N/OlNMSNgz4X7iXZD6WE0cdaa+8JgYC8GUpEsfbD0gzvjbaLAEeW1Hm1QEq5F
         ydZvP0432tMZvRgwFHclHSSLWZ9efrn3VRsKJVBi7zX2IfBFJeNqNKnuboUm+uC+7mH1
         kzIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f4WPZ4zqm8ezSWOAuYy2kHwqmOGcyX5dZpEWb9VtYmM=;
        fh=vzWYGVwW+5Aso+BQXhhxuqODiCiPd/QVd4hnf111/EY=;
        b=sJe53tYx2ThQaORzXDpSKi088tC+hRazbjb5l5wzOfzlf86VyuE0zFd1kqEIe8gsdq
         S39naGMoULmetPIlJF5mKL/ncP/DGXKOA19p0oj2XAKCvJR9MkY4bWr7OHHFNA7m+Zh1
         bXzGYvfzvpPNamcjsXkw9NG8NIomcQOrSRPzP5Hk8RgfNCF0tYZhiiVJwlKgFX0UFV+L
         VO5lHK1ZVftVXUiHFG+fkNbnYVFFC6XfQWMxRx8fnSyv6BIeEERnLfX1rg2oYJXCudqz
         GkxmXawE0gzOqvGesy5IyZkG2abNLCoWU77Ks4m1ukQGLY0Dnj6f46T6rMH4YUmTzRXq
         E3VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790178508; x=1790783308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f4WPZ4zqm8ezSWOAuYy2kHwqmOGcyX5dZpEWb9VtYmM=;
        b=oGI8e8Ch9CslqENIh9rJ/YNJDO3OXZPNrLIl/kIOBHHkXclVmMCY/1YpY6EAbJ2wcO
         f3xWGohKrHUq/P4lSx5l3jgISlPrBILr6qdS/mC48HSTwsAqQLuC6jO8eQKPDZ7nJP2x
         nppla6NjIFZQ1U8ILQHXVMFxalXcfaNr8RDBm8KOT8lkiRq9VNaPfT4Y6dijHYhSpC6j
         ORl6yIjWVy43TAdvaXGProAheapLSSDsNE7UewZ1bW7yXilS0jvpW1+0N3bmzl/oeRSl
         8yfJGA7F7jXAHYXdEaFVitfqpTN6TfDpDJ2n3Q35FAEcWUX/97v/i9YwjWx/0OPcy7P9
         6g/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178508; x=1790783308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4WPZ4zqm8ezSWOAuYy2kHwqmOGcyX5dZpEWb9VtYmM=;
        b=BcMVP2b1B9zdoh2ZesEXnRGuFxCDR9osrn/AcYDoME+16yMLc40OWKNaOtFI3nrzzh
         UG9z75HXDWLvwBC7w7W2YfWF7oV5vL8EBSKa6mZrt4idG8FHn8oSLb3Y+ez1+D5MUbSr
         8wn2XzY9Hawz2A7bAZcvPhskd0wOEHi9Ef7Eod6+7QKBwdMD3HSASrOBbBaOLZjIX+wM
         AqChHd4qgot5OHeDwkOvlQLf4Yah0XHkTV/iQIDrzU4KHHr48M+HY4LfcYdkkEdGGM3y
         jVSfcifyYXxiRbajb9AZP4qKzEcp5WpkpvlYPxCNSxRKXHuj8RMX62uuR331dgU23P1r
         zUxg==
X-Forwarded-Encrypted: i=1; AKwUvBw7r5Q8qdeaxe0j6EmUo7LCiSD73slmRaBsBA8NFjQI11W5mO/RXV4r22wovbidWALrBpNQQ6b9lYRrFp0=@vger.kernel.org
X-Gm-Message-State: AFuF++leL3LJucCLjO2ca8framkCdjSUCPSQ5IFgNQmPLBfxFw+Ug7OB
	wlaWDE5afzidt0GU791yLTDNlbeH6Twsy+rsRNETyXX9DM7DrhAcFRG6hu0HMtPKG42BUQL8wfS
	edCqjQrhtvcWNRP4KIyxCcTU0yWMwDL0=
X-Gm-Gg: AYBFou0JhYuKB408Vts+I/m/wmMmwc6HFqd0DclMKVr3Ax1s2JgUiCFe7yaks3KBnO2
	2HSKSs5ETv2g42B/fFRcAIkVtncX3Pg5PlR0tvIUD8+VtUUxmjGBRIJahigyEzxVxTXqzz8iy4c
	AMochkIxbC2On0IbUmOShVf7fTw5lLZjELcGMH8KrJrU7OqjhjHnhhxrXMk1xKh8IDsRoeHDVWV
	IOeHpfZDZw5608uWWG/EER1fh/n0S+puT/bFlBktWdfAsivKs0Hfaxpn0T2Pjcv9c5G3HnKmKMu
	t9SWOYzz/pdQxkpEdXTF6QnGpD1MqzVE17L3Co0jT/eGEcBTJ24WPx4qeepkcG6R2G69mvA9reJ
	YmJEAqrLTU6eO
X-Received: by 2002:a05:6102:5808:b0:7a0:f7cc:5045 with SMTP id
 ada2fe7eead31-7ac1ace44e2mr3005717137.9.1790178508346; Wed, 23 Sep 2026
 08:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922225501.1792665-1-inakisobera8@gmail.com> <e0bf7dfe-c03d-4fa6-abdd-ac88cab8faa8@sezginduran.net>
In-Reply-To: <e0bf7dfe-c03d-4fa6-abdd-ac88cab8faa8@sezginduran.net>
From: =?UTF-8?Q?I=C3=B1aki_Sobera_Sotomayor?= <inakisobera8@gmail.com>
Date: Wed, 23 Sep 2026 09:48:17 -0600
X-Gm-Features: AclHuK8teJhZIneAm-pS1paRCtlXiHjDfzAKz7zCRFZ5JookA8cSJaHe4mqvE2Q
Message-ID: <CAAqk8=3zK9bJV2Oejb9vTD_tKA9agcsCWnKgEEPm5tgnza8A+w@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: mark g_fbmode as const
To: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ahmet,

Thank you for pointing this out. You are completely right.

I mistakenly missed that g_fbmode elements are assigned in sm750.c
(lines 762, 764, 872, 876) when handling display options, so making the
array itself const breaks compilation when CONFIG_FB_SM750 is enabled.

Please disregard this patch. Apologies for the noise.

Best regards,
I=C3=B1aki Sobera Sotomayor


El mi=C3=A9, 23 sept 2026 a las 1:27, Ahmet Sezgin Duran
(<ahmet@sezginduran.net>) escribi=C3=B3:
>
> On 9/23/26 1:55 AM, I=C3=B1aki Sobera Sotomayor wrote:
> > The g_fbmode array of pointers is only used during module initializatio=
n
> > to parse display options and is never modified. Marking both the pointe=
rs
> > and the array const allows the compiler to place it in .rodata, which
> > avoids accidental modifications and cleans up a checkpatch warning.
> >
> > Signed-off-by: I=C3=B1aki Sobera Sotomayor <inakisobera8@gmail.com>
> > ---
> >   drivers/staging/sm750fb/sm750.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/=
sm750.c
> > index 8b93bfeb2..c3f391cdd 100644
> > --- a/drivers/staging/sm750fb/sm750.c
> > +++ b/drivers/staging/sm750fb/sm750.c
> > @@ -12,7 +12,7 @@
> >   static int g_hwcursor =3D 1;
> >   static int g_noaccel __ro_after_init;
> >   static int g_nomtrr __ro_after_init;
> > -static const char *g_fbmode[] =3D {NULL, NULL};
> > +static const char * const g_fbmode[] =3D {NULL, NULL};
> >   static const char *g_def_fbmode =3D "1024x768-32@60";
> >   static char *g_settings;
> >   static int g_dualview __ro_after_init;
>
> Did you compile this patch? While SM750 module is enabled?
>
> Regards,
> Ahmet Sezgin Duran
