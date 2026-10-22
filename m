Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637929;
	b=vR/rnXcpgWlMPWLPLWyAcdHPxtepBw1FxhXXutiFlMJu98eEUUAbZYuteE6dAVaREEV8
	 u8LUu2QnPoG2pmFJStcVQXCNg/lOeJ/lkZgt8z+otJMWX8fAvNdT6CsrKYGygtidF13DV
	 8IzcLbbzW/Z1c2cYAMb0Hevm/tgCFe3Gt9CXeVqoxDRD/aDZovBbSN32zMECqvEO1xeIO
	 4KfZ0yiJMoKlR7fPh8A/rlfWq3caCrHA7Ss46K6bzP23Kjc/MY3W09ALU6pVLO2HDBcZi
	 sXOcijarigl7pKTookw7UtJu8ZDKofit7VyLYnnNq4LxTE2NrjF7e3wQhVyQVtEdcXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637929;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=owsw2t3VbnUT+VYXvyiHdO0anm6pLWfVu4gJk6+tS5I=;
	b=WnKqEJAufcnnIqMLydgMo1fg1T+cS0j5pMifhV8dZ5tAmGq2drk7H4DxydzVuseU30sQ
	 Gv2AmAduS/GKYUbGnu43xnYRdeGXtUq4i9E3mo7PADzzjr3Xf5NlyUQa+Cn5PIEe2jriY
	 Zy+gPM6WSaKfkZQerVrRwBAtyh7FRsTY0qsjb6lkGXiUd2/DfcE7O3KwBp4PkLRFxT3Jp
	 LbDwdgpoLwMhZozRMA6AtRi6ml2jxxegaJ92sPpHaJX/7qHfwHzytZBIGLVJ2IAxluosu
	 OOrKKLpYY3jmgkhTZLuidf2iM+1D0iE1X/l8IYK/fKUQiGRFnr6J+QUx6TVGxlk7RGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kPzRWNxA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E2D606A319;
	Thu, 22 Oct 2026 02:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kPzRWNxA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D276C1F000C1;
	Thu, 22 Oct 2026 02:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792637929;
	bh=owsw2t3VbnUT+VYXvyiHdO0anm6pLWfVu4gJk6+tS5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kPzRWNxAw+rpFkdgDhE4B1ZH8n0Cp7DLop2rZpB+GTvfVrF3OcUkP5hIi1gEnvAl+
	 LQhqrMRAA4bijS2L9F9cb4QrQjdYdW3fPKVVacTENw0yOdItQiCVJZJm42LxRD3sML
	 EJaryHk7YHedsItsVVDVIV/SgryUPZzH4+MTT9NzDUOux/c4S1yD19kI/R9OVKhkKU
	 L2HB1/KxQchjCDxaBLqt3KIu9yvuNZoaNbGrmyGclZOox3o7YwoYGt0xnjmEioO3zK
	 +rXp+nLiNzNbpvRkj1rg4agawGvCDvEocE1/ZRkjItmK/D3ppswLYMSXOYRrbIi5c8
	 ClPyxMRZUmbDg==
Date: Wed, 21 Oct 2026 21:58:48 -0500
From: Rob Herring <robh@kernel.org>
To: Bob Hui <bg9oxa@163.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
 QuarkPi-CA2
Message-ID: <20261022025848.GA879686-robh@kernel.org>
References: <20261021-quarkpi-ca2-v9-0-b75006b22bc5@163.com>
 <20261021-quarkpi-ca2-v9-1-b75006b22bc5@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-quarkpi-ca2-v9-1-b75006b22bc5@163.com>

On Wed, Oct 21, 2026 at 10:05:21PM +0800, Bob Hui wrote:
> Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board
> computer.
> 
> Assisted-by: Hermes:deepseek-v4-flash
> Signed-off-by: Bob Hui <bg9oxa@163.com>

You missed adding Conor's ack. Twice.

Rob
