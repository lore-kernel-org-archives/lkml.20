Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794855252;
	b=Vppw8hNfjNcCKRiugpEFU8tF4Iy3m8fjk8VUZeRhue1AKOi0jIwj+cR9/s2hwCkrtj9A
	 +5METOB7S3YwaPYGRxZnNm8z5m3W/wnTjYsBiPQxA/uZVSywpeqletN79wpFZCG0e8dUk
	 NvxKLO7KWN/3NawnPDslqTszVL2zwFoaeHqWdYgI8VyCvhz9nbPIQ/d5bekcA6at7EfYc
	 exyaUdd5o7JJopzBG/s0ZV8hWmeNog4nHicAwML7fJgeRj1P9JatmFhubx6434oPYa9qf
	 QWiAx+DGKRFlYqDuuvm5FNZVJhLKUni7DHNXi/rgYyDqp2jtOXfn9cdHIH5CqEwUO2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=choMbSoYoRkI4EZKogv+on35PXN8ET4WeIfVWxIT3BE=;
	b=hRH1unOGE7XV+/tdl8LSKkfnTlLJMKr2LxW1ZdD0Q2d+zCG4ufzmCCJ5MIeS1+g/nhCK
	 4fKN3ja4UKcXvuZofB8jngYW5ZjkTmRIfJYk8t+ABDn1QSwrD0XsB1B8Lhgsl0dz5Vygs
	 fiHIqJ/KcASM2RgIvwgDRzUxvK/J2lIkfN8/UlmPiHLjRWAInp9/80C8nwja/tQ+k5wNs
	 uAnh/eXhYLfeTf5Z4YBR0tS3hcmzkCREkEzgROR+uBabcDcdoTkKbDdrve1SCnozoOsP5
	 Vh8dj1Tqbvb+usXBrEmIKHymFh8B7WnRUZ526qctqrKwg+zo84LC8TnxHh1gg0uca1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Td9LqMZB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C72606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C72606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Td9LqMZB
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so5686189a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:54:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794855250; cv=none;
        d=google.com; s=arc-20260327;
        b=MGQHmcwR0q1LofnbHrqu7AiN1KwWzdY4TIsydajLcGsybKIGzfMfVNV8VQkFe/XldY
         AwezazK+AKS7OHy3MHtIbY6X45kn5H/SfdF+sfl8aLsJhlVFleuJQDmduTzb5FJAf99l
         dORMbOQxUG8ukuNB/gbYUtLJ2nlSgd13qSnJ9XE2MQEPQUxafIqJwd3Voqm+6k+PLVI9
         O6gQeQ4rCAUBMd/l0NGOB+ojAFM+yqNPa/ue++uKdxAlgqM4Q8yIDIO6daHAIT2aXrGQ
         4WH/wjvKmhjoObHJsvabbT8eeyYjJ9CdPjq6hekDzYMPm9hY7M+JsQfsyFHuyO9DJOef
         o8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=choMbSoYoRkI4EZKogv+on35PXN8ET4WeIfVWxIT3BE=;
        fh=zScIgIl+jqDJyTnxx89UWC9GU5wTjW41wO+wHqrlim4=;
        b=ARw2QGzWz4GgtarkGAj3wWfpwAieL4+pumdwWtTF2sLw9OCUMA4O+htrbPhICzdQTT
         ZHUZgSRoi2NyBeWlg4fzsIc9AuPd7k/zEOc1RIuC0LvRGxlbPM+XQdmpG3x39nQ934hM
         AEIn1ovM3UWDT2Km3fPXEjeTj9FRwf2ozAPvKDlCCAaYAPXWsUx5cgBSE/SUlcU0iN12
         kiZfx+AldKjT6xJmdqLQuYOnGcCbNKjG2cmXMG2n6OccLUKfHkkD1RVW8hTSNrA2X8Qu
         CFyldoZYvFUzb+tOPBI1ptC27DnFXJ17Wl3vJMEgg/1ebnfCYK/XOURbDSBeZylXm8KQ
         eINA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794855250; x=1795460050; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=choMbSoYoRkI4EZKogv+on35PXN8ET4WeIfVWxIT3BE=;
        b=Td9LqMZBHFV+p0mazrBtRu96p5TmeDwPSQL9a0Q0t2RN0IrNFBDVPKczSyar5mB3Bc
         OafxvqCuCmDeEB57+4beLr4DNjm5m0LyELvSw1ORSrE56d/LA3wyfChdrGA0jxRIykn7
         hhEfia0r2dUyociyyU72vSMffQK9ZaQbI1r46NRTin5FpTNCmpErvszhgIScGHRXnwWF
         G5/Q8X/HxWtX0G6+Tb2DGGWMvR6c4u1392Yhg/1oDPLBL0M3ynckTyLSv/KIK/1nSclj
         meWGOh5PUVcmQpMXPqMIHl6aQ+gXY64pO5HuKJnptk4vmtfaGf9AE7F79tnA2bS5An6C
         BOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855250; x=1795460050;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=choMbSoYoRkI4EZKogv+on35PXN8ET4WeIfVWxIT3BE=;
        b=LYafMi3cm7tZFMqhsuGrcaBRfN8y7IxNditFc/NdU/iq8Y6LCEDGJpISUCFxa0UuKn
         abvJYHh8SPggnD7cGk9q8W8KebYyd0nWJaR6ce7PRokzDRh4EjYCNzCGood+mnvAMGpe
         QXnaN+pmkrcTziOYFQqGFkeIW1VvH1BiW5URw3kQ0NZk1lE0A6XtNF7Oa29oxJ8mlwa2
         mWbtYfds42W5MMaKtlM0FOHET8RsJt1sI5Z+UP05gjqV6ig8nt/GZQ0GrbyPvMk+V7kN
         0YzTIXNdCBZEdtwcD56tVmorc/7PeaSB+HTDcn2Xu8kYTzPAUEVHm+pVvWfL9z5Q4BC0
         VH6g==
