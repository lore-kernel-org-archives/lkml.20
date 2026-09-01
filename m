Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92E843F8AE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279320; cv=none; b=L6qN4Jqmv3O0402oFG4W71c2gs9XLfhrD1W3FflZr9d1tCLSpsKXF3cL6ovlfPewVAPZOCpkcUxiFGMdqSMOqsnv+clJpXnSJt3OCc6mAaWkg5+idA7LkxIK5YA9oUzosD0Z63HVHHziTcZe9VZsmXweuL4lAa3ZKROM9KoCv8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279320; c=relaxed/simple;
	bh=sVmVzt8GgzZn8jvrQuxVaR7Ad1O+lxZF27bkoLHptvs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LP9qTubZNnj+NU3boqjkMIbYkFJpAYtbDi1AmNRIanX7dAmug9j+JQkeL54/iVQwXcYP9inXv3upLK/d0w6YSsk/A5QoxzUzpV+ZAgK+alb0Y9h+29Tl2Q6kBjC6HXRIqQySUwyI/k4Oa1MstqEgRVwbGfZyMbaxi9KNEOVrYdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaJEwRm/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaJEwRm/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F8C1F00A3D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788279318;
	bh=sVmVzt8GgzZn8jvrQuxVaR7Ad1O+lxZF27bkoLHptvs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LaJEwRm/DFlOnl1mYgCfRGzrC6JfPIkqeYk365T6HqHO+6kNq0afbytV07e6G6NZM
	 4vtiM8QynuwbmFWstf7U6GSt4JirFqIjezl+BkPM54F8fOmdq2Rb5yF6DJ8l0hwGLg
	 26oCw4CXK6P2qzd2jRTz9FAKelpvVHeBofhEglVi41HU0dW/mAQIAUm+05hXN1/QTM
	 mAUbi5R+6Ka+PCYSZcFTw0Pq2w8v7/sQS3gMrPrCYVdlsRrQIz/4oR6j6iNVXvwkj3
	 0bRsnFV1luxdcFuZUy6GLpZ4evgJT+jQeOc/TG7dHHAq7HSggYPRBWaglc9VcgBkOZ
	 P7WcwVUbIMlSg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39da69c5ba3so8361321fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:15:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByoNZByS0oB3azHbz2WUlzjX2uWARq9ljsxUqxwJS+Jc/mMQC6Ql0j0a1ErVU+Gsqp9+PiD7Mj669HAjUU=@vger.kernel.org
X-Gm-Message-State: AFuF++n+FT/tnS8BcwJ5+pmUPJu0i8oVKNuiihZ8vTf/n3fgUBsZ/gJW
	PpFejLnY4bsDtgvbg+KU6S/z4Uz39Q4eM/6tbDISOHCHE67Rq9xkVoIsLItzTihlmgqWHR7DJZ3
	7Dx1jXszvMoayFUDvtaPhJtH2P/2r8q1/9RpVxSD6VQ==
X-Received: by 2002:a05:6512:2522:b0:5b6:4b1:f8be with SMTP id
 2adb3069b0e04-5b604b1fb1emr1186371e87.31.1788279316943; Tue, 01 Sep 2026
 09:15:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 09:15:15 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 09:15:15 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260826122742.153643-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com> <20260826122742.153643-4-biju.das.jz@bp.renesas.com>
Date: Tue, 1 Sep 2026 09:15:15 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfAdTMb_4ii=up-ESwc322YYjzseyvAxshM6vUcEGfxcQ@mail.gmail.com>
X-Gm-Features: AcwNN1V8DuvVovyhVMeiT0SihZ3OVkh2HoH1hRxjyitBpeUT6HAacUJvV22owPU
Message-ID: <CAMRc=MfAdTMb_4ii=up-ESwc322YYjzseyvAxshM6vUcEGfxcQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] power: sequencing: Add Renesas RZ/G3L Power Ready driver
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026 14:27:25 +0200, Biju <biju.das.au@gmail.com> said:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a power sequencing driver for the Renesas RZ/G3L PWRRDY module,
> which signals power readiness for various IPs (USB, DSI, CSI etc.) on the
> SoC. The driver binds as an auxiliary device to the parent SYSC driver,
> using its regmap to toggle the SYS_PWRRDY_N register bits, and exposes
> {usb,dsi,csi}-pwrrdy pwrseq targets.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

I would prefer to see a stricter .match() but since the parent is the soc node
we may get away without it.

What is the merge strategy here? Are patches 2 and 3 independent from 1 and 4
at build time?

Bart
