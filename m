Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792605094;
	b=znhEorro2MES/qqWsMgezXJ0igyCMrKx2AzvAvaIla3IIvO9PAyiO4h2aS6f+/6CXda6
	 Qi/l2aaRojkIe79Up82xD3WlHYQiPoSpjHzYFq6CClXx40SBrIG3rZl0sIlPzw75sxWQ5
	 XpeHgaV476TN5nbyCD3Ygg3DRgFvjYF/bKQdCMPXWLP+ir1vGFQcP+qlGphrBeTSh43uf
	 yfSCRvWCOB+Irg1ksQ/I8gBCrf/Dy+t2ey1JNMAUZJVovRJEVazf+ANBL1Wh+4Ba5Uki/
	 Ch+TwKAgdel/YmfLMKLlDcJGux5L4+/4cg+DLPHH327UksP81+DufDayyrrHQSi+OlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D89ifvopPkh6UIf11JinhlKyeZs6JGLXLYQheO+1SnU=;
	b=5E72puaTSCmX4GWrgGl6AXoTnZzSC2Q0QlmWFaCsSreN4luLl9h6LyPwdFhg1bwqhXjj
	 7nQBALhFbrCkaSDbdPhpzXaNdwt0sV4KfsU5IUtvrP7JBx7mbA0FreQd3cy2PfyldzyAF
	 P4tMnILn/H6POk5rIh0o2AWLvjxAUxkTIanMLXKieKb2gVuQw73UiOVCRVTaiiH+XdjkE
	 uO063IfjLgVkRH6BzJBtBLrVFmPhrV1FzZ5W8L1RXcSyPovruyAFfcy2+mCaMm0IcXCGw
	 AWN9eQfzq1kONc5lLsn+tjaS2W+H07Ulsyx3MpZfYq427JuryFbrSFNkYygZHr7Hblw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dtuZsezP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B86E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B86E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dtuZsezP
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eadf48fb2dso333043e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792605093; cv=none;
        d=google.com; s=arc-20260327;
        b=DSfdNLgSs3mOCW42Q6iFm2vAB9KhJbftPKsyzxkywT3gNcqr31evTi/NEj0uWeqL8C
         3AbqRmGuSwpUYI9pP7+gu1QW13PuCgi2XeHtUpb4sKqYR19Fl1JjX9a5c9IqqM6Nvgy/
         HhzGJsna9Kq/eap5sRdG2TUnr6U8lxKZ13D4rcKDGWiAMz2mpW3U+FVoZo1ZkqkaOyWx
         ZR4EL7oadg19bZYmDbZiXLxywUp000ISjPQPiD78K/IDuMBaQOorrQAAlaO+s3srrgy9
         /qwU2NWZBNBlpuVaepn4s/mDOOHiLTn5kfhP+WD1ZfdBZF8WioPet3QzQ4NKCzswr/ER
         W5NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D89ifvopPkh6UIf11JinhlKyeZs6JGLXLYQheO+1SnU=;
        fh=m6p4Awj7PH3B7aG/WJE0Wat2s9aOf2s89sLvIoBfQLs=;
        b=seu8tCfmXZ4hz4MNkh8G8pBjjQqBnPqiiV9jXrlECkwcAodg5sF3w0OI5ZJD1mGDqC
         Y8kTElGS1EKTlph42eOhz1G0XRXNu7KjDKke2EmGqZk/E7mKLBODbUqnZruSG9Y7y+3i
         2g4lI7hI0Zn2Xg9tR6JKoNA8yGTFn2GIrEPMsf4OiScwS2GjeKCDdfw+jUxzFvrXIHuB
         uU/EQq/vvUPd6NQodflGQsQ/jVTKAHL5F3Mn3H8aSBYpIiwRYMKWsBIbWpJaTUVKL2qj
         otJAhhNoga5MjGSjaTs4CxDWoIuWT03I6gHBGeXaYwLv5HqFrx/X7gql5Ja3AUH1RiJe
         qdow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792605093; x=1793209893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D89ifvopPkh6UIf11JinhlKyeZs6JGLXLYQheO+1SnU=;
        b=dtuZsezP1THNiKON+Z+Lg0Kal6rVkc4EKw3GGI3IDivGz7UlmjuQuUEo53rDGwkJpI
         08zUoNY/rsg1fUaCVa/ilQ/tgbncGgTi3ydeLPT3Kh7jXOmm/vYhtyq4Uy1faR3dcaUb
         RMDbgkQVMIgvNKf2sAwME/RNI6G8M7ELa2IN61tVcYe7GxyFGATrG3n8i7CIpOCEwFel
         LCJ1cdZvQ+TTwbpVmG4REU8N/AD/w8Ql4Go2sZEjaBHO8Kmom0KfSE81WSrEMFUMWdsM
         ZNs5UANGWZ/GJXvqDzO8Hx3am8Buf4/K4on2OPn7kA2XDAARwKXpCgWjDCzpLByaHxNb
         YhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605093; x=1793209893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D89ifvopPkh6UIf11JinhlKyeZs6JGLXLYQheO+1SnU=;
        b=Or5Ne4xfEjepRHBtuAR+93Gnd6qN1T/C8i9eLP+8ssfrN5t4X1nBgDzLbzPG08hRvs
         NhFkPynWfbfIWf06jaQqT3Y+50J3oWD5bHV21oOcOjgIrHkSkftWWgHkpTe9ddxtTgip
         Q7pdRGyc+NQEHSC1/X6kbpcZUwG9+ggNmQV41YE4x82NhSZ1zQK5rjlfGdV0CGD9K8dK
         4n7PGipOqW0zsJwo5KkLv4nGDdlHNT83CfkLdrNnXe133ax9m0CRPTcwURMKStm+ShFW
         FHDWPDSEqnleKgx0TbKtofAMN2jF1Y9902eL2UBgBPioFbJLEFMGZI+N55wprYemOq18
         aqNw==
