Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA1236403A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 20:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788639792; cv=none; b=ApKbHzDFgW5J90T2jCMj8WIxhyUtQhIPDOjLQxpM95ejGJyj5HmlNbq1AijPdQ1IMhHIZcH0W7ykSqITSFY6lDDku6LBWWmqRwLfFNOJOBWzqt/VxtnEPuyCmzsOEmwoYBcZVmt45nC9comLoHxbyUNRVoXccwfZE7ctf6/ViGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788639792; c=relaxed/simple;
	bh=DNDbd91qqA1K3hMPzgERbnV6Pn4oinAjsYTPHQlM/n0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYygjfsQzaPAoJ6YX30VCz4itSaAD0RuWFiMhVKfkeTwwWsEVBFT4buEOxULU0yW4+p/G9MsibqVJleuDTBXbj2wWklwH3TfwYjEK658q3Ie3HnfpbICpgF7rkBR4WFw5WDAI1RfkVvS1CQi73depeOjAZj5UVMc4Z0gC/d01BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RT7cWf+E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RT7cWf+E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4361F00A3E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 20:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788639791;
	bh=DNDbd91qqA1K3hMPzgERbnV6Pn4oinAjsYTPHQlM/n0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RT7cWf+Etk4WgX5HcrynlFoJVU4QhMy6gWOG0NsXFIFILPo8XE4mUqoU4u7SCstO8
	 uEriXDcHi9v+GZJI9b5zs8yua9F1eMBD4AlZxZe8NxbGQrkO3Xc6H4LOTNGI+Vf5fF
	 oYW5qqHykTVu5c4pZTcgdsLhirK/5DE1RD0C2pvnVI0TRuicjoBBt4fgKIaQ+jsQcA
	 T0q5KzaxCaHeOqMW2Gu24gazpfpOQzZ1H1Am1gIv0spMFUR/JSmcspMyBY5OkDxQ7o
	 fr1GY4imREjYYIo/lBOxZs/kpboVc2D8M1V5W0LaZwzqYJFZHVDGam583xS/S1XMzi
	 4tpWfzUBcN9EA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b4af4be667so2129023e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 13:23:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByO3HBLIU2vJ47jBAD8ugob0iu2Yi0Ammy4BbR0/x0aqI5NosRiXpK3mBVMp6G2YlVSPwd2WCojUzPwuOE=@vger.kernel.org
X-Gm-Message-State: AFuF++k/trUFRA3zZ0v1E0+9RcYvsrFTZS47Y1ZuC0pFlhVlWl0xF0Aq
	cNgcyabTCUWB8zufGx1U0XomjWqt35uK4XbuoEs2vahI8WdisQcYTd7v4Z6O3UUYaJMiatr0BPE
	/B4Y+Hc4RAluzT5WIU+kIgl6iyTKAaYk=
X-Received: by 2002:a05:6512:39d0:b0:5b6:183c:5c9d with SMTP id
 2adb3069b0e04-5b6183c5e63mr2060524e87.59.1788639790281; Sat, 05 Sep 2026
 13:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905134131.66680-1-hppiscas@163.com>
In-Reply-To: <20260905134131.66680-1-hppiscas@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 22:22:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLky_xX28S3aw88wvZy2gv77-6AaOzK9vG+5YnmV91ErMg@mail.gmail.com>
X-Gm-Features: AcwNN1Uu2OyjV_h0PksTSTYNqQxzAZUaF8VKTqiR_G0Mg84ZDEQ0kUOzYT_17OA
Message-ID: <CAD++jLky_xX28S3aw88wvZy2gv77-6AaOzK9vG+5YnmV91ErMg@mail.gmail.com>
Subject: Re: [PATCH] net: dsa: mv88e6060: Publish the OF module alias
To: "hpp.iscas" <hppiscas@163.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 3:42=E2=80=AFPM hpp.iscas <hppiscas@163.com> wrote:

> The MV88E6060 MDIO driver uses mv88e6060_of_match for OF matching.
> The MDIO bus emits an OF modalias for such devices, but the module
> only provides the legacy platform:mv88e6060 alias.
>
> Publish the OF match table and retain the legacy alias.
>
> Fixes: 277617603c02 ("net: dsa: mv88e6060: Support probing as an mdio dev=
ice")
> Signed-off-by: hpp.iscas <hppiscas@163.com>

Fair enough.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
