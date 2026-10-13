Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E254D957E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934263; cv=none; b=WvNaE/OoRDZgSiJrc6Farm36cqTg0zMHM0Vf8dzLArTALHSBFjMqbF8oGD8+LK1TKc3jO+c1yqv3+DTs8nAlyZz18ZRBEky6cwCBl5eOfBEwefKfP/IxKPOeTyFGpVfhS07NvpXjxtYle2rkosyTvOgIDfQXzv0TbzDTXJCtNBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934263; c=relaxed/simple;
	bh=9f9NLdM3DRtuPBkjP7egipXAuBf5O2ZQpTJ6081sC5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrK6MU4t5yJJifj9+ynWI4OH/td/3z0xjh28bp5FW6UWRpBkcPCxQdazFhaGkLZyHGcsvWV79a9BYaJjd78DPzDuuw8Ng/I6mhOXqW/3SOJXIm4xTL7jL+h6FQxlFGFXMM2Kz44koZJx7MloUTZ6sVMRaG1sSUdkemo77fjD9sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOvYKe6/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOvYKe6/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4EAE1F00898
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791934262;
	bh=9f9NLdM3DRtuPBkjP7egipXAuBf5O2ZQpTJ6081sC5U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cOvYKe6/RHWICOEYmRDgV1/CJfXN6zxTPVa/ggFa8azzpJRLfZ2Vo/2Ar2YsPfWVm
	 0/8zH8osSU/5FsuZbN/LhW8CcX74hIAMvAaMLVB6dWGyntAQI3WxOTDZFW0uMH5HY+
	 3xv67x1AfqlxAzDEKm14sUDvJ6vWbFZkM8YOKNlydXNENR2kCs5FHFg+m6x7/+LIvV
	 bayGrYm9IetFKRECdnvKYl4H+hz8yHgWPNfraagJ4b45VPzUv3be/HNt7SgC69VETq
	 9YZC4+oEPyEj02C9Et6IFBeJ/ho9EA2SQnr51gMlTunqFsvVApghEiDoo65ysfpy3K
	 pjgmnHQbLaF9w==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a9787a156eso27821131fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:31:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByl1TWlDLYhg6y7iryXMTOurU8ym83X3kKp3EPlH5NzL2QVeLH40yrTjqwAxsnRpRBIZwvqEuWLgZJ1xA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8RRFJXwDFr9UiiSuwtYq2rY8yRUENx49kh7bzDPXyXfXhBVi9
	zc4zu3pL9Bv4+AFg35jLvDchWA16ONAMOQfsswsViuTYpRjZ4BRMeoaxN+S+Pn0j8ha9ipwvJa7
	w8JlWMileCIOs4UPAHp0ovFlZMykvXzo=
X-Received: by 2002:a05:651c:e17:b0:3aa:e460:a1e with SMTP id
 38308e7fff4ca-3aae4600da8mr7501681fa.8.1791934261486; Tue, 13 Oct 2026
 16:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013074327.4961-1-Chloe_Chen@asmedia.com.tw>
In-Reply-To: <20261013074327.4961-1-Chloe_Chen@asmedia.com.tw>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:30:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLkyvp+DAQTFT2oyydjyCwqSO1DmCgQExbsVsOBYRuQLAQ@mail.gmail.com>
X-Gm-Features: AclHuK--NzRkxrMOOurKIIgZ9lTUtEMpVE9dR3r-rR7PD9mLnaGJV8p3MYT60oY
Message-ID: <CAD++jLkyvp+DAQTFT2oyydjyCwqSO1DmCgQExbsVsOBYRuQLAQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: amdptpci: add support for AMD PT PCI controller
To: Szuying Chen <Chloe_Chen@asmedia.com.tw>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Yd_Tseng@asmedia.com.tw, Jesse1_Chang@asmedia.com.tw, 
	Richard_Hsu@asmedia.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:43=E2=80=AFAM Szuying Chen <Chloe_Chen@asmedia.co=
m.tw> wrote:

> This commit implements the new gpio-amdptpci driver to support the
> GPIO functionality on AMD PT PCI platforms.
>
> Signed-off-by: Szuying Chen <Chloe_Chen@asmedia.com.tw>
> Co-authored-by: YD Tseng <Yd_Tseng@asmedia.com.tw>
>
> v1->v2:

NACK

I have provided feedback on v1 which was ignored.
Read it and incorporate it.

Yours,
Linus Walleij
