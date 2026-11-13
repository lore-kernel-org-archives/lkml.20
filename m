Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565223;
	b=yNXunw0WvT0yQ+xdQGQO/8UWFy9UcqtIzjN3XsxmCh08GPSPW6X1VV/yhscxHue+PQv7
	 02GFH1OzIoTe6Pqjtfb5XSuxpSm0iNaDfv03XZM1wNl3x/vorXoXJTUSWG1OiOA8mVzy7
	 fnitLaqAc8K/2426QMGSBsRkl0YApiR9DmiXe0OW+SGa9F9YDBAqwdpDqUEXb5vrSxERF
	 R1TPMX6XaVGMuG3Dt60w9NUSWmevq1mwhgMl7ZdQKn+EPVolfoiARn5Kab46aSMsGGyvA
	 x0UJdrh6qx7XQ3Qo0rwVIM8fxarm+z8fT4YO8ICDVJ3iywocNg9XDPYqmufYKN6/NDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565223;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=e+QKN54s5dJC9PcohR2oIJVPHcl5qCaMa3M6f93yiFg=;
	b=rheL/+5eG7aaFJR9M7a/eF2HsUIIgWPJMrKAlXhGaNthpTYeF1Pgyq1vQysg3PgmWrz3
	 LtrMiiKLwKPItXEjvlcLIwcucZnzqmYj6wm+8NJbTRpRmYaGdLdKPiw/2uLC3/t5VjYva
	 kdYArucl+lwjwKMz9uIueh34zXareN76GufBV+MWPblBsof7/RbXRL5uW7eAB8yB0vA/X
	 VbGnufFcabacIQynCTbnIJhc0ZMaLNV8IceHV6f4s5Yit7qDfQS3ft4OmmhkQuB4EZ46d
	 ey4AH7e5W90yEbV2auMIsxDyq6Sf6LkQq8XZuyock4hMpoBUwi3a2uCDYG5pxYtGe7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCwb0LF0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B60606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCwb0LF0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D693A1F000C4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565222;
	bh=e+QKN54s5dJC9PcohR2oIJVPHcl5qCaMa3M6f93yiFg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OCwb0LF0A7Ak998VUdtZ2VMQp/bWG5nTo4fWRdQ86sWF1HhYqYuwSOOsxFzslsBeu
	 H3lDd9zvJdCMIkI9dbFBIYg7Z0u8eufwm8IHvs2VCrxER75RflOQAMZ6ykHRnll1R/
	 IxSj1nbNmWy0vG/aiDkcwtRl/yxhggDb6BqYURymPBGESFt6q8AFjUOJWdicW4p+VO
	 1CjfofiGVwhSN+/6xEbcg1bArAivOaDY0/kN4ux5aVd6fs5LdraYO3rEb6mSuFI0UF
	 VqH94MxONlDy2nJ8zyxFcXVrTFSkPp67d+CPSvkFu8mFV5C5aVHuCxvN/HEE9moyWk
	 +Bck65Oa4vbig==
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-84a248254f4so902663a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:20:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFJnNzTDXkivyrRe7KjTKdlRVurwbRWK9dRPUyRlJlwauIM4uYJ0h/EYtkwNw4jxW8B2rPI0eSB5WnHDxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jxtI3Rl24tFwzvngRz2t22plfXbd3MLWywlshmKiBq6qRGjgc
	raofjbyx3SHvuNuJdjAIoizrc6pYQtuKraJuQndkaI10KAqbvBsJuusEVyKF0mj9PB71+Z6huxF
	tE3Sok5auc8m88urXQHp+5zhFw6qQc3Q=
X-Received: by 2002:a05:6820:1505:b0:708:f388:af75 with SMTP id
 006d021491bc7-71ab5076282mr1109599eaf.46.1794565221874; Fri, 13 Nov 2026
 02:20:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105141347.488850-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20261105141347.488850-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:20:06 +0100
X-Gmail-Original-Message-ID: <CAD++jL=uDOiz7R5KJAfh66HudBXD_QpmETq=7LTouTcqgTYb4A@mail.gmail.com>
X-Gm-Features: AclHuK8ALm5dcSJS8WSzctJPTDL0CYbD-RRIi6GsaRl2wItphby29XEFcySloIU
Message-ID: <CAD++jL=uDOiz7R5KJAfh66HudBXD_QpmETq=7LTouTcqgTYb4A@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: nxp: s32g2: Enable by default on ARCH_S32
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chester Lin <chester62515@gmail.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthias Brugger <mbrugger@suse.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 3:13=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> The SIUL2 pin controller provides the pin muxing used by peripherals on
> the supported S32G boards: the S32G2-based S32G274A-EVB and
> S32G274A-RDB2, and the S32G3-based S32G399A-RDB3. Without the driver
> some peripherals never finish probing and a defconfig kernel cannot
> boot to rootfs on these boards.
>
> As the driver is required by every supported S32G board rather than
> being optional, make PINCTRL_S32G2 default to ARCH_S32 and keep the
> user prompt only under COMPILE_TEST.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

Patch applied for v7.5.

I don't understand what Sashiko is rambling about, if there is a problem
the build robots will find it and we can fix it in-tree.

Yours,
Linus Walleij
