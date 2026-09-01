Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535F836E460
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 22:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301016; cv=pass; b=EUiwCNEznHC0P7ypJdVabC0Lzw5H69vwBYASFn+/CLpBV3LBudD/2IN9Ev/0SPSP23fCqqtlNNE1vOffe0jVxBOwXDa8ucEaMBD36GL5HngfVKUHRoDD4YXXZRZJ1ni9+M6vDBSB06NBexr3K4KOPm8KHdEOJW9ELWGbsGPXlaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301016; c=relaxed/simple;
	bh=p22kh6WEGbuKfAaoqIlc3KXEj52IPkMy1G0NBe08JXg=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9P6uRd9bh2fZD6fZ3HcUJksyCQ1Zx8KnUJZ5lz5BYVYQ503FcG15wl190NoesYtQHiJO1MC7EnrEf1iYg+YgzjSd8fHrrQls4mIfNgwrLA8MpkM3QQNyXCEhDVIx51IvU36Z9SB6Kn0raJQ4MF6IJxuT6EGMTRJQPskHGzKjAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtIpgbNy; arc=pass smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtIpgbNy"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4b28d9537bcso294982b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788301014; cv=none;
        d=google.com; s=arc-20260327;
        b=ZJ1pJR4/fTht4Wn8GCofHdWypiAmsDKoDesfmFZEIhZTHVoDSfckBRYROaT6zIteTK
         Jqr5U7e7dN6MJ8FiD57Qp7zxvB3PL13bd0aALhi2A9A27Gdt6j7tseRn1T2dY1qq8PGF
         gqiKAoGxAV67cUBKSiOHQ6Id0SyW6W4dRa1D6UU+5Obc+hWE5RSgyEgtlLZcnyREXx9A
         I0cJHLrqm2y0LfLrfJEoswucl155HzWR9Jntc4biaFtzJ9SPNZ4u8aBWiIIpnWnzi/f1
         OJBA45OJ4mbfSA0YjJvpH75pIAF0pcAG1kp8DQ9I5S51+EbYc7H+q3KS80ya7tqsns7p
         Vhaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=p22kh6WEGbuKfAaoqIlc3KXEj52IPkMy1G0NBe08JXg=;
        fh=i4LA4GomndEORT3aobyBzAMcaZUitrpqp/iqgdE/41I=;
        b=atpsX/2j9zMHsf2IK16PBYBSYmJWGk8qPrj3xwDzzXx+K535s2kfXFqOE88SV97Avj
         G43VAqZ5LNajbGwvV2hkXZmeqfQdtxKZMbYK7mqzYIA+zz6FctJvYzxbdBYvUWUOE4C2
         7ZSDL5g6AFy4Xw3E+YvyLiuNXU+Jj7PQzk4ttB6HvwzvA3orx7xQxN2mLvWWD9jGDG+y
         Z0LBKxgL4fQGiE9rIlEMKY8E6XXaWz9bEza0aRopZqJJ2OcK7TILCTom5Is0NBBADzFA
         OVtsBlM1wC9KU7INXzgD6BpCz/mI6OU0XGfdatMPJo5KSu9/ch2Q+bi8lI0F9ryT8BxJ
         pDFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788301014; x=1788905814; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p22kh6WEGbuKfAaoqIlc3KXEj52IPkMy1G0NBe08JXg=;
        b=mtIpgbNyGtFtOkik3OhC1qgwcmEmBJcn1fhQmJQSy6f6vwJGG84wXYlkMLsz6ksUiY
         HLK/uN0mNoSpvb+W7qsD2eU7Pn88+W1I0srb+cCJap9KFB5ywPVa5EFfLejXgry2rk5q
         hy5RwVpI3mY53p8FWtgnGmZ7MaIsBW4ssio5MzFXr1VIMkO5Fi+7DP2mD/YLF8R1JqRQ
         FTrF4ZgtC6bwqTgQIbalqI8clPfQYOTmzHatG2LnRzXWdd2Zmut2jWLR0Vz+kzyhcE/m
         nJj3npGgGk4bKxLguJRbbDryC/8sFJxFMj44T1oPab9NlqSgCtH8lNDZ+xHQQalblqXz
         Dehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788301014; x=1788905814;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p22kh6WEGbuKfAaoqIlc3KXEj52IPkMy1G0NBe08JXg=;
        b=Fm7OnFAHd/9LW7XkbUf0EzN1enmgX1LNzRt2AY6uCwSqu53VxqmIs2xOEsXJHgw6g7
         Q27w4/iSgAv8qd2lBP1jU+Wz6sdtcikPcyXvxKXML7C08slCGGAJ78vSTqZaVmx2GAyk
         nyKrg8vkgfh2bsmJIn91PmX2pDY37D0PRtQbUUPM8JXyC/7QsYJo9iEUdDc3eFlrZKu8
         P4LNAqOXyn1UKR6zxipKbrn3wG9dCawCPFhUqGaoRevno0tAimdCMhPcdO9A5QmjpIv5
         KmIDpvveMTdLvlTwbqqt0ly/ev9AIwQgJywx2KVvOZBaVlEm52sjp/jA/Lqq7p/a1S4m
         o+Hg==
