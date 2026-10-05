Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C992222A9;
	Mon,  5 Oct 2026 10:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195357; cv=none; b=XfDfGRJy8g/HXQ8yHniv9WUoYYgytdG8HqSPHrLwPGgpK2F2TOiYpnwC+k+txrAp1tBG1ZVWgRcrcmUFXyFSDuwjPu5X52pSeD2msHfuM5x7c0rxY2l0xzjzFFA/p3yV+lCXfWrKCBYc4+yv1PDt+h8VNk3ByW7nh6tL+nBDg8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195357; c=relaxed/simple;
	bh=b4PvoxvaZwz5NW+/50A9nGdeQyYgFmwl3IZlAbXK4KA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYgyb90YAGIqs0NUuAfTZPkGtAZXKnMwR+2MldyaYTLy6hJSHQcoeK9nd8Z4/zywLF1lvsrhVVNtkJA1ydQu4w6s7Kp+tMrrdEpfG3aOG0LRHGX1DYacoJAAlVWOZFqv9kbA16XgoPOlZEEwlI21qow7fnkua5m0R8RQrQcoVqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=An2WvZiw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="An2WvZiw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D621F000FF;
	Mon,  5 Oct 2026 10:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195356;
	bh=igZN1JZDbo2eUKBPEUpUUpCrkVNkHeN8r7Knm9kKQTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=An2WvZiwsWKnpOmzD7EhVh/cUnMfKgzdSuhVcnMzNFQSLCIoBtJx78i0B1znUxaDN
	 RgCKZaTMVvAjf93YFfRIbzLoP53eGrP3LrCzQrln7v/TJnHAXuwNhA19BRsMC9+TMl
	 aMysBMrB0hNy1SPB6gJwdT9kQp6uY6q7oouukBqJinSSS3v9IhDy5ecEujy0ShzCa9
	 U2rLLXsg5fAmaANx438MBfL8cjcvbnS9kiG8AVR/HGyZ0OerZ6bq7iOvAdxsJZqSrI
	 P8cyxXrk669aMgH4FcOwhcrxvJM4csesxv9fvIuXSeU6KYRCZQ2ni6wMiRFGpx7CZ+
	 jxylDv3tBpikg==
Date: Mon, 5 Oct 2026 12:15:53 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 0/3] airoha: an7581: USB support
Message-ID: <asN42bZlK_jwS6uH@parshuram>
References: <20260930071826.48811-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930071826.48811-1-ansuelsmth@gmail.com>

On 30-09-26, 09:18, Christian Marangi wrote:
> This is a major rework of the old v2 series.
> 
> The SoC always support USB 2.0 but for USB 3.0 it needs additional
> configuration for the Serdes port. Such port can be either configured
> for USB usage or for PCIe lines or HSGMII and these are configured
> in the SCU space.
> 
> The previous implementation of a dedicated SSR driver was too
> complex and fragile for the simple task of configuring a register
> hence it was dropped and the handling is entirely in the PHY driver.
> 
> Everything was reducted to the dt-bindings to describe the Serdes line.
> 
> Also the property for the PHY are renamed to a more suitable name and
> everything is now mandatory to simplify the implementation.
> (the PHY are always present and active on the SoC)
> 
> Also other unrelated patch are dropped from this series.

This does not apply for me and Kconfig seems to have a trailing
whitespace which checkpatch complains about. Can you fix these and send

-- 
~Vinod
