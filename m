Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792789771;
	b=s79f6wPBtoP2ZTjU+I/b080nQTLo2rxMpepISnI3wjmX7wJX2ckbPCFI53YV0nok9mF9
	 BdfKoj+K43KQ03JhGdMx3u11ljWW7WRDG125HsNcacrH2AqdqyQlEQWJSViwjhto16ZJu
	 DgcF1Y8km7oUUvI7/nG2Lb3gyACdx7NoG1j3Ya873kA9dMnhbIMmPcsR1VfJDm2iMzvU4
	 hOPxx08sWU9p+VdviVaZhcBF/IUjlZHOhPsMyKLq8uvYgu3tNTZbTvvxM1Vz4QoCYKLLQ
	 Qyu773sKVT0/BkdmNBEi3dHx+KX8kLpu9+fCKB4iguIK3TlPf3edVgLkD9ZfHS7kJ2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792789771;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fS/pPTQHJuueEinFzIzT1Dd4kSXtnBmxPEmCZ9VXz+U=;
	b=R5c0hm35xCJ8TsLFUuJS3b3C7cG+Dg09GHQU24fQnj3uow69QPNu8tCYBfl8O0i/bH+w
	 FJPMkrkGN2G1RIQDXCPgf4iAQ00oGBfVb70UriHK6R4G8//5jNkJxEUSVeAZueUPZbx4B
	 FeT9+wXRgLgyofes9LlnWKrDLBca08tVzDPOj8G6ZbaOhnqthxH+SyWQ7SUSVR6lO0THn
	 YiiRbMSdsCxxdmc0+ZSXojt56zk3EtfDr30RlFQzOnfCwBvxI+77das6jg0kQ3rIZ7hh4
	 5xn6SFnrL7dnaEQzpI2PwFLQ9nJDOUAIB3F67ulVlsb3EpGBTYj3ACn18Kdw7dS4a6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="io/0S5TW";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9969E606A31A;
	Fri, 23 Oct 2026 21:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=io/0S5TW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE00C1F01825;
	Fri, 23 Oct 2026 21:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792789770;
	bh=fS/pPTQHJuueEinFzIzT1Dd4kSXtnBmxPEmCZ9VXz+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=io/0S5TWf9ihwG2cDTXygBCxMICgD6333oWFamc8RD/aL5EUH4etZEiIEm6Awspfr
	 +pIlwdPM91Sbges4mT16sJGL+ve8h8vbfIRoUxC2+ZUp2mx1z69AIk4GNC+C9jmP1X
	 1OkaOmNqzDRacwKMo48ChuE12bGXq8ECO/YsK2B98JWupwnKPeJh44PSEO1SAb1xIm
	 l44W4O5QVbRQgootmmUzBnOJ8ETjvj2U9kfUsFPeuM3Y9wZgG4HzbAMSc33ZL8vOKu
	 AzIrtlWYROLNPp0pJhqMEoZu358reRB3IhVpvQtdXrM97Ft49dMUdSGgEL1MUL5eiZ
	 owZNgUqWoiMZA==
Date: Fri, 23 Oct 2026 16:09:26 -0500
From: Rob Herring <robh@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: display: msm: Document Adreno 620
 and its GMU
Message-ID: <20261023210926.GA6026-robh@kernel.org>
References: <20261023-adreno-a620-v3-0-2d1d566e5e13@brar.si>
 <20261023-adreno-a620-v3-1-2d1d566e5e13@brar.si>
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
In-Reply-To: <20261023-adreno-a620-v3-1-2d1d566e5e13@brar.si>

On Fri, Oct 23, 2026 at 03:23:31PM +0530, Ishu Brar wrote:
> Add the Adreno 620 found in the Qualcomm SM7250 and its GMU. The GMU
> has the same registers, clocks, interrupts and power domains as the
> 650.2 one. As on the other A6xx parts, the GPU clocks are defined in
> the GMU node, so the GPU node has none.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>

Missing Krzysztof's Reviewed-by.

Rob
