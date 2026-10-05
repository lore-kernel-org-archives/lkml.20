Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582824CE68A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219050; cv=pass; b=X1Fw5j/a/6uhNWUFE+Ki076wew47KJVQE7M72A6FRHShUXIDpWnObiIPBJuJ4nuQkJl0A9/7VJhbtARbE6Zs3u7wn6jmKbJHPOnZxPW2mfty4vDgdJKADaklm1/EtMWZ2XRViK3bEahT9GxaaY5AzsLdTtXlxhc+8NO9U7rn250=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219050; c=relaxed/simple;
	bh=Q5bEQNNXDkZhEHk+o9hidTvXzFCLdcCycoDgksfDDBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lA8+wdObDUHP8GhskKoajgLf3huq3nPdqMckrtRHSr53G/PHBAbvB8gNLuDIGUSh0/k2njz7Dp6cLwoM192fxEzb+Hqf/KwZTOdK38JsZnyjmi5oD2PWrCDr5WjWGtuzGuKyH+FhobYHf+dSXxn/4rJzZFCf6QXd3GizmYnUnP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWvsjAzk; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWvsjAzk"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-483a66818edso878099fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791219048; cv=none;
        d=google.com; s=arc-20260327;
        b=WlBZ3F6V4C32vZQDiEG9dF5Iekp3uDQX8OiwjSFo0ltqYOCiCkRHeglGej4z3GWCOz
         army3tKUbuP3FBU10aCOTFL+3veBnAO3GWK8/xxZ4IDpwpBcm7xkuar5IjoSZS3N1DXm
         DdrRmB/jnG2/4FRFBs/tjphWZEDIkGI7mugP9R4VEYQqC0OK2jNBrOLYi1rPmTt1SfGA
         CvXdYLJZ3TKmWn0rJVn7TapiXdGhUgwVqFyIgoOo894g8FmNzwloKyKLaN9N52RfbZOB
         2vXj+HtieNnt5wU40gg1lPxmPSgfX7W6LIGjVoKPv8Lwa2jRsg6nWBAyGFEhHb47ZoZT
         nn6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q5bEQNNXDkZhEHk+o9hidTvXzFCLdcCycoDgksfDDBQ=;
        fh=e4A6kVzoYHmr+Crgl11K+31IcDhQSEooLVmR2LB6oao=;
        b=GTPrMZHnuk2RKVh8T4qbgkkuI0Ww2bM6b2O0TlYkuxpdgF531kAJhcz49ak/8lqbMt
         tLQz5LVYGR7GzzjOMJVYZ+ktlKmthyRb/0SdnZeI+7UhiO2VE8iGHbSkGwRFxBahfhX5
         T8FWNhRh191nHuhapVy227+XCTN8Ruh9llDXF9jJNOtT3slwg0QURmWeIs30SEmxsIrK
         VGLaaqjfgcgD3/RRIwxx564S08Ht9DQmzuszc+d2dRQ/T2zHlQ1iGIM6hSsTKuyng0Tg
         yZVkpIGo9v3onXl22ur6huvn35rr+wAHkcJYxCmix05LM3rufF6EYu5Iyq1PuQjSojSW
         UoVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791219048; x=1791823848; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5bEQNNXDkZhEHk+o9hidTvXzFCLdcCycoDgksfDDBQ=;
        b=SWvsjAzkyHzUhTPj4aMhCk7arhV/KxwFnHhNlgosAH9UXEazEnXp8HGRuduScSm+Xx
         FNSz63r0/H35/QH/SUUk+y7IO6sQk3arjidg5DBRH6gmN7a+uQcsn218CX+Zvw5GX2yY
         BGmY6JtchlTSTise7rnucEdbAkqLy5UqWYQiBrzYZsyb/TFoTj5dJXY4k0K+fWEbHXIw
         QF7VBe55y7WRpB2oS3A208b2ALJ4/MB2PwAgHv/pQdVsE07nNd+xoC1EM9e3UVjygNAM
         I5XeO5teEYgGEbY8EjMR0kd4B6Yo3udi2gzcP8HWcTCkQoCS21/ENGYC5Z4i1aDA+kws
         GPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791219048; x=1791823848;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q5bEQNNXDkZhEHk+o9hidTvXzFCLdcCycoDgksfDDBQ=;
        b=ruWW9s2HibB1PAsbetQLa5zGv/cOvKUP0EPu+jXMiInKHIffYgEwHqkO1x5TbBJVN7
         NaKB4XgbO1camwF1oVo+3N46XKVoHeXSNGY5q6XTx9EIOyoNKEmT4HEeMIRfwL+FN5y1
         2SSMMHCeO0/bauO/1tmOBq4KOXlWUeYEF2W7GLda0iHRo6LyFdSIjgi6vuskZoMgAnjp
         DrQxtWAz082RGiD7N02pcvHNP4AztpgX7MI755mN9Bszd6UnOF2niZfFSy3DBWYfgN5l
         UYq9aIDkZR3+t1wd7ZtkXoMiW8TNR1a+ucggCjO65ZLnGww/8vVe5akoMcuSGBciGFXa
         jWyw==
