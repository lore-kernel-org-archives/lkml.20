Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418068;
	b=m5FiRweQB0vPJ21LsHg/Zw9NEdP3/P5PD1nGtIARI0accNyFezSbvAtVg0n4R/RdchmX
	 4rvHQ/4jJauMnXJP7wZRjQa/MQIjbQMXffUSCun8Aowt2RqZEAaxRfSw7JmryDEZh7B0Q
	 zBebYNBwn/OXf90Xu6qIejR+KRa/893FWGHAEW+nUHko4WgQ7gXEdk5uIkZ5DIkdLj9up
	 3O4UK4iv856GJ+qbJsELsrIuu/M/8qHlq5QGCSiZy1hNdhlq78SoBJgjlJ7SEoHbI4JME
	 2MHw3mYrVs0PL8BwxYt671Jrdfd5YXeup3xkVtIAgXeGx1KZbsis1OFJQzTugSwUOWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418068;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UKDVE9TLs7/zbZ30VM6Th9gaEU7UkVx8isyzwkCr8x4=;
	b=F1AFhPXO5pXKd4ekKG0Wdmn/eUFCp4o2Dd/oTpyiW+4jppyIj9KD5t8EEObqz5rgjGYl
	 odcEoSS1UiYXznXiidg1F2jHLXKE7lkw4lQf/73PtOAekWAK+Um9Uk6/3ZKzvAhZk9b10
	 DRcUVVNfTl083bNGok3xZ208ElmGY/MXOvLLclc468W5BpuarSovVcbFwunAagnUz4ocZ
	 4DaKS0nxfj6ezfgZ3zxqPWHhvXbhcCT1V7055gu+xOarPhp3bFg7AMjNqYHyLgsbRKhYn
	 pNQZU42JWp4+sA5Ys+ppOrIOrq1/MtOPpaPijPpF1jvJpoSjf3k62pzdEsDqpwpjIVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSbkD8Ef;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7352606A327;
	Wed, 11 Nov 2026 17:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSbkD8Ef
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D56F1F00A05;
	Wed, 11 Nov 2026 17:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418068;
	bh=UKDVE9TLs7/zbZ30VM6Th9gaEU7UkVx8isyzwkCr8x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kSbkD8EfoKGJqcP7C+w4qDgcT6TDVLfY0vH9Uor/GjV8Qnj8Xkwk0ymMBqgw2JoLt
	 1/2kaWfH4Nr1IRboHJp0/ASIU2F2IggYskrRsiaYrXta15f5em2qKOyfyEfDl/JXd/
	 GiSu1Ar6MmmlTQFqpUpE0eExmoIAJssb0S4vmieoy1WXVNxgxhAHv4DkRQkcBJ43UP
	 5YmyoElS4yRWXVrDW9ggdA837qYYdR5LL9WEWcprrQ8EmM4gbGW4wrEx+Ac/rzpD4r
	 2ZpHFIkIMbL9RD2jajF8Bvm1CwF6+UyFiygukfyFWg7LokVgp9UOnLRysUKMxxKz72
	 2hsDczFzlZ7kQ==
Date: Wed, 11 Nov 2026 11:27:46 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	freedreno@lists.freedesktop.org,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,sa8775p-mdss: Remove
 bouncing Mahadevan
Message-ID: <179441806600.72167.8413609787157851282.robh@kernel.org>
References: <20261110130255.134252-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261110130255.134252-2-krzysztof.kozlowski@oss.qualcomm.com>


On Tue, 10 Nov 2026 14:02:56 +0100, Krzysztof Kozlowski wrote:
> Emails to Mahadevan bounce permanently (error 550), so change the
> maintainer to DRM MSM maintainers (Dmitry Baryshkov and Rob Clark).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml     | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

