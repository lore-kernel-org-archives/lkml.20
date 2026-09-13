Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA969344DBD;
	Sun, 13 Sep 2026 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289321; cv=none; b=GzwMbDT1A5ZTiZdScYAkPoZpcdaX6FL/WGLYpMb6IYIazyvAZfby5BuHEMkAmWSwHdGKlf6J8cZMnHjrsQLCUdfjM3DzvxQf/Px8aaVI0ER61c6GHwn1WgslnXbFTNSQCfZ/yCuDYpWKNDb+EjGpfR0cc55lah5QHz5jn8b9buQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289321; c=relaxed/simple;
	bh=pRVWt4lUb/N19rYg46NOlyrgv1y4aozIKyaparOTH9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCCNC1U/JO9PvzT/d04MPqD3FEJLqoMjgXw9rcEBlapFzsJhBjkgzdyu1aKZhEWkuE0j/6zMJQUwlGjolpqdqjyfSW9JMYYVrMhL1CB5Z5wAVHqjkwP01ru7wfnJckpN6ifD9LPQEMNPvJcW9wByB7Dig+uUXx3tqN6hjbAPMV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJfP4V0K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJfP4V0K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5694B1F000FF;
	Sun, 13 Sep 2026 08:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789289320;
	bh=q9b+oorGTRHCVDiv10tTcI+CXwyumm9Yvq+2cN0P4Qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OJfP4V0K9GeCtqTHG7SOLTH6qS5jz+dhKdInmif+gnEGz22vZxGMg1F8nEn4g/f+N
	 9vHFDdd/Bn0Aup37HvgEHovuDLBq9xEga4mU8INhjSSGmKr6AdwdHz2TGmK8xG/6Yt
	 lHhJyt6D7mIt29PSWXHIdoR9zX1GmHCdXX1gRlCIXudbwQoADNe3k+s0YETMU9WxhI
	 vhSRIbzqiyYEBLl5jMvMcCit8Ek78zf32LzS95M4btmWE+AYxlUCVrscfnhZVoZo6D
	 1PQqMGNGQVEDgeQt5VqQnTn9l5loBDS1+omJ/6ucYT7JMT1WEY2uyfujwtLuwjRxtR
	 qvdXFcwJw1aHQ==
Date: Sun, 13 Sep 2026 10:48:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] ASoC: dt-bindings: qcom: Add Shikra RX and VA
 macro compatibles
Message-ID: <20260913-melodic-violet-dogfish-fb834c@quoll>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-1-fdd2129c696c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910-add_shikra_support-v2-1-fdd2129c696c@oss.qualcomm.com>

On Thu, Sep 10, 2026 at 03:16:52PM +0530, Mohammad Rafi Shaik wrote:
> Add bindings for Qualcomm shikra rx and va macro codec.
> 
> Shikra integrates LPASS codec version 4.1, which is not backwards
> compatible with the already described compatibles.

OK, so it is not compatible with anything so far, thus existing
constraints from the binding do not apply. Then why are the clock inputs
flexible?


Best regards,
Krzysztof

