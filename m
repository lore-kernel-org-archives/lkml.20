Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B7C3AFCE4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882452; cv=none; b=tmLY2mPOflWm3ieNOnxmd2f2FHjdTzVhy8dKT2zlmoOg7caCJu1WU+VyRCXjXM+2ID9/HTUrhqO5BAqbC+xVrVnvRnSzYVYGDs1+rWTIAiAyUkP08Tf7WPhByRpzj5YODMM8/idM61qHvexqqzcySwhvSOpiPuV05ybMH9j5m4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882452; c=relaxed/simple;
	bh=EHv62jhll6vjCk7xDTGv3L9j7vvvleMv+b8f2f75tno=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C1ga25aJN2DkTuAOxoNybbVp7Ddc3bHTcUTSUQjBiuj9w0QxRFqtDaSsdAgFbQyhm6wDBzRtyVAEf/1CSVQpvSrW3725WdPyLkPcr0NwYiibJnuNXxwvln6Czh/FhAKKqa4gx37FVF9LRaWaD3AJZg0ySrg263bVpdP7QjgIHHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IA0rxXZr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IA0rxXZr"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so15938335e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791882449; x=1792487249; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHv62jhll6vjCk7xDTGv3L9j7vvvleMv+b8f2f75tno=;
        b=IA0rxXZrTn3ItzYPM9XuFSeYBGOdgkRSe+ia45yNDYvFQ39P955oiKskFp5M5a+yQw
         g1v9G3yprf4W274N3nUS3Sl5gnNeMbVqBFElQpQlKClRYswdep09DwzmTLWgRxTGgpzp
         kiFrEibbRZtqbx1XUHAPsRQnjYX+K9sfx0Ou9LEVBbDlk+/ZIo4osL9c5QcftjnN/JqG
         bV9znXUe7LifrTq+oUzZ8F8XE2aO6KNFTJ49exrJDD6Tfo62kRYutmKhGwvg3K6SfuMA
         WK+1jMdi05M6lnmoI6xIllT0JC74FoLVF/8aZ6TPQ2A7fZWcWW1XqZZuOjl/99XX3gWl
         85+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882449; x=1792487249;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHv62jhll6vjCk7xDTGv3L9j7vvvleMv+b8f2f75tno=;
        b=HDvMDcUCE+QU6aLzocXWasraYhEQ3f4L3Vo5e1l0bAzDNt1y2olG9eRD35C21x74ym
         y5TKFqktWCGd/4u5uA6n42rRUxW9lJ5d+KyGxuvwA3eTwcCJc9LZuniD894w4dcGe/VJ
         lEsr1usMhGrNZuWybwjwsfIN0DFwEnoGOZvZ3amI0HIfAYRPwtMw8cZGvUjBMZhTSfhz
         ZiUd1s5az1TWzUKHideK9tCJflevRgYDCSTmVgcS7WeMg+pAuPdBp0kcStxpLFRvb8ap
         IUL9TX1kqm27FQf3jkmWe8FEv1AbasbbaTVaYcSRJGVTXthnFOBt1HDFd79BgZDmY+ad
         +fNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzy+pQoTIsaY/sMxYKEd0JwKOYlRzbaauBwYVwVGuX6fvwulcAlS/2Oxnt5tFSSSrdXzgGLl61DcEHlnzU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuT+eyeEFIy4nDUx2c9qCZJWcG1KpXDmhwD0x/q97gJpeuak5F
	b9+B1tyxYzl7s/tNW8PM1p+nMr483M7pG+39UYxBONUvE9M35mzPUKYC
X-Gm-Gg: AYBFou2AnSWs7rHoXGq9VfDOGHhwAY6OUkAbGs01k9EdQcGWTF8PkEw8uA7PNlnewh6
	5NMxlBZQIeNp9s2kCCBvG/XqKGMqtqqs4KQoC2GH7oHdV3l0f98Clotoj0NnMmInRkHVROH6TQU
	vz7D3z50aGbUacL4+Dh+m88vqoPiypA4Fc618rD/fKb/bxagyz7fzKtEVbKSlM1JoMd8XF1jumB
	RHupDoYTafMohKCtUR8pYY7rIc4IMlkZMmh77SeD9tITQt9nSK4x5CrZweCYKArHQzfK3Repvja
	79nVWKgH2jAJNW54dLDrLwpEuvTAs6GT3ljFxfhQGIjxkVFVwwX1F3kvd320D5KIwH8x2dL5dyI
	oA4rZ6hhjoD6UioYAP9zt/ax551C04CKFx7xE8w+ucDStgg5u7ZAxbgOIToNX/oMfrhDdOJjwZ6
	cZkDLzCiePrasleupF89PKm53dby8L9Uenk9GMCjoPXjnF/CRYiJJ0tZCc0SnVGswQr5JJOZdkg
	69gCIHn+hNfMJJogjzwaMwaiF+BeyKxRdkyHNoG2gErE75lflEYHyXHDw==
X-Received: by 2002:a05:600c:3e07:b0:4a1:a009:9724 with SMTP id 5b1f17b1804b1-4a1a00997f1mr85302755e9.7.1791882448859;
        Tue, 13 Oct 2026 02:07:28 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf31b83sm360478255e9.12.2026.10.13.02.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:07:28 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jason Li <jason.li@cortina-access.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 00/10] ARM: Add support for Cortina Systems CS75xx and
 Securifi Almond+
In-Reply-To: <192a1f7f-79e6-403f-9910-d46b871cae2b@app.fastmail.com>
References: <20261013-b4-cs75xx-v6-0-37e8f3969b7c@gmail.com>
 <971b67a9-7e3a-4fde-a8a1-e5a78f8d6436@kernel.org>
 <179187343453.3124451.12229499654368455627@gmail.com>
 <192a1f7f-79e6-403f-9910-d46b871cae2b@app.fastmail.com>
Date: Tue, 13 Oct 2026 12:07:25 +0300
Message-ID: <179188244540.3423842.17952003148776663506@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Tue, Oct 13, 2026, at 11:04, Arnd Bergmann wrote:
> Please just wait until all soc patches for the 7.4 merge window are
> upstream, I don't think anyone is going to look at this before
> then anyway.

Will do, I will rebase on v7.4-rc1 and send the next version after
that, with all the comments collected until then.

Thanks,
Fil

