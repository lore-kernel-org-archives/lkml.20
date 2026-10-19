Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792447995;
	b=zpr+00k5VSDDxNaFxsFX0tPOS7p9G7bqZaMmsBc+SteC+2D+uVsYTIIAR5JxhEVY2MTa
	 2N+FYzNoRdFxAr+fyWolCQg9+PECGwsm7B6QIX4184vHJ80zegWEAJRWj/h2yrGYfD3ZK
	 JC92GdzeO79EYEj1lgBDhaQPbWZaepzpGlBmTpYsQIYjv86CiltawrKWjK6LWIbaUAkZS
	 8bg0xWlGZ5gYTGS6QHj207KeISII42rVqWaC9iX1y5UdL9VHV3wFbtr8OMc244k9oThxl
	 o0KoukDXlV/euEycYemw5rB54g3vwFcEAjuWZK4KnQ8sxo9dnpl3SdJGYvLGYQY70wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vgI24pfivW/KSR6p/LzKr7Y9Wp61Dy6+zsomkmDVnCk=;
	b=EsqRVIF0I9bJ8cGDg3DMgaM75gRs5rykNXBXcr9eOhwwK6FHTnmhsXxcPbjl25SUknJ1
	 Q5dVBcasbRtAOeo6gdOIEaJiVbM+kqBkMr2LMqX2kFFtdP7bt0PGOhQ2ZdiDTeZ9EdiVh
	 JlEb3yPcvhyIxyX5ndpeHNwqSKEOEpCbylKoT1jAYGFfmUbF6qUzYcQtOaRxSO7el6cTA
	 Nx03vriBukoxI6OA78r9S9RmxSgdBXiAySJMjd34hEQOupF2HJqHmP674Ez601gYbRLX0
	 TrgeVbNwl2k787Dpb/Kl8yODkOax5pN1CidncMJbFvxLElgaG2rT2v3dS+5DNOjnvEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LPms+qOT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2F3606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E2F3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LPms+qOT
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-535f598d126so53641cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:13:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792447994; cv=none;
        d=google.com; s=arc-20260327;
        b=n0vddBxcCsTNtIFez+vkeXcMNlCx5GoGyaLxx65xb9yDk6UvAlHEKpgfe2fDqgxScp
         rG8KI82L5bBglbI/+AExTAUl42GF7/Y1pUYp5D/BF4i6XfT+N+fIPTzfA674cPaLcN57
         yqakEtw+PMZxS/ixjMdsBiB+lm4wLs2PYziLu8Zt5A9nBkvsBz2TeUBBRwhJcX7BodDh
         AQImfN4sTDKDTcdHWjy0qUKMtF/rk+u2vhXhb/6blXh+50hSSrye/n2tzoOY7K9y6SnL
         dLhxMXpF0K+W3riuKq1MfoEn3A557T9dbb7YM2RigkVgFB2cJS2OAw8yCC1iZEajk3rb
         rfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vgI24pfivW/KSR6p/LzKr7Y9Wp61Dy6+zsomkmDVnCk=;
        fh=qHIMn4tPYlnQXzuOR3BPI7sI4DXvNFV5+eKILizhx8U=;
        b=kASTIYsPvSY/mJ+qtmQnDfrWlYufzT06OhkSxIncKHY0uDv1JJOcoxXmEG56/A/S5V
         UhPi1f94+/FnunVIclKS2gPqp4rpogrZ5jadrVdqyiR9jrD62CklgGsPBHtCIleytcvi
         yjQG2BDmOCpos38Bv616KKl9OwN1yhPdQG2e0fywaRbeGXvcMRzS2TvFe9WeUiZvXJwP
         uAZ9JFAqkHKzq9ZqEhzmarx4lao6AbE6MXv341ZMwzJqNV+JydgOkKmoTl9+xeeGAm7Z
         JG22EzN0e6EiWPjgtCAQfQyfkKrJT98CddoQflAyupArh3VygtGktQsiQ8ybGkmC28G6
         t79Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792447994; x=1793052794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vgI24pfivW/KSR6p/LzKr7Y9Wp61Dy6+zsomkmDVnCk=;
        b=LPms+qOTDksv/O7NxkhtGvvtgSotQ7bkEnxvR2buV43eAXsVuN8wWxpe/HVzsECw62
         6oDCClwYxvV4Me/JhZGe+R8N6wAuF2WW+VSqJckY0iitFEvkKE11i8i7yCjUuLNe95MI
         4Tnl99rGyHu5WHZrUgyujpsNzx1zMnDAaRssGtpL02LV9ytPYQTH3EHiUHO2bjkpPRMN
         aQL9eSUJtgAffUfAvpbwMOFGB452/7AJ0L/ztxFinJcY/t8XmjlP7ds9fr21QE91Eunf
         jvDwPdWWRg0fhjkggxy+NIF5an9aTXHZTVzJd2n9IqHRLelVA6JVo+lpo6aBsryukF4C
         x53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792447994; x=1793052794;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vgI24pfivW/KSR6p/LzKr7Y9Wp61Dy6+zsomkmDVnCk=;
        b=J5r8RE4Iz/K83YS6uWw3MaIvfpgZJV5ClLrbHtfl262NYAFkfFJn1pBjMNffeWNvCX
         An2Kz+8echUb6TjvxZ7Z59rl46QGw9oPY+aQtSfuJnLJejIl4rw2IZ4l7VLOaqsCvoHl
         wAbgtX9sdcNoyJFPCUfVnOOrrtmdBn5afol0VUiHAccx/7rLozA1ASVr7glc157xPZfa
         s/XpFS+qSOCOKPTeSvoCUh7dxsSnPiPUNQUAmLqpxdl5Rs4SRuUY/yh4eLlMD+Zt30++
         2WKy8llpBeU9bTEUJsFPRePXqTK+FZNMpBsXl9CSM89PC6+GG4hfpbnGNlJfd74dzhvv
         Fm0Q==
