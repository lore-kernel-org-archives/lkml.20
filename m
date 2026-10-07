Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C8D490BE8
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372978; cv=none; b=PpLDtGbSMd9eztJVPBqw1rgW6XZID4ffbiLeBB3UOHhu8VG24OG7YO3hQO2OZB7BUs0+SavXNtaDKnnqGq2X1Ny4Gj9RIRBFt1botBWcxKRvgbfEQZnJLs9xq40FJZLpeRyoXY5my1uyYmOZ/XSXZjCbmUcZj77+Gvf5oHKM7bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372978; c=relaxed/simple;
	bh=6ccFrIMNi8thTcS7ezaWwGEgxkFr3q3PBiPerXaosRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jbv7DJcTQVscP8F5xYUiY68uyjP7ij13RMXMBljx9dyJDMrobdbW05ixauRVqRteFvmWRP2x41UKr2l8sT36H0CkSwW2pYJooWKBu1qk6BrY4t2ybSdjxTIeYoB8yJesU6/eK/djx1bKRdb0meUFZuC1u9sTzCyXpfhQvaN1J98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O13lfC7f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O13lfC7f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB941F0089D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372951;
	bh=6ccFrIMNi8thTcS7ezaWwGEgxkFr3q3PBiPerXaosRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O13lfC7fZI9543LnfkOM+QX7j9+aaHndmCvTCIC6h91hpGup8MzTEpnynKjXdoZxh
	 Usa68LauI/yxnM5kMkcteBMqM+dXJyfmA5iNFArfOTIGaxktgx+JDT07pZ4cyp5WCp
	 RJVU3xKj+9JPMuxHQCCgPctfFqtgJdyYPfgycRKoUPiNWsNlh4uQ3IXOrzsSr2RUuK
	 3HI5zD73WDuBep40/gojfCA+imj5MFVoCsI2sh8WGdTWCWUOHO7pb5TtDN+zHaZNQR
	 /dGFUvq1H0erUXpjM0bBkQy5vww9kWFZVltHMqqlncqPB2xX3EiQG9TBiebx1FKkWH
	 b+HOoRLWRCDGg==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-49dd13a91d0so1243798fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzL+kHtCPRSKZRhb+4SGTIGEAMGVx5UyUxqs2LqOOrZ4+vJ0k8O+EbQjhz/5XDbKH6MU6hm2Bmmb8VoXjY=@vger.kernel.org
X-Gm-Message-State: AFuF++lKDHWl6+drrJS4dfaqqbYoab1DU6MV5hcEZ3VTlFZBmYoWdJIG
	75cX7/BMBrODF+HSvxl7t8nKUEpLXiEFlVzJJS7Cp9LbMcmHKH3UV6YkY8hvZTpSuU3/dwRyBAN
	tiyISuJl5T4raSgew+s481Jo2tFEovcs=
X-Received: by 2002:a05:6870:d406:b0:49d:999d:c25a with SMTP id
 586e51a60fabf-4a25915bdc1mr1996175fac.6.1791372950531; Wed, 07 Oct 2026
 04:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-6-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-6-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:35:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLkupRELX-nA=ZWjCaE4=gzipE_njzxHtVXEo+7O3AUtag@mail.gmail.com>
X-Gm-Features: AclHuK8iblHRTpngvxt6CuhsOQoecYGccKQlKm7R1bCu_zgHyfj-gKel07yiWEg
Message-ID: <CAD++jLkupRELX-nA=ZWjCaE4=gzipE_njzxHtVXEo+7O3AUtag@mail.gmail.com>
Subject: Re: [PATCH v10 6/6] pinctrl: mediatek: Add MT6735 pinctrl driver
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 8:54=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> also supports the pin controller on MT6735M, which lacks 6 physical
> pins (198-203) used for MSDC2 on MT6735.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Patch applied!

Yours,
Linus Walleij
