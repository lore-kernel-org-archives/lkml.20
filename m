Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616B312834
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377409; cv=none; b=krTYE0Ma67Q96RQXixMm43JO7xNsITRKYTfpiT954VvPSO9JCosnPM23/rDKgrFwh1mTnkGYqrZsAlrWK3BahuHCI/JvUbAdrzBBoYHq3ny41coDRvzuCZbiYjt2ErVNtwoKbIFOc4MMQZDblDd4k02z82GSJt1VEUuntkF/z+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377409; c=relaxed/simple;
	bh=lL5fD+w9Z9W5MFPTiA6NfyqDMUa/V2c57aHVggpsQ0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4uz4imyoI2ObEqiODKB7z/TJVy7maOSP9urz4bQioLTpZv1ZOFdwy/n2zmTFJAfoPDY8F+KpAk+bdJLCIU24nYeWK1M6nzX7hiTZdAbOTwoXoR4VVDLx/jTngh71+Rej3tBtxSUrZkb7KrC4sitgONZS9Kgeay8riAipKioSVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOpL/5mZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOpL/5mZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF671F00898
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377407;
	bh=lL5fD+w9Z9W5MFPTiA6NfyqDMUa/V2c57aHVggpsQ0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FOpL/5mZNhDTMrJ06E7znQravKIhaA2LoVaMeq/SJWzDBjJGyk9NVWgdn8CR6sdEO
	 EWwoAxzwOmvP8gtUYNGeVFoMjS22O23tBTK2mvghDRttgWSXbR6oU3RgRYPUqNa+oW
	 SKBpabQeunGjmXpknDyZJPgbEPnY2sMjg5PwHrvzCkXchfww+BbNNAswXLyZfZDIP3
	 dwLJ07J5TafQ/1uza03T7abPY1ow+vmxTubG/pVTgXY+sBjlR9F6OIsG/Tra25Kx2p
	 fabaoSrrZs5BHpn7g312s8pRClQAwxVO+eLihvFUXkxMUCEX8WYj8Q3eKYfYLQZZa7
	 VFw7lMdBuZLLw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f17450so1442597e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:16:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwPjtukyWtfmms/5TAChGStZ+K0EQOjFfts14BU1CMr/mr6tfvVmAhJl/XyoxYrS13XuXWV1ooqvICRa+0=@vger.kernel.org
X-Gm-Message-State: AFuF++mFX8moN+57m+lK4NE6dKfFvQeWBRGq3K51pqWkPYne/0MUicw7
	qEcvuDA/TvyOV7wF1yGJREg2x4ZUzWuzpDE2CRb8nL7iyx9+8Q1btXLaSWvQVtyAR7sKtp+dHlZ
	HhVmxg+COSPAxaHj8yW/0A/vxAkAwrEk=
X-Received: by 2002:a05:6512:2252:b0:5ae:aeeb:e902 with SMTP id
 2adb3069b0e04-5b8ae65e118mr465823e87.13.1789377406368; Mon, 14 Sep 2026
 02:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787830440.git.misha.zavertkin@mail.ru> <bd1fd3ab47001c303e62d331486779c2be6d6eb3.1787830440.git.misha.zavertkin@mail.ru>
In-Reply-To: <bd1fd3ab47001c303e62d331486779c2be6d6eb3.1787830440.git.misha.zavertkin@mail.ru>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 11:16:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLmpe83LJyx_3T6CP9tAjB7LbA=nkJjiYKdC=WV=J3z_jQ@mail.gmail.com>
X-Gm-Features: AcwNN1X7HXA-0AQ2MyHLjmaPjKkos5_RD-aC0ZNZ7Zg699iMEX_ahmRBpDwAIDM
Message-ID: <CAD++jLmpe83LJyx_3T6CP9tAjB7LbA=nkJjiYKdC=WV=J3z_jQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio: otto-gpio: Add gpio-ranges
To: Michael Zavertkin <misha.zavertkin@mail.ru>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 4:29=E2=80=AFPM Michael Zavertkin
<misha.zavertkin@mail.ru> wrote:

> Add 'gpio-ranges' optional property to reflect driver changes.
>
> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
