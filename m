Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714352;
	b=hb9DjMOHjp5jdaBAIyJqacyvjhob0q1ICvtvtsR+5NK7RoWkMf7JQOVsxuq9jMWSUUxM
	 Tc43a+1Mr6rxhk0N+FZ1uDxW/9m487s9VfjorQfODCvNi7cQYb1ugkNKhuuvRv+zbOYy3
	 VXaTbdXEB9srxSplimzvAUq0tygvc4qLUzyt5sfl6vTLW5WNi67Pwvl76q0+bMyVJ3WVs
	 X4KK1FmJbQfD9F51VlZPlbuzZx+QMjuwpQJhyi0FW2cbS/6t90cmE4ZRd/YrAW142uuz1
	 pGjD0jzeDuFuUgX8h+csoXezTLRqkrwys5sSEQ5zhednF9YTQV2oBbobCEfz96q6+pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714352;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ccP5HEXTeJ0Y3jbzqMoy8v3yamoeB3mTuClgVh9AD5I=;
	b=sVrX+9SN+lpLmph0SOVKm4NYijao2/mejnAWuJ/vUAIekChMlz5RWBKxIwyK7bIEW1PE
	 jOJMSDXuZ3mY6ok1iqYZCUGYtW6txolbgK1Pt8jkO3Q99NhlmrSPJwgDIl1dhi7QRMXlB
	 ev3aB2z30kcjShCrQL1JpwVq3jo9HbhnjafwXZVwdwqTvm5rCTKaJvn8pxatyjV1rrZTa
	 maOnnsZ7rhfSWpOHeO5id4HSo68Vjpsag8AZolaYPRMOmn7q1zdUWLvL5Z3Aw/l8NlbVZ
	 LonnnIdW/vAXQmjRhaAqoQpex93HG0oEajbTWtVzrECkhqsDEp/RoxpSFDloX+Y2irQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RMAZnIWi;
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7D1606D809
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B7D1606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RMAZnIWi
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2ea138a3497so27040895ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714351; x=1794319151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ccP5HEXTeJ0Y3jbzqMoy8v3yamoeB3mTuClgVh9AD5I=;
        b=oRL2pVFvgLPcez6pmvX/MiSq/ilk9Omlg413WuM1ze8cBTWm4VuequI1AVk8BKaWKx
         UPYJ20029RdQkJtohgdYxivwYcofeXsCh3JYdHWtXPWwuDHSH3cU+bul1KZPDR+v2wXY
         RqMIjTBJB0jfOO9yVmkcjYWvMko3Z2KX3I227occfW5PACP4oEjo+1WY3He1NkE51BNA
         BBx9WFeQY7XWs+LJp9x7EfATR7qzIS4Ulfi9iPTOEn8Pityw6+iiHpScwEtFlit0hH1O
         QCyOM7ZPcgLYODptZu7saZFh9364qHVeewaZ+G4m74FUZ/hjjS6GJK/fhOWGFkJp4D70
         D8PQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgC0f9x5nBiGZC5abVz9dk+2GH7+nR1XzvmXTGn74RscWKaVGGwAsI/jAATmhmoycNx5SEHWCTJr1qkHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kq1ZNaieiGwyZ2CY9aleA3stQzC7x1Z05QQ53Zch5TlJGF8JS
	xVQfej3+CRnw1EqkLv7bHpxouPgDCOE7ZHuAd4UjlnCsg/DCalsR0HSOpgGN1tHcrX0TuNlhOp0
	FzBVgO8wvGNxSOw8SNp8wfBukMj/8Qi5d3fK9xNy4usUsEFuJ4LjPv3vfW/M46nwGj13o+ROpV+
	JXIP9++NFAfIssRWjsPX48CFrzMVcVnC68pgHwTEQVzSIv43/Ldej08CpRkWE1tAOyzLPCJdvt7
	7dEfefBgMFHK1y8xFPDyp5FiA==
X-Gm-Gg: AYBFou395n9KYEvH4VRf8xtKim0Unqe++jWIFMvcG9t2yw9iUPpp+6huevexpqNewX5
	6nUm2JYGvLDYjwTZ6npYXpp9TnZbeR1JFJPCOtoYbtR35hQCNCiy39elvU06npP3Mh8kJBX8f8t
	PkUdPEiBqXo/igGC+FvAlHXO1N2SIYVyVP66L+WNu4+aUtslpnUVzLXv061K5vsP8diwhO2rf5Z
	fyvI7bZM+zXHyMmGd4jhCFSAHbzxClnFqH7oPDs2vJQavHqtyDoDkHDXl6JLZHHosLoLz+CX2x9
	S0oNlKVygSk+TtL2qSjqZgjymPzZNIJgBVgSAm7CQkmFMpBiilpTaSFFVtuHeref3dIB5qyWYAS
	OY4U8dZuOhb9DWVg9oE9S1gSskIT4YQXcv9xKKubhQdpMeAllVjXajUKuNVLCqVpEBOvRJHazWo
	PRNUM1iSwEPgBLIeRR8Up3haddiNbI0N+Q6xOZUH8=
X-Received: by 2002:a17:90a:e7d2:b0:3a7:f4d:b23d with SMTP id 98e67ed59e1d1-3ae8984dde2mr11528555a91.52.1793714350711;
        Tue, 03 Nov 2026 05:59:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c7ae5besm2007736a91.2.2026.11.03.05.59.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so5533836c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714349; x=1794319149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccP5HEXTeJ0Y3jbzqMoy8v3yamoeB3mTuClgVh9AD5I=;
        b=RMAZnIWiFfRJoex6o5xMUANJBFWQC6wSRALcRXyo1dHHHP6MEzHp/RwWVLlWZmyxzZ
         0k61IZ0PaWLzU+C/Kk+A4B+gR/AKLjy2ycVL2IFbfNeh7liW6wF9Oi3HXq1dN+9rXYgY
         IqojDwR3yiTYQdSXrgR4s1PP+EvhdtRgkS5IE=
X-Forwarded-Encrypted: i=1; AKwUvBzYWxIpelwmhZiVc5MM/lmIvGtaN3VU4n8EcTIY9EWIPL2ojc4SX8SMFzYUBjBZYDqg8/gKFxLrLP0TDqc=@vger.kernel.org
X-Received: by 2002:a05:701b:2702:b0:143:5cb4:30 with SMTP id a92af1059eb24-1ac5577508cmr18346097c88.3.1793714348724;
        Tue, 03 Nov 2026 05:59:08 -0800 (PST)
X-Received: by 2002:a05:701b:2702:b0:143:5cb4:30 with SMTP id a92af1059eb24-1ac5577508cmr18346046c88.3.1793714347953;
        Tue, 03 Nov 2026 05:59:07 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:07 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
	Mathy Vanhoef <vanhoefm@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Daniel Berlin <dberlin@dberlin.org>,
	Janne Grunau <j@jannau.net>,
	linux-kernel@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-hardening@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH 01/13] wifi: brcmfmac: pcie: Report the detected chip ID to the bus
Date: Tue,  3 Nov 2026 14:58:45 +0100
Message-ID: <20261103135856.3676311-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-1-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-1-b5cbc2cde2fb@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 25 Sep 2026 23:43:36 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> The devinfo->coreid field is never assigned, so bus->chip remains zero
> and chip-specific feature checks cannot match. Assign bus->chip from
> devinfo->ci->chip, which contains the detected chip ID.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