X-Forwarded-Encrypted: i=1; AKwUvBznHMqlBhveeSNaAokz0twZMrhxSJ1VaaZlRtYRZkIytZzlNGPxoWzPE4z2jlDiI7brCG0pjF+WdsYLLkQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nFwwcgNmcn9n/rdvEXjIVT8F7fk4UOe1NnmtEn+gnWwCDJuKMg
	2tbFK9l/7BUDC2vBWz+tFsRhpXSaVaFUweaSpwFIVV8/Dl3BeofPVrNMavqBE6c/ZcLmv1KCXlo
	fiTZChPrxOEASBv2Gxy9T7x7iCNr2cMY=
X-Gm-Gg: AYBFou22oZ2pAmrrfKpjr+x8EctRmVwMDMeL5RCBcwpHq/nW6FfVhtDrcSSd5dbO1R0
	Yt9aIif9NCcdzUMu6TM7pF+Ml/utylAQTgNBpKl4Hkdah9Jh7BuHwkRlfFq6U+FrVoCwZYyAted
	R+FYJr9Eep+HNXYlePWCZ7G2zGU1Qy2MVS8pqjK2sOuXhql8iVC+2i7O7ULSvN1QVt3yKjiydW7
	o328aUONHxmawlILb8KEAUdplPz9pCfxSSXh6D/GuimE08x1tPZbUoOEYMVQFvN8I/+z3Dp5BTy
	/Xdkki2D4NRYtXDy5VDdnQ26Zcylf8Ai+dFbAHZUxOFarWXzElDyr077F5rN1zPr+PO6ZRCUzV9
	GopxdxT2fPcmY
X-Received: by 2002:a05:6808:1795:b0:4e8:2150:299 with SMTP id
 5614622812f47-4f679fe2a10mr7854866b6e.23.1791219047967; Mon, 05 Oct 2026
 09:50:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004165132.4313-1-franzelfranzel@gmail.com> <d791e70f-9c3f-4916-94de-8d76517339bf@oss.qualcomm.com>
In-Reply-To: <d791e70f-9c3f-4916-94de-8d76517339bf@oss.qualcomm.com>
From: Dale Whinham <daleyo@gmail.com>
Date: Mon, 5 Oct 2026 16:50:16 +0000
X-Gm-Features: AclHuK86rNmj1WNp2rnEYWCTMSv7GKXC5kLWAnqBi1EywA_4Cfr2oGHSi5bAdpE
Message-ID: <CAFcmK8haaN=O+aqvcRr4t6jc6dr4Bf2QDDPso-aT_frqEfSPWA@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath12k: skip hardware rfkill setup on Microsoft
 Surface Pro 11
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: =?UTF-8?Q?Fran=C3=A7ois_Roux?= <franzelfranzel@gmail.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Oct 2026 at 14:37, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
> my preference would to to break this out into a separate table-driven function
> so that if other devices have this issue they would just need to add to the table.

Indeed, as far as I know Microsoft Surface Laptop 7 (aka. Romulus) is
also affected by this issue.

Best regards,
Dale
