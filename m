Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FF13B27C9;
	Sat, 17 Oct 2026 17:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792256706; cv=none; b=b4OpunpLT4+6Ot13lREIk+BHZghnL37wIkxTSOXaFHXYfJgLsn8ciPU3SNzJdDU36nqIW3/ee8vv4BPhbHTKxk+ZRlJ14slnLGKl7LmuVhEzYmZlrOWRLQfxq6m6Xr05VNmCN+mtdiD4m4pTOyv2Ip5meZW/YxP9OhdjFcYqu9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792256706; c=relaxed/simple;
	bh=NTv8UAB1ICSx0ptxYfIUBJ8oo6tkISnTzGdQg1UEECw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6k5s+67OyPN/TpjQiAQnTsB33JggaDBut+hn9R+GUIp1fFXFox61xwace5WfwXr8eybdju3VpMR+3C2FZSwP+vbMRFjEXcCAmwCsxU36Mvka5zlCN7tZv2Ur/XPwylWV4eN68RHZl50gAC6kCdxYJxvuvv6MWRAJqKMcDQPo/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXqya8iP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXqya8iP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8CF1F000C6;
	Sat, 17 Oct 2026 17:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792256705;
	bh=LHXrzvAT9LWhJb9bhlQvj4bxXBxn9dZWl9aPj62MfWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JXqya8iP5PMfMR53ETfSM+l5ehjll8YXp8b1eeWVuepfcNNUToADpcl3gsSCZrrw3
	 WwbaJ5nkmGd9aYhMa2jgPvu7GAeioCVUsD6NoDoOjuVvB/Pc8uLQsGE/lnA2ckSQkQ
	 u8lh6v7Kqog9T6+54wWH/CFVaHBfMft+lderxtUuTRLmUbno/E29CZkoNHUFGWgB2x
	 HpmHFQ8+uzabx8+nUFr0Lb3KBDHnY4iC6Dxcrwwg9HnZgv7+F9NPYGxa5uP9t23PSH
	 o+7H3FwDyQgz2XuuTV3AK8I0voybNhDgDDJH/9SpuG4sw3Qz1ieg8fJfzsM0vxAami
	 239uMMj5STT7w==
Date: Sat, 17 Oct 2026 19:05:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/5] ASoC: dt-bindings: qcom,sm8250: Add Motorola Edge 30
 sound card
Message-ID: <20261017-fast-pudu-of-promotion-cc0ffc@quoll>
References: <20261016073157.611956-1-val@packett.cool>
 <20261016073157.611956-4-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016073157.611956-4-val@packett.cool>

On Fri, Oct 16, 2026 at 04:31:51AM -0300, Val Packett wrote:
> Document the bindings for the sound card on motorola-dubai which uses the
> Elite DSP architecture.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

