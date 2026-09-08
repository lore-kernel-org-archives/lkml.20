Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4071B57EDA3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886456; cv=none; b=FkPthuKqDnBc845xyJ4HGE1To7oNE37U13coB3fwfbcDFFERZ71HGve4smYgyJ04/UAZ/1byVDpRFzNFyZ2MWDxSfuBdIZIsYfCRCwV69iv9jjkiLuSaRe3RrjF5NiC7WIOv15ayj2GZDhBYKP/kmDMtzaYzMahpiilk/nWq3V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886456; c=relaxed/simple;
	bh=+zvphbLNB0McCKFuOXb4iajIEbzfx1NRhWMz3DmfhCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRqyJWozv2qDd4Z42sHhAVWFDgs5zQfAr4Qhw8h1nBt3xvp/OtcYsYjjuzqq0/w2jaQbTz5hlZQGmkBn/S+Xcr9ZjD+v2/HFttkgB52akKqy6HLr92PAXfubMf5RW5qk3sYhRS/sdifMFAp+Qo/KdIa9r/lLGIxDMEhVwwm+ytE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3XDfDqT; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3XDfDqT"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b2e1d7so123108b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788886454; x=1789491254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=42USzfRpMWHNvUny9NH9VrsOCHf/K5odi8eLQjb8OVc=;
        b=c3XDfDqTAKyfqvM7vFr9SeByDw2UXK1uQNPbCjt7iQJDHOb1815ZLezANhFz2XKuXx
         lUa5phBFI2yW1WEqy7Tn39bGNY6AOwhOeegWwCtyez9iROPJtQRPm+GEWfM4Qia9MQpc
         OtmtC1OJZnOg8E5zWoHZgXgfTv+HJxP9G6VlYpN7YyZlFuE53Sw1Oh/HanINjxF4QN8n
         ktJWQUrp5fm3lO3RmmT/oIQ57e6zslT7jwxzRnggHIA7Qb6BvzXSJwxXTF5oqpsvCVyK
         QNJdPwZNbjKAKu4s1YTISFjZ5Wd8dysWCbxwq4wofwkVp5fU4OxSnvcIqo/Bu6IRR0LE
         9DiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886454; x=1789491254;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42USzfRpMWHNvUny9NH9VrsOCHf/K5odi8eLQjb8OVc=;
        b=nFL+ZtOECBLVg63lFsUXoeonE0XK8DHRK1RpKBio6lbXFXh72/kfL22t6vZvC0WVeq
         NrA8YWRT4S1v4QItsUNCzbf1cvkzDIn9VshmE9avMt7bPBnAhU7N6xsBu+M9hvM24ZCR
         GqtkxroUM5v3jEeDsMoNkpcRRlik5xrwWGtWcsL1pXtQTCy6VRlJWI+y4x5UbHzhN1S5
         k0YMGPVRN3EXfefyrUACqObyZnM3kbOsJY+BLuh8QKMuJFHPKk8UDFRvusZac27TykFT
         p2rAcmRFiKGN2SgE7Mg5w3GoWO5a1NV5raIi2K+hq42oZuoa8SnBgKneDgaXEE4+EtHE
         yZ2w==
X-Forwarded-Encrypted: i=1; AKwUvBzw+ssoxWuKGmT17AsxDXBNENd9EU1kbUe/ej+KGNo5clyvlZ+h3hh7nsmUI5s/nyF0KlMpM0ywnPyQs0U=@vger.kernel.org
X-Gm-Message-State: AFuF++ljFCftUKLMUuxs7EAKYMj0SKA8FeEuvKmCuXf9Pku5lIdSWgz6
	S7seWrxW+HbCegToonXQVZJDDox4n/auMFavGWuZCxygXiQqxedZAHSr5KKmZw==
