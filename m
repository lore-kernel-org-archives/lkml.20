Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482993;
	b=BaEiDUNQVfYYc4GMppNoKo4JqMS/8Dcko9McsSScWEW0CBUn2xXKkbDV1+xq4kccghuL
	 c9Xsnv1Nn3YRNC9h9BG73w9p2Ti8wlEDJFKeFVbm/7qaRZKZZE0YeLg6fZDS538nidvfQ
	 BWfw2Y8l0ZryoxoEd0IGom2NqcE500i4pAoz2S3QIxhiPH34GtTr3sBxxPCxjegdAnjTr
	 JYDejFmjPlDi/KL/qHzezgd3jA+IsdmkIWdLg6VChcQbcA+a89wACpnM9YEymY3vqoh/n
	 8k1NjnDJ9M4boFREuLPnmDzcGp5YPz2lZhF5oWPaWbKHycFE2bxAeM/vRSj8Yf7pgXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482993;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6yBpYK6f9+BQc1jfH9gnbyxvMmUX+zfuIeLZZeZEI9k=;
	b=InNSVocVCBzipmj/Uz5cOPnIPxsC97NAMaz+JAE+uyBRGk/C2UM6iBHNi03IlsNOfBbm
	 wXtSr01C7bjAOyA2zknu+K5o76pIjXkogRiY2CwWL4rI/rR6jBZuiSfjDbVVKSjrzoBpL
	 MfHfoL5dGVh3GHjSF5sY8VI/kFLh0EmtIi2vn7yppDys7QvmcwpjgesTTYMoAmhQTLNn0
	 OzHp3+FCPtEYBe/Yhkb6hWgVkalZDZtPk3IQcVUmAjDYb7WKZyOVk6aSketnqoUDt3M3o
	 /ns/rQmxeCdgloYJnfKO8E8wT59ckFK/fq/icem8TrjNg5BF0xlOZv9PTyjHEu3Y9Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSpicyqP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AD6606A31C;
	Tue, 20 Oct 2026 07:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSpicyqP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172331F000C4;
	Tue, 20 Oct 2026 07:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482992;
	bh=6yBpYK6f9+BQc1jfH9gnbyxvMmUX+zfuIeLZZeZEI9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XSpicyqPmNSqeH++6HRdytarODu/exKco/o/qsDafdEoPMwxX8It4rUqwJgKAkLwO
	 cpT327eV3TDaXuxd8axPBlXvoUTWhzWHFzX5iGgE2wVMlS4RnCTNXvXxshxyXNzA2N
	 IKOULCUIKtrtDfk9w79kziaTUL0GgUhMRd74MaRseywtcQxyo/yg3YlCbW3VrgfaM4
	 4U4Ie1Pkwx6N0ojg3F9QUUY5ZiO74CcBCYHdFpAQzGAgpQHtwihKLptOWtyxv0X+pL
	 sYXUGky1ZpBg9jNvXDzs2lLJxbm0/sUIUMcHZ00HbYhyzkwErPJlF0TDJ8CdIavhzz
	 fl/I3rR0r+r1w==
Date: Tue, 20 Oct 2026 09:56:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joy Zou <joy.zou@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add i.MX937 FRDM board
Message-ID: <20261020-impossible-coati-of-domination-93c946@quoll>
References: <20261019-b4-imx937-frdm-v1-0-76d949a61954@oss.nxp.com>
 <20261019-b4-imx937-frdm-v1-1-76d949a61954@oss.nxp.com>
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
In-Reply-To: <20261019-b4-imx937-frdm-v1-1-76d949a61954@oss.nxp.com>

On Mon, Oct 19, 2026 at 07:10:32PM +0800, Joy Zou wrote:
> Add DT compatible string for NXP i.MX937 FRDM board.

So where do you explain used imx952 here?

Best regards,
Krzysztof