X-Forwarded-Encrypted: i=1; AKwUvByxHJ+FSYi/eVAA7zwwVtqRkqzcG3MKPTD43TKfnxRlbaq9KVoX97zwYOcmUsjRldeU37GHVpG1uhgpdU4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVjaZ/NaOIXsjBLk6yZ8VRX5ECRQbsJNki9u3Ymf+7BJlr+SgS
	fvUE1PMICUzZp8xNFOc7wz8raAIBDjl0UEZaXmodQZjzgD4GiBNVzfa0oLrAX53JF2lyp+40rZk
	cbv7KWDn7b+0NTmcafttD5kZklYWFlxaE1+pzJpeB
X-Gm-Gg: AYBFou3zS7iBwaNxAwvCJIJBQaEjnBMJ0VjMIDNhiYUOAle1NaC92/AACakjRMZ9qmn
	5AW8JLhYjxC0Q5rzwKDtQBi+OhKGm1gF2cO9pDrpth9d29QxJvp/2hknja7JOyXThPI8xULKaCo
	r6VhJCNyZeWNyfEVjxHYkY6pS6zudgW4edk/NC6EHZeWnrBMQC2+Ul2DBLOSZcGw30+sp2AkjwK
	DzOAYZgzYtyGUAPQxnwY4iWbZpVsKPpqrUP69WhHmiIGKDQPYORsTBL0CteyUzTv/s0lCuke701
	hLYYZxy5UJin0yxHLnuKYS/4qKPyPZJtpaKz4biJBoHR7AakvamVy6hqPBTrkEMd3vw7+ISHE6G
	n2Ok0qsa9OQ==
X-Received: by 2002:a05:622a:1820:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-53688244eb4mr2593771cf.0.1792447993494; Mon, 19 Oct 2026
 15:13:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261008172208.1139281-1-scollyer@google.com> <as8slqeTjJYWOlaa@google.com>
 <CALUcz=3WE+SUx2j8LKFQQK-fMVXdk69rZJ9nKgBMQ_UwnWRPSA@mail.gmail.com> <atWFg7gm_jLBOwxu@google.com>
In-Reply-To: <atWFg7gm_jLBOwxu@google.com>
From: Scott Collyer <scollyer@google.com>
Date: Mon, 19 Oct 2026 15:12:37 -0700
X-Gm-Features: AclHuK_wVZXFfIgAVV23G-YS1NEjeLj8kfINMrQnYb_ex_aJ_zR4mTrr4fQbMKY
Message-ID: <CALUcz=0TtozoU+EP97Pu5pPYc=_G97xM=yR3cZ9WH_kLgrxQoQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: trigger kernel_restart on EC_HOST_EVENT_PANIC
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 7:50=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
    > Please don't top-posting [1].
    >
    > [1] https://www.kernel.org/doc/html/latest/process/submitting-patches=
.html#use-trimmed-interleaved-replies-in-
  email-discussions

    Understood, apologies for the top-posting.

    > I don't think this is the right approach, given that:
    > - cros_ec_handle_event() is a generic event dispatcher for all EC
    >   instances, not a place for device-specific event handling.
    > - The ISH driver or sensor stack should re-establish the state after =
an
    >   ISH panic rather than rebooting the AP.

    That makes sense=E2=80=94the kernel should not dictate system reboot
policy for a peripheral,
    and cros_ec_handle_event() should remain a generic event dispatcher.

    We would like to drop kernel_restart() entirely and instead focus only =
on
    surfacing the EC_HOST_EVENT_PANIC event so that userspace crash reporti=
ng
    daemons can collect the panic dump and handle recovery policy.

    Specifically, for non-ACPI/LPC transports (e.g. MKBP host events
over ISHTP/SPI),
    we would:
    1. Register a subscriber on ec_dev->event_notifier (e.g., in cros_ec_de=
v) to
       listen for EC_HOST_EVENT_PANIC.
    2. Trigger the existing ec_dev->panic_notifier chain so debugfs flushes=
 any
       pending console logs.
    3. Emit a kobject_uevent (e.g. ERROR=3DPANIC) on the cros_ec device kob=
ject to
       notify userspace crash collectors.

    Does this separation of mechanism and policy align with what you'd like=
 to
    see upstream? If so, would you prefer the event notifier subscriber in
    cros_ec_dev, or is there another location you'd recommend?
