Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B5445FFDF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777118; cv=pass; b=QeSRCSYxFoeO+0KYd+RS/73Jjn8NiOFtnOCSivpBqgIZfBki851XSUUJH/T7NnHvZmNpOO47jY/2BA27VNNDJz4mAnrGIDUicFWXDsxqe6eKgKm0g7IAv5//cVwbg7iRUXsRmtxo8znIh6RNAxwhz6yrGT1OI2KbZZDtYcG6REU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777118; c=relaxed/simple;
	bh=Xw+HRlcvjW0U6P6qm17Nuk1JE3pIENaL9TJbCB4UHJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rna6tkOo7G6RlOEJnhAO2EF0g51TaNsYY1VSS8EFUJo3twT5UYqfmd26fu1WNADxvzwOkZwA/iGCZC6ujKYuqjMhrX2xTAdNsfVpd+WbTSdqd21s68323xRlZUVEcPaASoXq09l52IP6JbW/nGNH+7/e7MQcSnpnlVxGR1TY1HI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwiq/BqH; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwiq/BqH"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a7f5655823so2835986a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788777114; cv=none;
        d=google.com; s=arc-20260327;
        b=aFAS0H3LN8+FEulNORq2Te5j80LEphU0apopjtMpzH4xAYScI1m5YfvZN7jffHVzL3
         0mYJFKorFUOX13f+Ems5AJg0g1h3PtkZ5BS6/ohoKAFY4I2lKRiuLGjTZRSLrEZZhp+S
         EqG0AwWudTH1x7u6J3qYVfn59fKPuwKuU7bRmBt2ERYP2xH6j3QcYXbDZwwaNcjpMhcl
         SALaKSaJyhQZF45N2jX5SxEuoR2pEzDwFG/yxSOQ83SFyusBHBW6WpRnN4jWufKMugOk
         +nZU2WFJz4aj8cZCxwrljDH9nqoFn3+m3F08+yBPqlQf7csZ78hilRhCVt22KOiV3OXa
         e0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xw+HRlcvjW0U6P6qm17Nuk1JE3pIENaL9TJbCB4UHJk=;
        fh=PYP9/VL9OK3quxfTerGk13DVQaVn3Oy0RlWV0h9N1zw=;
        b=QWwfS3zUUf0jEGe40F7gVESkgW0J5GHyvxBNbOJU5Zuyy+9Ly8DoDdEjgSmVbL4x3u
         BvKiYHaYX/e2+heimDjibAz/ZwIyY7p/S12wzZ2pHiF1vfz80tIKfaWDIycKJgs0Jq4/
         mEwIFNwQdB5wu7feGVK9xncYqMP0Kg25LAq3jWLDldZy+v1ZBX0LX3kiymyzEqqYwZ9+
         sSQgByMyk5uxBYNPZhRmk1xuEk9OJlq5X3NTwfCUgTBL4t/ylwbg9rAp3u+my9zOY2Np
         RchdK/upsXl3l6+/m7xjufdgrRVLJBmTypGOIoMKGNHh4lyfTwp92EmdhO9sssyInodq
         7Vtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788777114; x=1789381914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xw+HRlcvjW0U6P6qm17Nuk1JE3pIENaL9TJbCB4UHJk=;
        b=cwiq/BqHqSn+EpVYUEp2vsqmAtWZIr2X071/991/3p6FU1kQu0Sb6s1EK9i11exsqZ
         7hVqvtkaDdnWFKvdYTUuJiBQEH2mkj3W851jsUhFcFIftFd60YILwZ84GOHtJBEfDQmC
         FIykK08Cs6nSOu8rxsZJrmn2E3WuT0ArxkRnA3SKzN2JE2REoK3CZbh9tnTf8mqo3GH6
         sFjzTWUqSRjxvVdILLSAcPwtKlyBPuCxwIUAgnpNalMYme+i+BmncE3HdheUq3duX+FJ
         xhtNfMDgOoaWOBQzxxXUbGpyu/oYyZkhUAMJXjTR3fuaShjYcbv7aqhRXR9ywxVm9I2R
         1o4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777114; x=1789381914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xw+HRlcvjW0U6P6qm17Nuk1JE3pIENaL9TJbCB4UHJk=;
        b=fc8aooBFyOTMTM+oon+5plwF2FaZWJFZo+1nvPmCTxOVF7gH+h6sPe0CElGrOudPj3
         AUvcxk+bjgBlkEh+m7mQuIwNJuQTT16PUDkXcLJfrvrBtbNsGlgQ/eLSn6obmWr6kOSW
         OD8SqPW/Bm8+oNa2dapfvqpbpTQRzFYFVtiywVdqBBU7/YChcCQUvCm0zw3G5+EE65S+
         tt3VYsY5RmL/PvUMKFZSZ2+/J2kiJTmjtZzhUAX8mdeELl2WkvtNaXZ28sR3x6c8d16o
         tXQ9TQBRJTjuaJ03bMidy750fUXHNaKsqESdv06YyH5PBWm3u/yXvh06Q86gQkXT3JiK
         Ucxg==
