Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793275351;
	b=3pJx5qhc/OiR6jTE4+oq1P+aHeqBOwdNn9BXG6WrNALRY7Xj7Kd8zNN7CF4Eu0XNn0xP
	 dSGIw6gwT+xQYwVmNpdT8J6YPFtPaKWiPztaEyR9CtlxGlX0RC8VLFRKbMleZBYJFIRNs
	 31+mKCFCBcfditicA2mFi6DEtgVrAkrNBfA+KeLD65GkQZHmjatNUkkr0nLlQ6zN1v6OI
	 C4FF05xRiWo7PgH9bn+yZ/exH2U9QNDCgKL/MlipoK9sL2U0XEI1ljKx7yKctBUbjmKMg
	 Ez/GurIz+qaffJNbe4MwmCBHKXHP+zPCaH/CiiSMm6vS9IAkv6wH0jJYzppMBhqo0bw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xl/31tneXRsFAECpWpQO0ou46Tacltc0WW2DLZb+HnU=;
	b=tnH0WlxZnxKwV5xLIEjFGC7cOjsfNTYJj5zfPzkaPj/43yvPdXZ1/6blHqlTV7+Vr3Lj
	 V+GD6yBBD+oHXFRnQ7+YlWPt9s18bu3wozbCYrDr2XSksQZr6SMPhy7VkzJds+AKrg52G
	 NkNKs/bvqR/C4hEq98fF201KKzLp0/oyVPTUk2YNEii80UoiFeTwvpcKW7X8vMV3HuRWo
	 RL85sn3MgycwQQRtUFplL11KNPj8aEFXsRfrP5HDKrShyeObE/cIDr5Sl5bWFcJyn8EJz
	 IUrPGJEuBX79A/JY6P8Qio9pamsXVNTgqHpmzfLBY11MhcszuoNFZ94VpFPqPH1T5+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u3+KFVf6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584D6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 584D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u3+KFVf6
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91c8fef5ce2so10108936d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793275350; cv=none;
        d=google.com; s=arc-20260327;
        b=Bnzz2upXqpq4wW+dfagVpuHD9IpDsYx3K38fg1DUHtvHoYhhm9W3tGRQHWLIPC++tO
         2y2RPT5N5B9POsuA47w8sgtjIW83YZqqT37B3mX1HYg0lMuwsYk/4Put1tXhYL/4ANnI
         4k0qXb4ET41OZ4e7xnXH1uolzk5/SKdo5rogR/WQchigwyp5deUZxH1y941NHoprke8h
         swKXXQ5bolfCCSRFat4PcxTTZgi0C71ARqE+GVfDtpesLh8Jb/jcjC9EkD/qylB/co1o
         KhmnK6R/PP0F8RiPxFS4fbC+IvpFWqZ0Xp5FKb+veySoAewNRZmydaVcaN/qJf1xzaHl
         uhqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xl/31tneXRsFAECpWpQO0ou46Tacltc0WW2DLZb+HnU=;
        fh=7n5NkPo09NBYicKFvBLeiZ76cI9r6Ygy8OpSz4LbDHk=;
        b=N3aAdV6bgwL2xmq7nJzm/AuYHL0v6GaEMv3ZmBkxzAK8jv7exstINi/rnMXIbPKZn2
         8FjrNCFIwvcgduCoIW/sqLHRu9FlZsICSGKwBKY2zUrrL7vDbgM6jw7gCHQIXvbSVq2F
         fz44pEBRsN2Y+e8YHpkpGF4l+hRz/Re213BmATx/YD5lSVqVl1egqXnAgMROh27QRXkv
         mFHY6MmNOiW+hQD+/+qcqcDf5pn3yEfd7Iq02AIaPzTKW5YRY6egPNGjGiOLdIFp7UNd
         O9N2esDgQW3H9VsNlgNH54t+jOcyuVfirYhGc7sprElnez3j5g+Sowjfd6byc/eJchx0
         WL+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793275350; x=1793880150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xl/31tneXRsFAECpWpQO0ou46Tacltc0WW2DLZb+HnU=;
        b=u3+KFVf6fB8k3HAkW7lRJO3f03Gk1Jwe/jLeb9fbPKPfhVgQGc8ihU0vP9Ypl8FvNL
         Y7nc9TCnhVoYLrN8+QF9dWMnHzREhMmZSTfRRBwlvFET49VVyBdQBAYU2R4I9+VQwypi
         +AiYzC/0+APmeoAr7Gta6LH94gLhq7D+Oq6pN6Y3umTuRZNrG2X3HM9U/VsuS9UhnHxm
         qvWNfc53JuUwHptJkc0cEADA94MoGO//C/nCngLT+w5z8KDHuKgz3cEwQbaJ2L0GYJJQ
         amNG1NME5mcoimCaZpAeVez4lWNEi/SAOvoucD2vHq4Y7ypqgFS8JrBDCsGzj51epp2M
         zhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275350; x=1793880150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xl/31tneXRsFAECpWpQO0ou46Tacltc0WW2DLZb+HnU=;
        b=nSlIvCQFZhJnlBoJNmqSOnCPnVjOCjSD1q2dhzwkGihepqMVUWAMNQIMo0W022SiQG
         Yiku6zPn4ASQzmi7B/AWj1zLq7SeB26gbA7p/RCKtkF9fwNf7qVq7jN3GD+FoV6xB4Ld
         s2JioZjG23A31iwVVn4V27FGlV805JdhR68QsbAsT47X/NoaqGuwWeBB54GGo0b4pO0e
         71877SuhKZuvwE+vCQC8iGW2mngLswns6ptIGwR4nesu+7shcX52ItYo7ufTvlSq0X70
         BJzBQmePvXnQpIwPxUreI9EKR7ZuR+OJUg+rri686v4DITSllHt+HKi0Jjmpl3ZP+chs
         FmDg==
