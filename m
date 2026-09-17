Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46583F44CE;
	Thu, 17 Sep 2026 22:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684037; cv=none; b=Wc8JZ4TfqKJnr065XLHIsvyqf86V6BdEQjlBJTTYXhIq7FNN5J44t+twZYqNmRzljatfqx5lGmL0J34EuRlPCelj6aAchvEWPd7wy0SwMnqKqqZyRcnezPpQLpd+9tiIMYzMtLMGTWSaHcIWxVBHB4lhAbeZhp984kkRJnBVKDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684037; c=relaxed/simple;
	bh=IoV/TvoK1T+71j19D6cXfcqyH2n6c6UdSSdYdQi2UY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6kMPUotUt6NI7pQ7Lj2iFETY56v3Ts0z5fBZgiSmKoMGcOOlGYWiZtkgxZwwE+EGIyRhZBjkKmYD+CMgx6SEKzYzXxEXFRxf9rJm0rXBh6uFxglsY4Jm8KNjqbVDWEcIHJ7n0uttVo6HowuSgDdt44RXOGKl6khMRxE1sk4chc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1Ch8FmE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1Ch8FmE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36F21F000FF;
	Thu, 17 Sep 2026 22:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684036;
	bh=yqZXwnT4sTbfdvOMcGPrEviywWtc9S3DZ3O1HarHNx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T1Ch8FmEiDOu1G4fnoJuLj1rEhyz4E/ziyDrsJZ9x4LQWGIVRxnAKXftZ6pOkq0cV
	 k/B8IdIfBNledOY1f9g38IVV8BrpBoSMSIu+lh+YHvym5y1Z1NQRJNtF6S3Q7bMBRF
	 dMsU5FV1q4t4A4hIwC7E5PLIF2cNGkC3wolLzWWODHyQxwtkpaLmKs7/zJJlIncvx8
	 NZBsWZICRa0Iq9VByDkAUgeriSBjwz6lhGxW4iCWDZik9l+a1vkX5lWbfhMvYRL82i
	 nbN0PhtXBdsgAigUJoqR4xGqxnL7FxhSzWTFywmuGVz5Pll1HxEfm1SYpAtypTB4wm
	 Nes7zqLQvzOLg==
Date: Thu, 17 Sep 2026 17:27:14 -0500
From: Rob Herring <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	Oskar Senft <osk@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Vitaly Lubart <lubvital@gmail.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Breno Leitao <leitao@debian.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	James Morse <james.morse@arm.com>, Paolo Abeni <pabeni@redhat.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Dave Penkler <dpenkler@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Dan Williams <djbw@kernel.org>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Alexandra Winter <wintera@linux.ibm.com>,
	Julian Braha <julianbraha@gmail.com>,
	Karthikeyan KS <karthiproffesional@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v2 3/4] dt-bindings: uart-routing: Add binding for
 StarFive JHB100 UART routing
Message-ID: <20260917222714.GB4081995-robh@kernel.org>
References: <20260905102901.126035-1-changhuang.liang@starfivetech.com>
 <20260905102901.126035-4-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905102901.126035-4-changhuang.liang@starfivetech.com>

On Sat, Sep 05, 2026 at 03:29:00AM -0700, Changhuang Liang wrote:
> Add device tree binding for the StarFive JHB100 UART routing controller.
> This controller allows dynamic routing of inputs between built-in UARTs
> and physical serial I/O ports, enabling use cases such as Host <-> BMC
> communication via UARTs.

Also, drop 'binding for ' in the subject. The subject already said 
binding once.

Rob
