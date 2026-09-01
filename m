Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DEA46C4CD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248256; cv=none; b=msLrbLV3VgdvmyilEC0up5UAok/SZNVIdfqYRprp5MZPIlZx31hZoP6QF6nYvvRARKVckyxmQxHp8/PoDKPD+8wFKs1y8s+x/9XO9d2l1AxjeuUxjSTKhqzoxJMopxMysrc9Kt7dizo3rpH9GPYnZPUga/rB0J6Ffo5wRPoNosw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248256; c=relaxed/simple;
	bh=CqfhTtR97gXh7eQqL6sBYYIKsG+QkBmqY1sau7tvQm4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hb/xbvLcYuLoN8L/tQn77VmKI2/YKRA+GiRzMDbHFP7BPrpPNRnvQEOEUTMeXNICAGFsSuPc+PSmv3uLzEaJsEvkdehta8ngcSW/uhRPzhGG3Pp3174uIRxWmnaS53Be+zs/wdBe46zCdBEFUxkR9hCkTwVDQ/1CakT+xfkLGvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i8xw5h5t; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SgTt7RnQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i8xw5h5t";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SgTt7RnQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788248253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Rk6MoM1HIB054uV59BcMTgA//1R4qE5kuR4lQOsz+qc=;
	b=i8xw5h5tooTy1ZqOu3l5X4EdsOQDPHdLDNWtjs8CPBVd1FrfEQqo75IIkE2gYfPvWIjXSd
	3c8mX3J1yk2TFnw+efv3ruTSRBdWmBec0FqJVRH6nBbm1VZMfGniGqn+Q4MWQqt7pyNCEC
	HuMvTdXoV/zp+R3QZRK/ZdwPBNYxgEw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-l18ZnaQCP22VWtw3tYBLyQ-1; Tue, 01 Sept 2026 03:37:32 -0400
X-MC-Unique: l18ZnaQCP22VWtw3tYBLyQ-1
X-Mimecast-MFC-AGG-ID: l18ZnaQCP22VWtw3tYBLyQ_1788248251
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49554715277so40789235e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788248251; x=1788853051; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rk6MoM1HIB054uV59BcMTgA//1R4qE5kuR4lQOsz+qc=;
        b=SgTt7RnQwRo2OsKCCnMBJMz8jstWQ9goIO2NFvwi5Lz4ZC3JYMIX8Is2Z4tMBNWMpd
         EjeaWy3CEq0QEL+9l9QUEHwTDjjPSvDq/iXsaGbQVVvNajeflLc4q99EL9+nltIXNsmm
         06XmZmcU75qmFRXs0l4Xpk0gwZPNLp3dYsAR2GEWXLHiXSIlPrT7n8GpERkyWwfvMkkO
         uPw/PX/S5wUpCMSP9fdWsgQIhjHKNTg5/75JE8VnCqEDbu6i7/dIyw6v7pP21NjKtxaP
         0It4dl++Fvp0LVoJX6sqdexnr0Xjn4WNGI2hcNQB/zzDElHzR35Eixv+bdjHsPE7UpL3
         Vp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248251; x=1788853051;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rk6MoM1HIB054uV59BcMTgA//1R4qE5kuR4lQOsz+qc=;
        b=E0efHoqHhd9Rsomdyt1DtWAYsCl/5aqzK6o5wmcPG96m5wnLAODMGrIr3XzAeSZVnE
         7C/CRmGDxPbzv+3MX+4AyYTMuLvHj/yMvdxI+SXFsdxIIbVbnA58Y9smkPDjWzg0TVPD
         psdnUyC8sKgJNo59tGHIck/j/yi40vYreDUUfrN1DykzLCJyq/F0+Vwg4C3NJVoCb3VO
         Dg8FbPNS6s77yYJmg9IN+Ly1x4icmapvo89Qao4x/zBaVJTEUbTfPWToLgoCF7eRoUpr
         Y+sP036eBBfkui5TLqCAr4R52Zco9pYkwD0YnsYxozBchpxGYuvrtp4RSBQxX3sDr5oz
         gsOQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCJFTdKyRuTT5iSR62V2OneOUdGd999uZhyH2ZQu9QiHaTye7ejip1toPHLCBmEyGqguzg4kn73ek5Ocs=@vger.kernel.org
X-Gm-Message-State: AFuF++kPi/lT71Dg34vNpH0EsgCdk3H0vXiElnpjHTKKaUzIRMACAekh
	9K0nb2uooktea7du0U0hbCB2it0XZ91Se/ycDtS/wBBEZ7IAsHuYstRkH5tuJBT2uJ0df7V/o2e
	LcBEzr6+WyweQqRuLFdU+U/skTthx0dLHlSIfLgXYAvheJyqhRaww/QENFuYWdbp0gw==
X-Gm-Gg: AR+sD11tJ4wyVKc9LKeXnCmk0Kg4hjv64MUYmH4wgnxf2fVdr11a0Yo18xoBzMIxVtK
	56uoKLlT86Iqs52yhwdKlmXqP1UDf4T+sc5dOtKffrWsBVSBYofZkND94GK0WOayw3uxW1RQ4kF
	s1pyLiumDkhGq9Uqou28MwJuPaXC/+m851exGpEH1ezN0eGToYCgjM2IQICRABMay4pXms8AKpq
	4ViEpi22kGAlk92T90/yBliASIHtkae4Qvl7RZq90tw/PUyZbXs1YQ/KHlwITPPhZHLkUn/J4je
	lwYwfVZRTCy8j0lCI9rY0QIlJMKbmHL08+Ibc9IzMawkXzOVFE+4BUe4pgKbnbGEapWdnH0y2d8
	BrMw4TrAZD+ufdHQxbNraVffY3KYZXA==
X-Received: by 2002:a05:600c:a418:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49cdc558513mr101959715e9.10.1788248251555;
        Tue, 01 Sep 2026 00:37:31 -0700 (PDT)
X-Received: by 2002:a05:600c:a418:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49cdc558513mr101958885e9.10.1788248251168;
        Tue, 01 Sep 2026 00:37:31 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm286144315e9.0.2026.09.01.00.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:37:30 -0700 (PDT)
Message-ID: <0b0b115713a6d5a10d719085284dc7cef21ed892.camel@redhat.com>
Subject: Re: [RFC 1/3] rv: add per-edge dwell-time statistics primitive
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jan Kiszka	
 <jan.kiszka@siemens.com>, Philippe Gerum <rpm@xenomai.org>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 01 Sep 2026 09:37:28 +0200
In-Reply-To: <20260827072400.45734-2-tobias.schaffner@siemens.com>
References: <20260827072400.45734-1-tobias.schaffner@siemens.com>
	 <20260827072400.45734-2-tobias.schaffner@siemens.com>
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

On Thu, 2026-08-27 at 09:23 +0200, Tobias Schaffner wrote:
> +	while (dwell_ns > (u64)max) {
> +		s64 prev =3D local64_cmpxchg(&s->max_ns, max, dwell_ns);
> +
> +		if (prev =3D=3D max)
> +			break;
> +		max =3D prev;
> +	}

try_cmpxchg() functions produce arguably cleaner code, would you mind doing=
:

  while (dwell_ns > (u64)max) {
      if (local64_try_cmpxchg(&s->max_ns, &max, dwell_ns))
          break;
  }

Also, although issues are practically impossible, I'd avoid an unbound loop=
 in
hot paths, you could go up to MAX_DA_RETRY_RACING_EVENTS (already existing =
in
da_monitor) and put some warning in case you reach the maximum amount of
retries.

Thanks,
Gabriele

