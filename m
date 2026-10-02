Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CCF4AAC63
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947787; cv=none; b=iWLxStXA6P+HAsaO7qTj6h46fU3XIGM4Byu3KSz4KGegspqvQJ3CUZy5NF/+2AUgn040RU+AckAcGwBHKkQ+oRWT+Kwsq2ZdXadABM+hNa65kqiqN6Yctnf38HbsvU/BU9Sw45b55Md2PDxpeJtidKeMwm84UpA8oGrK9b8p9QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947787; c=relaxed/simple;
	bh=mz9iUP0v4DTEP90FdhR7m5iuHGwHG/WevtKBp9xCmIA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6999CFi7uJCReGbuEZMI8MxIxNztY8vsiY4duWUndYn/6JqeyQnq29bBDSzJiPUe7WlsBxGKWyqCFx0MF0jTG62dxH8vkW27eQrnTkwrEzi6OP7j5YvyODmO7Cazt94klWjF6+HWPXgbwvVS6zlqA2f199cGivjIc7ZeqZBisk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=livCC1MD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="livCC1MD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC8D1F008A0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790947780;
	bh=mz9iUP0v4DTEP90FdhR7m5iuHGwHG/WevtKBp9xCmIA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=livCC1MDTQ5Id6BwLdMVyG+stt67wEjABOfFWONZOehPgwCiQJ6Re3u7ajcFpPlGd
	 WeUQ4APnE57AZCi9m/01fRARPAddxhZFEVfGf4K225b7G3sfyW4bA8Y7AgQrLktzoY
	 tb0Lj2o/e7qlgkiNm9jstFv5H2IpG3iBSDF1ZVsbgDDuxFhxOZ5ZgxkV83YupXiokp
	 Qa6o2t36yiBAw/a8AQkvzGyViLPehvcYYVcFeC9XsH6EdOL2e31cEb02A30OlWRWr8
	 9rEabtslmeYTaYXOV1/nWvz2LvucFZvNmWsi1QptQ/nTkM4s1SreDdP+ehVpJjKnsS
	 kMi74Np+/6l5Q==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a779b23f05so22642421fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:29:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByc/B0F38Tc+eUCG9OY81NR2MP6mdX52T6h46KlcdC93XJZ8EaV7HCGVQoemN0mkICFDMG+OLb1sPFjvdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHIwZII7S+/4eA3BxV2YELTgTHD7M7Ie5pIb+GOej798nFyNfF
	r106NPS/OCPYfNJB6OgEQaTbb09VKnwcXHH7lxzO2/UIetGDpkiJDdFuQgUM0sqx4d1PvpBN8E8
	uePxOA2IhXMblhpcSGa3Kyrow0jbE4WTaF1GxOtwc3Q==
X-Received: by 2002:a2e:be8c:0:b0:3a6:4452:bff1 with SMTP id
 38308e7fff4ca-3a8877b37dcmr7461191fa.16.1790947778657; Fri, 02 Oct 2026
 06:29:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 16:29:36 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 16:29:36 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-4-b24e2348e8e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
 <20260928-arm-psci-system_reset2-vendor-reboots-v26-4-b24e2348e8e1@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 16:29:36 +0300
X-Gmail-Original-Message-ID: <CAMRc=Mchn4YHX3p+Y1f+mpW2DW0Vv5Z5xngxWJt8rczY23Fp5g@mail.gmail.com>
X-Gm-Features: AclHuK-Ef5zXTasgvfxWkin_hCN8CWI4Y3M6MqXWqh3YH1TDztK4qUV84kA9Flw
Message-ID: <CAMRc=Mchn4YHX3p+Y1f+mpW2DW0Vv5Z5xngxWJt8rczY23Fp5g@mail.gmail.com>
Subject: Re: [PATCH v26 04/10] firmware: psci: Add support for PSCI auxiliary devices
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulf.hansson@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sep 2026 08:09:16 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
> introduced, would also need to bind in the same way, leading to multiple
> drivers attached to a single device node.
>
> Introduce a PSCI auxiliary-device provider that binds to "arm,psci-1.0"
> and registers PSCI child devices on the auxiliary bus. As the first
> user, register cpuidle-psci-domain as an auxiliary device.
>
> Update cpuidle-psci-domain to probe as an auxiliary driver and use
> the PSCI device node for power-domain traversal. Allow the probe to
> succeed if at least one auxiliary device is created.
>
> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