X-Forwarded-Encrypted: i=1; AHgh+RrTvYOtJRIxv8IX1YLMHKZ6km4K7mvQ8d3yo6ibfxPDNA+9pZVUHsYc3/q4f9DIe/ngRUeHB9LA2qsVwgU=@vger.kernel.org
X-Gm-Message-State: AFuF++k9Uf8Y/KeyVC1GSihqXKxpzW00hPTyXFdwSinXFDGPYQb1K6lN
	EZtoFve/vXQase6b6zyNC46Sg5kUoHxC/wcF/hbYoqkJt0Yx1oB2lVtVfsICuHYJpSFnJgV2W6v
	s+x0Mag8UvUqAInLYDmAPPTKAEvpGJ1Y=
X-Gm-Gg: AR+sD10KBh2R0YTcrdGeA+d4VoQugzuu2PDayS3VoczoQlrWdFKfBKhLjC4L6IQVBTi
	46WgsOsHeANruXQ9LaXE/7dsI6Wrx2HrlybzAf+F7xaxM8nro2MPeQzyodWewLF8VBr7+iRHv+2
	HL4ftuNPCRa6BEYzLNM+0B958iBnw+h7nFGi7ERliPC+esqqq/MPDYR9+M6WNF7DHh5B2r+LZCB
	LsFK0c1GoLZeAS8odGyF592XH4lvzML4dmSPDBD9vKnYWyJ68nWlz19+bRuy/NfiV7SO45Nmfub
	pPH2/N3/S/ze0gV95V4t+oOHu0GI9NdwzfP2HK+/x/HwD0PvPfup81SdC7CuzqFmZMDIvwJBHDI
	WbnvgmXLuwaad8sdQcpjk7QQ=
X-Received: by 2002:a05:6808:2205:b0:4b2:8dbf:ffd with SMTP id
 5614622812f47-4b5bed07aa5mr6265199b6e.1.1788301014213; Tue, 01 Sep 2026
 15:16:54 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:16:53 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:16:53 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ec1729f6eb60f3d29707fc3d13e247d2b072dfc8.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com> <ec1729f6eb60f3d29707fc3d13e247d2b072dfc8.1788286339.git.mauriziocasciano7@gmail.com>
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Tue, 1 Sep 2026 15:16:53 -0700
X-Gm-Features: AcwNN1WUFQ7ilhOL96JVJxn4tbEarARgcqQdd-VycQ42yfsNYLKxJGesXAWGlpk
Message-ID: <CAO7O_xifSM=Ev8WtrEyufQCD2XjgtimwpzuwJDZC+d_ExbqmzA@mail.gmail.com>
Subject: Re: [PATCH v6 01/16] media: ov8858: Extract digital gain programming
To: mchehab@kernel.org, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, bingbu.cao@amd.com, 
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net, andy@kernel.org, 
	andriy.shevchenko@intel.com, hansg@kernel.org, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch is unchanged from v5 and I accidentally omitted the review
tag provided by Andy:

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

The review was posted at:
https://lore.kernel.org/linux-media/apa3EgKdnBfKXV1m@ashevche-desk.local/

Please retain the tag when applying this patch or carrying it into a
subsequent revision.

With Best Regards,
Maurizio Casciano
