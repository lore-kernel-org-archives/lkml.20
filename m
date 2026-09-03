Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313BF4C0427
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446452; cv=pass; b=GIEahQEFwmExrq4z+7NL0btT/SxJ1zo+i3RGIEkmaoOsSOCnMznHU4zjMszC+rWeNDspB+yTrvZ670N1n18Ts2M+P52msV6HRCMOfBWylgHzjE53vcnNdxssGWb4nHbx25piNmS1RjqpMLy0KZwQKAgCRCBmo+CJs989QjSw3JY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446452; c=relaxed/simple;
	bh=DMcoFPAWdEiA47YKBPP9R2w1Up2IfyxuLdA+slJYpIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7DQKmc/mTgP2+DVm7UPbyAg2e3CrsvLTEvlqAPQWDk5JZAt8WCCBdh7IQoa87r+ScmkR3MHbFa9YGLt0kgA/Not2Sqjxj+/LqX6AYnGL10MpyJ5OnLeAWE432zv6LWUYF4cvP7USMWwvu5S7NB4AQZduq9K2JSrSDvgTVwj9To=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hvz++bd8; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hvz++bd8"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-865bdc6ed72so41744657b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788446443; cv=none;
        d=google.com; s=arc-20260327;
        b=syhm+aYpTqOSqsc+Z+Xf40YZzZrT8dKdL3FXmXUerw0CuNXtSlQOqK6q1p5ictzDuc
         0rK/ZjPXWFPOnhG4aHh337PAxK9zizt8Pj7Usbrtb1IWlZnuobdnLmffzzOCelISJYwP
         zTpuE5BvlT5rvhal4HF09hPVF75z4IyysZeGltArURMmbzerOkxkrWq8m/cApX02gYdy
         +RoOlkTa467TOjTUzaAa56b38K1hrErSxue5Id1sTWOPBVdI/aeFWnT9adnLGnw8sr7I
         5XSvkk8q1AYb9SKKGjBZZfbMg4YT9raNxArHSPUVu9T3KMd39cSt50fBu6+Z5RJSsGsA
         HkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DMcoFPAWdEiA47YKBPP9R2w1Up2IfyxuLdA+slJYpIs=;
        fh=HSh0FSYBTUibP/yZriN99jLVv3CSepOA4O13znJ8r0M=;
        b=kH5szn8kqmxtQ7DUQi6MPZhjhsoV10AffmVnBB1TL6zAtpwPwcC+OCN9T1R19Mytph
         lgAJODn29auVl1Fxxwc9Vmr4fX14Pklj8/QJ8HPZcveeYDFUA1jGYcTu4gpqK5rm9Oau
         acoohZbi4UiEEJWp4FTqR3rcKDkO51z3gSAlTp9my8AkJ23Gb4ZmqJvTm1KqFHx2bZ9a
         HoTlo5IBAJiXwo8jHv+60a9LTFVpbGhPeNG7XE5Fe3QyHE4Yfe8L+1m+t4/8LJBp3mr9
         KxMaZn/8q6+7nrcLlNjjCFX4eOiOtgnytyqQgnske+Ljy0i54JK0djr2arkd8A1dSfNK
         ikrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788446443; x=1789051243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DMcoFPAWdEiA47YKBPP9R2w1Up2IfyxuLdA+slJYpIs=;
        b=Hvz++bd8+eYQunNClH2gjduGXicxU7Dxf9RUQf91Lt7mmlCNFJBKNsC5TXFqAX2ksE
         KwP1DHKm0mpdNGAGNJgcDLmvLxrAf8KvNg2+oUqTjO7nSEKVjyJReCI4gAaHwfbYUSAw
         IHvyXLBr7UhhT2Q/4PCFEwo61s+0zXpm/p/2pUaMJq0IPc4UM7MZwd3YSqeS2IvhN2GF
         Cr9xZTW2ewL2WfKNfI85Oi/A3HRcMpQWKz9ST2POrBj7DvX+fQSd9K0WzFyGfhd85tt+
         eFZnM6vvgMEv1YHJAgHzmOML+iF1b+rgvY6mA3M0wUoEkS1iHy02lpQbNvuYBxYhiDRP
         X5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446443; x=1789051243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMcoFPAWdEiA47YKBPP9R2w1Up2IfyxuLdA+slJYpIs=;
        b=tQGoa2EruKCzxjFPD7EvBXMqJj0khfI9EZIHDAWJmx2QMxPdJSvpbVjE1nd3ebdeyo
         L5XTIeNH08K5vGvpe6tvyDwzOw+A8ydm2K0EBitbPN7+W4Ayk5TlqJetnlkHMru3CX23
         AVfGnkKpXiqvB8ZbxG9vV+kO1JaYEgnD3lSXC5XmFodhiBymwc6JMBEANTSbmrYOnTfO
         2l48tsKHuSWUQuvXaYvlKhY4bNzZy/KMd+/zEAYA5vGamEYBZSxEvqnWRAFhoHQSvYfr
         9Jese/tfu7lPoc66ZgAHJYOleyIhM7/jZESqtH/7kp5yDkD8Y+WBHYOQ2WnZRprKQ4U5
         ub0Q==
