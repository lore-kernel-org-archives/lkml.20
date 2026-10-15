Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5AB38D686;
	Thu, 15 Oct 2026 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079599; cv=none; b=cOrw9Ax9H56RlB2bmbqs3rPmnVfPh7VUu0gGQaOMoImnHW6ZttrczZMlSj3OXuGOJDYpZskjDiSPh8hOUjmcqLIpFsuzH4GegwFK6UuvNFcytkxQgtkzZFii12RdswPO8j5j0xq3YeL50TFz0ytn5sjiwnr1KW5g04K2rC9E/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079599; c=relaxed/simple;
	bh=z9aVFTetYuuX8hGD+JwZRrbsiOhsgiSVTv0GlpT8DOk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ijpt1N1KvWB5EqifkA+r7Lx4L34P10EkyUggoEDV5OKxGBskrlUV0ATXJteftwaOWt9v1lwEW8c6rkz+k+YEH4gUwS9jmtIpuvS3FOdB6Ue2VWrM5SCm85dpLGck+BHn5Lt05NkFZJqTE7q6erZ4RFIEnFf5gJm76lX1kQatsWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cM9FQrU6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cM9FQrU6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBF71F000C4;
	Thu, 15 Oct 2026 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792079588;
	bh=HVw7Nmm0VW1a3sl5XHyrI6+aoyrs2z1eR25B+WaHeQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cM9FQrU6LiVZexQnyD/RSRu/KEyxBDWORjo59+NoyN8ppIcaspjtF4wM9B/Qim4KS
	 8RDAfqeWp/ny0IWEr/T8IFYtrtW79Z8LLJYRYp2mjBlSvN8keOUMRFcIedplYrLCzE
	 ULc3tQSh/G85xDz8ysCHEx1NSL7eUJKCcUKMMANfIre0SU6o6RJglPA9eRAM8hdjQ/
	 m1EJzFZmHyz1gL5iSll/M8IOBIlunQKplebkdLxWMU7SU6EUfFpJFWY9hauO6cXrVL
	 h1FMql5Lz5fALhNwjqpOJA/54uJNApzN3Rogs2h6lUF39hk+VT0zPeGPgj+M1t8ZfN
	 camhYwBdkU0jg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Quchaosheng <quchaosheng000406@163.com>
Cc: Chris Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260923083001.606935-1-quchaosheng000406@163.com>
References: <20260923083001.606935-1-quchaosheng000406@163.com>
Subject: Re: (subset) [PATCH v5] dt-bindings: mfd: rockchip,rk805: Convert
 pinctrl to DT schema
Message-Id: <179207958534.2076854.17430709456309504242.b4-ty@b4>
Date: Thu, 15 Oct 2026 16:53:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 23 Sep 2026 16:30:01 +0800, Quchaosheng wrote:
> pinctrl-rk805.txt describes the pinmux controller that is part of the
> Rockchip RK805 PMIC. The PMIC itself is already described by
> rockchip,rk805.yaml, so the pinmux part belongs there as well: the
> pinctrl node is a child of the PMIC node, not a separate device.
> 
> Fold the pinmux description into rockchip,rk805.yaml and drop the
> standalone text binding.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: rockchip,rk805: Convert pinctrl to DT schema
      commit: c2f8288a58e22feeeb9c444bbaff179b0058e459

--
Lee Jones [李琼斯]

