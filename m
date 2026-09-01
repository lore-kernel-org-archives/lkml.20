Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBED4CCDE4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 22:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302774; cv=pass; b=KobPCM7qy1hFe/YNtrFaLLkgxC8k8/RIE7FOqbEfSPSLbZlWatY4zpek996GF74K11nPYHCmFZhMu9j6I/7hCOHpmKOHcaBafJqHrWBNh29aHllKzWIh71WVwCkTeix+XkxtPzxGCD4bVeBuIKkSvq6dF7cworxdPCZ3O5kQs4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302774; c=relaxed/simple;
	bh=Y7wjL8aGKHfhrB8GHuhTYqkPVVwHctoCXeQ0PtR50jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Crzb5jXaWq0N9Bwo2fp+bHbVVRD0NaJUOR4IFWDJ8hNYl/euovqbErUKC6Ya+VQ2Z7eASmsk+Vm/JPyLDBmr0n1nBSvgAQNiiUwzNoverMhKI3eP7I5OPZTdesFGQMUf58Rxy3Jj7hLSxc/I4a1y91WZDckfIvlE+NNE1R+zTPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDpr994m; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDpr994m"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a668cacdadso578590a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788302771; cv=none;
        d=google.com; s=arc-20260327;
        b=VA2b8MNmQYx2iMOWmXpl3RTvZnCkjHXvMEMcEcTkbC1BPwHFECKKSIUJgZUbpa9eqR
         wgJ6mt1A5xJEDEccL4MmR5jy2a2CabqJqnwpzl9+MvWZPuko+4y8QSXVBwbHgXnd1CeK
         dsQWF+FObQIJhN2kE4Zr+t+Dk66o5+Iv2VK3xQaXerzBDugv71r7dzqWvzO4ztOOUpo3
         3Lmb38Fwg8hzNfSRNcpoN0uajpc2/0cOfEjKSOmetp1uZh4AkQxbO3MznJyqqHSVeoZf
         7MFim1L6pTHXfEQrne0i4ttP1fqNCRLIWI4l7cG1cpPk8Oa2BL1hCpWcbHNnNpNl06p3
         OR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJSSrp57ik5SuL/p9XOeoiBv4DaL3YaC46FXR+QQSdQ=;
        fh=S02M/YPPyjTkbTSUp9+d4hK1nYMkJZQJSNbXvekr6yM=;
        b=QLWv0FSjRpCDIFvX/PyWyRBEz+nTJ4OgIylIEWFdLmRVIa/TTdycpfsKrGubD/qFPB
         EXUHEaScwE+kKUeKFfkww/l3tkRCHHgAXMqoBD5LO2QxCG94QkxFiJalhdFjlfpRZZc9
         Z93ZX6KqNxlFtHyr4Dby6yzuns/0vtEIJXguh43ASpn+g0oD+Ss/ZxQ1i1DK9S0/O52G
         be7cVryrEPAaXOFDCHI9mVU0zjAaUt8HsOfo5HtNvjYorjhvUyFU/pTZg6yEzsFqF9WB
         0+oZo1FsaQDGoc+pQaW9dC5XzsfpF4bz5Ufr2PZktE0w8yLz7qzALLgCWkMYNMDLUEz3
         0IMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788302771; x=1788907571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJSSrp57ik5SuL/p9XOeoiBv4DaL3YaC46FXR+QQSdQ=;
        b=hDpr994mTzyhN1uBUQSgXLk2Si0zmstdy8S1b0jLLvhC0k2yzaeRfQOvT9vu4hzoh8
         vXPgvteRDTZBGVN1agQsK0StCi9rFXezXZn0nCSb2nbDjOwmX3yI8el07q2QVH4hC6tK
         V8oXbuvyECcY1b7bKKFuVCR4G8FfMokgFeSVKOuJPTK8nAH5VkCg/x8hI8sk6mnsoN0i
         KWpasmhA+ec4tPN9roC+/ug+xmFqtSqpWwbddnAFd3K6Ia0OaE40Z67iEAhEO6TR69Q8
         Pk+He5WiL21Q2CXrbUMaQ25l+Fe4MmqB7n3Z698YPT4Yppzlmwr67E3Tnc2lUmKco5yI
         4qIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788302771; x=1788907571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJSSrp57ik5SuL/p9XOeoiBv4DaL3YaC46FXR+QQSdQ=;
        b=N61HULPW2fmYwerWEzcrXTJm9h6WCVAwsB6Ug9PYPsNQAlqjNeOeu5/tI8uwCvO1mw
         ofcgT2OVHrC0bITD5GH+41B/Yu5ae4OyeKjXO0o99Z+5o9/Xh4yoMl3Ti566XUZkN7mi
         Nuv5Jw96mZ9n3/4xL8uHz+uKKi8E8wJ0N0qvdqFGlHs7/AsarMJ1JbBzjPIAIkf3rVPQ
         A2SuJIVwpOo0MeziOt2uFz39q1WYNMOv6W4E9wVPR1SXRJIzVTt9xncHXMJl2BQlcOr6
         7cu0oz/tqtEa8ccxHYFQLkndBeF9glk4oQZ7eM4FzgtPEgyRPI3KmsLXMtOFh4AHxKbb
         LVpw==
