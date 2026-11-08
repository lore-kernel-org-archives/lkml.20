Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130133;
	b=K5XuWpV1qOlj6cWNZbM1sAy0Zr0+CEAkneLcW8553MtB1UclkO2l5YFNEqbxYfOy8ahe
	 SyH282IDK2tHFMGxGepc+rYiskB0goEbw21yoosC01EjnemO2JtRR84MnXo8V3cxuAZq4
	 2YFAWZdpMWiz1vnxP7YdtMwkDiaHPFaQrCCbydxSk7NKBUOvAqk9N8ODD+v+A4VE41GHv
	 ei4mP82GSP+E5/b4CCshJ0RK2BSu2f8nELzH0v5sZ1D7rvs9IbC/K0NTVfvE7CR05X2uw
	 FRYIIo83KWHiS/PKUUP/xba6PlhG2T8LOIukzPI3fI25I3HW83bFMRUyTzCDqLi8qpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=SHRuDocsQ82mahFLnJgxxsiffMzQsz1Feg2GezQdVrA=;
	b=FfpOdnyGF04z94Dz+sYdgmjZtjekA890KWW78/urB030XVXpnvoeddyHtyO+D/U7SaWL
	 NgnOVrl70aFqWthnp31gSbciRWfFVYkxfPVEM5HDR2wVfKonr5sJEGQ8UYWUHeYvtBrWz
	 4Caemi0gA4Crw0P4Tn6T9toWMl6o3sXrUx/FjTB6KaRYnqGsrfVvPv5It1vbYcHueA+kW
	 Ors0tEhwNi/TqtTGiT29zOG+2sVjAl7Id4/ty+pgFm95Ho2J33v4B8/2d5mdL162UF3I9
	 3LOOWBF/pV5JJGbGsc+4sCuMUvKvcH2r5Hw+MKKYeDY2WQvdjRvHvonQDTfbfudJ5Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gAInEK5Y;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E35606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86E35606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gAInEK5Y
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36caa19b0ffso23001eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130133; x=1794734933; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SHRuDocsQ82mahFLnJgxxsiffMzQsz1Feg2GezQdVrA=;
        b=gAInEK5Y32M5VqpPzU0TZHnEFEs8PK30K+m6rbTcPj4rJc5fPGY4T6e0xFW9gmh9zc
         a3k5lVvfHf9LPC7hjtJF1Y+8v/PqtUQIagkR5Mu6vC8PfhLeg+R23ThA73LFMs4o7Bc5
         JL0NBFBisQQdIMRCB/8n0SskKDY190G6yCFOPRF9ZH1/k72l0pOjstZaOLWsU29Fl5nZ
         bAcVpFLMFgbMKBwIs8F1XMhgHHBVXQAcGFV+utnHwGbnkRKHKI4VI153aheB2TGoXYBP
         E1nrd27hXRil3Hb8EOqmEIKg/IBrfER9JqcQ0rBI/WnyYZcDVSx0l1QK4KYNWNJxRmds
         uArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130133; x=1794734933;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHRuDocsQ82mahFLnJgxxsiffMzQsz1Feg2GezQdVrA=;
        b=AVkf38lT5MEfcIphQgHJjJmKIUu8KGEhglnF0qC2eHoI7lhCVaPfUunLeb79CFIZKP
         P/GHOVIQuDQRAMzRrio5HBN7Qj2em3k7AfmN3tRzYvF0z68zyvIccfyUMiJHxzWZtHdm
         4tBf29T8Rg5BOyWLr/bhRuC/JRwCnn9dzl8GK/Rt2dEVBQ6ZecooNnmLsSkMfCTxbrUB
         k0OVuNW7hIHA6ILOD7iMJsrirzCkdFiBOpnYuRSinqnbYYPbozwjttFBYNRpdTwaeR8o
         KY2VHpeENPeshkr+jol8hoMoMJtA4QdeAT+om5EVP4DCXzHCgJsxkOkQtkJB9ejbRJJa
         yF4Q==
