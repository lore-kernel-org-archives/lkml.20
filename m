Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EEC37FF76
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152328; cv=pass; b=WZzjrcHaQslUMxsP5DYL56MUKof0W6TuqeDsHwe8jwbbn2JK+txTVCaks/mYXeBVsr/RBUg/ioz+o9W08znqzJFwT22nihuQPPIHTAMzzeOa37ZzixyFRQuDeK7shtwKzjq2o924Nj9B7UN17liG2331Hge04IeFlG++3JVKy0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152328; c=relaxed/simple;
	bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1/D0DQFEE+OgHojd/ixJ5Up7nO+mWgcsRS68GgxHjuTq4AGYXmyeGJf+/hBGZMeJuXyaHac3CoSd7jdlhsCifKMA458PvtZjdfZU2ac+iUYoOn75cUfl23Gox8Pnlgp9K5gDs/SO5ellwUURe5qfFQf+PbAtxQ3z7jvJ3xHjGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NttemEvV; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NttemEvV"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6e4so7061776d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790152321; cv=none;
        d=google.com; s=arc-20260327;
        b=gJgSvgQj5/d5+xN6u59DnjD9hZqzKTjtb3Q1PTnmHN4uQCs2V0tFW+qqOUKardfKid
         5ucx9wIzcbZRvse9457C6c1e7dO8wije4niXwKs53LNTDEepxCEl9ERbrwh7w1A0FXIW
         c8a3DWgYHtRccWB+7v45g0rpN04Vz5G1v0Ea8FguTaH0NnSP2kenFZQ1lTqYXkgqOLUa
         5r/uzCW0+9Foh1W6uUKf6fhHrw4zjy2sd2QtXNT/J7Zl5aAOZNKn1uaw+yPZsGWdYxkG
         t18pIkPSDex4wJ1J0XrTqJeBOyZ9l2mvd1c6PavmAFiF3sS8OVYadpvfcFC/oX3s0Yyl
         HoFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        fh=qjq8oK8jqXw3D0fMoLfu9c9I/a3iJFc2kd3jZVIvPew=;
        b=bkWCAUd6xG0WXyQL4JhEgd/HXXXeEx1G2AFbxAdOCXZfZ1H5KaFEg6S9eSvBDPqwTt
         lh+MVc4J/cL5xJCbtmnIMqkmaXlTDuLTIPTSNyDWzHmvzBFfXwudEBfDFe8yj8h/Xtbm
         Vn6aP/PI/cI+3ZY0Frdh+23mrgyawVmJcGrzL1hKo/G51YrQy2bdqftQ1yGz4G5isSco
         lTe2lJmMoTO4AGr3cHelS9d2gINL7Nd0rtv62quIq498sMcmYgn95nbMvgUF5P5eEvm8
         8kDF4CEy1Q2Wg6wSxX7pliMI4FQ9/4Q/bJnG2KhQe5JBrCTPOKV/2LblZp7xy3C4q0Nz
         xvWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790152321; x=1790757121; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        b=NttemEvVe7HFiC0/n/2XEDffB6Gz9Bwgh2IQ+eKH8YlZfzHQDCt97R0Pf0SBqu7J+B
         x5TAnZ2nbcGlg5c0V8jzgCQ941hX/sSI0Fcq+hf76CdHB2R8f0ghVDmUecGAYgN+G5KO
         ZKEEX86kmYGOxsXxn3cXgCwZAT/Vmw/BurKFRF8EdBV1qaw+UZVzYi5uFyUTcs83u4re
         cqobkZO51m2W0kNcd5dWweVPDxm9Peqc98eG+dPHQB8MPGsIIrNJillu25v5nsarat3U
         sjnWGQfyJKfCOj78G2xLuE+o7Uo0+OD8HxiyUUFok0zmvmcKNsERfHF8/jM15bBzsZWv
         O1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152321; x=1790757121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        b=k5iUgI2x6sOLQI5R50CKO6N+CVtjjeMsyXfkHuYmKJdCwsti6Is2yoZB7Luu79Bn5w
         XID5Sh+Ldjty51aYy0qcJLZexX7iUlOulYqmNMJdtrlMu5qvsllV40yXT7EteQqnbyj0
         ISmUk1wwCgIm0Rgcs8LcV+XgR7fIkTHlx/fk/0FDzP1yw81ADdEbMeeZBwWuf1UMH7Ni
         T7Llg5Ga+n0bsNsisM56mnT8GGs5mYZbrz2bvi/VK9px9yBDfMXgtJyrS+X2SBG7uhcS
         2jcUAaW0KynX04oJ7daHtgxPtPI6ymwV0Ui+ikV2MnRUryozzmvPWNmw/Htup6VYdbil
         QNlw==
