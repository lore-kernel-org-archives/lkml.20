Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CEA3B6347
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073735; cv=none; b=HMQ2u13Ip/zk1i+09yWzB92WIWjf+pyozCtb/YrH4x2IYcCbXavQn8p2NWigvmsr5lqz1qi7u0I/Um7lKoQiXTMOtqIAVWPxMcGPa5G5Uxiy5JY/eWcXYgh4W5er8xe5MpKTKPqXlLESO7C/J8pbxJqGsA1s4yeolbuFrpzfjGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073735; c=relaxed/simple;
	bh=t6ppwnoW/+SGU7+SZTpQCy0ZyrHu7AGE6vmt1IJD2Xk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kE8O9idciA03PhQgbKzp3dF2Hyz7AsvTpfRoR1VLQyDS4nkXES/vNseBGiMzpWHYkCkCJjHtieKKBFowOrBsB1mPn6Yxo+UelPZ3Tf7RZjThQi5oDQBODPDWPXmWSBrII/YOcSShyMbcoFRood8pT+hHJ7YBKkLTnLNVKhn6WIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Vp+7ZKLl; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Vp+7ZKLl"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7fccd4c3f36so178904a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789073730; x=1789678530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/R1OOuoA7A615cqKW89RYxj2atLZSBY/Ou5CD1Turw=;
        b=Vp+7ZKLls41ZsActN33B+Ko9uzXa5TmRUtTWkEuC65XqHFmTroSDd4Q32h22Eu3lYN
         gEyR64HkUMPmN2/MDwWfLwSS1+TskHgIHH++hUeGn3rbPLcHGku1OECfjpSY6woYvlf5
         kiYSXuh69eG+Q8R9PjFXyg6FW9ETbPrtwR+/WOt5+vbHKu1b8UPWV4Ruq/FUfpI25AZy
         58camd0NXcgJmJdpcaHNPkv4PrQEdW5UrAO6LsND17A90OIIVG9l+aNj1Fh9zGxui5Uq
         ZXS5bG0Ef5W8AqQh7zsBA4chfq8Isp7P79IYyG4QxyQwR2bXmwSVmvawk7t+vd6Q5m2W
         k/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073730; x=1789678530;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/R1OOuoA7A615cqKW89RYxj2atLZSBY/Ou5CD1Turw=;
        b=WAHPx20HV0HOSNIqZYxuX0kN0U+ac6TyKhQQSWw725jIpCBkMnKz25FSXSJBa36oVv
         zNHUAczpuagfIrsFTthqJIp3r/fgr+/9V1eM0t4uZ+yEqlbicte+p4PgYxpG6oVKQm0S
         eprnf6WHHbtXVnSH+2XT5nrByZmkvyj1rcKbvw8PewYSja7gHwERXI46GH7UbIixYQHK
         mrFAf2ouwNOXMy8qkd2RmIm5bNXevFhUKG3pDx86RFD+z7WHUd2RFM0jRmSIEEmqC9pr
         iBbGikCw9HS7ryf7wb8g2y7I7ToAtO4t8/gyj17FIFJGNFSh9hacDjWumxlkUheYOh+H
         3mJw==
X-Forwarded-Encrypted: i=1; AKwUvBx1NsOAJDTe2wj4wvs32rVoL8he1rjbVY7GhZMHmEEBMWXkkzRShWD5OBIgGEwGdVZm4sto3BErPA2VciI=@vger.kernel.org
X-Gm-Message-State: AFuF++mKYq1LufnqC3Z6B40NBa6idkCtk+ST3mI2g+raG+ssfARlQ4ui
	i4JweWkseQJPhMeq8rUe22J5n3M70YuseXyX+uKcb9+fptmqoWoTUKgywZouxgJsjo0=
X-Gm-Gg: AYBFou04C1qMvvmrqPIva0giQk5pmlBoN7DZzWYKoDQzYqAmcz00/fVE1y2fTmpfsT6
	U8vgp2Jta+INylFcrfUDBH9t8Cw2aseK4aZwxWq7LCSryKdH5avLCR/EPEuGMjUwjV3pwexu3Rp
	uMOTe53G4qap4lBRiGPASu3OeWbSZPArSN4nBoS6CJZ1KdQsajR2TV/DuDBxCejWJZNWHOn3rhf
	Vo9ZVQriAsoQXpc1BxMQElTdBjvl7eTtb86vjKE2nD0+20ONbpi3bkrKr5Cu6GxUoIZJNcX8vv3
	m1dJImF7o08oaTz5+/yGL2WBkXhHUURuyHRB4p9+e7BvlXsfhwcB9idc15uA4M0GmOPq0qIkNty
	Q/mMnXRac/IHf/MiI5/CfBoH+bH4EOCT9ZzEDO6Z/n3ZnZjBWczMbjHVeqx0cdfk71a8+G9T8vo
	XI9s7c8+xQha3NvmeM2opC5/luAtz4n+pFBkgM/nJrebp06AbjebNTjIjlQrY7qwtCAV5M3TAO2
	HD1X7k6IP1oLm2xCxrgTYIz2XW1LhTL9PnjZ63Exb8oze6wyMQ=
X-Received: by 2002:a05:6830:2690:b0:7e6:d384:459e with SMTP id 46e09a7af769-803fdfc94ffmr847414a34.3.1789073730048;
        Thu, 10 Sep 2026 13:55:30 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60fe54asm635779a34.15.2026.09.10.13.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:55:29 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Stian Halseth <stian@itx.no>
Cc: linux-block@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, andreas@gaisler.com, davem@davemloft.net, 
 glaubitz@physik.fu-berlin.de, regressions@lists.linux.dev
In-Reply-To: <20260901173947.3292110-1-stian@itx.no>
References: <20260901173947.3292110-1-stian@itx.no>
Subject: Re: [PATCH 0/2] sunvdc: fix silent data loss under LDC congestion
Message-Id: <178907372879.484803.7974471214841698578.b4-ty@b4>
Date: Thu, 10 Sep 2026 14:55:28 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 01 Sep 2026 19:39:44 +0200, Stian Halseth wrote:
> Since commit a11f6ca9aef9 ("sunvdc: Do not spin in an infinite loop
> when vio_ldc_send() returns EAGAIN"), Linux guests in LDOMs see
> occasional spurious write failures that manifest as filesystem
> corruption. The failure signature is:
> 
>     sunvdc: vdc_tx_trigger() failure, err=-11
>     I/O error, dev vdiskc, sector ... op 0x1:(WRITE) ...
>     vdiskc: writeback error on inode ...
> 
> [...]

Applied, thanks!

[1/2] sunvdc: unmap LDC cookies when the descriptor send fails
      commit: 0c6da21fa35e03fc74f09895433ccd6d4a9c3530
[2/2] sunvdc: fix -EIO issue due to lack of retries
      commit: 5067d4ba713961d8ccea1e06cd4c453793f3121e

Best regards,
-- 
Jens Axboe



