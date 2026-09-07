Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F312F8E8B;
	Mon,  7 Sep 2026 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774692; cv=none; b=YKGEG69myGQClPHDVBNHfMRPcaCB+3kHlCssiwPzbzClD+l2SgOEh5GPg2FcjW2E54qkIQJWXlolBms0JuQkUi6TgoUfBW4P6TKIJepg/w6l4F1bby8p9TRbW0LMiaoNBORIMJS8pxVmIY3AFAqQAVqJxo+UvvXpLc8rGEBU1Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774692; c=relaxed/simple;
	bh=jreJwinynHY2/NCmj4i/BYF3I6QPnPIMy8gEX6TAgtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXpNCeZ2opklqcNSceCxx0VILaXtAx+dvWulrXoP2H/c3Ct0O0I40DqegV6jK4eYnQCnZNVMNy4Oa2fb8L2vPZc1R8/hDoO1UGDfO00izR9Q8UMRzpA6jeVA4YiJVIAOrbUyHNNPKdppTyK3h4utPQ239OsJUNjy5dzs+rVbROo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+R2UVEe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+R2UVEe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407131F00A3D;
	Mon,  7 Sep 2026 09:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788774683;
	bh=y4aHi2NBIj96SJrBcWsj3GDYGoQMAIv4QQKJPxsBykM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O+R2UVEePOHQ6hv4lLCM1MqTm8C4JnFc2fcdI4wqBqNG8srP0IcHjWu35qMf2qa11
	 icZUjpYBm06reZuLDZTU4tAE6bkG/F7OvbUkIYfu46XQwrIMLsfVyPAoZu0DQhy/SL
	 HBb3Crujr7lC5hgKFjurAHvAVidcGdPYpX6mZfB0IufF7DZqDG7nFdBc/iPXtRDOUp
	 afn21OWMAiuRrjTzhj/8daz1yUyhuXPd0GIBBySyQvMyCpYTcLXiy0iJSoqMUPC9W3
	 OxCULYMuW1ak3QgQ0ujIo1gTUxsdtnTmTyq3qkoNSBbO1A6pUHPzSS8irVbbgXKicg
	 DX6SWNFXIRQSg==
Date: Mon, 7 Sep 2026 11:51:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
	Katsuhiro Suzuki <katsuhiro@katsuster.net>, Matteo Martelli <matteomartelli3@gmail.com>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Srinivas Kandagatla <srini@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/6] ASoC: dt-bindings: qcom,sm8250: Add RubikPi 3
 sound card
Message-ID: <20260907-perfect-merciful-skunk-dce009@quoll>
References: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
 <20260904-rubikpi-next-20260605-v3-2-f49146d85af3@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904-rubikpi-next-20260605-v3-2-f49146d85af3@thundersoft.com>

On Fri, Sep 04, 2026 at 06:02:26PM +0800, Hongyang Zhao wrote:
> The QCS6490-based Thundercomm RubikPi 3 routes primary MI2S to an
> external ES8316 headset codec and quaternary MI2S to the LT9611 HDMI
> bridge. This requires board-specific DAI clocking and jack setup in the
> sc8280xp machine driver.
> 
> The existing QCM6490 and QCS6490 compatibles select machine data for
> boards using different codec and audio routing arrangements, so they
> cannot be used as compatible fallbacks for RubikPi 3.
> 
> Add a dedicated compatible to select the RubikPi 3 machine data.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

