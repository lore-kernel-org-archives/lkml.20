Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619323;
	b=i1CHKTL+b0g0oB88lDiC1vfA28mvWS3+KXo0eRKQfJrIs3tfFpMvI6OTvZBCj0icexYD
	 3EgsRDl+H8/IWsqwDhUaMyP1GyvbDOZ90Ju8PYdvOO6mtKQumvCqxVgSuZKjbyPqng9ZN
	 2IqO8MgvvRH77NASWtLdjemWamKiX0hJwmyRgv+vX/QV0k/u+dzuIes+b2/rGA91thQwp
	 76kJy3wVeaeUzE/OZZ7Xn9VZEeoYy5QJGg8OsCOdopj7+8TOAUwigfUtIo4v1JzXSyk1L
	 iU9LJw+cC5tc5EWWW7oVAgZAieQBdppuJtqm/KrOBly23htaSXu58IhprInPQZrPq8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619323;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CF1jr6GRQSNTpKRllk67ZQnHtv9gh0KtJu4qQ45Jgew=;
	b=cdPwGmkazNZP+CQPiv8v9GhfPMV6UgORuEA6MoK4+6yLaZAzEpMNYfXhKiSPY0dcq3uH
	 Pi0M4KqmckBD8oo4Gr2fF1GHOdKEP5FgueALgXEiTBGYUPP+N46I2nz/6lXLoTGnBQ54K
	 YyQ/w1yh8IDAUolflfw/XQovNk1vvdfv3GUnaQzaLSDT2tD9rl5Yvab7wsch+uk99I5jl
	 FvklwUG6tFsEO+2e7coumC21tqySnP5zXU032r/0nOFQ+iZkTeR65MWlnkqNDuRksZHBJ
	 zuXsAX9w7EuWcXfiMKXAZtEKb8yuB1UP1LSrOsnBfSCw2nkhJQUDoe8anYhQypOuGKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=doLdGfuG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB9B606A333;
	Mon,  2 Nov 2026 11:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=doLdGfuG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698091F00A16;
	Mon,  2 Nov 2026 11:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793619323;
	bh=CF1jr6GRQSNTpKRllk67ZQnHtv9gh0KtJu4qQ45Jgew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=doLdGfuGVrltouJIqgBGR0f7CCDjfsFAj+eIlt24pk4LQawQW1n68UZPnruEk1d2u
	 3AYSMzTUomXjXFUqu9VevcQRdHmFDPipwW+NG023TtSP/ez+U3bgm7RKY808xqUUKO
	 FOqlAzE9Ub6yV81JP2gmYiBEktl4AzeNtvxwyh2NQRPvruE5RioBSAyyPEz581/7H6
	 k5E6Z7EliagEjOktRITBeWr52CskEs3O6gQbUw+NFq+O9/Wz+NW8DDhFIXMm9/tbDw
	 3tyy4CcEbzXD3fSc02+xN9ucdBIUwBn8aijOj9VsOQ6ls6ODzlPZXAUCdNuPfqQzVa
	 ma3z3CvCY29bw==
Date: Mon, 2 Nov 2026 12:35:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: display/msm: Add SM7250 MDSS
Message-ID: <20261102-wandering-peach-lemur-0c57fc@quoll>
References: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
 <20261031-dpu-sm7250-v1-3-159f403ec405@brar.si>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261031-dpu-sm7250-v1-3-159f403ec405@brar.si>

On Sat, Oct 31, 2026 at 01:23:39PM +0530, Ishu Brar wrote:
> Add the binding for the SM7250 Mobile Display Subsystem. It has the
> same clocks and children as the SM8250 one, so it is modeled on
> qcom,sm8250-mdss.yaml. The example uses the SM8250 clock and

No DisplayPort?

> interconnect headers, as the SM7250 ones are not upstream yet.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  .../bindings/display/msm/qcom,sm7250-mdss.yaml     | 351 +++++++++++++++++++++
>  1 file changed, 351 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7250-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7250-mdss.yaml
> new file mode 100644
> index 000000000000..aada943e0cf3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7250-mdss.yaml
> @@ -0,0 +1,351 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm7250-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM7250 Display MDSS
> +
> +maintainers:
> +  - Ishu Brar <patches@brar.si>
> +
> +description:
> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates

s/Device tree bindings for MSM Mobile/SM7250 MSM Mobile/

> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS are mentioned for SM7250 target.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm7250-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB clock from gcc
> +      - description: Display hf axi clock
> +      - description: Display sf axi clock
> +      - description: Display core clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: nrt_bus
> +      - const: core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    items:
> +      - description: Interconnect path from mdp0 port to the data bus
> +      - description: Interconnect path from mdp1 port to the data bus
> +      - description: Interconnect path from CPU to the reg bus
> +
> +  interconnect-names:
> +    items:
> +      - const: mdp0-mem
> +      - const: mdp1-mem
> +      - const: cpu-cfg
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        const: qcom,sm7250-dpu
> +
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sm7250-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl
> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        const: qcom,dsi-phy-7nm

Best regards,
Krzysztof

