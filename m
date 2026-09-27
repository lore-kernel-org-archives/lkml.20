Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BDC3EEAF2
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790531906; cv=pass; b=fki85TedNtpqe2aDXsNWBI0VDTNYg7a322K6VbiAoX+rtgrEI9Zg38ybU8Gwsh8OZF94/9l9Y7URHu9B0qeEU7kjB+DO14mOnBA31YkC5q0PYScg56x05P9QpBj+Tye894PgE5EnfrhVK7DiP1k6epmJwT1C7G2HMKa7fjMS5ZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790531906; c=relaxed/simple;
	bh=58tJxFbKkk1sOLpFFVR1wuJU8CunIqKhr3qdPmvFPJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEbV7kUUzUd//T1R9iAwpD4ngCP77+BL0LcAq1b6B5TauMeexG6LolcF2Z+O03mmoLPk9iMRPsZC2EtOoVUwQhAgufqSp5NCSWLZALSvqLEJfrJgvc/VJXwBBh0j03a7jui46X3QuLwC4dwuWjQZ0CiVKRCvTZduHyl9E4MImRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyACfRHq; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyACfRHq"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso11978045e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790531903; cv=none;
        d=google.com; s=arc-20260327;
        b=iu4RCiVJf8b5RIoqTlulEpgDtwYQZc78OdpcghrdcT/+XDpiuQFM20ZLjaMqiuXdtS
         fpJYvjhrI63kNuAu//OCnL2oyq5IMg0SS0VxS5IandrxgkLaEeeMZ69WmVlpE4oOZiDM
         vqO8KQaK0sHhsXvDzI/Kz8E54ecELyP82sYc3EGjdcvfzVx9dftO9zxdzOieiw4RRzWQ
         VWCFE1MGydtxl+Nl677c2jQjJj6LIE5qkMqI9ZonJHHb+ceiaxmukTusbEDaa0fejyB4
         DQgByXXlhGVAIxC8FTaTjYaJfYSVQiGAUqhphTfTtfYG/b46cQCUH3JErSLEnaG3ZM0q
         h88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=58tJxFbKkk1sOLpFFVR1wuJU8CunIqKhr3qdPmvFPJM=;
        fh=0+V/a7y8RJjHy3E1qC8BagZX5wlKQRV9wcmYEQucBm0=;
        b=G4MQhcL1n32u/1/06En89FyD5xKpuNwVo62f4ZDZcvHFJOtVHdPf/T9UuIqVUyrHV1
         dvYtf5FIUqBpz+qJWaa4JvYCFKuWVIbtBOcwZ8m7BxFZgsUwLtX+C09HNcevSDv2CtGi
         2D8Ng9Lhk6RAY1Pl2OayQ2hY7roaXHd5aOP1Gxow7r6cgbFlDapY/5XsOivQ0x0Wxt3U
         r8xPYE6SwxaGWUNX5XLszmPsqvtxPKdcmqbRgD6T5LftpFnOnpZNHRbYvN+teST/jtjo
         DOMBeUlRCu8Fn07qSPLvx8zxmd3YOku9TkL0pOgnbn4XbJiGSr8Zw7bts4EZG5IYYM/f
         1hCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790531903; x=1791136703; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58tJxFbKkk1sOLpFFVR1wuJU8CunIqKhr3qdPmvFPJM=;
        b=dyACfRHqswA25Mqq2a05IftLMvPfwMdQB/ifFWZL4xPxiwI7dXyQX8yjygE0rRq+JM
         6lHc3Jsv4ymUSDl1cNDAnh+WThV+htWVitQQuzz6dn5ndbL699sw20iyYk6sZt19k93u
         sIo4W6T9s06bExNpZUNIupxwWTBnW6l8B2ZQNa474gYC6xiJ8uNXwMaPOHN7j/h649DI
         l3Uf2POvxdipnHDTTcLjWoVZTR2EojaXHDa4rKQgocqzQJ1Ws/Ftkm8UQBL7g5YQkb4p
         3NSwY4V3X6s+lgSQ5Wjf4J47Oq9t7An7OEy1ChE+lIKT8kOVj6FaFHoYr+s+6EozyE4d
         jzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790531903; x=1791136703;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=58tJxFbKkk1sOLpFFVR1wuJU8CunIqKhr3qdPmvFPJM=;
        b=sDmUfeNfKxZFf/OTZCGk1nmTgRFnHp7WnPZY82hYnjHYgmMta7OPTI9mpBd026fNhU
         eIP6+JipK9hFoNosU9Dza1fugvBqT4rtMqbgdpo//vv69StEnl4s5czfugPAQkNC21yO
         avY2D6qSnjkqGfWldf2G3C/VzXy36koKuHH+t7wyt3TqLawZIwAg/JDsk8zuBx3aE3Sh
         WPpWpZlJZ0f1loBahE+OmNJRIm22OoRPIgjn+G6H581LtnG5BUYjlpf3doZoaX8fcVID
         7glDdc1CTsOqVOtJxEz2PKIYHIZIE9TEtrW1xayxEdZVQzrDd7LQrcQxEuaYSy+Vjubv
         nJag==
