Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4C32DEA74
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961823; cv=pass; b=V7CuxfTIMuBfkZw75JKDs0k/Q38guJGNAM9LmGAb8yQfFnarieavQBo2Yao1fzvQl14GxAzbeZInAifGNXVNKRGG9xvAMFW4c/peWBcYht/IientQ12neYbS1v2yyZOxNwqCSZT0/Zxy035i49pRh+7AXqLWFniSjAgtzc+E5Fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961823; c=relaxed/simple;
	bh=VqsakkF+fiyAxZb4saBmZgbMsuByqSA1isMXBNXFd3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqFR43X6fZN1lu+9ZzmK74KfCtaMSCbNXTbN2c+sYOydSKd+FhkT3KSwRj/ojy3+2nnNYsEnIakSxqnpmPeacI6QZ7bh9a1dlsBf5z9W44mUHgXy4pCwwP5ZND3njAar6OHewrTo4eB/3GJ+H3IZ1BDBAZD3xe63qMJ03epf128=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8gLYag4; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8gLYag4"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-48e2d5a69c4so794695fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790961815; cv=none;
        d=google.com; s=arc-20260327;
        b=b6z9noFWLZ2Gy3ux7DjSnUAo1iMIc7u1JIhOLTmBH98rktmR77OYNENKlsXtcmVTnD
         3WPYFEHrbAuUBRA+YaVnacRH7auWXKgppeON9rK/Dx45KxmTxZ6CaNXt+GZYiqIi6bf4
         D4exOo/kSW4pJ/SBR+JKL44dgriIaZtoV82VqkDpHm8PymJJgfC/HFBpvj26PEoQTzDF
         9k7/vrzyaMwXbjRIpQCXSOeklO3heeoK8Xmp/aZSKBV5dZlaRw4DuAU/9gU2Ky6LHEPC
         VlDYOz4OvlSHzwXfC8LOxlhtpIaVL77ENlG/SBYrGRFuv1QJpvzYmDfSs+bdiiveOB07
         umCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VqsakkF+fiyAxZb4saBmZgbMsuByqSA1isMXBNXFd3A=;
        fh=cN396lpvliGnqEzym2YTIOgVbQ13TXOQ93BfP35lH6s=;
        b=aAIIxzaDQcQRiPj+qJbbuK/87+RX7MRY4SRAoUJNK/crWAxEv2Qu/iuXfvKqsFVLZq
         ecxnG3ScFcIcM63k/EZ5YY7NLRUjczef4fkxY756ujxXZ1hkI00IjshsqLtqbfqN/dSa
         tbAyAXH6HeaKWCbEFXYwanCgetWkodrXznqgGimv0ipn1WyXXuLHdwzcN0H8ucBqBOqt
         bt+WUOpIa2cwppC4SuU/qghA5r33yE7tohSmfmYLSBuGkYLn0F5Fr6fkxf7zeBxI6k0+
         SjkOaXjrO/Vxqe2FNxiq6/FC2AS4RbkwWdA347SX09avbAQxne154X/KfHRK1+OOXHOd
         PV9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961815; x=1791566615; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqsakkF+fiyAxZb4saBmZgbMsuByqSA1isMXBNXFd3A=;
        b=E8gLYag4dZCzvI+Uf/NbVF420DDHqjbqefxKp25f/qJg4wb1IlO8RD8F7e8R5kQUVC
         0jHKcdbW26iDzh0Nd9XwQiO1zpb2fo1m0qokrf1V1JyVyUMfxNkPVZIHWm1034qXvQO8
         Br565nvphwmOuhmEFPE1+MFVnk0xSa2Z/8/hXDN77QYReAziyLq75Zdgz9l1K9TIFlnf
         tHaUa0EHgKKPRNDYQKiS9k8c80JTZp/XaRFbPtNMiqngXs6iuS9bNEbV1CmLJ4RbUGfC
         BXQoV44bfZdt5QJFCM3uo+EWuJ0Uz3RLhza9MXfvvLhw8F109iQiisjcjGGX2SbNESR6
         SeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961815; x=1791566615;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VqsakkF+fiyAxZb4saBmZgbMsuByqSA1isMXBNXFd3A=;
        b=iJVGOZTXXC9SeBGXzMx/GR0EP5LfhjPAEwanTXfutbN/yaCk1dznYOTnRKmdTtlhTO
         MaPAVQ/m2F/ynQhd3zkqlJPYbc6TOxobLnP3Bp4+9/1UaAXoiGP4R7/1rac4fZd9wVv2
         OksTJD90qneG5t1OylK8rH7LNUorVEyjQkx6c2HgXshobTrTSUV5BQ090uv944ljquyC
         hkDgMWMuqrq0ZupPBVTUItK80u11tdV7Jj7M83YSsIp0L+rG0HNb5y1G6uJHjLe4oTuI
         Dkh/19nnUL0Y3JU39EPdLBQJMXjyT2tdnukohBNwBaTEy8jZDNSgMcFfq3k9rMDaEnBi
         R7aQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCcpMWOyRRwv8+vPKd8BryQucqFD3wWC/AhAp8dtqQcVnCFWKKnTiTL0klkMfpclUo/pBiPVdr3dsVfNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhOGkNEBNno355/0I5EqLbI0S4oZ2vQ7llae+NPwBLD0quiSfA
	jYTe1vwr5BUVs5BFi0ZSmfhyvslllr9Xa3AJ1nEwIYmIzRglSJ20XcjT92p3I84P06BSp2ZiidH
	goxoggSKR3u0T59shp3jL6piEsbjErWg=
X-Gm-Gg: AYBFou3R1wCxa5tg5sAtHHDXtb1eYazfuT9JSqCLWtUCiPdqiDjVmebpdX+wbmUC9qZ
	1Bp5Pk4GnNAP65DnwROV5wxRVK/YrvjKUCrKtL5qAUokLvmNXwm0QpuTS1k0Yt+rbKpkSlPnkCl
	xneFiAQb4+SWSD1/Oc7Ajma72C029Q/ltQjubLNid32U9RlX413EaK7XWmH1OboleGMMPgDxVN/
	REfRWFllCpN+G+WvpvGOFYOpBWUmuWm4qwedpEzYy99mvp3wfMOKrtmPo6INn46cMU32pybTFNy
	mZ+RKcFo5T7DBcLyQ8FtIwCLhg5ulg/C4W8hcP+jMPS03RRQ1ijl4KeCIk9+BAjPXnk=
X-Received: by 2002:a05:6870:e18e:b0:49d:d850:8170 with SMTP id
 586e51a60fabf-49e3a8c248cmr24800fac.23.1790961815496; Fri, 02 Oct 2026
 10:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com> <20261002153302.5c64819d@jic23-hlaptop>
In-Reply-To: <20261002153302.5c64819d@jic23-hlaptop>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Fri, 2 Oct 2026 20:23:23 +0300
X-Gm-Features: AclHuK-al5mseWXmh0Z-6X6KwSRpq7Wu9lvhjorTUxxTKLXGZtC6BdvJZuUovys
Message-ID: <CANpqX3YLq5ckiwjaS19YCVknmz7pRsZXw_f1hht0eWwxn-3s-w@mail.gmail.com>
Subject: Re: [PATCH 0/3] staging: iio: accel: adis16203: fix axis mapping and cleanups
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, joshua.crofts1@gmail.com, error27@gmail.com, 
	narcisaanamaria12@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

My apologies for the noise.

Thank you for pointing this out. I will drop these patches and ensure
I base all my work on linux-next.

Best regards,
Abdelnasser
