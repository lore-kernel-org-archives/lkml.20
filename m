Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D0F486431
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878607; cv=none; b=N40yfq4o+E++Gt3lwsO0XlKe+/vcFnGISRO6gpwPRAHhi45CjJw0qWnB9yuhVso2+rl73zA24DS8FTCo1QP0SzS+oDJYtYJdPv21DI2dWf5WTmR9ucYIoyutFDNv4X+YivSx6zuKmQryyD5e9DoEVAxtfoZyeTnxwWvd6bZSe6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878607; c=relaxed/simple;
	bh=KILrO5C2pN82m6mxD22TjUAkf2TJhwYe9y4RpURq5V4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3WoAvrkXxhkVWULMJYkB63q1eWG9zfLsbemdbrYHEtrhES/96kdxaxYwBb8ZFXkNmpYHC0mv9l7zo7JDalX6VBpLqbJki1Y4MYQZXsHa/7UF33kejVoI6fxja/dZm+M0zqQoXWzyLOjxPBeYukqzW+JIbPCsk8jQBvh9EyU0wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7uRVcPq; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7uRVcPq"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so38805565e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790878602; x=1791483402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KILrO5C2pN82m6mxD22TjUAkf2TJhwYe9y4RpURq5V4=;
        b=i7uRVcPqfZY0di1GOTj5XQhALY1tXdaLkpXkUfWTa/pijub4czHhP02khT0xHEyQGU
         oaq9Nq7ktZFpuH3Vn90v4v1EKbzVrNT0cmo9eiyXU5UShIzTGytuXEqiE9bBLXgygMUi
         0IcPB94OE86YACJNAA48YO2+ktattQ8B/95RlaExYPwGqUIHhwA0zwJGuWSufeC99Rim
         mU2UptBUvWzN6MCS9Cc6+k0FGe+GPjyZaNyBpqzupTkpB29E8G9H1i660xSwiJayHJYV
         fBilbmLj64kAnh/0dp8jet25l9gPIkucDbo7HB8O0+l9nqyDhLqi0Rne2NjSVW1AyUZf
         p8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790878602; x=1791483402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KILrO5C2pN82m6mxD22TjUAkf2TJhwYe9y4RpURq5V4=;
        b=Q+2l6FFYzcDO+gKl8LkQOTyNqHmFXGkqzz7eAwzjF0p9vumfJjz4JKNEhb54L5VUxY
         uxVosXzYiFcmF9eKING4jz/gqBUj4mqpWItjb+95+Ydf3YPMP3TJp2VaXHGoStNaOPRG
         PUzu27be/cH1ghxf3IIYQobOb1qUsdmFOrxznnhFZp37v5Z5d6HXZcVwmEPPVjI6do3Z
         ITai+o2hvQ82JWFIBVZcxVXa5FgiyHNo7OhcUxE6b9iTEVLkzP7/OvyaOTDMyRsByg7B
         7rUkAnrbf7pOclzk5gDS8h1ZBz3g6PzPq0OLOV6UPo8qemomwPGCEJo3CESFtgDmSNm7
         PvJg==
X-Forwarded-Encrypted: i=1; AKwUvBy+ovirgqbPXndkLEcgvxqCDMbsssw2sYDktMYD3szMEeNt/iaiEO6XKnglbAivoOEakfMaWxZiNPzoIeA=@vger.kernel.org
X-Gm-Message-State: AFuF++lwAYpnf+t8ZZFrHCyS6frGBpuU8EeLrPqwGCRMXkISYnM8Pd/U
	smkyeeCoHsbEphKxOAMRFhP9sb9A4XKMTL9byrMC6Ie/XbqEwjhOGt0=
X-Gm-Gg: AYBFou0e5DT0cuC5nlZFEfBKx7EIYJd3uPzaZdAxvOjVEDcvbbOZl8rFB3ddOwMXW3o
	xuTwPtrNxTrt5hZ5as5qRniFi5I3HSx9YPLfPOpKebCwtQnuOn8RCVoAyCcvjHHNs/Bg6nheswo
	xijZvKxTEpN3vTdWu8YhcmbwrW2vTHcXwQLOJp5CZz+M7N7m71TRtmYuBVxmaHMY2J4om5Xyq8Q
	UzxbrAgZb+Ny+3rswqWpHnjaPZFdKm8J5GvLhoZQ/ZA2/nJVbvmnwCevfQUzNd/Jtq4+PXzZsnU
	HmPZDdpcdqugbu7BNXdMv7FMjDPR7Bf2V4mUr5J38JClaS4iQu+cG02fD3NeN1p356uW0b24Gqu
	GsFGS6qKeLDk6Gls9uMEpuHf2Guo0WL4aujY/3Y4kHVIgbycxqE8lSVOQ0MFnrK6a1ZaQDA6ZEC
	n89KtyfC0nzZyI7joM9o3Jj3355WhR8e+VZW0vyq0rA44Pok8VXOOLx4RyWdgd1O2exF3r/I5g4
	EtpFY7oYKnFBhMx47YzpaRP38e/02Bo7HYFlG5o4WAjeru1sNVzz1zEgL7Asc0duQ==
X-Received: by 2002:a05:600c:16d3:b0:4a0:263c:7064 with SMTP id 5b1f17b1804b1-4a0275758admr5878605e9.11.1790878601918;
        Thu, 01 Oct 2026 11:16:41 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770fe4csm8482415e9.7.2026.10.01.11.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:16:41 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Thierry Chatard <tchatard@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: [PATCH v11 2/9] mfd: intel-lpss: add Dell Latitude 7275 to the resource conflict quirk
Date: Thu,  1 Oct 2026 20:16:39 +0200
Message-ID: <20261001181639.1788077-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ar4GYJvy_w-ZMJb4@ashevche-desk.local>
References: <20260930214321.600863-1-tchatard@gmail.com> <20260930214321.600863-3-tchatard@gmail.com> <ar4GYJvy_w-ZMJb4@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 1 Oct 2026, Andy Shevchenko wrote:
> > Assisted-by: Claude Code:claude-fable-5-1
>
> Assisted-by: LLM

Author of 2/9 here: agreed, and thanks for catching it.
coding-assistants.rst reserves the optional fields for analysis tools
(coccinelle, sparse), not for the model, so plain "Assisted-by: LLM" is
right. Thierry, please just fix it in v12 — no need to check with me
about editing the trailer.

Thanks for carrying the patch.

D. Manresa <dmanresa@gmail.com>
