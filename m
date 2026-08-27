Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772BD43C05B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787825457; cv=none; b=jbggtvtkO8ntHu3OVKoPSGbJOa+YahcjngsLP/lX5h2OfGr/2Y4w9nTFINoy03bjPsccQm9zV+w2dsTxU+sWoXYa7eGTtn1Jd5MtFTreG7mSl6TgVVBKIoV2pQC8sYITIdS0E3f2fva6MZ6ZkH8TPKDUfNhPohqde3vfpD+XsJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787825457; c=relaxed/simple;
	bh=dHAphXY5xoo+DpH95Ad599mrGb8vYxM2CMlFA9luhwo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UdBCyGU57KJz8JkOdkPBarZyfjV/zunDl0Y+NpHrPG66UknpM7c4SZ04ibGaZbv1UApN14d5Z75OcsO28YQkLm6NfiycL7sXITMQ/hzPYgcAMWMxYT0xmhLlwoYn+Z/38eJC14tA/CTQXr+O4VMx6sN9P/uTHEbWnvjG9/Pnegk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S4gQneE/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nAKrBy9n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S4gQneE/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nAKrBy9n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787825446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4w0qq3Y1zby89lLWO/tifyuK1AJLIJqbBqfesQ6MqW8=;
	b=S4gQneE//sOAQtfb51NkL4kPoOAAgRF4q6Tfh0FFiHP9yez2Sb1jaRRO1qV97jquEUTtqQ
	n90bc00aktKrgnal4Cnpmq4PMoq3+d56AKT4sgcQ4hSNlnOY7UU4RQjVg4HfhqD3aB2fD9
	PUpuPch2c0q7nkduoHfjFPg04XQExag=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-NNB2snPUPZeJqApSri8xyg-1; Thu, 27 Aug 2026 06:10:45 -0400
X-MC-Unique: NNB2snPUPZeJqApSri8xyg-1
X-Mimecast-MFC-AGG-ID: NNB2snPUPZeJqApSri8xyg_1787825444
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c2541129b02so44560866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787825444; x=1788430244; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4w0qq3Y1zby89lLWO/tifyuK1AJLIJqbBqfesQ6MqW8=;
        b=nAKrBy9nuHsrgRwKes+df0pA1u80t/JmXYvYSXVCsOOqpyTGWvAwvp9U0AxRMJ88Oz
         2V0+VwwDm6f4O/Y40RvG6cicPaL6Om7R46fqjPIEaxgIQxXi3FKbAM1zLVNFjuhN0iew
         aq80A0ao4YpIzflhsqmgYNIeTqLwYV/lPmzORwm47Q80vn7bRalacPTIhPAS5Icq/ncu
         1H5ff41orc+mvEA37JxpHe1G14Jf1nrhC9JsGf+I6pfX3VTz4eKnJvgNaDDh7wiKx7Ju
         5AgYSI6uGeR/5lAKip/v7d4Pw64RfQ9ZiSi8Z9tOfHdWJb0YdzFsjZLspfGbNxHeVxeE
         DWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787825444; x=1788430244;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4w0qq3Y1zby89lLWO/tifyuK1AJLIJqbBqfesQ6MqW8=;
        b=ZQgtS4Ke+u2/6NC0FxPx13evS/8VTkXhjVtH83E62AhWdwDEs1H3mQ6vwIuFxjjiYz
         VNGCLBW3m6LSwguhZpRuhMs4hycsO7KXyWjRsTz/gitVgL3bt8MKWcKnba7+ZwJy99qz
         skWXh162mRjBo0/PWnA6KpU5574BCTfGzt3FkfQ3cOUzBeCKM3SSrsg8Tjb5UHAXmOVQ
         VXWwb6vwkEoM6g/H77uif1nUi7obtGJ4etk9v+uklWkaAccYqFHLE/sBSVK0FsUpy7cd
         nmLP7uItWJYzvoJjJ2KjwDa4vvLy9tHPdyCZfxcWb464N6cTRGG/mGIgxIXsxG4zrfsS
         1k8w==
