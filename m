Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4D0495ADB;
	Mon, 19 Oct 2026 09:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401068; cv=none; b=cFRvmptJFJngxKUgKIL20U1Pjvd9y6MXf/zNK+I353G2NQEjbTZLn5isA/W2VcpfyCc7m77GLv1KyLLwXpiOUhfwxDdDI8b9ugYvAaYBgDL193MPLE2hBVxzo0ifC6nPnDATDiXz+opw9UkJ4oAi5A9cYsDbSYJjrtiFkF3sN10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401068; c=relaxed/simple;
	bh=zVd9PQIWsDjxS4H2IXKzAsdaF5yfqKSPmlOluGY6UtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anUJvzA8aGo1+L84r59SiBuMl2eA83iY3s3Af9evq9Nb+Bz+IiCSfi6YUctFgVGBPlSJntem7VhqhuDQSrN8y8RB5CBXGv0WWo0TlWXGgAoA7vAC7UGKVP61e3dAfAxhSsXEds0oV9WfLMHLT1NvW5OSNnby754X5CVqMtsXvYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ey098ywC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ey098ywC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1011F1F000C5;
	Mon, 19 Oct 2026 09:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792401067;
	bh=ykxBf6TH64wW7qLr3c6EteAmyvNmMRRO0eMONvN2DcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ey098ywCwlNDWbR1nfSeSUT3XxVxVxvenDDgCva64uYvOh9G7tWZf1eDaaOjqih8p
	 w+B8r16bxcf41nw6Vi8mG0EeP95PPxxC8I0vD90F6BY6+tz7VbksJmKZ+GZkNE19kW
	 G03O+XFLgYgQEfMsan0aVb0xSO8Hhzkrtd9oyQyBcDS4/YIM2FnaJbdkhBDtnrys6W
	 i387Rx9XT4sCxBr2Mbs/iEWhV1p+/eT1b6JC6BkRobTC4Ow3NIhVLfp7GNhOdHjW6u
	 ld/qGGyWHQID6q81dZUKr0ra2dfIYMeaNzmcxnjzk4bc+SOe1WTLtyjwqb0rURclip
	 pH76AibcWrlMg==
Date: Mon, 19 Oct 2026 11:11:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: tglx@kernel.org, radu@rendec.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, afaerber@suse.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, cy.huang@realtek.com, 
	stanley_chang@realtek.com
Subject: Re: [PATCH v5 2/8] dt-bindings: mfd: realtek,rtd1xxx: Add new SoCs
Message-ID: <20261019-silent-taupe-quail-6addcf@quoll>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-3-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261018160653.3940371-3-eleanor.lin@realtek.com>

On Mon, Oct 19, 2026 at 12:06:47AM +0800, Yu-Chun Lin wrote:
> Add compatible strings for Realtek RTD1619B, RTD1319D, RTD1325, and
> RTD1625 syscon registers
> 
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  .../devicetree/bindings/mfd/realtek,rtd1xxx.yaml         | 9 +++++++++
>  1 file changed, 9 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