X-Forwarded-Encrypted: i=1; AKwUvBzRHYuJTdUUiJfvZKAgQIL/eF7cVaQjgtl2smh4Y3G/o+x9kqUQFdKLCQOZhCdpX8Vx/qzMmr8e6+oCc18=@vger.kernel.org
X-Gm-Message-State: AFuF++mAM3cl0URolvN/2ZBtVA1MQhoOMXlXrGsPKvNAOFm2l8YGnLk9
	aHISFYunJhAGPvv+sw0BEn2U53Tm2HfM1rOncrFFsW6a/kDuPPirxvcipBsL9PE68Fm+nYSL1JO
	Z/ykaWaR+GcOzjDqeRX46f255iyAAKp4=
X-Gm-Gg: AYBFou2t7pNJs9BlgMyTbICsAj0ZVf2AGkJxkTTOEkzR04e/3YS/CkzjTBSqartA1+k
	NkYPZNgf5tDDPXVWPEMQM/DcE8TAS+pm3+pCl52rjFXRPVMUxviEk03qmVfilNIXixhfgGPyeoB
	WJWLCLIv1ghaHbGJBs9IYXTExskozfFZTVwFhKDevf7gz+Pz4ncBarHv8xC1dGR8SIVTO0KQQV/
	jMHP5MU5lpMjBa89RHq3mX05A9/91CYYNloByKiHqOT9Cmo3zLYtzsUR4vO3NlVZA8PJZ2eCqeW
	K0Ba8HB7f3GWyoDJbDPQgy19rEPQ20dCEyN8FxG8TSbElr/kL96cAfnWSlfmiKERoqrPAehFJig
	Z05pC+ezUhaQ=
X-Received: by 2002:a05:600c:a4c:b0:49c:fa20:cc08 with SMTP id
 5b1f17b1804b1-49fe67060cemr197513905e9.31.1790531902934; Sun, 27 Sep 2026
 10:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927114425.442803-1-pooyan.azadparvar@gmail.com> <CADqcGB=Jfg-=UoTnFJRv=+=RoKX4LhCz7sr4TVPS7F4_xG=WhA@mail.gmail.com>
In-Reply-To: <CADqcGB=Jfg-=UoTnFJRv=+=RoKX4LhCz7sr4TVPS7F4_xG=WhA@mail.gmail.com>
From: Pooyan Azadparvar <pooyan.azadparvar@gmail.com>
Date: Sun, 27 Sep 2026 19:58:11 +0200
X-Gm-Features: AclHuK87o0NFVmvvliTRvyOdHaWVG3mXQo78bllcHq76p8p2EN535aWHnrz1FBI
Message-ID: <CANC3H+J9oRGP142sBL6BXzaiMsw_phQJZqDDAEgU6u3s4Dt21w@mail.gmail.com>
Subject: Re: [PATCH] Input: raydium_i2c_ts - validate report parameters
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Herlangga Maulani <w1zardsec@proton.me>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Muhammad,

Thanks for the review.

There is no per-packet touch count in the IRQ path; it uses
report_size / contact_size. Those values are validated by the query,
including the RM_MAX_TOUCH_NUM limit.

The resize is safe too: query happens before requesting the IRQ at
probe, or with the IRQ disabled during firmware update/resume.
disable_irq() waits for a running threaded handler to finish.

Thanks,
Pooyan
