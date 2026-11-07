Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044544;
	b=bEPwlmrg8ZYzS10KT+sRd/cunHkDLexlMawuvZgfTXyexl6XD2ULeamFrJf7MxaAw1Ra
	 kzuFVttug6KiTXityxxP4Bs/N3dtSaBMhJPxrNDIhH5MQ+t57Zh69vNPi0uQ6XzOBR9jD
	 VvhraMbXqi4H3ukTMfNvsLArY1m+VWDhWlPNfSmjn1Bvt0aui4ylr5P1SKhquA7tmUAyt
	 pzp8DqtINZmCn8A4ZDSm4C5TGxZ9SOthNYEqIqi3EqtFuREifY11KU9XgkXkrbv5s9Iwo
	 FcBDEBMxoVYXsZ6s8b28xAUy8PZkGOzbSQJuP1p3qZT2Kiao9S/tS6/oh5SS3hq0Vxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
	b=wSMVOPGYNAZ6Im6VsqGG3AZe9GmDAwqMPuZnQm5to1MmS69wGqwoCCNUoI557TLBnd6T
	 o1vFnfOD0VaQ8q+VhohgkfqgzJZ+qwX14K7ZjTOozbD7nSFzLXOklGHP4l6nExxtimk6J
	 YFjKaiLGjX8hfpyM5L3D/ZTqb3Fiw879QDZztCR6TuetbSavm0W2OH36+COzAJgy3zrXk
	 il/ATbts0podXn2zzhEWBkzQoiQeu0JpRCNZ38eOCa7EV/jzIQmCf/Vg6/Np7jZxDl3Cn
	 nXIzZyis6jpXUlGSVk6WkHcNumXj1v5i9TZGevm3B4gJNlxclPEs++MbRRcXfHV+wJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxHxoSCX;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2577A606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 09:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2577A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxHxoSCX
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b244fb7fffso2157319c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794044543; x=1794649343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=kxHxoSCXN/eMf5H0bPcyolPKHQS7ah1Wuhn71swXqYK3WY+pIDxe0NZKIVI3/z/vYe
         xLEyll+sh9roSdmxG7OAddgu0Wkjad3ifaLdmwHV595oTll4VNVO8VQmFOXdWNM73p5g
         rAA/yCgUBTP5nOlDK0DO6z+e2ETF4B0YGg6u3tIFb0Ziiux7liyMogcyIpYQ+fLAMiJq
         rwD5UXtDkIDnGNSmQXQjtK8z6vn1n188oM44sMaXVH+VDw6A48gIZBykN1f8mz8ID01b
         XJqCJkDOq7sB6HK4ZoAff3xpXMnd+X/f4urzSs2VYsm9bk3MWDa2fjthH2jkBomno8R9
         ue4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794044543; x=1794649343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=p5VYxtPzcM/x+oMb4XOEf8M7+GfLxxCxEqZvtTZD/82MgeknuSIXB2bCzCe8B1yHJs
         ekzO4cT6xs95XZiwgRytbWK+aOa03w0d73YIZMBTuf5ylAUen0+fhlAfGvHk88zIzUBB
         5r8MVIBE7wEBi2yAZ/XV77455lHmCl/onnZmTFxm0g0D8ez2aiyzP8TXypWTCsfZQrj2
         mMsZfdl2kp7g77jAImyKK1ozsxn5nTfSoOQJPdEAnM4/+IvmG5kXP0zjnfKN6ND3m9j3
         owdc9lM5PFJlKb/luCxYrNeVlTEFI/lIboVyLy7acmQIMVcNfjzBl+j1qDhu5y4rrJn+
         gWbw==
X-Forwarded-Encrypted: i=1; AKwUvBxJpCcqAK/Ga7OeM6+azpDwo2FtSbizJ6lWwelJt9KjlNNoGN/JUaDxZvjZeLr5ErUbPc9rlJ0Lyc77yrQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LJjaA8Slc3e4DfJ207HPopcAMQZjKByq45bltjs9+cfYJ75Sb
	NMXFdthHXwGdHqonyfwmkMZWMy8Wx7gO96aD3XnPdsb6F606T7GFbuYK
X-Gm-Gg: AYBFou2QlLn6Po2wmu5KPaZdIzeKtaLX6hfhWXCMdjM2Q5ahvlIdptu9fE6hWEgMlJL
	lqw/kSwYdd2IEiXlYWKKF+V5tsHSmkMTurpLlQjnuhS8UAA6tEWy0O0aP1klbJV9oasodVco4XT
	xOfU/pi0rirxIXjHi5jdunfXAMF/UtAUCloHsX7lbogCxv+TOUVKU8Pesu9lGGXuNN7sOOK2F03
	HS/GpR77rIwWoh6eTeLU8+l6Yx/w2c+dFXERoEl6w6m4iNrQh8Lph6hYhqYCy9UQ+vKcxeNFCAl
	TNzXJLfMjb1q5P2a+wLWVisIvYWsVnkgUJohSupxHXw82kqm/4HokN9KBHVG/QhlFytWZdOAQ6I
	rGJ7Hougg460eWuWcav8uP2kQoHM8DARq2IGd4+nx25bSy6zT6zA2RXjpBgEJbYSIbVahMNLRWe
	TjEPWKUmd1FPYrVp1RY6JARB3lOCb5cgdGtJU0aGIkIks9Z44vYDE7qVOcKtb9O+v6s3TDpgx46
	Oe4i2abS5XTtbxXQXMUFWmBCEOMy14NnVb6qiMwIuNK2N41oNuLkz761NbuZZeD8X4m/7Bmxse0
	DCKokQE8jtMpvxOjjuk1Yhmnja907tnjOaNCpNI91fKmJFxrfE7r2uzWkud5xWfAxU6DDkXPDZ/
	o9/b6Ape64PNMt2rh09lsgD9nsuMj1cT8qwBvEaPC9WN/kCsIaukvAocbeamJjA==
X-Received: by 2002:a05:7022:294:20b0:19f:527d:96da with SMTP id a92af1059eb24-1b25d38771amr6259735c88.33.1794044543075;
        Sat, 07 Nov 2026 01:42:23 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a5628sm13419939c88.10.2026.11.07.01.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:42:22 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] soundwire: stream: Clean up allocated runtime resources on config failure
Date: Sat,  7 Nov 2026 18:42:18 +0900
Message-ID: <20261107094218.3952033-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103095445.81414-5-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org> <20261103095445.81414-5-lee@kernel.org>
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

Tested on a Dell Latitude 9420 (Tiger Lake, sof_sdw) on top of
soundwire next at commit afd88e7ad781. The details are in my reply to
the cover letter.

Tested-by: HyeongJun An <sammiee5311@gmail.com>
