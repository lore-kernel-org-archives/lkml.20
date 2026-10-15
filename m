Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2DF446BE0;
	Thu, 15 Oct 2026 13:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071983; cv=none; b=c1RCjYDP6flbjBCYHACtMGyF1NVS9SSLjJXBp58aROn6DoUF6XnKfwBDHZ/z/yOwHahpoEh6Ds4KS5NUCxxoMkMn7+G5iiSurXOjE4rBwvGJiw99H8juatuqd4o/WgdrhAN/eoyR6aWVKCvtoDMjkauSe+1NDye3tRx54ldfUsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071983; c=relaxed/simple;
	bh=SchSXgq0fYT4RQsvmnwQy3JZQxuw4u59z0kkHbicYGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNPihQlSz006rG6W6VobaFR11rSKB/DZLMVdNlxIK9EAAOGoJnUrmtWc5u5m5EIMSjVYgeTeeZprqHiola7YYcxvxHytfPmYZBZoo8eq0zBn+mxuhO92A9B2cZf4AUTa80KAVI8FQGznxJgtSzGV67CITf9fvMrkuGdAKa39jFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVz7KgO9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVz7KgO9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87B31F000C4;
	Thu, 15 Oct 2026 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792071982;
	bh=Kx/01Nsq1UY3kmElra+GwWgne6z+msRWvpMdj34qnwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iVz7KgO9Cm2mX6ny5SHc02ay/J/zYG7KOkNB+c1dCyFPSh++xhzNK0dd/gZ8N7Q3F
	 DNpCy3deOCDafeJOyy+94wg8QGz31E0cLl9S8ZBRyZXi/dp2LOXTqNRiQI/uWBlo6e
	 mflihpcygGeZiZpLIgpl616jKl0Ni62cZYg1Ek/1yBEBXZ4iFx6ljLIKbWyWUhV+Y7
	 wiIDv74TdBVF5Zsjam4B6NBNPRhSp0FDySL1e9jmidB9KyT4yywxbSeWqtiL1WJwJD
	 lcf7+cyCKW2RaHbLYA7yJovxTZ34ppYEbsmp3cF1KCbkcF8o7oj3+cDd5scuLAL196
	 skaObiIf7rIOQ==
Date: Thu, 15 Oct 2026 14:46:16 +0100
From: Lee Jones <lee@kernel.org>
To: Yaozhong Li <yaozhonguwl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/3] mfd: rk8xx: Release the power hold GPIOs
 before powering off
Message-ID: <20261015134616.GA1907748@google.com>
References: <20260929140649.55-1-yaozhonguwl@gmail.com>
 <20260929140649.55-3-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929140649.55-3-yaozhonguwl@gmail.com>

On Tue, 29 Sep 2026, Yaozhong Li wrote:

> rk808_power_off() writes the PMIC's shutdown bit directly. On boards where
> lines driven by the SoC gate the PMIC's power-off path, a shutdown
> performed this way does not stick: the rails drop and immediately come
> back up, so the board restarts instead of staying off. U-Boot reports the
> result as a power-on reset.
> 
> Take those lines as an optional GPIO array, hold them asserted while the
> system runs and release them - waiting power-hold-delay-ms - before
> writing the shutdown bit. Device trees without the property retain the
> existing behaviour.
> 
> The array is claimed before any child device is registered, so that a
> -EPROBE_DEFER from the GPIO provider does not tear down the regulators,
> RTC and clocks that devm_mfd_add_devices() has already registered.
> 
> On a Firefly-RK3399 the shutdown stuck when such a line went from high to
> low before the shutdown bit was written, and did not when the line was
> never driven.
> 
> Assisted-by: LLM
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>

Why is this still an RFC?  That means it should not be applied.

-- 
Lee Jones
