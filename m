Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04DF3F23BF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790802346; cv=none; b=WsSfNhuU++NW1y9lnusxSMvbvO+sl+psGWJbNpAxuI3Dc/TrFQtL5fLOGgr3lCetKGG2S2WCNxWfJqNbE3ZImKOAR2wq186g+5F4oVu5FN8twT232VSanoCdxJaM9+J1wknNZn3yBu84XUrzkr+uCZi1yaSEJOwGFKvxagNGDAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790802346; c=relaxed/simple;
	bh=ER+F3xEHsxIRSeDhr0LK2pONxqBKiVac5jIT+RvNPAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADzVu2aJd7i9NWlKvJ3gob8snW1JkPokxvkUVWZSj5UYOSJkiBqMQ/hr+55syMC5TqE3vqFskSlc+JKbXgh6lARkUfhQI7nZe8H+F3+kbfnydmrpSf7GSO1Ba5WF+KnggXq0wZQF/0xicwi/z1L98PVv7yao5ZvE4MgGPrydzDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNAMFkfK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNAMFkfK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C731F008A2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790802345;
	bh=ER+F3xEHsxIRSeDhr0LK2pONxqBKiVac5jIT+RvNPAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nNAMFkfKSs18dBdBOKggDv3f8LGpv1riN+zyKRjgKs+/NhZ/yTkTCFyWj7B22ZKgZ
	 zI+71q6eAXZaGZ084OInR4ibiW3ae1Dpi5SWyeFLE1wi+cqfJBO0/ITV6vhIkhSDfI
	 gqV6rxdTBrW8K/AW6S9u1C8Yjvg9hPGUb7ANg4Vx5Qxw31Arv7Ujr0QZJzBA+8TCMH
	 S2CNF1m8542qb0q555ADOxWVin6xEh46H/mXQsTBrbZxl3jL4QQUOFeWKTpFlMsRFZ
	 2KtqPUFH8HAQvBSMaPImUHbqGLGJbhT34I69LAv3TFVHygpvHUggQJICH2qgm9NkCL
	 xnKA3+tkcAfHw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8e6ec4dd4so4567767e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:05:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwz273yQTeDxnM8AlUaZfUYmIroouGf3FrzpTPmcgfURKS3QlywyrxsreXOiP4bxhsGquiry5+66TIfdDg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnvbBbHq8WcRUYr8/cIPT/DsgRLb/9qvb3uTK8TDk5zY3mzozJ
	ctKVaXnzIQoUVgnEEJe91dJu6Ktu74RwNiaTQP98e0YgdggoDrmmSQ55AMSwh/jL2eXp2HVEEPy
	LLz4dMDWMken8QalpDGMJ6tVFGmNQ9IM=
X-Received: by 2002:a05:6512:239f:b0:5ba:37b8:863b with SMTP id
 2adb3069b0e04-5ba405d871cmr1080051e87.24.1790802344493; Wed, 30 Sep 2026
 14:05:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-12-will@kernel.org>
In-Reply-To: <20260918161407.2300-12-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:05:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLmt=anvUFgBiJ+_fCanJNDUjYBXTnzG+5RznVhSRPLssg@mail.gmail.com>
X-Gm-Features: AclHuK8POyE_ScdYrWu5hccCf2RiateK4KazdH0tAmqAHtpYIkfp2xNzMS6U_C4
Message-ID: <CAD++jLmt=anvUFgBiJ+_fCanJNDUjYBXTnzG+5RznVhSRPLssg@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] arm64: percpu: Annotate __kern_my_cpu_offset()
 as '__always_inline'
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, David Hildenbrand <david@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> Allow the use of per-cpu variables from noinstr functions by marking
> __kern_my_cpu_offset() as '__always_inline'. This will later be relied
> upon to detect stack overflow of the overflow stack from noinstr C code.
>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
