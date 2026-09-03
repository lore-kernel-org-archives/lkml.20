Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B6540B0F5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429922; cv=none; b=i//RCoMoLo0U38dzk1F0kGxTSQ0YiaOY9vt/Hndaxv0mcMs3Mg3NOAQqQ2l7SOdKCReOVOvjqwUV28eEHcShG25hjC6VRRSVlb8W5P923oRE74Wl686dDo95714ONMXLIjSDpiKVXgt+iOPBspRj+uGepHxhWyB/Sx46uN8SJk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429922; c=relaxed/simple;
	bh=wKv0G5pklL2Tau4nv5A69Up1Qi1EQE0aYPmrDPjRxmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6fVGaBJS1JHRk7rhf8X4bH0FrBWKkkAXCv6rJkh7y6K/FEPsPwwBYtQFfqGRRWkyDguSh2CK+5VRF9uKC9xY1/uUWpP2t6AlR8BWzRCcoooqS5TNsD0JUayxk/mZn5evUBQwTJhlyDZJezHAZaCwn1y7I3FqzicaHVmxBdo64M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-86d43cdee51so19583127b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429916; x=1789034716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sB2LZifEeupjsxCHsRGx0RoKXBpeYPjdfUIFuUgunMM=;
        b=QJp2pp7EUaTQKc2XSeLx7a9/oZwCYVSbDelsmVIiCk+8oNteJq1JbZl4RuocCE9NLN
         YTh7TpQ8W6620oCA76++jhwcrz95AI9g0p55fgNwt737RfC/U/KLwfIaVzFDh9Gfyd9D
         oh+xHQiKhhGCBjA3ZDbHxw3scApFZJ2Li/tf4C8x7chzD2NovMJKFNWTguSAilmulGiq
         Fd8z1z1XwXHsfAV3wu9ni4koi7UlWfHiTxYiI+gKwfPXFLlUrgaVzAEUpxdVH2W1uM7e
         beQ2+ER8nvviMKazoU94/ORqLIbRRHohMUhh58uydM+kRNBicsRLvdrXfrQRu7IEbdlr
         YJSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwY5Agj+1xsRbPaSCqAFbaJuFNmSfIhNWn6UDwlZA3gpP2dK/SeC4wtqgsn5USVS0TR3fFI6dWnz3OQF0c=@vger.kernel.org
X-Gm-Message-State: AFuF++njkC7GKs7uYO5WweW5XF4TVxAjpUpuUJ5sPwzNb82c1ws5ugjb
	x2WJPOHnX95joxKa5MLiVINAnSDxQoQkPnRYxca1ToIHKjHL5VcUME4467lUr0etAY0=
X-Gm-Gg: AYBFou3Yj/1vnAKEQGjdoT3qOsn/n6kZR21kcM7d8KPqClhW8fEf4l/atPTtI/E1QHQ
	PTh1W7e988+IV5mrDXOooreQ7kZ/s4dDzvsLpR1I2X8uNqdYsjkMaRUxbgmNdaVIUctONIdijaf
	GRVSSS+MKH0ZJPWg3XPkD+vwSi7QH+ms67gRoVx0zZBevgc/Xoaq3xECxBtqY5He6tdGyLh6EFk
	QDRo7SR7WAZ1wASeUZzkjYLdix3uC8QCjRAo7zCffHfVmAqoU174q1hwA35jyJ5y1KXB02EUWq+
	hoyCULNaWCGe0WfCgXQFydOf7avygwzhylS0bsAjCYGrsM6N7oLcedf+Ge7ZWOb3xAdQa0wDtk+
	z7hrKvlSIQKzDqAXtk5Q4bFhwo8I87/eHhlZ3HczgvO9FREjohGLIdYSVncXtPd4mP584SjLp/Y
	JBDMTU9beO6klMhpKZrG5PIN9Sl2AyVNph1urOtV993oMiXlHsmylJ1hymQ0gNiiRHLU8CNOdsj
	oYm4YTobWiCKqNclnYpgtHOPpbx5Ea9cdD2rN9xmdQzx45/teJq
