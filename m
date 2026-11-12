Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794484093;
	b=qYolESki0Dva+ax3w0EyyevzELt9VOAsCH8KpgS4/EldF0o4h+u+OXSf17OFqoQ62C4+
	 uElFYduARIkyaNtiWS6pXWBceG2rpX79s4WU7yZd1hw0KAbGf5yNGri8V5aatKNzId9BD
	 f6+UeUUfyoqax7nHFLpS1/uoNpWNYz7KWAo+sfqXYJKVe0L8HqBp4wOqzRWVUeqibyjw8
	 aiRBfeLJzUiOLSiPmjzY/K3OmusOEFz2WN5h4yvmyFpdgl4i7mVDBdryiQpL95bsE3J3f
	 DoqNEY437W0Uwtuvq9qexOJ4GWdKFbcM3D5/OPIbFj7eArrYt4bjMBcBSKHPWwhTP4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2G7w3a5fSFO72sjeDlpSXv/kZonU1Ep492RRrSQfwCA=;
	b=dLWKZ4isdfIntlMLDrbFtmjI/kAi3J7UtNqV3hOaarBKWqmgOsKSzWsEGdB6N//ncBdd
	 afKC4uEjMYNz9tP7rW/dSL/ZwOvfU7yFBWxNatIfjDTGVnqvWRze1W/ismu5AMykPMC0G
	 09g4oJxKvuaxei/cgilQb3OLrKRAPBpdi2TPyaUjW7KIhaUdlCERTCmVWmuwgg1Qbj2xJ
	 qL4nlSdiBSaNBnOeFkVSTX23TpHiWL0n1ad/Zu9hbbk3oHlRF4WgTc+M/1CwNSEjdVnyy
	 P5YX8VynRX/HPyojZ3sbQZ1MsIZXLSo6CJBPdlXSus3o0LTgmhOny4lfAvCI6cATxRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nV3J6Zdr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82712606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82712606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nV3J6Zdr
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab46699a09so34749071fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:48:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794484092; cv=none;
        d=google.com; s=arc-20260327;
        b=kKYjW+zbgsjx0lHuAmVtlJ+SlRl8QHeTh9F8SaNBM+TdYZbUpGuKcGsQ3FS6QBAJCt
         ns56WNzQymP427jiOYYVAv172Zps58WNsrWF3HF1R9xI+PYxmvuA+JPIiLBjJ8HdfvsC
         DWsgj6GfKE+Pe6sbR+loagHrqYVhSR9RziiEa2nWxFUk1q4AwVApJ5ntbX45eHLKkdD1
         jX9wVFEgccssxqAYBpoUc70d7BSIYE3tNUpoy3DvH8Q8I2f4c3o5FdQA2XrrB7U7UCe+
         W9XA2tLAcG6NhQY2ncqr/w7h9yzbd7i7F6l9i2W8j5zMW1IC5vI1JEqrEnMXYa2bpqga
         facw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2G7w3a5fSFO72sjeDlpSXv/kZonU1Ep492RRrSQfwCA=;
        fh=MLmzYgrimg0q2xI0R4tOxVvGhb5bpHbdCYR3Nnq5xz8=;
        b=lUX4G430uXcxl/i9YGuRe9NDr34BwN1jz4DhHcsQhn8YXrgrPVZTUuWORm62osx2tX
         g7qCtj/6Vn0KNz2vehvuZ+YTMEze0bjdmvOVFBMSqJ782SUGVG4LqRM6/dipS5tUooqj
         9tjodHCBFudA/WVJJrY/9htLoXkCVVsv3KI4jeHP1C7suSrYNFEXzOV1fbHIBc3QM13r
         UaNqzRvdJa+fk/oIQPYdXSTvTKwaXDB0Ggmd2OAghCzpILQEPa3miqi3szFg/VxVEq90
         FyIYxbeyp/1ZEilZFSks+JQsi5QkFDtjTlM9Fy8LXOXLDbeTYHYymKeF9nn06DS576QS
         E4oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794484092; x=1795088892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2G7w3a5fSFO72sjeDlpSXv/kZonU1Ep492RRrSQfwCA=;
        b=nV3J6ZdryFVbPzy80vruIcDLwXvsDLos4LsRVp7+6RXO1aO9PFbsobQ9dhE7qi1MEQ
         9LDpAbYYdBq5qVvcm2xM1Mzw2ueqqjhnwlB/p3lI9G4C9E/LcRmGxWbHfMTiGjJl+wiB
         2HhESkFrG0hkmqt3hrLd0Q1JZmZbBIVhLaIgVMibt961ShIH4tMYglJCvwRUd47wvJ3P
         dQRdgGe4vk7dz9YgnPsyUA+Wv9C77PJ+LwVwMhqktWGR4DMdyIA5iLtQ2POpQDLfKPWT
         +frDGxzM5cQ63KIGkzMVkqHbokDBYvxYQIU1+ysq9aIC2u7b+Z9xOm73dCoeLU8Yg7YZ
         gMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484092; x=1795088892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2G7w3a5fSFO72sjeDlpSXv/kZonU1Ep492RRrSQfwCA=;
        b=qPnPFtKNsd+wyjQMKTnifcHsAPKIOcMfoVGFZl9VT+C0UAIdcz+AbDSJkPlZ8GaLkO
         XFG7a6QClyNuz02idI0o0xkRQW6GyviVTul1ld+Y9otWPA8YxwtVcxki7ZtE32QbuL1k
         cxkNr6jcmStyORrL2DxxxCO090hS1NV8zKB+fD2BpXpg43Eu7SmqkjJlVDKyG+p3nrkB
         KMcWL3G1RiC6uEpqhnRe+0F2NEWrtH4nHtA+S1vHnAzHL4XRgzyQy9F1XdMu3GzE7aK+
         /kUyzswqoSRflblHRhOCiu8KgDHcJ8QiBeXg5AaeV7ErIgZ5Mz2+VTTZdanpWdAzHVdn
         mvJQ==
