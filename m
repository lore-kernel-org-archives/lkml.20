Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971972;
	b=Qbgo1lNv3sKpqlHVEdeRUtLSv63DvzFu/xGyMlfMe0Z6fc+nzkBtxGrJ9GUHQasG5YGQ
	 HdXjINlwnYj7msZWv2+fIVoP7Nq0BG4viDyxSt7+ezmi6I2rd/J62GyJKQy27xIDStmK4
	 yos0Q7NK3DrlSFbZksi88XKprTDNPlRLD5rM2445e8OkjpCHFnjOgkc/WxumRqeq8+5dI
	 9eR5Zrz772Sr/UHmVek17ywOUQ9XHrFfwIcMy9+mArYqkzdHzjQPCwKiycodTc/3Rf4Kw
	 51QtNXOgc7f44hLTKmpQ5nHcDVf43hn2eKYXXXMziEtt2ikhOwXFY7euD1zw7Tibr8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971972;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rku6VQ65uTS6RI9RCpBqPT6w5cxyM8TaHvzEHY5mMwI=;
	b=ak0tv2Ahc1DbcnNn9uPJEddj/7iFdGYC1aXIT2LapZPzj8bBiF34nfxZPT0JtKfnx83G
	 DcOuuSitDz3ULXhXCI4BHpWR1usEiOAj+syseeZjuiWZHJjUlzaC+eE26nvmCab7HRnyI
	 1fUdD9hY4sB+mlUL/TBAZ47JBM70o8abHKIpE9zT/3/KgHPgBw6TzhpksAZHyYf60uVcu
	 3gVOcV/hrZqo7ei+D/wmpEfFlvm+D93fEBdUmzCnxc1LaXUSO3Ms23Kjw7i2dfZ4a+0fb
	 vFnUEvBzOPeWyPRxlYTFqVsZXb3LIaOCLG/VEbaBatkX9dn43KY1kYfYmb7X6KHL3tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9eBh9oQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11AE606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9eBh9oQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717411F0089F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971971;
	bh=rku6VQ65uTS6RI9RCpBqPT6w5cxyM8TaHvzEHY5mMwI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n9eBh9oQfW9QCKPsygCwWyF/4qounZ/O6A5URte3/mGT4wDo5hBPi/dIdCTZd53JY
	 5qIyXnE7j9tFjiOUEBofK0DNfUNUIFPsUh7j6uQduWjMZBpnMXtrKBwFK+Q1qNHAXk
	 B9Z3GRa51Ef4Vi7aeTRjbuNaIoidw50ZG30mQdXIz6sveTRcQ1BPagOtDaxeOnShtG
	 ny9HnDN51yvQe8NDClYkX3AdFmjWzVp5cq0sboZIVU6Tmr1j5Af99pyrweLr2aWYw+
	 4SmIsRuXVQkrqioZvYwXV81owk1tCesy5hT5VdGmwmVOEbdjb8FH6LowXN0n4PNSLb
	 cwDTVoHx32aPw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso479669e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:32:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzIwfPcvxTh713tNBkEzgp47V41JnxWsBbxk4IM+k30cuzzQX4krByfR6ps0KyC+1PMVhsRzDG0qz5hqBw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bm/NF7tRBwSn3baYnCrjqBGg1XtmPyyqFcAeRsl3RmACpwWlN
	8djXknDJACEWYmSXOsbnPolxSRzXeFD3gZlS4J0bCVWMnHTtF0RQ0Tl3MVciP5p96/tZZB0W+jI
	olDhLUnXuCgmqwwfmc1zx94KWUB6XUU8=
X-Received: by 2002:a05:6512:2287:b0:5c0:4c9:a4ed with SMTP id
 2adb3069b0e04-5c004c9a616mr663332e87.4.1793971970285; Fri, 06 Nov 2026
 05:32:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-superm1-pinctrl-acpi-v1-1-2367e584912f@kernel.org>
In-Reply-To: <20261105-superm1-pinctrl-acpi-v1-1-2367e584912f@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:32:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLmA7cpMfYiFrpJJ89=QW+XS85wg_VzqyU5C=pDWuxnHmw@mail.gmail.com>
X-Gm-Features: AclHuK9U3egiiUujijb5vInGeTIpSRkU7PBiBdg1W14kj--CHWhvbS-XNc59sTg
Message-ID: <CAD++jLmA7cpMfYiFrpJJ89=QW+XS85wg_VzqyU5C=pDWuxnHmw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Drop CONFIG_ACPI ifdef
To: Mario Limonciello <superm1@kernel.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 7:03=E2=80=AFPM Mario Limonciello <superm1@kernel.or=
g> wrote:

> commit e7280ab196ba4 ("ACPI: bus: Use acpi/acpi_bus.h without
> CONFIG_ACPI") added a stub that means that we don't need a #ifdef
> anymore for the _AEI check
>
> Signed-off-by: Mario Limonciello <superm1@kernel.org>

Patch applied!

Yours,
Linus Walleij