X-Forwarded-Encrypted: i=1; AL+hErFwR6YsWn3j8QR0+02KXTs4LralbWZXl28u2B/FbPgbCMfIf1ajg/7fHskz/y2OYaICWquLRR3tewph7Lo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tgSbUjHMqneASLWD5B9JlrLTr1y0NHtJpcbSXUtueV/PnLTGS
	U5Qwl8ywO9n7+r+Dm/XoLwtIJH99aNaSe6A+5AOUMpy4mjQo1hZS421G
X-Gm-Gg: AYBFou3ZDxcxi5So5ts9ehNmS/ugGYNenmHkh7RisGT7Q5VzO2Lpl2jm5S65yxaMIc/
	CAIzUra9S0NS+GoLoAG3XWL2+eyspDbfvr+EZB+YAdBu4PfNv16DEBh/YUbATQ1iylQeGB9CUVE
	ROpICDm84JwiVQF6wnvPM+sof4ZuHgUljw4KY4A9L+HxZh0GoHFQhA0QDi+fsRjuhk/Pshvz158
	FFmvZAM9IzF+7frrKzpNWo9bGzWtdfYZLd+SRpVmD36957w7MVjk5c4SuNfyhknDI3VYNqfAgbV
	TgUNL6Q6PzlYquKw04cqGnUK829Hi1MgnE2vKA01oOFWDSkw6wIa6VINSak7FMgmrW0mJlZnAjk
	q4XD1GlH4td8UaT32YTfLO27ikRbX6rb73p4NrijamOOYHYSQCcnhMCdSmzdZxnm6HOx40kvgOt
	46JTw1g4VTNIW6n9kDfeVrgFEG6hgF6BAmA+UBXEnRznjatyRDC9YeaLUO31HC/ZQF656xcB1Zy
	oZzWFIXnzx3hwKuFEtLwJ4eTtb3r+TkmrZv8QgHq4pZqgiL+HA1pyZ+VtKk7Q7WDk6uhzlM39jV
	j6LCwMmPj6E8cczWD16HfEbXhtTFOsLF2aVco/cnaMQIBqfaCRDImUVxR5ULEVeUFrreiiDOCOC
	ZA2tHXg==
X-Received: by 2002:a05:7301:7004:b0:36c:9b35:5d46 with SMTP id 5a478bee46e88-372571d9ac9mr2446013eec.26.1794130132533;
        Sun, 08 Nov 2026 01:28:52 -0800 (PST)
Received: from [192.168.50.20] ([50.7.253.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d78ebsm4250150eec.27.2026.11.08.01.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:28:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] drm/amdkfd: handle SVM interval notifier
 registration failures
From: Aveline Noir <jm5905938@gmail.com>
Date: Sun, 08 Nov 2026 20:25:29 +1100
Message-Id: <179412992976.2.9438818840890765075.b4-reply@b4>
To: sashiko-reviews@lists.linux.dev
Cc: David Airlie <airlied@gmail.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, 
 honghuan@amd.com, honglei1.huang@amd.com, linux-kernel@vger.kernel.org, 
 Philip Yang <Philip.Yang@amd.com>, psirt@amd.com, sashiko-bot@kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Sunil Khatri <sunil.khatri@amd.com>
In-Reply-To: <sashiko-outbox-203586@kernel.org>
References: <20261108-kfd-svm-baseline-errors-20261107-v1-0-9ef4008019ab@gmail.com>
 <20261108-kfd-svm-baseline-errors-20261107-v1-1-9ef4008019ab@gmail.com>
 <sashiko-outbox-203586@kernel.org>
X-Mailer: b4 0.16.0

Hi Sashiko,

On Sun, 08 Nov 2026 05:35:46 +0000 sashiko-bot@kernel.org wrote:

> This problem wasn't introduced by this patch, but does
> svm_range_restore_pages() pass a page number instead of a byte address to
> amdgpu_gmc_filter_faults_remove() [1]?

Yes, I'll fix this in a separate patch.

Thanks,
Aveline Noir
