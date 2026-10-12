Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520933BB68F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797951; cv=pass; b=hRLD1cvsziL/uU0QZhK7VeEg8GUeRB1tJT9uz3wcLVnXstYLnj8iPdGWLK/FaMGtl0EUqYVrNIEIDnk2pM06xqLJqp6gL4dHZJoiiQH8WgePDG7oorPNIugseKitNFcnadSqH1oZ+YAP9ugPp5P+cGPttSHuULOaGdQx+LGRwK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797951; c=relaxed/simple;
	bh=p4eOAQSRydUrFhv9tfWYY8SfGm5O1qYqWKsd24mVNSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UoUgTokRiKh8pYO1HLAyuzn3KGF7xnyxoS4IyK9JvGw3LWAsxSX+guNEPf0YwskepUx197/kgVRjOy98AV7ee/UqGhbINUkcGm4x2IZFiKoqaE79ZEUYA2k7IAoAB8zqWhpOuc/5k0/oG2L8y8JaYHVNHQi5TOIsGCfJ0+YOFzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDIELTuC; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDIELTuC"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-88bda150550so623381b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797950; cv=none;
        d=google.com; s=arc-20260327;
        b=YN/PFPKtxB9fiaIUacErFd64u7iutrLNxhdBPyiHQXUegygP3N7phH8nZ3FalfC4jD
         SL4nuol5NoqE5p2KnR3zG7mZeqSK5mRziORbxVA6fyNwq8xHGwFnuqro41MYwsJOVWRu
         RANMc2ln+IUo1UX0JEHbzSaUv8MGESxWl2EevNoD0fc9Lg4cteyCRD8fWpzLwTrEBVwz
         6UwQgSPSoFFjpYFdYrrAXRCcvc/8epu1le3itILWsrf1na2I2/xqZ/l6KZa+FGX+Xmwi
         NCRQoCvqrQkQTzwxhFw+AxrHEnApZiJga9pp7GT4qBbt+QJwiVA8/T/M2nTKiYwCGmZT
         Olsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p4eOAQSRydUrFhv9tfWYY8SfGm5O1qYqWKsd24mVNSU=;
        fh=eMhrBvbISymMzsejkGFF9ssYxPFdxv+pj0CqRSefprc=;
        b=O2fcLJGP0CUq6+sD+kfqagUoECCfpm5OMU/ajqVYW2SXeEEeWHZBnXeEfF5w0GVm/N
         uG+ImxQjbgRhlGJtO9sB0UZ26PIn5oiiuE1kqecbs7JJZ/tm+tDKUy5Y0XDdNnK6IsB1
         e8BMc4uqTDr6ryAvzC62+WQts86by9yTfNINLaTp4V+xnCf1hM2JaDqLzgXHW/Oj6fcH
         ka07RIcBsNmfh737JO1WeO4Er2UHQLKVstHycwaD3kIGM0JXZTigi5naWN27u3ZIteaW
         Xa6Z5mXQh8kCrreUBMxqmUkcL4hWM0f+sXxzJoNaj3W4nYLdv1UdoAKP7TrqcX40jw0X
         naZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797950; x=1792402750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4eOAQSRydUrFhv9tfWYY8SfGm5O1qYqWKsd24mVNSU=;
        b=QDIELTuC5xO9kvbzF8LipXyAjMFAA/thp46hctNbpAoIVySoJL1TautjHxBObhj9ZO
         dPl+oI3ABiYOTSeTtnC/JdPJWxY4QdUWSxGhj3WEuQxW+/84NFUr1AA1UuUuAAjFnSmC
         M/iH/Dg5eaaMBnsDQraXKFeJsRKokIi2QXFKgjtlqgnrHqG0945ijTqx0vK5twWN6Uu9
         Nk4107QhwT9SC1oi8/l924nXEZRm/Eewq3X7DHZ/c0r6oZWc+TEpffbUailJbmuwYwaU
         cOTD/h3RaujQSO6lcMp+G9QfyyGs9IHye0xDpMSY9amNNp+mzzaaSDhmpi90xtn/Apbu
         NCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797950; x=1792402750;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p4eOAQSRydUrFhv9tfWYY8SfGm5O1qYqWKsd24mVNSU=;
        b=WEZnEucDer6AGp8oLrjAtanTT38xZauXRQGuTJ2i5XAF92/UD8AmNnfrtb6Rj6KqeP
         mrS9OzKqcYhMTgNdsOt5C9JsAkrTylzHmej/oCMfUki+96Kt9RIkUZYO9LF+RioofwHV
         5zo+u4odi4r7Ej0+ifP+U3VchRmlK2yIkMfIlEQwxwszh8wrZU6/ds6SizgEp7Y9GEbu
         S0zMYlN8Aq8EExmNwy4ybfwI5GI8iOUZzUOgNHoR2/r/TwBiV4izuXt7zLHq2GL169Pe
         UYewT89Tm/BND/T7kqDLSS6AdXfrYyzzI3ufq1empOhV8VgkPPddcUsv2l+Mb+8jPIlM
         2TzA==
