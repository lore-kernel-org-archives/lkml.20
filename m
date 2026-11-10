Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311927;
	b=qKjjDBp/bXzYcqgxYe3rT27tb3uwSYxtq0e+D0qfGjgq47mRcDGIPpoxqg7x4Bf1W4Km
	 V7UchlWN8jhQ77HU9OcGPuhuVzaqsfztZUXmqEF8vbc/MsRUJXQ62Jm7JqP3OVsU9Mvel
	 kI5N7JfOiuvHjltmxgA7Pp3m9V5FWSIl/7G7F7V5u36Hg/mEmsUlmbk4MMJTj4/moyU5i
	 F0YW0iFQt3TSX3eahzyfds+DSRTDqYziQlRWDfOn0obDnjfo4alG/x41ui6XGPnQ37zT6
	 q683Tj9EQ6dTY6Xa4p2y2b3iNIij5awVR7Lo67oB1hnxG4WFwlaq9/FAseNhzpCsTZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311927;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8xrzXhTL0WVs+COqTlijJQelSK0Qwyr/ovJyC3RLEII=;
	b=bgLVUdCiJ91xKOk+5rg+ZDxjywu+1/yDONxY2wJ9MRAXEWTAmN22gd/ffXtxmrhbK6tH
	 7pMk/ME7PBQQ7FetaN9quirV0ldcvUPyMxcYkOnvUWcjmGoyxHHkqm5e1ZUpY+mBHYbN/
	 3Z7wT3ukJ5toLtpXRPdSDHqJz5Brz5P2jq1U/owQqABi1ctyAIH7HvPMpwNF/qt3/P7m7
	 GGlO+T2RiXjnZFMOGYKzo6qlw7HgdiBO2VmLzTZhpo9+0HG+7BZJ8+jXW/UAyxzAwYugF
	 poHgfO1skPt4ZNpjm/eJJqGAio1ALCnOvYx+o044Ds65/t+aVpDW+EN1mWNdkmmmEwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emMxNhtQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE61606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emMxNhtQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD831F008A7
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794311926;
	bh=8xrzXhTL0WVs+COqTlijJQelSK0Qwyr/ovJyC3RLEII=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=emMxNhtQXT6GeTvh+kRkYwEWLH00HiNJERy3KvUu1oP+Jo823ihfoYWMD4dWQ8b3E
	 D0PKYmvBaybuB0d57/MYtPdxyy4SiFEw5FXFGmhFYvVkK2RJtp3I1S9+mBSR/k3Dv3
	 f01ILM37j7MCQsznWJh+JlhOj+ohzsv472o4Gfozjnx2hkqfju4OIeFeP395+l3Qld
	 8p9rfS/OiakXatmNF4PYWIUBV24HVxbyvA5uW6jLZ1Z/FJv3ssc5ctzqjC9UByWLPY
	 21FQLvDjtxcBFETPHRDCV5rEnM/2XbOHpdgeqRG/ARr54N7RGDN8AILQE1zJbuSwWB
	 3Odo42VY0GyqQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso290653566b.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:58:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEUlADW9iwokW32sSS5sAqsCy61gBvQfzyNP+e6LBW2Y7gTj9NAfZ8MP/K1mdgfnGxp9msg/Qw5gbcHvVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xMF41+FQNhNB+MY3jVYm8dKBlG737VPEclvgL5CeRFZx6g6Pn
	jvGg24vl8XkUWp6pXCajeLqCKfSe5kTkJAWing6o85pan2jRRNDnbOjA3FL5DT54w3P0G1v/yxt
	pxhpeKAQbeJe/Tqfb8r7yZ9Xd3uG3ULs=
X-Received: by 2002:a17:906:3f97:b0:c46:8909:963b with SMTP id
 a640c23a62f3a-c5049548348mr132813666b.9.1794311925102; Tue, 10 Nov 2026
 03:58:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110084613.2746641-1-maobibo@loongson.cn>
In-Reply-To: <20261110084613.2746641-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 10 Nov 2026 19:58:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6DetSReoZviN_JuJzuzs9ZvUxXg9UXqKg-nfCu-+eRWQ@mail.gmail.com>
X-Gm-Features: AclHuK84cDWlYHFN5XyFvyk3vWEarUjoMDQprQZIFAhcunkS7NK99kky2uOcYIo
Message-ID: <CAAhV-H6DetSReoZviN_JuJzuzs9ZvUxXg9UXqKg-nfCu-+eRWQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] ACPI: LoongArch: Fix IOVT table parsing and add
 checksum validation
To: Bibo Mao <maobibo@loongson.cn>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
	Pawel Chmielewski <pawel.chmielewski@intel.com>, Len Brown <lenb@kernel.org>, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	lixianglai@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Tue, Nov 10, 2026 at 4:46=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> In acpi_iovt_init(), hdr is already a pointer, so passing &hdr is
> incorrect. Pass hdr directly instead.
>
> Also add checksum calculation/validation for the IOVT table.
>
> Bibo Mao (2):
>   ACPI: LoongArch: Fix incorrect pointer argument in acpi_iovt_init()
>   ACPI: LoongArch: Add checksum support with IOVT table
>
>  drivers/acpi/loongarch/iovt.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
>
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> --
> 2.39.3
>
>
