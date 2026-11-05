Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870782;
	b=JMAnz2L8YrP8l7fJOeF8yOj0rxARrS2MrfF9xxSns19ng/OOn4ESxpNyWXzQKvsqAJ2+
	 oO8dlP8V5NTYW80p8ZnV0+yNdkPYWkE0ooDVgBk//HJJv5KiSU9bQf/zIbUAnOx5E1JIc
	 WllS3Qsej09BzWSxbV9MpFzIhxeVHM9hOWXsrnShjxL89tZQ5Wzmk2APF2dgnOeHQ+slC
	 e0CavZqWKaQ7F8dWw+o+0Oyo5JMeubgEMOJBMvY1rAO6ZpkhFN7sZss2CSOjVDuqfizxx
	 /Yq9Ja1ShbpitnPAJUx0x1tLFi4VUZr5Jj72OVxJekKy6BtlJ2nIHNjaIxgPYNPKFcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870782;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5weTVNfU4RUIXGu4AdbAlzA0cfDEQJq11kojXW+pkrY=;
	b=VS9q5QbbfTNDiwXkt8cOHIJ/EC/ttXkEwTbBl5LZ7heMtOjNvlZ0pMRQpcYQ1E85cv+f
	 9YU52IvrZzoddOFqgj6QrYzU95svjToPqehzc0RgRPnrHWrmXv1oqW0cxaluxCT9QH/YE
	 x37Z6uY4fnGpapfW8H8qnTzzUPTbivyIBs3H56ZEU+tIhmCMK3i1w6bBwivOUA+qpxLIS
	 bXKxiLeuDHfJ1FzMwtNOSrVr267uiIjZbgTBEJX4uRyZO4N7BEl2rUkre/h9PKB/8m3D2
	 rA3Xi7pLcR7WBd5Xbovve1U5T/8p+PdDEnIEMA8hdQqIRU7pQEQtDALFTz+uhmWPHvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbG3gRvn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B967606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbG3gRvn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE1E1F00A1B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870777;
	bh=5weTVNfU4RUIXGu4AdbAlzA0cfDEQJq11kojXW+pkrY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZbG3gRvnER6mcmNZ78al8p9Yy2sUU9nAr67z7Iu0pOZ0CbD6QzrYO0YAVZOxtEz6U
	 OBYxMo4sEj9zh33od6kOmsZvuLCSVgR7j2oIdAXZNw0JkJ1Y66Dxlnuho5lLA0wGns
	 ilLArm0Npn8kEe2gSbElNRJ6zx6U/KEW0orbBvOkXKjU5ru6yfZ36aYFrNCInS1uOw
	 sOgA4lAfSpDqGbD2F+YIS32RslRYwvYzaQjaYyqEK37TkcIwUh1jZRw6zKyln2zhvC
	 4QsYlRIiukxWDgmNxXpTfYbOnnqR+r7uK1pDgFAF9pAZjPLd/7ho2jD3SrFRqrYJav
	 CvKGREnllCpkA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be42ae8eb1so966320e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:26:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy11P/Kh8kvq3m+fY+DytJToGpeEZofajL7LH3OjB3Si+TeIl+ir4Fexiiv+muHYgi/OFt5p3XwWWjwBJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/zVuKY7K+jynj6XmKpZ6xLIxiEHbjnk49RLfRqaAqn3tPLrXm
	DvyGy4j0afgfpweg3aMfsFRr7dYFGvvpp8t3vimvZKQBb+c20j4du80scSMQgc1wN3vQmjA3/to
	h5FKyatb+MePQzBpo7hX8rgWqW17ETdY=
X-Received: by 2002:a05:6512:3da6:b0:5bc:f29b:1a5c with SMTP id
 2adb3069b0e04-5bfd956517bmr6620245e87.23.1793870775961; Thu, 05 Nov 2026
 01:26:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKNLDZOndyGxLSWgBDrq0Vfbt88Pa5S2MDHVcnkHzAH3TQDpaQ@mail.gmail.com>
In-Reply-To: <CAKNLDZOndyGxLSWgBDrq0Vfbt88Pa5S2MDHVcnkHzAH3TQDpaQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:26:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLkgFOGT54_W6gOnz+aWG4_q3XHc7Cr5_=8mcdv8-aTcXA@mail.gmail.com>
X-Gm-Features: AclHuK8CorVO8MUeqTFvv7Et7OujtWjRgY906_d19hm5pp_OhIMEqRRrkZlLLfw
Message-ID: <CAD++jLkgFOGT54_W6gOnz+aWG4_q3XHc7Cr5_=8mcdv8-aTcXA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] reset: add support the GPIO provider with #gpio-cells=3
To: Marc Taylor <marctaylor700@gmail.com>
Cc: bigunclemax@gmail.com, p.zabel@pengutronix.de, brgl@kernel.org, 
	krzk@kernel.org, andre.przywara@arm.com, martin.botka@somainline.org, 
	dlan@kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:57=E2=80=AFAM Marc Taylor <marctaylor700@gmail.com=
> wrote:

> Sorry, my mail client mangled the inline diff in my previous reply
> (indentation stripped, and it turned "https://www.google.com/url?q=3Dhttp=
://spec.np&source=3Dgmail&ust=3D1793850929317000&sa=3DE" into a link). The
> attached reset-gpio-3cell-v7.2.15.patch is the correct version; it is
> re-attached here so this message stands on its own.

Don't send attachments, inline patches only.

Check:
https://docs.kernel.org/process/email-clients.html

Yours,
Linus Walleij
