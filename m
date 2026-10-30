Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352508;
	b=neURCw4HwvmPm+8n/hlMvgrZ85GW7x/gcDlL1mHLgLHT6ML4tJomrI222VTNeXtq2vKz
	 lFswIN9tlU0v3a5j3rMQHHgAff7Z535/wPgXoiSZMhQSiceE911BcmjInasEsrwZU9L4K
	 fr2MUZe2D/Cekrh9NBn89vTR0lmPQqPlrfNdSSg8qHGhJf5uozFNA6klnLB3u3MyVBhE3
	 +dMZxs2u2MRZe+IBVYxXkWBlRNtu+F93cH8VtHmO9L9uDMv3G8J9lYGy3uWH9xXqtHPaA
	 CFHdAXAsMiSOd5h1lxVp8GvG5pTG+r1KyJ7iiGUc402M/8UR9N+dzoPwe2TvVJ0vTgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352508;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KWBaHlS621pvpJf4ngK+XZKBR/fw7GxlM1n+lgz2A0w=;
	b=SNFyurXwBI2DmyAkamDXlkXmcZvgq5sZGFOVBcvmaJnw0dsmKgfFkorY8OUcXxBSZTK+
	 iVIvrjnzz4HtRtOmUM6jDzXwdeec495Tsy5SV7Fd3INX+SnHT6/y4X7HnDFYv70/qNs12
	 9N2TILfTWzs7KGvsDokoh+4SdztjkzjD28wjvn6Pn4dbVUoV5w0ITDdaXIH+pn3pyDAL3
	 asPiJeNhfKxOTcwxmzOOtiJAhQnOOyjBFT+vzAB5Iy9zHr/ORgxUxnW+LSBc220hDXvh2
	 Oc9U0CjirR3t660B2HcE+wv6Xe9dy2U6sDFpx7XhR/POU2SbuEZBlw6b1GEhT+bOC4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mBHaHZfb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF9E606A31E;
	Fri, 30 Oct 2026 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mBHaHZfb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE8A1F00A1C;
	Fri, 30 Oct 2026 09:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793352507;
	bh=KWBaHlS621pvpJf4ngK+XZKBR/fw7GxlM1n+lgz2A0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mBHaHZfb6IMIuKHjCxzr9pBUwXJPeQkZ/lc606u28zChC4RUNwuwm7uvqgwhDwq5m
	 e+skI0VC+OAuozKB6QfTtB9JWjOJLJXJc/k+2plHfdmMowu0MCY0JSPyekH0Wgljfm
	 NEicKF8WIJhIVH2YLqs57bvqE2joSE/4alX0wIohNaC2zgm1wyUzJZcw+xrHhHo4U8
	 UiL8MtLhyiaODNThBxMIIvGZPgmElbtcCCt+/WY7mUJ7k5l1v7mG+1D2sdbm0H+LsE
	 wLCyFwm/WKNVIRSd2mgLRZppql5/sZQDQZr1bH20/nZTPR5Wx75Dsizv/j+uQrlJQ7
	 GuyDlGvk0qoYA==
Date: Fri, 30 Oct 2026 10:28:21 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Subject: Re: [PATCH RFC] arm64: dts: qcom: nord: add ADC-TM thermistor
 channels for Nord PMICs
Message-ID: <6drdycuoo4n4qssp3axrij5xrftvg6w24z4oa5xw6wmtayknk2@mwz62l7bnvhg>
References: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>

On Wed, Oct 28, 2026 at 11:01:03PM +0800, Shawn Guo wrote:
> From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> 
> PMAU0102 (Kai_MV) and PMM8650AU's Kobra_MM ADC5 Gen3 controllers only
> expose REF_GND/1P25VREF/DIE_TEMP calibration channels; none of their
> AMUX thermistor pins are wired up, so none of the board thermistor
> rails feed the thermal framework.
> 
> Only 3 AMUX pins are actually wired to thermistors on Nord, all on
> Kai and none on Kobra: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai
> instance I's AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). Kai's other AMUX
> pins are either DO_NOT_USE or wired to voltage-rail monitors, not
> thermistors, so add only these 3 channels.
> 
> Add #thermal-sensor-cells = <1> to the two Kai adc@ nodes that gain
> a channel, the new AMUX1[/AMUX2]_THM channel(s) with qcom,adc-tm,
> and a per-channel thermal-zone for each, following the existing
> Gen3/Gen4 board pattern of a direct thermal-sensors phandle into the
> ADC channel.
> 
> Signed-off-by: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

...

> +
>  		pmau0102_f_thermal: pmau0102-f-thermal {
>  			polling-delay-passive = <100>;
>  			thermal-sensors = <&pmau0102_f_mbg_temp>;
> @@ -501,6 +545,42 @@ trip0 {
>  			};
>  		};
>  
> +		pmau0102_i_sdram1_thermal: pm-i-sdram1-thermal {

Existing thermal zone nodes use the "pmau0102" prefix.

With that:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
