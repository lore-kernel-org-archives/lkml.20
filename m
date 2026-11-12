Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488029;
	b=Mt4wLo5zui+6rCXhMG3KAQQMksXDe4MpIgzdhAD1ZO5xmlMXa6A2W5vCOvPwq08Ow0xA
	 rV3y36LQhMUYLCfKklVOr6wE1XAhCOv/eaOZBM2nmWtZENzr4L9KoCpmBJGCgS81KeaWy
	 zJf+PnB0wp2NvTPPq0porzmhyfdfsjGKtrBUJIV2gSZyMa2xOA0uJge57D4QG4YpeA8tV
	 fdLe9bhWSxvEnUlKgJKY0Mkd+/14bR6TK+zh9eQB5uo8QzLoiwK5zziq+P4DPi4hp8hJ7
	 cYvMIkHg9eJMfq47Z67XngerLVNByEL6Ow+xKv+UeR0YV/SeBcshzSSDmm3qR+zqZ0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488029;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2SfI1Ism+5ilI2yQhrJEphs77J0IHLC7svD8evqdJ+c=;
	b=Y6JFsHH8+LjtMdOesf3JKVjlpvTzNQUT1Hy25YJwiZQUM/N8nAjLSXDxhSrt5Edd4ac5
	 CijKoOH57zKMeK4LigTtRAwgQ3VLK/2O6hs/OxTb/Goc83fa+tQMe1KmKdtgGC84kdfaA
	 Y/BmeLtwpVkJKBxYKPUXRtHNkBQ7zRYwTi3NLPq0NvxasbJM+Z5kyXqGIWcPEcaA60VTw
	 /6nH2OV9OXdAA40jecDyYzV0iLuFPMr/P86AVstpUn7XR//4w3DekdMUbDpHpLKwh7Gq7
	 YH8tS+YucSJiH9ldOyaGhQtzJdmda2elqhiCM6xwJ526Bwzq9+8TeLZakCOGF2PeH3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eZxqeL4J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6060C606A31C;
	Thu, 12 Nov 2026 12:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eZxqeL4J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E311F00A05;
	Thu, 12 Nov 2026 12:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794488028;
	bh=2SfI1Ism+5ilI2yQhrJEphs77J0IHLC7svD8evqdJ+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eZxqeL4JRZct0SGU6JGFkA7wIy5CX6amIYnbY7wk2/pQhUkZZ0URZ/ajj+ks6uW+m
	 Vc0UICK9M4JGuQANKuekkGWjGw/Y1lLfUV0DIL6/7rMMczGwZcioHRENshAOk83XlT
	 qhc2R5eGXa2ZPEdBagY27MDxRPpBbqZknCs/FSfHuemJFvmM7LQ66kMUAJBw8w6kFa
	 Tfd+rrc27i2NRJfnIrkYLNVUeYhejIXCKUuFqQdnMLo7DmjftabuZZyMffPFVI2AYA
	 NUJvduI6tPwBhx3AZVPlnAnxSc1Hi5wg8Wr1dpMQw0KTZIt8A8we5s4Wx2BQeVOCJx
	 LMcNKV/PrCXhw==
Date: Thu, 12 Nov 2026 06:53:46 -0600
From: Rob Herring <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: qcom: Relax required supplies
Message-ID: <20261112125346.GA3821108-robh@kernel.org>
References: <20261021022446.3619435-1-robh@kernel.org>
 <avWbmsjkYo2LMJKs@parshuram>
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
In-Reply-To: <avWbmsjkYo2LMJKs@parshuram>

+Konrad

On Thu, Nov 12, 2026 at 04:27:30PM +0530, Vinod Koul wrote:
> On 20-10-26, 21:24, Rob Herring (Arm) wrote:
> > For the QUSB2 PHY binding, keep the three regulator supplies required
> > except for legacy IPQ6018 nodes that do not describe the board rails.
> > 
> > This relaxes the requirements for the IPQ5210 as well as if it is
> > compatible with IPQ6018, then it shouldn't have more required
> > properties either.
> 
> Hey Rob,
> 
> This fails for phy/next I see vdd-supply has been moved around..

The change in question[1] should not be applied until the .dts changes 
in the series are applied. It introduces a bunch of warnings. Can the
QCom folks stop doing that! Coordinate applying the series or take 
the binding and dts changes in 1 tree. Given the patch series is 2+ 
months old, I'd be surprised if the rest gets applied.

This patch OTOH fixes warnings.

Rob


[1] https://lore.kernel.org/all/qusb2phy-v2-1-4c3f980a4560@oss.qualcomm.com
