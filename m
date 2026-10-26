Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974011;
	b=KpnzzPapGqyBftTyQKHyq0oOtiEVqu6oWykfzAaw7RGadaQWB+m1lYkvzc8hB7xG7zh4
	 +8a5IIk2E9VuTUOuRw+nn05lQjH49+84LXbh7yl3c95N24Z/KvxSbzEFhTQNtBucveIh2
	 s3GcWGsJKVWZPU6Sma+4vZ2grkC/8j7WurLCVldiY4EWapBVzd3LscZbt4PULkxA2rCmn
	 i1NqLLD0kmsSQlsYwz2c20og8xsklvxz/RQ1y7+2jiH9Z0NX19O/4nTEDW9xIOe4YNkZO
	 wCy1e8dOtSyqYCZaLFLBhoKBW3/21q4hk4JP5pchETjtyLb5uicej8w7Vfu4BPWkxKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lJk5MOLydIzjQOgGx/lqDh+M3wd1cLnQSwja/ynaVP4=;
	b=vyXuiZdVd+O5ukucw7l1UMGNzCvl6K1pLMcbT6Z3ySlq12GMJUvYO2D8vBo8as5c37Be
	 6XeDb7XkZxP4qAq/RsJtGJVffOZ0UbEMC0XsfGR+73Dd2BghIsnkaQJIAj5MzvNzj2Avi
	 Tu56QybR4TvGst9Q40r39Atdc0u0C4Ao1CJH32BBh1MsDN99Jpyx4L2yKqLT2S9x/7iJX
	 JCcN7XrYNB8h2inyrIiIWlhQyFdlyrqIoSlEOwbAtt8035rzyeAhapAQkOjRc/Z9uouem
	 rQMIqOKezyWuizvP1pzrVkPIbLBluXvY1sTT8Eh+1aBgTWmUR+c/bHdaunKFK+MA4ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eRnUr89E;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33300606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33300606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eRnUr89E
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8b20a899fso14041065ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974007; x=1793578807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lJk5MOLydIzjQOgGx/lqDh+M3wd1cLnQSwja/ynaVP4=;
        b=eRnUr89E1tjfR/LxuxtyoX6EFK+rxjHZZCw2kLZGz5iagVOG6gW+YvNGCGXIJAdtKz
         t/eXz5W0ycDlTBW7cZBAzaZinhd2JZaXnPngzlrpxtrVlRSxJGjBDEo7meg8+G7sUPHE
         Kol9/EPzWK2nH9EzfWhyaS/aVzZoMU/MVbyGCxPPR9OW83HjGIrEA5FQzlb/gE+M68yz
         5Jbc0I3JwymjeHupPEqPxrzNjb1wN1hY2jyCJIFpbQVsZ+Ba39y0bi+sx4ZqNleczN/5
         lRhQfNIoe47QlT24yVsJ1ELBXCnpZ4IYAHKsI3c+VPvaU8/kWPHzycVBUokpDho5QkOv
         heMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974007; x=1793578807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lJk5MOLydIzjQOgGx/lqDh+M3wd1cLnQSwja/ynaVP4=;
        b=dSaUOwdk8t9p2R6O7U8bBq+3/FQGOJbZlVkYs4HnWYb/QeVkmb7F0NgRJzC9es1DJo
         TsXitq73ufnR0HAdPof1+gy7L5e9n61dGrRwx8dCZaQIbXC5Ckct205qiKs0OFanAdfI
         SS+WxS0raBqX2/p0J2paBar8216nkoFEWr5+guC4S0BXolZEmnGsJrRF6uSNpn2W9O0a
         8v2Vqv15DJOkHAQZW8Zvwi7Qlj4VtCxbH8Fbn8WiKOCqXyuyZe/KBvMdB77AByLekuBF
         L9NbfKiz2pCJfuknlmGQinq32qO5oNeB2SXHICtwl5VP42Rnp3WKZrrRdmup1oTS2D/S
         S3og==
X-Forwarded-Encrypted: i=1; AKwUvBxiBkympKMbaPFGPc9IGvU48NEWB1rjTcUfTUqr8lzMAYbx5MOdZExSD5vpK/jkaDCYgzWRuRHERF+v+tA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmOrGUiK9krX43jkKUyFqS6+Lj+uEFWDDHPMePC2ja9l6ccBI/
	fR6Zo/FcDbZjcGCxh7GSiWSLsyuUiuNpLarmiFfItPWFISLg2dGWokGgQTz0Kw==
X-Gm-Gg: AYBFou277vpZjQdRVIA8dSNyLlNROuzhGFZw9De0XYILycm/Jb7DVE5lUftTA515mzk
	QpmaVNljCzxRUpnEhpPT353ZRJLth7FZJ/YkM7ToAwRUoguh1vKQT8QxaRU9V8OY1ss9eXtqEhA
	bdB5CPWy+ZhWb9PNPbvK0gYee5EAYiKNkvERJDllT9mFRLGlnuVWFd2H4Mi+E6/dXnv1O8y3zIw
	cnPgv6JDjEo7lpu3+JgGOm5eM9tRjyjai9IC0lBnit1KLmeO0WK2+kF4QnEkaRNymqmsnzVfNpM
	lMGKTN/3Dcx+xAaojw5leQ8BGKs5eNIMeJbew/DVdHKT1bWH9+HJFWwEQK+Edn6/yYnD5lAJu9+
	Ldwx25sWtcoeP27JE2JK5dKk1xSke1ou3C6HcZygoP4BqKBJkFAwy7r4gW2oAEa26Fopt+RoWoD
	3HQdolDe5+jhcskI//j3y2IhUwqXRNznOGfn/mbw4SOJq2vnKGecK3hRVRwOctSMBzaZPyCp8Mh
	m9ftLx8E71TOF9TfG0+RVEW/59R6YfyL4hNk79RBWhVpbqivPS1v794mRdrIrDqMTGHPG5gSwGq
	f8kMyo+EetmeZMU=
X-Received: by 2002:a17:902:d486:b0:2e3:1776:278f with SMTP id d9443c01a7336-2ea9c876327mr45145265ad.42.1792974007573;
        Sun, 25 Oct 2026 17:20:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b121725sm9686325ad.14.2026.10.25.17.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:20:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:20:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v3] hwmon: (sht15) Stop deferred work before releasing
 its resources
Message-ID: <4b1e8242-bb8c-4f4b-9813-c835f705a258@roeck-us.net>
References: <20261024014044.27853-1-mhun512@gmail.com>
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
In-Reply-To: <20261024014044.27853-1-mhun512@gmail.com>

On Fri, Oct 23, 2026 at 09:40:44PM -0400, Myeonghun Pak wrote:
> The IRQ handler and regulator notifier can leave work pending after a
> measurement or notification completes. Neither work item is drained before
> its resources are released on removal or probe failure.
> 
> Disable read_work before freeing the IRQ, since the worker can re-enable
> it. Use request_irq()/free_irq() for explicit teardown. Unregister the
> regulator notifier before cancelling update_supply_work and disabling the
> regulator. Apply the same ordering to probe failures.
> 
> Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Applied.

Thanks,
Guenter
