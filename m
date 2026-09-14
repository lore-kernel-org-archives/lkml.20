Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6363A16B6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375110; cv=none; b=hoKr92K3EFCyz3qW+3/Sc3AqCI+f4kONmoRYyxGSTMZc4uhNJZVDQ1PZd9hLyOeKrKUp3jGYYPRVxJSxhO434qOxxkY40bAk5yOFiSugtN5ewcGYGEVWlyaJnRV9eevoO8bmMO3BDnjf53NcidvotvWghiqWusB9i9+Vtm/a+e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375110; c=relaxed/simple;
	bh=bikajq6gPXx+5/b1yY5tPaGoZUSaoR9JVl/gex3jVF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zhwbm3Co9qp/gx6jTCyf/Rz4ZgjlPcVkCu4uaInJBYwd8r4Ks5ZpzeIw90PYJM0odTHOY2zhGmWdZbWAqvmv8wZX1VeVxG423IXWtYMr4BLoQKAYn8Puml2bWldbh9/AdoIiTxhkE9DsOoDNWeyyS31HxajqijqO3mk14oGBwDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gG0JwTs5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gG0JwTs5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0071F00899
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789375108;
	bh=bikajq6gPXx+5/b1yY5tPaGoZUSaoR9JVl/gex3jVF0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gG0JwTs5WXFNYujRACYdkpD8Yu4KLEpIm9Oo8vxUg1g2lKhthj1SUWh5LxP8LOd8j
	 s3IdBRCkiXG6oIB0xNjcPWCqv/l/6+D2BsIaE85D30ponbnqhvovkmiEGh9aEBHUgb
	 9GzFk8rnYx1zg6B2FB1sEtjr357if1NpCsPkEioCUj9N7vwy2spT4jZ2bmDrHIxfr9
	 O6eMU6q0h6SsdSzRd0qGmuRo956aFbT1NCXid4CbrjNV0tE2S+bfJ8S+dMMxAu+WYI
	 QiQ2wc/33TNV1S5Rvg/WGeue6m2Ln2rfyrsJe/Q9/vMS0WU/74xzFpITJp/s6NtG3n
	 tSThAWGBNUAmQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d7aso1736395e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:38:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0IJMuz2zgOYw5fGeUvbqit8JJN9qN7EsSSBbuLtTF23TJ3x610/I82bLqjRvyxXmeZCFxayOJ5tY9qsk=@vger.kernel.org
X-Gm-Message-State: AFuF++lKRO7KxE2m178ksxJ4sxCVLgZzSTkgorvlNW9u/ziPY9x+ApaE
	iDXyPXmm16jl4Iztsc3f7mcLZOWwBIcWbgUh9jH+g00q/EwQmSkkLgoeoi7iZYIgF6h8rrE4xoc
	CRLnuDUHtlPAsTV/DNweutd/6O+u83g8=
X-Received: by 2002:a05:6512:31c3:b0:5b6:1a7c:26 with SMTP id
 2adb3069b0e04-5b8ae69c303mr379645e87.41.1789375106756; Mon, 14 Sep 2026
 01:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827021054.0963C1F000E9@smtp.kernel.org> <B61B30904C7ACEEF+20260827080320.3351155-1-liudalin@kylinsec.com.cn>
In-Reply-To: <B61B30904C7ACEEF+20260827080320.3351155-1-liudalin@kylinsec.com.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 10:38:12 +0200
X-Gmail-Original-Message-ID: <CAD++jL=s_dyCyaPCHhQttukZ7m8hFMpCGm5hATrHUBirEG+RxQ@mail.gmail.com>
X-Gm-Features: AcwNN1XRCpHWiCNsju-U4qdFirQ62HAIRpU4gSyI_23OghB7AclZ3HrLyZLO5w4
Message-ID: <CAD++jL=s_dyCyaPCHhQttukZ7m8hFMpCGm5hATrHUBirEG+RxQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rtc: ftrtc010: fix resource management and integer overflow
To: Liu Dalin <liudalin@kylinsec.com.cn>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Deng Yingchao <dengyingchao@kylinsec.com.cn>, Qin Yungao <qinyungao@kylinsec.com.cn>, 
	Luo Qiu <luoqiu@kylinsec.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 10:03=E2=80=AFAM Liu Dalin <liudalin@kylinsec.com.c=
n> wrote:

> This series fixes three issues in the Faraday FTRTC010 RTC driver
> found by Sashiko AI static analysis:
>
> Patch 1: Fixes a clock resource leak when devm_rtc_register_device()
> fails in ftrtc010_rtc_probe().
>
> Patch 2: Replaces manual clock management with devm APIs to fix a
> use-after-disable vulnerability in ftrtc010_rtc_remove(). The RTC
> device is registered via devm_rtc_register_device() but clocks are
> manually disabled in .remove() before devres cleanup, creating a
> window where MMIO reads on clock-gated hardware can cause a
> synchronous external abort.
>
> Patch 3: Fixes integer overflow in ftrtc010_rtc_read_time() and
> ftrtc010_rtc_set_time() where u32 arithmetic wraps for dates
> beyond year 2106.
>
> All three patches are based on v7.2-rc2 and have been verified
> with checkpatch.pl --strict.

All patches:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Maybe they need rebasing on v7.3-rc1 or maybe they will just
apply cleanly (I think so).

Yours,
Linus Walleij
