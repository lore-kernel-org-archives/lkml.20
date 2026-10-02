Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2D647F2E3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940304; cv=pass; b=r0hCqPTIzFPs6xNtRP3mOoOREu4zNL3sjzzxBq3c6vOWHklLWS3ZAeKFPWInKqY+F9FwVb+63RDX44GIBNWGJvieaKbZRADK9vgTYgyC4GsKv5K89Uax39Pu652zGS9NH0DMMzBYb4mn2KByCyCvsGG1blXXLSneNNrAu1YN/K4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940304; c=relaxed/simple;
	bh=keMbtcyNVQxdC0ctP+ZhAmBIOPGSUadXPIE/fKO00rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezvv0eKuLRtGfT8yho2ofdQF8fRxsMU0kFuU2nc9yolPT9kOFmXEh/Fw6YAVnm9RY9Vv+dfpQnftyCK8yZI1vGNxcyyGGvvvEduB5oQ+eYn4MYPIpiD8efN2hyxqurpg2mwuwUrjYvbVkyrRxAyGitts3HiPWDMrc8qHF/LGa7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=efqCTgDg; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="efqCTgDg"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaf8415866so1639683a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790940300; cv=none;
        d=google.com; s=arc-20260327;
        b=EmHCcQ9DazioBIftlPqve7R2WyvSbfodjx0tOuo+R0kEc/Ah5i3E6IpLanED6lpv5m
         +SbfrPkHdMxkiQmwQJzXpLtMkjBP9t4bC20WWbVZVGg4RBdtUxyf9SWEwxY7j0A701bp
         qjW6A/noblosrnw421QsZ/FZKTbLCYly+lZ5HsJHXEtt8rZIrPwRV0BZwYD7SISeVCQE
         WCF9fPaGbuiAyH6cXsrOeZ/VHi//59UliHKLyrd56QIeRghg49pEYhwGLJh9XUQeIcqQ
         00Zd4x5yJossTgpxPTuPKaBPth0j7KrpnpS3P8mEf1Ox+UVpKP1j+lmAS2qu5Zzl4ceK
         PRzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=keMbtcyNVQxdC0ctP+ZhAmBIOPGSUadXPIE/fKO00rU=;
        fh=leNWkn87GT9K8Pavsu+dH1fggkvEceLbv/Hr7Qequb8=;
        b=QdoYifGxGW3DvekKBZHfEqTjw7eLXfokegxe0Hn0B5SdemcTaz7bWJBnG7oXRhuoN4
         MlkRbOYYEAMMdUIsoIthHVWrUD3iuopv/JVhPnH1dlfgL9pIkVpR9sIv+yeZP80FU+th
         m846ZdDHoFFgUQV7uk7nvZJP/PNg3Bhzb961DKztvLhgppfhpGTd8IQguLnzUvb74lCj
         btnZ5BY8SB1XI838oTVDiTCflSfPOtqa/+dWVr/VqrKFRjvQt4OGBFKBQahqVyGK2lZw
         SuHMAikd28iFAtwWGytQusj916VCddKeQNCYKAnFW899KClLXItTbk7H398a4JxMi525
         Qq0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790940300; x=1791545100; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=keMbtcyNVQxdC0ctP+ZhAmBIOPGSUadXPIE/fKO00rU=;
        b=efqCTgDg+rP7HorfXfAh2CddbMB3IpZ3nM2eASkyu88plQ/Icbem6nxQxZ8g8Nmis/
         O3bQuprgqMODpxzcmS+8Q06gJB5ALqDCKv/W8YlhhtPv1FimY7f/u1b4Lrj3401BQa9J
         y4uJB4tof9Axdt9wD6bD4ORqh6EsUjBvfU5Y1AenE60iB8ri7iibPNnrozPrTVEKQqdk
         4dPbKKBkT507HvuE7BeJDisxLIiIOxm71GCWLYFu141ESNal2XIbkd3U9p5tplw3VrEa
         Ni5lghwXSK7j0aOP4lbsgVBoOxDLiYb02QfpiK/K03IlSQUYsH6m4FKD3IWN/oSvXIaN
         keyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790940300; x=1791545100;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=keMbtcyNVQxdC0ctP+ZhAmBIOPGSUadXPIE/fKO00rU=;
        b=dG9s2C3rpT13Wa3HI66JlIq8lCQs980FyBIp58/ztLUF6lgQ5rueQIV89fHz2b8YDm
         Cq5uCkqPGc1+YnTJjncTR7DGP0Obe3ZxEU1iLECU97pIk0GmleuP/a3oKUsodPkQJvWF
         26orgpk5UIyIikdCZ0xQ8Q1PQlWzk+jFfIr+d+/evnogiMHEG0buxT1qgoH0xFykntnz
         C8wayosgLKFqiZQ8uVG8ZChYaKupncTE7tVXM/U70M+ud2ouaRD7iZRFlXcGssjm7NV/
         RF3pGHZIX6CvfTxAwATTyZug/kpp4kDCUd4p2aELBHm93/wfBj5Py7gkQT8F53co5GRB
         u9KA==
