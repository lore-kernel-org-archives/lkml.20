Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430579;
	b=SWHGILuQajvRsa/CRkM/VMEovRyRKnIwhp3sizaQM7isNDz9D0TbXf3ts1kI5e3PfRH3
	 9CZLIhLK61F+wOPlk8AdJRpraMrITmux/jjEbX3QPmEdj8GoZecv7Bz4d5RZjjGw3rBYP
	 RqCNtR8vPoK2Cs4btHr4JiPDz0987wVZ4ZuylhJOsijO9k4ClZpVU7sG2okJcltK3gbcC
	 VZuu6eWy9CFadLO+M8nwYf9DIF99dYyJMG6bniWmp2cABQ8PBmGoeQDH/l/QiWCsBzpuK
	 IlRg7l4aj0LntEiQ9bzvggdz32oY4b+pE853varn4EXySdehA+mCNoEOsiRAO7VFTVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xzgw+taeENUOT3ZDyM1tex5SiMxNZDRD9mmmwBeUwBA=;
	b=KYar3ANpBMPjetc9jGcggkHsZYl/scl6fqkPxiFrAtVnFUUyDaK/a/N1XVJesquiQ2Kh
	 eue2odQkXZxKqJ98tmNLEIMCICC9bqwvSogJxzudpmZjKt5Bxp5tsvDpAR9axYch+jbvs
	 BQM99bnEm6T21mAuqAgh2Nlm6CUrRJZDbr/TmRIrDIfvY42F/8TAR/4eYmtoVX3yxY7Up
	 WOdxJIIhbEHpOa61PpV2MsGIjpI7FqELsPZKD/gKT6LomqbJbdaoorxG7oCHcD47Tztfl
	 gYEX30tRsDxUnfMB9R2SeuzOZHDvskpto9mKoH4N06FxpZa039VwXpHII6w7BhJrA+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b="NzU6MFC/";
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22B8606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22B8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=NzU6MFC/
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5066da8aa1so163999466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794430576; x=1795035376; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzgw+taeENUOT3ZDyM1tex5SiMxNZDRD9mmmwBeUwBA=;
        b=NzU6MFC/iLeSkvfM/++8LRA5n7eyOWn9SCu1IQAAm0dWumCliGjlVL5j4SNl1XxFTn
         FJw1JmUCDOqIi+09gFo0NA9qalD56o3Jl6ScVGt6Afh+VQjx8/u6/go6EgD7UqFvQlAY
         7O77FWKXnjHG6LnSxzhnEXm/5c38hBhMmMX1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430576; x=1795035376;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xzgw+taeENUOT3ZDyM1tex5SiMxNZDRD9mmmwBeUwBA=;
        b=iokq6lmu4Fd1SiOCMd6aZBOi12wGcxtBikKRr8A8cRdLPXzX8c0icTaPAjI84W/52I
         QrDmJDZZp59ziN/i9Va5GkFIt9JtCr5GQWsX3B2ev8sHWza4HmCca0oMev8DIp6QrES9
         0lhYi9Tsp0+yVNFsQc2SAC5lToTATXnxeFJ6xqbLLIYQmESMKkp/9KSyKdoHcimnNo2W
         o/NsvvTy9Rbsqf9HvwNzAvXoQAy2LVYDrfVG76T9rb+4vIebHIqfrcly5zCucVIz/C8B
         whXldWth0cWRrabqCpgirdgtlwfZ7wGp28ObRNjO3sWQxRE7jbtUkvUrQZXHDOJ8B0qk
         chqg==
X-Forwarded-Encrypted: i=1; AL+hErFvJ15+mxHeFvCq6kCWF++9EPZTEuQ9tJy/nxSgtcdKLQIsyZtImMHz1F774KllpQtAhlTVzXNOLXMzbtg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bZMaTVkAAqOqt3bSL9K38IW7jymLcU/US6RpOJY6uap9vP7X9
	L1ZncW9zgqJ7rJZD7/CK6VyOIXPceR7A7agtqayKtV1npiedhRFyHx4n0CnI/tGd6VmqRXN1Icl
	pViO+Gl27+A==
