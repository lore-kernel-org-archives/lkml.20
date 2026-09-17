Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E93F4A4F10;
	Thu, 17 Sep 2026 22:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683988; cv=none; b=NRFJFs2rA8B7uizNjSRdzobXO5xWdLXumMKPvD3vM+TG8r+IniO7VDQJrGbFQ4YawWIr9JFSmFYxY6xAf9yjS5/FLIbteR/jphB73GiRN16++Ncdvg9P5co1MmxpJpJ3uJ4qORaIPuYrG629Dv+1jbaJbpMA7lqOmbK31Z36h00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683988; c=relaxed/simple;
	bh=cxiGqrtIAwaMyfDqfMqOmbAENLPCgRAjNKBqRDqB+2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tg72oJuiJcohb7VEW3O2x+kEzwx+QwjgbVunKz7E7Sm2l0+3KnhtJycibfzF/20fc10nIrsFY4hwGnoSKh6d75lSDbAjxgPh49jKZZ9phT8hxOty5nZd7zxwHtzx0dvkQqycWDx2fUK6+Y+astlWJ4cIpUP/nux+423RMCVVNNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejn0xVuO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejn0xVuO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49BF1F000FF;
	Thu, 17 Sep 2026 22:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789683984;
	bh=Hp9mrowOiBNinPIkdPwJdxIaRmTewvkis1qNuqUG7eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ejn0xVuOyE+Vjz9cxODd86WSyGTH7DjSP+tiPmxvVfp3sUqvcH1kOniuNb1xbDSjD
	 5HdcNGpclFt0/eOx0jd9AkCTvArwlTvroEscLXOKMRoj+xO8Fth5cg7fHbeG22rRc3
	 xAGY4DuGok7eTUetwkTMCSlh5z/GLBokLpadygR0iQG8AtUCkJBHMEN4wyAyOqqvO8
	 uvX/hHTd8EYQ0kNOBsVACcx/eed89Xnn6LT2d98PROCcZEUSS+LhafZa8oR5iqxBY5
	 g3YM583evaItELWO3nw8+9REvSosKJQj0tMeuW65Z7S11f1D9yYjFx8BLUo9ucoVgP
	 GFo+IG8OtranQ==
Date: Thu, 17 Sep 2026 17:26:21 -0500
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
Message-ID: <20260917222621.GA4081995-robh@kernel.org>
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
> 
> The clocks property exists in the hardware, but the driver does not use
> it.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../uart-routing/starfive,uart-routing.yaml   | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/uart-routing/starfive,uart-routing.yaml
> 
> diff --git a/Documentation/devicetree/bindings/uart-routing/starfive,uart-routing.yaml b/Documentation/devicetree/bindings/uart-routing/starfive,uart-routing.yaml
> new file mode 100644
> index 000000000000..1977f2ed20a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/uart-routing/starfive,uart-routing.yaml

Unlikely to have another "uart-routing" binding, so move this to 
bindings/soc/starfive/.

Otherwise, looks fine.

Rob
