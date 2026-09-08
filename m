Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735CD54B1BA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884338; cv=none; b=jYSGBx6BPm7xs6BP+HRs6rvi/po+dxkfw116ZeO9TLyZKYtbQbYRY1OuqU/fuN9rDCQlvCXWn5wG0AIZFV5GhhCkZP5eEyOZLC2BztUSyCeub7yAznl/g0uaaHKYzfUZrEUN/ikeEsbFE95LgxBUJ4uxzEAlyT7C3ZELo6cLinA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884338; c=relaxed/simple;
	bh=ifCyZAyFto6dLGDgB6EevI8Do76Nk1nDkdhhmAqwOfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4wqDDoE+CZN1r9kGGIGUb54RRfYXzQj2DTpAHgCF3N4QIkTSRKjV3QMxYHJcSOd7CG4FgTOw4soWgQCOO6pGP82X+jXD7TtVWae13o9O2BhFpbMwflVeLNflOYJqdDMt+30UgY7YY7qedbGSAmfhZ+wWod5ScM3SFTLr7xwoxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbufqICL; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbufqICL"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso4590467a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788884336; x=1789489136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+Pq7zJZq76gvOX7Rgxjpwg/vc2noCS33nr+Em8sLDCA=;
        b=mbufqICLSNmFS20OQRdrZNmaN+LZ20bQcP//QvJr2S8EJJ8iJ6zedZ/J6+XlbVg708
         WG9CtoerxQSKfrzucvc7mz39HvjfvpWtAgE4RM5M3AOyKR7QFroK3Fhmoqr12oF85ne6
         mfl5HU8TtKSRLEkWVtBP8zWMsE91IeC4/DWiGdvQDqdHCznYHgvHT02AhH6xjQsaEHf6
         hsxxzhZ6SpucvZ+MTKwkjG0E3cJIN8TKby8iu+zViVWRieeHT9QS42xrWn7Ny6do4d46
         fU6XXKlW3433jsTEaDEqLCcBbZdAiQO1WaKD6WTGXIusSI0NGxbelBSlIQUOo5+2BlSV
         17uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884336; x=1789489136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Pq7zJZq76gvOX7Rgxjpwg/vc2noCS33nr+Em8sLDCA=;
        b=cUjeRCjMxf/6f0M8jf3Fwabdz2aw2PTdzeOxkq5aEt6gdocf4JcKZQOIiAU1jBhP7E
         XUDDIa+8chZr8pnQyzZVk+tlf2W/ojFHdWtKyEwMvB690ff8nIaknSn7QK3ThmbjFrIQ
         ZamEnakozRciFJG7ugtyd0YJEJW6IlrZobvdfcC7TyW7IjVPZ/issnMNqz7Us1zbr3SI
         7fcxV+fAyph3Mbj++R0JoAv+xXk2hTAqnhwR0FruweZZZSd91YFwAsKoU/rl4GpsLZSh
         TfRUT2us3/wj6jVoPa61/VdgjZL12NaXltiNIkcvDCT7e/doV+O12hxc3mL2/8qetVSQ
         1AoA==
X-Forwarded-Encrypted: i=1; AKwUvBwFMyogt5sxZktTN40vu1fn13mz4ZY4PxrVOTl+/YN849DzPuEwbRHRJ9p8X2wicgB0NdtdSKKEBe9q7uY=@vger.kernel.org
X-Gm-Message-State: AFuF++kcxLQkaOE3SpY8M1X6s+2eKclUw5GRWvhhG5oEgOzlYGemq6ic
	MWMwKzQnbsmLg9Q0ySyuIst7qtCqJlN7lWj97WEwYzz9hTuCj167x63RmcY4Cw==
X-Gm-Gg: AYBFou10eBqwpYno0Un6kn6xoqE5HAosBSf2UOe5RAXIz+bcYcER3U0IjSkQVLkfAU/
	Zrt3PdmzWUdiYIczJc5LSvhONHNCc/txzhRL74tr0YK1YAPrT+ieZo00gFyRJTbwt8ux+/epX+T
	7P9FXe8DCtQ7STY3aFQuwRU5NgMZQ6DApjf3+EjPxDnK5Y7BihDow1VSzRI7owF3VUvEig8Eknc
	ooxyQY5+IGFz3hagm/64tuqs/FdHA61rUe6mXKu2UZk/lJNvonMp6osIDhCqzEjmeWd9GO9/BrR
	WWdfye6JEIWTUKB4rdIpDqpP+j7FWqvV0PWasPQMzMkB8rcrUHdQFzlRMz0KlhBIDTx6VeIOOAw
	bblbpAZkmw9NCpo2BxoBbALSzVuLQOqhuo6tI/WX4aMN59CNmbO4QkLH/SMH7BbdED2AcVI/Uxo
	i9ElvP4nt4or76FG5xkDao075G67AwcRYirHQIs64PenYQSytLLVOY76ahotvgI46SsbIupP2SP
	Q==
X-Received: by 2002:a17:90b:4c44:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-39b261cdb38mr42745655a91.13.1788884335483;
        Tue, 08 Sep 2026 09:18:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm27316717a91.8.2026.09.08.09.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:18:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:18:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arie Miller <renari@arimil.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (asus_rog_ryujin) Validate HID report lengths
Message-ID: <20350cd2-a3cc-4647-b3c9-c1ea498dc26d@roeck-us.net>
References: <20260904022129.97896-1-renari@arimil.com>
 <20260904022129.97896-2-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904022129.97896-2-renari@arimil.com>

On Thu, Sep 03, 2026 at 10:21:28PM -0400, Arie Miller wrote:
> rog_ryujin_raw_event() parses response headers and payload fields without
> first checking that they are present in the received report. A short report
> can therefore make the driver consume uninitialized bytes from the HID
> transport buffer and expose them as sensor values through sysfs.
> 
> Validate the response header and the fields used by each response type
> before parsing them.
> 
> Fixes: ed3e03790c5c ("hwmon: Add driver for ASUS ROG RYUJIN II 360 AIO cooler")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-hwmon/20260812104617.858D01F000E9@smtp.kernel.org/
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>

Applied.

Thanks,
Guenter
