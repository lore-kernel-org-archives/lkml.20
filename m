Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6414349C4A9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354072; cv=none; b=J0WaATouVXBXUs96OFxUMB1qad0V9fjiuAVMe304psfWGLebJFzKYqbXVS51EaiHQeqJYHpxy+3axy1Ku3ASrDFPLUeV01ouL8S365xOg4mb+B2wRQUS+yLgCfHJAFNHPBK7eohe9MVF5qbyORCSqAc57634KZGtOzQLbP6L0tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354072; c=relaxed/simple;
	bh=8oS/0o7cbFR6d0ZNPiKRUaGlfNnV83oR76X/iueXojc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTmGupSxz2n+aYWJ+BAExIuucfRWAzMVX64bJpottVh/dsFu93vnMNeV+7xQNkxisjadJalDjqlWqHcDUIEQ0dDKmTcEB8UYSQ7yMKDoNxw2huSMUT2ahtHayTQlbrGP74yT+FPvH1VQSs0NY5npsA1uTXdZIkoCiWSHH3my5N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9/EOGjH; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9/EOGjH"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84830c774a0so1015119b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788354071; x=1788958871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J7I3yfmBz4sZhZWkBTulqc5Y1o3WUiX91xHY8kVn60w=;
        b=c9/EOGjHFydswb+mB31CPhpzj/WR4Ybsxa+lzHNHfvodVlxOSplegH1cxTM2WWy+x/
         lljWNh/islMZFKsLlk0hBL4vDs14KAZVrQuk9dp9vPsVJoyZ9KLYEv3QM+U7TuYTTgNT
         Yvba7ZeO6khEBW6Nc4+mGr5U6RQJs1eg1CD2CKA13QHmqHqpkq981IH5LTETCQ0UHkmT
         ixJG23xYRDDrwt0zJm0QOFN6zZGtKCZrl6B6BS2zSjNk2FZqDz9LBHx05Vv0+Kd3h4T5
         GvOOUTBW2OksqkzRJYTv88BRUyk+Y433kHSGmmjSUENGSGaYJ4bwRt++x9zFIo4O8n5u
         e50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354071; x=1788958871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7I3yfmBz4sZhZWkBTulqc5Y1o3WUiX91xHY8kVn60w=;
        b=W32FwenLWq7U/a6MKUoTBj7NS/tXsdRmSdfbqQyseDgPfTGMWgFLgkFg9Qr4d+wB2z
         HxEIDh9dyK+tC/Vesn9TKtkVPI2LcDh5AefzUE+hxPuH6VvMsvJmIeUuLBTbl6KVdd5k
         +4os7TghG3qTUne7PSSE/x61lmE4E0dFRVTLZ+O/tb9xYnGYFNWE00tDbhDeRL8kWg+E
         1RnkvzswzEeirgzm2sKc1jTp4eOmfetIQ8UsICwk6PxILW9e5mkoNyOb7upTYMBO13jh
         ttEfjMu6OLrF59GJxDpcoFjT6IFPAVIraopgf51+lVBnOaqNT0ZgKKsZgUFt52KG83kW
         +Dgg==
X-Forwarded-Encrypted: i=1; AKwUvBytix5yfWy1TRybg8BFqpdCUNVd/AzbykxiSpOO0oVos5t/15fCZBBrZXc6PDhkJ0BT8sRk+KuDH29xn7w=@vger.kernel.org
X-Gm-Message-State: AFuF++lrtrofo1yX/akm8GxJiZaU9v5N6sWiG0VqqKpzxV5kfgPd485R
	2qg6UQi4kN7ijDG84HvgiqYWWR7NaDyQp53qJwX7UyFf9ULWnAn1itbQ
X-Gm-Gg: AYBFou3mogae1c/pmpvV+OK+mLEBnjYyZ00RhmSjsHyhAzJz18XSmtJC7D9iV+ZnWR7
	DeL763dMrrtGsnCEEIoJdqBkPmMt3aRU30HSSNLqyKyQy6kDqlhpkSt+kUxRqMqkz3kCd6yDDe0
	mmVbhL7XpcDjyhfQIpIwP9D7dNAJ0sQ5ZO3xrB0VaZS6kSbcnbjn0u0ILLJi20S+v5tW85ffWJD
	bcDItbBe+Fbz9CM0k64U9TxrwYiS1NSt62yff72V48Fetc3BGhtRT+gQJQ4ClxprmshGhZFRKVo
	UmiMxfQEe9xcary29kGvL6MyIj6X++eMuExs16rc+FbBKhRin6OBChg5p1rXnU3QwPJJsOu+tL2
	FUdXFccv9+wN4xtDNNCyn62fNUOoiapWqznrCLV2Bjhz9q50Bf6xtsZBvH/kTrG3T6xbTyjhKmc
	7xKrfvuZo1+ctaesre6Bcn1KhwZhLqNeq/bvtY5ZR/0x7LIbifyIfP9xYWjg7qTEAtZJPc/sESK
	g==
X-Received: by 2002:a05:6a00:a90c:b0:857:727c:a1f3 with SMTP id d2e1a72fcca58-85ed4446f43mr7765503b3a.21.1788354070164;
        Wed, 02 Sep 2026 06:01:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f4140sm1333636b3a.1.2026.09.02.06.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:01:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Sep 2026 06:01:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Marius Zachmann <mail@mariuszachmann.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] hwmon: (corsair-cpro) Remove debugfs entries when probe
 fails
Message-ID: <58b477f2-ceae-4569-9227-93be3db9940f@roeck-us.net>
References: <20260828061949.3151191-1-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828061949.3151191-1-lilinmao@kylinos.cn>

On Fri, Aug 28, 2026 at 02:19:49PM +0800, Linmao Li wrote:
> ccp_debugfs_init() registers debugfs files whose private data is the devm
> allocated ccp.  If hwmon_device_register_with_info() fails right after it,
> ccp_probe() returns without removing them: the HID core then frees ccp,
> and ccp_remove() is not called for a failed probe, so the files stay
> behind.  Reading one of them dereferences the freed pointer.
> 
> Remove the debugfs entries on that error path.  debugfs_remove_recursive()
> waits for readers already inside the show callbacks, so ccp is no longer
> reachable through debugfs by the time probe returns.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-hwmon/20260708031612.BD7E61F000E9@smtp.kernel.org/
> Fixes: 5997eb60f896 ("hwmon: (corsair-cpro) Add firmware and bootloader information")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

Applied.

Thanks,
Guenter
