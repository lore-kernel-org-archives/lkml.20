Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792958211;
	b=SfDLmiWoNn7dJXYcYJAFpj+v70EOwcKCLQ4V3bMedBEUYYYWAbA2qQFzGtNHQCQQTbaP
	 31+DMci+VVq7pBFysP1VfiXNDli6pgG8hBy5csufeNWSgLGRBFnwUc0VjkzA8hLuzfYHR
	 vs3ERYl53O9toiCNSzKI0OLcL387Gt9CQv0M7m1muTbsH0LhvufNA8vqjTSpzVjOURmbO
	 2f4RV4RCkApUXXpJ9SJPGFYpbEXm5YuXTRHbG3TpdO0YmTuf7WaCXZgb35V9cxaYVTI01
	 He8lbLhiH5V6ii/oVBIRBkKm2kNFM29TD7GuEMhEe8L/4pfWbIKuJNnaXnfRzh0XwlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792958211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8E0DR5GD5b4Tk6mwwmmrVFgi2D/bQejxmkS22k9iLko=;
	b=ulH70TbH3PS6KPSH6Oj5fTKrM1y3NHq5Lg4CyH2CQdpW94Mr8d0RVdkUxnk/dECvF8da
	 Ar+6dzQzOqLtdMHgF0E0BnnfQlVH4//RnP+T2MXkpCaoslB1S8JQcLBQJ5bB2fR4qO57g
	 yMSwGhmt14ym1YLTSXm8QFkyx4np3UP173UeiMIrMhWPQkWtrolT7mP2rWHXRdtnp8MYB
	 XN3mm3yC3dmbs7f6XxwBE2il512DRfbs5Ai9c0LtheUYmOjP7jyaUbh7S1R9qgUGZAaFa
	 JHUM0jX2POjK93NxFiaNWLxDTQtOnjFqLD6AZDwDOVB2xDowLh+hXsEit9/6uriScFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=YhdKt4bL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF07F606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF07F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=YhdKt4bL
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4f48d91ba7dso1428406b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792958210; cv=none;
        d=google.com; s=arc-20260327;
        b=kO+vzc8jugE/q7CczDdpXlWOJ7lw/Ii1UEGAMmckW5JrEN06xcTvRjqXie8m+LuaZQ
         R2igxuBs8gqKn+GnZjE5F2e1/4Phe60Q5WO6dUX9euumMzD6nONpnXnNKfIWWiOHgQIp
         myv/u8qKCfJJHaIW4k3vc00IINnwqP6kKP8nF+JW6bo1MnplyYyIGJx3HUTT3fIrjfKz
         rV/7VNNmUlji4OaBRh5xpz1zZOw0C8ZshpQSdKfx6bMDtA0ky5esL/OBvetbespWpjLR
         5+aNpuzin6PQlicFulRRX3LWHlzmFWYqoDpaLQh+6i+qoDkCQfi/QL3cvBlCBBW1bnaW
         b7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8E0DR5GD5b4Tk6mwwmmrVFgi2D/bQejxmkS22k9iLko=;
        fh=ID7epbRqhT58/8hsShdYafUtQUqa+6oH3iLpDVdKLKY=;
        b=X0Fip0DmVShuYLBF6UYxowaNJDYiIeJJ2TlENns4iIpliH8EFcgQluBNvPvCUTVcGj
         kuj8zkBqQMzJLaKCSyCMRzyBhzy788cqrHNVd4PSYJ0/ADkZsyUMXbPkguqNTdPCtIr9
         O6XHlsClKB0ackCVJzjdyl9kZgJvZWLy+pOwNHlr9jird1BH0IthgueWLkQ7eX/KZKEr
         E1Z6rwIMntAqjuuI84nAPy44Dw0xR2HdUcyUuKUKEmsymi14hmpJvNVqmtFdMgu9EH4x
         nkU4EfCGiKB4qwNugdMWljXL51GD4frG6Zbtqya20wh0GxLQJ/WW9RaFPw5Rb3vd0GeV
         KMkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1792958210; x=1793563010; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8E0DR5GD5b4Tk6mwwmmrVFgi2D/bQejxmkS22k9iLko=;
        b=YhdKt4bL8v4zP1AGhP0iULi9UTrUSqvyjN5tn1ng4hnObgq3uo+Rw3NJAnKTMXTMfN
         8SpIr8XbQ3NSePAzmEbVFmBrQsrDZXZ3447Ekrh9ldaoHLXCLHhvQn6QozXDKO98FCwd
         j10UD8lVVhWIPH8wSCJrbak43Pyz3bY1thy54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792958210; x=1793563010;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8E0DR5GD5b4Tk6mwwmmrVFgi2D/bQejxmkS22k9iLko=;
        b=IcbcagK7kEczPXyl8GXfMqKfZzqIJ9x2FF5w0SaudLRebBjfOZgmwsTzicfSkEi1fz
         +VNG0PyKo6vf/SrVIgP9YEA3wAXB7QUotxJqTD5hTGfXKPWiNqIohAYrVetXok+zWwTH
         M0hSvDaZrGnYrY/ehhpo5gsDKHONioqfjn7jgB79AZ+9sdEMg41IR8iMeJ5WHXMhKyPt
         lVV1X1YEKYHegWfhJDXIcLOYtoXSFvKFOla3vobmviMSjHM6bpQTwpvfcV3r/tgujm4v
         78NaMi5dZHnRMlqL/vvgd5Aiv6PO8R5ezbY89BhJUtQIcUQm6bce6xo1DNTiXOQalkVR
         zhxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzC80RKWAFFUSc6SxIM51KT/i0E0pZLjChVdoLJrIA/RzhQflJ/F2XZ/uDxFthcQF9Chpv2Nh3v3dSRYgY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwfH2jyoxNkfeexHJa6pPvfRTZKObt1vLyH13EJO4tpXCZqjxP
	TjCqvekR/ZO6skIuGsXeiri8Ufv0xeKxVFPajbbqQrqFlabxnUxcubUvJ0i3MbahunTF/FO/s7J
	Per8YUENCv1ZdZoqSWo8NZ1fA8BPPKYPoBVql26yVXw==