X-Forwarded-Encrypted: i=1; AL+hErE4wqYhMsRxrnGsLMuAn9di6JCRZCV6Gunvqz9GsjcP6nFu1MpzL2D9zsfmyBq0GIf4/iLhLKrHs6Ti4oY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aQQSXKUjApTss1xHbJCy9tAME0Sghrf8OChROSuOjdJVaGJeu
	+r/g+5jh6r+QfoZxU3s1Q0IaO3FiOHXxba+EzGHmJSUsCXjE2vvBhRA5k+3cMdKZvHqJVOdxIGO
	6Q5mybKsNGDcZVqAzu7INmxRel0RgbZE=
X-Gm-Gg: AYBFou0ipZTSWPw75mzfFkXhPS0PFxuqbmxH4CVf22TjWwIZU9r03DcPEdPUVBCVObr
	LvMrIRQvj2oNz3L26oZNkFzLnjvbcqJwiXj+xd/iufEyU7Vdb4wsmx8F8qOTv5ArrEvqIlavxWk
	J42Mum29fux+bLiyLKOHdGF9xI3t6dejW8ja9VyaW3NDlT6SUULylK6jpxmusluMh8NfP3fpFoP
	OKB2O6xrCE2FGdKTJ6zsOWmmTsWIL5KoIaCSlCUUu0q0As2gd8wIpqXXdxC0IkqO2nKwfaN8ri9
	Z+JwXAezWQ/gugX1ozwqRQZez7G2LjJsmuR+536zsTi3BI1i9HaGZUESM3rrUnX+MMrUO8xb3nu
	BuJxnOQu8WYrrQYdAQ6iMyr+loMOUb+d6PAANOBtMNi0vA41PS4UGfqLXKTfevJwb6te4bLc2Ga
	xbygAbd4WL4u+u/G6ayKDZCoVI6Q==
X-Received: by 2002:a05:6512:3191:b0:5bf:d54c:1fb1 with SMTP id
 2adb3069b0e04-5c15d54b357mr1552506e87.2.1794484091504; Thu, 12 Nov 2026
 03:48:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028132825.657546-1-festevam@gmail.com> <20261112104151.713649-1-sahil.malhotra@oss.nxp.com>
In-Reply-To: <20261112104151.713649-1-sahil.malhotra@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 12 Nov 2026 08:48:00 -0300
X-Gm-Features: AclHuK93YbB4VWMKEzFyF2uYg_cLba_j6jbM7pY7iyTKLjV65FIWhlOBoNvuhlk
Message-ID: <CAOMZO5DOBhSY874fAyZZRdyGW8=Qcmf8TT91gnE+++xRAEwizw@mail.gmail.com>
Subject: Re: [PATCH] crypto: caam: jr: Use dedicated shutdown callback
To: Sahil Malhotra <sahil.malhotra@oss.nxp.com>
Cc: Fabio Estevam <festevam@nabladev.com>, herbert@gondor.apana.org.au, 
	horia.geanta@nxp.com, pankaj.gupta@nxp.com, gaurav.jain@nxp.com, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sahil,

On Thu, Nov 12, 2026 at 7:41=E2=80=AFAM Sahil Malhotra
<sahil.malhotra@oss.nxp.com> wrote:

> Hi Fabio,
>
> Thanks for the patch.
> Can you please tell me how to reproduce this issue ?

I observed the warning during a normal reboot on an i.MX8MP-based
system with CAAM enabled and an encrypted volume:

caam_jr 30903000.jr: Device is busy; consumers might start to crash

It happened in all 'reboot' cycles, so it's 100% deterministic.

The warning occurs when crypto consumers still hold references to the
job ring during shutdown.

The patch allows the shutdown callback to quiesce the hardware without
requiring consumers to release their references first.

Regards,

Fabio Estevam
