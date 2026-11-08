Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169396;
	b=Pjeyz9Jf4HvP4u2BJ6DoveMcArXeM8pO1C9UC/yFoEyjKlRLlHyc30EiyogiIGVqDRfz
	 a6/ZJRLbVTnbg9wkUOF5Me2zvWlVFFkgiIXoXGavYBPUkPwHA1Nr0/QBsK91/yJM5j/Ft
	 FVyjrdJMXffCLEF8XO8Nu4FV8ewu7/yWQaWm40d28oTLnJSl+cW9ADePIgr+zfIQtlQEZ
	 eGeFA3T2j6Nn4f7yy5F+MG2jdnr0fksfVcnqCarMiksV/7fliAquiP6ZWAKQn1s+aNpRD
	 w3p/S30bvvfxWy0jCskgRei8iBk4MI0jGOy6oet6KqP6gWB7zLYYF8RFhEOlDPhjkKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169396;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=C3G54qPUdWsfUVdnYpgT2BJNeeG8r6sZuERbj33Mns8=;
	b=qFNRJchuSjuZKgcYJEx5cq36vylyH0bGaYxVm2BgDSuXAn9j3B/Mb+fRHYZekckpFvl1
	 FrTTcXwH2D/U1oVUSoDn2+qJxNl5UOIn1iMP3jnvd0AwzYnGf6SUkH8SCnKrsZ52+nYC3
	 Q8CE08dNQCl+ZxVnj2NWZFzCsOlCLEQ6amVXDBrRSO3FE4IzlYfXGA10onZfH9N3hFfYs
	 TCqfxb9qQS9y+CUwnK6UHqRa34gNQWtoDgIrx1ZhwyPc13okQjFRrsXWXI4O8P00sa0pU
	 NTtfi2nI3lrNdDDSqTNgAQzA8QlDQ1Tcus0SjrnuDpUw7ws4sS/LvQsGcNEw2xqTMRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rlbzfylg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF7A606F8F2;
	Sun,  8 Nov 2026 20:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rlbzfylg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35FB1F008BC;
	Sun,  8 Nov 2026 20:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169396;
	bh=C3G54qPUdWsfUVdnYpgT2BJNeeG8r6sZuERbj33Mns8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RlbzfylgCBJmWb1si8RdOfj9Eeutq791Y5q62I7Y1KDz8ohwLvedT03M81adUX1Fn
	 /1S0yy+bA8UPVW7WJXdkBOwLHWclBOxjWJCpv+L09YmgzKy0r1uswvAfx2d46xaAa0
	 0aP9Ph13C33L2yUZBo+4mTtWqtO+xEfgJKI8ox6tCVmllqGj11qqYh7epTyxhtQLaj
	 eqmYLENRI9zSTnYmxd1YhsErgvzQGYaNwj85bXemMKNJf6F+5sjNXWvvGeABgthS7Y
	 6d4femgPKQ19qBj/tiXcINFLN9AEW+UgkBjNisRY2ouw8JkQC0gu9/jCMTWfE4FpuG
	 RF2N81KThyEcw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com
Subject: Re: [PATCH v1 0/4] arm64: dts: qcom: Make ADSP remote heaps no-map
Date: Sun,  8 Nov 2026 14:20:03 -0600
Message-ID: <179416929386.628393.17504471435913051235.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 15 Oct 2026 15:15:07 +0800, Jianping Li wrote:
> Several Qualcomm platforms declare the ADSP remote heap as a reusable
> shared DMA pool. This allows the kernel to reuse the region for movable
> allocations.
> 
> When FastRPC assigns the entire region to the DSP without first
> allocating its pages from CMA, those pages remain available for HLOS
> allocations despite HLOS access permissions having been revoked.
> Subsequent kernel accesses can therefore cause synchronous external
> aborts.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: kodiak: Make the ADSP remote heap no-map
      commit: 0848803d3508bcc5ebce717e049e3b0066059037
[2/4] arm64: dts: qcom: glymur: Make the ADSP remote heap no-map
      commit: bcd702e52ae0a480b3f24f8838aedb1ee1ec25cb
[3/4] arm64: dts: qcom: sm8250: Make the ADSP remote heap no-map
      commit: c5e78d1c30a53ca7130223c2c742c8840a8c9970
[4/4] arm64: dts: qcom: sm8750: Make the ADSP remote heap no-map
      commit: 730aae8cf388064ea5ff8df5293019f53a7422dc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
