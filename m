Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793671600;
	b=cBlAlHEyKIs7fgtByLaubMSE51NnveGXPuV0r0Lxdtm00dzs9sY0PYfvl4Covug81U2B
	 ZomqSzVnfKUss6wnImzX+l53HFr+wEmnol/BgcFhy9RRe5m7qr0tkDRHvznSX5+cfpPPB
	 /qz1W4gXIMSVvgqzJ5h0H6IaIAcdea+MxsrM1QxjyFKHsyWB6NYqOMt6MqFa+IH7599qr
	 UUycsJYBaA5oSTJ36ZnmAaBIZjU/BATrjXZAAmAYvDNpGszQlA9+5G6VWma5+tl8+ehQp
	 qKynNJdgtaX0zov6gZoTdI2OlKMKTY4pB8AxiFzsoDw7G7NJsUMc21dWGXoTkXcRWSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7edVmlDXqBmOKChW+ZBxMZA1iVKu3C6UNjM+2ZNf5wM=;
	b=vznacGEzkuJQ4u7Hqe8shP4VDefOeWCpskfDB3BAYhFOqWIu0sSStTjPoe2MqeYQnNUa
	 HoNFyNQ/+9F+XSqsbkSXt1UvzEY7DoHB2wm6/yP4ZDeuy8Xu3h+Cz67vzqxkswtyTFPHH
	 3PAU4I1BWZaY7U/F7TCvUu0MGXds2E6adAtBwHIeMozCxp7hSOHoY9lKdV4ogbgOwdm7N
	 /QNbq1+P8m8rIQGs5eTSpuQidFUDORJz9Pws6ZTfxhZE3M9eKCiTKXHX9IBpOfRRVXtBi
	 Z/6UQXAmPyXgRJdFP+rt51Jqef1qkT1J8Rv1TBHRNbV1Uf53AhAImakjnPBPl43M6sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mAQ0+p5l;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2D9606D805
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D2D9606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mAQ0+p5l
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so6938231eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793671599; x=1794276399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7edVmlDXqBmOKChW+ZBxMZA1iVKu3C6UNjM+2ZNf5wM=;
        b=mAQ0+p5lGe83v747xCyqCS4N8Akjbdkj3F4Iz2/8iImspy/v52+UuU1pE1/Bf6MR50
         E2qDfWgV7bzTU9JYVsGuVRf/bSzdw7SGqRzm0piGjvkzs5eN3BDwZTqZ3vUQsCyWwqzT
         eKkyuVd25qAhw0WgVLwLZD9VIBXnP3Zi75qdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793671599; x=1794276399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7edVmlDXqBmOKChW+ZBxMZA1iVKu3C6UNjM+2ZNf5wM=;
        b=k9g0TRJsTg9QxFHw1k9XoXqPf3ENmUrTM9LOkY7ig6yakngiCycygJfo/ZMvC9IKHN
         savrkThDiWno5rsPbNGiwnJavDas1qPJNNXfViRUEW0rckQTDeT2Q0aP3n711MgY7eU4
         Ayp9+QvAu2TFS+DJHV91LHXivrx6om8Kji6o9DRpSkvH+MCxO3SdQ0WHxek+C6o/GQ7w
         hWxjCW3UUHYyOwzcKYF5NU6G9iiPUYzput31AMjUKpYHnmgBRI5qwsU4fszJQUf0Wv8M
         4P8e33dm3v0LnlYWOGmZRhVCALB0n7Pj7Y8HFifQR2C4+KkZjJLxLF+8//NwzPb9KNle
         1/PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzJrvT2ECdEn2/9LxpwTICnWj+WllppDGey0WQVI3QanEVMvUI4U1bMbxWsD1tAnhtVszzYw2Sak/SxJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWvfUtSPXJgpep29o5fESR/q4nOEMhGPmsSk2X8WE9fu4ZW5PF
	vuOPuGG6GEKvu0jj2ABBrfw64JElrBgghO+VAxsFTPRHEIN62ymcKi3x89TG8KeUFQ==
X-Gm-Gg: AYBFou3gSoDTwlCdMgonK6HlvsI07JR+ZUnriJuXuV+API2sHd6HAR07fx3LmDJgpxl
	c5mdsgl0c6yLmP+KT0w+JxBdD00RD/9Ti0Te0cMYucOUOjF/o7MqEsO3p7mbXZL+QWdFlFjYAM6
	aNlRBW2cPz6/k8CmzyCZv3oiNu/8elHdbdeJxnwcWy3xQX6Msd0APEubrqVsumvnFasZG5k9nwe
	aZd5o+RynJQO0274IlsDC7xSEU5e0Avi7AFfI6GLyZaHAP2lSBz5J+4U05hB7AR+AV6QflueTKt
	gcFzbUGIf0gGQs5xRR+yv7uCjkmaVHxQN0J9Tja2659XrHHHM88JCzz79Z6vvaDoSWmtwaUNwnF
	WIkRFhVjKbzAfqV2ULL/EPiC3PmHXu3oj+RdNoPt4a6d3y9E/2p0UzQuKzcwWuCbR8EwJ7dPHRu
	W7dOCxw+moeVpcMOamTIgRadCha84NEcC8jLlDKAMJpDqhvJ3lE3m33xwiGtT5j36i6cvJBlEH2
	aA40OngBWTcB9NuFTowtbr1SYbfIMPxjaXSmctWb2dLYJ1QhCVpoE0BuWinBfWK/6NDOSuKdNhc
	KQjtRPrXJxVRZB0McGmHRV0aARdDpjQgMuhFUj8J1KP0Rvmk3l6UI0hwl5W+6B2GoI0=
X-Received: by 2002:a05:7023:a56:20b0:1b2:3742:828e with SMTP id a92af1059eb24-1b23742830emr3971156c88.3.1793671599060;
        Mon, 02 Nov 2026 18:06:39 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1ac19f4a04esm37837284c88.15.2026.11.02.18.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 18:06:38 -0800 (PST)
Date: Mon, 2 Nov 2026 18:06:36 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 0/9] google: Add support for Laguna CPM
Message-ID: <aulBrFWi54E6a7Br@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261028-armored-glistening-cheetah-6f3070@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-armored-glistening-cheetah-6f3070@quoll>

On Wed, Oct 28, 2026 at 02:24:35PM +0100, Krzysztof Kozlowski wrote:
> Either you expect review or not. RFC means no.

OK, PATCH.

> If that's patch, then at
> the top level of cover letter, as the most important thing, you explain
> the dependency and merging proposal of this.

OK, I'll try to move it up. To be fair though, every change that has any
dependency is clearly noted in its below-the-fold notes.

> You combined here like 5
> different subsystens...

What do you recommend here? I believe the general principles of DT
binding development suggest there should be a single binding doc for
describing the "Central Power Manager" (and the services it supports).
CPM supports functionality covered by many subsystems.

While in theory, bindings can be written without corresponding software
support (drivers), in practice it usually works out better to develop
them together, to prove that the binding describes the hardware/firmware
sufficiently.

And even if the binding goes separately, I don't think I can 100% split
the driver support by subsystem, as they all require the same underlying
CPM helpers, and those helpers don't have much meaning without their
clients. So some multi-subsystem work is still necessary IMO.

So I don't really see how I can address your complaint. But I'm open to
your ideas.

Brian
