Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976187;
	b=np63vqmFboxsy+nVywj0Lk9tialjY3uHqh8NsYLyDfWhC3964lCa1ffjwFe606RA5l0/
	 V88pLnmAtGODtbdOaHM/Oubcrz5ZhQIp1lYpyQG330jwxUvQc0x+JyCdzPeYeZNoeuzWC
	 IqjCndI7zEBcMm5XbsJao2MiXHDarQVvsnpbL67BJFjlmx2mZ8q6XA2zr+sztzlFLx3Hn
	 GWVjOyy/Ak4ICY+yK6sMrHzVAoxbCs3aDROoNParlgXv5+Ai1vNJRsUV/WA4GGix6rPnu
	 vODFOJm1WB/jsaVPGcmt1sO6wcCL2amf0ZdCZZt9WbkRecWbfwRjXru6EEszceOntNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sBbetg3460zCBBHo1b9aOflhXCRQmCfSVeApKwjETns=;
	b=QRPP5L29XXylxi0YgOi5dJjtEEGhEuv92GMy+Ez5Yutp7NhRf5VOr72qlMUF+ytRgfLS
	 Sw1YNn7aoD471nrJ5dinbVEBqEko2ScrR1zojJAxB4aTpnOs6MHaTVfNsdblkhTlszNkh
	 ctmnv913OheQIDbKsnPh93bRKO1TNorgCSY3+c5Vh4+rM/RcNV7l9KSbejcfhXYHqPVTI
	 qBuWGSKt55UJ1LUJJuTZOqp+QrASuftloLbZ4XOn+JpzyDfqr970g84XQv11UimyXru0n
	 JZtAgKmZcO44YEkeWw3zgzsdAuYVL6wZ1uxz74mH1o/wsfazHjZ88ZvHJr6aYe56Izw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YgN1J2vq;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6F7606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E6F7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YgN1J2vq
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a01cac8733so1775001b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976187; x=1793580987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sBbetg3460zCBBHo1b9aOflhXCRQmCfSVeApKwjETns=;
        b=YgN1J2vqtleVDoBC2TI9ADivCYcHE9GeOQMzOKneHIahk4S8gcvUilTtNgzQQwGzsG
         qyn5MRuEpJueQfsHwam8Gr3mFc8smzjqEcgSzobL1z/f8PdQnvr2fWH9qz/kaV276GmU
         DHkV7JXpmUc5j7Qrn6tQRSmf6KePLHozV+afcvdJek56rP2mGwuP+Tv27fWYf9j9igxT
         E0tRHG3x2WjAzfPp8a8o11mpEngvHOkP8ZnbnmLfrGZDMzSDP//gAWTkMRSg6dascvJC
         uv1L1LPF1tv/qCbcnEiQjVc+a7OwycVFT4K6tr+zHHmux5Xnug1IVaNljTeZi2kZnbqX
         wYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976187; x=1793580987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBbetg3460zCBBHo1b9aOflhXCRQmCfSVeApKwjETns=;
        b=2LR5qDEALolvkGX2F3pbXx0AtZw/u3+fhQQJPV1fy8Eynbc4o0eeqH3j1z9k5/v6ND
         qtbky1ygMEj6By5ISNdzCgq1HYwwkuVk9oq9LdUze78UgAh9SXuJZorCIF6uHwTEylJh
         IMrJWpTqe7aSc4Lt0XG6vt3g3ww87CYjWM0OqHX+usfa12hiUyYza760zDOawKGUsxsb
         klZJWy/43B8A+lFIDyh/4Wl4VHK8Jm5pGiWPuPXVuHOyUOUI4/XZd/ui3Va71cjOt3ZI
         Fzg7mpAYbYoVH9leNg5SBkCk+6ILn6pUIIMFVbNQ8YE8hvicbzBN+TtVe62YcYaeUZjY
         Cfww==
X-Forwarded-Encrypted: i=1; AKwUvBzLn4l5OIsSImJSjPyCl8uzyTBleiHvslc5wRiW9SFdn2ey0xhXxYqY2f1Ps2s7zOjWrr9TN3A1c0Nxmlo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDyaKEdhSBGif0vUc+RxvSa2RvA5qxssysCORL5WHicosCsyRI
	+8z91CY/nqMDbiJgZ3kmutR4xIK2MuMzOIgrS4pPJhSxX1HUmvOP/MJH
X-Gm-Gg: AYBFou3NrF/4pTDLB+Wm0Fe3Os9Iyv2yPEmqbarpOl4YIJS/RJwn5Cfjm7xodXMKk1Z
	CYStLkQRYXN0phbcJv2DBYugnyt4NWeLfJ9GpoiJL+mLtJdWgZSOI3q3PhrTz8BzcbioJ4K3oRN
	Nctlo5gq6+F2rSPEPlQYrsf7mAvBaNVW2afSCHvkfj8uVX6VhNWUqU58cwz/ZF2bLvXmBqdi1Vc
	llXQ6+hMvMFaaUNASo99rZBJyaf+Hvi5NkYRsv64S+Ufa+rVIfN4EwaT+B7BCA8lAAUMjfz8LIP
	4hExeZW+nLScTMdWMcU4LHJx21vkk8FUOR6RdCRF4UOpHsqVxRuOaUeGeCdMZvuD8X82pF9J3Y+
	cvzl92uhPMnsNxNdp2OXXUiSffrqOYNnzMADrZnDKufsaSCqySQzK2iDjb2WP+2b4YU/0odKhBd
	kS8nXY/hRfpv4WYA8UEznQ4e/AOIU56hOgYCNiTWmyJ8Lfbk3nI3H4oMY/G+XD+b7yR4VUCHW02
	x0IJGOv1+dVFYQLpq9z5R3XKI4EpyopuEDQ1gtTEay0gpHyhdztVuv9P5BCPdGx/wcSzw==
X-Received: by 2002:a05:6a00:2395:b0:892:fc00:6e68 with SMTP id d2e1a72fcca58-8a364e335e8mr4011572b3a.3.1792976186708;
        Sun, 25 Oct 2026 17:56:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36b3712bdsm748838b3a.21.2026.10.25.17.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:56:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:56:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matt Layher <mdlayher@gmail.com>
Cc: Eugene Shalygin <eugene.shalygin@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (asus-ec-sensors) add CPU_Opt fan for ROG
 STRIX X570-E GAMING
Message-ID: <0800413a-a3c6-4de8-9c5b-1308c1d067c5@roeck-us.net>
References: <20261006-asus-ec-x570e-cpu-opt-v3-0-62672edc18b3@gmail.com>
 <20261006-asus-ec-x570e-cpu-opt-v3-1-62672edc18b3@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-asus-ec-x570e-cpu-opt-v3-1-62672edc18b3@gmail.com>

On Tue, Oct 06, 2026 at 10:35:37AM -0400, Matt Layher wrote:
> From: Matt Layher <mdlayher@gmail.com>
> 
> The board has a CPU_OPT fan header, which the EC reports at the same
> register (bank 0, 0xb0) as the other AMD 500 series boards. Enable it.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Matt Layher <mdlayher@gmail.com>
> Reviewed-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
