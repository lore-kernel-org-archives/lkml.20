Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361815;
	b=y9i4Xyysw+Q/782qiB9aug9Hfj7rWLuaO6GNJoLYsHXBfPLWCJIUthadQ8dDEjD4u6ov
	 txruNTlDFHuSKrNzjCR9K8KMIMzWWskx8C735t3I6ykxP98m75/ivfoF4zNOe3zgp2qeD
	 fOFKD96Z+joeGoI5kXZ5gyd253kc/yULiTmsGyxsu+HuavTkylTOHZotxLQaHhmtj+/V1
	 EzJJgpjE4zauXwCxezGbwYid+ukSh2Aoa6dMnxrYFDnv0tzEOJIvUBpN+eXfzIGFpObKR
	 zte75yLAbgAJJWRXek5lwXeQ/NSwJhKi18Lw/BIJknzVV8rLXBaymNgRSX6so1ie1SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361815;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=C2rZnyIbpP89ye6bG3lNVVpR9E9Mquq/SRfP5Fdrzig=;
	b=xI9EV/Z8/H3V8Y23SP2iNvhfLkq50yBwIhW085MPqoxohKYoN1j72rlCidxtntyEjNKa
	 /mDkDHhJpvk+cN+vlttkRWaA1NM15lIvq5HvcFtba+dbZVSXLgH05mR2BZC8TUU09PpXi
	 0l+QVzoI+sfltynHZq+ImO1ckd1feDweGwQnwFEkG/VPeo5j+tLpUaYhbymx040GciCwB
	 N25ExsBJH4Z49Wc6UQ3qP5ln33pbewICamlN//LvO1/4zzKE4ruz2I0/Jt3pnmmghr6uS
	 30uMdOExlkAv0aElJA3pVbjleWwaKpw1iaetuWDeK3rxfXMMRkV98n7bcZf9I94sMgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GZoa9hHz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B3A606A31A;
	Fri, 30 Oct 2026 12:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GZoa9hHz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151AF1F00A1A;
	Fri, 30 Oct 2026 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793361814;
	bh=C2rZnyIbpP89ye6bG3lNVVpR9E9Mquq/SRfP5Fdrzig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GZoa9hHzPrOnevW6nL66UFfYPR1bLjl/Gfh/ByEq9wZG4JLMlRqe5GnOZgMMEUEV6
	 W1t9xyphqrFdCQYwAmTUVv9RVvqRZEj/zrZ5Lx53Pk7O8/VXPoRh8ayBKktFqNZjoy
	 qNkJESDbPI2FJdxyBabtcv9YkR6rhYRfTkbFxV6OXEMsTaJGXiSt7viFo8A4nE0I78
	 sLObvsJS7/wq77PxHoToLRpedX4wsxSHfCP441qmRdeAdEtunwv7ylwgOHKFLoMscJ
	 mKYZIK5hSb8LMqIQvkmIUODAR0smixNBAXB8+7h3eMy+0YTTTmNoVjQOoCU9252Ylp
	 Fa++KEnxgQ/Dg==
Date: Fri, 30 Oct 2026 13:03:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Xu Rao <raoxu@uniontech.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
Message-ID: <20261030-adaptable-vagabond-skylark-bacc90@quoll>
References: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
 <20261029172325.3425046-2-vinicius.eduardo.pedrosa@gmail.com>
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
In-Reply-To: <20261029172325.3425046-2-vinicius.eduardo.pedrosa@gmail.com>

On Thu, Oct 29, 2026 at 02:23:24PM -0300, Vinicius Pedrosa wrote:
> The USB 2.0 PHY in the Allwinner A733 works with the D1 settings of
> the sun4i-usb driver. Add its compatible with the D1 fallback, as was
> done for the A523.
> 
> It gets its own compatible because the driver has to clear SIDDQ
> before releasing the PHY reset on this SoC.

Each device gets own compatible.

Above suggests they might not be compatible, which feels confusing with
first paragraph. I don't get why you are making two separate statements
about the same - first paragraph says A, second says B.

Just one paragrap and explain whether they are compatible or not.

Best regards,
Krzysztof

