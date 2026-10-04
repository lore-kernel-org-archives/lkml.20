Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9AE35E1A8;
	Sun,  4 Oct 2026 20:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791146082; cv=none; b=tLLvMIE34gRkHgKo0tBhIz/RfzJKONJwdTx2DJex+D91lCt6LJhl9cZobhB2piPsEZ/Ug/mehevqQ+8As72JOYgEZyNUyAMEQHWQPrYFC7Qp+Fqn3upikXmKmu4OesjHJZfFYzb8f3qL9gljSEUWRWJ/hNaqp0tbQkikxGkL4qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791146082; c=relaxed/simple;
	bh=4zGImvUFJAh3gRvxVQXe/RIN/MNKK22E+bRDdGpf7o8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ckuraxIyofu6f0NYsRixLSsjbxEWeHih5nfVx09U6M6GBU9YwbcbEi5esdzlKkjjs7QbPFm8hVYKNhSx42cBpcObq4TZSV7wjy2AGQTJYIxXrZfQ43MY5qP+qPUKQzYuaIO+SRmpUgDBvR0mAP7k7m+l1qUGEEXADlBdLXPKLZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvZbKb5d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvZbKb5d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF7F1F000FF;
	Sun,  4 Oct 2026 20:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791146080;
	bh=wvtwBHB/29za1lBzcRuhdIUCXU2ONAT7YGslVIQD3fI=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=KvZbKb5dyXgbImEhRmYvpxrdH5/N4/2vT4VGeSBFjhDf9OCOQudEgwZojC1zvKOXf
	 f8drGcZlGWFBewZ7aCSk6AywEI2EGsRNoYKYSGMqr6ynYaZJ7I8ipwy0cagfYdVP3b
	 cCw1MfXlFv2v9LMhJ589kVGjWb6UcRcRXEacJ2IwnmxiQn5WeybJDVUgoKTDJ/Plcg
	 bKdQkW8EwNXGGd5pOc2ShCEHWgx7qfNXdKzSowfcakItuE7Dv4keMsVZeH58BURb2t
	 5b+Tc+siPF6SvmR3Dk5dIon+98y/EJO4Tdc6Hg8ulG1FxZ+V4bDF0YD5YJQ5yTA1rM
	 +D5Tv5yMQ2RYw==
From: Chen-Yu Tsai <wens@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20260927200820.795348-1-olek2@wp.pl>
References: <20260927200820.795348-1-olek2@wp.pl>
Subject: Re: [PATCH v2] arm64: dts: allwiner: h5: OrangePi PC2: add
 ethernet LEDs
Message-Id: <179114607889.27465.17745402190793009878.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 04:34:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 27 Sep 2026 21:38:18 +0200, Aleksander Jan Bajkowski wrote:
> This patch adds support for Ethernet LEDs. Keep the default LED settings.
> 
> 

Applied to sunxi/dt-for-7.4 in sunxi, thanks!

[1/1] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet LEDs
      https://git.kernel.org/sunxi/linux/c/265ffb8d8dfe

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

