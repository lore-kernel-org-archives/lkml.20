Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830507;
	b=Fg3+Q5lifBvNI38xrNhP3ygfsCTuucwHfp0fTRg1RiHW1NoquTBH/J86046T8a/xA4Eu
	 rltIfVJhDfLSjQYf1lLjJpYdQ2PCjU4iMCY3nbCMBK147HCE+iCaut2l6nfIVDcZJy2M1
	 LGjVLIJOwMiGdCsvFueQLp22a2wrUhqJ2gzsouEuWCCJ/a3fQ1Ppjt1EWdg608xq6iGwi
	 BzfRis+Jn+vc7uJM/izgMv4xoSaWAMjwn+5WtHNS7tq4MU4+8cuZCyVXzzT9ZzG4uPEeX
	 max5Cnli2/ObTJ+OHLNqkcHjASI0j3z/HCi6pkTyyp2GP80kdDErvB69BGbmcp2Xs4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830507;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qeFPCLy9FkRqwFrmv1PRC8oZpfkhe5BgMOQRIthVTYg=;
	b=jgPx52OVInvBzAsoX5h1+FhiQzj9nR3bXlQAJtDLUAU4KD04a9685EkJAi0kF5wHb8n7
	 0myJBVnG7J1H75/pIWWTtcMszVDqPbRuz42QQm0mK/ifSpNBVuoX22FfR8yH1ADHoOypX
	 gRslDXTN2mf68hcJlR1vUIjzTj0eOhAj4ou6S3KuufLj9XoLxhbr4jh8kA0jNaQTRPbNr
	 wXNR+WmDSfx6mKt0tmBmm2SnJIe1hNtIFq25XmpZ0gabbhsL1vXMi2T5c8xQQe0au2thu
	 vKR5zGHqJ9qaEUOQznzHuSS8Q1wrLx1Cn+epub4G3SUrMQUzIGsQsgvvekY0iwcTZFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F6t7bW8c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4946E606A31C;
	Mon, 16 Nov 2026 12:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F6t7bW8c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104F11F000C5;
	Mon, 16 Nov 2026 12:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830506;
	bh=qeFPCLy9FkRqwFrmv1PRC8oZpfkhe5BgMOQRIthVTYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F6t7bW8c7r5RIcsepWJBIgP7SkeVG6VMdwcRRMjEKOH9EG9EwOkT8SSoQABLeHnwJ
	 33qgxfwpjPkUDG61iTeiEZR1bQZ6jdgRHthOOT2j1WBIB+AQAIW+qwT+FlvwxI2YWw
	 YYch3YSeTe5L8+4P+gzPh1l2Qdn3tPpZK9rIWotUVXHON8WWbbjcetSDBpg+z2c2gB
	 eT6okVPwSw7drEJ2kLPIIvnv35S6JUnSX9oCTXGEPbICi4eRAwrZZRzK7VlMrq7+kv
	 cakp32dzGBuHbVWv6CGe4e4CZyRmc/c5NEAR41Gw3INyFLTvxiI8ZAxGN8OhbAaQRU
	 tUmj8WxBZN73g==
Date: Mon, 16 Nov 2026 13:01:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mina Hui-Min Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, conor@kernel.org, jic23@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, randolph@andestech.com, cyyang772@andestech.com, 
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 13/19] dt-bindings: cache: rename
 andestech,ax45mp-cache to andestech,llcache
Message-ID: <20261116-victorious-mutant-grebe-aefaae@quoll>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-14-minachou@andestech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261113071143.1446167-14-minachou@andestech.com>

On Fri, Nov 13, 2026 at 03:11:37PM +0800, Mina Hui-Min Chou wrote:
> The binding now covers Andes last level caches beyond AX45MP and uses
> andestech,llcache as the generic compatible. Rename the file to match
> it.

No, it doesn't. At least not in next. Anyway not reason to rename the
file.
> 

Best regards,
Krzysztof