X-Forwarded-Encrypted: i=1; AHgh+RryfUkv/FduyvsW4zLQPsnRHGFV7lnH3Kwhd4riRSKyIsGOIq8N6pTh0Gvjkb6qQMyfIt2vX79Y8u8aO4Y=@vger.kernel.org
X-Gm-Message-State: AFuF++keKavRqio4IwiYU7ILJokmHJNiyJfLoYOXXv4Ogun6DRcuw9Li
	KwJZcvfBoIBe800kmmy/z1/D+Yk/q3fznEUl+lmkAgv3D5H8cltJ1bSKuTqPbSi0YcdMF+PWmhq
	FxweMyGu2L8pzxXHFTWKbFjHIqdGrY876WlSpQSyDnm3hvfNEMSYXd6JDXbQ6iX4TCA==
X-Gm-Gg: AR+sD105JyGMt58liFPFBwAR8P2lxS6NNZgW7YzLPkqB3qW9Dtr9B16dCtcdW14PfSo
	03/amnYEdxM3vnMh9l9mVTgakigiVIgly3VQ0Z4uC1Ycafs5pU8iIHShWckFH/Go6q4yqHHZO3h
	i3kElsDVrzGRCEUz75jTRQbzBCYl/AXivuLWfqJ900Y16gIePXTbEsNrZYLdodGhvzoj180+MwK
	c9+K3RKsn/bF3S0wLRuxKKqdc0/dogBA8bWyXe2bJwyg7E+mpWorzKSobrVIlxmyNcPtxmH38ML
	ujGCYecnuNegpmhIa5AfZqmjHxobz2Fj/W3/OTiFaxwDHg0iKRNxKOLI4Na94vr4ARD2ESXtrLp
	Pg/XQhVzM8YO+Glg12RhOMrfkFhpZX5m0u3LAdc0/Webo580Uj5ir2P9krDmRPsslXc2Omg==
X-Received: by 2002:a05:6938:a089:20b0:c24:c250:a6b5 with SMTP id a640c23a62f3a-c250bc2db03mr1134927866b.12.1787825444031;
        Thu, 27 Aug 2026 03:10:44 -0700 (PDT)
X-Received: by 2002:a05:6938:a089:20b0:c24:c250:a6b5 with SMTP id a640c23a62f3a-c250bc2db03mr1134924066b.12.1787825443648;
        Thu, 27 Aug 2026 03:10:43 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5e0701sm723598966b.12.2026.08.27.03.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:10:43 -0700 (PDT)
Message-ID: <5672e2f74937266b7005ccb4450fc1b768c175fd.camel@redhat.com>
Subject: Re: [PATCH v6 3/9] rv: Add tlob model DOT file
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 27 Aug 2026 12:10:41 +0200
In-Reply-To: <9e27f8af4520800fd1f19a2b9e9c0a0f2250920a.1787243842.git.wen.yang@linux.dev>
References: <cover.1787243842.git.wen.yang@linux.dev>
	 <9e27f8af4520800fd1f19a2b9e9c0a0f2250920a.1787243842.git.wen.yang@linux.dev>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-08-21 at 00:45 +0800, wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
> +digraph state_automaton {
> +	center =3D true;
> +	size =3D "7,11";
> +	{node [shape =3D plaintext, style=3Dinvis, label=3D""] "__init_stopped"=
};
> +	{node [shape =3D plaintext] "running"};
> +	{node [shape =3D plaintext] "waiting"};
> +	{node [shape =3D plaintext] "sleeping"};
> +	{node [shape =3D plaintext] "stopped"};

There's a convention to mark the final, which is usually also the
initial, state differently. Please do:

	{node [shape =3D ellipse] "stopped"};

Somehow rvgen still gets it right, but it doesn't hurt to follow this
(undocumented, I know) convention.

Thanks,
Gabriele

