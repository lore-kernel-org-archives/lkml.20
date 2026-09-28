Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E2B48CD47
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589648; cv=none; b=DN01v+Sx8QV9RoUNKk1XiKPC/h41fQvjYp9o+0UR2VrhsI0H72cw+FRCbE2vgHRJAeBBM8mas+xKJbXpYB5fx4GW/uQjVBzYG+Gs+Q7LCxeBYucbkTGUTXxL2QCi4OT72qS7tdG5WB6ceKer+ajShuuwXDGdd1bP7SFhKRk0Mnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589648; c=relaxed/simple;
	bh=jlWOIlCkIqLzMmYFrdtwH+WjSBtI3Ecdu4ZVJh9P79U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbD4q/hXO6PORFp0q7wicnhvksUmYhkjlsGFybY+MC+qdK+WzaBNh6xyfy/FD/hTb1W7VksQ5K7HoOsqenE80eHeb5Kp8xgVMXwLlv6DyN+pvM3Sg7c8YQczra0z4043vK7hlDXMajULP1os72v2MPkveVSo38pql6jW5n2hySY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jz0ZqvTM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jz0ZqvTM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895AD1F0089B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790589646;
	bh=2eSTN8EsiyBW/45DC1J5UHI+mfuj00H8nR2ssWjPAUw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jz0ZqvTM4VWPMGjWay6gx0R43hl2NLHM2VPPBfQwlhSmjA04xstgTCxfvFNkKTzgQ
	 01bVmHXwRQZgKY6ZMAoTiRdNYH89mhACXJFh5/QpD7v5uV9AUCxLXbkHNpOUhJrf81
	 mjyikxkRWq4k7TFyobJt1fRiULOC2IuJrGoAg+9vcE8q4ZqQcBOhzoImlOPUrgiesC
	 eozwmApCe6WT+p3OZfn7Owdur+K62l9lHEZNXm1ZK6rWGdFvm9oi8GU34Lc/UKKyLz
	 lzjHGzzv9OIJCS2kTw3FvTQmQmdTkuXEnbcJBhiq0Lkh/A8DJH0x8R4DhQwDtvr8Tg
	 /xQAaoJ5Xk9KA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8ede3ab7aso459603e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:00:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxiVezxg/9CP6a7uYUIcfSmHUdAChyJ+0R36fw1O7JPJFqqXHXgtHNRPR5IfT1tGAHMsEwF8nxX1A7Mguo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrGOIIKhkhYwghr0le+OHCTKt5vHebFPDEmiD9/sWlFcF8xn4e
	kCJt/oxo36H1msyRNLrcpSDDW2Ez09j8QNaDpTJHvAQ3b9wFjdCLQVx7uQrQnRVa4PXbFTY6PqR
	w/NZRTxyPn9wEe86xOLDQD6zj3Qgxk54=
X-Received: by 2002:a05:6512:10c3:b0:5b8:cc2e:300d with SMTP id
 2adb3069b0e04-5b8df2129d3mr4313943e87.61.1790589644896; Mon, 28 Sep 2026
 03:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928074329.853637-1-johan@kernel.org>
In-Reply-To: <20260928074329.853637-1-johan@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 28 Sep 2026 11:59:02 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jar1t0kNF+oHkC7xC5BL_0dC7erh663W5414AV1R1pQA@mail.gmail.com>
X-Gm-Features: AclHuK-NQbc49kZTCSnPRw57dsHBQPg0xqtJFFdPVwGAQoMSasa5-njcbltRhs8
Message-ID: <CAJZ5v0jar1t0kNF+oHkC7xC5BL_0dC7erh663W5414AV1R1pQA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as driver core maintainer
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 9:45=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> I will be helping out with maintaining driver core.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 72294ddfa5b7..2a39b302f77a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7957,6 +7957,7 @@ DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS
>  M:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>  M:     "Rafael J. Wysocki" <rafael@kernel.org>
>  M:     Danilo Krummrich <dakr@kernel.org>
> +M:     Johan Hovold <johan@kernel.org>
>  L:     driver-core@lists.linux.dev
>  S:     Supported
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/dri=
ver-core.git
> --
> 2.55.0
>
