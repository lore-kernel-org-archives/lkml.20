Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2478A4A8A30;
	Thu,  3 Sep 2026 12:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440137; cv=none; b=E5pq/0sEfz4wTV6QbTi7NYCPjr5Q3zkBUgLe1oWaLLGIEL3PTk9sTUYlGPEf2xd8+FTx3RgK2u28M4VyFLOTAhpQTWBPcg55U4cHgu6bO7hsITcYAB9l1Vpys4xfTuCaleG3BAtGSyojh325w1SmDzCuEelDpgolnBukFnO/keU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440137; c=relaxed/simple;
	bh=QfJGH2oWKkC5ehyHNA8nMAUEOJDpADPIoeEhFKcU5h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+3Px5sQ/TThVnEr1RH6nI6BIGIvfjB4Zqhj6yf8idoEE0VSYOfCVa8Zgs1XN8LFEmMEKEtHiC2gojqYPiFDPYoXMWl3CLqwaVsNSWsyRmWPEF7qyka1qiBibgHNe6sH1IYm0JTJ8WsEiOxkx652ekdN2oXsMv0ykF0KWkmIsAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UujTKqyQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UujTKqyQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE7B1F00A3D;
	Thu,  3 Sep 2026 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788440136;
	bh=QfJGH2oWKkC5ehyHNA8nMAUEOJDpADPIoeEhFKcU5h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UujTKqyQ3GwAgVlFdA6x02WvB0JV5MmxYg97baXG70PoFRImkpmyW07oz9dzCXt8M
	 d2vvvXLuUggC4RK7QfGvX1HDWcKTWJ7wKlYME5eEPiwICeJWH7s5yc8McSnlETwACM
	 bUFWcxvrsWVXzJLrijqYQWsLY68Beaovt0SSK7p8WLz0+Z5MPwadJ50NOGvU64Us0q
	 su6N9vis67SX0gAz04aC8gvuchFhKsafdDn/3ZcH5xFWhdkheAmpZmBScx6f6cLZaP
	 an6HFblRvjR+qFlMPxeHCgbbNXX9beP8vc2LuQY5QEDQghOjDyKQzOtFV3NyMJ9iM9
	 wZicATgt7TFfw==
Date: Thu, 3 Sep 2026 14:55:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
Message-ID: <20260903-enchanted-umber-beagle-ba4b7e@quoll>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-1-e3a76dc9e21c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901-lyra_upstreaming-v1-1-e3a76dc9e21c@oss.qualcomm.com>

On Tue, Sep 01, 2026 at 07:14:01PM +0530, Avaneesh Kumar Dwivedi wrote:
> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
> board, which pairs the Talos Lyra EVK SoM with a common carrier board.

EVK means Evalkit usually, so SoM rarely is EVK. Are you sure this is
the correct name?

Best regards,
Krzysztof

