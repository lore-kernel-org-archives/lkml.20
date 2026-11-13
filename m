Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564695;
	b=5TwTKDr10oFpVRu51FPgAM5XxVPgeiije1tewTCbzGc4Z7dnQnY4UThSzm8xqHQJ3cCt
	 HedDrcp47SdqCS6XvQj8X1PDnTZayoGRwtN/71lakDodDX6khJOo4alJHNc/6STtvNGyg
	 dgpVv2AUYforAZ5qAtbB/PKbxcmAtokNGkTMXZ2c/U/SUVWEDylVuI/+HMdYl/PWUlK9d
	 inC7lpLpA4HF/KD3INrSg715bwCc6Rzh+TOkWUkLMPA5v/lEkQe+23yI9qrVr5VrQ21c9
	 jX45sTr3RDiljUkhc+s+ouTNCYIkIeZX1Z0d5t+HA18ceHMlCNxzWLjaBxR6Ii5qU5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564695;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c5kWoRfoh+LID+vIMXgha8z+pQ8NIChzIfvaIu/18OQ=;
	b=U4q79R/RXIjsf9zOx6bLoD/OywGQ0pSTKesZF08TUC1uR2sh5v4yy4QJu5u0RO2qb1DY
	 mzTs7U2IPOhWXMPzhr2oiyVFrZAs1O+XdxFRbMnF+LBLTo5ep2e56rIQ6GaIOBBzDCsVp
	 3DMvh18HrwtxGuiufodzNeOURPXleylXSNfP6vrpjIf9/d1pln88e051F5icCbbFe/Kh2
	 15qSm01JKz7DpAYs+HiDz7IHVnhyxFO3Tcn6kfrLOYVFqXiF5LIK/wNRvA2pSIY+uDsAL
	 P1d5LZa7cUWG/DyliXLs7I/Y5umwG9HV4DEeU3DDUuL0sVO3oY3gW/3Exi7PDClijbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVfrwGb7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B333606A8A3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVfrwGb7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C610B1F00927
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564694;
	bh=c5kWoRfoh+LID+vIMXgha8z+pQ8NIChzIfvaIu/18OQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YVfrwGb73VBd/mLLVth1dbc+CKZgt/nfR7trq3JvDURbVPM88IHuNK4v+2g7Yt6xe
	 8TVrG6j3pw3Povif5CHNl0Ov4qX3JPFeIsEt4dbI4V6H34DWMcEfF0xKdpRLQ4Ybxm
	 2UI5U6Z/P4MSaKw2PTrRBN4i7tAYUUQqRw9KC8+jtGw+l1617PQYrJqgI8MwMjXgC+
	 uOto5Sqha6sV4NCrnJKFIdysqQzbvBIuyke+5he3GcLRuB36FGs37RrXl56CNhWBVO
	 FBGHScyeX/XqH3y5R0xhOeeZprbuudAvWMJ3sxKIZmD4DNa2E4v7sPsl0uwcdzE0qf
	 8+VoX66/yAI+Q==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6deb848ddd7so1028321eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:11:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEnxxKtSKsCAmcd8QIE4odXKqt7gGMEf3FBjJVMbAElVWP2t4C7xnhfovGu4Uvyw6o+V7d33/bSaEgxSCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+99FAmXgQSSSaV4IU1BzQjLvPtDJCQemDbVaYyD8cppJD8Y0gP
	nMakeIw9ja4AflFzqR7dcFV1tj4mtOHShSnxLWZtJ6hPeAD4w1pZJLx2ib/1+V5kIX3+5TDGXrI
	LtWUx1fqh2FkL4y5pa1SUOXw7r+/SGXQ=
X-Received: by 2002:a05:6820:c2cb:10b0:700:8d6d:93fe with SMTP id
 006d021491bc7-71ab50158a9mr835957eaf.38.1794564693938; Fri, 13 Nov 2026
 02:11:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:11:17 +0100
X-Gmail-Original-Message-ID: <CAD++jLmS1Et_B_U2W5W3GAx8ge5V+B5innksqKwxYnBzh=JPag@mail.gmail.com>
X-Gm-Features: AclHuK9gw9rzvmJfnK1wHvLc_pWsubTkRQG1I-TXfEXhLtnbQg50tNAfCDomXWw
Message-ID: <CAD++jLmS1Et_B_U2W5W3GAx8ge5V+B5innksqKwxYnBzh=JPag@mail.gmail.com>
Subject: Re: [PATCH 07/11] pinctrl: scmi: give no groups to pin-only functions
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:58=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
> driver registered them as groups. Register pin-only functions without
> groups.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>


Patch applied for fixes.

Yours,
Linus Walleij