X-Gm-Gg: AYBFou0WS3CPxEHW9jY54oIRf7A62b0Anx24W5/+KwmHGZGSTYZXFb6g6Wsbiv2oa9W
	pSBFwlHDKl3LfnQgPJb5K+p1p39tgja3ZbOfSn5LVxK3GFldamFKsR7u31jV7J9hhyYj/YX9uFj
	GL0hrIB8jzNYbtTig7VcKuhUGFh+6fWYkiC/f0OAo7Op6GS++0+8bQGzjPNJsWN6WvYe0XK5ox+
	6EG3yKOqM3261n5mQTLMjB4BT8lVxiyNvDH3FlVb9r4kalu1+X8QKLEQ3pO4U2vhr6TMqvtDvdr
	N2DlhYAb7sV+sXknFaSkkFR54X3IQGXgl97y59WDM8apBY2+VjRYuw6GGM+LVTsVPN7bvbzYiHf
	z9kHqoADRXXqx7Oh0It/mYLh6JQdJFX2+nt8y0ouKULZsgs90k1NL14z0JOJNl4mWmElFGCDrPN
	YoRWllAfw2bsc8bjo2K0KUG+h/Kje4BfgxGrOz+g2e886FZozABnTSrIspc9j3+rtstxNrtqbL4
	jlbCCfyj2skKHPFF2ZA9qxIl4t3WMYA+C4hMObt0/9o6g8jKCrdUw0vrnnLfRthjBf3VMhSX7Yb
	XTbR5HvjDlM9vN7PlMDxt+oCv91Zki28LlUNmKDIqMJI/J+HWjyy+uMGTbbutds6U/GRAtIU4P3
	UrA==
X-Received: by 2002:a17:907:3f20:b0:c49:c76f:dad4 with SMTP id a640c23a62f3a-c5066cd7fd7mr275705766b.31.1794430576264;
        Wed, 11 Nov 2026 12:56:16 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56f034sm265213566b.14.2026.11.11.12.56.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 12:56:15 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so3947954a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHQqa16FCJZAuR5RdfAIfP9Dcza0a0QKU/O1/wukcUjoOeXZO6HPyXvoFHtMeJbJnp5w4gOjbClRXLeKUg=@vger.kernel.org
X-Received: by 2002:a05:6402:84c:b0:6b5:867c:879c with SMTP id
 4fb4d7f45d1cf-6b77780e6d0mr2757004a12.35.1794430575651; Wed, 11 Nov 2026
 12:56:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <606cae9e.bbec5.1a1c54f4f9f.Coremail.18670333770@163.com>
 <60541e98-b1f0-4f92-a155-8a29c0bb17dc@kernel.org> <44abb8ef-7711-4ad0-be9f-ca47206892a3@columbia.edu>
 <856cdf21-7982-475a-b244-a7ceff4eb6aa@kernel.org> <avS5QcRj85yAm9ll@thinkstation>
 <71e24630-4c71-4518-a9b7-68cf3597ce80@kernel.org>
In-Reply-To: <71e24630-4c71-4518-a9b7-68cf3597ce80@kernel.org>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 11 Nov 2026 12:55:59 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh=cVrn+xs3fZiPW=kJbFQLwf_C+c-YBCR2K9s9aNE_1Q@mail.gmail.com>
X-Gm-Features: AclHuK-gqWa4UC85dpRfsS1fgVBckngemj92OtcgMmiJYVibB47wPOEx7bU3zC4
Message-ID: <CAHk-=wh=cVrn+xs3fZiPW=kJbFQLwf_C+c-YBCR2K9s9aNE_1Q@mail.gmail.com>
Subject: Re: [SECURITY] mm: khugepaged collapse_file() drops RWP PTE markers
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Tal Zussman <tz2294@columbia.edu>, n3rd <18670333770@163.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "ljs@kernel.org" <ljs@kernel.org>, 
	"ziy@nvidia.com" <ziy@nvidia.com>, Mike Rapoport <rppt@kernel.org>, 
	"peterx@redhat.com" <peterx@redhat.com>, "security@kernel.org" <security@kernel.org>, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 12:20, David Hildenbrand (Arm) <david@kernel.org> wrote:
>
> It would be a lot more consistent if we'd just add marker support. Or is there a
> good reason why that is explicitly not wanted?

Let's not help people do things that won't work on older kernels for
no real gain.

Is there an actual real-life user that would care and be enormously
helped by such a thing and it would increase performance or something?
That sounds very unlikely, since presumably re-faulting never happens
in practice, so just tracking it in user space is "free".

In the absence of some real load with a real argument for it, please
let's just document existing behavior to the fact that you need to
simply see the re-faulting of these things..

And let's document it in a way where the LLM's also see it and don't
think it's a mistake.

               Linus
