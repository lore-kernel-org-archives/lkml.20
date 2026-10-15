Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B744C5208D9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070719; cv=none; b=hIHcKSUA3/LFOsFRx66w6nxgkuABWhUCrwibyNXjkM9p5Uj6TlmPkiWxIpo4GD40u6CBzUfh6mv2veAr/F3l3wTqLKGdHvL/Uw6ypy1b9rL7U0lAQbUT0rUkZlUsJVesfHOQX+2882ODaVFjTqsdXVcuObV7JAmFp2E5XrJ6Zo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070719; c=relaxed/simple;
	bh=H3zCP5H13vvVFVkfSQiIjCtmW1MwjHaJtfgXUw5dX60=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i8CmENohVB67GC0q3KALvmlpQo/ib1cQ2lBIPWOlFloMTLHy18JrNc8qG7JT/3vl8LQnR+th11KCYN47DFWnIPP1jDc8+eWDrZstv8GrwlZC0shm0yz99iuRGcqmFzT7WfSvOOqoL+xdHBMmxixN4SeKK3Lwt7vfwXupCI7P0Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBae+0GZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBae+0GZ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4649b35bso424410f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792070716; x=1792675516; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fatwg6Ql10eF4yUkxnXRufoS1VKiolsiumheXDiVcQ=;
        b=CBae+0GZcOGJDgIX1tHi1ZOI04z/UBOJD39qMdwmRbrcq971OYnfa8TT8VgnRoH1ag
         OJqediBSk9PNcNxf82i4Uk7Zra5yHVcpOMB9B2+FzQ0UgYNkiRTKX+9nNikkJPS0/UAk
         JpBHp1SArlEB3B/2jjkhESnhoeXzz/Gu5MIplCvBguZV0WTQbb7OTA55xNB2ax8oQQaU
         mYOm1payuMenxSFnlQNKDiSfKGsV0u0lKAO1Kklmro69gOhrjc+8LNS+0z+ox/TwvVJr
         p2uvpktUHsQ+QpxC+NCvrNykld46qcz/pOkoi7G9l9iZo+xbvmnbmYWO1BJnuV9Bb6Uo
         FlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070716; x=1792675516;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fatwg6Ql10eF4yUkxnXRufoS1VKiolsiumheXDiVcQ=;
        b=ryVwTYRi3A3q0f6L17EL1CRrT2hNd4Ef7z5mxlwX5ZBU3oiK2j+xL/5Ld2ugjcx/YN
         Sf1sivzvToka/tPjfaHXPr0BMT1pqszAoo8Zd+UvNCm7mnpy2QTcstncuJXPtStrq+gk
         08d7c60VRFI/EtwzWaqpKkHEkOWDQPXsra1f6bhW3Z2W+pyFjN+ResswbbwoNJGozB8i
         t6fifC+GQVVNP4MULUZ6wftQa2bFBD2a854LWjAP5Og+vHgbTVHKvyOUYgFoRtLAjT8+
         ztqx2to9cgx2PtMbX5Ux6MVRySpM/GOuLRBYI3GhKh/oAvqpK25yc4h91sliPu9oNpe/
         4ekg==
X-Forwarded-Encrypted: i=1; AKwUvBwRpyhW3NCEifOR/MPO09n8bT5sFK9IRt+rrXBaJ2IwRxxxrFpoeuLdZcmlRx+AdrGTl9T+fBEgZ1w5AYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKlwaL4sgQDGyc88FEf56533UbxQ4ElDiQbAisYEdguOTnwMUl
	vTY9lxbX8ak6LGIBIffjvUwVghHiX3Jl/0q749P5Bz+XhudEMd+NFnPC
X-Gm-Gg: AYBFou31oPZws2eljlI3w8i5jqPh+2MeZhQ4Rzejt0YgIjH+i8w5E2Xhd1NSH3LmiAF
	/98sD7Tmchm45yykWu9mpt9I+vDYUGi9UERWtxpiL0POh0AB9nvewJP/wCHNWdWeGMoV9aybXHo
	2V7lGOTbv6W7wlc3qXHaAcZ8qbhZJsCGDJEa02mOtz0Xq3KaxPHJOex4iFvbmu0KpdBHHZWgAWJ
	D7+XUd3fTHNNtrMLGb8QvZmYm5yVKPJ3GveSH7N0YNkIzp/TGAW8Tm3ZNxOxA90HHPrliJktveu
	JyGTpIkj6Bw2QR9kOFLf+RYxCsaTG52Ed9SrBHaP3KxGHwUuGZS4Rpt9LiXXuyaIhHtsOBD+ATU
	dGFGkFdW0qE2cp9vL9Q6/QLZPbf2cmezzv6E3HrPKieVxebjR57XYbM+Ucaf8OzQzg9IwvBC3/B
	QN5mB1s/Xuyzf4bbRfsoy7GGP6/7PYUP/APBH4OpscNQSNw8yOcQTYsW0xavvFdyHXDh6oFpja/
	GIlrmSqy+PRXusXRxw8Tgb4l4SV3QT5ilw8aPi6fKsGrGw/bnIT0gUMnw==
X-Received: by 2002:a05:6000:4549:b0:48d:facb:5939 with SMTP id ffacd0b85a97d-48dfacb5b8fmr147377f8f.8.1792070715607;
        Thu, 15 Oct 2026 06:25:15 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de09693c7sm23470807f8f.4.2026.10.15.06.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:25:15 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>,
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 02/11] irqchip: Add Cortina Systems CS75xx peripheral
 interrupt controller
In-Reply-To: <87tsmndu0p.ffs@fw13>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
 <20261013-b4-cs75xx-s2-v3-2-181bb0d23f4c@gmail.com> <87tsmndu0p.ffs@fw13>
Date: Thu, 15 Oct 2026 16:25:06 +0300
Message-ID: <179207070645.418589.10399440167204506807@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Thu, Oct 15 2026 at 14:32, Thomas Gleixner wrote:
> On Tue, Oct 13 2026 at 09:07, Fil Dunsky via B4 Relay wrote:
>> +static int __init cs75xx_intc_init(struct device_node *np,
>> +				   struct device_node *parent)
>
> No line break required. You have 100 characters. Please fix that all
> over the place.

Done for the next version, the declaration and the calls in the init
function are on one or two lines now.

> Other than that this looks good.

Thanks for the review. The next version will come after v7.4-rc1, with
the interrupt controller as a series of its own (binding and driver),
split from the GPIO, I2C and watchdog patches.

Fil

