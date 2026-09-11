Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFCB44E045
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112884; cv=pass; b=X0OkN45UkUwfe24t4x/pfaQzoUFJ7kpnV9wj6/c07asZNum4/ipUpiRwyXrTi4US18wIIEI+W+AB+l9mzroIidLMpn7iFkXUKTJowSvc/LaP2MaxWzv0XXHaVPh0WqmojXPrYwKET/X5OrqYOixyygttVKllpoeXesGHTVHKLeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112884; c=relaxed/simple;
	bh=g4LUAxw61ZG6O9pKjlfTJNUbYSvDm0/NC8AtOOiAsqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+Dw92D62w59cwJ+N3ijokX4nGU1SndLC3GOaeN8DPW7Xi2ppDo5nonLNSm4TAY8GvQMZUK8oNl2FyC8i5u/pc2aNyEFG44tcDy6PysPy06zs55qQvbMrB+hmWktO3MOa2dYJKyXChCVCmmjRE9TESLujMxRoahib/CWU7O0d0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0ko1bm2; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0ko1bm2"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-869ac301739so447906b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789112881; cv=none;
        d=google.com; s=arc-20260327;
        b=PZ75hwwBsfG2FajUR3VjTuZ7Gyy0veDQ8h4qfpvMzjbOCcV85pDhTB+GBI4rATuA4X
         RGV3kTSGfyRMAcrOJYduJjntB7MWUdHlNP6r+RzBDPSmkkMBVM2H1QoU6vc486ACBd6I
         E9Uil4J7t8YroBQiQms5iVNFppqIzP3zTISm8aB4BN95CkRkka0ydXqjsv1VeMclvoDs
         Q7OUQA8F6ZTmk3wXOzZBJKUe0WD9pQO6NtkjlJ3yArAzu2vaf0kp00+8etWGVZFGsCt3
         pbW+5n6YCK6ZojLR6aKvueQUl8OmIVKHLdR9VYTTAXGAayVpmFuP7aG5f7LrFCsBLtJE
         zL8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nAbGJK1TfivU+OKkZxPlu+JsW/mWTytutOio68a70R4=;
        fh=NIijxjS4Q7tj0cV9gd0HLGSzcirU9ieK2wmICon0Bck=;
        b=gaFqNZXduqKQUXyEBUkWnP9N9UlGUvDMAc6tFn6VV/TB/W382/ighAi904jhKbyvWe
         92iy8leuH2ksvdgpSb3M8vHsPNVOwwl6/M5QWFNY/jxhXHdf0qAQnAnjpMDD9Y98SaBe
         kdIloQ9F4luWIt0eSUeFiSY+9AjtbHh4kVXopbdZh1UE8jCJbpbazjFe9x+57FRr4u6v
         op835VF3iZxH1+8VWWz4yQ4Q0Ufh0P5gdkSw0PlVdOiQ1Htrii+FU5TToTiWbxM+yAWC
         SR/wz8ltHDh16jqvh2ohb4AakXF2NX/gD8jB03HRQ/wseUVbOP4WocwgDh5IYHUDqUA6
         PDPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789112881; x=1789717681; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAbGJK1TfivU+OKkZxPlu+JsW/mWTytutOio68a70R4=;
        b=M0ko1bm2g5BnN5scV5lXZM2Dzp5AObWEXBpYoIuEPjpf5DbjdLxxh4TM8q62ZYEcNx
         DPHvrPoMeRwLvRQTAJD6jrQD6c2rNYdoPu+9N1PuM08ZkGcLHnrCafBb2CyTYF3jo3vP
         j7pZQOBTDGqvZAFyW4bi5GazcCIDCdDj0OM7Un2INp5gxYJFRNC5W+1LnJNfO3gXSwsD
         X0vncayKdVOZyqR2LCu4d0Msnko4JxcDPhHemO4ijMrMYOPxYZ3JJ/iPntuXsQm9xMFz
         20I04ZkpvBo6+ReTYczXZyq/Xyd2HY1jf7oOfQoZyPpsYantQ7UJrUFdtuNmYG/VK8xV
         v7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789112881; x=1789717681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nAbGJK1TfivU+OKkZxPlu+JsW/mWTytutOio68a70R4=;
        b=o4azb4snadR7m8DwkQMbBqwRmywic2hroJyHn5Ra/E9JsXUyhjyqYbevejRNJXu14P
         F8KwPiHzA7+LClMn7wgmoRb0oSb+IQ2MJUoc4RpmDkAQJM04U7H2yXvb9Zh875H7YiyX
         10ixEnCmFah+cYtYqIqzORHZ45X1+Hy64c6Pi3TDvcM5AsMDRGAinnr1pKjcE82j8W4R
         GYTPFEbc81bIIGDzKgNFQBUUJMrc9Smk52ay0PVPFLpffYDruckv1FhE4lrryEtUGgb3
         TwugCJ18+ysjQSkQJwBRPayJD46LC7FzwVpdR8UtokLsVZt/B2F8BEbvK/P8KJ5LBtt7
         GtaA==
