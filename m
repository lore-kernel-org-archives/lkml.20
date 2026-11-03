Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706630;
	b=GpClQgLeVcs3l/r9nO6LQLURjDemv0g30UBs5eE2BUXeVOEr0YDVsNQRNhg88szRlmSQ
	 Wfz/2WyQz1/SjIarCoWjUv4C+Bc4FeBz2aApVJWaHq8+WwnQzYkFNqJwd8sdbWjTlFSvY
	 dXscNIfmezbqaLUUtNg4mGdcvr46DmKQ4FdhAZ1LU9FsjrRQWfvVhKBcvIBVK45MTAc2Y
	 hCquSwklWf1k8HBGxnqWkTQ1uOEOOv9cxzs2og+qJqsm1iz1M2ndM5WtJsE9rHU4Isg5h
	 egJmR6qsw6YQ7pXvwrxcuoWIwxvvEvdnzmmwcIzf8L676kHb9UD1B34S4qk8L3jzodw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706630;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LqR1b5J6w92hH2zvBzfSXeLaHn5lEGsC8JSiRXUiMj8=;
	b=gKza0A9W0vSqRWIPI26bNJj63e6r7r3JoQB/2MlB1e0bAuX86RZfN7eDx7GmR0IYIXg+
	 XcqsxnmddG2e4Gk2P84SCzO4HFqWsfiPi3a3RUJYAUrtZ5D79c0q5nF7IcgqVphPeRYZr
	 fspOrgNKF6XQeLdMpxiKQqhksX4wPfE/vO3U59K//NhjH5cZsKB9Q9j9T8S2LHc9nOSgo
	 J8TdeCgOEjnbBrldvVcm3l6qlQEDiRnV3CzK2rvqrgX7r+A2Y7piD+Xgv/YJ5PVWLhrTW
	 AV93d2uMTIGTok1sh/06pLdVRyGf/yM8+t5EDJQQ5yw9SumFCjhcNgLiiHWA+Kb1ivg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S1G4aGNi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C44A606A327;
	Tue,  3 Nov 2026 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S1G4aGNi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692E01F00919;
	Tue,  3 Nov 2026 11:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706630;
	bh=LqR1b5J6w92hH2zvBzfSXeLaHn5lEGsC8JSiRXUiMj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S1G4aGNioEuXcLfUwytqxat2t881PHjyHaxZsYd947uNTe+U/XHz1ySVA2VPIVHhw
	 eKe2SGyPw6TEt4MQ3/vZy/Tw5eWM4QkIArQ0pi5N9PMjzpSYsVZjstudZgSJKoz/iJ
	 yWs5HQBm+Pa7IFOK5SoPf5Y9XGjKLsb0yndWEpuNFFZBlmfN9q7VY2xT1TCK1+IH4S
	 eXKkP6PKRtBAYN7pLEKOTM2AgxglxUPL1hxlvxnBnl3ew6R7bOry3NhkjmpolAOwGA
	 xYljUQB+dC6ZHmRY8tEYFPCItNtF1TFpanZuYg4KiDzY+/qreKyBm33POCOauTGK7M
	 uA6K5c2aBjYMQ==
Date: Tue, 3 Nov 2026 12:50:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: starfive,jhb100-dwc3: Add clock
 number limit
Message-ID: <20261103-aspiring-spotted-loris-fab3df@quoll>
References: <20261103064836.71059-1-minda.chen@starfivetech.com>
 <20261103064836.71059-3-minda.chen@starfivetech.com>
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
In-Reply-To: <20261103064836.71059-3-minda.chen@starfivetech.com>

On Tue, Nov 03, 2026 at 02:48:35PM +0800, Minda Chen wrote:
> StarFive JHB100 device controller do not connect with PHY
> but connect with digital adapter module. So it do not

Please use any grammar check tool.

> contain core reference clock. So the minimal clock number is 2
> (glue layer main enable clock and dwc3 core bus clk). So Add
> minItem 2 to clock and clock-names items.

So the binding is completely wrong? I see no logic in this explanation.
You claim device DOES NOT connect with a phy, which would imply some
removal, but you did not remove anything but made it optional. So it
does connect with a phy?

Impossible to parse/understand.

Best regards,
Krzysztof

