Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418042;
	b=z4MKBYlbgqrRP9qv2bqE1YIIcuZZd6QOFsU6BsycMZGRz+srg+I+5LBHGRbXqVtwvUOI
	 JXQi/MpUXK3RsS0lgi6/X/khY8NCeEV+3ejWd6yxNGAw9jnIVZ/bOSFBvjFC09CGWuKk4
	 C6HGOvpPpCXTu4JGpV7mAzYhd2wVYAqUVTyPok9yeOlXqI3wEBvwtMA7XfyZ4KP+gI2Ox
	 YD+mnZ+9Eqm5Hrhs/81GpwJpk14DiTNUWozveD70aUezL1zd9VN9KKo3MLCQA4RZIOqEV
	 8CZTuMHh4Mz1x+S8D4OLxc2Jh1q3gLLB1OEvFwEs9JKloXfr/BNNxAFa+miNlvMmbCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418042;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=drt6bFkBv178cJO+P7WExaPrMxk8Yq5UNXKDoei1MCQ=;
	b=AgWM8As9GtCt9WPDfOYRg/tjads52vYKT6mJflRNn5zAhu0AzrV14h5J5Xa8v/wIGUzG
	 FbyIPLmD+3Ev2+rN5yKOi9wLKGSczWSm5BA0SdpVKfDHHygyFtHe2QsS2/CFlibn4fdaV
	 S4Qk19nIOrvphw6Nroh0BStn8SrJRksgNhQKsxZweS6ReaE/JWR/7SBDpIlDR0UNwApSG
	 jYSARdKY5menLbJg/bNKoP+6tyYf8Lvc0YNHDIWepa5uV9Bc6esQnFZjVPdPoh850pNZ9
	 395dMeiCQK2L5TWd82RVfxuof0mXk0nW7GzAeC0el7ql6bnwVy16Cf2B0uNxM8R7tSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cYFsVGf4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A76606A321;
	Wed, 11 Nov 2026 17:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cYFsVGf4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2C31F00A05;
	Wed, 11 Nov 2026 17:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418042;
	bh=drt6bFkBv178cJO+P7WExaPrMxk8Yq5UNXKDoei1MCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cYFsVGf4NBVdTKN4CbCW5yQsVh8gDenbOHLx1KBypUSEqU7bmrPhJz3nlaa60mAL8
	 CWnvYbm4MLk72SqpzKATlBXMmGJBKRhVkC5JMhQDDZcq/zuxxdRRpsn088tk4jQ51X
	 +mOmOvtn3um/6WTGbCnj7HlAQhdSqlfG95beSIbW5SLG7GvBPMA7+39X0ikcq4ScTP
	 NS0o0NpQ/jhHrrFoFO8VQmi0O+rb6DHPF7/mvNeTb5KIFEVhBlQwMJjKFtP45jOloi
	 ktXFnPbcKZLWR+Dne2e6Aoawl4S5R93oNt9BtWVvadJO9k5FSBcQfnAQ6wavJdJlvd
	 /x5etHOT3ZqlQ==
Date: Wed, 11 Nov 2026 11:27:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Mahadevan <quic_mahap@quicinc.com>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Danila Tikhonov <danila@mainlining.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Del Regno <angelogioacchino.delregno@somainline.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Robert Foss <rfoss@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
	Richard Acayan <mailingradian@gmail.com>,
	devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	freedreno@lists.freedesktop.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] dt-bindings: display/msm: Require DSI graph endpoint
Message-ID: <179441783226.4120015.12174944636473780529.robh@kernel.org>
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
 <20261110-display-msm-of-graph-v1-3-0f3106f817b4@oss.qualcomm.com>
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
In-Reply-To: <20261110-display-msm-of-graph-v1-3-0f3106f817b4@oss.qualcomm.com>


On Tue, 10 Nov 2026 13:57:44 +0100, Krzysztof Kozlowski wrote:
> Technically, DSI controllers do not need OF graphs with endpoint to the
> panel and could rely directly on their child node (when panel is the
> child of DSI).
> 
> However Linux Qualcomm MSM DRM DSI driver never implemented such
> approach and it requires a valid graph endpoint pointing to the panel.
> If it is missing, the drivers will silently accept such DTS in
> dsi_host_parse_dt(), but later fail on dsi_host_attach() because number
> of lanes is not initialized.  The number of lanes is initialized to safe
> default only when there is a valid endpoint which is missing data-lanes.
> 
> Extend the bindings to validate existing DTS to match expected ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 6 ++++++
>  .../devicetree/bindings/display/msm/qcom,milos-mdss.yaml          | 1 +
>  .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml        | 2 ++
>  .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml        | 1 +
>  .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml        | 4 +++-
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml        | 8 ++++++--
>  .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml       | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml        | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 1 +
>  .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml         | 2 ++
>  .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml         | 1 +
>  25 files changed, 48 insertions(+), 3 deletions(-)
> 

Please don't apply this before the .dts changes. I'm tired of chasing 
down transcient warnings when only half the ABI break is applied.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