X-Forwarded-Encrypted: i=1; AKwUvBzHLdvszhdiUznjqpzGdLzi6VX/rhyxzpAQ4UXqO726+flDRCgObQtkCtbuczcUDN14xmINMqwGktJh/NE=@vger.kernel.org
X-Gm-Message-State: AFuF++kachG/DAnfhv64m6sfom7JF/IedbBL0pvnsOuTQHMwoOfQnTOA
	roHImR2nb1t8yA7sg+zJWFP9CK+pysdqaNP/01DFh8ZqIGt+Yk/AOHL5B5FBKKwPN8p1OO7Rvm4
	Ed9PJk7M8RW6wYjZ1NF8kAAvUlukYOWI=
X-Gm-Gg: AYBFou1E0C+XMwTf/qeFpmUzg+CkKmlC+/imEz6060Pjca8hd8+0UejpNg4auxG8YSq
	icWsIXmb5ySnfYwGDq+BQhorxYd6roiYJaye3ouCQzaTkz3DkJkq/zxCtrCl49qNpoOg7Qcjjkc
	1s5l839Dec92LVhPtvkKh6ubfNGFCbqrKSfFJ8us7aZe0wuD6c6EHPk/nPOu6cEFhmBLf43r1H4
	Rzj7AdFxBWxrYxuRtVBbAbIUwkL+pkxNv4oq8q2lYNa0GBw1n7+GsDHxRe08A6INH8lJXD+UNdk
	Y+73o+yalkoptc47zcHpMU/Dufc9gRVOtMHceKDG9B+KmfPW120cVWtd5c36J3U/r/aeewXkE2I
	CAUtAk5iDVIUrCmruCG9yZTwqEEDlHY0+8OkUxG7llX/B51/a2LeaneYeY5si36jxnHA=
X-Received: by 2002:a05:6a20:a103:b0:3d3:adbf:7779 with SMTP id
 adf61e73a8af0-3daed3b7ec5mr5165165637.21.1789112880724; Fri, 11 Sep 2026
 00:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
 <20260910125742.150902-12-phucduc.bui@gmail.com> <aqKwGQDkB_HruLyQ@stanley.mountain>
In-Reply-To: <aqKwGQDkB_HruLyQ@stanley.mountain>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 14:47:48 +0700
X-Gm-Features: AcwNN1U0HOa6yp6q-cu6PKO_-PEzbPG32NAKnqHP9l3WjK-sZPO65dMRXGkz238
Message-ID: <CAABR9nE+NYF23XqXCZiHaK7CXhcmVKLznB5Xz3eDr03NCM2dtQ@mail.gmail.com>
Subject: Re: [PATCH 11/13] ASoC: mediatek: mt8189: Validate sysclk frequency
To: Dan Carpenter <error27@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan


> > mtk_dai_i2s_set_sysclk() accepts zero or negative frequencies.
>                                            ^^^^^^^^^^^^^^^^^^^^
> It's unsigned int so it can't be negative.
>

You're right, thanks for catching that. I'll fix it.

Best regards,
Phuc
