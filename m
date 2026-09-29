Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6502EC0B0;
	Tue, 29 Sep 2026 08:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672208; cv=none; b=DSqWaS5XxQ8OV/3zlSq9NH+uoERz3xnpPpmTDv55hRF8vAp5Q5UTP6gZToYahRFcKu3Lo5Od0nqrR1oGwujrPFlSXG0EketzUIdh6iktLLCqJv9hZ8rvJsNM0CjW70ePjAX/IKQBbEaXNlKvdqEKZcKEDpt6uSKk3tFMS3xuZrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672208; c=relaxed/simple;
	bh=WS44XMjLbQIvsW40gF8BveZRryJzJb/qsKj1QZyIp1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgUvUfTOVexLKyb2TDrKZdlx9Y/SFikB/LcL8FT7EobvK9VdRc1jSPlUDx0te8zvfzFBCa+vqvbdUxWgaqQ3YkMU1pyfMS4qn3QEnhrgXSMvXxyyZAKUNfeL3qE2y1Rd4gED2Qx1fjTzDbQbsz+wfDHXJPCmB6JlqscRhLtqnis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEFCR5tQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEFCR5tQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BEC1F000FF;
	Tue, 29 Sep 2026 08:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790672207;
	bh=1O35bWhv7rul1V+NcDoa7onpK8atQBHh/v6NThRojCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mEFCR5tQDYhuQSRYGVzprV7ecKeeBi3ahPqjJUVXjWj5jayT9P5ToEH7GlyAT0eAB
	 guwv7TW+SaSAMi4B16gKFD3vvS/OJv817JtRsoL/NtJSYdOeZy1IdAHNcUa8dO/G9a
	 KGJoakfSuWD0EOUNKY8hQmTYN1tOI/two+44ZcwjVdRkuXMy25udTW31w2AxJxZ75h
	 3fUdyuq77W/wX67mrdw37r6IJelnn1mCDxkVY9It1q8n+OAavMKhEpJMyVQZURZk3A
	 wYfrtFNRiPbq690HUe8Cp5ZOo7+YmmUAGkpd6nKIZ623tNjB3cIdODwnigK70i9YqI
	 /g02XYPhetx/A==
Date: Tue, 29 Sep 2026 10:56:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Message-ID: <20260929-inventive-hidden-sawfly-03de2b@quoll>
References: <20260928102951.18369-1-liujianfeng1994@gmail.com>
 <20260928102951.18369-2-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928102951.18369-2-liujianfeng1994@gmail.com>

On Mon, Sep 28, 2026 at 06:29:41PM +0800, Jianfeng Liu wrote:
> Document the X1E78100-based Acer Swift SFA14-11.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
> 
> (no changes since v1)

You changed the compatible, no?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

