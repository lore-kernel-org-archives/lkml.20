Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BA848FF9D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577972; cv=none; b=jqeJAhCJOZ6yMN4IZkD3u70RKMIte4+8MFlEJdY1ZeG+WymLkt7Na5SLyexLMmfe4fwh6eLlS+jo/IZGQ5O/xyqfoz1anQ/LYcQUvQrcNcIlJwuO+ks2uc0kOvw1ZrlGNItaL2g+MiMNSv9CXiM4sUhRp7+oZBit6UT/9VnVcHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577972; c=relaxed/simple;
	bh=sCKOAQ6q3IOv9589d5+TMd6PkNK0d6K2VF/Jj1/not0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U9Hn/hEhRnKMqJYyG6NyAXgusMl2rwLvHBgKlM/NFlIGcnV/Jerdxu7epvR78JuiCNS8IlPqrBEY6k893KY479adOryT0cp9Rpamf25Gp79h7jV+E1r4PReaml4tbkC0ZCHq2V/DeDZqB7g/USTFQwtx4YyKpZGjLHBDukUJVWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxLjr/zq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxLjr/zq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948071F0089F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789577950;
	bh=sCKOAQ6q3IOv9589d5+TMd6PkNK0d6K2VF/Jj1/not0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CxLjr/zq5awXlYm+A6e8PszYPrvbuv8SEElAf89XU+RnAaUGpDAC+Zytljrmr8o4c
	 FdRa8ABvsvHgBgv89JlsWP+7z8iuGavV5m7vpz//I6rO8eNC44uZQU7PU5QdOdx5W7
	 IISe0CKSxyFhix/cCxUb2PdWGNTpQt2DktI7EQAIBQj2TqFkgJVn+jjQ4XHKitDyMI
	 NSFFSeuCNI6YGkfR6ywrtyBa3O0bsLn7Agw1owLnBTu5d6UPyAYI+NVvK0EEL3Dv++
	 HNo/gzrXU9fBP8YQkbEjKIP18tM3bn/pmm+zMmv/XdYc311NCPTkviMs061ksUSOpC
	 ly7dmMgw8T+Ag==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so1520088e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:59:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzpa2paTBLGR2xP/K2ULAdFDDG10pmBN4eOGFgUqsMrsZiYyfQ8j+f6yxSt/il5HZ3PUAY2xBx895R5vk8=@vger.kernel.org
X-Gm-Message-State: AFuF++noWQ4vuHEibOEKQrGoNLb8W+TSYctwZhlmO9EQYt5hBt641MiK
	wTFQ7XS08nccBwa0niyN1W9XXNjYHSAcfNcLalyWrQQiWcfK+DU+iqU3DF1fx4EoRHqdaJouD9j
	1vlVe54+JE0uIG530YVgyzZMBfrBOLf4=
X-Received: by 2002:a05:6512:3347:b0:5b7:6735:260f with SMTP id
 2adb3069b0e04-5b8b6671067mr785119e87.67.1789577949266; Wed, 16 Sep 2026
 09:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-fw-devlink-nexus-ready-v1-0-68fe1996e78a@toradex.com> <20260902-fw-devlink-nexus-ready-v1-1-68fe1996e78a@toradex.com>
In-Reply-To: <20260902-fw-devlink-nexus-ready-v1-1-68fe1996e78a@toradex.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:58:56 +0200
X-Gmail-Original-Message-ID: <CAD++jL=qaXxEr_sVnAF7BLUvp4ik+f8Zsg2sKY6n0=DwWqEYYw@mail.gmail.com>
X-Gm-Features: AcwNN1W08ixPUt1OAFzYlOyj5ELEgdAq-l8aLJH_GmHSe9MLq2CYRkq-wafwNZs
Message-ID: <CAD++jL=qaXxEr_sVnAF7BLUvp4ik+f8Zsg2sKY6n0=DwWqEYYw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] of: property: fw_devlink: Follow GPIO nexus maps
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	"Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Frank Li <Frank.li@oss.nxp.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Leonardo Costa <leonardo.costa@toradex.com>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 1:42=E2=80=AFPM Ernest Van Hoecke
<ernestvanhoecke@gmail.com> wrote:

> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> GPIO consumers use of_parse_phandle_with_args_map() to resolve specifiers
> through gpio-map properties. fw_devlink instead parses GPIO properties as
> direct phandle references, so it records the nexus node as the supplier
> rather than the mapped GPIO provider.
>
> A nexus is a translation node, not the GPIO provider, and need not be
> populated as a device. The resulting fwnode link can therefore remain
> unresolved and indefinitely defer the consumer while
> device_links_check_suppliers() waits for the nexus.
>
> Use the map-aware parser for all supported GPIO property spellings. This
> makes fw_devlink resolve the same provider as the GPIO consumer API. Dire=
ct
> GPIO references continue to work because the map-aware parser returns the
> original provider when no gpio-map property is present.
>
> Add OF unittest coverage for mapped and direct GPIO suppliers, including
> the deprecated singular and unprefixed property spellings.
>
> Fixes: 7f00be96f125 ("of: property: Add device link support for interrupt=
-parent, dmas and -gpio(s)")
> Reported-by: Leonardo Costa <leonardo.costa@toradex.com>
> Link: https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4j=
bauradujrre@gc5nbdhhixaf/
> Tested-by: Leonardo Costa <leonardo.costa@toradex.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

I feel it needs a compulsory review by Rob, but AFAICT this is
in line with the Nexus ideas.
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