X-Gm-Gg: AYBFou1BWDt3gryP3l+gAz3nf6/ilvahm0W+vvDKfPdpc0NskDJ9TGYE2VhKa4Xrdtn
	gbn1hR9F9bE/nJMoc/P1f+NomPGqKjtH/Fi2IBUGhpwV76j8ttSe2T51ozCuOVtkcFJ0B4dS9mM
	YZPFmkXlJTKWTknOxmDkZVqyXJ2fu4cvfNCPrN3FQthDNUaYYPLwDWnL7DILU6ndeHocWrM6t3y
	BAmzsVVvySBx5lDGEE+oaViYMslFv8hc43WbbRkvENK5Av+fWjeQt6knarzrzlJvafaAQT4NUEX
	w5XdNaRq5bT0gZllK/UDznkiHSv7IWWN9I7369m29RDmMCE4EyGq/B0UjZeJSbmKw4pArnXRxOV
	haPwYbclEzeAxEa+GBofwaplonLKxZi2/uH6wh8nRibky6wLP5vmgQjEBtyS10Jhe4yLoPg==
X-Received: by 2002:a05:6808:1798:b0:55b:f88d:6ebb with SMTP id
 5614622812f47-55c00353f15mr2758966b6e.54.1792958209871; Sun, 25 Oct 2026
 12:56:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021123414.25516-1-qby140326@gmail.com>
In-Reply-To: <20261021123414.25516-1-qby140326@gmail.com>
From: Chris Taraszka <chris@miget.com>
Date: Sun, 25 Oct 2026 20:56:38 +0100
X-Gm-Features: AclHuK9IdxE4OYNBcfhIKhKsiyI6PGABjPIR4Vumut9py7mbCOHZDOUuXUD2Vv0
Message-ID: <CAAcRvKPSk5FYzZGkw12cPVGkxWVGFACwRvupBDDNae7B_JwF0A@mail.gmail.com>
Subject: Re: [PATCH v13 0/7] Merge redmi-wmi into bitland-mifs-wmi
To: Mingyou Chen <qby140326@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>, 
	platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>, 
	Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org, 
	Matias Civadda <matias.civadda2342001@gmail.com>, =?UTF-8?B?6auYIOS/iuaWhw==?= <btx342@gmail.com>, 
	powerfullz <wleizc7319@gmail.com>, =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>, 
	=?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>, Rsplwe <i@rsplwe.com>, 
	Bozhen Peng <bozhenpeng93@gmail.com>, Anton Karasev <uselessfire@gmail.com>, 
	Jame Jao <jaojame6@gmail.com>, Serhiy Shliapuhin <shlyapugin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026, Mingyou Chen wrote:
> Does accept_zero_function still necessary since the driver now permits
> 0x0 function field on SET operations?

Not on the Xiaomi Book Pro 14 (TM2424). With 7/7 every SET succeeds
without it.

I tested the series on that machine (BIOS XMAPT4B0P0A0A), backported to
v7.3, together with the TM2424 entry I just posted on top of it.
Platform profiles, s2idle suspend/resume and the hotkeys, including mic
mute, work, and redmi-wmi is no longer needed.

Tested-by: Chris Taraszka <chris@miget.com>