X-Forwarded-Encrypted: i=1; AKwUvBwY7WpfMZsH6NAQ3V629T3yRi3YvPzqFMdJNWKacGxuwmbCJqs6C4fYmk8ANiPTrXHOooloYDrjUcWWw+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbzIlRmW3OVu/V3zg/U/qEunNrPRvE/Rf0VStnhr2EIrD7i8aH
	Jm3zxAndKKFS3Me2yiwEc4MwXbGlH9sIYwNIINx5kRYCzlmhZkh2oNIE92Uv/7BdChDuBo7ZgmD
	FFs23Y4FVHbwqAS4LDuojakX64qUTHHk=
X-Gm-Gg: AYBFou1h2fE7ExDHpq8gV/0DrWv1/7Cn3c10jqR3AiXkf8At3FsCxNitXoQGE1OZlJ9
	ufpZGst05iSuB99g61UBwCG9nwsoCgKRgZ6YedKAkRRBzsPiCQ3+DzsP7//oJWsNxRfGGSBTRBV
	HGW609WdLyC6LbRImgIuT7qT3+NWvEUkxU3ZDGInZSJ36mjbOkq+eabj9dk4SGgLUiD+aRVNedT
	KpWJxVW9H3ofmv2pPRmayLFjJ6OwBMuCf6lWWO32qSDbyk21ZXYeOtg87SptiGis9d2Ff/rwBS3
	jN8glDKbPjam47qXSpm3Tp1RGaO9lZ4dyBAuUbxzcFHvlAcsGOxeeRyPFrCXz92X4WYZIttPF00
	+Bp9jYGskEVsjEVSyEPXL3iMyU9S/dNMzrAfSiNG3Vc47bk116SCqjolr5q9aa2qTTBtbc9oIk0
	HWKg==
X-Received: by 2002:a05:6a00:1f06:b0:888:85a:6201 with SMTP id
 d2e1a72fcca58-897c653b01amr8233897b3a.13.1791797949637; Mon, 12 Oct 2026
 02:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007104847.507776-1-phucduc.bui@gmail.com>
 <20261007204638.GA785135@bhelgaas> <CAABR9nGNoaO-CmTcRvXuMMmGbVSWybKZVBRRZmzQCab_N1EzZA@mail.gmail.com>
 <126200fa-49e0-449a-afac-cc08f4a9ecf3@nvidia.com>
In-Reply-To: <126200fa-49e0-449a-afac-cc08f4a9ecf3@nvidia.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 12 Oct 2026 16:38:57 +0700
X-Gm-Features: AclHuK83I9LwnM2vO4kCLQ6Jq_5C8DsyXc8yQBXyQkkqIo_gLuZ6KKPGtYL1lwQ
Message-ID: <CAABR9nG0rXrtyMuuWOhK-zA0XNsMENuy73fXiq1RhH=GBapFkQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI: tegra194: use dev_err_probe() for PERST GPIO
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, kwilczynski@kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Niklas Cassel <cassel@kernel.org>, linux-pci@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Manikanta,

> With the subject line capitalization and "PERST#" style fixes,
> Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>

Thanks for the review. I'll send v2 shortly.

Best regards,
Phuc
