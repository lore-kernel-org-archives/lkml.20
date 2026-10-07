Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A9C3CF1E7;
	Wed,  7 Oct 2026 21:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791406860; cv=none; b=PEXtFboGV4ub2yZLhVo/2/I13GNW5LPWLrjwmBeaYXLX9lgosOiCuBe/mjePqcsxSJ+tBadov8SRw/BB4TW1Ie5C2iXpEoTwITJlTKFdNeKRr84skx8ZGg2+mIDOFm4T7PsJeEbil2wH/TjI9ZAuCqjwU4EwIMdDdB9HIlLwfhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791406860; c=relaxed/simple;
	bh=DjV6pU5Ygctp/BedOBvtLifXI/+hzam3cb5J6puT2Og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hI3sR9kuEQjxv0Sq0YQpm3O0eXPQ/g4jREcfln0urXLVdGVqPP8Kr+guycsQVDmGrvNGoRgVH1xV6JS7r9/pefYy/SJ9J7qHE1KwjeTfcNzGJQv1trLcULPQsk1+sNQqErNMTp3N9xfoCgE1yEn3WhiXYf5fyMySOgDCa0MEd9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DlA7fxez; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlA7fxez"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5168D1F000FF;
	Wed,  7 Oct 2026 21:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791406859;
	bh=TbYPg3uQU1P6rMt+WuOLQFicMNfbSJBbie5yCmhoZc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DlA7fxezfe1z+1SnRn5LXiq7eRXTf4Wa/Mg0y9+59eWKxQT4DgzFaWCEpnRqIVNQE
	 gN0SXj6ZmBT5Rmm3TdrmyP14EHopZyd9r0EXpEOSaFPU2vKvQToybCkN2NK3HbCHMg
	 ST58deOjUKDl3/uZ571L1lEeLRQO0IDXxaHtEMP4+1vE+svI74ZMqDvCPm8P1tx2wK
	 /KWbLmIpzeWWtGHiDJGBuB5wdNR2jq/xcBk7NAtcrpllfvReO7QYQQ9PEhvPB2d2UU
	 w+Mu56IlWXzOVzF+rGDRuhrSUVAYTHRJs2lQKVfRGyK7rS/F41uzXfWm5bzzsnTD4W
	 RHjzI02XRHE6g==
Date: Wed, 7 Oct 2026 16:00:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Hanjun Guo <guohanjun@huawei.com>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Jakub Kicinski <kuba@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Karthikeyan KS <karthiproffesional@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Dan Williams <djbw@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Dave Penkler <dpenkler@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	James Morse <james.morse@arm.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-doc@vger.kernel.org,
	Alexandra Winter <wintera@linux.ibm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>, Breno Leitao <leitao@debian.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	linux-arm-kernel@lists.infradead.org,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	Julian Braha <julianbraha@gmail.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oskar Senft <osk@google.com>, Vitaly Lubart <lubvital@gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: soc: starfive: Add StarFive JHB100
 UART routing
Message-ID: <179140685827.281341.11055156225840359821.robh@kernel.org>
References: <20260925050947.9900-1-changhuang.liang@starfivetech.com>
 <20260925050947.9900-4-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925050947.9900-4-changhuang.liang@starfivetech.com>


On Thu, 24 Sep 2026 22:09:46 -0700, Changhuang Liang wrote:
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
>  .../soc/starfive/starfive,uart-routing.yaml   | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,uart-routing.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

