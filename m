Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403122;
	b=EGCiD6GLIhIW+CzvszIX2acEFeUznz21+SZSmC2jfEdkJzs4qSueht+cz/uM8WOmMq0V
	 KEoFooAT2V1MPuLOhgZTTur8XS0+8iRQr/h1Qax5mhDdoIZWANnojPivIp9KnjL8QQVHn
	 UXl3dlbORdt/rgbgv1NhPhrl2dAV884pIuUU58AivpTCdXwxIi2ZUeZM0IaELpHKNOh7I
	 v0pebmbpJPRk0QqVSGZhpveBVV+wz6+bRu+a4AFQYpiTX8TtaCYPKhfGxSYU7do0eV+Vt
	 BsE4yfnx3o917lUMEILaaEYAJhJf1rrjfGweRDe2EQiN2btGRjKnK2S/a95sp6cxUyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403122;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
	b=w8Gwf1a3dYuSnpMyoydLHZv/ew4khUyyqPLmytDXdR32YUsbZ5IYZoQir/gG041f+UrX
	 7WuKWnyifvY9qk5oOFDUQ7aENPHvAFTnegEU4l0Be409rpv8JD8PI270S6fhqPgHbZK9t
	 s/LVTM+1YMemKQYy38zep5CeidmACkxiTx5Qsfp2kY9ERPHCgj5kP+OF8xq1j1QklYZKu
	 nwMrDwmpyOvPgquz1v9OkQCG60/tWD6MlO9cn15ZrgbJ+9JowfltruHSnJxgziqZU8yRj
	 d3bKJkM0JDIa6VYAvblRFkHaI0yzWE946Egzu6fNhb9iuySfzkoQtdJZXBmrCoIb1Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iQq7dU9q;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KPpmyYJd;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E8F606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44E8F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iQq7dU9q;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KPpmyYJd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794403121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
	b=iQq7dU9qLnoGNYDWDjGkq2hu0UGzL8U0mU2PJsT4ClAuEQwYNhuhD6lbU/L5j70yCdSj3/
	/GrODQvBHppOxWr5r6zzBgSrz38hu3YXFAWjAaXPwSspLjuvjMHkYMML/7f3qhxJCiKfAN
	dqxY4Cs0j+KVTOfLKNu99AiyUax7GtA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-FBCiSeJ2NZWOs_cALtxmVg-1; Wed, 11 Nov 2026 08:18:38 -0500
X-MC-Unique: FBCiSeJ2NZWOs_cALtxmVg-1
X-Mimecast-MFC-AGG-ID: FBCiSeJ2NZWOs_cALtxmVg_1794403118
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a359c7f47bso27309635e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794403117; x=1795007917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
        b=KPpmyYJduZaiiwokElgOJ61Jst5LxaVO5sdXmou+J2DQqBhaAS3B7G4pDz1AjrsSdf
         D78RcrlQns1x7CRbZCHjCezzV+D+Dm7kQly+SDhXI7IONrrGYviXknBtmCwCcxI78aWp
         q+ihuIaEultkJyzhPC9Sh2f9Mov2BVY+9PBt/fC3AyTT5TGmeuMaqeS2bTVjMFxiAbdo
         bsbtyzhFw56sFvHV9glARx1r+kigTs7LDxvzlH42Lyf+m/0H2s/szT4tlI3hwbLMGQGq
         Yn/5NmhfAv63xzSfUNdP+P3dB9vVTLGvHtFhCshtMx/bSryncdoQtx8JIxCk2qK47lMN
         Jvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403117; x=1795007917;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
        b=OsfqjFO3J1WpJZ6FL1WDGqomToCFoh5l15EjTsJPIYC9obhH/rph68M3qGhWeCAuwd
         oY5eRuv3kzXNT6+OBqVmCERTXDoq70Jx5tt+Vllj0Z+fndzeUONcb/DzUN8Hp1V9Cu/z
         g5QYRVxeBTK7WhnyuqkvsPq13ZDEhwPTp9MvNJFZxLFBflN2KyUOwlqV1OM1IglIeOrm
         fB7iZWMSTZbmjDtxO1aDvimJfn9k5sDWyTfNzQk8YIzFz/VkoMKcL3Zp41o1pa06SgMp
         7RQ3WurBEI5vlShKZ9NdnfcxQGkNj3XLBqmCN5SejebqhzRvDyXebKd72rHzN4gIR7ed
         wxhw==