X-Forwarded-Encrypted: i=1; AKwUvBx2KBOKI04SmXHW1R3aD79c+ujwqWDsmKStB3cAfvPVHN7uueLXusp7NEjdt1SvAC2lGeFcJP67TMJgSBU=@vger.kernel.org
X-Gm-Message-State: AFuF++mK77w/XHgURB9W9m7poTLdzmbMHW/3zFpSyeu38keV4ybisH+x
	M43P+NQJSl7r+sKgU5Vw52ahkHkTdOx88ynAHTsoJ3x5kXU9w1jpiKWAjwBnJNXWFPNAVIcTzuW
	79V++86iLtbJqEGDmcrBUSP0VhuUb1m4=
X-Gm-Gg: AYBFou1Z+BdRbHQb7P48ywxJpy5n8g6BPXQGBij3SXpbDU5XJNifEGCuxz5qJZcOk/U
	p3ZeqdbAvVK/p28f9oz1O2MVihTcn54yFdyk2VGRSNbseANnZBZRZ9n6MCVsZD2tyf5PoiWw4Cd
	x/1LJ5VUI6A4bGYyDNj+fmqwXrRv+HFnAv9k+8v8I/DUhi2K6o8o6clTeX4qTcoZml7QlL5ucvO
	0SvZ5sPYrDkcDMVaDovJHOCMdj/cPO+7Irb1JSu9IMEvYNBqsqLoT3Enx7Z/TcbauZo/JfYPWTt
	2HlYbwl6HblNoR8FxdrX/JuR3HIVFzzsg/7NjRKBxBDeRAlsxXxPTiYrFU4MX6BsfbCX8OzrLAy
	YcV8kgJmPrBZ4/BnF+9P4tdNWvv4yhcaLp+Np6hQ9wDOLYgJ6bgujA7gZzvPsQq+ar6PzWy3Amn
	T+p84VRNUL3+yvXodRo6sbszCm0Hgv+fw=
X-Received: by 2002:a17:907:3f98:b0:c26:19e3:e988 with SMTP id
 a640c23a62f3a-c2619e3ef32mr701672366b.40.1788777114250; Mon, 07 Sep 2026
 03:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907084319.351688-4-blum@kernel.org> <20260907084319.351688-5-blum@kernel.org>
In-Reply-To: <20260907084319.351688-5-blum@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 7 Sep 2026 13:31:17 +0300
X-Gm-Features: AcwNN1XM3d4ZDElQn3iIlQ6JTOd1vgZ6JbjOD4PpwcxjalKvdLb1jFd3p8gSdWc
Message-ID: <CAHp75VfwuHeoLhj1NHUMNTAjih=runLhp89-k=NgUWGA0RLiAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] lib/string_choices: Add str_supported_unsupported()
 helper
To: Thorsten Blum <blum@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 11:44=E2=80=AFAM Thorsten Blum <blum@kernel.org> wro=
te:
>
> Add str_supported_unsupported() to return "supported" or "unsupported"
> depending on the boolean argument. Also add the inverse
> str_unsupported_supported().

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
