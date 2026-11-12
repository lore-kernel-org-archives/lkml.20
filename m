Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481930;
	b=MsWax2yoNUntWZX7VHX6hKF0vY/USy0f/eUCXOnRf3w1uMxbdpaqqpwrou6myWmGn9TN
	 YyToxiocnP4Mck/IW7iE6oCSQoPzwf2N1Zis1aTJLZgq2HGTXuDPe0G1oXkq0UnVJgCuB
	 prkX2s4ABwsVvLP0ReoT7CyQ+f8u9t5EF05y3zDIBX+90cj07wTzlkZzOAe5rED1sQd15
	 dcASomt7zb6J68hEdfg6M5SzT0cZoRZ7psR0qIE5wivJwthP5FFPFaLQpi/yALA7TqL0E
	 Thf4w3cj9vNG9gcEpPYTUY5vrJixiW8OlUn1zRHbYAirqb0UKlf9sKZ3Tp0Efnmx9xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481930;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5gcFLFOOc3M6G3iV05BDCjmeiT0hNCjXENI5/wHr0cU=;
	b=iKwIibhjvIt1+5C7HMyqjDci9T6hoTbmW6ppFK/NHEPn9J31adeTzN8G2DDmHdVr2ET+
	 4MkvWVliKUxjY0udvedKw5Jn5rflyOG+KJLd5zz5MoMp2eKa+38v0gL2fi/JCZb3GjLVn
	 SIROnMPheteEZRg9yEYkVHylza9QoHx0sdRKrQm+Okk+l1E7hf46qy2saGkGQL9I2XavE
	 hPCBeJehZDZb+tR+LtKD5XvSBPjrTWnPBjb9BtG/ocfWa5zpwVBFOepUWf9KzOH3DZTGw
	 QBgaOPpRnImVI28LCOj6PvdpKDYAcxLtKUOuAcb3/J1EZ30t0AgH4vhUkImyMuDevZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ff21BiKV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D841606A321;
	Thu, 12 Nov 2026 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ff21BiKV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246431F00A05;
	Thu, 12 Nov 2026 11:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481930;
	bh=5gcFLFOOc3M6G3iV05BDCjmeiT0hNCjXENI5/wHr0cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ff21BiKVa91jTFoi8ychwjJauN3eF1PoeEn0UuAJrEVa7+GYQ3+tcfu8iu3BtDMvt
	 /9uPNcS8CjNz8QJNJm0UTpmwT8ZJy17HqtSr2HmKNNyZ9PRyw1gIDCIKI4bVQPzO3w
	 gQjAqEHWYVD2z8aTjbWXP0HxPDfnBvJenuL35Cg3rk23uIawkFcCvbjvGBlA1cuzr2
	 A4/RpL/qeoUhVgd7No1MSsYYu074n6aG81Z1z0eQIIs66dfloZGBCKML0zxPOjRzpG
	 dO+L8fWKA0YiBtCgdo5KGyjmW/l0v68+rDVM9KJc65mcsMkMHoRg97ml9efRU+Hnyx
	 rhnySk6BzoNCw==
Date: Thu, 12 Nov 2026 12:12:06 +0100
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
	Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: display/msm: dp-controller: Add
 SM7250
Message-ID: <20261112-zealous-sparkling-parrot-0e4d3c@quoll>
References: <20261112-dpu-sm7250-v2-0-8e925a3a8a7d@brar.si>
 <20261112-dpu-sm7250-v2-3-8e925a3a8a7d@brar.si>
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
In-Reply-To: <20261112-dpu-sm7250-v2-3-8e925a3a8a7d@brar.si>

On Thu, Nov 12, 2026 at 10:06:31AM +0530, Ishu Brar wrote:
> The SM7250 has a single DisplayPort controller, the same as the one on
> SM8250, so add its compatible with the qcom,sm8350-dp fallback.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