X-Gm-Gg: AYBFou0rTSpQ/kIvFgdVk9G1FWd4m69aU0lMmlQ72A9g3WOlW6H6fA3T4esvVTnZQ9f
	LyL9UdTCt5fhF+FyxZXebGyOPwsyFha1tA5BCsQbv2L5rquYY7/MQ4+yZA+W07PQ/XFZiCPKlcc
	QMATjB/SQARhb990aMFKOGyO0LsaBFJjxC29f8rGbcwu5tBmGwwDG4QBZphOTyJ2xXIeWcYB10T
	RG9qAa0MCtSYCIp+YPkvYd3iMaxZ6G1J1cRJd5rg6cQPK96YqBxfFL/4PjxLfmxVjE7WFneMrJr
	x9t6mCHc8aoplMghj58ENwjFALV6lJ+u6eaujPMHKSfXY7FMpxeUVhxufznH8FZydOiOgS2USQr
	nP+rgtZZN7DBgi1T6J215BmX5gF73QA89snh2/dJlAstF22TV5L8nzdnosAQx8gzYEu3R5TGsOz
	V7LQd+NuLWfs+I85BFnFe/udhhLE8hrWzN4ip3ic3N307X654XldPurMX/dQaUthf0+hwbR3Zoc
	Q==
X-Received: by 2002:a05:6a00:1d26:b0:847:9015:e68c with SMTP id d2e1a72fcca58-8684308e994mr707791b3a.17.1788886454468;
        Tue, 08 Sep 2026 09:54:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8614c699735sm5870409b3a.0.2026.09.08.09.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:54:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:54:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (yogafan) Update reference database and
 contributors for new models
Message-ID: <32638fb3-4f3f-4798-a166-3cf1efe0c424@roeck-us.net>
References: <20260908095009.2227661-1-sergiomelas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908095009.2227661-1-sergiomelas@gmail.com>

On Tue, Sep 08, 2026 at 11:50:09AM +0200, Sergio Melas wrote:
> Add documentation entries for the newly supported laptop models
> (Yoga 14cACN 2021, Yoga 740-15IML, and IdeaPad 3 15ALC6 Ub) in the
> master reference database table, and include the new contributor.
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
> ---
> v2: Split changes and addressed reviewer comments.

This wasn't just a split. v1 changed the code and the table contents.
This is no longer the case. This version just adds support for the new
models. With the lack of content changes, it would have been appropriate
to submit this as single patch.

What am I missing ?

Guenter

> ---
>  Documentation/hwmon/yogafan.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
> index 9ff5db5dc..5c21c50b7 100644
> --- a/Documentation/hwmon/yogafan.rst
> +++ b/Documentation/hwmon/yogafan.rst
> @@ -87,6 +87,9 @@ immediately to ensure the user knows the fan has stopped.
>  
>   MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
>   ----------------------------------------------------------------------------------------------------
> + 82N7           | Yoga 14cACN 2021   | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> + 81TD           | Yoga 740-15IML     | 0x06      | \_SB.PCI0.LPCB.EC0.FANS        |  8-bit | 100
> + 82KU           | IdeaPad 3 15ALC6 Ub| 0x06      | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
>   82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
>   80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
>   83E2           | Yoga Pro 7       | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> @@ -159,6 +162,7 @@ Contributors & DSDT Providers:
>  - **Sarbajit Sarkar** (Lenovo LOQ 15IAX9)
>  - **HinataKato** (XiaoXin Pro 13ARE 2020 - 83KF)
>  - **PenPenIsGod** (IdeaPad 3 15ALC6 - 82KU & Legion Pro 7 16AFR10H - 83RU)
> +- **wizard-28** (IdeaPad 3 15ALC6 Ub - 82KU)
>  - **unlockxiaom** (Legion Pro 7 16AFR10H - 83RU, Yoga Pro 7 14IAH10 - 83KF, ThinkCentre M80q)
>  - **Phani Pavan K** (Yoga Pro 7 14IAH10 - 83KF)
>  - **Splarkszter** (Yoga 7 16ARP8 - 83BS)
