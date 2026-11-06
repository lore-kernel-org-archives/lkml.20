Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972494;
	b=AqmHAQIz9h8GkREWoOt1pIh74hHuVRxL64od4d40ivJhJ+Dq+Pxb0qxAy6KLkI6VbZcK
	 5TMo2X6Bce79ikB3VstonY1mleyoSRB1zAcuO9wnLT9NInri9IGN1LzxC2oSjfH2hw74p
	 vcHEu0lqJN3PbNLSSaxGVIBAT1owLrfoIMtoFtkt7Gmex8Nt1UesRUgWWlgvT1fNvaqzP
	 f9lkLXl6EuCXGiga6kcjeucUVmnn+3LKme/b85Uf3/KaW9Iz5hyEgKr+CkIoOjoNjA47v
	 gYyvSP4NxZV2XsrNPtpeEewQ9O5ezronBK0Q4vgA5moqxdXB68li321Q7XAUEU6LRNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972494;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9q9/GucRs2rxMyyvIvEv5mBk2kzwKt0fGX5jZwrdxao=;
	b=XumXo44Td3cPrM0Kp4GQJ1Usl+KJFOj8PuDpWUWnp1m+UKuMfDgMUVyyn09/R8JPDk/B
	 /ZbWdZCpdTKMIEAu9haGMxZw5C9D8JAIsT2Ii6JEfCwGOjAPrhHPIqCJHyL7zZjv907R+
	 Ka0qakJuzkP0x8ST9vUgsV4zWmOT++3qXZVqP7Uu/Ruo+YZzyzB3bAreL8bVGnn2hgEmI
	 2OmEw70cbiOf7N+VRXhsqs08N5H4EIcvUpeRtrHy6umr1pxy9hCcvftmbM6H8vsOOuGcB
	 gkfs5eQ7EAWtgBJeV4x259sqG9cnUvAD9Eu/PCLg/wGQMyf2qsyQVsCAAcdjXQH4x+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N8+0WSWq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39133606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N8+0WSWq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F44A1F008A7
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972494;
	bh=9q9/GucRs2rxMyyvIvEv5mBk2kzwKt0fGX5jZwrdxao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=N8+0WSWqUENHDaYxOsVVcA7LZmsfPVQI92VWEWfyZMBKB+rkuQzJDXgMaNXULrRAq
	 Wxg8GJjgx3A238dchLEhz6CvyfGxyA1sQGufprE/Y6zwjo6iV/ez3TTBhxmhBqDS/l
	 yyIjwUfhoPmGj7c/cpT91cowP0wSgHsZn3YjDQOdiMiujyCOIsZXGpCeiuC8G7LAYF
	 B0eHHGZ0VmF7WYY2Ih4WiEiCIGtPueyVdZaa/bL58U4SpjVHBRLPLwiBedTz4yBZcG
	 8RqyJ6Ue/U5PmsTJdGxY9xJzEgP4jLXilJSTEQXuyYAAJ7nVqxdNrb98St+7MjLoa5
	 iTjUNiQ6Zxb2A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso497801e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:41:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzxFeG1DqcjjK4UIR1eB73u2hWiBN7Js0LJSc+j0hN5BRGv6EVGfdxNuMi/06kAdU83JOyeG1WSYj0I5Ys=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FJ47sHX6Ksy+AnB9WBqXdhtvH3NQmxNx2ce7HH5HXVEIyIr/4
	y1PmHJ+GmkQ6ZPgQOV4YhuZqOZJtWD/pPZmbzRvFABAf1Vhs3+/8RnIZnWKzxHkIt6kMGiDKfyL
	2hiEt4Wgbk0KeoSEckC0UFuwzOrB2u5w=
X-Received: by 2002:a05:6512:3c8e:b0:5be:50c0:9d1a with SMTP id
 2adb3069b0e04-5c003c1697amr924889e87.64.1793972492809; Fri, 06 Nov 2026
 05:41:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org> <20261106-outstanding-turtle-of-opportunity-9fafcb@sudeepholla>
In-Reply-To: <20261106-outstanding-turtle-of-opportunity-9fafcb@sudeepholla>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:41:20 +0100
X-Gmail-Original-Message-ID: <CAD++jLmYJM3VhKN00CjpRviQ4Zfr394c2o3xqZPqEZnq9yz-ig@mail.gmail.com>
X-Gm-Features: AclHuK9GhwQg2qUaY__IEUdcL3E9GYz9QB1x_ggUFxrkTttNeFsX88YL1h6CfOw
Message-ID: <CAD++jLmYJM3VhKN00CjpRviQ4Zfr394c2o3xqZPqEZnq9yz-ig@mail.gmail.com>
Subject: Re: [PATCH 0/7] ARM: dts: arm: Another batch of warning fixes
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 12:03=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:

> We can remove vexpress-v2f-1xv7-ca53x2.dts because it is highly outdated =
and
> relies on an FPGA tile setup. Replicating this environment is likely
> impossible since the original bitmap files may no longer be available
> easily.
(...)
> > Rob Herring (Arm) (7):
> >       dt-bindings: arm: vexpress-sysreg: Add "mcc" child node
>
> I assume you will take the DT bindings via your tree.

Me too.

> Linus,
>
> Do you want to take this series via your tree or prefer me to take it ?

I think it's better if you do it because it seems you got thinking
you want to delete some files, so then it's better if you
queue all that in one go when you got track of it.

Yours,
Linus Walleij
