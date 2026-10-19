Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426006;
	b=wkO6dQ9h7e9sB48jqJAgBYxDoxZ0T/3Ea2vETd3HTfwZpWbQ4efHjaZjKnWsKxbYHMON
	 J3egW/4HoiyP0wFlj0aJm3HaFzTIojeMhtKCnC+B7mjNkHmDTIvWV2OekJHCDjDiPkD11
	 9iHC73G7iVC/U04mQsC6gLV0NKA5i22sWMGw4GNjxJLJe5gUISUESOtfgcmtWJOVzOOOj
	 9FaS0/gc/y5nXawTVTMEl7z1QoWkArkjhYx69GTsNgTzcHJcAEfqPw576ctuQ+b0moXn6
	 AL4IXr2c/GhuDnokTyUbfEqgEDlzWYes5RPeKPNW3xpBOe/dSC3ObcuxRRlaFzxkBjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426006;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Jp5wXZKiF38K2ehmIuNQpbfUGgmnxUZu6QqhScse6wM=;
	b=jO/Fml1Me3VpVZon55sevJNSucr9fAyAU5+vmKWvR98Hzab8V5fPLR18RQKYf3ftkgzs
	 y4jeJb4Udj1EMe/XBxoZZJ6QfwYNihpSnxE736kJ76KUNZ8JryGYdcvHQ7oPz1zfUY/uj
	 yCDVbWxK39thkNKnI7lBVwvDDBqlToVaaOVmUtOy4KGbzXeWr4GBS9vR8WuXzJ9tZXrfx
	 88xFL+Zml3mbD3+OlgIn1sY+EDi6XXSxNAkin/RThWKfwrczzQL0i0loLu3k0M0+KVDdD
	 0yzB4QQvNBD+d5KV+xULKy0R+NHBc53jhvl/6jrhKscC1JV/44sz5VQcw32i3fj0BFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bQWyl1IN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B446A606AF81;
	Mon, 19 Oct 2026 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bQWyl1IN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9DCE1F000CB;
	Mon, 19 Oct 2026 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792426005;
	bh=Jp5wXZKiF38K2ehmIuNQpbfUGgmnxUZu6QqhScse6wM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bQWyl1INyD4M/1yE5R/pgm9Yr/3dftSDHTtkSQL1yTIMaxlC3+nCmGtutnvhkB87V
	 Ur2iSdzXNCAkopycL3Phd4SD1eTQE0DcZGyUICuFbq9n8QYGyDDEK85UxbwrxqfdLn
	 1iv45meFdwSVQYDFeE8m28GWt7j2siKqgcuHXfG8plgdk/opOEPmaq2j6Ko2ErkKIO
	 Dlt5N8fqOqpILS5WjhroAeZfT4dVv21z1F1Z091E6nOn3uFbutpN3eazC6DdVXOA3K
	 JoZmyXgOz/ALPIWnvNyzJGPvQCE79vMzsd+e4QP6q23IEgcvQfS9+inItNtG0yCZDJ
	 v7SyCBgd6KJmw==
Date: Mon, 19 Oct 2026 11:06:43 -0500
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: Convert hisilicon,hix5hd2-ir to DT
 schema
Message-ID: <20261019160643.GB265407-robh@kernel.org>
References: <20261002193158.3263741-1-robh@kernel.org>
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
In-Reply-To: <20261002193158.3263741-1-robh@kernel.org>

On Fri, Oct 02, 2026 at 02:31:56PM -0500, Rob Herring (Arm) wrote:
> Convert the hisilicon,hix5hd2-ir binding to DT schema format. It's a
> straight forward conversion.
> 
> As this was the last reference to rc.txt, it can be removed.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/media/hisilicon,hix5hd2-ir.yaml  | 52 +++++++++++++++++++
>  .../devicetree/bindings/media/hix5hd2-ir.txt  | 26 ----------
>  .../devicetree/bindings/media/rc.txt          |  1 -
>  3 files changed, 52 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/hisilicon,hix5hd2-ir.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/hix5hd2-ir.txt
>  delete mode 100644 Documentation/devicetree/bindings/media/rc.txt

Not picked up by media tree, so applied to DT tree.

Rob
