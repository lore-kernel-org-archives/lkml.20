Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB54331ED7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147343; cv=none; b=GnTxHqz+Gl/NvFoRd6OIVADQsvunmGGtyN8QiV7UQadL46aeiAaS0K3CaRkUS3tjzOTjBIc2tM1AJ7MsB5YRAZsdrJnv91pzJkdo1qePGVkXZXNJwvJlrHKq+k25Ft9bXlZR72B4w2bEMQ4B9l4jcvljTFw7HRseZ53QhvjGbos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147343; c=relaxed/simple;
	bh=TEDBnX1lzLmQHX4CFyGy7UEUczM3xTnw+yYkHXz3xP4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ED2uLuVKXn6HG+srPUDTdisKiFFC9++5wIeNE1Aj8spbVahu35PIMAdcGZCFwukTkJdAtBeCLJBbR9l9l9k4sduQ1SjJVPGRhsBHUL9fSNrT4OYmidez2+LaXbJDspGsUGr4kZ5yLjV9uzgcmYeXaQWq4qLnbGMVPX0spUNVNWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOYhSaBu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOYhSaBu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA971F000FF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790147342;
	bh=TEDBnX1lzLmQHX4CFyGy7UEUczM3xTnw+yYkHXz3xP4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=kOYhSaBuaEMdwZYyUJxUpENL4labCdjRU2gD1CSJLo4ilU/644HDFsUGrDKI5/Uhw
	 nwwTBTC2VD3u75DuWTwwywxfGtwL67CvaQzZ6UZdSYbNEpL8hs/JfyMC97VP5dYvqA
	 6wLPY/y8Wgfqsx2g/pOxS8ZaFGCtpjtiCgbrO/rNQtkZliG8uuVjqqpfAqYUS9Fp7o
	 WH+Gmjh1du3ZEhUwFMy1Zp9cnRCNJKuN1NqakFnODsIP++VJVoiBTHQ+dJkZZ/bRQg
	 yLCllWZWJEenwBC7aWaFBkxtN/tDLgbUInZ3SLDVNc+y7rBpXuTCuYaDI0kBgK3hg4
	 xvxaCu9aYTBWQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a2015bbfceso12244231fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:09:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzcjWvvubT/bpnscW0WfvDNdv/RfOCV6P6MNQtLFfza+kgEIJAyHFOPCdds08lywGu2BuItGOPfqt2/e4w=@vger.kernel.org
X-Gm-Message-State: AFuF++ngxax1tzSHUR0mj5dSPTTvabrN9PjaA+T5vraVC+APZAjDy8nd
	aVa+JihycqwOAju3JNTKjklBdUqmLrDsGffq0SrzDGLU3A3Q6PCaDu8+ltbAgfGQGpVu2c2+CP2
	+QS1UoFbpHgaqaW9VXJkFwKgqVZNBKhTl5AG4InoNbQ==
X-Received: by 2002:a05:651c:982:b0:3a5:d78c:c0df with SMTP id
 38308e7fff4ca-3a624d707cemr10895031fa.13.1790147340949; Wed, 23 Sep 2026
 00:09:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 00:08:59 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 00:08:59 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 00:08:59 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdmCgbxc+WQHCWvXZ5Wywv+3x7Ncy5kQ5HF=V6u5-gsiQ@mail.gmail.com>
X-Gm-Features: AcwNN1V-Og3bFufMot9xYEqrGg76kE38VSvV-ukP2Jt5ACNQwZyhsphBMWLukHc
Message-ID: <CAMRc=MdmCgbxc+WQHCWvXZ5Wywv+3x7Ncy5kQ5HF=V6u5-gsiQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add LLCC node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sep 2026 11:17:35 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>
> Add the system cache controller. All sixteen banks are listed, four per
> DDR slice at 0x100000 strides from slice + 0x800000, followed by the
> global broadcast OR/AND regions, which the driver expects at the reg
> indices right after the last bank.
>
> No ECC interrupt is described, as the Nord interrupt map does not expose
> one for the LLCC. The driver treats it as optional.
>
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
