Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248962;
	b=qiEH7JLsWR7BDZLRBPbPF+tDxt7VPdMp0d6GgnCeStGWGqzZIfntbVmE74lrDPlSNHL5
	 CbS9EGtYhbOKApQX+io1LvB/RGVL7N+H6ysbZvaUC9IIsLPrvgIrp6732IBxy3GXUKDX+
	 2e5KCD3ggj5UDLfVKCPb2mplre7N5WnCfY1uSxsEBFP9nnvWPHdQbiXEUtD+Tvpr+6GZx
	 IuEJMcUVF32c5kgCj0YpOJLLRrI9PdL2At53afTwIf7gtjOV2jaC/Od6TDUK2rpcmvrif
	 1Zl39cyvqwHlL1DiFlFG3X8OHCxvHVxTKr4rbzfq0x4CTfZ+dF16IhCE3H0UOp1kCNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248962;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xHCyj2jSkeRuM2kkMIc0lW2hAHSKhEvR+GoR0PMU0nU=;
	b=ioLMwrwk3bpRsDNzIzC5OCkl6G70KUumW+4rA3NLcJ6d5hGGoYGg6n1qF1qAgvr0qpAZ
	 L3B4e4ZyL8WWYgXs0qClI/Kx1wD4ZqDcp3tGFmoqYZ9DVW2ZFu9ysAGyXYyM5EoGNrbA2
	 PoNcXIAYYfyUuo8Prf3mXkNnx4eVVaCKYx9+cguV8VEBKRIDxJGRQX+dnSYKO1oTEuONb
	 Y2trAuL11EaZlN2U1GbYZt/h4PYyzt0Z1iuY8uYkjQrhFSGWAPEeqhBhmC0AXnb1tmn/F
	 dycMyqAG999jLQ5OLxJgmfzggdviYLD29/3EECeCpAGvgIxvAa8tG8C/7PEDgGLxy/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="B/2W0E9m";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C6D6070EDD
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B/2W0E9m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0991E1F00921
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794248961;
	bh=xHCyj2jSkeRuM2kkMIc0lW2hAHSKhEvR+GoR0PMU0nU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=B/2W0E9mz2VL9ouaryUGi8jRnWgcOzeX1rDzNf/SYs9uheOrsbw8GXBhych+zv5XG
	 /t/q+hwBmX5Zqq2CKIUU/tV/wtE0L+ndunUZ6xH/g5TNfq4gZ+XrU21yvrAMKfE2k7
	 3bhZyne7gZK7rNMf893nIA+rynnojmbaUptptOjQFj8r4A819GVL9aFJbX8/SJMi9H
	 2ORQVniqkPQ0gn/y4x3N0l8eh4PGT4WtYyUItEhslGMVBZDS9xcr0CWDDfnHyE+SXX
	 pPkcRF7UxdFo+SEKFvgMimAwJ9c/7/fBQpXslol1Q3qYYyEpRJZlpsB4PYKZnNHn8Z
	 9tGt6X83cMcUA==
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eaeb7fdda2so708345e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:29:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG5RyyW5Pk0eNSY+i/fL89qjRUxOcMEaRisaMSStZNzfMbYFYgeVkKsjfaET2DsWZUBcQJ0rBBA9HU1UXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qaiocnz3PLml1EVjlWhZCfBVAgQ8TcdU/YPkm3B8KjCWEvXPU
	RctcR4trqTdRSbx5jHeMHcdksxaTKCYcMDjrodDgGOts7PJctVLEAJ2y84a8ts4WMhUTEKRbpYD
	IaheOHOmUkHU0YOhXuSsQ+vPIV+LMyGI=
X-Received: by 2002:a05:6122:4d0d:b0:5ec:d5e1:ee47 with SMTP id
 71dfb90a1353d-5ece7233e70mr1789035e0c.5.1794248960224; Mon, 09 Nov 2026
 10:29:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930222650.1883805-1-jordan@brough.org> <20260930222650.1883805-2-jordan@brough.org>
 <3cd06bed-83bd-425a-387b-f1d3b073cb47@linux.intel.com>
In-Reply-To: <3cd06bed-83bd-425a-387b-f1d3b073cb47@linux.intel.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 9 Nov 2026 19:29:05 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hxx-jZxgD+2aJXy2Y_LLz0_aeU4wgpx6+Bkq-YqvHmkw@mail.gmail.com>
X-Gm-Features: AclHuK_RUBk_HS-TRf-9SPVkJfBBsG7409hOdJvXCSLjtBD3J9gHu_L1S9k7nAo
Message-ID: <CAJZ5v0hxx-jZxgD+2aJXy2Y_LLz0_aeU4wgpx6+Bkq-YqvHmkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] ACPI: battery: add acpi_ prefix to the battery
 hook API
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jordan Brough <jordan@brough.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	Antheas Kapenekakis <lkml@antheas.dev>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Armin Wolf <W_Armin@gmx.de>, Jonathan Woithe <jwoithe@just42.net>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Matan Ziv-Av <matan@svgalib.org>, 
	Nikita Kravets <teackot@gmail.com>, =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, 
	Joshua Grisham <josh@joshuagrisham.com>, Jeremy Soller <jeremy@system76.com>, 
	System76 Product Development <productdev@system76.com>, Azael Avalos <coproscefalo@gmail.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Sebastian Reichel <sre@kernel.org>, linux-acpi@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, chrome-platform@lists.linux.dev, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:18=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 30 Sep 2026, Jordan Brough wrote:
>
> > Rename battery_hook_register(), battery_hook_unregister() and
> > devm_battery_hook_register() to acpi_battery_hook_register(),
> > acpi_battery_hook_unregister() and devm_acpi_battery_hook_register(), s=
o
> > that the exported ACPI battery hook API has a consistent namespace, and
> > update all in-tree callers.
> >
> > No functional change.
> >
> > Signed-off-by: Jordan Brough <jordan@brough.org>
>
> Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
>
> With one known caveat! There's c72dd9994952 ("platform/x86: add Acer
> battery control driver") in the pdx86 tree so if Rafael takes this like h=
e
> proposed in his reply to patch 2, that needs to be handled during merge.

Well, I haven't applied it yet, so no worries.

It's in my 7.5 queue ATM.
