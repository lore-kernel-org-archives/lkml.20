Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565455;
	b=Uk6Vih50mEZuAhxvf8AulinFsketqMDMaPaPXOQKvWFIh3mP7MaHQXBGNaDJ/jaCT8CK
	 SbZ09JgP7xyf+Nziabv0A61SNhOu2eJngZrmu+MdLWrYRPaKt7caqEQf2LjCsWxa2X1m6
	 XR+W2TTI3LYHFboIJF6WF0bvLWa7u8G5SynQW3cT/AmkWtISW+9ts8FlygaB5LoHOqEMa
	 3Ms5pDdrZz0NDit3A4MfIzlzq2GrIh+Og3tyimLtm/OJM2tIfJarKD/K33LhEFfirwSHd
	 jUTyvtIvKUSCbxlhCB+5ZbOHjOGj/4B6nQ3GFTAFu8dSD2UQ6Xewkd37zjJYuGukR8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565455;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QkN+1eF8Y/XADWpxlJCNMdoZN2CgphaWq6d8zvGa81w=;
	b=iG+Ealry/AEL6d4Y+qeViKvakx4wJ9ww87u5h9AYuLPsk0ZYtSIrvbgy8LSWgAjZfyr4
	 YcpbE3VqbtZL0n+XWAHK4QhyMwA45GxGw5CtlQHSe42zcjlcdQYQCB/zRp9L1HmgBcLH5
	 1+JzdBycNYM2wsEFQBoarI1Z37Q0jdll0yz8K28ivFVUaz9cuIxzssy8L725GEi2HBe82
	 c72KpPYkHtvvJDzURZPcJEzGBVG/pKY8/HyaGWJrltXzTaylkmTClrsLG50e7okSYBzxm
	 gGb+0xNIzhMrE+hm5yb6jfi8M8htXbe9IPD1Cg2sBvGNBELI/ZQNEeBZJs4HXyw5Kig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fU65PqRC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661C1606A897
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fU65PqRC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E491F000CD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565455;
	bh=QkN+1eF8Y/XADWpxlJCNMdoZN2CgphaWq6d8zvGa81w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fU65PqRCkaugbF1FhT1enqvBJti9Kt3Y+4LMwZgGLCEYZAuDULEUbE8gn0RXxhC0r
	 H64aa3TvA2ZB4I3bgbaUTP/qr8/yKFtcOwcVsnYdso6Lca0Th33ouu4o1Hslh2EZoa
	 NfFY5a+UK89LnL17kju9CyePqTqRv7gT17OiHOGXsJsZ2f+BlDzpn4yyj6V0oPIswq
	 Wl38NWgsfBbRxjVEdbXxtDN2t4wactkK/HhHtuDmJnK6wWDq4kSOPjvhE5lYjpd1GU
	 wQQgy7egFx3GnGlX/XRw2LlyEwxJJ2gCWQv5Z/QPvDLeC3ufq4Fcj/BK2MRMKqXgs+
	 WxLGwzk+mPClw==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-49429181ce9so994627fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:24:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF4g29l4uhVVcvRD7DAZhtqyOLByeL7MTjgjzKk4yarjrUVIKAnlnWWs9IonZ8Q/K9F23qnPUh/iNpWxN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Kf/X3D4OUiBJSm3zv8nrmLtdjntLBT/LP37CVGcfAfGpZxxhs
	U3Z/JIUzi82AFHleKfSOrKIvFDiQf4YsMZ6f9sgDZ1JKX4NOEjZEXXtOsmgnaKJwctCT2mFjkPp
	TCsM4FLeuZnEqJy3Ek3fF9kdK1+kD/Fk=
X-Received: by 2002:a05:6871:7426:b0:48f:e3f5:c419 with SMTP id
 586e51a60fabf-4afdf7ccd7fmr2000857fac.58.1794565454219; Fri, 13 Nov 2026
 02:24:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-debug-info-v1-1-067c5c554f91@amlogic.com>
In-Reply-To: <20261106-debug-info-v1-1-067c5c554f91@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:23:54 +0100
X-Gmail-Original-Message-ID: <CAD++jLnKJGDM5woHn5UXGmToS0g6N55=T=+8Zy+F6X92N0zW2w@mail.gmail.com>
X-Gm-Features: AclHuK9SuxGHNdL_y83hLe0FJC4k4ytk2FDVH3qE4U10O6Iw68MpttghD3THgNo
Message-ID: <CAD++jLnKJGDM5woHn5UXGmToS0g6N55=T=+8Zy+F6X92N0zW2w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amlogic: a4: Allow functions without groups
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 8:09=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Allow function nodes without child groups during device tree
> parsing instead of returning an error.
>
> Only count and parse nodes with the "func-" prefix as pinctrl
> functions, ignoring other non-GPIO child nodes.
>
> Also handle zero-sized allocations when no groups are defined
> by checking for ZERO_SIZE_PTR in addition to NULL.
>
> This allows the driver to support function nodes without
> groups and avoid treating unrelated device tree nodes as
> pinctrl functions.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Add debugging information for error dts and Error pinctrl config not affe=
ct normal pin work.

The way I read Sashikos bug report the behaviour it is complaining
about is exactly what you want?

Patch applied.

If there is something to Sashikos report, follow up with more
patches.

Yours,
Linus Walleij
