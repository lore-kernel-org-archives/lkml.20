Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920733;
	b=dPqIX5ssAuxw02Hii6GSRqMDJrcVBhBDl9gUZGH12yiwkKdT12oJ4Ol1hTBNcowaYynY
	 RVYCCTwzZy3SVxUbxB2wJYETy7WOi7f7OjU858YOvhe6vKVBY4cUZqXIe0KGm96ciuiAS
	 Qf2wO/i1bXu6QWjILi+L8Vc3OmB+HH4KJyWxKQKA0yDKWjJrc+rGTdscogBXnMRvJbz0n
	 q4SsJj+5KmGXrYlUhk6obSYuYqIEP0Hb80CQzf1n9kQth4ALjk2iEOgzD87L4ZTw6Rzzl
	 n/qZlwQ2Impqx4vLNGXI2TWZeP+DYSeJPNB3TTKHxBUeILFZCBBRY9aLTwy5L4UV45Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/q1oWTkjbDNHWQAuk2EDeZ6imnt0CDYY6KeOw9zQ30c=;
	b=o44RXaV/1yAYynbPm0tRDX5WhdL+bzUD5wNKaLO9hRe1TV4BvNM5uM7pzGw13u3vhYgr
	 K2aMNJtMeDxm1Tzd7fYegplLbE3LnTdT5J+udRQchD1iLSivvS169HY1UkF9X9AFWNoIN
	 j0Xy2IdnjyleII1JS/gx6VfR6ngImrak8894lEbvnLoxrFWZN56AtrrRmqirVvWv6hqEq
	 Ml/usAe9WkcOmumTAJapi6SEcUbvWAbO6QWwBElGdRp1cVjyeHdlYpaMxw6RysDVHUike
	 cRWuBi2gwWZxzUDOZYxj2DJ5hNi9ThugWnhdhnBNK6TH76A/gL7/lPcYAoRFkWe3UUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NhELpC5Q;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B39E606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B39E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NhELpC5Q
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50cc8e0f84so351252966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1794920730; x=1795525530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/q1oWTkjbDNHWQAuk2EDeZ6imnt0CDYY6KeOw9zQ30c=;
        b=NhELpC5QMj/9n1YN8iQIwTFvZLOb017O+MvAGcZc+dKfvtTWYGtmYneosP/n8g/spB
         i76kZPM/JywdHsEOB+kZ8Q07yvI0/3hFuJu5FcVRcDYp/rpwWJLdZ9HMw8ollzWD4fxI
         bC/89iJgAk/A+PpkZkfWjYc81bFFX9i+b5PcdJfeCX4hu90WA5Mj1mKD4ZoPpueRjyiH
         F6r6unAl6UyeWdSt6pTN42+kLCA0Y6kjhbSvyxRCmEM44xlTHiMBRe6G+h+g3eDhErqd
         rOUJtfDsOxT1+oaQL36/Fz7XiDWPOEl6KyrBu85mppljzKTc9AMWAGpqjSamh2MrlaBa
         +HZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920730; x=1795525530;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/q1oWTkjbDNHWQAuk2EDeZ6imnt0CDYY6KeOw9zQ30c=;
        b=uFevcMQbCJYfmFhnFHi6ltMQsyLYeC8rkEcyaZz2YVyaijAwLUGPNF0FkULQD9TmlJ
         KHhEi7+gleQms9aXaAsApMT4EJZ+SvqzCIsRsUlhCRgCQtGw4nguD3RJLtUXLftXiCJ8
         Sjt8Wt9OlhjUx0e8MF6AWoZa4FfReimV8FLFJwd7UG7Cbk13jc61GsYcn1mbcAGaiqJS
         qg2tUykh1bxl9WvLg28XYtFWNLwIKpWsiTl5wwNliECg2/RwE6XdbQJYrj9RnAJxL7GI
         BvwOu0UzlyIyPuDQ8a/C38mm62j+SwsDBaB/16hYtkVCKLKpOdeYyns3Qv24d6nmROGR
         PCmQ==