X-Forwarded-Encrypted: i=1; AKwUvByiZgJaGUCAc3d/r0ex/Zt5NRCoJDSuMPgkeCPzywnTQ47pT7+ULPNVl9LUdPDLydXlQOkceZi7BMKs7D0=@vger.kernel.org
X-Gm-Message-State: AFuF++lHZOAF7rogbpr45QosNyCeLvGTuPz9nDyVeNh+kOIfDZw+ldVM
	1zQTZf2fQOgIn6A9VILA5YziXTYrDIYscs7QCyYTCmTo+f2gdWlLOUayb26dgkpzkwli2FE5I5H
	m2a1eYKEX5g6go5XtS+eDnzla9EHS0u/NO2+wfy0TMw==
X-Gm-Gg: AYBFou1EJyzmu0QZ6SaCnMigWCNEl7/9SQ9l3YY0Ja98sgHZUOeGkmlPSM8Qc/hN+qo
	HMwBCdZSFYED3v6maer5N/oscoK6E9rlX/OkKP3iYwHUW8/jKareUErtUH3dEHAdHHwRiw9lTab
	gG6YCAmpnNdNkfRJIjmUzpD/9xGgZS1Q6ECBybWaEIatWZXjUzWWcDZbSmFjZtgNqcnl24fV3jF
	6MrL80ZAhDD7C+TwKhWV4iJge3pdtQM8I2ACLCXQvZe3ywLZquwGtCJaMvIHHPjXFHlsGcUAJkM
	oOpTbG/IMGDARY+A4hRdWtPZMblCaO0g5CH5TJ+vfNmDFQDRHL1xJTagBU1TMzgA4HtMi1tzgaq
	TjL0iH+Ced5nzYsXQYrr8OcWAiTvzpZ8=
X-Received: by 2002:a05:690c:e211:10b0:80c:5ce9:8f1a with SMTP id
 00721157ae682-86c54b242fbmr50652107b3.34.1788446442940; Thu, 03 Sep 2026
 07:40:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5be7vkmpzmizgmvqxyefubgi3epnlo2uf7mabcgsapvia4ckpm@ixwfppk5z5e5> <A4C1EAB3A67613DC+20260903132714.2538118-1-raoxu@uniontech.com>
In-Reply-To: <A4C1EAB3A67613DC+20260903132714.2538118-1-raoxu@uniontech.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 3 Sep 2026 10:40:31 -0400
X-Gm-Features: AcwNN1W2_JiObyW5To0IffDILn7tLdHOJXWxugOC4ExywC4Uofa9xPpYfNG3_Bo
Message-ID: <CABBYNZL2QcodKofLFbHbDJZBcjA+mRDSYi2QFZ_XvyphJYg_yg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btqcomsmd: destroy RPMsg endpoints before
 freeing hci_dev
To: raoxu <raoxu@uniontech.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, brgl@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, marcel@holtmann.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xu,

On Thu, Sep 3, 2026 at 9:27=E2=80=AFAM raoxu <raoxu@uniontech.com> wrote:
>
> Hi Luiz, Marcel,
>
> A gentle ping on this fix.
>
> It has already received:
>
> Reviewed-by: Dmitry Baryshkov
> Acked-by: Bartosz Golaszewski
>
> and the Bluetooth CI passed. The original teardown ordering is still
> present in the current Bluetooth tree.
>
> Please let me know if any further changes or testing are needed.

Please resend.

--=20
Luiz Augusto von Dentz
