Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018427;
	b=QSJZS55Z+0W6dXPXSkDOynziCTFnRI3wZHUsPA+VERVG539eEVfjJLKNfvg0niiulCnK
	 8V8Bq5mPngAhQUyjgr/k3DM6+nbbxUbt9nYjUAjuMQpiigLFWg4UnfANrT9frXhu8nNFJ
	 EKXzc8YJH+XxmTcBf9+s9oy/iOBFF0EpyCcI1/PCjsdCZB5fL3NDJ5K4EK9ulAA53eH/y
	 ZomfQMcqYwPsGXYkjiWNJgp6eh/WrF5cjIZiwX3oEBF/y1LNNLCjaqItQHCMm5fDhrmGt
	 1B+9OnDXrBtQo6TUarc9vzsoxLzdIePwUHspMCE9IUgnAV/2CtfzjYtSJtjJvj31cDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018427;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zrnXTK53OXXWzzbm7OM7SJBtBm4KDJ4lpnFIBSlde30=;
	b=Lv6vWacE0DamUJWeBmrrPtyZzrEholmWqNacSD5tKko2zDfRkEyJXTvFwPCuRtyAhL9I
	 xpIwEFj/kcNyGH599QucVTiy9AMOC2vrt/j+BpbqVYzXpjrOjGaZBtew/urAevkp9zdQe
	 IXaYvJvKtsRF9mU62L8UrZLjHvEg3YvLOCLNz7FSbMXSnmKIqkgQk8rzJw1b0FB5nNRyj
	 xgsdSAfR/UgA3FblGNO6QJMVwxjPFJbM9RwpKl+7NoMAjKTsLFnqiMj2+qdRMS9dCjIog
	 pyyVefT2+T+OzSatVwCDqbUwtRR9gpM0Wmprhv9wcSsqzW4fKMkfWdk6fwQX+8zIhmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hicqi1Hs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF73606A327;
	Mon, 26 Oct 2026 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hicqi1Hs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7B61F01825;
	Mon, 26 Oct 2026 12:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793018427;
	bh=zrnXTK53OXXWzzbm7OM7SJBtBm4KDJ4lpnFIBSlde30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hicqi1HsKP+dqQJI10BYrVjKMumMla6nqCDnVSlTlKdUZwZ1mU03DmWxuG9SE8/UA
	 zHAR8tIT4AnJABcqdJUlASBAkWkhjZ4klJvpNpjMFmWASOendLJ9lt9dpHVLi2XgsN
	 hH9GW5ENMKCHk2+nAidqUQoSB76CQ/rTGp+3R3v3ouDtNvmeFeTf+WDqAppPVbnkzB
	 /DQ0agTeabsnkA/SjE/Nblj4RlDkC7cm4L6iU49v8PUjwh58tZQhXYLbWpfPDILqx2
	 UFV0YUkI9lwFVCYqx355Dg6qq9BYY+LJNAZbRbHj/O9JlKt7ac67d0p+WMwXRKAU9n
	 zhDwiKjyI+brw==
Date: Mon, 26 Oct 2026 13:40:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael McAllister <me@michaelmcallister.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: msm: sm6115-mdss: Add missing
 AHB clock
Message-ID: <20261026-beneficial-aquamarine-kestrel-f16e2a@quoll>
References: <cover.1792852079.git.me@michaelmcallister.org>
 <5326d23102e89b492767862fc7ae027f3eec2205.1792852079.git.me@michaelmcallister.org>
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
In-Reply-To: <5326d23102e89b492767862fc7ae027f3eec2205.1792852079.git.me@michaelmcallister.org>

On Sat, Oct 24, 2026 at 03:27:59PM +0100, Michael McAllister wrote:
> MDSS register access requires the AHB clock supplied by DISPCC, in
> addition to the GCC bus clocks and the MDP core clock already listed.
> The DPU child also uses this clock, but MDSS needs it before the child
> resumes so that it can access its own registers.
> 
> Add the missing clock to the end of the list and update the example.
> Keep the existing three-clock descriptions valid for compatibility with
> older device trees.
> 
> Fixes: b93bdff44a85 ("dt-bindings: display/msm: add support for SM6115")
> 

Drop the blank line between tags.

> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml    | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