X-Received: by 2002:a05:690c:580a:b0:864:7ad7:a2f9 with SMTP id 00721157ae682-86c5454e9a4mr46305737b3.28.1788429915878;
        Thu, 03 Sep 2026 03:05:15 -0700 (PDT)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com. [74.125.224.43])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c18ac2f34sm36498707b3.39.2026.09.03.03.05.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:05:15 -0700 (PDT)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66f96418909so1270118d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:05:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwsyE3kLjOwyY7ddj8NlwquUFBH5pTwGWQZgx+jYGAbephjcwQoslxbKmEHCNy6e4T6SpcWGgPsz43MaD4=@vger.kernel.org
X-Received: by 2002:a05:690e:4890:20b0:66f:afdc:b49b with SMTP id
 956f58d0204a3-66fafdcb54bmr290871d50.0.1788429913913; Thu, 03 Sep 2026
 03:05:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829094758.23248-1-tanure@linux.com> <178818026093.2318126.3676223463693214854.b4-ty@b4>
In-Reply-To: <178818026093.2318126.3676223463693214854.b4-ty@b4>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 3 Sep 2026 11:05:02 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
X-Gm-Features: AcwNN1VRB2D0FTXRpcvHAcbTlWB5xZQpxaG0zutz7J3nfFbo_PpnG2ATadEMYz8
Message-ID: <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
Subject: Re: (subset) [PATCH 0/4] arm64: amlogic: t7: describe the VIM4
 supplies and keep the fabric clocks running
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Jian Hu <jian.hu@amlogic.com>, 
	Ronald Claveau <linux-kernel-dev@aliel.fr>, Brian Masney <bmasney@redhat.com>, 
	Chuan Liu <chuan.liu@amlogic.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 1:44=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On Sat, 29 Aug 2026 10:47:54 +0100, Lucas Tanure wrote:
> > The Khadas VIM4 has needed clk_ignore_unused to boot reliably. Without =
it
> > the board hangs at random, loses storage and corrupts memory, and the
> > failures move around from boot to boot.
> >
> > Six of the SoC's PWM outputs drive the board's voltage regulators: the
> > always-on domain, both CPU clusters, the GPU, the NPU and the DRAM. Non=
e
> > of them were described, so Linux saw the outputs as unused and switched
> > them off about a second into boot. The regulators then drifted away fro=
m
> > the levels the bootloader had set, which is where the corruption and th=
e
> > random hangs came from.
> > Thanks to Chuan Liu from Amlogic for helping me indetify which clocks a=
re
> > critical.
> >
> > [...]
>
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogi=
c/linux.git (v7.3/fixes)
>
> [2/4] arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
>       https://git.kernel.org/amlogic/c/ae7be5c58a819259e5eb98a3abfa608424=
78f2ae
> [3/4] arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
>       https://git.kernel.org/amlogic/c/1e5a53bd16ac501e68463e84023d1bff54=
3cc696
> [4/4] arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM
>       https://git.kernel.org/amlogic/c/406292fd75f95aa3010fec95b5beb5a8b7=
e3ba3a
>
> These changes has been applied on the intermediate git tree [1].
>
> The v7.3/fixes branch will then be sent via a formal Pull Request to the =
Linux SoC maintainers
> for inclusion in their intermediate git branches in order to be sent to L=
inus during
> the next merge window, or sooner if it's a set of fixes.
>
> In the cases of fixes, those will be merged in the current release candid=
ate
> kernel and as soon they appear on the Linux master branch they will be
> backported to the previous Stable and Long-Stable kernels [2].
>
> The intermediate git branches are merged daily in the linux-next tree [3]=
,
> people are encouraged testing these pre-release kernels and report issues=
 on the
> relevant mailing-lists.
>
> If problems are discovered on those changes, please submit a signed-off-b=
y revert
> patch followed by a corrective changeset.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>
> --
> Neil
>
Hi,
Please don't take this. I will submit a better version.
sys_ampipe_nand should not be critical.

Thanks,
Lucas