X-Forwarded-Encrypted: i=1; AL+hErEDQ50CHe54voNw9MBeAJFt5UW/K2C51w1I57VkQ8S8g6aJqyhHq3XUqEQhMzb+POIrf9OMO4QutUmGvQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FQS4XJ57Fj19YqUI5fPYO0z7uSoqHracIUQRi/1yc+eZ5qF/i
	LnCC56HPiu2kI8kUUcMSBUSgUp0n1dkHRbI2KQNfTbZhs6LWNigDJLjw7wI9j3DjKiU=
X-Gm-Gg: AYBFou3feCVFZXDt1NqVff3ML7Lc3AV6FHT/6SgwzH0zaHy5fyxthFRndqClrKeyzhr
	/RJbEmhj7UtPZbL51DppwwP4S8I6vzW9/dJaQiq2+yGQeY+AYRbiKL1AUNhXU4dT9fwwcAraQM0
	60BTo6w0qJHjcmISOgAkP5kVf1cNDKbMmwWFpvmfMbw1uXW+ifU7bzr7QYcmrERGmv4oy5v7huX
	lWh+8S8ylxnW9jsnlmjY0XieBzWtaXftabluSxhE4kjit3J+y2nsm6wrqHx+tWnemJyMNqKGnIq
	6Q83c3VRxfw0MtAoKWO9+diqa6wK9W3XzpsfifTJilGK1DVg7Iumy97ciTHMNjZu4phRpKwzBHt
	tyDfpOwImp/jjIOw7X8HSqTZ4GqKAWiM3dHKCdLAYqzkMmerwif/ZasNxGg4S2pNeJkjYSflXTg
	gwr2bpsO2DaRCKnj3HQXQuu8mOHX51wrsEfCUW5bFB5yLM/3iitpdlsdVRsJc1GruFRPTZ6T5HH
	+hXF6DCYNjoTSuctXQSsqzAdDi3iJ3AH51fNGtC/TLlvrJScDAblDvEUFfvRFgCX7bkHcSXPYml
	xIRTOe18o8NVuCX5iS6/I6rr07EufgI/KqRJdJKCthj9ZiZ0Ho4pVU5NMW9aMpkPG/T/aBoHKOF
	l+NPCWXYLTlmtjMu+pfYHgwsAwCG22cOv2iqW72pPPWkBKURhkg==
X-Received: by 2002:a17:907:8e08:b0:c2a:ad55:b3fa with SMTP id a640c23a62f3a-c50961d1e39mr1302474166b.7.1794920730419;
        Tue, 17 Nov 2026 05:05:30 -0800 (PST)
Received: from alcachofa.home (cst-prg-52-235.cust.vodafone.cz. [46.135.52.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm22827961f8f.50.2026.11.17.05.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:05:29 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Oded Gabbay <ogabbay@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Guangshuo Li <lgs201920130244@gmail.com>
Subject: Re: [PATCH] accel/rocket: put IOMMU domain on BO creation failure
Date: Tue, 17 Nov 2026 14:04:56 +0100
Message-ID: <179490829259.50223.3008700255330714647.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708114354.753817-1-lgs201920130244@gmail.com>
References: <20260708114354.753817-1-lgs201920130244@gmail.com>
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
Content-Transfer-Encoding: 8bit


On Wed, 08 Jul 2026 19:43:54 +0800, Guangshuo Li wrote:
> rocket_ioctl_create_bo() takes an IOMMU domain reference for each newly
> created BO.
> 
> The normal GEM object release path drops that reference from
> rocket_gem_bo_free(). However, the BO creation error paths free the
> object with drm_gem_shmem_object_free(), which bypasses the driver's GEM
> .free callback. Those paths therefore release the shmem object without
> dropping the IOMMU domain reference.
> 
> [...]

Applied, thanks!

[1/1] accel/rocket: put IOMMU domain on BO creation failure
      commit: 90035d3f26e011e16fcf9c5071571f0d956b5219

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>
