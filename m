Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268101;
	b=1/tlhmOTqqUJok1R3pp/KMfdZdU4DC/EoNVckk1FnqwlrXyVCzCVNxkhdQ+lfnxaSOAA
	 SVsICw+twZQvW+ZExHRTjDIWzb3e22LWWUf0yeNH7nZMuFR7O6majC9M4jrZBNGs6gf+0
	 xAaxCqFM79ffK2QPSnVU9dDp5QCAqKYyK7t7J/RdxqwP/aqrnIBs9lWkfvPCKS7+1oQin
	 7S113A2Uwx6g8TMyodmns+lZfK2UI3GjXInvselOaivw3Q1nMKtgVZoey0xMbmUNXkWEO
	 dZDtR8M0V1qlBFbkIhDwMBVZNrXabF/VJoC9NHjOnoyBGuW/G65PsqZ4JVXMRGBkpEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=0kg/HesuQx+H+4XlkLsyd8/tGdp9/7GasWyI0Chc0Bc=;
	b=l5y2dsCVyxuHFq7OOxbUGp/QJRNllNs44l/S1q9tJnKZUM8GAn4Q9H0TPdTZ5LOpGtwb
	 kbHNWVpoSQZyUK3lOSQUugJIr8t7zOcfIY70zAXzpq1DMFPf+xz3eN4zWnb60Ft1oJOCw
	 42GpY85mGQIhC0J023RoPvs8foZAsKzDI0QIxOeTDN+MjwP112s6jU+Xqj5DiQ9jBdQxn
	 HbvTOIpOfwvo3fjQbZStnZ33qTgnaPwrLeg09h6bscTRv4DasT8RyjUAks1J3NN4hap9n
	 wj6y5NW0rtPW5QaIdggKRtddjjVt9/XAtV0BoRpW+k4p5vHyBrzH4o2kXC2x05GjPxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CSHDzbIh;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2863A606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2863A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CSHDzbIh
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso653856a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794268099; x=1794872899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kg/HesuQx+H+4XlkLsyd8/tGdp9/7GasWyI0Chc0Bc=;
        b=CSHDzbIhXxfGeqjdbH86qI7hJislmKI/V2LCUpEpyRpUZoBvES5AW/84/K2TT0s/BH
         hpnKKJrjkZxNSJONJ7wulfrFj3piNXUsLE0EMq72hvAX0pk1+NvI9y/qKy7pJjfq3/6U
         ZFs3DqUh62TldCLE7C1jvXuXUwqQ/SR/MicEOaagE8VRnxdzzGTkK8F/GnSycryt8OMY
         q1KTA2BFZ7pLwUWy5by1JBFe2xkvDUreki5UWswHxQufHPyAvEuzyJyKxQns02p52PCb
         59F8rrKQaGe7WOuk9ujru4n8Y2WkDq+he4MRXE6qWcbdlP9lEyqRZpdhSEjkYbs4AZEj
         mM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268099; x=1794872899;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kg/HesuQx+H+4XlkLsyd8/tGdp9/7GasWyI0Chc0Bc=;
        b=23+3f7joVFTlOxjLn1E7x9q58nWDAeCPVPlRnbkA1NavNwJa1aL7NZBFJTCQ9DsvQP
         yB7kL94cWDhOSC6D5bVRgaKoGRyOvXf1EE+VwSRjZNnPp2eW/XmWhqrvVjF6Wy8bPars
         /lvBMhTBngwV5zGaUt7zIJPaxJX5UP0zLQCuP3E10laj+Q5Mbr/vhJNpaa5T9+p++vRm
         5vPRn+wey+crMJ5BtHgFqHRoAmaZ7LgsZas5ORHkAT6XiER783z77M3KlRIOzx3JYUlb
         860zFn4gVIwIOflVI/UGpgqRq0e4IPeHYMp1htLVk3ci2szLA1HWuIeI/HGK54s5qxJd
         /wZw==
X-Forwarded-Encrypted: i=1; AL+hErFRlpTe7v34hVguVQsuQnejTBquOUailw09Xeh1vsnB0/jWVLH8P1z7nLHVWSbeFrwjnY1D1nSkd74HxhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dsTf+n7GlVuUmOEtd4PBiVrxIoUaEWImDuIOs3XuNOWl3PFyi
	/Lr5Cc89xjOVIXDuxQlk3M1dkY/BC8AjqrPfefjzoJxiwE7Uk409jV3o8d6VuyIt4OM=
X-Gm-Gg: AYBFou3kW6IPMAhy3VbEiyerjpLuQfv/TpKn+xN5sug6WWifaUn30zaKXD8FKK7n30Y
	9CRvCpc70zBQpsWHPl1teYGbIm1EEzMhytFI3KkOJu12YDku9/a94OSPbQnLt9GYU09/W/6Voi/
	dfpuGM6x3NgfENK9SgosRcVYFAW+I3kxnK9dSBFk7PXXA9uegtE1HbnK0nCGdlFUeaBFM29MW68
	ntGpfNM/9BTpyoIuDRBS4x6eFVUOQi6GNUlLAPxuEbKh4zZdL3N1WlTFIQC3xmjpNoj/xHTRel6
	FGMzTuQnHH/YH0QTInOmcBapbgzBfQgXR/lmJu+cPCZKcMz5aQ4vwiusD+wD7Kq13G32umEAK22
	BpzGkWlP4GAu3VgWJo5EWkUG0fmpL0wEzcKUU1HMo+IkRhT507rB6RU7FOiISkwE4qW1jrpCHn/
	4pYFmcI0euh36FQgZGkCqeJ3PnHrOEPCKsRgf76mcW7FFl5F0UuR4LmycjwTO1Z8/H4LTG2aH84
	ROWkzEUv2ZiVwaJ9OSYvxEJ7J8NGiOdqKUfZIutPHqdkN/Hz68YmGyEgdJVUT+KdTpYBLOSNj3P
	xxRwdnOScwea1E9Gi1WhCaZlAOO5RlneClA7xh/gqxcSMA==
X-Received: by 2002:a05:6a20:8f29:b0:3e2:afda:c37d with SMTP id adf61e73a8af0-3f18f98b947mr664988637.60.1794268099444;
        Mon, 09 Nov 2026 15:48:19 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cdd8d695905sm200663a12.11.2026.11.09.15.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:48:18 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Nelson <robertcnelson@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
References: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
Subject: Re: [PATCH 0/3] Add support for BeagleBone Black RevD
Message-Id: <179426809791.2265990.16577191585004964317.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:48:17 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Tue, 01 Sep 2026 16:42:20 -0500, Robert Nelson wrote:
> The BeagleBoard.org BeagleBone Black RevD and Industrial (00D0/EID0) are
> redesigns of the BeagleBone Black Rev C3. They feature an IT66122 HDMI
> PHY to replace the EOL NXP TDA19988.

Applied, thanks!

[1/3] dt-bindings: omap: Add BeagleBone Black RevD
      commit: 4020138a2339cbb0cb6fbfc6ab08fe693ac5231b
[2/3] arm: dts: omap: Add support for BeagleBone Black RevD
      commit: badbca2876de684230329b49c30c7087cc88c10f
[3/3] arm: dts: ti: Enable overlays for BeagleBone Black RevD
      commit: e0685c2acb7fb85586490791b3e28497884fdb7f

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