X-Forwarded-Encrypted: i=1; AKwUvBwFIzONZV8YDGyFSeBVtQm0EGlU6pVHC3rxkF0Htt4YI+Ofle5NjJEHWMCGoZeNhXEEwFl6Go3cg/eEhDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mGnANK3GUhIP4+O7G5+WBRyJbjKL1J7go+WchM2kXnr1ZJoyIw
	SKqgyi65jErq4sVLeI3N4mneCkddM7VpE0iEcK0Kvr16ulCOVRuxvMU1B6ml6SVEYG7artgQDoi
	XaqVNCsX0NUfpjgpCb3GbRJ6v6f1H0s0=
X-Gm-Gg: AYBFou2BISSxbTTD0D9sXnH19wcHezr+E+yi3m3LsnAeYfCb89SLYsRj188tDVLt1oF
	M87xuHTafTNBOyjPdt2+OcBgMSoalfm7BqLZoFuSCtk9r8gzYcKwvD0yFneV9n+YVF3pPUATqO+
	/ScItbtuY9SzKFzVtjH6s5+3iR3nRR4/MLLAWmjP1vZLtmFJ6AXtdhMNVgsZxTolvqX5AX28ZmS
	M9/JyUkQsq/PQEhOBqzGHSvpzoQk1zsyPDCp27Nfzyr9ERkGlUKcCEd29328AmjwM/o6Jd3v7KN
	EkoPJTlwThZMMnDm+nBgiekmhSmFO6Ww/dV6Trbq0Uf9z1nN5eqqYTnqKV92AFpJ
X-Received: by 2002:a05:620a:6017:b0:93a:2d15:f84 with SMTP id
 af79cd13be357-93c2511c2b1mr290767285a.33.1790152321118; Wed, 23 Sep 2026
 01:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
 <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com> <20260922172514.7feb6e7c@kernel.org>
In-Reply-To: <20260922172514.7feb6e7c@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Wed, 23 Sep 2026 10:31:49 +0200
X-Gm-Features: AclHuK8jGec2XT5CWPXvYVvV1bFvl8hmA75zakqIakpr84shp0cAZGnoi6_G1Gs
Message-ID: <CA+_ehUyFKZzd0uP4akgZxaLLJTwcvGGKz5ppCYsB++fn92Dn9w@mail.gmail.com>
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 23 set 2026 alle ore 02:25 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Tue, 22 Sep 2026 12:12:56 +0200 Christian Marangi (Ansuel) wrote:
> > The remark on the fwnode patch are invalid. The driver is expected
> > to return those error as probe defer is not supported.
> > (a notifier and late attach/detach is used to align to phylink logic)
> >
> > For the specific Airoha PCS driver it's really speculation from the AI
> > but HW doesn't work as described by AI.
> >
> > The only real comment that is valid is about the alternative way
> > to give supported interface with the .get_capabilites OP.
> >
> > This is currently not supported as there isn't any user and it will
> > be implemented as soon as there will be one. It's really to limit
> > the patch delta of this change and to progress further.
> >
> > Maybe FIXME might be suitable?
>
> FWIW no preference here, I defer to the human reviewer.
> We can treat the AI review as a hint if human reviewer thinks the code
> is fine as is.

Soo should I send v17 to fix AI that failed review?
I think I didn't got this detail.
