Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971903;
	b=qVjKXziXzodFL1mHdNra3QprYTYdWPkXxozlQZesJPVb8A1m58dCVAjBgulJTGy9ywhA
	 rRrQLGH27IZPegTeAbhBotsBU8WyJY90WDISEpOqKfvsbmW1ZKDv0iz3BX903DlmHOp5k
	 7j7g+dv+aOa+PFRiig81en01GLOY97dvdgSAVZkSSBGAk1THghaOyQahbDBFhY2QxQut5
	 pzLnBIRPU436IiEQihyOfG44FN/N6hwi4xZcMI0CNZ+HHaTEZaBVyXj2q71Y+0DPKt6p2
	 hqx6fVxEw8WfI0za+ipqXFjfNuz36axslUoa6ii4xtRJWvEgRgRiQcys/IFteM8aPoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971903;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VvZmj0RZ6Y0bV/owPEjvnUNIaIep4zjJX7GARLr8Q7I=;
	b=U1hGv0kEcHUkHqZJCDcDdzfwbbR1eRjnj+a0XjFqth5/+q/CervBiHJMq2/G7cOdGJG3
	 Rm5xstFm/W4fPxnD+yBO5onUcLj6JWkrbkBoeu6TYKfXNfY3zbzD7s2GD70AK1pgWA/an
	 l8dp1YuF7jHL3RqKBeRVlxcYT470RW55KV5r7qlNc9Yu5nhLddYnsuQgmbu/iJbPL1aEE
	 ruYTSJscRvgFXJ7pomHyNw3QaYNUPSS0oCUB3/9bEq+Vpa9knKRfRf4yfhZIOssJzG5QD
	 2PkWGhJPLA5qkANKwvEnO6mfzR0sn4fxp4xKmKQH93PyJzWumU4TGAn1vu/t15JG0VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J3rrxPoq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6885606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J3rrxPoq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FC51F008A2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971902;
	bh=VvZmj0RZ6Y0bV/owPEjvnUNIaIep4zjJX7GARLr8Q7I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=J3rrxPoqCirEyT/mJ2GjbSTHv8wAGnJ1/pJpHH8UctQNYrfI6VRDgb+O3QvzHyQEH
	 1g/qw8HrDHUsOMoZkeT2aKer6w8fDVLZDdVLeEODkdyXQ4t91rVtLlCMR8D40Nu/hT
	 pQgXlxVFbHIdOzAySa2q8Np8LW6Ht9waVn9x6dPhloVPfFilVAeKrtDb66KD9W1g6U
	 VeWKv3+v50zpuLjlPxpoe/YoAugBfDSe9cbjy7enfslRq+kmR5LaRUUDD+VoY3UM4r
	 sPxDZu3Iq9yA6bPijCGamL2fqBVW8GF8B50s8cRA8Mcre1c211Y47wpvzznQF3unPC
	 bfOoskwOesm5A==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab53a99771so3664891fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:31:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxUtfcjvCLVzMLqcSoSVBalRvLyLX8fIk5bKik97TJJq1K4nHSKCZS/w6QQQNCeKLi5WxT2/6naFpA9fqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rd0dm7oVXD4DNXD4HORJHyETOhfsGJO7Re1gcS4y4E8LdqRPe
	pef2pntTgAB7iAhKZGguAXweYwAkAyABxRy81txWtX5btqaZQtkusf6UPCbrcSnITVD8JB54n/i
	qhDimSRlL5SqVM6xZ4wmgYDw7SFQDAKM=
X-Received: by 2002:a05:6512:3e0d:b0:5bf:b7d2:c7d3 with SMTP id
 2adb3069b0e04-5c003c1dd06mr786520e87.39.1793971901418; Fri, 06 Nov 2026
 05:31:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-superm1-pinctrl-maintainers-entry-v1-1-c4cadcfbd984@amd.com>
In-Reply-To: <20261105-superm1-pinctrl-maintainers-entry-v1-1-c4cadcfbd984@amd.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:31:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLmtETeQqT6TFdui4+eiLrKNvRW_fdOTBQMgM_Vn0Ribhw@mail.gmail.com>
X-Gm-Features: AclHuK8B1tM5UNXp1ov6mWPY-0W7hdExHUabApyswqYyIkMddSr-lboYm3SEn28
Message-ID: <CAD++jLmtETeQqT6TFdui4+eiLrKNvRW_fdOTBQMgM_Vn0Ribhw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add a review entry for pinctrl-amd for me
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 7:01=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> I've been looking and submitting patches for a while, I may as well
> be looped in on patches too.
>
> Suggested-by: Linus Walleij <linusw@kernel.org>
> Link: https://lore.kernel.org/linux-gpio/CAD++jLkRYb1Pn2G=3DcP2yGkSFbuHhz=
RQ-fDbTygmpxbCsm-02gw@mail.gmail.com/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Excellent, thanks.
Patch applied!

Yours,
Linus Walleij
