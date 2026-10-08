Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7315F38E5E9;
	Thu,  8 Oct 2026 19:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488900; cv=none; b=pVcq+xM2kyKYnAPpZYWO0qHDctbUI/MN9A+SJZhMZhh4Gt5KU5VCxq1ejVkh8EKKtT/Egd7tQo9MFMcxv3wjJs2i8Dr61Yoj60q6W9Kr7YK8YWM3DZjsRcAlPAyE9irmthoBMAGSVEDAOCLxEKoA5UXn3ev0zAdmSo534WtS2Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488900; c=relaxed/simple;
	bh=M5uIu6puK46fm6TLtTf711PSDJI5UlPdFbtyWHKvUP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIsNCUaM542aB9lQGvzZjtSsfvgbcm5llKNm3g+o05AtAk4BGH+NP9LB/dIBXV86O5wWgWZ/06qSu91obJZ281uk3rymjLT/UlyvOX1yAcF6Piz+Egduy1Z6lRDodpgmV+QKZUYXrGPF5M2IWlNnR0wdi5/FQe2bwBdcyVqhXxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G61gZWg7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G61gZWg7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAEFC1F000FF;
	Thu,  8 Oct 2026 19:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791488897;
	bh=/3W//7HChM3zyLxsRiM/y4C5pytan37O8X+1p3KOCdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G61gZWg7IxdkHW0KM1z0Ny2daAUxNkEKceH41inswh1JTwKSVUpsEbHR0XPq/GtMI
	 NiJoqyiwC4pKoBOfKyc8BDIkrAgJ1ggQHwCUXYHfTcjZHVcFhbt/0dQuOkPmPVjFq+
	 CE+o2KDoA8XOskaJRF+vDjxBlW4eusoBqmaU0HlXhdU/wnPNMHQeI0NPvk9i4/gl3V
	 Wa+P7OViqLToo1MQrDOXz+yQtac0xwW1nNSSJHPelEK9omqreIg9B0Pe1yM9S0LW5L
	 +7+KHs/u8J9QB8uUguiHvuLIvTujGLkD51eiE7eoXM111NN0Z0rZBBKA2Bg3ttN65t
	 qajbIWRFqggzA==
Date: Thu, 8 Oct 2026 14:48:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, Kevin Lu <kevin-lu@ti.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Sen Wang <sen@ti.com>, Mark Brown <broonie@kernel.org>,
	devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>, Baojun Xu <baojun.xu@ti.com>
Subject: Re: [PATCH v2 4/5] ASoC: dt-bindings: qcom,sm8250: Add Nord sound
 card
Message-ID: <179148889658.900686.10369549179867357791.robh@kernel.org>
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
 <20261008-nord-asoc-driver-support-v2-v2-4-0b6f7e94060d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-nord-asoc-driver-support-v2-v2-4-0b6f7e94060d@oss.qualcomm.com>


On Thu, 08 Oct 2026 16:36:44 +0530, Mohammad Rafi Shaik wrote:
> Document the bindings for the Qualcomm Nord sound card.
> 
> The bindings are the same as for other newer Qualcomm ADSP
> sound cards, thus keep them in existing qcom,sm8250.yaml file.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