X-Forwarded-Encrypted: i=1; AKwUvBwsYwBNhDaJocfP0hZuZ0JLVzic2qg7e2+OV1MKClftNIIewEHjOaDNgeAL7xUh/2ul8c8qsIViJsOKeVg=@vger.kernel.org
X-Gm-Message-State: AFuF++k0Pve9DgjCAFIVEfmRS83Aw/ochdpjM7sv3UFJoU655TjP6XED
	P4fPUTra5m0jgBhDsheL86xT/DeP9HN87TqlTi9TfEC/AaOie2uZWGtE6LwIVAYd4E2mxbHK18o
	J9oE28jf27QL3HCdAhvIccO/wFhIDqe4=
X-Gm-Gg: AYBFou2TU8b4P0lpcXEHOgwdXjg91i/DJo5Uj5tTV7LFr0sTKo5SsXV7O61qqaY9wmU
	XN4Twvvo4adWq0u2aU5wK/RDuVtI+tqvwY4AFZR2QM9Oi21mhJIGIhDrx5QBwr+Kshiq/CTBiyM
	LkmOVEPVdTcDhCBCyuJSA7uJswEgmaTUuTW9KRtimjRwcLS83T4Pe1oZBIUn7PL8rK9oaKWuwxG
	BT2Yzn6AiIoa9jb1QakoLDjQzSpc/10TgCsZZhN1fwDov7JM1mo915hVhSgdGpINu6OTeNY33Mh
	f4M57EI6lk5Wp5RfSZCN6bMra+XXA3Q3wAWWEj3YkC3wjxmtMJeFTbkWcX82qMMQOn2K+F9R8Cn
	iRuuQAonnF73VMayQfA4/tGY+hNyQXtsvP2UynYSMHzw=
X-Received: by 2002:a05:6402:218a:b0:6a5:f912:b092 with SMTP id
 4fb4d7f45d1cf-6a68257bd75mr526660a12.6.1788302771360; Tue, 01 Sep 2026
 15:46:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <5ad0fa4995f9b0e6aa4af672e987a9b9ee43645d.1788277742.git.mattst88@gmail.com>
In-Reply-To: <5ad0fa4995f9b0e6aa4af672e987a9b9ee43645d.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 00:45:57 +0200
X-Gm-Features: AcwNN1XTceI-OuMu6yihuXuFe37xXWvWHcZG-GNRzI3Cp5FuDhD3aeZfLumOfus
Message-ID: <CA+=Fv5TE5z5MUObofTPJE5jpbBLS+ntgg+6B8A9GJibK=GDPkg@mail.gmail.com>
Subject: Re: [PATCH 14/24] alpha: add ARCH_SUPPORTS_PAGE_TABLE_CHECK support
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Add the page table check helpers needed for CONFIG_PAGE_TABLE_CHECK
> and select ARCH_SUPPORTS_PAGE_TABLE_CHECK in Kconfig.
>
> Alpha does not support huge pages, so pmd_user_accessible_page() and
> pud_user_accessible_page() always return false. pte_user_accessible_page(=
)
> checks for present PTEs with user read access (_PAGE_URE).
>

This patch does not build with CONFIG_PAGE_TABLE_CHECK enabled on
v7.3-rc1.

Commit cf8771ca4cdb ("mm/page_table_check: Pass mm_struct to
pxx_user_accessible_page()") changed these helpers from:

        pte_user_accessible_page(pte, addr)

to:

        pte_user_accessible_page(mm, addr, pte)

The Alpha definitions added here still use the old two-argument API.
The same applies to pmd_user_accessible_page() and
pud_user_accessible_page().

Could you update the helpers to use the new three-argument signatures?

Regards,
Magnus