X-Forwarded-Encrypted: i=1; AKwUvBwbLAePu+EcdlyPPS9hGFZS4y9o1HuN67LWgbSk9/V0icQFxkKFZxuyIRVuA9yXN3GT5qGsYbcT5K4fCOU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIM/TiuXB0UF/dFUrJyIyELWY8BTeof74gr1uJOPYdK340zB9E5
	IAFQAPswVZXuwyFiplGiHkt8MnaP27Uyy/fJsNVgZtuhl0h89Rh4CVQkdXDsC7J+5N+4K5prCO5
	WZ3Caz0hLn1pmD1H4kh7QX24JVa0SX5uO/N8WHdvzLbH6
X-Gm-Gg: AYBFou3vX3PjzwfxMGoV1H0u8oMl+cHQvdRYcU36V3qEt4dIPMGRH0E28j2DGe9+TIL
	ShLaM2/DtJjxoHH1YcoKOU2W5mTXUI2G2/2+7RcI/FS/vsC0CXXNwV1q67jmOU+XraTFasUBZSX
	Dq594sbFcyH8jrMKb3hq1WKkykugv8oxPdSRUxHRERzqi0ecCJkGsJFa1pK05QgipC8xlvBM0t9
	6LowdIRrSkxkmfcFQEhN0GXej/Sw491uNvClowVADXNtLiBJlQJPt7xxzRM21Ak7MJ6Ry/nQxNf
	4S+EpnrOocHWzhn0MYm+ydoKeYE6pOKDNlOGz/TjH23MXDpYQBZkKAR7mOkHgEEySipG60fR1i3
	Sc4Lt5RLww4QgKeKt8/Pjt04VXQsXx7WaL1rqgc8DBb7fpy5k727QL4+G09zbUXsXAxT0GgOZvH
	9HZB/Rt7PHCkrHSTm2GiAbruokMypDb2t1tn78PM1aWZSM4kfmCJbQS2GU6iuay0Tgd4KHu6jT
X-Received: by 2002:ad4:5f89:0:b0:91c:711c:27fb with SMTP id
 6a1803df08f44-91c7ce3b024mr85020316d6.8.1793275350048; Thu, 29 Oct 2026
 05:02:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028212731.418001-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261028212731.418001-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 29 Oct 2026 09:02:19 -0300
X-Gm-Features: AclHuK_MfRHWq4DWz6O_VU6YvJc9e8OWfcm0Att5J0Rnvclat84KH8bE5loBGQ4
Message-ID: <CAMAsx6cDw-tsyrz-0vY=qVjE0sdukxnRND=KGoF5hG0Tk=V5MQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: add maintainer PGP guide
To: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, sashal@kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 28 de out. de 2026 =C3=A0s 18:28, Gabriel Ribeiro
<ic.gabrielribeiro@gmail.com> escreveu:

> +    tiver uma conta em kernel.org, poder=C3=A1 se qualificar para recebe=
r um
> +    `Nitrokey Start gratuito`_ oferecido pela Linux Foundation.

The original says "you qualify for a free Nitrokey Start ... courtesy of
The Linux Foundation", which is a statement, while "poder=C3=A1 se qualific=
ar"
sounds uncertain. Maybe "voc=C3=AA tem direito a um `Nitrokey Start gratuit=
o`_,
cortesia da Linux Foundation"?

> +de suas considera=C3=A7=C3=B5es sobre hardware e software abertos ou pro=
priet=C3=A1rios.

The original says "open/proprietary hardware considerations". Was "e
software" added on purpose?

> +- Os tarballs v=C3=AAm acompanhados de assinaturas PGP separadas.

"with all downloads" seems to be missing: "... separadas em todos os
downloads".

> +verificar automaticamente a assinatura do commit apontado pela tag e

The original says "the signature at the tip you're pulling". Since Git
verifies the tag signature, "a assinatura da tag que voc=C3=AA est=C3=A1 ob=
tendo"
may be more accurate, but your wording is a possible reading too.

> +e pode revelar informa=C3=A7=C3=B5es sobre o cart=C3=A3o caso voc=C3=AA =
o perca.
> +sido conclu=C3=ADda::
> +   commits tamb=C3=A9m ser=C3=A3o =C3=BAteis.

Small differences in strength from the original: "will additionally
leak" (revelar=C3=A1), "was successful" (bem-sucedida) and "even externally
maintained trees ... will be valuable" (at=C3=A9 mesmo ... valiosas).

> +sess=C3=A3o do shell. Confira seus arquivos rc e remova configura=C3=A7=
=C3=B5es que

"You may want to check" became an imperative. "Talvez seja bom conferir
..." would keep the tone.
