Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227353;
	b=4YgKoIzFPdgAT8CjWAjCTveZc1ccZGdsGVtB0L4pwtz7K6udqgSB9vOFHUtxwuGHcpYB
	 8IqA0yLYYzm98hpbkODysl5hdCAnLGyXk0kQBkvmO0gXWqBgf0Y7T7jXd6HqjwsXSoCpG
	 CrxyloE4UgGoHF/Ah7TXwfw46OOm1L+CqpMtTCcuPdeKZ+bfw54mM1e3evTv6ntNLcx2W
	 nSwLCpNOb+EjIkUc2FLdU/rldzvS4ObnOzUYYkq6TAmRnBfRBpZpGt3AMyvtjbdZLxkOT
	 Bf5iJaDAZCyOiSrhqwBVORANL0SWJMzHMycA/DdNX2Y6a9hP3AJIoLUURBi/1iDYvTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227353;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jTH93quHKke0J300xbWqQm1zZfh39Nli6AoyQ820G7w=;
	b=AesFnk90mLABane5UCpqm1qqU2ek9EUeeGs3F//erUKVCbGpXIDFIgBMmJugXKpXMulG
	 LSBQ3xeuul0H+ffjx7g3w2S24m2cED+2PSeC95Z6n2Ls+u1Iyi85L2vvFdDkDQRZVK1+y
	 dCsbY/4YYlJmKSPE2XOsI4AAXMc3v9ZSWF8YZZ9fb6YqWBE5j7TOQvcz0fgtN8HIAZCXZ
	 +KAvuuEPe6G0cN4igFNgKNBon9CcJA7P0FXD21f224D/WP03RCCN6XZwMolWKHkpf5Y4R
	 7jrsnK6d/wSJxEfK3L7x1XRWXKN7oI4q+ZfOherrU+zcK4U9+r/AESSiqGbwKJ1gFTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g1he85hi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2571F606A336;
	Mon,  9 Nov 2026 12:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g1he85hi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27731F008A2;
	Mon,  9 Nov 2026 12:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227352;
	bh=jTH93quHKke0J300xbWqQm1zZfh39Nli6AoyQ820G7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g1he85hiB1f6uirdGAFk3nJ+bqOXdGpk6/HCv03guRJQrDEAz4CNnKesLW2xED07o
	 xDvUv9ikZGHmBv9LoMP2SyWyTIExXzNnqDRxtrT5kqWoW59D2a3YuatDpJXCS0Y1Uy
	 6OsyeXt5rmz/5JkhciAZKkH+ZeNCqgauaUPTtBEfHcfHACINB1Z4T6A9y2IkmkyPDx
	 pPImBCKL/w/P64XHP/iAYlr5LFgMqYxQdOqKYn0pf8TDgVD3SNDXC8LYNvWu2CkVQO
	 W5NA3bYlKmGhEpEpbjjnabmF/JAzXGM2S9dNnJTk7LYd4/neF3HnRkkqTZbLoH+ETz
	 IaeM+7XZfbkHQ==
Date: Mon, 9 Nov 2026 13:29:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/8] dt-bindings: arm: qcom: Add Glymur SIP CRD
Message-ID: <20261109-adept-unbreakable-gerbil-3f375f@quoll>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-5-52cd3826ab49@oss.qualcomm.com>
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
In-Reply-To: <20261106-topic-sip_cob-v3-5-52cd3826ab49@oss.qualcomm.com>

On Fri, Nov 06, 2026 at 10:29:06AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Document the compatible for the Glymur CRD variant which uses the
> System-in-Package variant of the chip (different package and power
> grid). The rest of the board is seemingly identical.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

