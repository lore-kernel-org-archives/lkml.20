Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647E74749C0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255973; cv=none; b=XT5eo039uRjyBbbwOgN7c5+YV2dQ4V33eak2YWo3q2qGXq/XsEPhECMKOeSCTvnZ+EeFVe//34lkbG2QUSDr+wWYUsBkb01bcWdkFAdKWZN72C0fM+Fy5TzPZ7NJWVeqRANFeEIfziEWJ7cPeXPmVlsrn6DO3+DFZo1jbpPP1Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255973; c=relaxed/simple;
	bh=Hk/Dt2k01tdiGA5+qEU3xv0Qf6fMEQqec9bNw5PVAdc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YYVnPt68EUeNTy+u8Dv7mFIh8J4br10OSKz+trpBu4kKrhE6Pnj9VUibMW+eqi5c2IjIHqQis9dvuM0Q0TovMOp2/FTB6g7klzwHlhvi2jXIwMu/D2Cqiks1vtSl8d92IYYbHYX61YhzBOCnEawWF3Vy6xZJBgn3Fyt1S8jG+gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUr+OGQq; arc=none smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUr+OGQq"
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-482f6351832so1271619f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790255970; x=1790860770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZltodKwVC/1L3oIflvyPLA+UFOrcHNlQS3o0eumbalY=;
        b=DUr+OGQqke8is/gL/fzwJHu8yzI8YygZraZCvtPfCFZclLPijTp3PRyULpvQQI4y24
         kCmRe+QCMVq1hmFQUo2rxVHzze6/yuzGq7eKIVuNr8fqmMlEd34nlEtElWBMQmziMQce
         2dwqQuiMIvgO2g/1TZBZEEoiPCaPHThieud+/8D1k5z3+WxzBjJ/+oGOqnqMtakmZLlf
         VTI4AD7OeVCtfbOVd+fqjHF1KFjWJOhWrnhFdV3OkWtBZzsAm8YQlLYmN/x9665vro80
         Pvz3mfbPgrh7V0xyrMDbCcs3Q3emQVCbXsHSAjcva4VLLuy1npNFZKT8QL3UL5iey2Qe
         WBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255970; x=1790860770;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZltodKwVC/1L3oIflvyPLA+UFOrcHNlQS3o0eumbalY=;
        b=YNC1Q5Zl58IeZJ2Ak/JINKb42Ogce1jb+b3JL2/W3d49GJi2q7cz1vRct0iPh1m9Z8
         RpgY7eA+spkIl5mMsWKJDE3ZBPXd61/YQ2JXing9Ul/oppoH3yWseRgnGRb1H56gckHl
         m1OB+K7YwkJJo+HIwibL1RouHRYpe+rQkL6/F6VGDD5Alodf5truZn8OBGY54jzxZXfl
         +2b72kfODQD4wcsGWOevRc27qYxJ+/1IISZ02GU2YNUf+LoiKxNXodjbRRkY/N1ofwSn
         hQSIclyqIlCj2bpRJt1yke7BQEPjwxmPE9ImVlvkcQy6KRrATfVEDMyQvjjtNz8TE2Ly
         IhAg==
X-Forwarded-Encrypted: i=1; AKwUvByx+ltuUJ8ja9bNJZLEH4EyttZO3qM/cXG8ML0yYr39ku/UXYL0/U5UU1bIHpQvgg/ZFoRkRoywHSSYIdg=@vger.kernel.org
X-Gm-Message-State: AFuF++kMVCFHiwHUtJdUsEZWbFWBlgcABnQP1oLMBVm1oJvKMwehsQ6o
	0COmrRhCzB0LCQDeWk9WnYeL1iF9NbdhmijNve0WEhF7Vb9N6CiKVRE1
X-Gm-Gg: AYBFou2blWGpAAzXTgNU3OUrloU9LNBf1QRCIuWMeoWLrDKGEcJ5J805j33HwDnX2zW
	UBuISeALqEg36lCjreTKybPFAwAGBR3Fxg38deLuFXshWiGImh64kOyf1AXM9LNumslvDvXq/vC
	POlPz2V4FXjJxJm0jMeg9RABk/okjcLpn7M7yptDIY0CN010v2ULDhFfevRuwXSW2ZrkD9w4Soo
	KRIGey+vMaeQ2VKimHXqt5h02mC54g1QWkrzl+74IUy9MHgxq6iQ/zs+GGJlCzBHOpzHTUORLyZ
	7zNVSyZJEF2+gyNsbqqv31pc1l+2tngr86GeSez11ktAwiCAWrUNGh2TaaF+znV4H0YN3RY36UF
	bOpInoZ5isnVYhACj4RI8ayx9i2oelp3FHp44MFXDBvKaYA37dGLC2VCnC6o1sF4DZSViYvU7Re
	z/4v5yiYT1/colRzg9t5Q4oTC9tYl7bHoGz5liD83d4mL623D53rzoDT8oBE+cyELtcsixqZq5L
	m4n0P0wJnBycPbUHOT/TUI84j93+NzLQ1nf2ZBLeY5DIPLjXqSwsSfQxpg6FEVBXEk2ZgVm4CDY
	2lXebs/UcuMOVFtyn/0PADaVzcIFZmHKzrRL0L24aaJGGTB+TZRmhSlMBhB3QtT799Bwp+SXAks
	ZjjnKnlSJted39+QL9gZde/V4PnvOCSLDPgzS6hYmDa4feaWfz+KQ3gIYmkYCGpgZOfzTGjlUFF
	k2hbaX
X-Received: by 2002:a05:6000:610:b0:488:60ed:a359 with SMTP id ffacd0b85a97d-4887174be77mr4666700f8f.33.1790255970289;
        Thu, 24 Sep 2026 06:19:30 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868486408sm13384846f8f.9.2026.09.24.06.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:19:30 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:19:29 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Ariana Lazar <ariana.lazar@microchip.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v8 2/5] iio: dac: mcp47feb02: protect EEPROM store
 sequence with mutex
Message-ID: <20260924151929.000008ec@gmail.com>
In-Reply-To: <20260924-mcp47feb02_refactor-v8-2-17dc2ce3485e@microchip.com>
References: <20260924-mcp47feb02_refactor-v8-0-17dc2ce3485e@microchip.com>
	<20260924-mcp47feb02_refactor-v8-2-17dc2ce3485e@microchip.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Sep 2026 15:59:20 +0300
Ariana Lazar <ariana.lazar@microchip.com> wrote:

> Move the mutex lock into store_eeprom_store() to prevent race conditions
> when reading volatile registers and writing them to the EEPROM.
> 
> Fixes: bf394cc80369 ("iio: dac: adding support for Microchip MCP47FEB02")
> Closes: https://lore.kernel.org/all/20260819125128.970911F000E9@smtp.kernel.org/
> Signed-off-by: Ariana Lazar <ariana.lazar@microchip.com>
> ---

You're missing a Reported-by tag for Sashiko, but perhaps Jonathan can
add it when applying.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