X-Forwarded-Encrypted: i=1; AL+hErGG8os0HMB6Irh6hSVjY+bkJRot+C0sEPFV3H3zg6BYevlqJCwoQ18Zv8w4t+uepwbCGhqj+tjVizphm90=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rfc96dO1Tu6+YZTgSpK/Z6YG3n/PXl3udwBBPbP2itnRVxai+
	UGTGP3XjvkZY65yXJJS1g9sHoGTTjVgRK4LFjLvIAOIsAAJp5+Ukvn4wBvCphsLbZuJudY4CEFu
	wl8sIeY0+E9n1+fQ1L66tX899KXtLXQg=
X-Gm-Gg: AYBFou2qZNgxDcb4MQwSnjPXzCACtCf7d5uZoXMCAdMsxnnXULX/VA4A1P30Ezj4ccu
	xk/ct+v06Jeqn5/YpW3QEWrwyeBrLFudcYv32eYBzuLkL16ZWFVZpG1tL+yfKmWKAVV077m6FKx
	JorCoF1SMdRK20wFwg+HJlBdqLPKD+DVzHXaddY2Xr6k3Zb5m7PWTkIib54+YvY1kTgQcVDPuUF
	3zgXeC8I4Ll9lFqdoIP9hK7pGLqNDDmObiPGL1qfkQc+5cvfhIWxpv3jVltw8DPWLmUJ3WjlnzF
	CPmASh6vlQPK6WJadQ9CWJLvnKYxcNVOkDYCCcWohZfPkPqAp4zt/DycTMraXk3BbXl96TITTU2
	DBt3jD2wi0b9WfcW97gCb/3UqlUk3Mif+zSc=
X-Received: by 2002:a05:6402:3210:b0:6b5:9714:dea8 with SMTP id
 4fb4d7f45d1cf-6b7c0d24511mr9592011a12.45.1794855249794; Mon, 16 Nov 2026
 10:54:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020122712.526797-1-l.scorcia@gmail.com> <avZiZoGO4jXjIP7D@google.com>
In-Reply-To: <avZiZoGO4jXjIP7D@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 16 Nov 2026 19:53:58 +0100
X-Gm-Features: AclHuK-ct3_bPqNEIOSB1NJrGGSJAI5u9bKqHSATB78hAxnxBRSskimQcv_9q0Q
Message-ID: <CAORyz2LNRfnvbCLe+49A5kAF4NSi0zuYdpd95+7=Hx=KQh0B1g@mail.gmail.com>
Subject: Re: [PATCH] Input: goodix - sync the irq controller while starting firmware
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> There is call to goodix_int_sync() right after call to
> goodix_start_firmware(). Is it still needed if we call it here? I think
> the vendor drivers does not do it.

Hi,
unfortunately yes, it's needed right there on the Lenovo Tab E7.
Without it, the REG_SW_WDT right after it fails with the error "Error
reading 1 bytes from 0x8041: -6".
The vendor sources for this device [1] show the call to
goodix_int_sync exactly between the two interactions with the WDT
register.

Actually, in the same sources I see no trace of a second
goodix_int_sync after firmware has loaded, so the existing call could
be moved a little earlier instead of introducing a duplicated new one.
I tested moving the existing call on my device and it works just as
fine (basically, my patch + commenting out the existing call at the
end of goodix_firmware_upload.

Which vendor sources are you using for your reference?

Thank you,
Luca

[1] https://github.com/lscorcia/linux-lenovo-tb7104f/blob/2dad69c9f28611ac6d3db2f1ee11b480a60d83ee/kernel-4.4/drivers/input/touchscreen/mediatek/gt912_p98996/gt9xx_driver.c#L1529
