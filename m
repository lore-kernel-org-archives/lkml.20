Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793828087;
	b=3X/+bp9tswVlXVLOLC8EvGkomRUb+5tz1EbZgQipbNlH8xKRJV4NQW+kpmO9nD6977Gm
	 AZ/FMj/gEVgKrDowKVlKjGn0h3JteknlmJ75bnDMYCxO8iC36szvXVpv8sN3lt2jeNYvm
	 iWMoJFOKP8zjfMyInurs6pUYP60MoEUCOruO7ehLyj1rouqnX/vOz7X342pkJd/oJKof6
	 RpeAKmEUCRQA5KCSglNaaqzP9hf9BUSPDT4pTAbhHjcKu1XkwFWSWc8WvpI0gm60G/Zcu
	 qYE1kbJ6qluuEiArMRNL3ed+G6kH56kDcYnvucW2p4Cjz0phPiXgCI95mrH6BWj6dwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793828087;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ShzVspK63fdOHkKO/fREdPnfmyl4LMUNmIISdYeZBvs=;
	b=Hjeeqk6Orbo7TM2aNw6qoM6dXoBXF9UyFNYLm9kJebxjWq1bPEnN3j9gYvAjkq/RSaMt
	 vO7GowAgKlg1KWZpO670IoqhoJdCb0GyTNOuTSBj+xbR565/VlQ/GsaUFrkcII//OPNTz
	 R0AaO0HJCFk84vlnD7TwJj93ITwRqGNCHNsaB6v2WSMN/HgRxDwfRgAv7h03kti2l4H6N
	 X+X9JkLpBQ+feAWee1Gxmz+1gjF6M+HiSd+xIdyVZYk+Xn36av0e8do+F3SvdZom3mJIc
	 xLfbcdO+cObW3ZfA5UJ9/q9IBTiPAGjDkul4ja4V2oR7Ak6du8K3EzK1sBFCxN+p38A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PjzRGLZy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28F2606A328;
	Wed,  4 Nov 2026 21:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PjzRGLZy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD941F000C1;
	Wed,  4 Nov 2026 21:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793828086;
	bh=ShzVspK63fdOHkKO/fREdPnfmyl4LMUNmIISdYeZBvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PjzRGLZyATdRZBvdjN+WU4amzH+gIDfCBzj7SUCFI5kHr9JhSawlSa0wmKrmX5SsA
	 PEnNgZDPzDocxjy4EVkMjIjLLI1m/sbbv8xnoXX+NeM12f8oOGl19B4cGpFvIwvo96
	 UWFUNxTukVUkSvMDIhOgs1MhW2NpIXr9iVAr+ZuaQf8zJSPW93iJOcwnMBeVXDn85T
	 9ezAvJ1ymvkTn/gpYXKjtedjzUzguQ0UGrZVgGn7oeNkC0/sPOvYixN4gEBp+AY3WM
	 MnxANfDVzFYjnfTmokKlCfp5Sd48FUOLPmcRuelKXrkyeyCmIAb7KSdP9uLBGZXBZk
	 Q7tAqPZck2KLQ==
Date: Wed, 4 Nov 2026 15:34:44 -0600
From: Rob Herring <robh@kernel.org>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2
 address and size cells
Message-ID: <20261104213444.GA348285-robh@kernel.org>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
 <20260929-kuno-soc-support-v7-1-530f62dc4020@oss.qualcomm.com>
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
In-Reply-To: <20260929-kuno-soc-support-v7-1-530f62dc4020@oss.qualcomm.com>

On Tue, Sep 29, 2026 at 03:18:06PM +0530, Hardeep Sharma wrote:
> The QUP wrapper maps its serial engines 1:1 into the parent bus. On
> 64-bit Qualcomm SoCs that bus uses two address and size cells, but on
> 32-bit SoCs such as Kuno the soc node uses one. Requiring two cells
> forces those SoCs to spell out an explicit ranges property instead of
> the plain empty "ranges;" which dtc only accepts when the child and
> parent cell counts match.
> 
> Allow either one or two cells so the wrapper can follow its parent bus.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This fixes existing warnings, so I applied.

Rob