X-Forwarded-Encrypted: i=1; AKwUvBzPKN3zGWj0mSjdRtkCzA862voNU7lk748xJL/mWG/diBGx6FXTWmNiFazAxHoSi1QMORxon/DxH4ehQl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdAKv7Z5HFEbB5KP1iKSmK6qUmYmA2duYRnouZuTY47YsAAGIA
	p2kKOOLJwZs1xkRQkLgY2f9oeVGzqvE8FIgwcXCcnfda1WZX8v4uh6+MR+z/1x02XMls2IE2xVl
	KdNcgzQfsCOo1gwV3gJVpTknsvP3l/JVHUI/fHSY=
X-Gm-Gg: AYBFou2+SM3dcbkFnAJM3pWx7NvXkjBJAimcIFDuKuKXs01kkTXZfTVPnGMYXZZX2WN
	Rw5r5Aaf5AmFzr/yBytuNztuN48OL+Rl2ifox4PtSo9WqKR49chktajV5cPn4klai/+fQvOEluV
	o4Zhd+3eBY3iX7uZGFqg+/eZ1fPTFggQN8UIhZ2mN6M2AF5rmb5WaD+vMKBZ/vVgWSDe4X55Vvt
	XUp83eIeCNRsV/ND85TMAhKaqyrd6MhEUc1Pezjcysg28apJCVFn2077UKku6PH3VM56Jr/NfgW
	0norZ7QwuqYk2nweSTStBHWXmkDuYqYqSBNSOLdudOqcGPzDNAlOFLan1WGsAyVIKZpedguQda2
	Z42sa63fsh5h2UMp7Mu4WImq0RG5v9JKDti6VyDEFGEvYSD9alIafjZzqVXnXf3EegVXMXotHcx
	utB/y78ZM3CI/n+yQ9Y+T9vD03H7TgBFONH6iGiS/4Khmk1SU4ykqpL60tVzqNrZenJ37UoheYt
	BYeQAJ3qdU1hydySNbe4e5djTCbWRRiBS2gn/2ifX/ILDmto2LvIOh/Nbeq
X-Received: by 2002:a05:6122:1b8f:b0:5ea:91d2:32f8 with SMTP id
 71dfb90a1353d-5eaebdd09f9mr1192005e0c.8.1792605092656; Wed, 21 Oct 2026
 10:51:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019120332.553567-1-edumucelli@gmail.com> <undine-1792592451008617538-5620f2dc569b3038@undined.local>
In-Reply-To: <undine-1792592451008617538-5620f2dc569b3038@undined.local>
From: Eduardo Mucelli <edumucelli@gmail.com>
Date: Wed, 21 Oct 2026 19:50:56 +0200
X-Gm-Features: AclHuK_wu1PEBoMZwDUUmdaaxIzeIU5q0yaGhzPbnfzamDq0zX132z4TWUZdnWw
Message-ID: <CAK0NWSMQasDdxYiWSexJk1sdxLfnLeDW_Us76go2fPdx_c8Gdg@mail.gmail.com>
Subject: Re: [PATCH] tools/bootconfig: Quote CPU masks containing
 comma-separated words
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: rostedt@goodmis.org, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Masami!


On Wed, Oct 21, 2026 at 4:20=E2=80=AFPM Masami Hiramatsu <mhiramat@kernel.o=
rg> wrote:
>
> On Mon, 19 Oct 2026 14:03:32 +0200, Eduardo Mucelli Rezende Oliveira <edu=
mucelli@gmail.com> wrote:
> > ftrace2bconf.sh writes the CPU mask without quotes. For a mask selectin=
g
> > CPUs 0 and 32, the output is:
> >
> >   ftrace.cpumask =3D 00000001,00000001
> >
> > Bootconfig reads the two comma-separated words as separate array values=
.
> > When bconf2ftrace.sh applies the saved settings, it writes those values
> > on separate lines instead of restoring the original CPU mask.
> >
> > Quote the mask so the commas remain part of a single value.
> >
>
> Ah good catch! OK, let me pick it.
>
> Thank you!
>
> > Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootc=
onfig from ftrace")
> > Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
> > ---
> > This is my first kernel contribution, so I'd appreciate any feedback.
> >
> > Tested with the exporter, bootconfig parser and generated replay comman=
ds
> > using tracefs fixtures for 00000001,00000001, 0f,ffffffff and 1.
> > The masks containing commas fail before the fix and pass afterwards;
> > the single-word mask passes in both cases.
> >
> >  tools/bootconfig/scripts/ftrace2bconf.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >
> > base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> >
> > diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfi=
g/scripts/ftrace2bconf.sh
> > index 8eed445c2..f8f288f90 100755
> > --- a/tools/bootconfig/scripts/ftrace2bconf.sh
> > +++ b/tools/bootconfig/scripts/ftrace2bconf.sh
> > @@ -238,7 +238,7 @@ instance_options() { # [instance-name]
> >       fi
> >       val=3D`cat $INSTANCE/tracing_cpumask`
> >       if [ `echo $val | sed -e s/f//g`x !=3D x ]; then
> > -             emit_kv $PREFIX.cpumask =3D $val
> > +             emit_kv $PREFIX.cpumask =3D "\"$val\""
> >       fi
> >       val=3D`cat $INSTANCE/tracing_on`
> >       if [ "$val" =3D "0" ]; then
> >
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>



--=20
Eduardo Mucelli R. Oliveira -- http://eduar.do
