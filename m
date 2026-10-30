Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378271;
	b=T+Gbs4CAix/jEG4LMN9TbUhNps2UFpds1L7diQoKKRzlTi50QoFIfc0MxYTxtuTb9A43
	 2I6Ip6apZCvofN/MK6qCklMp+X5BR/Fogdw5+To73RjP7Yh2vxGyKlZw36gZx38brNYIC
	 mtBfj0TQ8KHuCpZcN8N51MLYeeOi9hD9Ynpxnb2BRgMwEyVAfZM1m+jEFp1oYd4xOY/2o
	 D7nKyb1bDtakrc6h5QjL1qw/7qtQ90gbTKt0SC8HNFTX4yom04Q1uN0KbLdH5mrfjyqYP
	 FE9N3BpClm9pBO4AONbJlP3wChRQHNpJLURIEEVUQlgYJp1WtWfIX90Gk9TtZltjs7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378271;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7d1lCXfokWEj2gU8Igqxg+UFuk512owNqo1b4Avmm/M=;
	b=X5IJYUqQx3d3Heg2IFvpemO9BoR1JGmHE9kUihhHf7A2nxjyQN+SH6UooCUn+nYto3NM
	 jHy5RO0Zm7l2K3qdjoT4k3sTxE9azfA7+LBriBDMlySzbkGRYBLhZaz0TRPoGQi+ctp94
	 9PuDJGnkC7CxttNK1ucDIDc6loLflN+cLqJOWBbOGpcAmsKXZjBWrI14symNaNHHHQZuH
	 NwHOUvjmy5yBpAv6vcLbzQ9xNQnU6S7U8kuIklK38hT9e3g4pYkyfko1hXtw3K+vtaR7c
	 FMq9MdHwPdhHVDK2rtLg1cdfcK3NexjSK94dFCwuF9csXFta6w/tNXJIFpL37GHyY+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ol18xVxM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330B5606A31E;
	Fri, 30 Oct 2026 16:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ol18xVxM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C383E1F000C1;
	Fri, 30 Oct 2026 16:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793378271;
	bh=7d1lCXfokWEj2gU8Igqxg+UFuk512owNqo1b4Avmm/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ol18xVxMdakMmQ5o6hmkFU+jYtBnvdSdUFnrhXqci8M4OykyzE2NMVRH/egBxaTTU
	 VFE5WBaDBbhH5qQ5rJcdM++3JI2fhZIPpJ2ueerpveoxEqQ71C8PZS0OnLQab4SQOU
	 Q+G6xuCI2/urWo4OXD+FGMyT3fzL9ojuBwO9Txabrj+d/mJp1XWMhJvMriCR5OT2s/
	 PZb2gt+i768FF1mO/dqFkWPTmgz5x8QA985kKFojROCBIpFOlqoLKRa39qC6LKjgqd
	 GN/O3WsHoZvBysPeEeP0zc3UVoaO7qWmwiAev+GfwMThbLmbfw6677Ol9rgJkgPX9J
	 2VhtlM7bEqeyA==
Date: Fri, 30 Oct 2026 11:37:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org, linux-usb@vger.kernel.org,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: fsa4480: Add an optional audio
 port/endpoint
Message-ID: <179337826787.501373.7297897424032125426.robh@kernel.org>
References: <20261020162101.1527014-1-val@packett.cool>
 <20261020162101.1527014-2-val@packett.cool>
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
In-Reply-To: <20261020162101.1527014-2-val@packett.cool>


On Tue, 20 Oct 2026 13:20:30 -0300, Val Packett wrote:
> The fsa4480 mux is physically connected not only to a Type-C port
> controller, but also to an audio codec which has to be notified when
> an analog audio accessory has been plugged in.
> 
> Describe a second port intended for the codec. Keep it optional to make
> sure existing device trees do still validate.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 94 +++++++++++++------
>  1 file changed, 66 insertions(+), 28 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