X-Forwarded-Encrypted: i=1; AL+hErEIl4nY5vpbobJFaBqwosIMYOgGe1p3Ocv7BigVO3lOiY0Nmfbs78gvauH385WKsVgzNQWT8HgtfqRwLiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wGRvB8Y68XUdeKZ9mWcLK7u+KaE35CKNkFzvJPO5dfSMU+36a
	OsTYmrLHudP6b63u9cgwc3jtXskCyYiBo3BlwBYcNQkoelYVF9pKAK5SbDhVUPSySfdyOjZ5PCX
	HXNiPTFLphmDyNznPUe+I8vLIkvXKKebHk4ve+isCKVzlNNEcsxVhPvM0SP+LkWD27w==
X-Gm-Gg: AYBFou2gIwyevZy0eM6ssckAL8kkjxy8ys4saBEvuofIe9qEL1G/UNgVw3bAvCS+e7y
	Xh/sXzW9w9StZSWO1RaesCSHN41sOopclz5B56xiLloRqxzGRukvCHLJY7Lz5FWp9nQJCI1I3Qs
	AFZ9go6o+9tesrvWHYnIpUGSvovIRPmULVzDDaJ7DmR34Do4s+pCHm2h6onGF2/I55ePdzrdtVp
	u2RNhQzIarn8nGnqxFG1h1KF7cuW8AE2uxT/TqZlBzER5/Ezy7nsWccr6Xa7a20/MlsHy/pRIsx
	JSUSyvgW3f5NuX+NmLopUNFnq9CcRbvy3/bQgkCsA4UJbvVrHP3D3OLtWpkM8WKlo+8qzbpH+L8
	/MnUzqcg4jvaaQKlSt4K/HFBw4610KupnOD8pFjvujJZY9dbPaJ/8GS5hHIlXj4IMQc1EM6Viho
	s+z1duOwl2CGaaNPaFNvPOYfyoL/+Gu666mr3VO+A=
X-Received: by 2002:a05:600c:870f:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4ba093817d0mr40825615e9.16.1794403117590;
        Wed, 11 Nov 2026 05:18:37 -0800 (PST)
X-Received: by 2002:a05:600c:870f:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4ba093817d0mr40824875e9.16.1794403117057;
        Wed, 11 Nov 2026 05:18:37 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498811fa70esm9733692f8f.19.2026.11.11.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:18:36 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?utf-8?Q?M=C3=A0xim?= Pedraza Padilla <maximpedraza@gmail.com>, Maarten
 Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Helge
 Deller <deller@gmx.de>, Peter Jones <pjones@redhat.com>
Cc: Francesco Valla <francesco@valla.it>, Jani Nikula
 <jani.nikula@linux.intel.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Jocelyn Falempe <jfalempe@redhat.com>, Sam
 Ravnborg <sam@ravnborg.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/15] fbdev: efifb: move the BMP headers to
 <video/bmp.h>
In-Reply-To: <20261027135342.2003632-4-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
 <20261027135342.2003632-4-maximpedraza@gmail.com>
Date: Wed, 11 Nov 2026 14:18:35 +0100
Message-ID: <xlv1cxsba4lw.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

M=C3=A0xim Pedraza Padilla <maximpedraza@gmail.com> writes:

Hello M=C3=A0xim,

> The DRM splash client parses the same BMP headers as efifb. Rather than
> keep a second copy of the structures, move them to include/video/bmp.h
> with the magic number.
>
> BMP is little endian whatever the CPU, so the header gives the fields
> as __le16 and __le32, and efifb now reads them with
> get_unaligned_le16() and get_unaligned_le32(). Width and height are
> read signed, as the format has them. No change on the little endian
> systems EFI runs on.
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Assisted-by: Claude:claude-opus-5-5

Please drop this tag. Has been obsoleted by commit 1e035297ffda ("docs:
remove Assisted-by references").

> Signed-off-by: M=C3=A0xim Pedraza Padilla <maximpedraza@gmail.com>
> ---
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

