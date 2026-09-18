Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351F75478D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789774567; cv=none; b=ICqvUjGOanN63UlRy1vxwXMvpPG4TQhoyaLi9yCPOEJpl04Mo7eL3GGDfeD9y7QBp+GayHsSt5YE8wZApxDP6gd18qXwR/4HX0xuCOYGiOsDb2tQ3lVeKGzO43uv92ItNutgBfdzk/05js5QijVxmzo6Ahmgwjhi1FsCgwQ7XQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789774567; c=relaxed/simple;
	bh=G9DM2Of6M5TWxY6xCT2obytznk7tMmjDSD83/pDsXoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VAIzJ4MZB1gfO94MyALxtwv03Y86VvwRP+QjD2GcupiV+AqEazCbGYno6obX82uulhf3ln9IBDwS9P5h7CyLeavy1bm0BJlB3I9InBLf8VRwuqFgpA8ug9eAR6AIs/zMh7U56yAxmVNhV4yUIcFlHxeLbPjnfFW32hYpAsSuyTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PYPc7qUX; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PYPc7qUX"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2d9201076b3so5428815ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789774565; x=1790379365;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ntk2CWh32Ga1v8+3feA2R++RUDSg5e9QTrLv/pF7Lgk=;
        b=ZIHbu28kBTfc+M7uOBnuZcw2aDV/wdzZuuU54tBzMKB9jvKtF9AMtwmBkWH7Gs46q1
         /wFrzRRapujCuYTfo61HIKfiWjGamNUYBOnO3ze1EeapLNfb72kawqUeQJOhQCysXIwu
         HDHNJii29+HGnJYqJv5qHDLUTMrODBBHl7lmzceE69BW6c+Uf+pvAWp/XphnGAkq0iJx
         ErK7DdJlUZRRg2bRJxr0P110IOoLxeAE0jUI4a1EHuiykL/1JHsPCKbm9OeCb3fiSJia
         E7t0gXBNWq5/BfJO9Kes1yxwHNwn3FVitdIfCk6SrJ9N2w90feMh6ei9AR+Foij00AOw
         t22Q==
X-Forwarded-Encrypted: i=1; AKwUvBxCFKdRBG5cYBABEAcObDXWLZRD5o2M2NzkAZqCNy3amPKHNi/W8q43oE6NotrvRRv2qrurRpLjGNZBQYc=@vger.kernel.org
X-Gm-Message-State: AFuF++kktMEbcwFaWJTSIyzb1Nc1XSICZtobGnWCT7oxAwGkO6UbZu/R
	J9jz9PNfRSXS6e3R2PTT1ggqOsWOdKTQzg2fOG82HIPZ6VxLtuHUBcwCKPMfimvZ6U/qcdHISwF
	Ptm5PE1WU8Rt+aMXKM35LUi/jxK6+rGNyHEgSnIRwKufMDG2wt6GLWUcYt3K568HeBYxTDe+8Hf
	gJEcT9aE6CF2ehjWAkoe4dbiLKBeqUxjX1/rK9XGHa58U/mcS3xYVSMGMYNEZ7ATLiejThWBd/F
	9WiXRBeus/MW/rYwG8fasZt
X-Gm-Gg: AYBFou2Y3Pbx0V6i6Owvh29qSvx9uPhR0ZU4vFUN44N+XKIXVEhKmEOy7GpU9Jd/iA1
	OBpQkdLfepQYsBrrfR7zt/UGnjBz6KjU3ZOs9b4Fbeoy5aRfCxXKYYIhF/NLg5i9ZqRpLscTkzM
	X7CcaJut4+9fmnf8xcIzLGq44puHc6qtHOwSlFoDRqG6QDwHNGkVN8iTCMolFU/zVKAWeyRby6j
	Ie/ipXSaSzQWDG7n+Vnnso87nDlZYfExyLelO81MpK/kvw/jC0Pk+ENEXPWON6MZaI14F4tdPYb
	JkBQrrWb+HcDjv6ensorgqlDsLUQ2h8rTWYDZIsDJsoNYzn+Vw9hYtyqqhgt3xNCUe+kRO159VT
	sYpF8vBYByQ9hlI6Ce6Ksbi/ryj7yVUZmhHMaAXOxKd6y0KgkIRikZmjxVXHgyvceScWBBArWhY
	mM4Te8UXYGpemP+Qy+AT/nArpZ98VdzQH6iZ/wfxDF
X-Received: by 2002:a17:90b:4d8b:b0:39b:92bb:9ef0 with SMTP id 98e67ed59e1d1-39e54e7899dmr7336241a91.20.1789774565394;
        Fri, 18 Sep 2026 16:36:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39e6ca60489sm540413a91.6.2026.09.18.16.36.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Sep 2026 16:36:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc52c77089bso1740649a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789774564; x=1790379364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ntk2CWh32Ga1v8+3feA2R++RUDSg5e9QTrLv/pF7Lgk=;
        b=PYPc7qUXlrSRq6O3USzKyKWXUvVXterfuCDQNio/wTQTvmmzZNhW7T7d+YFfW7DMVZ
         CrTmjWaUN8YYuRkbVwZBE0MmCl24GzSePJDNU9uGmRqE6Qr1N8kwLTJR9QtJ5vt0HjBy
         3OAjcquzjkhjwpx1gUrdPDpj8ni22W5D9gP/o=
X-Forwarded-Encrypted: i=1; AKwUvBzSvRgQrqmmgAdKdvQU8jX/kZrJQ4Y5FbetapsUgB/BlfXV5IQodEzeXyYXEFpzBa5QEGgE3Ay8V4tFb2A=@vger.kernel.org
X-Received: by 2002:a17:90b:17ca:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39e54cb43c7mr7837828a91.6.1789774563811;
        Fri, 18 Sep 2026 16:36:03 -0700 (PDT)
X-Received: by 2002:a17:90b:17ca:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39e54cb43c7mr7837811a91.6.1789774563362;
        Fri, 18 Sep 2026 16:36:03 -0700 (PDT)
Received: from [10.211.247.235] ([216.221.25.44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311ad4esm1741803eec.5.2026.09.18.16.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 16:36:02 -0700 (PDT)
Message-ID: <ac49be70-f10c-442f-a4d8-54075ffcf8d4@broadcom.com>
Date: Fri, 18 Sep 2026 16:36:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Fix GEM_CLOSE returning -EINVAL for
 PRIME-imported surfaces
To: Claire DuSoleil <claire.m.dusoleil@gmail.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260917181312.12473-1-claire.m.dusoleil@gmail.com>
 <ac19e380-e93d-470d-841c-7bd3f2b0b86a@broadcom.com>
 <CAEcBvW0+SqM2zHbaDS+JycXxc-ztzvixKtHVSVQby9viVH=+eA@mail.gmail.com>
 <CAEcBvW10sKwD2+Ro6o8Fq_9oLwsedq405f=gjQ+OMbY72=+VFA@mail.gmail.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <CAEcBvW10sKwD2+Ro6o8Fq_9oLwsedq405f=gjQ+OMbY72=+VFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Disregard my last message, I had not seen Zack's email.

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