X-Forwarded-Encrypted: i=1; AKwUvByhugiBdjOL5jIfMDGdelrNrkE72VKWvCuonolOl4cLnYwpR/a2LNbKkHYpJYhj19OYo3FwaurfDDEncXI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3Yn8KbRwJMAnk19rOtMZob3FWk+KPVpskrdk2TL9dhEFIv/bD
	gGwFvOMQw0okKyGBthtYiRhnY5YJx9km+kRrFUSzCx7W18IxneBnXRmLXfGI0aZe86Z5z3st7pJ
	b2JHkNm5fB+wCx4i//zed7DLuRwoeoxOpzD/e5AFU1Ich5BdE+EW3WTY=
X-Gm-Gg: AYBFou2H4VHFvmeMZhRRLCFAIRt6N53NHCXARgYZP04i43Q4dShscm0iWu26aNvWITT
	e5KoSxsMNH5VtSuY3r0lIkNtrNX8SLkMrqJ3HAVsPJ2MMvZ9oCBkO16D/mQcE+bBnB7At9hLYCa
	3CF0OyO/WrBtgwOstcvXUUVz3kVlNVVDkKHtMFKfDrPJ2/CAi33c8roXgm6SbVu1pSlw9Cb4NXM
	EV4BxbKCdEWALiKMdq3bf8wLcCm3gNKAX2YKW21XCzKeC6hOpqpwegESGdDCo4uXV0VLzp5lhvV
	NDY+OktrM7AXV0FRFRE9f5zLMnSG18wfvoZxzvvcBjOx7cIT+Gc45nhYdxCN8IDLo8ecy8WcZV9
	xiOf/9JdUlmEo2zg4OgfUO+5A
X-Received: by 2002:a05:6402:13cd:b0:6ac:8dce:5a86 with SMTP id
 4fb4d7f45d1cf-6af9e322b6cmr1463693a12.23.1790940300400; Fri, 02 Oct 2026
 04:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260927150938epcas5p33b7d0495f8d9a8e84bf5f09c66e757fb@epcas5p3.samsung.com>
 <20260927152738.3673504-1-alim.akhtar@samsung.com>
In-Reply-To: <20260927152738.3673504-1-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 12:24:46 +0100
X-Gm-Features: AclHuK9DpXDu6p9otQ-T72J8vLpAXoibGWPs5vMvpbKJgOwvaV2nsGKYn1-NIrU
Message-ID: <CADrjBPpG1nJ0Dg1jXhqLoR_dnRP+N+=QbYeyW8GJV4Xr=od1CQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add Exynos8855 watchdog
 compatible string
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux@roeck-us.net, hajun.sung@samsung.com, wim@linux-watchdog.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 16:09, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add the 'samsung,exynos8855-wdt' compatible string to the Samsung
> watchdog device tree binding documentation. The Exynos8855 watchdog
> nodes use two clocks (bus clock and source clock), require
> samsung,cluster-index and samsung,syscon-phandle properties, similar
> to Exynos850 watchdog implementation.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

With Krzysztof's feedback addressed

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
