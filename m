Received: from mail-dl2-f33.google.com (mail-dl2-f33.google.com [74.125.229.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9851E3F58E5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750933; cv=pass; b=fdXS8U0ZYR4Bd2Wu4xoBOco3XURy2LTG7wSDx7qJpFAx13iJ1a4M1tDlG3YVQxD2ZCU9fqEb9WKAXQ/BU2Zoeql5fjJxp8fbIkJdVSnv7lVo/5eoZoirEtT+IITGTLpp7et6ZcMb9nmrhA1JDFRBgqcyZNQwfVF7Z7+d58JwoVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750933; c=relaxed/simple;
	bh=POsdw8DAXZp9P24GbQy3+qEg0KQpZiuwyetUPJ9VFEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R4itNo2GAoB63yemXYlK7Q/tmtncGDgnXESTrHo84NRR1XMCbtM42WbUeqOzp38LkCHKEmR+BIm3OLXRKxbrSl6iSW/md+2cOpaZf/nSNd1xr/9T3BXD/YIwjQ6mrqJXzhfyEn/OC0alL0ncQrTSkFVdAadnlja97L/dFYPJhlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cptktljN; arc=pass smtp.client-ip=74.125.229.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cptktljN"
Received: by mail-dl2-f33.google.com with SMTP id a92af1059eb24-1438e88300cso4848388c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790750923; cv=none;
        d=google.com; s=arc-20260327;
        b=r1VqTH5pLVUZR5X+A1+iKVG9nkv/J45+Lvp/ntQlfLqEtUVACvUjq0KhhxWjv0Ucm8
         y6G0LZB8JyxHxEVQaS4Uf26utSKzNgpGuoSCxLfzfKFIQxs6XV8mtbGZ/GlXViJFO1PW
         mXmHVq+QdF4wUQTVUA0fGCyt3aPMV0NX1RLwcSWH0jdcjzhN3sb7Y1tmRJYYXa+6OAcp
         dRoaQY+PCBagPdazy2r/CEWym+rU7y72fK4nhN4v5N9sM5NWlakx0NXKtajQihk5YiUB
         LtXa95qgwRkDRkXdThy3Jw7e0ZmQszSnonQrr+SEFiBO2vTbLE4gzm6O/S07TmW/xsWM
         cOKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X1t6xV4OxZYPdZ6oDbVsMlrNR1plVN1+LMd+89a6Pg0=;
        fh=UVUjScJ/8+wxwYjjN589I3C//Y6u9Gceua/qc2lp4TU=;
        b=U+dzMGxIILwTWogGYGLa4iH1Qo6/QVl5ZMRMYoffhRatqsennSTbgwKMPiYpDrJt2p
         1iAgjnCrLd8xlj6TDEL7bKy6EVnVLnOMpLyKNypFRF8j5sN0UgTtk/S0bbliI0gYnD8w
         10dheCuqcNFQ8ADTrzWRTGz++k1ImzNEfzt4U+CIOdFe0McMBKGtXWjkp/1M33A91Vi0
         TROUiVlRHJ58jgndbylx01Bhej7tRjQ5qpLHXYmyubglfXI+slHI4U3szb7Ze1PDmSwp
         ajKbJ1QA31zt7hFBcp8PwqyZQeVMpi5znk11Gls+2JheglJSDvbkByvSpFvO7dLKYOc2
         WzHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790750923; x=1791355723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X1t6xV4OxZYPdZ6oDbVsMlrNR1plVN1+LMd+89a6Pg0=;
        b=cptktljNQWMPFuJCNZJCkD0VCVQK8thkhVYiu6u696VirmK2DkKI+uYBMOYJA6beLx
         akkFJNzYMOFehH4so7ta0elTCy1P2JLde8PyvxPCqpIgGZ5AyhBj/TuaAnOit6C8nXrr
         2Pr0OFqlnEdPCcAFyJm1h5N8AmRbYgz3jeu/4hufEznZ100BKxVyoy5Q40P4CBEO4His
         K5iF4TVmI45p+6JultrXSEh/JS+FxmZS/MbP1GU78Wlzl/TcdXFAK52qGU45nfapgZej
         wGgPuU1ToLmUe/xos0mdKaf1fctpC0Fggf4o0FgdwKx1V9Pv3SAQH9aJOKUrHviaJ18Y
         lWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750923; x=1791355723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1t6xV4OxZYPdZ6oDbVsMlrNR1plVN1+LMd+89a6Pg0=;
        b=tDyjDpuF02AXNOA/Cz8FWKDc/LUe2UTD6qTH0ar1+CtVy4cqH5PO/Yb7ozPt+B39sY
         xeuHsygflh7P73cXqLNgu7X8eYZg+Njh+niIM822UfxSl8Rab1xYhMQ1eMBZNnEssx4C
         pBxwT9b9aF/IUvnE4m1FerURxo0/dFwS8wIFsrPobbKBuv9+1NbsboLybnIKBAsjnAOo
         ASdGAR2UDBWYcew+PLkp103K5BbFR69ozVUAd1M1F0zOVaIbwSs5ncyGu2dUI3yREhlr
         EqP7Zpx0p8CWo7Ry4TTb8f6hHYUPSK4oYnZ77KTgXwPklHc3SK5uDGCirwKfVzCHW6J1
         YQWQ==
X-Forwarded-Encrypted: i=1; AKwUvByc/FTt2Lcln3VLV58XSkVDv23hip870ODeTVFjgYZ1nhLKVtWw+rgU+NyRVOlPs5kqTIeSHgJo5BPe+d0=@vger.kernel.org
X-Gm-Message-State: AFuF++nuqx0D/nfwTXIhYpQ66+GnFLcSXXQdPDCSa/R6F9cK/M6j0YQj
	si9tBJJNp15IMSRO2361487X5itZ8sIPyaClHSeYpI4DfZzhrvB2wJRowIEu/qoFWMjx0U5KMbC
	PRlasFoTLhdTqUGvcMM2OvR0caaoUG3n1P119
X-Gm-Gg: AYBFou1Z7iWvr6hU0h5cEfxLDO2Br57M61oEGHq6rfG6wShg81+3J6qmnKGTlSMMpPx
	yANLxtA+LU9dFH67GD/HicmggUCVwy6aaLpac7p9aBnotLipE+nKd6oIAwDUCRIYMJgqADk7cY4
	d9rYEiXet+oaQf632lNSuyOGoRMlUWQHE4KlpLxXIXsQt7kXKZ34/+kRk9KKktRuSC/br8fiOZS
	jebV1g2yPM5+M89JhkkHswN73MvOYlpf2AYNumxgWwql7cBE2LYwpir0artUfUaT1px+d6r93TI
	/0jv8DFRI9WbmODSkcgvnNRPSrqiCenghNb3qBZWEXFJ4n670X/Pe+vyMgREOXCgLAvM/9A7XOn
	fLjLQ5fLDSOGB
X-Received: by 2002:a05:701b:4559:20b0:137:5b9d:cf87 with SMTP id
 a92af1059eb24-14d2d8b87c5mr350558c88.0.1790750923534; Tue, 29 Sep 2026
 23:48:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-dalmore-fixes-core-supply-v1-1-4bd87fd70b0d@nvidia.com>
In-Reply-To: <20260930-dalmore-fixes-core-supply-v1-1-4bd87fd70b0d@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 09:48:30 +0300
X-Gm-Features: AclHuK8RGEIMLDdvt3o3LTWf4pTCoSeW_y63rIuDyjNVFqdJQJDqKc5Xp-ebQUA
Message-ID: <CAPVz0n02==Zq3sZvW3p_pPs7RUASvP0koWNjsAZY289gqnNxxw@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: Add core supply for Tegra114 boards
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 07:11 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> After commit 4cc90d4c043e ("ARM: tegra: Configure Tegra114 power
> domains"), a core-supply property is required in the PMC node.
> Label the core regulator on Dalmore, NVIDIA SHIELD and Tegra Note 7
> and add the property.
>
> Fixes: 4cc90d4c043e ("ARM: tegra: Configure Tegra114 power domains")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> This skips TF701T since there is already a patch on the mailing list for
> it. Tested on Dalmore, but not on TN7 or SHIELD Portable.
> ---
>  arch/arm/boot/dts/nvidia/tegra114-dalmore.dts | 4 +++-
>  arch/arm/boot/dts/nvidia/tegra114-roth.dts    | 4 +++-
>  arch/arm/boot/dts/nvidia/tegra114-tn7.dts     | 4 +++-
>  3 files changed, 9 insertions(+), 3 deletions(-)
>

Thank you for catching this!

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab/TN7
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
